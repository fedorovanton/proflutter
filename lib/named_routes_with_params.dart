import 'package:flutter/material.dart';
import 'package:tmp/utils/theme.dart';

class NamedRoutesWithParams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: basicTheme(),
      routes: {
        '/': (context) => HomeScreen(),
        '/details': (context) => DetailScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Named Routes With Params'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp13touch-space-select-202005?wid=904&hei=840&fmt=jpeg&qlt=80&op_usm=0.5,0.5&.v=1587460552755',
              width: 200,
            ),
            RaisedButton(
              child: Text('Подробнее'),
              onPressed: () {
                Product product = Product(
                  imageUrl:
                      'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp13touch-space-select-202005?wid=904&hei=840&fmt=jpeg&qlt=80&op_usm=0.5,0.5&.v=1587460552755',
                  name: 'Macbook Pro 13, 2020',
                  description:
                      'Intel Core i5,Turbo Boost up to 3.8GHz, 32GB, 1TB SSD',
                );
                Navigator.pushNamed(context, '/details', arguments: product);
              },
            )
          ],
        ),
      ),
    );
  }
}

class Product {
  final String imageUrl;
  final String name;
  final String description;

  Product({this.imageUrl, this.name, this.description});
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // RouteSettings settings = ModalRoute.of(context).settings;
    // Product product = settings.arguments;
    final Product product = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Подробная информация'),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  Image.network(
                    product.imageUrl,
                    width: 300,
                  ),
                  ListTile(
                    title: Text(product.name),
                    subtitle: Text(product.description),
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Назад'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
