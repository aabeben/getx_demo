import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/controllers.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Demo'),
      ),
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (shoppingController) {
                  return ListView.builder(
                    itemCount: shoppingController.products.length,
                    itemBuilder: (context, index) => Card(
                      margin: const EdgeInsets.all(12.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        '${shoppingController.products[index].productName}'),
                                    Text(
                                        '${shoppingController.products[index].productDescription}'),
                                  ],
                                ),
                                Text(
                                    '\$${shoppingController.products[index].price}'),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                child: Text('Add to cart'),
                                onPressed: () {
                                  cartController.addToCart(
                                      shoppingController.products[index]);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            GetX<CartController>(builder: (controller) {
              return Text('Total Amount:');
            }),
            SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }
}
