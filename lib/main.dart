import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyStudyApp());
}

// APP PRINCIPAL
class MyStudyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyStudyApp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreenFlutter(),
    );
  }
}

// SPLASH SCREEN COM GRADIENTE ANIMADO
class SplashScreenFlutter extends StatefulWidget {
  @override
  _SplashScreenFlutterState createState() => _SplashScreenFlutterState();
}

class _SplashScreenFlutterState extends State<SplashScreenFlutter> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();

    // Ativa a animação de gradiente e logo
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() => _animate = true);
    });

    // Vai para o Onboarding após 3 segundos
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 3),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: _animate
                ? [Colors.blue.shade400, Colors.purple.shade300]
                : [Colors.white, Colors.white],
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            opacity: _animate ? 1.0 : 0.0,
            duration: Duration(seconds: 2),
            child: Image.asset('assets/logo.png', width: 150),
          ),
        ),
      ),
    );
  }
}

// TELA DE ONBOARDING COM BOTÃO PULAR E SWIPE
class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {"image": "assets/study1.png", "text": "Organize seus estudos"},
    {"image": "assets/study2.png", "text": "Acompanhe seu progresso"},
    {"image": "assets/study3.png", "text": "Alcance suas metas"},
  ];

  void _skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  itemBuilder: (context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(onboardingData[index]['image']!, height: 300),
                      SizedBox(height: 20),
                      Text(
                        onboardingData[index]['text']!,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: _currentPage > 0 ? _prevPage : null,
                    ),
                    Row(
                      children: List.generate(
                        onboardingData.length,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: _currentPage == index ? 12 : 8,
                          height: _currentPage == index ? 12 : 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.blue
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    _currentPage == onboardingData.length - 1
                        ? ElevatedButton(
                            onPressed: _skip,
                            child: Text("Começar"),
                          )
                        : IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: _nextPage,
                          ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: _skip,
              child: Text(
                "Pular",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// TELA INICIAL PÓS-ONBOARDING
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Início'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text(
          'Bem-vindo ao seu app de estudos!',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Ação ao clicar no botão
          },
          child: Text('Comece a usar'),
        ),
          ],
        ),
      ),
    );
  }
}
