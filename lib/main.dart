import 'package:animated_rotation/animated_rotation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mec Wheel demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double verticalDrag=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wheel"),),
      body: Container(
        height: double.infinity,

        color: Colors.white,
          child: GestureDetector(
            onVerticalDragUpdate: (details){
              setState(() {
                verticalDrag += details.delta.dy;

              });
            },

            onHorizontalDragUpdate: (details){
                setState(() {
                  verticalDrag += details.delta.dx;
                  print(verticalDrag);
                });
            },
              onDoubleTap: (){
                setState(() {
                  verticalDrag += 9;
                  print(verticalDrag);
                });
              },

              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 30,
                    child: AnimatedRotation(
                      angle: verticalDrag,
                        child: Image.asset(
                          "assets/images/mecwheel-front.png",
                          width: 400,
                          height: 400,
                          fit: BoxFit.fill,
                        ),
                      ),
                  ),

                  Positioned(
                    top: 32,
                    right: -20,

                    child: Container(
                      height: 400,
                        width: 400,

                        child: Image.asset("assets/images/mecwheel-cover.webp",fit: BoxFit.fill,)
                    ),
                  )

                ],
              )

          ),
        ),
    );
  }
}

