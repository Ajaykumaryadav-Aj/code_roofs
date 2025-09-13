import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFiltered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 15,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Mixer",
            style: GoogleFonts.onest(
              fontSize: 24,
              color: const Color.fromRGBO(34, 36, 43, 1),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [
          Image.asset(
            "assets/flash-circle.png",
            height: 24,
            width: 24,
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none,
                color: Color.fromRGBO(94, 16, 83, 1)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        isFiltered = !isFiltered;
                      });
                    },
                    child: _buildFilterChip("Filters", true)),
                _buildFilterChip("Age"),
                _buildFilterChip("Height"),
                _buildFilterChip("Habits"),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 00,
                        right: 148,
                        child: _buildProfileCircle(
                          assetPath: "assets/Avatar.png",
                          bgColor: Colors.white38,
                          radius: 45,
                        ),
                      ),
                      Positioned(
                        left: 148,
                        right: 0,
                        child: _buildProfileCircle(
                          assetPath: "assets/Avatar (2).png",
                          bgColor: Colors.white38,
                          radius: 45,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 20,
                        child: _buildProfileCircle(
                          assetPath: "assets/Avatar (1).png",
                          bgColor: Colors.white38,
                          radius: 60,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  isFiltered
                      ? "You’ve seen them all"
                      : "You’ve seen everyone nearby",
                  style: GoogleFonts.manrope(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(34, 36, 43, 1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    isFiltered
                        ? "No more profiles match your filters. Update your preferences to find more people."
                        : "No more profiles in your area. Check back later or expand your location to see more people.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(110, 111, 115, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(94, 16, 83, 1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Adjust Location",
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),


      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF6A1B9A),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/Mixer.png",
                height: 35,
                width: 35,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/Iconography 2.png",
                height: 20,
                width: 20,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/g51.png",
                height: 20,
                width: 20,
              ),
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(Icons.remove_red_eye_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/profile-circle.png",
                height: 34,
                width: 34,
              ),
              label: ""),
        ],
      ),
    );
  }






  Widget _buildFilterChip(String text, [bool isActive = false]) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFFF3E5F5)
            : const Color.fromRGBO(248, 248, 248, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          if (text == "Filters")
            const Icon(Icons.tune, size: 16, color: Color(0xFF6A1B9A)),
          if (text == "Filters") const SizedBox(width: 4),
          Text(
            text,
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isActive ? const Color(0xFF6A1B9A) : Colors.black87,
            ),
          ),
          if (text != "Filters") ...[
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, size: 16),
          ],
        ],
      ),
    );
  }





  Widget _buildProfileCircle({
    required String assetPath,
    required Color bgColor,
    required double radius,
  }) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: radius,
        child: Image.asset(assetPath),
      ),
    );
  }
}
