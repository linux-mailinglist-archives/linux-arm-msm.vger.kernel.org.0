Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0536B19EAC4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2020 13:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgDELaI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Apr 2020 07:30:08 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:52995 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726388AbgDELaH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Apr 2020 07:30:07 -0400
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 05 Apr 2020 04:30:06 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg03-sd.qualcomm.com with ESMTP; 05 Apr 2020 04:30:03 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id 72B4E213E1; Sun,  5 Apr 2020 17:00:02 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaprak@codeaurora.org
Subject: [PATCH V2 2/8] dt-bindings: clock: Add YAML schemas for QCOM A53 PLL
Date:   Sun,  5 Apr 2020 16:59:19 +0530
Message-Id: <1586086165-19426-3-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586086165-19426-1-git-send-email-sivaprak@codeaurora.org>
References: <1586086165-19426-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds schema for primary CPU PLL found on few Qualcomm
platforms.

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,a53pll.txt      | 22 --------
 .../devicetree/bindings/clock/qcom,a53pll.yaml     | 60 ++++++++++++++++++++++
 2 files changed, 60 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.txt b/Documentation/devicetree/bindings/clock/qcom,a53pll.txt
deleted file mode 100644
index e3fa811..0000000
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Qualcomm MSM8916 A53 PLL Binding
---------------------------------
-The A53 PLL on MSM8916 platforms is the main CPU PLL used used for frequencies
-above 1GHz.
-
-Required properties :
-- compatible : Shall contain only one of the following:
-
-		"qcom,msm8916-a53pll"
-
-- reg : shall contain base register location and length
-
-- #clock-cells : must be set to <0>
-
-Example:
-
-	a53pll: clock@b016000 {
-		compatible = "qcom,msm8916-a53pll";
-		reg = <0xb016000 0x40>;
-		#clock-cells = <0>;
-	};
-
diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
new file mode 100644
index 0000000..97b234e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/clock/qcom,a53pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm A53 PLL Binding
+
+maintainers:
+  - Sivaprakash Murugesan <sivaprak@codeaurora.org>
+
+description:
+  The A53 PLL on few Qualcomm platforms is the main CPU PLL used used for
+  frequencies above 1GHz.
+
+properties:
+  compatible:
+    enum:
+      - qcom,msm8916-a53pll
+      - qcom,ipq6018-a53pll
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 0
+
+  clocks:
+    description: clocks required for this controller.
+    maxItems: 1
+
+  clock-names:
+    description: clock output names of required clocks.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  #Example 1 - A53 PLL found on MSM8916 devices
+  - |
+    a53pll: clock@b016000 {
+        compatible = "qcom,msm8916-a53pll";
+        reg = <0xb016000 0x40>;
+        #clock-cells = <0>;
+    };
+
+  #Example 2 - A53 PLL found on IPQ6018 devices
+  - |
+    a53pll_ipq: clock@b116000 {
+        compatible = "qcom,ipq6018-a53pll";
+        reg = <0x0b116000 0x40>;
+        #clock-cells = <0>;
+        clocks = <&xo>;
+        clock-names = "xo";
+    };
-- 
2.7.4

