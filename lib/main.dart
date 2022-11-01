import 'package:flutter/material.dart';
import 'package:flutter_appquizvtv_406394402/views/addquestion.dart';
import 'package:flutter_appquizvtv_406394402/views/create_quiz.dart';
import 'package:flutter_appquizvtv_406394402/views/signin.dart';
import 'package:flutter_appquizvtv_406394402/views/signup.dart';

void main() {
  runApp(QuizVTVApp());
}

class QuizVTVApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Flutter',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AddQuestion(),
    );
  }
}
