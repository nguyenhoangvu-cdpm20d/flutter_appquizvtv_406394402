// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_appquizvtv_406394402/views/create_quiz.dart';
import 'package:flutter_appquizvtv_406394402/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Stream quizStream;
  Widget quizList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: StreamBuilder(
        stream: quizStream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Container()
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: ((context, index) {
                    return QuizTitle(
                      imgUrl: snapshot.data.documents[index].data["quizImgurl"],
                      desc: snapshot.data.documents[index].data["quizDesc"],
                      title: snapshot.data.documents[index].data["quizTitle"],
                      quizid: snapshot.data.documents[index].data["quizId"],
                    );
                  }));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: quizList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateQuiz()));
        },
      ),
    );
  }
}

class QuizTitle extends StatelessWidget {
  late final String imgUrl;
  late final String title;
  late final String desc;
  late final String quizid;
  // ignore: use_key_in_widget_constructors
  QuizTitle(
      {required this.imgUrl,
      required this.title,
      required this.desc,
      required this.quizid});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.push(
        //context, MaterialPageRoute(builder: (context) => PlayQuiz(quizid)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        height: 150,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgUrl,
                width: MediaQuery.of(context).size.width - 48,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
