// import 'dart:convert';
// import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:http/io_client.dart';
// import 'package:intl/date_symbol_data_file.dart';
// import 'package:mobilemols/screens/home.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'package:splashscreen/splashscreen.dart';

// String urls = "https://aparus.bontangkota.go.id/api/auth";
// String urlUpload = "http://aparus.bontangkota.go.id/";
// String dd;

// var token;
// var otp;
// var role;
// var name;
// var fcm;
// var email;
// var firstCamera;
// var datebayar;
// var bulanbayar;
// var tahunbayar;
// // ignore: unused_element

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

// void main() async {
//   HttpOverrides.global = new MyHttpOverrides();
//   WidgetsFlutterBinding.ensureInitialized();
//   // final cameras = await availableCameras();

//   // Get a specific camera from the list of available cameras.
//   // firstCamera = cameras.first;
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   token = prefs.get('Token');
//   otp = prefs.get('Otp');
//   name = prefs.get('Name');
//   email = prefs.get('Email');
//   role = prefs.get('Role');

//   // await FlutterDownloader.initialize(debug: debug);
//   // initializeDateFormatting('id_ID', null).then((_) =>
//   runApp(MyApp());
//   configLoading();
// }

// void configLoading() {
//   EasyLoading.instance
//     ..displayDuration = const Duration(milliseconds: 20)
//     ..indicatorType = EasyLoadingIndicatorType.fadingCube
//     ..loadingStyle = EasyLoadingStyle.custom
//     ..indicatorSize = 45.0
//     ..radius = 10.0
//     ..progressColor = Colors.blue
//     ..backgroundColor = Colors.white.withOpacity(0.2)
//     ..indicatorColor = Colors.blue
//     ..textColor = Colors.blue
//     ..maskColor = Colors.blue.withOpacity(0.5)
//     ..userInteractions = true;
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
//   List listiuran;
//   List sisaiuran = [];

//   // Future<http.Response> iuran() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   Map<String, String> headers = {
//   //     'Content-Type': 'application/x-www-form-urlencoded',
//   //     "Accept": "application/JSON",
//   //     HttpHeaders.authorizationHeader: prefs.get('Token')
//   //   };

//   //   http.Response hasil =
//   //       await http.get(Uri.decodeFull(urls + '/pembayaranuser'),
//   //           // body: {
//   //           //   "user_id": prefs.get('Id'),
//   //           // },
//   //           headers: headers);
//   //   listiuran = json.decode(hasil.body);
//   //   print(listiuran);
//   //   setState(() {
//   //     for (var a = 0; a < listiuran.length; a++) {
//   //       if (listiuran[a]['status'] == 'belumterbayar') {
//   //         print(listiuran[a]);
//   //         // sisaiuran.add(a);
//   //         sisaiuran.add({'index': a, 'data': listiuran[a]});
//   //       }
//   //     }
//   //     bulanbayar = sisaiuran[0]['data']['bulan'];
//   //     tahunbayar = sisaiuran[0]['data']['tahun'];
//   //     datebayar = DateTime(
//   //         sisaiuran[0]['data']['tahun'], sisaiuran[0]['data']['bulan'], 10);
//   //     print(datebayar);
//   //     print('sisa: ' + sisaiuran.toString());
//   //   });
//   //   return Future.value(hasil);
//   // }

