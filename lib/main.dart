import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              Color(0xFF3594DD),
              Color(0xFF4563DB),
              Color(0xFF5036D5),
              Color(0xFF5B16D0),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                    onPressed: () => print("skip"),
                    child: Text(
                      "Skip",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ),
              Container(
                height: 600,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Image(
                                image: AssetImage('assets/onboarding0.png'),
                                height: 300,
                                width: 300),
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Connect people\narround the word',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'CM Sans Serif',
                              fontSize: 26.0,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              height: 1.2,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Image(
                                image: AssetImage('assets/onboarding1.png'),
                                height: 300,
                                width: 300),
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Live your life smarter\nwith us!',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'CM Sans Serif',
                              fontSize: 26.0,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              height: 1.2,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Image(
                                image: AssetImage('assets/onboarding2.png'),
                                height: 300,
                                width: 300),
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Get a new experience\nof imagination',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'CM Sans Serif',
                              fontSize: 26.0,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              height: 1.2,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ],
          ),
        ),
      ),
    )
    );
  }
}
