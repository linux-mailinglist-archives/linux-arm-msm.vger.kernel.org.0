Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 018C2365D56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 18:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233025AbhDTQ2I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 12:28:08 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:59791 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232504AbhDTQ2F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 12:28:05 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 20 Apr 2021 09:27:31 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 20 Apr 2021 09:27:28 -0700
X-QCInternal: smtphost
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 20 Apr 2021 21:56:55 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id 2BD06220D0; Tue, 20 Apr 2021 21:56:55 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v2 3/3] dt-bindings: net: bluetooth: Add device tree bindings for QTI chip wcn6750
Date:   Tue, 20 Apr 2021 21:56:50 +0530
Message-Id: <1618936010-16579-4-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618936010-16579-1-git-send-email-gubbaven@codeaurora.org>
References: <1618936010-16579-1-git-send-email-gubbaven@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch enables regulators and gpios for the Qualcomm Bluetooth wcn6750
controller.

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 .../bindings/net/qualcomm-bluetooth.yaml           | 54 +++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
index 55cd995..1ceb02b 100644
--- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
@@ -21,11 +21,17 @@ properties:
       - qcom,wcn3990-bt
       - qcom,wcn3991-bt
       - qcom,wcn3998-bt
-      - qcom,qca6390-bt      
+      - qcom,qca6390-bt
+      - qcom,wcn6750-bt
 
   enable-gpios:
     maxItems: 1
     description: gpio specifier used to enable chip
+
+  swctrl-gpios:
+    maxItems: 1
+    description: gpio specifier is used to find status
+                 of clock supply to SoC
    
   clocks:
     maxItems: 1
@@ -43,6 +49,30 @@ properties:
   vddch0-supply:
     description: VDD_CH0 supply regulator handle
 
+  vddaon-supply:
+    description: VDD_AON supply regulator handle
+
+  vddbtcxmx-supply:
+    description: VDD_BT_CXMX supply regualtor handle
+
+  vddrfacmn-supply:
+    description: VDD_RFA_CMN supply regulator handle
+
+  vddrfa0p8-supply:
+    description: VDD_RFA_0P8 suppply regulator handle
+
+  vddrfa1p7-supply:
+    description: VDD_RFA_1P7 supply regulator handle
+
+  vddrfa1p2-supply:
+    description: VDD_RFA_1P2 supply regulator handle
+
+  vddrfa2p2-supply:
+    description: VDD_RFA_2P2 supply regulator handle
+
+  vddasd-supply:
+    description: VDD_ASD supply regulator handle
+
   max-speed: 
     description: see Documentation/devicetree/bindings/serial/serial.yaml
 
@@ -85,3 +115,25 @@ examples:
             firmware-name = "crnv21.bin";		
         };
     };
+  - |
+    uart {
+
+        bluetooth {
+            compatible = "qcom,wcn6750-bt";
+            pinctrl-names = "default";
+            pinctrl-0 = <&bt_en_default>;
+            enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
+            swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
+            vddio-supply = <&vreg_l19b_1p8>;
+            vddaon-supply = <&vreg_s7b_0p9>;
+            vddbtcxmx-supply = <&vreg_s7b_0p9>;
+            vddrfacmn-supply = <&vreg_s7b_0p9>;
+            vddrfa0p8-supply = <&vreg_s7b_0p9>;
+            vddrfa1p7-supply = <&vreg_s1b_1p8>;
+            vddrfa1p2-supply = <&vreg_s8b_1p2>;
+            vddrfa2p2-supply = <&vreg_s1c_2p2>;
+            vddasd-supply = <&vreg_l11c_2p8>;
+            max-speed = <3200000>;
+            firmware-name = "msnv11.bin";
+        };
+    };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

