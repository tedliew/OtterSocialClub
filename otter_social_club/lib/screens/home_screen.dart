import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Header
              Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "WELCOME BACK",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "CONNOR!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // Add Image Here
                    Image.asset(
                      'assets/images/otter.png', // Replace with your otter image path
                      height: 60,
                    ),
                  ],
                ),
              ),

              // Action Buttons Row
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildActionButton(Icons.add, "ADD GOAL"),
                    _buildActionButton(Icons.headset, "FOCUS"),
                    _buildActionButton(Icons.people, "FRIENDS"),
                  ],
                ),
              ),

              // Time Filters
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildFilterButton("TODAY", true),
                    _buildFilterButton("THIS WEEK", false),
                    _buildFilterButton("THIS MONTH", false),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // Goal Card
              _buildGoalCard(
                date: "17/1/2025",
                time: "2:00PM - 3:00PM",
                title: "Read a chapter of a book",
                description: "Detailed description of the goal.",
                category: "PERSONAL",
              ),

              SizedBox(height: 16),

              // Goal Card (Duplicate for testing)
              _buildGoalCard(
                date: "17/1/2025",
                time: "2:00PM - 3:00PM",
                title: "Read a chapter of a book",
                description: "Detailed description of the goal.",
                category: "PERSONAL",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white),
          ),
          child: Icon(icon, color: Colors.white, size: 32),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildFilterButton(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.black,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildGoalCard({
    required String date,
    required String time,
    required String title,
    required String description,
    required String category,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$date  |  $time",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(Icons.open_in_new, color: Colors.white),
              ],
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(height: 16),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                category,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
