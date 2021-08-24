import 'package:flutter/material.dart';
import '../components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/calcultor_brain.dart';




enum Gender{
  Male,
  Female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
    Gender selectedGender;
    int height = 180;

    int weight = 60;
    int age = 18;
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  //1 = male, 2= female
  // void updateColour(Gender selectedGender){
  //   if(selectedGender == Gender.Male){
  //      if (maleCardColor == inactiveCardColor){
  //        maleCardColor = activeCardColor;
  //        femaleCardColor = inactiveCardColor;
  //      }else {
  //        maleCardColor = inactiveCardColor;
  //      }
  //   }
  //   if(selectedGender == Gender.Female){
  //     if(femaleCardColor == inactiveCardColor){
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     }else{
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment:  CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    colour: selectedGender == Gender.Male ? KActiveCardColor: KInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                ),
              )),
              Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    colour: selectedGender == Gender.Female ? KActiveCardColor: KInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                ),
              ))
            ],
          )),


          Expanded(child: ReusableCard(
            colour: KActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'HEIGHT',
                  style: KLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,

                  children: [
                    Text(
                      height.toString(),
                      style: KNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: KLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor:Color(0xFFB1E2B9) ,
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),

                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Colors.white,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
            ),
          ),


          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: KLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: KNumberTextStyle,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight -- ;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },

                          ),
                        ]
                    )
                  ],
                ),
                colour:KActiveCardColor,
              )),

              Expanded(child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: KLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: KNumberTextStyle,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                age -- ;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },

                          ),
                        ]
                    )
                  ],
                ),

                colour: KActiveCardColor,
              ))
            ],
          )),

          BottomButton(
            buttonTitle: 'CALCUATE',
            onTap: (){

              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context, MaterialPageRoute(builder: (context) => ResultPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              ))
              );
            } ,
          ),

        ],
      )
    );
  }
}








