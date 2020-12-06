import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'catalogItem.dart';


void main() {
  runApp(MaterialApp(home: HomeUI()));
}

class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {




  int qty = 5;
  List<CatalogItem> catalogItems = [
    CatalogItem(
        nameItem: 'Flat White',
        priceItem: '12.00',
        imageItem: 'flat_white.jpg',
        descItem: 'Flat White Description long long long long text'),
    CatalogItem(
        nameItem: 'Long Black',
        priceItem: '8.00',
        imageItem: 'long_black.jpg',
        descItem: 'Long Black Description'),
    CatalogItem(
        nameItem: 'Latte',
        priceItem: '10.50',
        imageItem: 'latte_1.jpg',
        descItem: 'Latte Description'),
    CatalogItem(
        nameItem: 'Latte',
        priceItem: '8.50',
        imageItem: 'latte_2.jpg',
        descItem: 'Latte Description'),
    CatalogItem(
        nameItem: 'Macchiato',
        priceItem: '9.90',
        imageItem: 'macchiato.jpg',
        descItem: 'Flat White Description'),
    CatalogItem(
        nameItem: 'Mochaccino',
        priceItem: '15.80',
        imageItem: 'mochaccino.jpg',
        descItem: 'Mochaccino Description'),
    CatalogItem(
        nameItem: 'Expresso',
        priceItem: '6.80',
        imageItem: 'espresso_2.jpg',
        descItem: 'Expresso Description'),
    CatalogItem(
        nameItem: 'Green Tea',
        priceItem: '10.50',
        imageItem: 'green_tea.jpg',
        descItem: 'Green Tea Description'),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  Widget catalogItemCard(catalogItem) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/' + catalogItem.imageItem,
                    width: 120, height: 120, fit: BoxFit.cover),
              )
            ],

            // children: <Widget>[
            //   child: Image(
            //     image: AssetImage('assets/images/' + catalogItem.imageItem),
            //     width: 120,
            //     height: 120),
            // ],
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(catalogItem.nameItem,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontFamily: 'Roboto')),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                  child: Text('RM ' + catalogItem.priceItem,
                      style: TextStyle(
                          fontSize: 18.0,
                          // fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontFamily: 'Roboto')),
                ),
                Text(catalogItem.descItem,
                    style: TextStyle(
                      fontSize: 18.0,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontFamily: 'Roboto',
                    )),
                RaisedButton.icon(
                  label: Text("Buy This MAD Coffee"),
                  color: Colors.cyanAccent,
                  onPressed: () {
                     _showScaffold("Coffe: " + catalogItem.nameItem);
                },
                icon: Icon(Icons.add, color:Colors.white),)
              ],
            ),
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Flutter MAD Cafe'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[400],
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 32.0, 0),
            child: Badge(
              badgeContent: Text(
                qty.toString(),
                style: TextStyle(color: Colors.white),
              ),
              position: BadgePosition.topEnd(top: 0.0, end: 0.0),
              child: IconButton(
                icon: Icon(Icons.shopping_basket),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: catalogItems
            .map((catalogItem) => catalogItemCard(catalogItem))
            .toList(),
      ),
      // body: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Column(
      //       children: <Widget>[
      //         Center(
      //             child: Image.asset(
      //           'assets/images/latte_1.jpg',
      //         )),
      //         Padding(
      //           padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 0.0),
      //           child: Center(
      //               child: Text(
      //             "MAD Cooffe Special",
      //             style: TextStyle(
      //                 fontSize: 28,
      //                 fontWeight: FontWeight.bold,
      //                 fontFamily: 'Roboto-Bold'),
      //           )),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(32.0),
      //           child: Center(
      //               child: Text(
      //             "Quantity: $qty",
      //             style: TextStyle(fontSize: 24, fontFamily: 'Roboto-Regular'),
      //           )),
      //         ),
      //         Center(
      //             child: RaisedButton(
      //           onPressed: () {
      //             setState(() {
      //               qty = 5;
      //             });
      //           },
      //           child: Text(
      //             'Refill',
      //             style: TextStyle(fontSize: 20),
      //           ),
      //         )),
      //         Center(
      //             child: Text(
      //           "Quicky Submit Your Task to Get Free Coffee",
      //           style: TextStyle(
      //               fontSize: 28,
      //               fontStyle: FontStyle.italic,
      //               fontFamily: 'Roboto'),
      //         )),
      //       ],
      //     )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            qty--;
          });
        },
        child: Icon(Icons.remove),
      ),
    );
  }
}
