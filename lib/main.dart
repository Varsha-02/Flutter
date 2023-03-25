import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('http://localhost:5000/login/add'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int id;
  final String Name;
  final int Phno;
  final String Email;

  const Album({
    required this.id,
    required this.Name,
    required this.Phno,
    required this.Email
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      Name: json['Name'],
      Phno: json['Phno'],
      Email: json['Email'],
    );
  }
}

void main() {

  runApp(MaterialApp(home: RunMyApp(),debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),));
}

  
// ignore: must_be_immutable
class RunMyApp extends StatelessWidget {
  RunMyApp({super.key});
   late Future<Album> futureAlbum;
@override
  void initState() {
    
    futureAlbum = fetchAlbum();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LOGIN PAGE'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 254, 70, 70),
                fontWeight: FontWeight.bold
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Form(
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'ID',
                          hintText: 'Enter ID',
                          border: OutlineInputBorder()
                                  ,                    ),
                        onChanged: (String value) {
                          
                        },
                        validator: (value) {
                          return value!.isEmpty ? 'Please enter UserID'      : null;               },
                        ),
                      ),
                      SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter name',
                          border: OutlineInputBorder()
                                ,                    ),
                        onChanged: (String value) {
                          
                        },
                        validator: (value) {
                          return value!.isEmpty ? 'Please enter name'      : null;               },
                        ),
                    ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Number',
                          hintText: 'Enter Number',
                          border: OutlineInputBorder()
                                  ,                    ),
                        onChanged: (String value) {
                          
                        },
                        validator: (value) {
                          return value!.isEmpty ? 'Please enter number'      : null;               },
                        ),
                      ),
                      SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter email',
                          border: OutlineInputBorder()
                                ,                    ),
                        onChanged: (String value) {
                          
                        },
                        validator: (value) {
                          return value!.isEmpty ? 'Please enter email'      : null;               },
                        ),
                    ),
                      SizedBox(height: 50,),
                      
                      
                  ],
                ),
              ),
            ),
          
            Center(
          child: 
          
              ElevatedButton(
                  onPressed: () {
            
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NextPage()));
                  },
                  child: Text('Login')),      
            ),
          ],
        )
      );
  }
}
  
class NextPage extends StatelessWidget {
    
  const NextPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Next Page'),),
      body: Center(
        child: Text('Successfully Added'),
      ),
    );
  }
}