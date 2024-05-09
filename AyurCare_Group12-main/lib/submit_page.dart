import 'package:ayurcare/disease_page.dart';
import 'package:ayurcare/home.dart';
import 'package:ayurcare/plant_recognition.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          
          leading: BackButton(color: Colors.white,
            
           // icon: Icon(Icons.arrow_back),
            onPressed: () {
              //GestureDetector(
              //onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  const homepage()),
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/logo1.png', // Adjust path accordingly
                height: 300, // Adjust the height of the image
                fit: BoxFit.cover, // Adjust how the image is fitted
              ),
              
              
              const SizedBox(
                  height: 20), // Add space between top image and select box
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButton<String>(
                  isExpanded: true,
                  
                  hint: const Text('Select the Disease'),
                  onChanged: (newValue) {
                    if (newValue == 'Asthma') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const disease()),
                      );
                    }
                  },
                  
                  items: <String>[
                    
                    'Asthma',
                    
                    'Hembirissawa',
                    'Kassa',
                    'Bade Amaruwa',
                    // Add more options as needed
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 40), // Add space between select box and image
              Image.asset(
                'assets/sb1.png', // Adjust path accordingly
                height: 200, // Adjust the height of the image
                //fit: BoxFit.cover, // Adjust how the image is fitted
              ),
const SizedBox(height: 30),
             Container(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(204, 89, 92, 89), // Start color
        Color.fromARGB(204, 229, 234, 234), // End color
      ],
    ),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const SizedBox(height: 10),
      const Text(
        'Recognize the plant',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromARGB(255, 244, 247, 244),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        width: 50, // Set the desired width of the button
        child: ElevatedButton(
          onPressed: () {
             Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PlantRecognitionPage()),
                        );
            // Add functionality for button
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 1, 60, 7), // Change the background color of the button
          ),
          child: const Text(
            'Click here',
            style: TextStyle(
              color: Colors.white, // Change the color of the text inside the button
            ),
          ),
        ),
      ),
      const SizedBox(height: 10),
    ],
  ),
),
const SizedBox(height: 10),
              
            ],
          ),
        ),
      ),
    );
  }
}

class DiseasePage extends StatelessWidget {
  const DiseasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asthma'),
      ),
      body: const Center(
        child: Text('This is the Asthma page.'),
      ),
    );
  }
}