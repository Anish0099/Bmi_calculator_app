import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants/app_constants.dart';
import 'package:bmi_calculator_app/widgets/left_bar.dart';
import 'package:bmi_calculator_app/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController=TextEditingController();
  TextEditingController _weightController=TextEditingController();
  double _bmiResult=0;
  String _textTesult="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bmi Calculator',style: TextStyle(color: accentHexColor,fontWeight: FontWeight.w300),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child:Column(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Height',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 42,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Weight',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 42,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                double _h=double.parse(_heightController.text);
                double _w=double.parse(_weightController.text);
                setState(() {
                  _bmiResult=_w/(_h * _h);
                  if(_bmiResult>25){
                    _textTesult="You\'re over weight";
                  }else if(_bmiResult>=18.5&&_bmiResult<=25){
                    _textTesult="You have normal weight";
                  }else{
                    _textTesult="You\'re under weight";
                  }
                });
              },
              child: Container(
                child: Text('Calculate',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: accentHexColor),),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Text(_bmiResult.toStringAsFixed(2),style: TextStyle(fontSize: 90,color: accentHexColor),),
            ),
            SizedBox(height: 30,),
            Visibility(
              visible: _textTesult.isNotEmpty,
            child:Container(
              child: Text(_textTesult,style: TextStyle(fontSize: 32,fontWeight: FontWeight.w400,color: accentHexColor),),
            ),),
            SizedBox(height: 10,),
            LeftBar(barWidth: 40,),
            SizedBox(height: 10,),
            LeftBar(barWidth: 70,),
            SizedBox(height: 10,),
            LeftBar(barWidth: 40,),
            SizedBox(height: 10,),
            RightBar(barWidth: 40,),
            SizedBox(height: 10,),
            RightBar(barWidth: 70,),
            SizedBox(height: 10,),
            RightBar(barWidth: 30),

          ],
        ),
      ),
    );
  }
}
