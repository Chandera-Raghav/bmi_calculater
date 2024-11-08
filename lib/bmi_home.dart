import 'package:flutter/material.dart';

class BmiHomePage extends StatefulWidget {
  const BmiHomePage({super.key});
  @override
  State<StatefulWidget> createState() => _BmiHomePageState();
}

class _BmiHomePageState extends State<BmiHomePage> {
  String bmiStatus = "Status of BMI";
  String result = "0";
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController kgController = TextEditingController();
  String selectedGender = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 20),
            Container(
              width: 306,
              padding: const EdgeInsets.symmetric(vertical: 95, horizontal: 0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/heart-removebg-preview.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(
                "${result}",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.withOpacity(0.7),),
                textWidthBasis: TextWidthBasis.longestLine,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              '${bmiStatus}',
              style: TextStyle(fontSize: 50, color: Colors.teal[300]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Male",
                  style: TextStyle(
                      fontSize: 25,
                      color: selectedGender == 'Male'
                          ? Colors.blue
                          : Colors.black),
                ),
                Text(
                  "Female",
                  style: TextStyle(
                      fontSize: 25,
                      color: selectedGender == 'Female'
                          ? Colors.blue
                          : Colors.black),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      selectedGender = 'Male';
                    },
                    child: Image.asset(
                      "assets/icons/male.png",
                      color: selectedGender == 'Male' ? Colors.blue : null,
                    )),
                GestureDetector(
                    onTap: () {
                      selectedGender = 'Female';
                    },
                    child: Image.asset(
                      "assets/icons/female.png",
                      color: selectedGender == 'Female'
                          ? Colors.blue
                          : null,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: const Text("Age")),
                Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: const Text("Height")),
                Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: const Text("Weight"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          controller: ageController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ))),
                Container(
                  width: 1,
                  height: 50,
                  color: Colors.black.withOpacity(0.1),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: heightController,
                    decoration: const InputDecoration(
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                )),
                Container(
                  width: 1,
                  height: 50,
                  color: Colors.black.withOpacity(0.1),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: kgController,
                    decoration: const InputDecoration(
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: 200,
        height: 95,
        decoration: BoxDecoration(
          color: Colors.greenAccent.withOpacity(0.5),
        ),
        child: Center(
            child: Container(
          margin: const EdgeInsets.all(0),
          child:ElevatedButton(onPressed: () {
            double weight = double.parse(kgController.text);
            double height = double.parse(heightController.text) / 100;
            double bmi = weight / (height * height);
            result = bmi.toStringAsFixed(2);
            print(result);
            if(bmi < 18.5) {
              bmiStatus = "UnderWeight";
            } else if (bmi >= 18.5 && bmi < 24.9) {
              bmiStatus = "Hialthy";
            } else if(bmi >= 25 && bmi < 29.9){
              bmiStatus = "OverWeight";
            } else {
              bmiStatus = "Obesity";
            } setState(() {

            });
          }, child: Text(
            "Calculet BMI",
            style: TextStyle(
              color: Colors.lightBlue.withOpacity(0.7),
              fontSize: 30,
            )),
          ),
        )),
      ),
    );
  }
}
