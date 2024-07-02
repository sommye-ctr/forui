@Tags(['golden'])
library;

import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:forui/forui.dart';
import '../../test_scaffold.dart';

void main() {
  group('FTabs', () {
    for (final (name, theme, _) in TestScaffold.themes) {
      testWidgets('default - $name', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: TestScaffold(
              data: theme,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: FTabs(
                        tabs: [
                          FTabEntry(
                            label: const Text('Account'),
                            content: FCard(
                              title: const Text('Account'),
                              subtitle: const Text('Make changes to your account here. Click save when you are done.'),
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.blue,
                                    height: 100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FTabEntry(
                            label: const Text('Password'),
                            content: FCard(
                              title: const Text('Password'),
                              subtitle: const Text('Change your password here. After saving, you will be logged out.'),
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.red,
                                    height: 100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(TestScaffold),
          matchesGoldenFile('tabs/$name-tabs.png'),
        );
      });
    }
  });
}
