import 'package:flutter/material.dart';
import 'package:marking_digital_rover/domain/models/feature_type.dart';
import 'package:marking_digital_rover/presentation/analytics/analytics_screen.dart';
import 'package:marking_digital_rover/presentation/i_menu/i_menu_screen.dart';
import 'package:marking_digital_rover/presentation/map/map_screen.dart';
import 'package:marking_digital_rover/presentation/menu/menu_screen.dart';
import 'package:marking_digital_rover/presentation/settings/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FeatureType _current = FeatureType.map;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Admin'),
                    Icon(Icons.admin_panel_settings),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                ...FeatureType.values.map(
                  (type) => GestureDetector(
                    onTap: () => setState(() => _current = type),
                    child: _MenuItem(type),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FractionallySizedBox(
                widthFactor: .8,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 100,
                    right: 12,
                  ),
                  child: Container(
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text(_current.name),
                      ),
                      body: _ContentPlaceholder(_current),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem(this._type);

  final FeatureType _type;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.ac_unit),
        Text(_type.name),
      ],
    );
  }
}

class _ContentPlaceholder extends StatelessWidget {
  const _ContentPlaceholder(this._type);

  final FeatureType _type;

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case FeatureType.map:
        return const MapScreen();
      case FeatureType.iMenu:
        return const IMenuScreen();
      case FeatureType.menu:
        return const MenuScreen();
      case FeatureType.analytics:
        return const AnalyticsScreen();
      case FeatureType.settings:
        return const SettingsScreen();
    }
  }
}
