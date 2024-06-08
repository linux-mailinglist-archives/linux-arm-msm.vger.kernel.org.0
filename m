Return-Path: <linux-arm-msm+bounces-22127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A535E901282
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 17:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DACE1F21AA1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 15:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2B217BB08;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDTpz8c2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5790C17B423;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717862241; cv=none; b=UY6vrrnzoVficyCGK3+lv7SPve33J+JWXb4SHOloXIroIFtzFS8Oq0YG8GgC5aOTjhv77VYf6htnDIeEumMjiFWWvkkOWFT1ALQkjP1AUPK1836pNCwN6pVWDXa1RzyGh4P2BkBuzsoCjnp0wHFU6/VMbhIggn+zHkiSY98J+rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717862241; c=relaxed/simple;
	bh=A+xExKU+oPZGcncBlPzW/LTT+ijy3dTQcw/wRTkPK6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHD68jahZ0ZzkzwZnoNHZaag0MeZDLu/IT6nz5K6A7cX4EOMWUUCxXnsfb2DEn/ud2u4krEmkZdQ9UFtCR9YnuRyj7ToLgO6T/ZXK/tBxMO00u+irK7FwoVx+b1pRGASyNz77R6wIt3HVRkPuYVifbw7phBb0JoyjyyGDHAlDbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDTpz8c2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6289C4AF4D;
	Sat,  8 Jun 2024 15:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717862240;
	bh=A+xExKU+oPZGcncBlPzW/LTT+ijy3dTQcw/wRTkPK6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bDTpz8c2+vFsft9p/oX0QKa8QQBumyVgFkOWa1QLeE7k8ioJyKSDdROajuLP11QLz
	 LoZFyRC4swrwtgy2NJ9TYfDHPb6idzfh3jFJ6yrOx9jd2BJ3ba9E7uImg7BTK07XTf
	 MNGj/I9jzp2qFckHT0jAmJWD4zBRTVsExPmIW37xFB+pa1bbZ15edumiMx+1CepFvj
	 bnhk1K6JYJSY3MX+bUXSnHmlRTDCtP0Z/9tmP+6sqkN+HbuGjrY8CO1yOXOZjsJSO7
	 gL8ekdu3DJrCryDA0BRzfsVNs5SjZ5eRDeBOLL6NoBvq1DwyDMy/khlbjZG2EtItp+
	 ntzik3v4eryyQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sFyRU-000000003QA-18FM;
	Sat, 08 Jun 2024 17:57:20 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 09/12] dt-bindings: mfd: pm8008: Rework binding
Date: Sat,  8 Jun 2024 17:55:23 +0200
Message-ID: <20240608155526.12996-10-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240608155526.12996-1-johan+linaro@kernel.org>
References: <20240608155526.12996-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the pm8008 binding, which is currently unused, by dropping
internal details like register offsets and interrupts and by adding the
missing regulator and temperature alarm properties.

Note that child nodes are still used for pinctrl and regulator
configuration.

Also note that the pinctrl state definition will be extended later and
could eventually also be shared with other PMICs (e.g. by breaking out
bits of qcom,pmic-gpio.yaml).

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../devicetree/bindings/mfd/qcom,pm8008.yaml  | 135 +++++++++++-------
 1 file changed, 80 insertions(+), 55 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index d71657f488db..0c6e1870db1d 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -27,103 +27,128 @@ properties:
   reset-gpios:
     maxItems: 1
 
-  "#interrupt-cells":
+  vdd-l1-l2-supply: true
+  vdd-l3-l4-supply: true
+  vdd-l5-supply: true
+  vdd-l6-supply: true
+  vdd-l7-supply: true
+
+  gpio-controller: true
+
+  "#gpio-cells":
     const: 2
 
-    description: |
-      The first cell is the IRQ number, the second cell is the IRQ trigger
-      flag. All interrupts are listed in include/dt-bindings/mfd/qcom-pm8008.h.
+  gpio-ranges:
+    maxItems: 1
 
   interrupt-controller: true
 
