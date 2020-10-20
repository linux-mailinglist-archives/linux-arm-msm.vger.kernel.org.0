Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F216B29450A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 00:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439008AbgJTWRi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 18:17:38 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:58331 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388361AbgJTWRh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 18:17:37 -0400
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Oct 2020 15:17:36 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg04-sd.qualcomm.com with ESMTP; 20 Oct 2020 15:17:35 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 309BA1946; Tue, 20 Oct 2020 15:17:35 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [RESEND PATCH v2 1/2] bindings: pm8941-misc: Convert to YAML and add support for VBUS detection
Date:   Tue, 20 Oct 2020 15:17:24 -0700
Message-Id: <1407c8a264de11cb9cd7a13b8f7b5f66ca957127.1603231949.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1603231949.git.gurus@codeaurora.org>
References: <cover.1603231949.git.gurus@codeaurora.org>
In-Reply-To: <cover.1603231949.git.gurus@codeaurora.org>
References: <cover.1603231949.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Anirudh Ghayal <aghayal@codeaurora.org>

Convert bindings to YAML. Also add compatible string that adds support
for reporting the VBUS status that can be detected via a dedicated PMIC
pin.

Signed-off-by: Anirudh Ghayal <aghayal@codeaurora.org>
Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 .../bindings/extcon/qcom,pm8941-misc.txt           | 41 ----------------
 .../bindings/extcon/qcom,pm8941-misc.yaml          | 56 ++++++++++++++++++++++
 2 files changed, 56 insertions(+), 41 deletions(-)
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
index 0000000..9fbdb5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/extcon/qcom,pm8941-misc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm's PM8941 USB ID Extcon device
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
+    oneOf:
+      - const:
+          - qcom,pm8941-misc
+          - qcom,pmd-vbus-det
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    anyOf:
+      - const:
+          - usb_id
+          - usb_vbus
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
+    pmic {
+            usb_id: misc@900 {
+                    compatible = "qcom,pm8941-misc";
+                    reg = <0x900>;
+                    interrupts = <0x0 0x9 0 IRQ_TYPE_EDGE_BOTH>;
+                    interrupt-names = "usb_id";
+            };
+    }
+
+    usb-controller {
+           extcon = <&usb_id>;
+    };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

