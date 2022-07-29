import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_registration_day4/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Swift Notes",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final formkey = GlobalKey<FormState>();
bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                accountName: Text(
                  "Dipak Gohil",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("gohildipak007@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/avatar.png'),
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Notes '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.nightlight),
              title: const Text(' Mode '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Swift Notes"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(

        child: Form(
          key: formkey,
          child: Stack(
            children: [
              Container(
                color: Colors.blue[100],
              ),
              Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  children: [

                    //Image.asset('images/ironman.jpg')
                    CircleAvatar(
                      backgroundImage: AssetImage('images/logo2.jpeg'),
                      radius: 60,
                    ),
                    Divider(),
                    TextFormField(
                      validator: (value){
                        if(value!.length < 2){
                          return"Please Enter Valid Title";
                        }else{
                          return null;
                        }
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Enter Title',
                        prefixIcon: Icon(Icons.brush),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),

                    Divider(),

                    TextFormField(
                      validator: (value){
                        if(value!.length < 3){
                          return"Please Enter Valid Description";
                        }else{
                          return null;
                        }
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Enter Description',
                        prefixIcon: Icon(Icons.description),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),

                    SizedBox(
                      height: 10,
                    ),


                    ElevatedButton(onPressed: (){
                      if(formkey.currentState!.validate()){
                        print("Submited..!");
                      }else{
                        print("Something went wrong");
                      }
                    },
                        child: Text("Create")),

                    Divider(),

                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text("look at the existing notes",style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                      ),)
                    )
                  ],
                ),
              )
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
