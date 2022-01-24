//Import flutter Helper Libraray
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:pics/src/models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget{
  createState(){
    return AppState();
  }
}

class AppState extends State<App> {


int counter=0;

List<ImageModel> images=[];

void fetchImage() async{
  counter++;
  var response=await get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
  var imageModel=ImageModel.fromJson(json.decode(response.body));

  setState(() {
    images.add(imageModel);
  });
}

Widget build(context){
  return MaterialApp(
    home: Scaffold(
      body: ImageList(images),
      appBar: AppBar(title: Text('ImageSearch'),),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: const Icon(Icons.add_a_photo_outlined),
      ),
    ),
  );
}
}
