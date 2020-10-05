import 'package:flutter/material.dart';
import 'package:shopping_app_withapi/views/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.shopping_cart,color: Colors.black,), onPressed: null)
          ],
          backgroundColor: Colors.white,
          title: Text("Shop Here",style: TextStyle(color: Colors.black54),),
        ),
        body: Propics(),
      ) ,
    );
  }
}
