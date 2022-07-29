import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formkey = GlobalKey<FormState>();

  bool isHiddenPassword = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: SingleChildScrollView(
        // reverse: true,
        child: Form(

          key: formkey,
          child: Stack(
            children: [

              Container(
                height: 1000,

              ),
              Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  children: [

                    //Image.asset('images/ironman.jpg')
                    CircleAvatar(
                      backgroundImage: AssetImage('images/avatar.png'),
                      // backgroundColor: Colors.red,
                      radius: 60,
                    ),

                    Divider(),


                    TextFormField(
                      validator: (value){
                        if(value!.length < 3){
                          return"Please enter valid name";
                        }else{
                          return null;
                        }
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Enter Name',
                        prefixIcon: Icon(Icons.person),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),

                    Divider(),

                    TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10)
                      ],
                      validator: (value){
                        if(value!.length != 10){
                          return"Please enter valid number";
                        }else{
                          return null;
                        }
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Enter Number',
                        prefixIcon: Icon(Icons.phone),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),

                    Divider(),


                    TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is Required';
                          }
                          if (!RegExp(
                              r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
                              .hasMatch(value)) {
                            return 'Please enter a valid Email';
                          }
                          return null;
                        },

                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Enter Email',
                        prefixIcon: Icon(Icons.mail),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                      autofillHints: [AutofillHints.email],

                      keyboardType: TextInputType.emailAddress,

                    ),

                    Divider(),


                    SingleChildScrollView(
                      child: TextFormField(
                        validator: (value){
                          if(value!.length < 8){
                            return"Please enter valid password";
                          }else{
                            return null;
                          }
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'Enter Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              Icons.visibility
                            ),
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isHiddenPassword,
                        enableSuggestions: false,
                        autocorrect: false,

                      ),

                    ),


                    Divider(),

                    ElevatedButton(onPressed: (){
                      if(formkey.currentState!.validate()){
                        print("Submited..!");
                      }else{
                        print("Something went wrong");
                      }
                    },

                        child: Text("SIGN IN")),

                  ],
                ),
              ),
             // Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.top))
            ],
          ),
        ),
      ),

    );
  }
  void _togglePasswordView(){
    if(isHiddenPassword == true){
      isHiddenPassword = false;
    }else{
      isHiddenPassword = true;
    }
    setState(() {

    });
  }
}
