import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_basit_sehir_kurma/oyun_basit_sehir_kurma.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(basitSehirKurmaConfig.title.length, 33);
    expect(basitSehirKurmaConfig.tagline.length, 33);
    for (final s in basitSehirKurmaConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(basitSehirKurmaConfig.gameId, basitSehirKurmaId);
    expect(basitSehirKurmaRules.gameId, basitSehirKurmaId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(basitSehirKurmaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: basitSehirKurmaId, optionalMechanics: basitSehirKurmaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(basitSehirKurmaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
