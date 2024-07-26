import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Uas extends StatefulWidget {
  Uas({Key? key}) : super(key: key);

  @override
  State<Uas> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<Uas> {
  TextEditingController nameController = TextEditingController(
    text: 'Refliyanto kasim',
  );
  TextEditingController kelasController = TextEditingController(text: 'A');
  TextEditingController alamatController =
      TextEditingController(text: 'Botupingge');
  TextEditingController tanggalLahirController =
      TextEditingController(text: '14 april 2003');
  File? photo;
  final picker = ImagePicker();
  final GlobalKey _globalKey = GlobalKey();

  Future<void> _saveLocalImage() async {
    // Implement the method to save the image locally
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        tanggalLahirController.text =
            "${pickedDate.toLocal()}".split(' ')[0]; // Format: YYYY-MM-DD
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Input Biodata',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 3,
        backgroundColor: const Color.fromARGB(255, 124, 0, 161),
        actions: const [
          Icon(
            Icons.logout,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        leading: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RepaintBoundary(
                    key: _globalKey,
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      color: Colors.blue,
                      child:
                          photo == null ? const SizedBox() : Image.file(photo!),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _saveLocalImage,
                    child: const Text(
                      'simpan gambar',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .blue, // Ganti dengan warna background yang kalian diinginkan
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Sesuaikan radius sesuai kebutuhan kalian
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical:
                              12.0), // Sesuaikan padding sesuai kebutuhan kalian
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        maxLength: 20,
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Nama',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        maxLength: 20,
                        controller: kelasController,
                        decoration: const InputDecoration(
                          labelText: 'Kelas',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        maxLength: 1000,
                        controller: alamatController,
                        decoration: const InputDecoration(
                          labelText: 'Alamat',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: InkWell(
                        onTap: _selectDate,
                        child: AbsorbPointer(
                          child: TextField(
                            controller: tanggalLahirController,
                            decoration: const InputDecoration(
                              labelText: 'Tanggal Lahir',
                              labelStyle: TextStyle(
                                color: Colors.blueGrey,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final pickedFile = await picker.pickImage(source: ImageSource.camera);
          if (pickedFile != null) {
            setState(() {
              photo = File(pickedFile.path);
            });
          }
        },
        backgroundColor: Color.fromARGB(255, 30, 111, 218),
        child: const Icon(Icons.camera),
      ),
    );
  }
}
