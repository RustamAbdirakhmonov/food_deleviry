import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFE5E5E5),
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  color: Color(0xFF16A8FC),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 70,
                        height: 70,
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/burger.png'),
                      ),
                      Container(
                          child: DefaultTextStyle(
                        style: TextStyle(),
                        child: Text(
                          'Need Food',
                          style: const TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 30),
                    height: size * .7,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                'assets/images/pizza.png',
                                color: Colors.grey,
                              ),
                              width: 95,
                              height: 95,
                              padding: EdgeInsets.all(10),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              child: Image.asset(
                                'assets/images/fast_food.png',
                                color: Colors.grey,
                              ),
                              padding: EdgeInsets.all(10),
                            ),
                            Container(
                              width: 95,
                              height: 95,
                              child: Image.asset('assets/images/salad.png',
                                  color: Colors.grey),
                              padding: EdgeInsets.all(10),
                            ),
                          ],
                        ),
                        Container(
                          height: 220,
                          width: double.infinity,
                        ),
                        Row(
                          children: <Widget>[
                            Transform.rotate(
                              angle: 1,
                              child: Container(
                                width: 100,
                                height: 100,
                                child: Image.asset(
                                  'assets/images/fast_food.png',
                                  fit: BoxFit.cover,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Container(
                              child: Image.asset(
                                'assets/images/pizza.png',
                                color: Colors.grey,
                              ),
                              width: 95,
                              height: 95,
                              padding: EdgeInsets.all(10),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 100,
                            ),
                            Container(
                              child: Image.asset(
                                'assets/images/pizza.png',
                                color: Colors.grey,
                              ),
                              width: 40,
                              height: 40,
                              padding: EdgeInsets.all(10),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Transform.rotate(
                              angle: 1,
                              child: Container(
                                width: 40,
                                height: 40,
                                child: Image.asset(
                                  'assets/images/fast_food.png',
                                  fit: BoxFit.cover,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 70,
                        ),
                        Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 40,
                              decoration: TextDecoration.none,
                              color: Colors.black),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(

                              onPressed: () {},
                              child: Text('LogIn'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Color(0xFF16A8FC,),),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )
                                )
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 160);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(0, 160);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
