// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class Album {
//   final int userId;
//   final int id;
//   final String title;
//
//   const Album({
//     required this.userId,
//     required this.id,
//     required this.title,
//   });
//
//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List data;
  Future<List<dynamic>> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://api.sampleapis.com/recipes/recipes/'));

    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,

      setState(() {
        data = jsonDecode(response.body);
      });
      print(data.toString());
      return data;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed ');
    }
  }

  // late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data'),
        ),
        body: Center(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    child: Card(
                      color: Colors.white,
                      elevation: 5.0,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "Title: ",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  data[index]["title"].toString(),
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Course: ",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  data[index]["course"].toString(),
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Cuisine: ",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  data[index]["cuisine"].toString(),
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Main Ingredient: ",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  data[index]["mainIngredient"].toString(),
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Preparation Time: ",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  data[index]["prepTime"].toString(),
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Cook Time: ",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  data[index]["cookTime"].toString(),
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Total Time: ",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  data[index]["totalTime"].toString(),
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Servings: ",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  data[index]["servings"].toString(),
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Yield: ",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  data[index]["yield"].toString(),
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Image.network(
                            data[index]["photoUrl"].toString(),
                            height: 150.0,
                            width: 250.0,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
