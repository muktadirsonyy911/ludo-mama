import 'dart:math';

import 'package:flutter/material.dart';
import 'package:secure_random/secure_random.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LudoMama(),
    );
  }
}

class LudoMama extends StatefulWidget {
  @override
  _LudoMamaState createState() => _LudoMamaState();
}

class _LudoMamaState extends State<LudoMama> {
  int _count = 0;
  int _index=0;
  int _index1=0;
  int total=0;
  List<String> _listImages = [
    "images/1.png",
    "images/2.png",
    "images/3.png",
    "images/4.png",
    "images/5.png",
    "images/6.png",
  ];
  getPitures()
  {
    setState(() {
      var rdm=SecureRandom();

      _index=rdm.nextInt(max: 5);

       _index1=rdm.nextInt(max: 5);
      total+=(_index+_index1)+2;


    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Ludo Mama"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            "Highest Score:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            "Current Score:"+total.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          SizedBox(
            height: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                child: Image.asset(_listImages[_index]),
                height: 150,
                width: 150,
                color: Colors.black,
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                child: Image.asset(_listImages[_index1]),
                height: 150,
                width: 150,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(
            height: 150,
          ),
          RaisedButton(child: Text("Start"), onPressed: () {getPitures();}),
          RaisedButton(child: Text("Ready"), onPressed:null)
        ],
      ),
    ));
  }
}
