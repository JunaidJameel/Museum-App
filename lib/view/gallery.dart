import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  final List<Map<String, String>> artData = const [
    {
      'title': 'Bear Brown',
      'description':
          'It is considered an archetypal masterpiece of the Ressance.',
      'image':
          'https://i.pinimg.com/736x/72/7d/76/727d766e034c73c86ccc173ad155423f.jpg'
    },
    {
      'title': 'Colback',
      'description': 'The most recognized man of artistic skills in game',
      'image':
          'https://i.pinimg.com/736x/46/42/8d/46428deafc947ae8bd40fa8f475b97f1.jpg'
    },
    {
      'title': 'The Starry Night',
      'description': 'One of the most recognized pieces of art in the world.',
      'image':
          'https://i.pinimg.com/736x/ef/67/5e/ef675e1f7a5c88b728d44b38ebf7c24f.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.darken),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu, color: Colors.white),
                    Text(
                      'Museum',
                      style: GoogleFonts.merriweather(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(CupertinoIcons.search, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              CarouselSlider.builder(
                itemCount: artData.length,
                itemBuilder: (context, index, realIndex) {
                  final item = artData[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/images/frame.png'),
                              fit: BoxFit.contain,
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.15,
                              vertical: 72,
                            ),
                            child: Image.network(
                              item['image']!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item['title']!,
                          style: GoogleFonts.dmSerifText(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            item['description']!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.dmSerifText(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.red,
                                    blurRadius: 10,
                                    offset: const Offset(0, 0),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.8,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.easeInOut,
                  autoPlayAnimationDuration: const Duration(milliseconds: 1200),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
