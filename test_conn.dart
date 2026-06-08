import 'dart:io';
import 'dart:convert';

void main() async {
  final ports = [52668, 52674, 52675];
  for (var port in ports) {
    try {
      final client = HttpClient();
      final request = await client.getUrl(Uri.parse('http://localhost:$port/json'));
      final response = await request.close();
      final body = await response.transform(utf8.decoder).join();
      print('Port $port (/json) success:');
      print(body.substring(0, body.length > 500 ? 500 : body.length));
    } catch (e) {
      print('Port $port (/json) failed: $e');
    }
  }
}
