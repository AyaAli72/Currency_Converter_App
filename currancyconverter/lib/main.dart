import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const Currency_Converter_App());
}

class Currency_Converter_App extends StatefulWidget {
  const Currency_Converter_App({super.key});

  @override
  State<Currency_Converter_App> createState() => _Currency_Converter_AppState();
}

class _Currency_Converter_AppState extends State<Currency_Converter_App> {
  final primary = Color.fromRGBO(28, 30, 51, 0.8);
  double money_value = 0;
  final TextEditingController _controller_1 = TextEditingController();
  final TextEditingController _controller_2 = TextEditingController();
  final TextEditingController _controller_3 = TextEditingController();
  double currency_converter() {
    money_value = double.parse(_controller_3.text);
    if ((_controller_1.text == "EGP") & (_controller_2.text == "USA")) {
      money_value = (money_value / 30);
    } else if ((_controller_1.text == "USA") & (_controller_2.text == "EGP")) {
      money_value = (money_value * 30);
    } else if ((_controller_1.text == "EGP") & (_controller_2.text == "EUR")) {
      money_value = (money_value / 32.62);
    } else if ((_controller_1.text == "EUR") & (_controller_2.text == "EGP")) {
      money_value = (money_value * 32.62);
    } else if ((_controller_1.text == "SAU") & (_controller_2.text == "EGP")) {
      money_value = (money_value * 8.22);
    } else if ((_controller_1.text == "EGP") & (_controller_2.text == "SAU")) {
      money_value = (money_value / 8.22);
    } else if ((_controller_1.text == "EAU") & (_controller_2.text == "EGP")) {
      money_value = (money_value * 8.41);
    } else if ((_controller_1.text == "EGP") & (_controller_2.text == "EAU")) {
      money_value = (money_value / 8.41);
    } else if ((_controller_1.text == "KDP") & (_controller_2.text == "EGP")) {
      money_value = (money_value * 100.14);
    } else if ((_controller_1.text == "EGP") & (_controller_2.text == "KDP")) {
      money_value = (money_value / 100.14);
    }
    print(money_value);
    return money_value;
  }

  double value = 0;
  double return_value() {
    setState(() {
      value = currency_converter();
    });
    return value;
  }

  @override
  void initState() {
    super.initState();
    _controller_1.text = "EGP";
    _controller_2.text = "USA";
  }

  void dispose() {
    super.dispose();
    _controller_1.dispose();
    _controller_2.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            "Currancy Converter",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Exchange Rate",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              Text(
                "Amount",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _controller_3,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Money Amount",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "From",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      Center(
                        child: DropdownMenu(
                          controller: _controller_1,
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(value: "EGP", label: "EGP"),
                            DropdownMenuEntry(value: "USA", label: "USA"),
                            DropdownMenuEntry(value: "SAU", label: "SAU"),
                            DropdownMenuEntry(value: "EAU", label: "EAU"),
                            DropdownMenuEntry(value: "EUR", label: "EUR"),
                            DropdownMenuEntry(value: "KDP", label: "KDP")
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "To",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      Center(
                          child: DropdownMenu(
                        controller: _controller_2,
                        dropdownMenuEntries: const [
                          DropdownMenuEntry(value: "EGP", label: "EGP"),
                          DropdownMenuEntry(value: "USA", label: "USA"),
                          DropdownMenuEntry(value: "SAU", label: "SAU"),
                          DropdownMenuEntry(value: "EAU", label: "EAU"),
                          DropdownMenuEntry(value: "EUR", label: "EUR"),
                          DropdownMenuEntry(value: "KDP", label: "KDP")
                        ],
                      )),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => return_value(),
                      child: Container(
                        foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Convert",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
