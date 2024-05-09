// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:ayurcare/decoction_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const decname());
}

class decname extends StatelessWidget {
  const decname({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Decoction Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: BackButton(
            color: Colors.white,

            // icon: Icon(Icons.arrow_back),
            onPressed: () {
              //GestureDetector(
              //onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const decoction()),
                // );
                //},
              );

              // Handle back button press here
              //Navigator.of(context).pop();
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/ac.png', // Assuming 'logo.png' is your logo file path
                fit: BoxFit.contain,
                height: 250,
                width: 120,
              ),
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 25, 155, 31),
                  Color.fromARGB(255, 19, 48, 20)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Ingredients',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'scroll to see the images',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            ImageSwapper(), // Custom Widget for image swapping
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                  /*decoration: InputDecoration(
                  hintText: '',
                  border: OutlineInputBorder(),
                ),*/
                  ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                  'Hello, You can click on the images you want to know the details.Then we will show a small description on that selected plant with its features,habitat where it grows and the importance of that plant.Ayurcare provides facilitates you to know how the above plants can be identify. '), // Add your text widget here
            ),
          ],
        ),
      ),
    );
  }
}

class ImageSwapper extends StatefulWidget {
  const ImageSwapper({super.key});

  @override
  _ImageSwapperState createState() => _ImageSwapperState();
}

class _ImageSwapperState extends State<ImageSwapper> {
  List<String> imageUrls = [
    'assets/image1.jpeg',
    'assets/image5.jpeg',
    'assets/image1.jpeg',
    'assets/image5.jpeg',
  ];

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 250, // Set a fixed height for the container
      child: PageView.builder(
        controller: _pageController,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;
              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
              }
              return Transform.scale(
                scale: 1 +
                    value * 0.2, // Scale the image based on the scroll position
                child: child,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  // Handle onTap if needed
                },
                child: Image.asset(
                  imageUrls[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
