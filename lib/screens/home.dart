import 'package:flutter/material.dart';
import 'package:qr_code_generator/screens/qr_code_generator.dart';
import 'package:qr_code_generator/screens/qr_code_scanner.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code generator', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary).copyWith(fontWeight: FontWeight.bold),),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Text('Welcome to QR Code Generator!', style: Theme.of(context).textTheme.titleLarge)),
            Container(
              padding: EdgeInsets.only(top: 250),
              child: Text('Chose What You Want to Do:', style: Theme.of(context).textTheme.titleMedium)),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary),
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>QrCodeScanner()));
            }, child: Text('Scan QR Code', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimary),),
            ),
        
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary),
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>QrCodeGenerator()));
            }, child: Text('Generate QR Code', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimary))),
              ],
            )
            
          ],
        ),
      ),
    );
  }
}