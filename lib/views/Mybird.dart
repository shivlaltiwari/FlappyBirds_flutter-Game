import 'package:flutter/material.dart';

class MyBirds extends StatelessWidget {
  const MyBirds({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: Image.asset(
        'Assets/images/birds.png',
        height: 30,
        width: 30,
      ),
    );
  }
}