import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

void main() {
  runApp(MyApp());
}
final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calender",
      theme: ThemeData(primaryColor: Color(0xff6a53a4)),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text("Calender"),
          actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
        ),
        body: Container(
          color: Color(0xffdfd4f4),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                child: SimpleFoldingCell.create(
                  key: _foldingCellKey,
                  frontWidget: _buildFrontWidget(),
                  innerWidget: _buildInnerWidget(),
                  cellSize: Size(double.infinity, 175),
                  padding: EdgeInsets.all(10),
                  animationDuration: Duration(milliseconds: 300),
                  borderRadius: 10,
                  onOpen: () => print('cell opened'),
                  onClose: () => print('cell closed'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Container InnerTopWidget() {
  return Container(
    color: Color(0xff6a53a4),
  );
}

Container FrontWidget() {
  return Container(
    color: Color(0xffdfd4f4),
    alignment: Alignment.center,
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff6a53a4),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildFrontWidget() {
  return Container(
    color: Color(0xFFffcd3c),
    alignment: Alignment.center,
    child: Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Text(
            "CARD TITLE",
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: TextButton(
            onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
            child: Text(
              "OPEN",
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: Size(80, 40),
            ),
          ),
        )
      ],
    ),
  );
}



Widget _buildInnerWidget() {
  return Container(
    color: Color(0xFFecf2f9),
    padding: EdgeInsets.only(top: 10),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            "CARD TITLE",
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "CARD DETAIL",
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: TextButton(
            onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
            child: Text(
              "Close",
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: Size(80, 40),
            ),
          ),
        ),
      ],
    ),
  );
}