//   @override
//   void initState() {
//     super.initState();
//     // iuran();
//     // firebaseMessaging.getToken().then((token) {
//     //   print('fcm : ' + token);
//     //   fcm = token;
//     // });
//     // initDownloadsDirectoryState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initDownloadsDirectoryState() async {
//     Directory downloadsDirectory;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     // try {
//     //   downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
//     // } on PlatformException {
//     //   print('Could not get the downloads directory');
//     // }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       dd = downloadsDirectory.path;
//     });
//   }

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//         providers: [
//           // ChangeNotifierProvider.value(
//           //   value: ProfilModel(),
//           // ),
//           // ChangeNotifierProvider.value(
//           //   value: RiwayatModel(),
//           // ),
//           // ChangeNotifierProvider.value(
//           //   value: BerandaModel(),
//           // ),
//           // ChangeNotifierProvider.value(
//           //   value: PetugasBerandaModel(),
//           // ),
//           // ChangeNotifierProvider.value(
//           //   value: LaporanModel(),
//           // ),
//         ],
//         child: MaterialApp(
//             title: 'Flutter Demo',
//             theme: ThemeData(
//               primarySwatch: Colors.indigo,
//               visualDensity: VisualDensity.adaptivePlatformDensity,
//             ),
//             // builder: (BuildContext context, Widget child) {
//             //   return FlutterEasyLoading(
//             //       child: GestureDetector(
//             //     onTap: () {
//             //       FocusScopeNode currentFocus = FocusScope.of(context);
//             //       if (!currentFocus.hasPrimaryFocus) {
//             //         currentFocus.unfocus();
//             //       }
//             //     },
//             //     child: child,
//             //   ));
//             // },
//             home: new HomePage()));

//     // home: new Splash()));
//   }
// }

// class Splash extends StatefulWidget {
//   @override
//   _SplashState createState() => new _SplashState();
// }

// class _SplashState extends State<Splash> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(token);
//     return new SplashScreen(
//         seconds: 3,
//         // navigateAfterSeconds: token == null ? new Login() : BottomNavBar(),
//         title: new Text(
//           '',
//           style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//         ),
//         image: new Image.asset('assets/rusun.png'),
//         backgroundColor: Colors.white,
//         styleTextUnderTheLoader: new TextStyle(),
//         photoSize: 100.0,
//         onClick: () => print("Flutter Egypt"),
//         loaderColor: Colors.blue[900]);
//   }
// }

// class Homepage extends StatefulWidget {
//   @override
//   _HomepageState createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage>
//     with SingleTickerProviderStateMixin {
//   final GlobalKey<ScaffoldState> _homepageKey = new GlobalKey<ScaffoldState>();

//   var gold = Color.fromRGBO(
//     212,
//     175,
//     55,
//     2,
//   );

//   Future<void> _getToken() async {
//     setState(() async {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       email = prefs.get('Email');
//       token = prefs.get('Token');
//       role = prefs.get('Role');
//     });
//     print(role);
//   }

//   @override
//   void initState() {
//     super.initState();
//     _getToken();
//   }

//   TabController controller;
//   int _currentIndex = 0;

//   final List<Widget> _children = [
//     // BerandaPage(),
//     // BerandaPage(),
//     // BerandaPage(),

//     // login == false
//     //     ? Home()
//     //     : role == 'driver'
//     //         ? DriverHomeDetail()
//     //         : role == 'agen' ? AgenHomeDetail() : UserHomeDetail(),
//     // email == null ? Login() : role == 'agen' ? ChartAgen() : ChartCustomer(),
//     // email == null ? Login() : Profile(),
//     // TalkService()
//   ];

//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _homepageKey,
//       body: _children[_currentIndex], // new
//       bottomNavigationBar: BottomNavigationBar(
//         iconSize: 20,
//         type: BottomNavigationBarType.fixed,
//         elevation: 2.0,
//         backgroundColor: Colors.lightBlue[300],
//         onTap: onTabTapped, // new
//         currentIndex: _currentIndex, // new
//         items: [
//           new BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//             ),
//             backgroundColor: gold,
//             title: Text('Beranda',
//                 style: TextStyle(color: Colors.green[350], fontSize: 10)),
//           ),
//           new BottomNavigationBarItem(
//             icon: Icon(
//               Icons.history,
//               // color: Colosrs.green[350],
//             ),
//             title: Text('Riwayat',
//                 style: TextStyle(color: Colors.green[350], fontSize: 10)),
//           ),
//           new BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person,
//               // color: Colors.green[350],
//             ),
//             title: Text('Profile',
//                 style: TextStyle(color: Colors.green[350], fontSize: 10)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BottomNavBar extends StatefulWidget {
//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int _page = 0;
//   GlobalKey _bottomNavigationKey = GlobalKey();
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       new FlutterLocalNotificationsPlugin();
//   List listiuran;
//   List sisaiuran = [];

