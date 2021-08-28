import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData({currencyBase = 'BTC', currencyQuote = 'AUD'}) async {
    final response = await http.get(
      Uri.parse(
          'https://rest.coinapi.io/v1/exchangerate/$currencyBase/$currencyQuote'),
      headers: <String, String>{
        'X-CoinAPI-Key': '729831F7-9526-406C-A265-595C900079F6',
      },
    );

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw Exception('Problem with the get request');
    }
  }
}
