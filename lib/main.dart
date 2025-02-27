import 'package:flutter/material.dart';
import 'package:login/constants.dart';
import 'package:login/login_screen.dart';

void main() {
  runApp((IntailScreen()));
}

class IntailScreen extends StatelessWidget {
  const IntailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      title: appName,
    );
  }
}
