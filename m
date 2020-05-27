Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56B701E427B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 14:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730113AbgE0Mia (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 08:38:30 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:53970 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728964AbgE0MiW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 08:38:22 -0400
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 27 May 2020 05:38:21 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg03-sd.qualcomm.com with ESMTP; 27 May 2020 05:38:18 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id CF00621614; Wed, 27 May 2020 18:08:16 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH 1/4] dt-bindings: mailbox: Add YAML schemas for QCOM APCS global block
Date:   Wed, 27 May 2020 18:08:09 +0530
Message-Id: <1590583092-24290-2-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590583092-24290-1-git-send-email-sivaprak@codeaurora.org>
References: <1590583092-24290-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm APCS global block provides a bunch of generic properties which
are required in a device tree. Add YAML schema for these properties.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 .../bindings/mailbox/qcom,apcs-kpss-global.txt     | 88 ----------------------
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    | 86 +++++++++++++++++++++
 2 files changed, 86 insertions(+), 88 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
deleted file mode 100644
index beec612..0000000
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
+++ /dev/null
@@ -1,88 +0,0 @@
-Binding for the Qualcomm APCS global block
-==========================================
-
-This binding describes the APCS "global" block found in various Qualcomm
-platforms.
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		    "qcom,msm8916-apcs-kpss-global",
-		    "qcom,msm8996-apcs-hmss-global"
-		    "qcom,msm8998-apcs-hmss-global"
-		    "qcom,qcs404-apcs-apps-global"
-		    "qcom,sc7180-apss-shared"
-		    "qcom,sdm845-apss-shared"
-		    "qcom,sm8150-apss-shared"
-		    "qcom,ipq8074-apcs-apps-global"
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: must specify the base address and size of the global block
-
-- clocks:
-	Usage: required if #clock-names property is present
-	Value type: <phandle array>
-	Definition: phandles to the two parent clocks of the clock driver.
-
-- #mbox-cells:
-	Usage: required
-	Value type: <u32>
-	Definition: as described in mailbox.txt, must be 1
-
-- #clock-cells:
-	Usage: optional
-	Value type: <u32>
-	Definition: as described in clock.txt, must be 0
-
-- clock-names:
-	Usage: required if the platform data based clock driver needs to
-	retrieve the parent clock names from device tree.
-	This will requires two mandatory clocks to be defined.
-	Value type: <string-array>
-	Definition: must be "pll" and "aux"
-
-= EXAMPLE
-The following example describes the APCS HMSS found in MSM8996 and part of the
-GLINK RPM referencing the "rpm_hlos" doorbell therein.
-
-	apcs_glb: mailbox@9820000 {
-		compatible = "qcom,msm8996-apcs-hmss-global";
-		reg = <0x9820000 0x1000>;
-
-		#mbox-cells = <1>;
-	};
-
-	rpm-glink {
-		compatible = "qcom,glink-rpm";
-
-		interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
-
-		qcom,rpm-msg-ram = <&rpm_msg_ram>;
-
-		mboxes = <&apcs_glb 0>;
-		mbox-names = "rpm_hlos";
-	};
-
-Below is another example of the APCS binding on MSM8916 platforms:
-
-	apcs: mailbox@b011000 {
-		compatible = "qcom,msm8916-apcs-kpss-global";
-		reg = <0xb011000 0x1000>;
-		#mbox-cells = <1>;
-		clocks = <&a53pll>;
-		#clock-cells = <0>;
-	};
-
-Below is another example of the APCS binding on QCS404 platforms:
-
-	apcs_glb: mailbox@b011000 {
-		compatible = "qcom,qcs404-apcs-apps-global", "syscon";
-		reg = <0x0b011000 0x1000>;
-		#mbox-cells = <1>;
-		clocks = <&apcs_hfpll>, <&gcc GCC_GPLL0_AO_OUT_MAIN>;
-		clock-names = "pll", "aux";
-		#clock-cells = <0>;
-	};
diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
new file mode 100644
index 0000000..12eff94
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm APCS global block bindings
+
+description:
+  This binding describes the APCS "global" block found in various Qualcomm
+  platforms.
+
+maintainers:
+  - Sivaprakash Murugesan <sivaprak@codeaurora.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq8074-apcs-apps-global
+      - qcom,msm8916-apcs-kpss-global
+      - qcom,msm8996-apcs-hmss-global
+      - qcom,msm8998-apcs-hmss-global
+      - qcom,qcs404-apcs-apps-global
+      - qcom,sc7180-apss-shared
+      - qcom,sdm845-apss-shared
+      - qcom,sm8150-apss-shared
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: phandles to the parent clocks of the clock driver
+    items:
+      - description: primary pll parent of the clock driver
+      - description: auxiliary parent
+
+  '#mbox-cells':
+    const: 1
+
+  '#clock-cells':
+    const: 0
+
+  clock-names:
+    items:
+      - const: pll
+      - const: aux
+
+required:
+  - compatible
+  - reg
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+
+  # Example apcs with msm8996
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    apcs_glb: mailbox@9820000 {
+        compatible = "qcom,msm8996-apcs-hmss-global";
+        reg = <0x9820000 0x1000>;
+
+        #mbox-cells = <1>;
+    };
+
+    rpm-glink {
+        compatible = "qcom,glink-rpm";
+        interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+        qcom,rpm-msg-ram = <&rpm_msg_ram>;
+        mboxes = <&apcs_glb 0>;
+        mbox-names = "rpm_hlos";
+    };
+
+  # Example apcs with qcs404
+  - |
+    #define GCC_APSS_AHB_CLK_SRC  1
+    #define GCC_GPLL0_AO_OUT_MAIN 123
+    apcs: mailbox@b011000 {
+        compatible = "qcom,qcs404-apcs-apps-global";
+        reg = <0x0b011000 0x1000>;
+        #mbox-cells = <1>;
+        clocks = <&apcs_hfpll>, <&gcc GCC_GPLL0_AO_OUT_MAIN>;
+        clock-names = "pll", "aux";
+        #clock-cells = <0>;
+    };
-- 
2.7.4

