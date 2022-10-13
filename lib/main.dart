import 'package:flutter/material.dart';

class Stavka {
  final String naslov, opis;
  const Stavka(this.naslov, this.opis);
}

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Primjer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: StavkasScreen(
        stavke: List.generate(
          3,
          (i) => Stavka('Stavka ${i + 1}', "Opis ${i + 1}. stavke"),
        ),
      ),
    ),
  );
}

class StavkasScreen extends StatelessWidget {
  const StavkasScreen({super.key, required this.stavke});
  final List<Stavka> stavke;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prosljedivanja Podataka izmedu widgeta'),
      ),
      body: ListView.builder(
        itemCount: stavke.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(stavke[index].naslov),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(stavka: stavke[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.stavka});
  final Stavka stavka;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stavka.naslov),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(stavka.opis),
      ),
    );
  }
}
