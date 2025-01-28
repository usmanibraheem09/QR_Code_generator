import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeGenerator extends StatefulWidget {
  const QrCodeGenerator({super.key});

  @override
  State<QrCodeGenerator> createState() => _QrCodeGeneratorState();
}

class _QrCodeGeneratorState extends State<QrCodeGenerator> {
  final TextEditingController qrController = TextEditingController();
  String qrData = ''; // Holds the text for the QR code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Generate QR',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                // Display the QR code only if there is valid data
                if (qrData.isNotEmpty)
                  QrImageView(
                    data: qrData,
                    size: 200.0,
                  ),
                const SizedBox(height: 20),
                TextField(
                  controller: qrController,
                  decoration: InputDecoration(
                    hintText: 'Enter the text to generate QR code',
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary
                  ),
                  onPressed: () {
                    setState(() {
                      qrData = qrController.text.trim(); // Update QR data
                    });
                  },
                  child: Text('Generate QR Code', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
