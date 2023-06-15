import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:multi_provider_example_1/providers/providerClass.dart';
import 'package:multi_provider_example_1/screens/sliderWidget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderFiles()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Multi_Provider',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const SliderWidgetWithProvider(),
      ),
    );
  }
}
