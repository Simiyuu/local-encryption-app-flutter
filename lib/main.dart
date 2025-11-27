import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Encryption App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const EncryptionHome(),
    );
  }
}

class EncryptionHome extends StatefulWidget {
  const EncryptionHome({super.key});

  @override
  State<EncryptionHome> createState() => _EncryptionHomeState();
}

class _EncryptionHomeState extends State<EncryptionHome> {
  final TextEditingController _controller = TextEditingController();
  String encryptedText = '';
  String decryptedText = '';

  final encrypt.Key key = encrypt.Key.fromUtf8(
    '16characterslong',
  ); // exactly 16 chars
  final encrypt.IV iv = encrypt.IV.fromLength(16);

  late encrypt.Encrypter encrypter;

  @override
  void initState() {
    super.initState();
    encrypter = encrypt.Encrypter(encrypt.AES(key));
  }

  void encryptText() {
    final encrypted = encrypter.encrypt(_controller.text, iv: iv);
    setState(() {
      encryptedText = encrypted.base64;
    });
  }

  void decryptText() {
    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    setState(() {
      decryptedText = decrypted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Local Encryption App')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter text'),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: encryptText,
              child: const Text('Encrypt'),
            ),

            Text('Encrypted: $encryptedText'),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: decryptText,
              child: const Text('Decrypt'),
            ),

            Text('Decrypted: $decryptedText'),
          ],
        ),
      ),
    );
  }
}
