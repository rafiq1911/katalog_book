import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog Buku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'AHMAD RAFIQ',
                    style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Katalog Buku',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Center(
              child: ListView(
                children: [
                  BookItem(title: 'Buku 1', context: context),
                  BookItem(title: 'Buku 2', context: context),
                  BookItem(title: 'Buku 3', context: context),
                  BookItem(title: 'Buku 4', context: context),
                  BookItem(title: 'Buku 5', context: context),
                ],
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookItem extends StatelessWidget {
  final String title;
  final BuildContext context;

  const BookItem({super.key, required this.title, required this.context});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookDetailPage(title: title)),
        );
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/rafiq.jpeg'), // Ganti dengan path foto Anda
            ),
            SizedBox(height: 20),
            Text('AHMAD RAFIQ', style: TextStyle(fontSize: 24)),
            Text('NIM: 22220497', style: TextStyle(fontSize: 18)),
            Text('Kelas: SI 5Q', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

class BookDetailPage extends StatelessWidget {
  final String title;

  const BookDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // Contoh data buku
    final bookDetails = {
      'Buku 1': {
        'image': 'assets/timun.jpeg', // Ganti dengan path gambar buku
        'judul': 'Timun Jelita',
        'pengarang': 'Raditya Dika',
        'tahun_terbit': '2024',
        'jumlah_halaman': '200',
        'sinopsis':
            'Setelah ayahnya meninggal dan mewariskan sebuah gitar tua, seorang akuntan berusia 40 tahun menemukan hasrat untuk kembali bermusik',
        'harga': 'Rp 66.000',
      },
      'Buku 2': {
        'image': 'assets/image3.jpg', // Ganti dengan path gambar buku
        'judul': 'The Psychology of Money',
        'pengarang': 'Morgan Housel',
        'tahun_terbit': '2020',
        'jumlah_halaman': '262',
        'sinopsis':
            'The Psychology of Money merupakan buku non-fiksi yang membahas cara mengelola keuangan dengan baik. Buku ini juga mengajarkan bagaimana perilaku manusia memengaruhi keputusan finansial.',
        'harga': 'Rp  229.000',
      },
      'Buku 3': {
        'image': 'assets/images.jpeg', // Ganti dengan path gambar buku
        'judul': 'One Piece',
        'pengarang': 'Eiichiro Oda',
        'tahun_terbit': '1997',
        'jumlah_halaman': '300',
        'sinopsis':
            'Tentang petualangan Monkey D. Luffy dan kru Bajak Laut Topi Jerami mencari harta karun legendaris One Piece',
        'harga': 'Rp 120.000',
      },
      'Buku 4': {
        'image': 'assets/download.jpeg', // Ganti dengan path gambar buku
        'judul': '3 Pocong Idiot',
        'pengarang': ' Al Izz Well',
        'tahun_terbit': '2012',
        'jumlah_halaman': '250',
        'sinopsis':
            'Buku ini mengisahkan tentang 3 pocong idiot yang memiliki karakter kocak dan lucu, sehingga membuat pembaca yang awalnya takut dengan pocong menjadi kehilangan rasa takutnya. Tokoh utama bernama Pocil digambarkan sangat konyol sehingga cerita dapat mengalir dengan lancar seperti air sungai.',
        'harga': 'Rp 90.000',
      },
      'Buku 5': {
        'image': 'assets/ubur.jpeg', // Ganti dengan path gambar buku
        'judul': 'Ubur Ubur Lembur',
        'pengarang': 'Raditya Dika',
        'tahun_terbit': '2018',
        'jumlah_halaman': '180',
        'sinopsis':
            ' buku tersebut, Radit menceritakan bahwa dari semua pekerjaan yang Ia jalani, menulis adalah pekerjaan yang paling Ia senangi.[1] Tetapi, seiring dengan kesibukannya di dunia hiburan, menulis menjadi sebuah kemewahan tersendiri bagi Radit. Sampai suatu ketika Ia bertemu seorang komedian dari Australia di acara Ubud Writers and Readers Festival.',
        'harga': 'Rp 110.000',
      },
    };

    final details = bookDetails[title] ?? {};

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(details['image'] ??
                'assets/timun.jpeg'), // Ganti dengan path gambar default jika tidak ada
            SizedBox(height: 10),
            Text('Judul: ${details['judul']}', style: TextStyle(fontSize: 18)),
            Text('Pengarang: ${details['pengarang']}',
                style: TextStyle(fontSize: 18)),
            Text('Tahun Terbit: ${details['tahun_terbit']}',
                style: TextStyle(fontSize: 18)),
            Text('Jumlah Halaman: ${details['jumlah_halaman']}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Sinopsis: ${details['sinopsis']}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Harga: ${details['harga']}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
