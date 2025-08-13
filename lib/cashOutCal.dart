import 'package:flutter/material.dart';

class Cashoutcal extends StatefulWidget {
  const Cashoutcal({super.key});

  @override
  State<Cashoutcal> createState() => _CashoutcalState();
}

class _CashoutcalState extends State<Cashoutcal> {
  TextEditingController controller = TextEditingController();
  String? errortext;
  double ans = 0, total = 0;
  String? ans1, ans2;
  void calculate() {
    String? text = controller.text;
    if (text.isEmpty) {
      errortext = 'empty is not allowed';
    } else {
      errortext = null;
      ans = double.parse(text) * 0.0185;
      total = double.parse(text) + ans;
      ans1 = ans.toStringAsFixed(2);
      ans2 = total.toStringAsFixed(2);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        //centerTitle: true,
        title: Text("Cashout Charge"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.language))],
      ),
      body: Center(
        child: SizedBox(
          height: 500,
          width: 380,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Cashout charge based on 1.85%'),
                //SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    controller: controller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.monetization_on),
                      labelText: "Cashout Amount",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      errorText: errortext,
                    ),
                  ),
                ),

                //SizedBox(height: 5),
                ElevatedButton(onPressed: calculate, child: Text("Calculate")),
                //SizedBox(height: 5),
                Text('Cashout charge $ans1'),
                //SizedBox(height: 5),
                Text('Total amount with cashout charge $ans2'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
