import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/main_drawer.dart';

import './categories_screen.dart';
import './favourites_screen.dart';

class TabsScreen2 extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabsScreen2(this.favouriteMeals);

  @override
  _TabsScreen2State createState() => _TabsScreen2State();
}

class _TabsScreen2State extends State<TabsScreen2> {
  late List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;

  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouritesScreen(widget.favouriteMeals),
        'title': 'Favourites',
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'])),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
