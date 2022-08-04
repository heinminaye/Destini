import 'package:flutter/material.dart';
import 'story_List.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StoryList list = StoryList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.cover)),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 100),
          child: Text(
            list.getTitle(),
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            customButton(
              answer: () {
                setState(() {
                  list.nextStory(1);
                });
              },
              chooseText: list.getChoice1(),
            ),
            customButton(
              answer: () {
                setState(() {
                  list.nextStory(2);
                });
              },
              chooseText: list.getChoice2(),
            ),
          ],
        )
      ]),
    ));
  }
}

class customButton extends StatelessWidget {
  var chooseText;
  Function answer;
  customButton({Key? key, this.chooseText, required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Container(
          height: 70,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              return answer();
            },
            child: Text(
              chooseText,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ));
  }
}
