Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1050337A35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 18:00:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbhCKQ72 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 11:59:28 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26561 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhCKQ7C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 11:59:02 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 11 Mar 2021 08:59:01 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 11 Mar 2021 08:58:59 -0800
X-QCInternal: smtphost
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 11 Mar 2021 22:28:27 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id 7BD7321FA4; Thu, 11 Mar 2021 22:28:26 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     devicetree@vger.kernel.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v1 2/2] dt-bindings: net: bluetooth: Add device tree bindings for QTI chip wcn6750
Date:   Thu, 11 Mar 2021 22:28:24 +0530
Message-Id: <1615481904-9400-3-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615481904-9400-1-git-send-email-gubbaven@codeaurora.org>
References: <1615481904-9400-1-git-send-email-gubbaven@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch enables regulators and gpios for the Qualcomm Bluetooth wcn6750
controller.

Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
---
 .../devicetree/bindings/net/qualcomm-bluetooth.txt | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
index 709ca6d..e70fcb7 100644
--- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
@@ -15,6 +15,7 @@ Required properties:
    * "qcom,wcn3991-bt"
    * "qcom,wcn3998-bt"
    * "qcom,qca6390-bt"
+   * "qcom,wcn6750-bt"
 
 Optional properties for compatible string qcom,qca6174-bt:
 
@@ -39,6 +40,26 @@ Optional properties for compatible string qcom,wcn399x-bt:
  - firmware-name: specify the name of nvm firmware to load
  - clocks: clock provided to the controller
 
+Required properties for compatible string qcom,wcn6750-bt:
+
+ - enable-gpios: gpio specifier used to enable chip
+ - swctrl-gpios: gpio specifier is output from SoC,used to find status
+		 of clock supply to SoC.
+ - vddio-supply: VDD_IO supply regulator handle.
+ - vddaon-supply: VDD_AON supply regulator handle.
+ - vddbtcxmx-suppl: VDD_BT_CXMX supply regualtor handle.
+ - vddrfacmn-supply: VDD_RFA_CMN supply regulator handle.
+ - vddrfa0p8-supply: VDD_RFA_0P8 suppply regulator handle.
+ - vddrfa1p7-supply: VDD_RFA_1P7 supply regulator handle.
+ - vddrfa1p2-supply: VDD_RFA_1P2 supply regulator handle.
+ - vddrfa2p2-supply: VDD_RFA_2P2 supply regulator handle.
+ - vddasd-supply: VDD_ASD supply regulator handle.
+
+Optional properties for compatible string qcom,wcn6750-bt:
+
+ - max-speed: see Documentation/devicetree/bindings/serial/serial.yaml
+ - firmware-name: specify the name of nvm firmware to load
+
 Examples:
 
 serial@7570000 {
@@ -67,3 +88,25 @@ serial@898000 {
 		clocks = <&rpmhcc RPMH_RF_CLK2>;
 	};
 };
+
+serial@99c000 {
+	bluetooth {
+		compatible = "qcom,wcn6750-bt";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_default>;
+		enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
+		vddio-supply = <&vreg_l19b_1p8>;
+		vddaon-supply = <&vreg_s7b_0p9>;
+		vddbtcxmx-supply = <&vreg_s7b_0p9>;
+		vddrfacmn-supply = <&vreg_s7b_0p9>;
+		vddrfa0p8-supply = <&vreg_s7b_0p9>;
+		vddrfa1p7-supply = <&vreg_s1b_1p8>;
+		vddrfa1p2-supply = <&vreg_s8b_1p2>;
+		vddrfa2p2-supply = <&vreg_s1c_2p2>;
+		vddasd-supply = <&vreg_l11c_2p8>;
+		max-speed = <3200000>;
+		firmware-name = "msnv11.bin";
+	};
+};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

