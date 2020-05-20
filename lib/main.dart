import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{
  List data;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Json App"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('load_json/person.json'),
            builder: (context, snapshot) {
              var myData = json.decode(snapshot.data.toString());

              return ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    elevation: 7.0,
                    margin: EdgeInsets.all(20.0),
                    shadowColor: Colors.grey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("ID:"+myData[index]['id'],
                              style: TextStyle(
                                fontSize: 20.0
                              ),
                            ),

                            Text("Name:"+myData[index]['name']),
                            Text("Age:"+myData[index]['age']),
                            Text("Gender:"+myData[index]['gender']),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: myData == null ? 0 : myData.length,
              );

            },
          ),
        ),
      ),
    );
  }
}