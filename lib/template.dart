import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart'; // Ensure this package is added in pubspec.yaml

// Import your page classes
import 'home.dart';
import 'transaction.dart';
import 'Add.dart';
import 'notification.dart';
import 'profile.dart';

class Template extends StatefulWidget {
  const Template({super.key});

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  int selectedPage = 0;

  // Define the list of pages
  final _pageOptions = [
    HomePage(), // Assuming these are the actual class names for your pages
    TransactionScreen(),
    Add(),
    AktivitasPage(),
    AkunPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pageOptions[selectedPage], // Display the selected page
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,
          backgroundColor: Colors.white,
          color: Color.fromARGB(255, 60, 140, 231),
          activeColor: Color.fromARGB(255, 60, 140, 231),
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.receipt, title: 'Transaction'),
            TabItem(icon: Icons.qr_code, title: 'Add'), // Center button
            TabItem(icon: Icons.notifications, title: 'Notification'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          initialActiveIndex: 0,
          onTap: (int i) {
            // If center button is pressed (i.e., QR Code)
            if (i == 2) {
              // Handle center button press separately
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('QR Code Scanner'),
                  content: Text(
                      'This is a placeholder for QR Code Scanner functionality.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                ),
              );
            } else {
              // Update the selected page
              setState(() {
                selectedPage = i;
              });
            }
          },
        ),
      ),
    );
  }
}
