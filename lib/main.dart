import 'package:flutter/material.dart';

import 'next.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Form",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: App(),
      
    );
  }
}

class App extends StatefulWidget {
  const App({ Key? key }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key:_formkey,
          child: Column(
            children: 
            [
              SizedBox(height: 20.0,),
              TextFormField
              (
                decoration: InputDecoration
                (
                  hintText: ("username"),
                  labelText: ("Enteruser"),
                ),
                validator: (value)
                {
                  if(value!.isEmpty)
                  {
                    return("name is empty");
                  }
                  return null;
                },
              ),
              
               TextFormField
              (
                decoration: InputDecoration
                (
                  hintText: ("password"),
                  labelText: ("Enterpassword"),
                ),

                validator: (value)
                {
                  if(value!.isEmpty)
                  {
                    return("password is empty");
                  }
                  else if(value.length<6)
                  {
                    return("password is less than 6");
                  }
                  return null;
                },
                
                obscureText: true,
              ),
              SizedBox(height: 10.0,),

                ElevatedButton(onPressed:(){
                if(_formkey.currentState!.validate())
                {
                   Navigator.push(context,MaterialPageRoute(builder: (context)=>Next()));
                setState(() {});
                }
              }, 
               child: Text("Login")),
               

            ],),
        ),
        
      ),
      
     
    );
  }
}