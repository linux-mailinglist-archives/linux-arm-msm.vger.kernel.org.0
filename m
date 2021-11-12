Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E153444E11E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 05:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234827AbhKLE2w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 23:28:52 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:34405 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234668AbhKLE2g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 23:28:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636691148; x=1668227148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=mWDHQ1S9h151H96Bwtp6NOHPdgPf47Kp0+YHiOlqRlQ=;
  b=OiqYk+i4tHJjA4QJxi2ezJr8yaRI4ZHkXbw7+aJF6eKRjN0not2lFK9h
   JAWab5qrem1+PrNceS8FJfijZMauALP3anoy02Jna6BbpkJdQrtrmgYtl
   N+S2h96FWM1xRw+FWqLVgTfv0OqFc0hvcwhZA1dYfcGFf2c4YIc3ZB2O1
   U=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 11 Nov 2021 20:25:47 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 20:25:47 -0800
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 11 Nov 2021 20:25:47 -0800
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 11 Nov 2021 20:25:44 -0800
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        <devicetree@vger.kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <tglx@linutronix.de>, <maz@kernel.org>
Subject: [RESEND PATCH v2 11/11] dt-bindings: convert qcom,spmi-pmic-arb binding to YAML format
Date:   Fri, 12 Nov 2021 12:24:19 +0800
Message-ID: <1636691059-4305-12-git-send-email-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636691059-4305-1-git-send-email-quic_fenglinw@quicinc.com>
References: <1636691059-4305-1-git-send-email-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the SPMI PMIC arbiter documentation to JSON/yaml.

Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 .../bindings/spmi/qcom,spmi-pmic-arb.txt           |  67 -----------
 .../bindings/spmi/qcom,spmi-pmic-arb.yaml          | 122 +++++++++++++++++++++
 2 files changed, 122 insertions(+), 67 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
 create mode 100644 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml

diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
deleted file mode 100644
index 6332507..0000000
--- a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
+++ /dev/null
@@ -1,67 +0,0 @@
-Qualcomm SPMI Controller (PMIC Arbiter)
-
-The SPMI PMIC Arbiter is found on Snapdragon chipsets.  It is an SPMI
-controller with wrapping arbitration logic to allow for multiple on-chip
-devices to control a single SPMI master.
-
-The PMIC Arbiter can also act as an interrupt controller, providing interrupts
-to slave devices.
-
-See Documentation/devicetree/bindings/spmi/spmi.yaml for the generic SPMI
-controller binding requirements for child nodes.
-
-See Documentation/devicetree/bindings/interrupt-controller/interrupts.txt for
-generic interrupt controller binding documentation.
-
-Required properties:
-- compatible : should be "qcom,spmi-pmic-arb".
-- reg-names  : must contain:
-     "core" - core registers
-     "intr" - interrupt controller registers
-     "cnfg" - configuration registers
-   Registers used only for V2 PMIC Arbiter:
-     "chnls"  - tx-channel per virtual slave registers.
-     "obsrvr" - rx-channel (called observer) per virtual slave registers.
-
-- reg : address + size pairs describing the PMIC arb register sets; order must
-        correspond with the order of entries in reg-names
-- #address-cells : must be set to 2
-- #size-cells : must be set to 0
-- qcom,ee : indicates the active Execution Environment identifier (0-5)
-- qcom,channel : which of the PMIC Arb provided channels to use for accesses (0-5)
-
-Optional properties:
-- interrupts : interrupt list for the PMIC Arb controller, must contain a
-               single interrupt entry for the peripheral interrupt
-- interrupt-names : corresponding interrupt names for the interrupts
-                    listed in the 'interrupts' property, must contain:
-     "periph_irq" - summary interrupt for PMIC peripherals
-- interrupt-controller : boolean indicator that the PMIC arbiter is an interrupt controller
-- #interrupt-cells :  must be set to 4. Interrupts are specified as a 4-tuple:
-    cell 1: slave ID for the requested interrupt (0-15)
-    cell 2: peripheral ID for requested interrupt (0-255)
-    cell 3: the requested peripheral interrupt (0-7)
-    cell 4: interrupt flags indicating level-sense information, as defined in
-            dt-bindings/interrupt-controller/irq.h
-
-Example:
-
-	spmi {
-		compatible = "qcom,spmi-pmic-arb";
-		reg-names = "core", "intr", "cnfg";
-		reg = <0xfc4cf000 0x1000>,
-		      <0xfc4cb000 0x1000>,
-		      <0xfc4ca000 0x1000>;
-
-		interrupt-names = "periph_irq";
-		interrupts = <0 190 0>;
-
-		qcom,ee = <0>;
-		qcom,channel = <0>;
-
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		interrupt-controller;
-		#interrupt-cells = <4>;
-	};
diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
new file mode 100644
index 0000000..ac97b93
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI PMIC Arbiter
+
+maintainers:
+  - Fenglin Wu <quic_fenglinw@quicinc.com>
+
+description: |
+  The SPMI PMIC Arbiter is found on Snapdragon chipsets. It is an SPMI
+  controller with wrapping arbitration logic to allow for multiple
+  on-chip devices to control a single SPMI master.
+
+  The PMIC Arbiter can also act as an interrupt controller, providing
+  interrupts to slave devices.
+
+  See Documentation/devicetree/bindings/spmi/spmi.yaml for the generic
+  SPMI controller binding requirements for child nodes.
+
+properties:
+  $nodename:
+    pattern: "^spmi@.*"
+
+  compatible:
+    const: qcom,spmi-pmic-arb
+
+  reg-names:
+    minItems: 3
+    maxItems: 5
+    items:
+      - const: core
+      - const: intr
+      - const: cnfg
+      - const: chnls
+      - const: obsrvr
+
+  reg:
+    minItems: 3
+    maxItems: 5
+    description: |
+      Specifies base physical address and size of the registers in SPMI PMIC
+      Arbiter HW module, with the following order.
+        - SPMI PMIC arbiter core registers (core)
+        - SPMI PMIC arbiter interrupt controller registers (intr)
+        - SPMI PMIC arbiter configuration registers (cnfg)
+        - SPMI PMIC arbiter tx-channel per virtual slave registers (chnls)
+        - SPMI PMIC arbiter rx-channel per virtual slave registers (obsrvr).
+      Register for "chnls" and "obsrvr" are only applicable for PMIC arbiter
+      with HW version greater than V2.
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 0
+
+  interrupts:
+    description: The summary interrupt for the PMIC Arb controller.
+    maxItems: 1
+
+  interrupt-names:
+    maxItems: 1
+    const: periph_irq
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 4
+    description: |
+      Specifies the number of cells needed to encode any interrupt source.
+      The 1st cell is the slave ID for the requested interrupt, its valid
+      range is [0-15].
+      The 2nd cell is the  peripheral ID for requested interrupt, its valid
+      range is [0-255].
+      The 3rd cell is the requested peripheral interrupt, its valid range
+      is [0-7].
+      The 4th cell is interrupt flags indicating level-sense information,
+      as defined in dt-bindings/interrupt-controller/irq.h
+
+  qcom,ee:
+    description: the active Execution Environment identifier
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3, 4, 5]
+
+  qcom,channel:
+    description: which of the PMIC Arbiter provided channels to use for accesses
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3, 4, 5]
+
+required:
+  - compatible
+  - reg-names
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - qcom,ee
+  - qcom,channel
+
+additionalProperties: false
+
+examples:
+  - |
+    spmi@fc4cf000 {
+          compatible = "qcom,spmi-pmic-arb";
+          reg-names = "core", "intr", "cnfg";
+          reg = <0xfc4cf000 0x1000>,
+                <0xfc4cb000 0x1000>,
+                <0xfc4ca000 0x1000>;
+          interrupt-names = "periph_irq";
+          interrupts = <0 190 0>;
+          interrupt-controller;
+          #interrupt-cells = <4>;
+
+          qcom,ee = <0>;
+          qcom,channel = <0>;
+
+          #address-cells = <2>;
+          #size-cells = <0>;
+    };
-- 
2.7.4

