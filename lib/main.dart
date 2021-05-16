import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:folding_cell/folding_cell.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<GlobalKey<SimpleFoldingCellState>> _list =
      List<GlobalKey<SimpleFoldingCellState>>.empty(growable: true);
  MyApp() {
    for (var i = 0; i < 10; i++) {
      _list.add(GlobalKey<SimpleFoldingCellState>());
    }
  }

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
              for (var i = 0; i < 10; i++) Container(
                child: SimpleFoldingCell.create(
                  key: _list[i],
                  frontWidget: frontWidget(_list[i]),
                  innerWidget: innerWidget(_list[i]),
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

Widget innerWidget(GlobalKey<SimpleFoldingCellState> foldingCellKey) {
  return InkWell(
    onTap: () => foldingCellKey?.currentState?.toggleFold(),
    child: Container(
      margin: EdgeInsets.all(0),
      color: Color(0xff6a53a4),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Details",
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 4.0, 4.0),
                      child: Icon(
                        Icons.assignment_outlined,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      "Functional and Business Units Review",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 4.0, 4.0),
                      child: Icon(
                        Icons.access_time,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      "09:00AM - 09:45AM",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 4.0, 4.0),
                      child: Icon(
                        Icons.margin,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      "2nd Floor Conference Room",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 4.0, 4.0),
                      child: Icon(
                        Icons.wb_cloudy_outlined,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      "High",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Guest List - Going",
                      style: TextStyle(
                          color: Colors.purple[900],
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 10),
                      MaterialButton(
                        color: Colors.amber,
                        onPressed: () {},
                        child: Text("Set Remainder"),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget frontWidget(GlobalKey<SimpleFoldingCellState> foldingCellKey) {
  return InkWell(
    onTap: () => foldingCellKey?.currentState?.toggleFold(),
    child: Container(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Today",
                    style: TextStyle(color: Color(0xffA898DD), fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "10:00 AM",
                    style: TextStyle(color: Color(0xffffffff), fontSize: 18),
                  ),
                ],
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Scrum-Team Meeting",
                    style: TextStyle(
                        color: Color(0xff6D6888),
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.amber,
                      ),
                      Text(
                        "HeadOffice New York",
                        style:
                            TextStyle(color: Color(0xffff00ff), fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
