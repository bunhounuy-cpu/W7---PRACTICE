import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            SelectableButton(),
            SizedBox(height: 15),
            SelectableButton(),
            SizedBox(height: 15),
            SelectableButton(),
            SizedBox(height: 15),
            SelectableButton(),
          ],
        ),
      ),
    ),
  ),
);

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    String buttonText = isSelected ? "Selected" : "Not selected";
    Color textColor = isSelected ? Colors.white : Colors.black;
    Color? backgroundColor = isSelected
        ? Colors.blue
        : const Color.fromARGB(255, 240, 198, 198);
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        onPressed: toggleSelection,
        child: Center(
          child: Text(buttonText, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }

  void toggleSelection() {
    setState(() {
      isSelected = isSelected ? false : true;
    });
  }
}