-  "#address-cells":
-    const: 1
+  "#interrupt-cells":
+    const: 2
 
-  "#size-cells":
+  "#thermal-sensor-cells":
     const: 0
 
-patternProperties:
-  "^gpio@[0-9a-f]+$":
+  pinctrl:
     type: object
+    additionalProperties: false
+    patternProperties:
+      "-state$":
+        type: object
 
-    description: |
-      The GPIO peripheral. This node may be specified twice, one for each GPIO.
-
-    properties:
-      compatible:
-        items:
-          - const: qcom,pm8008-gpio
-          - const: qcom,spmi-gpio
-
-      reg:
-        description: Peripheral address of one of the two GPIO peripherals.
-        maxItems: 1
-
-      gpio-controller: true
-
-      gpio-ranges:
-        maxItems: 1
+        allOf:
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
 
-      interrupt-controller: true
+        properties:
+          pins:
+            items:
+              pattern: "^gpio[12]$"
 
-      "#interrupt-cells":
-        const: 2
+          function:
+            items:
+              - enum:
+                  - normal
 
-      "#gpio-cells":
-        const: 2
+        required:
+          - pins
+          - function
 
-    required:
-      - compatible
-      - reg
-      - gpio-controller
-      - interrupt-controller
-      - "#gpio-cells"
-      - gpio-ranges
-      - "#interrupt-cells"
+        additionalProperties: false
 
+  regulators:
+    type: object
     additionalProperties: false
+    patternProperties:
+      "^ldo[1-7]$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
 
 required:
   - compatible
   - reg
   - interrupts
-  - "#address-cells"
-  - "#size-cells"
+  - vdd-l1-l2-supply
+  - vdd-l3-l4-supply
+  - vdd-l5-supply
+  - vdd-l6-supply
+  - vdd-l7-supply
+  - gpio-controller
+  - "#gpio-cells"
+  - gpio-ranges
+  - interrupt-controller
   - "#interrupt-cells"
+  - "#thermal-sensor-cells"
 
 additionalProperties: false
 
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-    #include <dt-bindings/mfd/qcom-pm8008.h>
     #include <dt-bindings/interrupt-controller/irq.h>
 
     i2c {
       #address-cells = <1>;
       #size-cells = <0>;
 
-      pmic@8 {
+      pm8008: pmic@8 {
         compatible = "qcom,pm8008";
         reg = <0x8>;
-        #address-cells = <1>;
-        #size-cells = <0>;
-        interrupt-controller;
-        #interrupt-cells = <2>;
 
         interrupt-parent = <&tlmm>;
         interrupts = <32 IRQ_TYPE_EDGE_RISING>;
 
         reset-gpios = <&tlmm 42 GPIO_ACTIVE_LOW>;
 
-        pm8008_gpios: gpio@c000 {
-          compatible = "qcom,pm8008-gpio", "qcom,spmi-gpio";
-          reg = <0xc000>;
-          gpio-controller;
-          gpio-ranges = <&pm8008_gpios 0 0 2>;
-          #gpio-cells = <2>;
-          interrupt-controller;
-          #interrupt-cells = <2>;
+        vdd-l1-l2-supply = <&vreg_s8b_1p2>;
+        vdd-l3-l4-supply = <&vreg_s1b_1p8>;
+        vdd-l5-supply = <&vreg_bob>;
+        vdd-l6-supply = <&vreg_bob>;
+        vdd-l7-supply = <&vreg_bob>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pm8008 0 0 2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        #thermal-sensor-cells = <0>;
+
+        pinctrl {
+          gpio-keys-state {
+            pins = "gpio1";
+            function = "normal";
+          };
+        };
+
+        regulators {
+          ldo1 {
+            regulator-name = "vreg_l1";
+            regulator-min-microvolt = <950000>;
+            regulator-max-microvolt = <1300000>;
+          };
         };
       };
     };
-- 
2.44.1


