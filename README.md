Local Encryption & Decryption App in Flutter – A Beginner’s Guide

Objective

This project uses Flutter, a UI toolkit for building apps that work on different platforms with the Dart programming language. Flutter was chosen because it enables one codebase to operate on multiple platforms, including Windows, Android, Web, and iOS.

The goal is to create a **local encryption and decryption application that lets the user:
- Enter plain text
- Encrypt the message on the device
- Decrypt the encrypted message back to its original form

By the end of this project, a beginner should be able to:
- Set up Flutter on their computer
- Understand basic encryption concepts
- Run a secure local Flutter application that can encrypt and decrypt messages

Google's open-source framework Flutter is a top choice, when building cross-platform applications. Using the Dart language, Flutter lets developers create fast, natively compiled, and visually stunning mobile, desktop and web applications from a single codebase, and its applications can run on Android, iOS, Windows, Linux, macOS, web applications and even embedded systems UI. 

Coming from real world examples, Google Pay, Alibaba, BMW App, and eBay Motors are all popular applications that have been built with Flutter.


System Requirements

MacOS or Linux, when developing and running the Local Encryption & Decryption App in Flutter you'll need Windows 10 or newer. 

This project was specifically implemented and tested on Windows, and for it to run smoothly you'll need the Flutter SDK, Git, Visual Studio Code, Android Studio, Google Chrome/Microsoft Edge, Dart, the encrypt package and the default Flutter package. 

Coming hotfooting into this project without these won't be very pleasant. 

Dart is the language used in the app, and the encrypt and flutter packages are the ones used for encryption and decryption. 

You'll also need at least 8 GB of RAM, 10 GB of free disk space and a stable internet connection to set up and install the packages.

Installation & Setup Instructions

Step 1: Install Git for Windows

Git is necessary for version control and for connecting your project to GitHub.

For you to download Git visit the official website:
   https://git-scm.com
   
Run the installer and use the default recommended settings.

When asked to select a default editor, choose:
    Visual Studio Code

Complete the Installation.

Run the following command to verify installation:
   git --version

Step 2: Install Flutter SDK

Download Flutter SDK from:
   https://flutter.dev/

Download the Windows ZIP file.

Extract the ZIP file to:
   C:\src\flutter

Then add it to the system PATH:
   Open Environment Variables
   Under System Variables, find Path
   Click Edit > New
   Add: C:\src\flutter\bin

Restart VS Code or the computer.

Verify installation using the command
   flutter --version

Step 3: Install Visual Studio Code

Download VS Code from:
   https://code.visualstudio.com/

Install using default settings.

Open VS Code and install these extensions:
   Flutter
   Dart

Step 4: Install Android Studio & Android SDK

This project can run on Windows and Web however Android SDK is required for full Flutter functionality.

   Download Android Studio from:
      https://developer.android.com/studio

  During installation, ensure the following are checked:
     Android SDK
     Android SDK Platform Tools
     Android Emulator

  Complete the installation


Step 5: Verify Setup Using Flutter Doctor

Run
   flutter doctor

All items should show green check marks.

Encountered issues:
   "Unable to locate Android SDK"
   "Android SDK tools disabled due to invalid path"
   "Google Play Intel x86_64 Atom System Image not installed"

These were resolved by:
   Reinstalling Android Studio
   Correcting the SDK installation Path
   Re-enabling SDK tools from Android Studio 

Step 6: Create the Flutter Project

Run
   flutter create local_encryption_app
   cd local_encryption_app

Step 7: Install Required Encryption Package

Go to the pubspec.yaml file

Under dependencies add:
   encrypt: ^5.0.0

Run 
   flutter pub get

At this point, Flutter, Git, Android SDK, and all required dependencies are fully installed and ready to use.


Minimal Working Example

Description

Below is a minimal working example demonstrating a local text encryption and decryption application built using Flutter.

The application allows the user to:
   Enter plain text
   Encrypt the text using AES encryption
   Decrypt the encrypted text baxk to its original form.

All encryption and decryption operations are performed on the device itself which makes the app suitable to learn how to handle data securely.


Main Application Code (lib/main.dart)

dart

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

Explanation of Key Parts

   TextEditingController is used to capture user input.
   encrypt.Key.fromUtf8() creates a 16-character AES key.
   encrypt.IV.fromLength(16) creates the initialization vector.
   The Encrypt button converts the plain text into encrypted Base64 format.
   The Decrypt button restores the original text.
   The Flutter UI is built using MaterialApp, Scaffold, TextField, and ElevatedButton.

How to run

Run
   flutter pub get
   flutter run

