import 'package:flutter/material.dart';

class SecondRoute extends StatefulWidget {
  final String usstate;
  final String lower;
  final String upper;

  SecondRoute({this.usstate, this.lower, this.upper});

  @override
  State<StatefulWidget> createState() {
    return SecondRouteState();
  }
}


class SeconddRouteState extends State<SecondRoute> {
  int _selectedPage = 0;
  final _pageOptions = [
    Text("General ", style: TextStyle(fontSize: 36.0),),
    Text("Housing", style: TextStyle(fontSize: 36.0),),
    Text("Education", style: TextStyle(fontSize: 36.0),),
    Text("Employment", style: TextStyle(fontSize: 36.0),),
    Text("Voting", style: TextStyle(fontSize: 36.0),)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        bottom: TabBar(
        tabs: [
        Text("Upper Chamber: ${widget.upper}"),
    Text("Lower Chamber: ${widget.lower}"),
    ],),
    title: Text("${widget.usstate}"),
 //     body: Center(
    body: _pageOptions[_selectedPage],
    child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
