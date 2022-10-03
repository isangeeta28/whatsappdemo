import 'package:flutter/material.dart';

import 'views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:  Color(0xe40e645a),
        accentColor:  Color(0xdf26736a),
      ),
      home: HomeScreen(),
    );
  }
}

