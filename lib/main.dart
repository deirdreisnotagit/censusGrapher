import 'package:flutter/material.dart';
import 'secondroute.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  final response =
  await http.get('https://www.googleapis.com/civicinfo/v2/representatives?address=192%20escuela%20Ave%2C%20Mountain%20View%2C%20CA%2C%2094040&includeOffices=true&roles=legislatorLowerBody&roles=legislatorUpperBody&key=AIzaSyAvpTD2NJN7RAG_1xyTdiWMZ-zncPxbMQA');

  if (response.statusCode == 200) {
    print('success');
    // If the call to the server was successful, parse the JSON

    Map myDivisions = json.decode(response.body)['divisions'];


    return Post.fromJson(myDivisions);
  } else {
    print('fail');
  // If that call was not successful, throw an error.
  throw Exception('Failed to load data');
  }
}

class Post {
  final  String state;
  final  String lowerChamber;
  final  String upperChamber;

  Post({this.state, this.lowerChamber,this.upperChamber});

factory Post.fromJson(Map ddsjson) {
  String mySt = 'xx';
  String myLC = 'xx';
  String myUC = 'xx';
 //  print(ddsjson['ocd-division/country:us/state:ca']['name']);
//
  ddsjson.forEach((key, value) {
      print(value);
      if (value['officeIndices'][0] == 3) {
      //if(key.contains("sldl:")) {
       // print(key);
        myLC = key.split("sldl:")[1];
      }
      else if(value['officeIndices'][0] == 2) {
       // print(key);
        myUC = key.split("sldu:")[1];
    }
    else if(value['officeIndices'][0] == 0) {
       // print(key);
        mySt = value['name'];
      }




  });
  print(mySt);
  print(myLC);
  print(myUC);
  return Post(state: mySt, lowerChamber: myLC, upperChamber: myUC);
}
}

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
    theme: ThemeData(
      primaryColor: const Color(0xFF216BB4),
      primaryColorDark: const Color(0xFF18467E),
      accentColor: const Color(0xFFD1212E),
    ),
  ),
  );  //runApp
}



class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select your District'),
      ),
      body:
      Column (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
        Text(
        "Find information from the latest census projections for any state legislative district",
        style: TextStyle(inherit: true, color: Colors.blue, fontSize: 20.0),
      ),

      Center(
        child: RaisedButton(
          child: Text('Know my District'),
          onPressed: () {
         //   fetchPost();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute(fetchPost())),
            );
          }
        ),
      ),
  ]
    ),
    );
    }
}

