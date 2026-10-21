import 'package:flutter/material.dart';

void main() => runApp(const TaxiDriverApp());

const taxiYellow = Color(0xFFFFC107);
const taxiBlack = Color(0xFF101010);
const taxiPanel = Color(0xFF1D1D1D);

class TaxiDriverApp extends StatelessWidget {
  const TaxiDriverApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Hosur City Best Taxi Driver',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: taxiBlack,
      colorScheme: ColorScheme.fromSeed(seedColor: taxiYellow, brightness: Brightness.dark),
      appBarTheme: const AppBarTheme(backgroundColor: taxiBlack, foregroundColor: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
        backgroundColor: taxiYellow, foregroundColor: taxiBlack, minimumSize: const Size.fromHeight(50),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      )),
    ),
    home: const DriverHome(),
  );
}

class DriverHome extends StatefulWidget {
  const DriverHome({super.key});
  @override
  State<DriverHome> createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {
  bool online = false;
  void message(String value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('HOSUR CITY', style: TextStyle(fontSize: 12, letterSpacing: 2)),
      Text('BEST TAXI DRIVER', style: TextStyle(color: taxiYellow, fontWeight: FontWeight.w900)),
    ])),
    body: SafeArea(child: ListView(padding: const EdgeInsets.all(20), children: [
      Container(padding: const EdgeInsets.all(22), decoration: BoxDecoration(color: taxiPanel, borderRadius: BorderRadius.circular(22)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Icon(Icons.local_taxi, color: taxiYellow, size: 40),
          const SizedBox(height: 12),
          const Text('Welcome, Driver', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
          const SizedBox(height: 6),
          const Text('Manage your availability and trip requests.', style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              setState(() => online = !online);
              message('Demo status only. Backend and background location not connected.');
            },
            icon: Icon(online ? Icons.pause_circle : Icons.play_circle),
            label: Text(online ? 'GO OFFLINE' : 'GO ONLINE'),
          ),
        ]),
      ),
      const SizedBox(height: 24),
      const Text('NEW BOOKING REQUESTS', style: TextStyle(color: taxiYellow, fontWeight: FontWeight.bold, letterSpacing: 1)),
      const SizedBox(height: 12),
      Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: taxiPanel, borderRadius: BorderRadius.circular(18)),
        child: const Column(children: [
          Icon(Icons.inbox_outlined, size: 38, color: Colors.white54),
          SizedBox(height: 10),
          Text('No active requests yet', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text('Customer bookings will appear here after the shared backend is connected.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white60)),
        ]),
      ),
      const SizedBox(height: 14),
      ElevatedButton(onPressed: () => message('Backend not connected yet.'), child: const Text('ACCEPT REQUEST (DEMO)')),
      const SizedBox(height: 10),
      OutlinedButton(onPressed: () => message('Trip status actions will be connected to backend.'), child: const Text('START / COMPLETE TRIP')),
      const SizedBox(height: 20),
      const Text('Driver app • Premium black & yellow', textAlign: TextAlign.center, style: TextStyle(color: Colors.white38, fontSize: 12)),
    ])),
  );
}
