Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7A0241D60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 17:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729054AbgHKPmK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 11:42:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:47564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729032AbgHKPmJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 11:42:09 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52B0322DFA;
        Tue, 11 Aug 2020 15:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597160524;
        bh=JjoLMtwSe1xqQZfb6XjgHibnuflvGVQqU9ygmR9RONM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ePkBdr66aDz7O1SFiMXdNIDTl1r9Omsi4eiLDFz10NcT3rKK9cRD0dtCtTnYLsTsO
         cjaljSn1FxA0eSR+fRp4DS0ujo1tsP/qak6/zecqXndPAWBw9Ej9Fw67OHZudjHjT6
         6x/t+LGYz46RLX3sLzL0CS78IPcW7SZ+1k3SdCnw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1k5WPa-004bnm-Ci; Tue, 11 Aug 2020 17:42:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 31/33] dt: document HiSilicon SPMI controller and mfd/regulator properties
Date:   Tue, 11 Aug 2020 17:41:57 +0200
Message-Id: <176043f329dfa9889f014feec04e7e1553077873.1597160086.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597160086.git.mchehab+huawei@kernel.org>
References: <cover.1597160086.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add documentation for the properties needed by the HiSilicon
6421v600 driver, and by the SPMI controller used to access
the chipset.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 175 ++++++++++++++++++
 .../spmi/hisilicon,hisi-spmi-controller.yaml  |  54 ++++++
 2 files changed, 229 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml

diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
new file mode 100644
index 000000000000..33dcbaeb474e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
@@ -0,0 +1,175 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/hisilicon,hi6421v600-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon 6421v600 SPMI PMIC
+
+maintainers:
+  - Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+
+description: |
+  HiSilicon 6421v600 uses a MIPI System Power Management (SPMI) bus in order
+  to provide interrupts and power supply.
+
+  The GPIO and interrupt settings are represented as part of the top-level PMIC
+  node.
+
+  The SPMI controller part is provided by
+  Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml.
+
+properties:
+  $nodename:
+    pattern: "pmic@[0-9a-f]"
+
+  compatible:
+    const: hisilicon,hi6421-spmi-pmic
+
+  reg:
+    maxItems: 1
+
+  spmi-channel:
+    description: number of the SPMI channel where the PMIC is connected
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupt-controller:
+    description:
+      Identify that the PMIC is capable of behaving as an interrupt controller.
+
+  gpios:
+    maxItems: 1
+
+  irq-num:
+    description: Interrupt request number
+
+  'irq-array':
+    description: Interrupt request array
+
+  'irq-mask-addr':
+    description: Address for the interrupt request mask
+
+  'irq-addr':
+    description: Address for the interrupt request
+
+  regulators:
+    type: object
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^ldo@[0-9]+$':
+        type: object
+
+        $ref: "/schemas/regulator/regulator.yaml#"
+
+        properties:
+          reg:
+            description: Enable register.
+
+          vsel-reg:
+            description: Voltage selector register.
+
+          enable-mask:
+            description: Bitmask used to enable the regulator.
+
+#          voltage-table:
+#            description: Table with the selector items for the voltage regulator.
+#            minItems: 2
+#            maxItems: 16
+
+          off-on-delay-us:
+            description: Time required for changing state to enabled in microseconds.
+
+          startup-delay-us:
+            description: Startup time in microseconds.
+
+          idle-mode-mask:
+            description: Bitmask used to put the regulator on idle mode.
+
+          eco-microamp:
+            description: Maximum current while on idle mode.
+
+        required:
+          - reg
+          - vsel-reg
+          - enable-mask
+          - voltage-table
+          - off-on-delay-us
+          - startup-delay-us
+
+required:
+  - compatible
+  - reg
+  - spmi-channel
+  - regulators
+
+examples:
+  - |
+    pmic: pmic@0 {
+      compatible = "hisilicon,hi6421-spmi-pmic";
+      slave_id = <0>;
+      reg = <0 0>;
+
+      #interrupt-cells = <2>;
+      interrupt-controller;
+      gpios = <&gpio28 0 0>;
+      irq-num = <16>;
+      irq-array = <2>;
+      irq-mask-addr = <0x202 2>;
+      irq-addr = <0x212 2>;
+
+      regulators {
+        ldo3: ldo3@16 {
+          reg = <0x16>;
+          vsel-reg = <0x51>;
+
+          regulator-name = "ldo3";
+          regulator-min-microvolt = <1500000>;
+          regulator-max-microvolt = <2000000>;
+          regulator-boot-on;
+
+          enable-mask = <0x01>;
+
+          voltage-table = <1500000>, <1550000>,
+              <1600000>, <1650000>,
+              <1700000>, <1725000>,
+              <1750000>, <1775000>,
+              <1800000>, <1825000>,
+              <1850000>, <1875000>,
+              <1900000>, <1925000>,
+              <1950000>, <2000000>;
+          off-on-delay-us = <20000>;
+          startup-delay-us = <120>;
+        };
+
+        ldo4: ldo4@17 { /* 40 PIN */
+          reg = <0x17>;
+          vsel-reg = <0x52>;
+
+          regulator-name = "ldo4";
+          regulator-min-microvolt = <1725000>;
+          regulator-max-microvolt = <1900000>;
+          regulator-boot-on;
+
+          enable-mask = <0x01>;
+          idle-mode-mask = <0x10>;
+          eco-microamp = <10000>;
+
+          hi6421-vsel = <0x52 0x07>;
+          voltage-table = <1725000>, <1750000>,
+              <1775000>, <1800000>,
+              <1825000>, <1850000>,
+              <1875000>, <1900000>;
+          off-on-delay-us = <20000>;
+          startup-delay-us = <120>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml b/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
new file mode 100644
index 000000000000..d087f9067e4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/hisilicon,hisi-spmi-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon SPMI controller
+
+maintainers:
+  - Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+
+description: |
+  The HiSilicon SPMI controller is found on some Kirin-based designs.
+  It is a MIPI System Power Management (SPMI) controller.
+
+  The PMIC part is provided by
+  Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml.
+
+properties:
+  $nodename:
+    pattern: "spmi@[0-9a-f]"
+
+  compatible:
+    const: hisilicon,spmi-controller
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 0
+
+  spmi-channel:
+    const: number of the SPMI channel where the PMIC is connected
+
+patternProperties:
+  "^pmic@[0-9a-f]$":
+    $ref: "/schemas/mfd/hisilicon,hi6421-spmi-pmic.yaml#"
+
+examples:
+  - |
+    spmi: spmi@fff24000 {
+      compatible = "hisilicon,spmi-controller";
+      #address-cells = <2>;
+      #size-cells = <0>;
+      status = "ok";
+      reg = <0x0 0xfff24000 0x0 0x1000>;
+      spmi-channel = <2>;
+
+      /* pmic properties */
+
+    };
-- 
2.26.2

