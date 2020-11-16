Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F212B52CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 21:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733182AbgKPUki (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 15:40:38 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:57955 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733151AbgKPUkf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 15:40:35 -0500
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Nov 2020 12:40:34 -0800
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg02-sd.qualcomm.com with ESMTP; 16 Nov 2020 12:40:34 -0800
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 0DDD9190C; Mon, 16 Nov 2020 12:40:33 -0800 (PST)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v6 1/3] bindings: pm8941-misc: Convert bindings to YAML
Date:   Mon, 16 Nov 2020 12:40:30 -0800
Message-Id: <bbb4bb0ee3537f131ec42252789adcd2afe41b01.1605559069.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1605559069.git.gurus@codeaurora.org>
References: <cover.1605559069.git.gurus@codeaurora.org>
In-Reply-To: <cover.1605559069.git.gurus@codeaurora.org>
References: <cover.1605559069.git.gurus@codeaurora.org>
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

