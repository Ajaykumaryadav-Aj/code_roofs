// ignore_for_file: prefer_const_constructors

import 'package:code_roofs/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool isVipSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(2),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: isVipSelected
                    ? LinearGradient(
                        colors: const [
                          Color.fromRGBO(255, 244, 228, 1),
                          Color.fromRGBO(255, 255, 255, 1),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )
                    : LinearGradient(
                        colors: const [
                          Color.fromRGBO(255, 152, 210, 0.35),
                          Color.fromRGBO(255, 255, 255, 0)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: isVipSelected
                  ? LinearGradient(
                      colors: const [
                        Color.fromRGBO(255, 244, 228, 1),
                        Color.fromRGBO(255, 255, 255, 1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                    )
                  : LinearGradient(
                      colors: const [
                        Color.fromRGBO(255, 152, 210, 0.35),
                        Color.fromRGBO(255, 255, 255, 0)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                    )),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mixer",
                      style: GoogleFonts.onest(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(34, 36, 43, 1)),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Color.fromRGBO(179, 180, 183, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "Level Up Your Mixer Experience",
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: isVipSelected
                        ? Color.fromRGBO(94, 16, 83, 1)
                        : Color.fromRGBO(91, 55, 0, 1),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Select a plan",
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(110, 111, 115, 1),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildPlanCard(
                        top: 8,
                        imgurl: "assets/Frame 1171278649.png",
                        title: "Mixer",
                        price: "\$24.99",
                        priceColor: Color.fromRGBO(94, 16, 83, 1),
                        subtitle: "All of the below",
                        isSelected: !isVipSelected,
                        onTap: () {
                          setState(() {
                            isVipSelected = false;
                          });
                        },
                        borderColor: Color.fromRGBO(179, 1, 66, 0.31),
                        textColor: Colors.purple,
                        iconColor: Colors.purple,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildPlanCard(
                        imgurl: "assets/Frame 1171278648.png",
                        title: "Mixer VIP",
                        price: "\$99.99",
                        priceColor: Color.fromRGBO(161, 96, 0, 1),
                        subtitle: "All 3 + VIP seating,\nfood & beverages",
                        isSelected: isVipSelected,
                        onTap: () {
                          setState(() {
                            isVipSelected = true;
                          });
                        },
                        borderColor: Color.fromRGBO(255, 229, 190, 1),
                        textColor: Colors.amber[800]!,
                        iconColor: Colors.amber,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isVipSelected ? Colors.amber : Colors.purple,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildBenefit("Unlimited Likes"),
                          _buildBenefit("See who liked you"),
                          _buildBenefit("Find people with wide range"),
                          _buildBenefit("Access to events"),
                          if (isVipSelected)
                            _buildBenefit("VIP seating, food & beverages"),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -10,
                      right: 0,
                      left: 0,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: isVipSelected
                                  ? Colors.amber
                                  : Colors.purple,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Included with Mixer VIP",
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Color.fromRGBO(80, 82, 84, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: isVipSelected
                          ? LinearGradient(
                              colors: const [
                                Color.fromRGBO(213, 147, 49, 1),
                                Color.fromRGBO(169, 111, 24, 1),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            )
                          : LinearGradient(
                              colors: const [
                                Color.fromRGBO(136, 0, 120, 1),
                                Color.fromRGBO(229, 0, 4, 1),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          isVipSelected
                              ? Image.asset(
                                  "assets/Frame 1171278648.png",
                                  scale: 4,
                                )
                              : Image.asset(
                                  "assets/Frame 1171278649.png",
                                  scale: 4,
                                ),
                          SizedBox(width: 8),
                          Text(
                              isVipSelected
                                  ? "Continue – \$99.99 total"
                                  : "Continue – \$24.99 total",
                              style: GoogleFonts.manrope(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(255, 255, 255, 1))),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "By continuing, you agree to be charged with auto-renewal until canceled in App Store settings, under Mixer’s Terms.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(110, 111, 115, 1)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }






  Widget _buildPlanCard({
    required String title,
    required String price,
    required Color priceColor,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
    required Color borderColor,
    required Color textColor,
    required Color iconColor,
    required String imgurl,
    double? top,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? borderColor : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color.fromRGBO(34, 36, 43, 1),
                  ),
                ),
                Text(
                  price,
                  style: GoogleFonts.manrope(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: priceColor,
                  ),
                ),
                const SizedBox(height: 14),
                
                Padding(
                  padding: EdgeInsets.only(top: top ?? 0),
                  child: Text(
                    subtitle,
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(68, 70, 75, 1),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                right: 0,
                top: 0,
                child: Image.asset(
                  imgurl,
                  fit: BoxFit.contain,
                  scale: 5,
                )),
          ],
        ),
      ),
    );
  }






  Widget _buildBenefit(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(Icons.check,
              color: isVipSelected
                  ? Color.fromRGBO(187, 111, 0, 1)
                  : Color.fromRGBO(94, 16, 83, 1),
              size: 18),
          const SizedBox(width: 8),
          Text(
            text,
            style: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(68, 70, 75, 1)),
          ),
        ],
      ),
    );
  }
}


