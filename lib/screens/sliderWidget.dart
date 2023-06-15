import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:multi_provider_example_1/providers/providerClass.dart';
import 'package:provider/provider.dart';

class SliderWidgetWithProvider extends StatefulWidget {
  const SliderWidgetWithProvider({super.key});

  @override
  State<SliderWidgetWithProvider> createState() =>
      _SliderWidgetWithProviderState();
}

class _SliderWidgetWithProviderState extends State<SliderWidgetWithProvider> {
  @override
  Widget build(BuildContext context) {
    double value = 1.0;
    final ProviderValue = Provider.of<ProviderFiles>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider With Provider'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Slider(
              min: 0.0,
              max: 1.0,
              value: ProviderValue.value,
              activeColor: Colors.green,
              label: 'Text Opacity',
              onChanged: (double val) {
                setState(() {
                  ProviderValue.setValue(val);
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer<ProviderFiles>(
              builder: (context, value, child) {
                return Text(
                  'Slider',
                  style: TextStyle(
                    fontSize: 40,
                    color: ProviderValue.value > 0.5
                        ? Colors.green.withOpacity(ProviderValue.value)
                        : Colors.red.withOpacity(1 - ProviderValue.value),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
