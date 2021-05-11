Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4244379B6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 02:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbhEKA2U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 20:28:20 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:9537 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230436AbhEKA2Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 20:28:16 -0400
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 10 May 2021 17:27:10 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg03-sd.qualcomm.com with ESMTP; 10 May 2021 17:27:10 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 423241F2B2; Mon, 10 May 2021 17:27:10 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v4 2/3] dt-bindings: mfd: pm8008: Add bindings
Date:   Mon, 10 May 2021 17:27:07 -0700
Message-Id: <1b252357a72afea20e620e0268bcb6ff1e55e8d2.1620690653.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1620690653.git.gurus@codeaurora.org>
References: <cover.1620690653.git.gurus@codeaurora.org>
In-Reply-To: <cover.1620690653.git.gurus@codeaurora.org>
References: <cover.1620690653.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings for the Qualcomm Technologies, Inc. PM8008 MFD driver.

Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
new file mode 100644
index 0000000..7799368
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/qcom,pm8008.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. PM8008 PMIC bindings
+
+maintainers:
+  - Guru Das Srinagesh <gurus@codeaurora.org>
+
+description: |
+  Qualcomm Technologies, Inc. PM8008 is a dedicated camera PMIC that integrates
+  all the necessary power management, housekeeping, and interface support
+  functions into a single IC.
+
+properties:
+  compatible:
+    const: qcom,pm8008
+
+  reg:
+    description:
+      I2C slave address.
+
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+    description: Parent interrupt.
+
+  "#interrupt-cells":
+    const: 2
+
+    description: |
+      The first cell is the IRQ number, the second cell is the IRQ trigger
+      flag. All interrupts are listed in include/dt-bindings/mfd/qcom-pm8008.h.
+
+  interrupt-controller: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    type: object
+
+    description: |
+      The GPIO peripheral. This node may be specified twice, one for each GPIO.
+
+    properties:
+      compatible:
+        const: qcom,pm8008-gpio
+
+      reg:
+        description: Peripheral address of one of the two GPIO peripherals.
+        maxItems: 1
+
+      gpio-controller: true
+
+      interrupt-controller: true
+
+      "#interrupt-cells":
+        const: 2
+
+      "#gpio-cells":
+        const: 2
+
+    required:
+      - compatible
+      - reg
+      - gpio-controller
+      - interrupt-controller
+      - "#gpio-cells"
+      - "#interrupt-cells"
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#address-cells"
+  - "#size-cells"
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/mfd/qcom-pm8008.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    qupv3_se13_i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      pm8008i@8 {
+        compatible = "qcom,pm8008";
+        reg = <0x8>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        interrupt-parent = <&tlmm>;
+        interrupts = <32 IRQ_TYPE_EDGE_RISING>;
+
+        gpio@c000 {
+          compatible = "qcom,pm8008-gpio";
+          reg = <0xc000>;
+          gpio-controller;
+          #gpio-cells = <2>;
+          interrupt-controller;
+          #interrupt-cells = <2>;
+        };
+      };
+    };
+
+...
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

