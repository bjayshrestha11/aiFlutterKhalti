import 'package:ai_flut_khalti/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class ExampleTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: KHALTI_API,
        builder: (context, navKey) {
          return MaterialApp(
            navigatorKey: navKey,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
            home: Scaffold(
              body: Container(
                child: Center(
                  child: CustomKhaltiPay(),
                  // child: KhaltiButton.wallet(
                  //   config: PaymentConfig(
                  //     amount: 1000,
                  //     productIdentity: 'adfadfadasdf',
                  //     productName: 'My product name',
                  //     productUrl: "https://hello.com/products/4",

                  //   ),
                  //   onSuccess: (PaymentSuccessModel success) {
                  //     print(success.toString());
                  //   },
                  //   onFailure: (PaymentFailureModel failure) {
                  //     print(failure.toString());
                  //   },
                  //   onCancel: () {
                  //     print("Cancelled By User");
                  //   },
                  // ),
                ),
              ),
            ),
          );
        });
  }
}

class CustomKhaltiPay extends StatelessWidget {
  const CustomKhaltiPay({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
                    child: Text("Pay with khalti flutter"),
                    onPressed: () {
                      final config = PaymentConfig(
                        amount: 10000, // Amount should be in paisa
                        productIdentity: 'dell-g5-g5510-2021',
                        productName: 'Dell G5 G5510 2021',
                        productUrl: 'https://www.khalti.com/#/bazaar',
                        additionalData: {
                          // Not mandatory; can be used for reporting purpose
                          'vendor': 'Khalti Bazaar',
                        },
                      );

                      KhaltiScope.of(context).pay(
                        config: config,
                        preferences: [
                          PaymentPreference.khalti,
                        ],
                        onSuccess: (PaymentSuccessModel success) {
                          print(success.toString());
                        },
                        onFailure: (PaymentFailureModel failure) {
                          print(failure.toString());
                        },
                        onCancel: () {
                          print("Cancelled By User");
                        },
                      );
                    },
                  );
  }
}
