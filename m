Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0A2A375967
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 19:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236308AbhEFRey (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 13:34:54 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:43156 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236291AbhEFRex (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 13:34:53 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 06 May 2021 10:33:55 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 May 2021 10:33:54 -0700
X-QCInternal: smtphost
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 May 2021 23:03:16 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id C878622008; Thu,  6 May 2021 23:03:14 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v3 5/5] dt-bindings: net: bluetooth: Add device tree bindings for QTI chip wcn6750
Date:   Thu,  6 May 2021 23:03:12 +0530
Message-Id: <1620322392-27148-6-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620322392-27148-1-git-send-email-gubbaven@codeaurora.org>
References: <1620322392-27148-1-git-send-email-gubbaven@codeaurora.org>
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
index 3f3ec4d..0a90335 100644
--- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
@@ -21,11 +21,17 @@ properties:
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
@@ -42,6 +48,30 @@ properties:
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
 
@@ -84,6 +114,25 @@ allOf:
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
@@ -109,3 +158,25 @@ examples:
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

