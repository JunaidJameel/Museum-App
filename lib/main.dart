import 'package:art_gallery/view/gallery.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FancyGalleryApp());

class FancyGalleryApp extends StatelessWidget {
  const FancyGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fancy Art Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const GalleryScreen(),
    );
  }
}
