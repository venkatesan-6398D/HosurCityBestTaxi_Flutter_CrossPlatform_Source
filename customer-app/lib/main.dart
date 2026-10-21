import 'package:flutter/material.dart';

void main() => runApp(const TaxiCustomerApp());

const taxiYellow = Color(0xFFFFC107);
const taxiBlack = Color(0xFF101010);
const taxiPanel = Color(0xFF1D1D1D);

class TaxiCustomerApp extends StatelessWidget {
  const TaxiCustomerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hosur City Best Taxi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: taxiBlack,
        colorScheme: ColorScheme.fromSeed(seedColor: taxiYellow, brightness: Brightness.dark),
        appBarTheme: const AppBarTheme(backgroundColor: taxiBlack, foregroundColor: Colors.white),
        inputDecorationTheme: InputDecorationTheme(
          filled: true, fillColor: taxiPanel,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: taxiYellow)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
          backgroundColor: taxiYellow, foregroundColor: taxiBlack, minimumSize: const Size.fromHeight(52),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        )),
      ),
      home: const CustomerHome(),
    );
  }
}

class CustomerHome extends StatefulWidget {
  const CustomerHome({super.key});
  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  final pickup = TextEditingController();
  final drop = TextEditingController();

  @override
  void dispose() { pickup.dispose(); drop.dispose(); super.dispose(); }

  void message(String value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('HOSUR CITY', style: TextStyle(fontSize: 12, letterSpacing: 2)),
          Text('BEST TAXI', style: TextStyle(color: taxiYellow, fontWeight: FontWeight.w900, letterSpacing: 1)),
        ]),
        actions: [IconButton(onPressed: () => message('Login and profile will be connected next.'), icon: const Icon(Icons.person_outline))],
      ),
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.all(20), children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(color: taxiPanel, borderRadius: BorderRadius.circular(22), border: Border.all(color: taxiYellow.withValues(alpha: .4))),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(Icons.local_taxi, color: taxiYellow, size: 42),
              SizedBox(height: 12),
              Text('Your ride. Your way.', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
              SizedBox(height: 6),
              Text('Safe, reliable rides around Hosur and beyond.', style: TextStyle(color: Colors.white70)),
            ]),
          ),
          const SizedBox(height: 24),
          const Text('WHERE TO?', style: TextStyle(color: taxiYellow, fontWeight: FontWeight.bold, letterSpacing: 1.4)),
          const SizedBox(height: 12),
          TextField(controller: pickup, decoration: const InputDecoration(prefixIcon: Icon(Icons.my_location, color: taxiYellow), labelText: 'Pickup location')),
          const SizedBox(height: 12),
          TextField(controller: drop, decoration: const InputDecoration(prefixIcon: Icon(Icons.location_on_outlined, color: taxiYellow), labelText: 'Drop location')),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              if (pickup.text.trim().isEmpty || drop.text.trim().isEmpty) {
                message('Pickup and drop location enter pannunga.');
              } else {
                message('UI demo only. Booking backend connect panninaal dhaan booking save aagum.');
              }
            },
            icon: const Icon(Icons.local_taxi), label: const Text('BOOK A TAXI'),
          ),
          const SizedBox(height: 24),
          const Text('QUICK ACCESS', style: TextStyle(color: taxiYellow, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(child: _QuickTile(icon: Icons.receipt_long, label: 'My Bookings', onTap: () => message('Booking history needs backend.'))),
            const SizedBox(width: 12),
            Expanded(child: _QuickTile(icon: Icons.support_agent, label: 'Support', onTap: () => message('Support contact will be configured.'))),
          ]),
          const SizedBox(height: 20),
          const Text('Premium black & yellow • Customer App', textAlign: TextAlign.center, style: TextStyle(color: Colors.white38, fontSize: 12)),
        ]),
      ),
    );
  }
}

class _QuickTile extends StatelessWidget {
  final IconData icon; final String label; final VoidCallback onTap;
  const _QuickTile({required this.icon, required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap, borderRadius: BorderRadius.circular(16),
    child: Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: taxiPanel, borderRadius: BorderRadius.circular(16)),
      child: Column(children: [Icon(icon, color: taxiYellow, size: 28), const SizedBox(height: 8), Text(label, textAlign: TextAlign.center)])),
  );
}
