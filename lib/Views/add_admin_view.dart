import 'package:flutter/material.dart';
import 'package:ivote/App/routes.dart';

class AddAdminView extends StatefulWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  _AddAdminViewState createState() => _AddAdminViewState();
}

class _AddAdminViewState extends State<AddAdminView> {
  String _adminName, _adminLoginId, _adminPassword, _tempPass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key(Routes.addAdminView),
      backgroundColor: Color.fromRGBO(243, 243, 243, 100),
      body: Form(
        key: widget.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
              //   child:
              Center(
                child: Container(
                  width: 250,
                  height: 150,
                  child: Image.asset(
                    'assets/images/voting_logo3.png',
                    scale: 0.09,
                  ),
                ),
                // ),
              ),
              Text('Add Admin'),
              Container(
                width: 300.0,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (name) {
                    if (name == null || name.isEmpty)
                      return 'Please Enter Name';
                    return null;
                  },
                  onSaved: (name) {
                    if (name == null || name.isEmpty) _adminName = name;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      hintText: 'Enter your name'),
                ),
              ),
              Container(
                width: 300.0,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // obscureText: true,
                  validator: (loginId) {
                    if (loginId == null || loginId.isEmpty)
                      return 'Please Enter loginId';

                    return null;
                  },
                  onSaved: (loginId) {
                    if (loginId == null || loginId.isEmpty)
                      _adminLoginId = loginId;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Login ID',
                      hintText: 'Enter your login ID'),
                ),
              ),
              Container(
                width: 300.0,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  validator: (password) {
                    if (password == null || password.isEmpty)
                      return 'Please Enter Password';

                    _tempPass = password;
                    return null;
                  },
                  onSaved: (password) {
                    if (password == null || password.isEmpty)
                      _adminPassword = password;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your password'),
                ),
              ),
              Container(
                width: 300.0,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  validator: (confirmPassword) {
                    if (confirmPassword == null || confirmPassword.isEmpty)
                      return 'Please Enter Password';
                    if (_tempPass != confirmPassword)
                      return 'Password Doesnt match';

                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                      hintText: 'Re-enter your password'),
                ),
              ),

              Container(
                height: 50,
                width: 300,
                margin: EdgeInsets.symmetric(vertical: 35.0),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    if (widget.formKey.currentState.validate()) {
                      print('Name: $_adminName');
                      print('LoginId: $_adminLoginId');
                      print('Password: $_adminPassword');

                      print('Deatils Saved successfully');
                    } else
                      print('Validation Failed');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 50,
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
              height: 40,
              padding: const EdgeInsets.only(top: 10.0, bottom: 0.0),
              child: Text(
                "Made with ❤️ in India",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.lightBlue,
                ),
              ))),
    );
  }
}
