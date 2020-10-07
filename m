Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C602869DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Oct 2020 23:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728599AbgJGVJo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Oct 2020 17:09:44 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:37023 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728554AbgJGVJo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Oct 2020 17:09:44 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Oct 2020 14:09:43 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg01-sd.qualcomm.com with ESMTP; 07 Oct 2020 14:09:43 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 2ED4A1962; Wed,  7 Oct 2020 14:09:43 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joe Perches <joe@perches.com>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [RFC PATCH v1 2/3] dt-bindings: mfd: Add QCOM PM8008 MFD bindings
Date:   Wed,  7 Oct 2020 14:09:40 -0700
Message-Id: <7a89811f36fe858756daa62f1162d18da7e79a73.1602099524.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1602099524.git.gurus@codeaurora.org>
References: <cover.1602099524.git.gurus@codeaurora.org>
In-Reply-To: <cover.1602099524.git.gurus@codeaurora.org>
References: <cover.1602099524.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for the driver for Qualcomm Technology Inc.'s
PM8008 MFD PMIC.

Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 .../bindings/mfd/qcom,pm8008-irqchip.yaml          | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.yaml

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.yaml
new file mode 100644
index 0000000..296ff85
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/qcom/qcom,pm8008-irqchip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. PM8008 Multi-Function Device PMIC
+
+maintainers:
+  - Guru Das Srinagesh <gurus@codeaurora.org>
+
+description: |
+  PM8008 is a PMIC that contains 7 LDOs, 2 GPIOs, temperature monitoring, and
+  can be interfaced over I2C.
+
+properties:
+  compatible:
+    const: qcom,pm8008-irqchip
+
+  reg:
+    maxItems: 1
+
+  interrupt-names:
+    const: pm8008
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller:
+    type: boolean
+
+  "#address-cells":
+    const: 1
+    description:
+      Must be specified if child nodes are specified.
+
+  "#size-cells":
+    const: 0
+    description:
+      Must be specified if child nodes are specified.
+
+  "#interrupt-cells":
+    const: 2
+    description:
+      The first cell is the IRQ number, the second cell is the IRQ trigger flag.
+
+patternProperties:
+  "^.*[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-f]+$":
+    type: object
+    # Each peripheral in PM8008 must be represented as a child node with an
+    # optional label for referencing as phandle elsewhere. This is optional.
+    properties:
+      compatible:
+        description:
+          The compatible string for the peripheral's driver.
+
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - interrupts
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    &qupv3_se13_i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+    
+            pm8008i@8 {
+                    compatible = "qcom,pm8008-irqchip";
+                    reg = <0x8>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    interrupt-controller;
+                    #interrupt-cells = <2>;
+    
+                    interrupt-names = "pm8008";
+                    interrupt-parent = <&tlmm>;
+                    interrupts = <32 IRQ_TYPE_EDGE_RISING>;
+    
+                    pm8008_tz: qcom,temp-alarm@2400 {
+                            compatible = "qcom,spmi-temp-alarm";
+                            reg = <0x2400>;
+                            interrupts = <0x5 IRQ_TYPE_EDGE_BOTH>;
+                            #thermal-sensor-cells = <0>;
+                    };
+    	    };
+   };
+
+...
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

