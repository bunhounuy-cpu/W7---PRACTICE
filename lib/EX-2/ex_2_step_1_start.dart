import 'package:flutter/material.dart';

enum Item {
  flutter(
    title: 'Flutter',
    description: 'A framework for building multi-platform apps.',
    isFavorite: true,
  ),
  dart(
    title: 'Dart',
    description: 'Client-optimized language for fast apps on any platform.',
    isFavorite: false,
  ),
  react(
    title: 'React',
    description: 'A JavaScript library for building user interfaces.',
    isFavorite: true,
  );

  final String title;
  final String description;
  final bool isFavorite;

  const Item({
    required this.title,
    required this.description,
    required this.isFavorite,
  });
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          FavoriteCard(
            title: Item.flutter.title,
            description: Item.flutter.description,
            isFavorite: Item.flutter.isFavorite,
          ),
          FavoriteCard(
            title: Item.dart.title,
            description: Item.dart.description,
            isFavorite: Item.dart.isFavorite,
          ),
          FavoriteCard(
            title: Item.react.title,
            description: Item.react.description,
            isFavorite: Item.react.isFavorite,
          ),
        ],
      ),
    ),
  ),
);

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;
  final bool isFavorite;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.isFavorite,
  });

  @override
  State<StatefulWidget> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void toggleFavorite() {
    setState(() {
      _isFavorite = _isFavorite ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.blue[500],
                  ),
                ),
                const SizedBox(height: 10),
                Text(widget.description),
              ],
            ),
          ),
          IconButton(
            onPressed: toggleFavorite,
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
