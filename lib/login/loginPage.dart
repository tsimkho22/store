import 'package:flutter/material.dart';
import 'package:store/page/mainPage.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();
  final userControl = new TextEditingController();
  final passwordControl = new TextEditingController();

  bool showPassword = true;
  void visiblePassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget UserText() {
      return Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 50,
          child: TextFormField(
            controller: userControl,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  26,
                ),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Color.fromARGB(255, 216, 215, 215),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                ),
                child: Icon(
                  Icons.person,
                  color: Colors.green,
                ),
              ),
              hintText: 'Username',
            ),
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Please enter username'
                  : null;
            },
          ),
        ),
      );
    }

    Widget Password() {
      return Padding(
        padding: const EdgeInsets.only(
          top: 15,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 50,
          child: TextFormField(
            obscureText: showPassword,
            controller: passwordControl,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  26,
                ),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Color.fromARGB(255, 216, 215, 215),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                ),
                child: Icon(
                  Icons.lock,
                  color: Colors.green,
                ),
              ),
              hintText: 'Password',
              suffixIcon: IconButton(
                onPressed: () {
                  visiblePassword();
                },
                icon: showPassword
                    ? Icon(Icons.visibility)
                    : Icon(
                        Icons.visibility_off,
                      ),
              ),
            ),
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Please enter password'
                  : null;
            },
          ),
        ),
      );
    }

    Widget loginWith(String icons) {
      return InkWell(
        onTap: () {},
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Image.asset(
            "$icons",
          ),
        ),
      );
    }

    Widget buttonLogin() {
      return Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                String user = userControl.text;
                String password = passwordControl.text;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Username: $user and Password:$password."),
                  ),
                );
              } else {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => mainPage(),
                  ),
                );
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.green,
              ),
            ),
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(245, 196, 196, 196),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 180,
                      left: 50,
                    ),
                    child: Text(
                      'Let`s Start with Login!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 240,
                    ),
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 350,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                            ),
                            child: Column(
                              children: [
                                UserText(),
                                Password(),
                                buttonLogin(),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Login with"),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    loginWith("assets/icons/g.png"),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    loginWith("assets/icons/f.png"),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    loginWith("assets/icons/t.png"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
