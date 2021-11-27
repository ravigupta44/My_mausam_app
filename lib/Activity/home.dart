
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mausam_app/Activity/loading.dart';
import 'dart:convert';
import 'package:weather_icons/weather_icons.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
class Home extends StatefulWidget {
  

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  @override
  void initState(){
    super.initState();
    
    print("This is an init state");
  }


  @override
  void setState(fn){
    super.setState(fn);
    print("Set State Called");
  }

  @override
  void dispose(){
    super.dispose();
    print("Widget destroyed");
  }


  @override
  Widget build(BuildContext context) {

    
    var city_name = ["Mumbai", "Delhi","Chennai", "Patna", "Bihar", "London"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    Map<dynamic,dynamic>? info = ModalRoute.of(context)?.settings.arguments as Map;
    String? temp = ((info['temp_value']).toString()).substring(0,4);
    String? icon = info['icon_value'];
      String? getcity = info['city_value'];
      String? hum = info['hum_value'];
      String? air = ((info['air_speed_value']).toString()).substring(0,4);
      String ?des = info['des_value'];


    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(0),
      //   child: AppBar(
      //     backgroundColor: Colors.blue,
      //   )
      // ),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: NewGradientAppBar(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.blue.shade200],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue.shade800, Colors.blue.shade300])),
          child: Column(
            children: [
              Container(
                //Search Wala Container

                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //remove this one..
                      //  Navigator.pushNamed(context, "/loading", arguments: {
                      //    "searchText":searchController.text,
                      //  });
                            if ((searchController.text).replaceAll(" ", "") == "") {
                              print("Blank search");
                            } else {
                              Navigator.pushReplacementNamed(context, '/splashscreen', arguments: {
                                'searchText': searchController.text,
                              });
                            }
                      },

                      
                      child: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.blueAccent,
                        ),
                        margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Search $city"),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.all(15),
                        child: Row(children: [
                          Image.network("http://openweathermap.org/img/wn/$icon@2x.png"),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              Text("$des",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),),
                              Text("In $getcity",style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          )
                        ])),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 185,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      padding: EdgeInsets.all(26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(WeatherIcons.thermometer),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("$temp",style: TextStyle(
                                fontSize: 90
                              ),),
                              Text("C",style: TextStyle(
                                fontSize: 30
                              ),)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      padding: EdgeInsets.all(26),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.day_windy)
                            ],
                          ),
                          SizedBox(height: 30,)
                          ,
                          Text("$air",style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                          ),),
                          Text("km/hr")
                        ],
                      ),
                      height: 200,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      padding: EdgeInsets.all(26),
                      height: 200,
                      child:  Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.humidity)
                            ],
                          ),
                          SizedBox(height: 30,)
                          ,
                          Text("$hum",style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold
                          ),),
                          Text("Percent")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Made By Ravi & Rahul"),
                    Text("Data Provided By Openweathermap.org")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      
    );
  }
}