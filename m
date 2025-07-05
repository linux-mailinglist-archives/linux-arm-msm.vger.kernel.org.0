Return-Path: <linux-arm-msm+bounces-63811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF3FAF9FEE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 14:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 764481C44CB3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 12:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A59251791;
	Sat,  5 Jul 2025 12:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="gHawPyyt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B011824BD02;
	Sat,  5 Jul 2025 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751717313; cv=none; b=oSrTyFQbrgZsmkbhGkl4FoH913+Mkk53CObzSttun17WE2mz8kMvFp8fY3Q5rdTy2BvJM5m75JMyCh4Fi1dnZuQxGFnEAIllcq4sHcYh5iNSoku1g5f4J72wSMzwaNCa6rF4v3DMv9L5wDn/3+5fDv2KRU9qMtAjMfj7PWuutTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751717313; c=relaxed/simple;
	bh=A5J52sFRgcKLNS5QZzA4CrA9ofZsvR818bxqKCmdmeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F6ASi1qKFU6bhmYMahkyHnJafaThgUB3cFeLreriA5AEXsKbsmY/qUUspPP/486RmQa+C2ljJSM3uuOafe6sLEszZadgDIrxyNXHrdAQ8yq0PXhjQ0708N/QUf8zyllyZK6GA/3W9kGxmI+TDToG3XbD7yLYlQ/Lr4nCdiAfz2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=gHawPyyt; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1751716994; bh=A5J52sFRgcKLNS5QZzA4CrA9ofZsvR818bxqKCmdmeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gHawPyythyxiVvoTG6lpG12bZAsJxLZ5kyDEN4cN95sk0AfZ/mhCxCyRuhfliPn0L
	 jWeA1sidC+SchqYBCvIB8bI7CdOXQUSE5pwqgGFfrLXM5odm5Obv9WGirDXbh1L912
	 bFn7hYqWm4izM3ZG2EozoBK3joprGh2pynVssMPE=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 05 Jul 2025 14:03:05 +0200
Subject: [PATCH v2 1/3] ASoC: dt-bindings: Document Awinic AW8898 amplifier
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-aw8898-v2-1-9c3adb1fc1a2@lucaweiss.eu>
References: <20250705-aw8898-v2-0-9c3adb1fc1a2@lucaweiss.eu>
In-Reply-To: <20250705-aw8898-v2-0-9c3adb1fc1a2@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Weidong Wang <wangweidong.a@awinic.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2397; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=A5J52sFRgcKLNS5QZzA4CrA9ofZsvR818bxqKCmdmeA=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoaRR/2kEQvxH8g3e8MdSMQTR0bAyhfHjK2YbZo
 ad5dUvPhFiJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaGkUfwAKCRBy2EO4nU3X
 Vvo0EADRfS09Is7VfHDbonsCmCU9DJwFZkSwZKnF/Ssk4NLfDY08PQ8yRJuj0dhBPQdLHDPzCp3
 4pomdPO+KMw6ABw/hkSdlRhf+6XUhzyVD14w9J6pz0Bsjb5YyYrtjVmIQ0tWAXWJSBCSGtbs8kO
 U7MupektRi+OEAsqWzavyR6+jI2sYSluF1DkTJk22uJeV9JK2NK3QG9Fpw1/TsiLwGwvhZNU35u
 0m4d936SCABy41QdrFspR/nAbJ/nfIRq+UKoiOJ2VwExGU8d1P63gIaZVWXuretaF4y0JZ4wcTf
 ZjydF5d4oPDzlodqCv6uBLHzv1JkuvgRZ+TikK2Ohe3SePnQYhJ2cEOQtT6eU1IhlAQ9+pu2dsU
 dScCBojbPmHz9wyM1yelVwx+GHLqllSLKb5E+EH57eatyQjYxBwth1qQqVOiLSIu8bnQUzSLE5f
 IY89nxIltDIcX7ZLH/uoXYZzA1rJ++X8CSO35ryjXKijdBCVPQLoNpnbY4MYr2dEd2YkMUKNBwn
 VNiJm7L0XlpDKqMhXvtSeMlnv6eyDaFowZwOheNIgTkWAEFRf/TWr4A821xaCZzGQrXDIaPWnLn
 AIOnskOCmKHLLznN8FbEmnlbIWPTALU0Q2KWKxPpfbcVe9aFAUpW428rWPfmzPz6j6tjzkkTrlH
 1afCJTmmlp2IOCg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the bindings for the Awinic AW8898 amplifier.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../devicetree/bindings/sound/awinic,aw8898.yaml   | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw8898.yaml b/Documentation/devicetree/bindings/sound/awinic,aw8898.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..38eb0ba506527ed9e4420f3dfa13283580e56d27
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/awinic,aw8898.yaml
@@ -0,0 +1,78 @@
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
+  - dvdd-supply
+  - vddio-supply
+  - vdd-supply
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
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
2.50.0


