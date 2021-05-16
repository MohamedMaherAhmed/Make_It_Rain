import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MakeItRainState();
  }
}

class MakeItRainState extends State<MakeItRain> {
  int _moneyCounter = 0;
  bool _levelUp = false;

  _rainMoney() {
    //Important - setState is called each time we need to update the UI
    setState(() {
      _moneyCounter = _moneyCounter + 100;
      if(_moneyCounter >= 5000) {
        _levelUp = true;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Make It Rain"),
        backgroundColor: Colors.lightGreen,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            //title
            Padding(padding: EdgeInsets.only(top: 35)),
            new Center(
                child: new Text(
                  "Get Rich!",
                  style: new TextStyle( //this is to change color of text when it reaches 5k and beyond
                      color: _levelUp ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w400,
                      fontSize: 29.9,
                  ),
                )),


            new Expanded(
              child: new Center(
                //when you put a char after a backslash inside single quotes
                child: new Text('\$$_moneyCounter', //it tells the ide to append the '$' sign before
                  style: new TextStyle(       //the actual string ex: '\@iamanidiot'
                      color: _levelUp ? Colors.green.shade700 : Colors.greenAccent ,
                      fontWeight: FontWeight.w800,
                      fontSize: 46.9),
                ),
              ),
            ),

            new Expanded(
              child: new Center(
                child: new TextButton(
                  style: TextButton.styleFrom(primary: Colors.lightGreen),
                    onPressed: _rainMoney,
                    child: new Text(
                      "Let It Rain!",
                      style: new TextStyle(fontSize: 19.9),
                      )
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
