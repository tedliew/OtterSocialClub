import 'package:flutter/material.dart';

void main() {
  runApp(OtterApp());
}

class OtterApp extends StatelessWidget {
  const OtterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Active tab index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D), // Black screen background
      body: Column(
        children: [
          // Top blue section with rounded corners and otter image
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF2456B1), // Blue
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top), // Extend behind status bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "WELCOME\nBACK CONNOR!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      'assets/otter-banner-mobile.png', // Replace with your otter image asset
                      height: 150,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Button group wrapped in dark grey container
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: const Color(0xFF1C1C1C), // Dark grey background
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMainButton(Icons.add, "ADD GOAL"),
                _buildMainButton(Icons.headphones, "FOCUS"),
                _buildMainButton(Icons.people, "FRIENDS"),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Placeholder for goal cards
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero, // Remove padding/margin
              children: [
                _buildGoalCard("Read a chapter of a book", "Detailed description of the goal.", "Personal"),
                // Add more cards as needed
              ],
            ),
          ),
        ],
      ),

      // Bottom navigation bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: _selectedIndex == index
                      ? const Color(0xFF2456B1) // Active blue
                      : const Color(0xFF0D0D0D), // Inactive black
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getBottomNavIcon(index),
                  color: Colors.white,
                  size: 28,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  // Helper method for main buttons
  Widget _buildMainButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Color(0xFF2456B1), // Blue
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }

  // Helper method for goal cards
  Widget _buildGoalCard(String title, String description, String category) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF2456B1), // Blue
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF2456B1), // Blue
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              category.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to get bottom nav icons
  IconData _getBottomNavIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.check_circle;
      case 2:
        return Icons.compass_calibration;
      case 3:
        return Icons.bar_chart;
      case 4:
        return Icons.person;
      default:
        return Icons.home;
    }
  }
}
