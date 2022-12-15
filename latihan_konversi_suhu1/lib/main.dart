import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latihan_konversi_suhu1/widgets/DaftarSuhu.dart';
import 'package:latihan_konversi_suhu1/widgets/HistoryKonversi.dart';
import 'package:latihan_konversi_suhu1/widgets/InputSuhu.dart';
import 'package:latihan_konversi_suhu1/widgets/KonversiButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController text1 = TextEditingController();
  double kelvin = 0, reamor = 0, input = 0;
  double hasil = 0;

  String selctDropdown = "Reamur";
  List<String> listSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  List<String> History = [];

  void onDropChange(Object? value) {
    return setState(() {
      selctDropdown = value.toString();
      //Jika Click SelectDropDown akan langsung menampilkan hasilnya di Daftar History
      if (text1.text.isNotEmpty) {
        switch (selctDropdown) {
          case "Kelvin":
            hasil = int.parse(text1.text) + 273;

            break;

          case "Reamur":
            hasil = int.parse(text1.text) * 4 / 5;
            break;

          case "Fahrenheit":
            hasil = int.parse(text1.text) * 9 / 5 + 32;
            break;
          default:
        }
        History.add("konversi Dari " +
            text1.text +
            " Celcius Ke " +
            selctDropdown +
            " Dengan Hasil " +
            hasil.toString());
      }
    });
  }

  void Konversi() {
    return setState(() {
      if (text1.text.isNotEmpty) {
        switch (selctDropdown) {
          case "Kelvin":
            hasil = int.parse(text1.text) + 273;

            break;

          case "Reamur":
            hasil = int.parse(text1.text) * 4 / 5;
            break;

          case "Fahrenheit":
            hasil = int.parse(text1.text) * 9 / 5 + 32;
            break;
          default:
        }
        History.add("konversi Dari " +
            text1.text +
            " Celcius Ke " +
            selctDropdown +
            " Dengan Hasil " +
            hasil.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('11 - 3B - Diajeng Nidzom')),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Column(
            children: [
              InputSuhu(text1: text1),
              DaftarSuhu(
                selctDropdown: selctDropdown,
                listSuhu: listSuhu,
                onDropChange: onDropChange,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Hasil',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Text(
                "$hasil",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 30,
              ),
              KonversiButton(
                Kversi: Konversi,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "History Konversi ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              HistoryKonversi(riwayat: History)
            ],
          ),
        ),
      ),
    );
  }
}
