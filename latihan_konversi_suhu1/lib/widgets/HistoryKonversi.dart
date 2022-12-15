import 'package:flutter/material.dart';

class HistoryKonversi extends StatelessWidget {
  const HistoryKonversi({
    Key? key,
    required this.riwayat,
  }) : super(key: key);

  final List<String> riwayat;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: riwayat.length,
            itemBuilder: (context, index) {
              return Text(riwayat[index]);
            }));
  }
}
