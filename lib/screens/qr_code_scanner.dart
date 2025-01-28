import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({super.key});

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  String qrResult='Scanned Result will appear here';
  Future<void> scanQrCode()async{
    try{
      final qrCode= await FlutterBarcodeScanner.scanBarcode('#ff6666', 'cancel', true, ScanMode.QR);

    if(!mounted)return;
    setState(() {
      qrResult=qrCode.toString();
    });
    }on PlatformException{
      qrResult='Failed to read';
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner', style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(qrResult, style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary),
                onPressed: scanQrCode, child: Text('Scan QR', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary),)),
              if(qrResult!='Scanned Result will appear here')
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary),
                onPressed: (){
               Clipboard.setData(ClipboardData(text: qrResult));
              }, child: Text('Copy URL', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary),)),
            ],
          ),
        ),
      ),
    );
  }
}