//   Future<http.Response> iuran() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     Map<String, String> headers = {
//       'Content-Type': 'application/x-www-form-urlencoded',
//       "Accept": "application/JSON",
//       HttpHeaders.authorizationHeader: prefs.get('Token')
//     };
//     final ioc = new HttpClient();
//     ioc.badCertificateCallback =
//         (X509Certificate cert, String host, int port) => true;
//     final http = new IOClient(ioc);
//     var hasil = await http.get(Uri.decodeFull(urls + '/pembayaranuser'),
//         // body: {
//         //   "user_id": prefs.get('Id'),
//         // },
//         headers: headers);
//     listiuran = json.decode(hasil.body);
//     print(listiuran);
//     setState(() {
//       for (var a = 0; a < listiuran.length; a++) {
//         if (listiuran[a]['status'] == 'belumterbayar') {
//           print(listiuran[a]);
//           // sisaiuran.add(a);
//           sisaiuran.add({'index': a, 'data': listiuran[a]});
//         }
//       }
//       bulanbayar = sisaiuran[0]['data']['bulan'];
//       tahunbayar = sisaiuran[0]['data']['tahun'];
//       datebayar = DateTime(
//           sisaiuran[0]['data']['tahun'], sisaiuran[0]['data']['bulan'], 10);
//       print(datebayar);
//       print('sisa: ' + sisaiuran.toString());
//     });
//     return Future.value(hasil);
//   }

//   Future<void> _getToken() async {
//     setState(() async {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       email = prefs.get('Email');
//       token = prefs.get('Token');
//       role = prefs.get('Role');
//     });
//     print(role);
//   }

//   @override
//   void initState() {
//     // iuran();
//     var initializationSettingsAndroid =
//         new AndroidInitializationSettings('@mipmap/ic_launcher');
//     var initializationSettingsIOS = new IOSInitializationSettings();
//     var initializationSettings = new InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);
//     _firebaseMessaging.configure(
//       onMessage: (Map<String, dynamic> message) async {
//         print("onMessage: $message");
//         // _showItemDialog(message);
//         showNotification(
//             message['notification']['title'], message['notification']['body']);
//       },
//       onLaunch: (Map<String, dynamic> message) async {
//         print("onLaunch: $message");
//         showNotification(
//             message['notification']['title'], message['notification']['body']);
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print("onResume: $message");
//         // _navigateToItemDetail(message);
//         showNotification(
//             message['notification']['title'], message['notification']['body']);
//         _navigateToItemDetail(message);
//       },
//     );
//     super.initState();
//     _getToken();
//   }

//   void _navigateToItemDetail(Map<String, dynamic> message) {
//     // final Item item = _itemForMessage(message);
//     // Clear away dialogs
//     // Navigator.popUntil(context, (Route<dynamic> route) => route is PageRoute);
//     // if (!item.route.isCurrent) {
//     //   Navigator.push(context, item.route);
//     // }
//     if (message['notification']['data']['screen'] == 'detaildo') {
//       // Navigator.push(
//       //     context, MaterialPageRoute(builder: (context) => DoApproveAgen()));
//     }
//     // Navigator.push(
//     //     context, MaterialPageRoute(builder: (context) => DoApproveAgen()));
//   }

//   Future onSelectNotification(String payload) async {
//     // Navigator.push(
//     //     context, MaterialPageRoute(builder: (context) => DoApproveAgen()));
//     // showDialog(
//     //   context: context,
//     //   builder: (_) {
//     //     return new AlertDialog(
//     //       title: Text("PayLoad"),
//     //       content: Text("Payload : $payload"),
//     //     );
//     // },
//     // );
//   }

//   void showNotification(String title, String body) async {
//     await _demoNotification(title, body);
//   }

//   Future<void> _demoNotification(String title, String body) async {
//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//         'channel_ID', 'channel name', 'channel description',
//         importance: Importance.max,
//         playSound: true,
//         // sound: '',
//         showProgress: true,
//         priority: Priority.high,
//         ticker: 'test ticker');

//     var iOSChannelSpecifics = IOSNotificationDetails();
//     var platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iOSChannelSpecifics,
//     );
//     await flutterLocalNotificationsPlugin
//         .show(0, title, body, platformChannelSpecifics, payload: 'test');
//   }

