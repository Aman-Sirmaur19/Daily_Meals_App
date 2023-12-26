import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

import './categories_screen.dart';
import './favourites_screen.dart';

class TabsScreen1 extends StatefulWidget {
  @override
  _TabsScreen1State createState() => _TabsScreen1State();
}

class _TabsScreen1State extends State<TabsScreen1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.category), text: 'Categories'),
              Tab(icon: Icon(Icons.star), text: 'Favourites'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[CategoriesScreen(), FavouritesScreen()],
        ),
      ),
    );
  }
}
