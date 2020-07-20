import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "Queeny",
      "picture": "candytuff/photo_2020-06-05_18-27-14.jpg",
      "price": 85,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Blazer",
      "picture": "images/images/products/dress2.jpeg",
      "price": 50,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
          return new Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]["name"],
            cart_prod_color: Products_on_the_cart[index]["color"],
            cart_prod_qty: Products_on_the_cart[index]["quantity"],
            cart_prod_size: Products_on_the_cart[index]["size"],
            cart_prod_price: Products_on_the_cart[index]["price"],
            cart_prod_pictures: Products_on_the_cart[index]["picture"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_pictures;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  //constructor
  Single_cart_product(
      {this.cart_prod_name,
      this.cart_prod_pictures,
      this.cart_prod_price,
      this.cart_prod_size,
      this.cart_prod_color,
      this.cart_prod_qty});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(

        //================= LEADING SECTION ===================
        leading: new Image.asset(cart_prod_pictures, width: 80.0, height: 80.0,),

        //================ TITLE SECTION ===================
        title: new Text(cart_prod_name),

        //=============== SUBTITLE SECTION ================
        subtitle: new Column(
          children: <Widget>[
            //ROW INSIDE THE COLUMN
            new Row(
              children: <Widget>[
                //=============== This section for product color ============

                Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: new Text("Size:")),
                Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      cart_prod_size,
                      style: TextStyle(color: Colors.pink),
                    )),

                //=============== This section for product color ============

                new Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color"),
                ),

                Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      cart_prod_color,
                      style: TextStyle(color: Colors.pink),
                    )),
              ],
            ),

            // ========== This section for product price ==============
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$${cart_prod_price}",
                style: TextStyle(
                    fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.pink),

              ),
            ),
          ],
        ),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child:
          Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.arrow_drop_up,color: Colors.red),iconSize: 80, onPressed: () {}),
              Text("$cart_prod_qty",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
              IconButton(icon: Icon(Icons.arrow_drop_down,color: Colors.red,),iconSize: 80, onPressed: () {}),

            ],
          ),
        ),
      ),
    );
  }
}
