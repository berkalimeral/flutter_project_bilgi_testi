import 'package:flutter/material.dart';
import 'package:flutter_youtube_bilgi_testi/sorular_cevaplar.dart';
import 'constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> moods = [];

  SorularCevaplar sorularCevaplar_1 = SorularCevaplar();

  void butonFonksiyonu(bool secilenButon) {
    if (sorularCevaplar_1.testBittiMi() == true) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Test Bitti!"),
            content: Text("Teste Tekrar Başlamak İster Misiniz?"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      sorularCevaplar_1.testiSifirla();
                      moods = [];
                    });
                  },
                  child: Text("Başa Dön")),
              // FlatButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     child: Text("Hayır")),
            ],
          );
        },
      );
    }

    setState(() {
      bool dogruYanit = sorularCevaplar_1.getYanit();
      if (dogruYanit == secilenButon) {
        moods.add(kDogruIconu);
      } else {
        moods.add(kYanlisIconu);
      }
      sorularCevaplar_1.sonrakiSoru();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                sorularCevaplar_1.getSoru(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          children: moods,
          spacing: 7.0,
          runSpacing: 7.0,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.red[400],
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        butonFonksiyonu(false);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.green[400],
                      child: Icon(Icons.thumb_up, size: 30.0),
                      onPressed: () {
                        butonFonksiyonu(true);
                      },
                    ),
                  ),
                ),
                // Expanded(
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 6),
                //     child: RaisedButton(
                //       padding: EdgeInsets.all(12),
                //       textColor: Colors.white,
                //       color: Colors.green[400],
                //       child: Icon(Icons.thumb_, size: 30.0),
                //       onPressed: () {
                //         setState(() {
                //           moods.add(kDogruIconu);
                //         });
                //       },
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
