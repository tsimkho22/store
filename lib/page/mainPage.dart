import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

List categories = ['Shirt', 'Shoes', 'Sun-Glass', 'Fashion'];

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    Widget _buildContainer(String banner) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          image: DecorationImage(
            image: AssetImage(
              banner,
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 186, 252, 164),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 50,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              items: [
                _buildContainer("assets/images/a.avif"),
                _buildContainer("assets/images/b.avif"),
                _buildContainer("assets/images/c.avif"),
                _buildContainer("assets/images/d.avif"),
                _buildContainer("assets/images/e.avif"),
              ],
              options: CarouselOptions(
                height: 140,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 0,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.9,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: 20,
                top: 20,
              ),
              child: Text(
                'Categories',
              ),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: categories.length,
                crossAxisSpacing: 10,
              ),
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 50,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text(
                    categories[index],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
