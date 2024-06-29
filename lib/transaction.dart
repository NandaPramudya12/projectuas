import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
              child: Container(
                width: 500,
                height: 150,
                padding: EdgeInsets.all(16.0),
                color: Color(0xFF1D469D),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello,',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              'Andhika Putra',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '9087890908',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.notifications, color: Colors.white),
                            SizedBox(width: 10),
                            Icon(Icons.settings, color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 160),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 95, 141, 240),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Current Balance',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    'Rp. 27.950.000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Grid Menu
            Padding(
              padding: EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  buildFeatureIcon(Icons.info, 'M-Info'),
                  buildFeatureIcon(
                      Icons.transfer_within_a_station, 'M-Transfer'),
                  buildFeatureIcon(Icons.payment, 'M-Payment'),
                  buildFeatureIcon(Icons.shopping_cart, 'M-Commerce'),
                  buildFeatureIcon(Icons.card_membership, 'Cardless'),
                  buildFeatureIcon(Icons.admin_panel_settings, 'M-Admin'),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Recent Transactions
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Transaction',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  buildTransactionItem('Wesley Putra', '1.320.000', true),
                  buildTransactionItem('Jessica Tanwijaya', '500.000', false),
                  buildTransactionItem('Bloom Design House', '8.500.000', true),
                  buildTransactionItem('Gilbert Tanjung', '1.200.000', false),
                  buildTransactionItem('Lidya Damira', '200.000', false),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1D469D),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync_alt),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget buildFeatureIcon(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 95, 141, 240),
        borderRadius:
            BorderRadius.circular(10), // Kotak dengan sudut melengkung
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 40),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildTransactionItem(String name, String amount, bool isDebit) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                isDebit ? Icons.arrow_upward : Icons.arrow_downward,
                color: isDebit ? Colors.red : Colors.green,
              ),
              SizedBox(width: 8),
              Text(name),
            ],
          ),
          Text(
            'Rp. $amount',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