Then choose:

   Windows (for desktop testing)
   Chrome / Edge (for web testing)
   Android emulator (optional)

Expected Output

   A text input field appears.
   
   User enters text such as:
      Hello Flutter
      
  Clicking Encrypt displays encrypted Base64 text.

  Clicking Decrypt restores the original input:
     Hello Flutter

  Prompt Journal

This section documents how generative AI was used throughout the project in learning Flutter, solving errors, and successfully implementing a local encryption and decryption application.



Prompt 1: Choosing a Cybersecurity-Oriented Technology

Prompt Used:

Give me some beginner-friendly technologies that lean towards cybersecurity, which I can use to do a toolkit project.

AI Response Summary:

Some of the technologies it suggested included encryption tools, cybersecurity APIs, network security tools, and mobile security-related frameworks.

Evaluation:

This prompt helped narrow down the project focus to encryption and cybersecurity, which aligned well with my academic interests.



Prompt 2: Choosing Flutter for the Encryption App

Prompt Used:

"I have decided to build a local encryption/decryption application. Which framework should I use?

AI Response Summary:

The AI recommended Flutter, as it has cross-platform features and can build secure user interfaces more easily.

Evaluation:

This prompt was of great help because it validated that this is an appropriate fit for projects relating to cybersecurity.

Unit costs are arrived at by two methods, actual and average, depending on the basis of selecting costs. Actual unit cost - the actual cost per unit produced in a given period is determined by using the actual cost of direct material, labor, and overhead applied during that period. Average unit cost - the average cost of units produced during more than one period is determined by averaging the actual unit cost for those periods.



Prompt 3: Setting Up Flutter on Windows

Prompt Used:

"Give me a step-by-step guide on how to install Flutter on Windows."

AI Response Summary:

The AI instructions were to download Flutter, extract it, set the environment variables, and then verify it using `flutter doctor`.

Evaluation:

This prompt greatly improved clarity during setup and helped avoid common beginner mistakes.



Prompt 4: Android SDK and Emulator error fixes

Prompt Used:

"My flutter doctor shows the Android SDK not installed. How do I fix this?

Summary by AI:

It explained how to install Android Studio, enable SDK tools, and correct SDK paths.

Evaluation:

This was one of the most important prompts because it fixed a blocker that prevented the app from running.

The World Tourism Organization defines it as "that type of tourism that takes account for the current and future economic, social, and environmental impacts in which it occurs in, with a view to balance these through sound planning and management."




Prompt 5: Develop the Flutter Encryption Application

Prompt Used:

"Create a simple Flutter app to encrypt and decrypt text locally based on AES encryption.

AI response summary:

AI created a simple Flutter app using the 'encrypt' package to explain the process of AES encryption.

Evaluation:

This prompt directly enabled the development of the core application logic.



Prompt 6: Resolving Encryption Package Import Errors

Prompt Used:

"My encrypt package import shows red error in Flutter. How can I fix it?

AI Response Summary:

AI explained correctly that `encrypt` dependency should be added in `pubspec.yaml` and after that, run the command `flutter pub get`.

Evaluation:

This prompt improved dependency issues a lot faster, saving me much debugging time.



Prompt 7: Debugging UI Showing Default Counter App

Prompt Used:

"My Flutter app still displays the default counter instead of the encryption UI. What might be wrong?"

AI Response Summary:
The AI explained that the `main.dart` file had not been fully replaced and guided on how to correctly insert custom code.

Evaluation:

This prompt helped load the encryption UI correctly and marked the first successful visual test.



Prompt 8: Testing the output of the encryption 

Prompt Used: 
"Sample text, for testing the encryption and decryption of data. 

Summary by AI: 

The AI provided simple test texts like "Hello Flutter" and "Cybersecurity is my future". 

Evaluation: 

This helped to ensure that the encryption and decryption are properly working as intended.



Prompt 9: Documenting the Project for GitHub 

Prompt Used: 

"Guide me on how to push my Flutter project to GitHub, step by step. 

Summary: 

It used the following Git commands: initializing the repo, adding a remote, committing, and pushing to GitHub. 

Evaluation:

This prompt made sure my project met the codebase submission requirement. 

Prompt 10: Organizing the Toolkit Document 

Prompt Used: "Help me structure my toolkit document based on the format guide." 

AI Response Summary: 

The AI helped generate the content of all sections, including objectives, setup, minimal example, and prompt reflections.

Evaluation: 

This prompt greatly enhanced the quality, structure, and professionalism of the final submission.



