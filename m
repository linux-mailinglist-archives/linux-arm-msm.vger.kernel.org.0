Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C471387DBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 18:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350846AbhERQgs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 12:36:48 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:37559 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350815AbhERQgo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 12:36:44 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 18 May 2021 09:35:26 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 18 May 2021 09:35:25 -0700
X-QCInternal: smtphost
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 18 May 2021 22:04:50 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id A7F762217F; Tue, 18 May 2021 22:04:48 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v4 5/5] dt-bindings: net: bluetooth: Add device tree bindings for QTI chip wcn6750
Date:   Tue, 18 May 2021 22:04:46 +0530
Message-Id: <1621355686-29550-6-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621355686-29550-1-git-send-email-gubbaven@codeaurora.org>
References: <1621355686-29550-1-git-send-email-gubbaven@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch enables regulators and gpios for the Qualcomm Bluetooth wcn6750
controller.

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 .../bindings/net/qualcomm-bluetooth.yaml           | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
index 772689b..f93c6e7 100644
--- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
@@ -22,11 +22,17 @@ properties:
       - qcom,wcn3991-bt
       - qcom,wcn3998-bt
       - qcom,qca6390-bt
+      - qcom,wcn6750-bt
 
   enable-gpios:
     maxItems: 1
     description: gpio specifier used to enable chip
 
+  swctrl-gpios:
+    maxItems: 1
+    description: gpio specifier is used to find status
+                 of clock supply to SoC
+
   clocks:
     maxItems: 1
     description: clock provided to the controller (SUSCLK_32KHZ)
@@ -43,6 +49,30 @@ properties:
   vddch0-supply:
     description: VDD_CH0 supply regulator handle
 
+  vddaon-supply:
+    description: VDD_AON supply regulator handle
+
+  vddbtcxmx-supply:
+    description: VDD_BT_CXMX supply regulator handle
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
 
@@ -85,6 +115,25 @@ allOf:
         - vddrf-supply
         - vddch0-supply
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,wcn6750-bt
+    then:
+      required:
+        - enable-gpios
+        - swctrl-gpios
+        - vddio-supply
+        - vddaon-supply
+        - vddbtcxmx-supply
+        - vddrfacmn-supply
+        - vddrfa0p8-supply
+        - vddrfa1p7-supply
+        - vddrfa1p2-supply
+        - vddasd-supply
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
@@ -110,3 +159,25 @@ examples:
             firmware-name = "crnv21.bin";
         };
     };
+  - |
+    serial {
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

