import 'package:cocktail_app/main.dart';
import 'package:flutter/material.dart';
class DrinkDetail extends StatelessWidget {
 final drink;

  const DrinkDetail({Key? key, @required this.drink}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            mycolor,
            Colors.orange,
          ])
        ),
      child: Scaffold(
        backgroundColor: mycolor,
        appBar: AppBar(title: Text(drink["strDrink"]),
        elevation: 0.0,
         backgroundColor: mycolor,   
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Hero(
                   tag: drink["idDrink"],
                   child: CircleAvatar(backgroundImage: NetworkImage(drink["strDrinkThumb"]),
                   radius: 100.0,
                   ),
                 ),
                  SizedBox(
                   height: 30.0,
                 ),
                 Text(
                  "  ID : ${drink["idDrink"]}",
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                 ),
                 SizedBox(
                   height: 20.0,
                 ),
                  Text(
                    "${drink["strDrink"]}",
               style: TextStyle(fontSize:20,
               color: Colors.white,
               
              ),
             ),
          ],),
        ),
      ),
    );
  } 
}