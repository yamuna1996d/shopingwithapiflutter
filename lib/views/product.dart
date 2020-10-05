import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Propics extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Propics> {
  final String api ="https://shcartop.herokuapp.com/pro/view";
  Future<dynamic>  getWallpaper(String api) async {return http.get(api).then((http.Response response){
    final int statuscode=response.statusCode;
    if(statuscode <200 || statuscode >400 || json ==null){
      throw new Exception("Error while fetching data");
    }
    print(response.body.toString());
    setState(() {
      data= json.decode(response.body);
    });

  });


  }
  List data;
  @override
  void initState() {
    getWallpaper("https://shcartop.herokuapp.com/pro/view");
    //categories =getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child:
      Column(
        children: <Widget>[
          SizedBox(height: 20.0,),
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: .85
            ),
                itemCount: data.length,
                itemBuilder: (context,index){
                  return Column(
                    children: <Widget>[
                      Expanded(child:
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Color(0XFFe3e3e3),
                            borderRadius: BorderRadius.circular(14.0)
                        ),
                        child:  Image.network(data[index]['url'],fit: BoxFit.cover,),
                      )
                      ),
                      Text(data[index]['title'],style: TextStyle(fontWeight: FontWeight.bold),),
                       Text("Rs.${data[index]['price']}"),
                      FlatButton(onPressed: (){},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.black)
                          ),
                          color: Colors.amber,
                          child:
                          Text("Buy"))
                    ],
                  );
                }),
          )
        ],
      ),
      // GridView.builder(
      //   itemCount: data==null ?0: data.length,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
      //     childAspectRatio: 0.6,
      //     mainAxisSpacing: 6.0,
      //     crossAxisSpacing: 6.0,
      //   ),  itemBuilder: (context,index){
      //   return GridTile(
      //     child:Container(
      //       child:Container(
      //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
      //
      //           child: Image.network(data[index]['url'],fit: BoxFit.cover,)),
      //     ),
      //   );
      // },),

    );
  }
}