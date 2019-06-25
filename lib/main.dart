import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pages/home_page.dart';
import 'pages/member_page.dart';
import 'pages/cart_page.dart';
import 'pages/category_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  final List<BottomNavigationBarItem> bottomBars = [
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.home),
      title:Text('首页')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.search),
      title:Text('分类')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.shopping_cart),
      title:Text('购物车')
    ),
     BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.profile_circled),
      title:Text('会员中心')
    ),
  ];
  final List tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];
  int currentIndex = 0;
  var currentPage ;

  @override
  void initState(){
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: bottomBars,
        type:BottomNavigationBarType.fixed,
        onTap: (int index){
          setState(() {
            print(index);
            currentIndex = index;
            currentPage = tabBodies[index];
          });
        },
      ),
      body: currentPage,
    );
  }
}
