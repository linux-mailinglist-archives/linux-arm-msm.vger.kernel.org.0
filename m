Return-Path: <linux-arm-msm+bounces-53291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 375A7A7CDFD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 15:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44BF8188B50F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 13:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BB7218EA2;
	Sun,  6 Apr 2025 13:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="KHiAD7Tg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4FE1AAE28;
	Sun,  6 Apr 2025 13:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743944975; cv=none; b=mfGJvRbmvEgdbwGQ95xIeTvKSISWK4PxMyvsD8dXWBzHbIGQVWAzfHM/ddw/2BbKQDGo+eUDO/KJb/C8JEuj6Re9738tw80J5veGZpP3vgkcQp5YScSu4IYEGCL6Vmauuqd2gm+lIUdAzgwyVRfzirgItt7bhWpxJg2lERUE3To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743944975; c=relaxed/simple;
	bh=1kwR/uAn6H4VvkHuCFbYQOlgki326S4VL3CqoDsXu8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8fgIWUehY91VMN1d6CuG5ZjXicxBdk/mX2HWf+UvANp9A0qKYipDXjRgGPU0LUVQS8B3RIm6rl2zXkkQgw3FsdUV2GgEUtVGeyhD787f9kV8rCrsUuNvAmrdmfjlpXhwzTpQPOctWlTPC455DgDRb4ZRafefHoFKqwHlVzLZQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=KHiAD7Tg; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1743944609; bh=1kwR/uAn6H4VvkHuCFbYQOlgki326S4VL3CqoDsXu8c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KHiAD7Tg6ZsoEhcII5ZBIfRjzIUU5FJ6ku4B4+7mO4WxFteHZd/EjGV1/t5nrRTky
	 ePIEyuSZumbr1XbKSf77ht1ekY6D6KXvtKXhWYQjVypJ65TRoWv1IZ+g8SZg2BrZa8
	 5layR7c5sEd3LSpKUZ3qyE5T0uFiCusPGTdH7Rq8=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 06 Apr 2025 15:03:15 +0200
Subject: [PATCH 1/3] ASoC: dt-bindings: Document Awinic AW8898 amplifier
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-aw8898-v1-1-58a2d554693f@lucaweiss.eu>
References: <20250406-aw8898-v1-0-58a2d554693f@lucaweiss.eu>
In-Reply-To: <20250406-aw8898-v1-0-58a2d554693f@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Weidong Wang <wangweidong.a@awinic.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2275; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=1kwR/uAn6H4VvkHuCFbYQOlgki326S4VL3CqoDsXu8c=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBn8nueWUb8ZHMAmSblTKg1FNqhsg1jZqo3Hn50d
 W9wAUIncPiJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ/J7ngAKCRBy2EO4nU3X
 ViKYEADSVFFYvPUx4Kf7C9YFS1pA5P7DHMFI8IsL6j8xOHF8dVJZzzCxWfe5pirS7BPu29xDlm2
 GqOR8ewoubITxIzDahtM98oVHdKNRTj/P8VK/hEIJERH7xNjYsnKzO/NIaKEq2/m7RvgGFfjSlj
 HFQQ+lJ5A0LDDc9I0XgvAYtEwJV/H29F90CZHxlEqEH2TGrjcwYKiWCRUHTDkQVahiDRCOm4FFC
 +13dO3lqgpPhAlw2vtgrnABe/enchmLp6vFprsAvgRY2STpRSYNPQdIpiCoBrxoDm034VtQiQtu
 hehF5qtLvR70y/2qu8R2tC+OpIiyvlosuCg+EvYoRXauFvmP6TdBDWpCc0EowAc7S+kpEwgC3FI
 uDDlyqMC+c5gZTl6YMar0mIECC+Ts3MHf6WQNuJvMYi0ScSRzw7mzE0ZDR0P1FFhTA4XcJfCWFr
 xImIgfx6woMc6/pq/dDZ+2NjEC1GrxCx3T0OrEpfX/jbVR4UnDVwyOvfd6lQ1/Xs0XJLnaOH8JG
 EG5/p4At8TfPeZ0CZbnWFby5LTQecNl97e4AqC3yMXBquFUYAj+TtxqE+ke1vMUpX75zqAQLjmb
 ps2XoZSMlofZlE5GsF4Y1GdAsWNUsXvYvFW4G4sSjx5GJcpiZ9wtl4NuP3yjg1B2BdjHfzcNPnf
 TF3N5zPb+sRpBDw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the bindings for the Awinic AW8898 amplifier.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../devicetree/bindings/sound/awinic,aw8898.yaml   | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw8898.yaml b/Documentation/devicetree/bindings/sound/awinic,aw8898.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2be084e77253410fd66ded5242fc75174dbfc4f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/awinic,aw8898.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/awinic,aw8898.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Awinic AW8898 Audio Amplifier
+
+maintainers:
+  - Luca Weiss <luca@lucaweiss.eu>
+
+description:
+  The AW8898 is an I2S/TDM input, high efficiency digital Smart K audio
+  amplifier with an integrated 9.5V smart boost converter, sound quality
+  enhancement algorithms and speaker protection.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: awinic,aw8898
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  dvdd-supply:
+    description:
+      Digital power supply
+
+  vddio-supply:
+    description:
+      Digital IO power supply
+
+  vdd-supply:
+    description:
+      Battery power supply
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@34 {
+            compatible = "awinic,aw8898";
+            reg = <0x34>;
+            reset-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
+            interrupts-extended = <&tlmm 20 IRQ_TYPE_LEVEL_HIGH>;
+            dvdd-supply = <&pm8953_l5>;
+            vddio-supply = <&pm8953_l5>;
+            vdd-supply = <&vph_pwr>;
+            #sound-dai-cells = <0>;
+        };
+    };

-- 
2.49.0


