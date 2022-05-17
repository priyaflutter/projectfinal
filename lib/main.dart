import 'package:demo/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: first(),
  ));
}


class splash extends StatefulWidget {
  static SharedPreferences? pref;

  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _first1State();
}

class _first1State extends State<splash> {

  bool login = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getshare();
  }

  getshare() async {
    splash.pref = await SharedPreferences.getInstance();

    setState(() {
      login = splash.pref!.getBool("loginstatus") ?? false;
    });

    Future.delayed(Duration(seconds: 10)).then((value) {

      // if (login)
      // {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return first();
          },
        ));

      // }
      // else
      // {
      //   Navigator.pushReplacement(context, MaterialPageRoute(
      //     builder: (context) {
      //       // return first();
      //     },
      //   ));
      // }

    }) ;


  }

  @override
  Widget build(BuildContext context) {

    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double navibartheight = MediaQuery.of(context).padding.bottom;
    double appbarheight =kToolbarHeight;

    double bodyheight = theight - navibartheight - statusbarheight-appbarheight;

    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Container(
              height: 500,
              width: double.infinity,
              child: Lottie.asset("animation/login.json",fit: BoxFit.fitHeight),
            ),
          )),
    );
  }
}



