import 'package:flutter/material.dart';

void main() {
  runApp(const CraftOraApp());
}

class CraftOraApp extends StatelessWidget {
  const CraftOraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Craft Ora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF48FB1), // Pink base
          primary: const Color(0xFFD81B60),
          secondary: const Color(0xFFFCE4EC),
          surface: Colors.white,
          background: const Color(0xFFFDF0F3),
        ),
        useMaterial3: true,
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HamperMenuScreen(),
      },
    );
  }
}

class HamperMenuScreen extends StatelessWidget {
  const HamperMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 600;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text(
          'Craft Ora',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const Text(
                    '✨ 05 Mini Hamper ✨',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD81B60),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Perfect little treats for your loved ones',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? screenWidth * 0.1 : 16.0,
            ),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                mainAxisExtent: 220,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              delegate: SliverChildListDelegate(
                const [
                  HamperCard(
                    price: '₹99',
                    items: [
                      'Claw clip',
                      'Scrunchie',
                      'Bracelet',
                      'Earring studs / Neck chain',
                    ],
                  ),
                  HamperCard(
                    price: '₹149',
                    items: [
                      'Claw clip',
                      'Scrunchie',
                      'Bracelet',
                      'Earring studs',
                      'Neck chain',
                      'Flower clip',
                    ],
                  ),
                  HamperCard(
                    price: '₹199',
                    items: [
                      '2 Claw clip',
                      '2 Scrunchie',
                      '2 Bracelet',
                      '2 Earring studs',
                      'Neck chain + Flower clip',
                      'Chocolate + Lipgloss',
                    ],
                  ),
                  HamperCard(
                    price: '₹249',
                    items: [
                      '2 Claw clip',
                      '2 Scrunchie',
                      '2 Bracelet',
                      '2 Earring studs',
                      'Neck chain + Flower clip',
                      'Chocolate + Lipgloss',
                      'Bow clip',
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? screenWidth * 0.1 : 16.0,
                vertical: 24.0,
              ),
              child: const ExtraChargesSection(),
            ),
          ),
        ],
      ),
    );
  }
}

class HamperCard extends StatelessWidget {
  final String price;
  final List<String> items;

  const HamperCard({
    super.key,
    required this.price,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                price,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '• ',
                          style: TextStyle(color: Color(0xFFD81B60)),
                        ),
                        Expanded(
                          child: Text(
                            items[index],
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExtraChargesSection extends StatelessWidget {
  const ExtraChargesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFF8BBD0), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.stars_rounded, color: Color(0xFFD81B60)),
                const SizedBox(width: 8),
                Text(
                  'Extra Charges',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            const Divider(height: 24, color: Color(0xFFFCE4EC)),
            _buildExtraItem('Fairy lights', '₹15'),
            _buildExtraItem('Chocolates / Snacks', '₹20-100'),
            _buildExtraItem('Polaroids', '₹10 per pic'),
            _buildExtraItem('Mini perfume', '₹65'),
            _buildExtraItem('Custom letter', '₹5'),
          ],
        ),
      ),
    );
  }

  Widget _buildExtraItem(String title, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC2185B),
            ),
          ),
        ],
      ),
    );
  }
}
