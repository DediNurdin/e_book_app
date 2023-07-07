import 'package:e_book_app/screens/cart/cart_page.dart';
import 'package:e_book_app/screens/home/home_page.dart';
import 'package:e_book_app/screens/save/save_page.dart';
import 'package:e_book_app/screens/user/user_page.dart';
import 'package:e_book_app/themes.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  static const nameRoute = '/';
  const BottomNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final _screens = [
    HomePage(),
    SavePage(),
    CartPage(),
    UserPage(),
  ];
  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (i) {
            setState(() {
              _selectedIndex = i;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 15),
                child: Image.asset(
                  'assets/icons/icon-home.png',
                  width: 20,
                  color: _selectedIndex == 0 ? greenColor : grayColor,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 15),
                child: Image.asset(
                  'assets/icons/icon-save-nav.png',
                  width: 14,
                  color: _selectedIndex == 1 ? greenColor : grayColor,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 15),
                child: Image.asset(
                  'assets/icons/icon-cart.png',
                  width: 20,
                  color: _selectedIndex == 2 ? greenColor : grayColor,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 15),
                child: Image.asset(
                  'assets/icons/icon-user.png',
                  width: 18,
                  color: _selectedIndex == 3 ? greenColor : grayColor,
                ),
              ),
              label: '',
            ),
          ]);
    }

    return Scaffold(
      bottomNavigationBar: customBottomNav(),
      body: Stack(
          children: _screens
              .asMap()
              .map((i, screen) => MapEntry(
                  i,
                  Offstage(
                    offstage: _selectedIndex != i,
                    child: screen,
                  )))
              .values
              .toList()),
    );
  }
}
