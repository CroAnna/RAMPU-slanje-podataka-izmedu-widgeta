import 'package:flutter/material.dart';

class Stavka {
  final String naslov, opis;
  const Stavka(this.naslov, this.opis);
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: StavkaPage(
        stavke: List.generate(
          3,
          (i) => Stavka('Stavka ${i + 1}', "Opis ${i + 1}. stavke"),
        ),
      ),
    ),
  );
}

class StavkaPage extends StatelessWidget {
  const StavkaPage({super.key, required this.stavke});
  final List<Stavka> stavke;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prosljeđivanje podataka'),
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
                  builder: (context) => DetaljiPage(stavka: stavke[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetaljiPage extends StatelessWidget {
  const DetaljiPage({super.key, required this.stavka});
  final Stavka stavka;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(stavka.naslov),
        ),
        body: Text(stavka.opis));
  }
}
