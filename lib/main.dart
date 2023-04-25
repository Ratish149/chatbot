import 'package:capstone/chatPage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: const Color.fromRGBO(6, 80, 163, 1),
    ),
    home: ChatApp(),
  ));
}

class ChatApp extends StatefulWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  State<ChatApp> createState() => _ChatAppState();
}

void _urlLauncher(int value) async {
  String url = "";
  if (value == 1) {
    url = "https://www.padmashreecollege.edu.np/";
  } else if (value == 2) {
    url =
        "https://www.google.com/maps/place/Padmashree+Int'l+College/@27.6876044,85.3480365,15z/data=!4m6!3m5!1s0x39eb190fffffffcf:0xcd79fd6c4087f48d!8m2!3d27.6876044!4d85.3480365!16s%2Fg%2F11f154hn9g";
  } else if (value == 3) {
    url = "https://www.padmashreecollege.edu.np/news-updates";
  } else if (await canLaunchUrlString(url)) {
    await launchUrlString(
      url,
      mode: LaunchMode.inAppWebView,
    );
  } else {
    throw "Could not Launch $url";
  }
}

class _ChatAppState extends State<ChatApp> {
  final List<String> imageList = [
    "https://scontent.fktm10-1.fna.fbcdn.net/v/t39.30808-6/337290702_754805636223091_6880281911957204206_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=Njg39wYlwTYAX-slDib&_nc_ht=scontent.fktm10-1.fna&oh=00_AfBtVHyZ1BpHI6z0_Z8kxVUf36dOKKGDYXlCo52XBUUbsg&oe=6427BFF3",
    "https://scontent.fktm10-1.fna.fbcdn.net/v/t39.30808-6/321492308_1216800388913770_9133888016634999538_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=8nENSEcA7UAAX_ArBHa&_nc_ht=scontent.fktm10-1.fna&oh=00_AfCVkGAY90Sjr_9jWoCRQKcDGdKjvMDPs7AexnpyOZ8QtQ&oe=6426BBB4",
    "https://www.padmashreecollege.edu.np/uploads/albums/cover/1667873257.jpg",
    "https://www.padmashreecollege.edu.np/uploads/albums/cover/1662720759.jpg",
    "https://www.padmashreecollege.edu.np/uploads/event/1664366038.jpg",
    "https://scontent.fktm10-1.fna.fbcdn.net/v/t39.30808-6/337522523_1599480117240161_2043319741519612757_n.jpg?stp=c34.0.206.206a_dst-jpg_p206x206&_nc_cat=101&ccb=1-7&_nc_sid=da31f3&_nc_ohc=qVA0PJqi4fAAX_NeMxf&_nc_ht=scontent.fktm10-1.fna&oh=00_AfDKpakWJR2_VSY7R4jRbCLkpsQlCTvutYPYSjpuUgS52A&oe=6426A188"
  ];
  Widget _PCcard(int value) {
    String url = "";
    if (value == 1) {
      url =
          "https://www.padmashreecollege.edu.np/uploads/program/1667268639.jpg";
    } else if (value == 2) {
      url =
          "https://www.padmashreecollege.edu.np/uploads/program/1671009171.jpg";
    } else if (value == 3) {
      url =
          "https://www.padmashreecollege.edu.np/uploads/program/1667267739.jpg";
    } else if (value == 4) {
      url =
          "https://www.padmashreecollege.edu.np/uploads/program/1667267556.jpg";
    }
    return Card(
      child: Image.network(
        url,
        fit: BoxFit.fill,
        width: 150.0,
        height: 150.0,
      ),
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0,
      ),
    );
  }

  Widget _PCdetail(String degree, String affiliate, int value) {
    return SizedBox(
      width: double.infinity,
      height: 130.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                degree,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                width: 135.0,
                child: Divider(),
              ),
              Text(affiliate),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Assistant'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Chat()));
              },
              child: const Icon(
                Icons.help,
                size: 25.0,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Padmashree College"),
              accountEmail: const Text("padmashree college.com"),
              currentAccountPicture: CircleAvatar(
                child: Image.asset('assets/logo.png'),
              ),
            ),
            ListTile(
              title: const Text("Padmashree Site"),
              trailing: const Icon(Icons.web),
              onTap: () {
                _urlLauncher(1);
              },
            ),
            const Divider(
              color: Colors.pink,
            ),
            ListTile(
              title: const Text("Padmashree Location"),
              trailing: const Icon(Icons.map),
              onTap: () {
                _urlLauncher(2);
              },
            ),
            const Divider(
              color: Colors.pink,
            ),
            ListTile(
              title: const Text("News & Updates"),
              trailing: const Icon(Icons.web),
              onTap: () {
                _urlLauncher(3);
              },
            ),
            const Divider(
              color: Colors.pink,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 40.0),
        children: [
          Center(
            child: CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
              items: imageList
                  .map(
                    (e) => ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            e,
                            width: 1050.0,
                            height: 350.0,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const Divider(height: 58.0),
          _PCcard(1),
          _PCdetail("Bachelor of Computer Application [BCA]",
              "Tribhuvan University (TU)", 1),
          _PCcard(2),
          _PCdetail("Bachelor of Food Technology [B.Tech Food]",
              "Tribhuvan University (TU)", 2),
          _PCcard(3),
          _PCdetail("Bachelor in Business and Hospitality Management [BABHM]",
              "Nilai University (NU)", 3),
          _PCcard(4),
          _PCdetail("Bachelor in Information Technology [BIT]",
              "Nilai University (NU)", 4),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.chat),
        label: const Text("Chat"),
        tooltip: 'Connect To Assistant',
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Chat()));
        },
      ),
    );
  }
}
