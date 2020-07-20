import 'package:flutter/material.dart';
import 'package:shop_app/pages/product_details.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var product_list = [
    {
      "name": "Queeny",
      "picture": "candytuff/photo_2020-06-05_18-27-14.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Blazer",
      "picture": "images/images/products/blazer1.jpeg",
      "old_price": 100,
      "price": 50,
    }
    ,
    {
      "name": "Hills 1",
      "picture": "images/images/products/hills1.jpeg",
      "old_price": 100,
      "price": 50,
    }
    ,
    {
      "name": "Blazer",
      "picture": "images/images/products/blazer2.jpeg",
      "old_price": 100,
      "price": 50,
    }
    ,
    {
      "name": "Blazer",
      "picture": "images/images/products/skt2.jpeg",
      "old_price": 100,
      "price": 50,
    }
    ,
    {
      "name": "Blazer",
      "picture": "images/images/products/dress2.jpeg",
      "old_price": 100,
      "price": 50,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              prod_name: product_list[index]['name'],
              prod_pictures: product_list[index]['picture'],
              prod_old_price: product_list[index]['old_price'],
              prod_price: product_list[index]['price'],
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pictures;
  final prod_old_price;
  final prod_price;

  Single_prod(
      {this.prod_name,
      this.prod_pictures,
      this.prod_old_price,
      this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: new Text("hero 1"),
          child: Material(
              child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              // here we are passing the values of the product to the product details page
                builder: (context) => new ProductDetails(
                  product_detail_name: prod_name,
                  product_detail_new_price: prod_price,
                  product_detail_old_price: prod_old_price,
                  product_detail_picture: prod_pictures,
                ))),
            child: GridTile(
                footer: Container(
                  color: Colors.white,
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                      ),
                      new Text("\$${prod_price}", style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold))
                    ],
                  )
                ),
                child: Image.asset(
                  prod_pictures,
                  fit: BoxFit.cover,
                )),
          ))),
    );
  }
}
