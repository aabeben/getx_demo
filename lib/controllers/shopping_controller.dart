import 'package:get/get.dart';
import 'package:getx_demo/models/models.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(
      Duration(seconds: 1),
    );
    var productResult = <Product>[
      Product(
        id: 1,
        price: 30,
        productDescription: 'some description about product',
        productImage: 'abc',
        productName: 'FirstProd',
      ),
      Product(
        id: 2,
        price: 40,
        productDescription: 'some description about product',
        productImage: 'def',
        productName: 'SecondProd',
      ),
      Product(
        id: 3,
        price: 50,
        productDescription: 'some description about product',
        productImage: 'ghi',
        productName: 'ThirdProd',
      ),
    ];
    products.value = productResult;
  }
}
