Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 425C12A352C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 21:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgKBUfH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 15:35:07 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:2106 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725801AbgKBUfB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 15:35:01 -0500
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Nov 2020 12:35:00 -0800
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg04-sd.qualcomm.com with ESMTP; 02 Nov 2020 12:35:00 -0800
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 5915C1874; Mon,  2 Nov 2020 12:35:00 -0800 (PST)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v5 1/3] bindings: pm8941-misc: Convert bindings to YAML
Date:   Mon,  2 Nov 2020 12:34:57 -0800
Message-Id: <0df2253571fa9aecf48c84dc2cf03c98dbced11b.1604349076.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1604349076.git.gurus@codeaurora.org>
References: <cover.1604349076.git.gurus@codeaurora.org>
In-Reply-To: <cover.1604349076.git.gurus@codeaurora.org>
References: <cover.1604349076.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert bindings from txt to YAML.

Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/extcon/qcom,pm8941-misc.txt           | 41 ---------------
 .../bindings/extcon/qcom,pm8941-misc.yaml          | 59 ++++++++++++++++++++++
 2 files changed, 59 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
 create mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml

diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
deleted file mode 100644
index 35383adb..0000000
--- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Qualcomm's PM8941 USB ID Extcon device
-
-Some Qualcomm PMICs have a "misc" module that can be used to detect when
-the USB ID pin has been pulled low or high.
-
-PROPERTIES
-
-- compatible:
-    Usage: required
-    Value type: <string>
-    Definition: Should contain "qcom,pm8941-misc";
-
-- reg:
-    Usage: required
-    Value type: <u32>
-    Definition: Should contain the offset to the misc address space
-
-- interrupts:
-    Usage: required
-    Value type: <prop-encoded-array>
-    Definition: Should contain the usb id interrupt
-
-- interrupt-names:
-    Usage: required
-    Value type: <stringlist>
-    Definition: Should contain the string "usb_id" for the usb id interrupt
-
-Example:
-
-	pmic {
-		usb_id: misc@900 {
-			compatible = "qcom,pm8941-misc";
-			reg = <0x900>;
-			interrupts = <0x0 0x9 0 IRQ_TYPE_EDGE_BOTH>;
-			interrupt-names = "usb_id";
-		};
-	}
-
-	usb-controller {
-		extcon = <&usb_id>;
-	};
diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
new file mode 100644
index 0000000..e8eea83
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/extcon/qcom,pm8941-misc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. PM8941 USB ID Extcon device
+
+maintainers:
+  - Guru Das Srinagesh <gurus@codeaurora.org>
+
+description: |
+  Some Qualcomm PMICs have a "misc" module that can be used to detect when
+  the USB ID pin has been pulled low or high.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,pm8941-misc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: usb_id
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            interrupt-controller;
+            #interrupt-cells = <4>;
+
+            usb_id: misc@900 {
+                    compatible = "qcom,pm8941-misc";
+                    reg = <0x900>;
+                    interrupts = <0x0 0x9 0 IRQ_TYPE_EDGE_BOTH>;
+                    interrupt-names = "usb_id";
+            };
+    };
+
+    usb-controller {
+           extcon = <&usb_id>;
+    };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

