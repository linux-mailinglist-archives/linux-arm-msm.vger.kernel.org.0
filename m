Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 467CA365D51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 18:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233131AbhDTQ2J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 12:28:09 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:59791 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbhDTQ2I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 12:28:08 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 20 Apr 2021 09:27:36 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 20 Apr 2021 09:27:33 -0700
X-QCInternal: smtphost
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 20 Apr 2021 21:56:55 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id 03C56220CB; Tue, 20 Apr 2021 21:56:54 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v2 2/3] dt-bindings: net: bluetooth: Convert to DT schema
Date:   Tue, 20 Apr 2021 21:56:49 +0530
Message-Id: <1618936010-16579-3-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618936010-16579-1-git-send-email-gubbaven@codeaurora.org>
References: <1618936010-16579-1-git-send-email-gubbaven@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Converted Qualcomm Bluetooth binidings to DT schema.

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 .../devicetree/bindings/net/qualcomm-bluetooth.txt | 69 -----------------
 .../bindings/net/qualcomm-bluetooth.yaml           | 87 ++++++++++++++++++++++
 2 files changed, 87 insertions(+), 69 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
 create mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml

diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
deleted file mode 100644
index 709ca6d..0000000
--- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
+++ /dev/null
@@ -1,69 +0,0 @@
-Qualcomm Bluetooth Chips
----------------------
-
-This documents the binding structure and common properties for serial
-attached Qualcomm devices.
-
-Serial attached Qualcomm devices shall be a child node of the host UART
-device the slave device is attached to.
-
-Required properties:
- - compatible: should contain one of the following:
-   * "qcom,qca6174-bt"
-   * "qcom,qca9377-bt"
-   * "qcom,wcn3990-bt"
-   * "qcom,wcn3991-bt"
-   * "qcom,wcn3998-bt"
-   * "qcom,qca6390-bt"
-
-Optional properties for compatible string qcom,qca6174-bt:
-
- - enable-gpios: gpio specifier used to enable chip
- - clocks: clock provided to the controller (SUSCLK_32KHZ)
- - firmware-name: specify the name of nvm firmware to load
-
-Optional properties for compatible string qcom,qca9377-bt:
-
- - max-speed: see Documentation/devicetree/bindings/serial/serial.yaml
-
-Required properties for compatible string qcom,wcn399x-bt:
-
- - vddio-supply: VDD_IO supply regulator handle.
- - vddxo-supply: VDD_XO supply regulator handle.
- - vddrf-supply: VDD_RF supply regulator handle.
- - vddch0-supply: VDD_CH0 supply regulator handle.
-
-Optional properties for compatible string qcom,wcn399x-bt:
-
- - max-speed: see Documentation/devicetree/bindings/serial/serial.yaml
- - firmware-name: specify the name of nvm firmware to load
- - clocks: clock provided to the controller
-
-Examples:
-
-serial@7570000 {
-	label = "BT-UART";
-	status = "okay";
-
-	bluetooth {
-		compatible = "qcom,qca6174-bt";
-
-		enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
-		clocks = <&divclk4>;
-		firmware-name = "nvm_00440302.bin";
-	};
-};
-
-serial@898000 {
-	bluetooth {
-		compatible = "qcom,wcn3990-bt";
-
-		vddio-supply = <&vreg_s4a_1p8>;
-		vddxo-supply = <&vreg_l7a_1p8>;
-		vddrf-supply = <&vreg_l17a_1p3>;
-		vddch0-supply = <&vreg_l25a_3p3>;
-		max-speed = <3200000>;
-		firmware-name = "crnv21.bin";
-		clocks = <&rpmhcc RPMH_RF_CLK2>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
new file mode 100644
index 0000000..55cd995
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Bluetooth Chips
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+  - Marcel Holtmann <marcel@holtmann.org>
+
+description:
+  This binding describes Qualcomm UART-attached bluetooth chips.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qca6174-bt
+      - qcom,qca9377-bt
+      - qcom,wcn3990-bt
+      - qcom,wcn3991-bt
+      - qcom,wcn3998-bt
+      - qcom,qca6390-bt      
+
+  enable-gpios:
+    maxItems: 1
+    description: gpio specifier used to enable chip
+   
+  clocks:
+    maxItems: 1
+    description: clock provided to the controller (SUSCLK_32KHZ)
+
+  vddio-supply:
+    description: VDD_IO supply regulator handle
+
+  vddxo-supply:
+    description: VDD_XO supply regulator handle
+
+  vddrf-supply:
+    description: VDD_RF supply regulator handle
+
+  vddch0-supply:
+    description: VDD_CH0 supply regulator handle
+
+  max-speed: 
+    description: see Documentation/devicetree/bindings/serial/serial.yaml
+
+  firmware-name:
+    description: specify the name of nvm firmware to load
+
+  local-bd-address:
+    description: see Documentation/devicetree/bindings/net/bluetooth.txt
+
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    uart {
+        label = "BT-UART";
+        status = "okay";
+
+        bluetooth {
+            compatible = "qcom,qca6174-bt";
+            enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
+            clocks = <&divclk4>;
+            firmware-name = "nvm_00440302.bin";
+        };
+    };
+  - |
+    uart {
+
+        bluetooth {
+            compatible = "qcom,wcn3990-bt";
+            vddio-supply = <&vreg_s4a_1p8>;
+            vddxo-supply = <&vreg_l7a_1p8>;
+            vddrf-supply = <&vreg_l17a_1p3>;
+            vddch0-supply = <&vreg_l25a_3p3>;
+            max-speed = <3200000>;
+            firmware-name = "crnv21.bin";		
+        };
+    };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

