import 'dart:convert';
import 'package:cocktail_app/drink_detail.dart';
import 'package:cocktail_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
String api ="https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
var res,drinks;

@override
  void initState() {
    super.initState();
    fetchData();
  }
  fetchData()async{
    res = await http.get(Uri.parse(api));
    drinks =jsonDecode(res.body)["drinks"];
    print(drinks.toString());
    setState(() { });
  }

 // const HomePage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cocktail App"),
      elevation: 0.0,   
        backgroundColor: mycolor,   
      ),
      drawer: Drawer(),
     body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            mycolor,
            Colors.orange, 
          ])
        ),
       child: Center(
         child: res != null ? ListView.builder(
           itemCount: drinks.length,
           itemBuilder: (context, index){
             var drink =drinks[index];
             return ListTile(
               leading: Hero(
                 tag: drink["idDrink"],
                 child: CircleAvatar(backgroundImage: NetworkImage(drink["strDrinkThumb"] ??
                 "https://image.shutterstock.com/image-vector/picture-vector-icon-no-image-260nw-1732584341.jpg",
                 )
                 ),
               ),
               title: Text("${drink["strDrink"]}",
               style: TextStyle(fontSize:20,
                fontWeight: FontWeight.bold), 
             ),
             subtitle: Text("${drink["idDrink"]}",
             ),
             onTap: (){
               Navigator.push(context, MaterialPageRoute(
                 builder: (context)=>DrinkDetail(drink:drink),

                 ));
             },
             );
           }
               ):CircularProgressIndicator(),
             ),
     ),       
         
       );
  }
}