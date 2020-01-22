import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Greetings Box'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color bgColor;
  Color buttonColor;
  Color buttonTextColor;

  @override
  void initState() {
    updateColors();
    super.initState();
  }


  void updateColors() {
    setState(() {
      var random = Random();
      bgColor = Color.fromARGB(random.nextInt(255), random.nextInt(255), random.nextInt(255), random.nextInt(255));
      if(bgColor.alpha + bgColor.red + bgColor.green + bgColor.blue > 255 * 2) {
        buttonColor = Colors.black;
        buttonTextColor = Colors.white;
      } else {
        buttonColor = Colors.white;
        buttonTextColor = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: bgColor,
      body: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          child:FlatButton(
              onPressed: updateColors, 
              child: Text("Change Color"),
              color: buttonColor,
              textColor: buttonTextColor,
              padding: EdgeInsets.all(8),
            ),
        ),
      ),
    );
  }
}
