import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_douban/utils/screen_utils.dart';
import 'package:flutter_douban/constants//ResourceConstant.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SplashWidge();
  }
}

class SplashWidge extends State<SplashPage> {
  Timer countTime;
  int countDownNumber = 5;

  @override
  void initState() {
    countDownTextFun();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          Align(
            alignment: Alignment(1.0, 0.0),
            child: Container(
              margin: const EdgeInsets.only(right: 30.0, top: 40.0),
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
              child: Text(countDownNumber.toString()),
              decoration: BoxDecoration(
                  color: Color(0xffEDEDED),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            ),
          ),
          new Container(
            padding: new EdgeInsets.all(0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: ScreenUtils.screenW(context) / 3,
                  backgroundColor: Colors.white,
                  backgroundImage:
                  AssetImage(ResourceConstant.ASSETS_IMG + 'home.png'),
                ),
                Text("落花有意，流水无心恋落花"),
              ],

            ),

          ),

        ],
      ),
      //body: new Center(child: Text(countDownNumber.toString())));
    );
  }

  void countDownTextFun() {
    countTime = new Timer.periodic(new Duration(seconds: 1), (timer) {
      print(countDownNumber.toString());
      if (countDownNumber <= 0) {
        if (countTime != null) {
          countTime.cancel();
          countTime = null;
        }
      } else {
        setState(() {
          countDownNumber--;
        });
      }
    });
  }
}
