import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

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
                child: SimpleFoldingCell(
                  frontWidget: FrontWidget(),
                  innerTopWidget: InnerTopWidget(),
                  innerBottomWidget: InnerBottomWidget(),
                  cellSize: Size(MediaQuery.of(context).size.width, 175),
                  padding: EdgeInsets.all(10.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Container InnerBottomWidget() {
  return Container(
    color: Colors.white,
  );
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
