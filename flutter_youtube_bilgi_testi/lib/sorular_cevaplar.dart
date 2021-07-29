import 'package:flutter_youtube_bilgi_testi/soru.dart';

class SorularCevaplar {
  int _sayac = 0;

  List<Soru> _sorularVeCevaplar = [
    Soru(
        sorular: "Hanefilik İslam dininde sünni bir mezheptir", yanitlar: true),
    Soru(sorular: "İstanbul 14. yüzyılda fethedilmiştir", yanitlar: false),
    Soru(
        sorular: "Dinozorlarla insanlar aynı anda yeryüzünde bulunmamıştır",
        yanitlar: true),
    Soru(sorular: "Kanada'nın başkenti Toronto'dur", yanitlar: false),
    Soru(sorular: "Twitter'da karakter sınırı 280'dir", yanitlar: true),
    Soru(sorular: "Isı termometre ile ölçülür", yanitlar: false),
    Soru(
        sorular: "İrlanda Cumhuriyeti Birleşik Krallık'ın bir parçasıdır",
        yanitlar: false),
    Soru(
        sorular: "Dünyadaki tavuk sayısı insan sayısından fazladır",
        yanitlar: true)
  ];

  String getSoru() {
    return _sorularVeCevaplar[_sayac].sorular;
  }

  bool getYanit() {
    return _sorularVeCevaplar[_sayac].yanitlar;
  }

  void sonrakiSoru() {
    if (_sayac + 1 < _sorularVeCevaplar.length) {
      _sayac++;
    }
  }

  bool testBittiMi() {
    if (_sayac + 1 >= _sorularVeCevaplar.length) {
      return true;
    }
    return false;
  }

  void testiSifirla() {
    _sayac = 0;
  }
}
