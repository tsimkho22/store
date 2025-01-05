import 'package:flutter/material.dart';
import 'package:store/page/mainPage.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
      bool _password = true;
    void showPassword() {
      setState(
        () {
          _password = !_password;
        },
      );
    }
  @override
  Widget build(BuildContext context) {


    Widget emailText() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50,
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 240, 236, 236),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
              ),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.grey,
              ),
              hintText: 'exampleemail@gmail.com',
              hintStyle: TextStyle(color: Color.fromARGB(255, 200, 198, 198))),
        ),
      );
    }

    Widget passwordText() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50,
        child: TextField(
          obscureText: _password,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 240, 236, 236),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 0,
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.grey,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                showPassword();
              },
              icon: _password
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),
            ),
            hintText: 'password',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 200, 198, 198),
            ),
          ),
        ),
      );
    }

    Widget buttonLogin() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              10,
            )),
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => mainPage()),
            );
          },
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/123.png",
                width: 120,
                height: 120,
              ),
              SizedBox(
                height: 50,
              ),
              emailText(),
              SizedBox(
                height: 10,
              ),
              passwordText(),
              SizedBox(
                height: 20,
              ),
              buttonLogin(),
              SizedBox(
                height: 20,
              ),
              Text(
                'OR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 249, 183, 1),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/gg.png",
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Google',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/ff.png",
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Facebook',
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 59, 230, 65),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.app_registration,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