//   // final List<Widget> _children = [
//   //   role == 'member' ? BerandaPage() : PetugasBerandaPage(),
//   //   role == 'member' ? RiwayatPage() : LaporanPage(),
//   //   ProfilePage(),
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         //   bottomNavigationBar: CurvedNavigationBar(
//         //     key: _bottomNavigationKey,
//         //     index: 0,
//         //     height: 60.0,
//         //     items: <Widget>[
//         //       Icon(
//         //         Icons.home,
//         //         size: 30,
//         //         color: Colors.white,
//         //       ),
//         //       // Icon(Icons.list, size: 30),
//         //       Icon(
//         //         Icons.history,
//         //         size: 30,
//         //         color: Colors.white,
//         //       ),
//         //       // Icon(
//         //       //   Icons.filter_9_plus,
//         //       //   size: 30,
//         //       //   color: Colors.white,
//         //       // ),
//         //       Icon(
//         //         Icons.perm_identity,
//         //         size: 30,
//         //         color: Colors.white,
//         //       ),
//         //     ],
//         //     color: Colors.lightBlue[400],
//         //     buttonBackgroundColor: Colors.lightBlue[400],
//         //     backgroundColor: Colors.white,
//         //     animationCurve: Curves.easeInOut,
//         //     animationDuration: Duration(milliseconds: 600),
//         //     onTap: (index) {
//         //       setState(() {
//         //         _page = index;
//         //       });
//         //     },
//         //   ),
//         //   body: _children[_page],
//         );
//   }
// }

// const List<Color> gradients = [
//   Color(0xFF0EDED2),
//   Color(0xFF03A0FE),
// ];

// const List<Color> signUpGradients = [
//   Color(0xFFFF9945),
//   Color(0xFFFc6076),
// ];

// const List<Color> purpless = [
//   Color(0xFF107a1c),
//   Color(0xFF216b2a),
//   Color(0xFF33c744),
// ];
import 'package:flutter/material.dart';
import 'package:mobilemols/screens/dosen/home_dosen.dart';
import 'package:mobilemols/screens/dosen/list_kelas_dosen.dart';
import 'package:mobilemols/screens/dosen/profileDosen.dart';
import 'package:mobilemols/screens/home.dart';
import 'package:mobilemols/screens/kelas.dart';
import 'package:mobilemols/screens/login.dart';
import 'package:mobilemols/screens/profile.dart';
import 'package:mobilemols/screens/widgets/appbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class TabHome extends StatefulWidget {
  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.blue,
              bottomOpacity: 0.0,
              elevation: 0.0,
              shadowColor: Colors.blue,
              title: TabBar(
                indicatorPadding: EdgeInsets.all(0),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.person),
                        Text('Profil'),
                      ],
                    )),
                  ),
                  Tab(
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.home),
                        Text('Beranda'),
                      ],
                    )),
                  ),
                  Tab(
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.meeting_room),
                        Text('Kelas'),
                      ],
                    )),
                  ),
                ],
              )),
          body: Stack(
            children: [
              CustomAppbar(),
              TabBarView(
                children: [Profile(), HomePage(), ListKelas()],
              ),
            ],
          ),
        ));
  }
}

class TabHomeDosen extends StatefulWidget {
  @override
  _TabHomeDosenState createState() => _TabHomeDosenState();
}

class _TabHomeDosenState extends State<TabHomeDosen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.blue,
              bottomOpacity: 0.0,
              elevation: 0.0,
              shadowColor: Colors.blue,
              title: TabBar(
                indicatorPadding: EdgeInsets.all(0),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.person),
                        Text('Profil'),
                      ],
                    )),
                  ),
                  Tab(
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.home),
                        Text('Beranda'),
                      ],
                    )),
                  ),
                  Tab(
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.meeting_room),
                        Text('Kelas'),
                      ],
                    )),
                  ),
                ],
              )),
          body: Stack(
            children: [
              CustomAppbar(),
              TabBarView(
                children: [ProfileDosen(), HomeDosen(), ListKelasDosen()],
              ),
            ],
          ),
        ));
  }
}
