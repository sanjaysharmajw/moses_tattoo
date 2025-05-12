import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Craftsman Tattoo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(color: Colors.white, fontSize: 24),
          bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navigation Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.brush, color: Colors.orange, size: 30),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 600) {
                        return Row(
                          children: [
                            _navItem('Home'),
                            _navItem('Services'),
                            _navItem('Portfolio'),
                            _navItem('Contact Us'),
                          ],
                        );
                      } else {
                        return IconButton(
                          icon: Icon(Icons.menu, color: Colors.orange),
                          onPressed: () {},
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            // Hero Section
            Container(
              height: 400,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'CRAFTSMANSHIP MEETS ARTISTRY',
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'On the other we, denounce with righteous indignation and disli',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            // Services Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('OUR SERVICES', style: Theme.of(context).textTheme.headlineSmall),
                  Text(
                    'On the other we, denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 600) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _serviceCard(context, 'Tattoo Designs', 'Permanent makeup', 'Dolores sit amet consectetur.'),
                            _serviceCard(context, 'Piercing & Jewelry', 'Body Modifications', 'Dolores sit amet consectetur.'),
                            _serviceCard(context, 'Body Modifications', 'Custom designs', 'Dolores sit amet consectetur.'),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            _serviceCard(context, 'Tattoo Designs', 'Permanent makeup', 'Dolores sit amet consectetur.'),
                            _serviceCard(context, 'Piercing & Jewelry', 'Body Modifications', 'Dolores sit amet consectetur.'),
                            _serviceCard(context, 'Body Modifications', 'Custom designs', 'Dolores sit amet consectetur.'),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            // Portfolio Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PORTFOLIO', style: Theme.of(context).textTheme.headlineSmall),
                  SizedBox(height: 16),
                  _portfolioGrid(context),
                  SizedBox(height: 16),
                  Text('LATEST', style: Theme.of(context).textTheme.headlineSmall),
                  SizedBox(height: 16),
                  _portfolioGrid(context),
                ],
              ),
            ),
            // How It Works Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('HOW DOES IT WORK?', style: Theme.of(context).textTheme.headlineSmall),
                  SizedBox(height: 16),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 600) {
                        return Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _stepItem(context, '01', 'Personal Consultation', 'Erim nulla aliquet porttitor lacus luctus id'),
                                  _stepItem(context, '02', 'Finalizing your design', 'Erim nulla aliquet porttitor lacus luctus id'),
                                  _stepItem(context, '03', 'Appointment Booking', 'Erim nulla aliquet porttitor lacus luctus id'),
                                ],
                              ),
                            ),
                            SizedBox(width: 16),
                            Container(
                              width: 200,
                              height: 200,
                              color: Colors.grey,
                              child: Center(child: Text('Image Placeholder')),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              color: Colors.grey,
                              child: Center(child: Text('Image Placeholder')),
                            ),
                            SizedBox(height: 16),
                            _stepItem(context, '01', 'Personal Consultation', 'Erim nulla aliquet porttitor lacus luctus id'),
                            _stepItem(context, '02', 'Finalizing your design', 'Erim nulla aliquet porttitor lacus luctus id'),
                            _stepItem(context, '03', 'Appointment Booking', 'Erim nulla aliquet porttitor lacus luctus id'),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Widget _serviceCard(BuildContext context, String title, String subtitle, String description) {
    return Container(
      width: 300,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.orange, fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(subtitle, style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: 8),
          Text(description, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }

  Widget _portfolioGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey,
                    child: Center(child: Text('Image Placeholder')),
                  ),
                ),
                SizedBox(height: 8),
                Text('Couples Tattoo', style: Theme.of(context).textTheme.bodyLarge),
              ],
            );
          },
        );
      },
    );
  }

  Widget _stepItem(BuildContext context, String number, String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(number, style: TextStyle(color: Colors.orange, fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
              Text(description, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ],
      ),
    );
  }
}