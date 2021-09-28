import 'dart:async';

import 'package:dino/views/Mybird.dart';
import 'package:dino/views/barrier.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double birdYaxisMove = 0;
  late double initialHeight = birdYaxisMove;
  double time = 0;
  double height = 0;
  bool isTapping = false;
  static double barrierXone=1;
  double barrierXtwo= barrierXone + 1.5;
  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxisMove;
    });
  }

  void startGame() {
    isTapping = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      //initialHeight = birdYaxisMove;
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYaxisMove = initialHeight - height;
        barrierXone -= 0.1;
        barrierXtwo -=0.1;
      });
      setState(() {
        if (barrierXone <-2.2){
        barrierXone +=2.5;
      }else{
        barrierXone -=0.5;
      }
      });
      setState(() {
        if (barrierXtwo <-2.2){
        barrierXtwo +=2.5;
      }else{
        barrierXtwo -=0.5;
      }
      });
      if (birdYaxisMove > 1) {
        timer.cancel();
        isTapping = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isTapping == true ? jump : startGame,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      alignment: Alignment(0, birdYaxisMove),
                      duration: Duration(milliseconds: 0),
                      //width: double.infinity,
                      color: Colors.blue,
                      child: MyBirds(),
                    ),
                    Container(
                      alignment: Alignment(0, -0.2),
                      child: isTapping?Text(""): Text("T A P  T O  P L A Y", style: TextStyle(color: Colors.green,fontSize: 25),),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(barrierXone, 1.1),
                      child: MyBarrier(size: 200.0,)),
                      AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(barrierXone, -1.1),
                      child: MyBarrier(size: 200.0,)),
                      AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(barrierXtwo, 1.1),
                      child: MyBarrier(size: 150.0,)),
                      AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(barrierXtwo, -1.1),
                      child: MyBarrier(size: 250.0,)),
                  ],
                )),
            Container(
              height: 10,
              color: Colors.green,
            ),
            Expanded(
                child: Container(
              color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Score",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "0",
                          style: TextStyle(fontSize: 35),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Best",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "0",
                          style: TextStyle(fontSize: 35),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