Overall Reflection on AI Usage Using AI throughout this project: 

   - Improved my speed of learning Flutter
   - Reduced debugging time.
   - Assistance in understanding encryption basics
   - Improved my confidence in documentation enabling me to complete a full working project related to cybersecurity as a complete beginner.
   - The AI acted as both a learning assistant and a technical trouble-shooting partner.

Common Issues & Fixes

This section documents the major challenges encountered during the project and how they were dealt with.


Issue 1: Flutter Not Recognized as a Command

Error Message:

'flutter' is not recognized as an internal or external command

Cause:

   Flutter was not added to the system PATH.

Solution:

   Opened Environment Variables
   Edited the System PATH
   Added:
      C:\src\flutter\bin
   Restarted VS Code and the computer
   


Issue 2: Android SDK Not Detected by Flutter

Error from flutter doctor:
   Unable to locate Android SDK

Cause:
Android Studio was either not fully installed or SDK path was incorrect.

Solution:

   Reinstalled Android Studio
   Enabled:
      Android SDK
      SDK Platform Tools
      Emulator
   Ensured SDK is not installed at the filesystem root
   Restarted system and re-ran:
      flutter doctor
      


Issue 3: Google Play Intel x86_64 Atom System Image Failed to Install

Error Message:
   Google Play Intel x86_64 Atom System Image could not be installed

Cause:
   Corrupted or blocked system image files.

Solution:
   Opened Android Studio
   Went to SDK Manager → SDK Tools
   Reinstalled the emulator packages properly
   Ensured correct SDK path configuration
   


Issue 4: Git Author Identity Unknown
Error Message:
   Author identity unknown

Cause:
   Git user name and email were not configured.

Solution:
   git config --global user.name "Your Name"
   git config --global user.email "your-email@example.com"
   


Issue 5: Git Remote Not Showing (git remote -v Empty)

Cause:
   GitHub remote repository was not properly linked.

Solution:
   git remote add origin https://github.com/username/repository-name.git
   git push -u origin master

   

Issue 6: Encryption Package Import Showing Red Error

Error in Code:
   import 'package:encrypt/encrypt.dart';

Cause:
   The encrypt package was not added to pubspec.yaml.

Solution:

Added:

dependencies:
  encrypt: ^5.0.0


Then ran:
   flutter pub get



Issue 7: Default Flutter Counter App Showing Instead of Encryption UI

Cause:
   The default main.dart file had not been fully replaced.

Solution:
   Replaced entire lib/main.dart file with the encryption app code and saved.



Issue 8: Flutter Pub Get Previously Causing Many Errors

Cause:
   Dependencies were missing or incorrectly configured.

Solution:
   Corrected pubspec.yaml and re-ran:
      flutter pub get



Issue 9: GitHub Authentication Failure

Cause:
   GitHub no longer supports password authentication over HTTPS.

Solution:
   Used a GitHub Personal Access Token (PAT) instead of a password during push.



Summary

Most errors encountered were due to:
   Missing configurations
   Incorrect setup paths
   Dependency issues
   All issues were successfully resolved using:
   Flutter Doctor
   Android Studio SDK Tools
   Git configuration commands
   Proper dependency installation
   These fixes helped strengthen practical troubleshooting skills during the project.


8. References

The following official documentation and learning resources were used throughout the project for setup, development, debugging, and understanding encryption concepts:



Flutter Documentation
   - Flutter Official Website  
  https://flutter.dev  

   - Flutter Installation Guide (Windows)  
  https://docs.flutter.dev/get-started/install  

   - Flutter Desktop & Web Support  
  https://docs.flutter.dev/platform-integration  



Dart Programming Language
   - Dart Official Documentation  
  https://dart.dev  



Encryption Package
   - Encrypt Package on Pub.dev  
  https://pub.dev/packages/encrypt  

   - AES Encryption Overview  
  https://en.wikipedia.org/wiki/Advanced_Encryption_Standard  


Android Studio & SDK
   - Android Studio Official Website  
  https://developer.android.com/studio  

   - Android SDK Manager Help  
  https://developer.android.com/studio/intro/update  



Git & GitHub
   - Git Official Documentation  
  https://git-scm.com/doc  

   - GitHub Documentation  
  https://docs.github.com  



UI & Flutter Widgets
   - Flutter Material Design Widgets  
  https://api.flutter.dev/flutter/material/material-library.html  



General Debugging & Community Help
   - Stack Overflow  
  https://stackoverflow.com  

   - Flutter Community Support  
  https://flutter.dev/community  



These resources provided authoritative guidance for:
   - Flutter setup and development
   - Encryption implementation
   - Android SDK configuration
   - GitHub version control
   - Debugging and troubleshooting























   
      
