import 'package:flutter/material.dart';
import '../task_3/from_screen.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https://picsum.photos/400/200'),
          const SizedBox(height: 20),
          const Text(
            'I am Md. Shajib', // Replace with your actual name
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to FormScreen when button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FormScreen()),
              );
            },
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }
}