Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC6935566F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 16:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345074AbhDFOUy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 10:20:54 -0400
Received: from vps5.brixit.nl ([192.81.221.234]:58456 "EHLO vps5.brixit.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345054AbhDFOUP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 10:20:15 -0400
X-Greylist: delayed 522 seconds by postgrey-1.27 at vger.kernel.org; Tue, 06 Apr 2021 10:20:09 EDT
Received: from localhost.localdomain (unknown [77.239.252.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by vps5.brixit.nl (Postfix) with ESMTPSA id 60069606DF;
        Tue,  6 Apr 2021 14:11:16 +0000 (UTC)
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH 2/2] ARM: dts: qcom: msm8974-klte: Add bluetooth support
Date:   Tue,  6 Apr 2021 17:05:51 +0300
Message-Id: <20210406140551.3328241-2-alexeymin@postmarketos.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210406140551.3328241-1-alexeymin@postmarketos.org>
References: <20210406140551.3328241-1-alexeymin@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Broadcom BCM4354 is used on Samsung Galaxy S5 phone
on BLSP2 UART8 bus.

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index a0f7f461f48c8..138353cb4e1d6 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -322,6 +322,27 @@ serial@f991e000 {
 		status = "okay";
 	};
 
+	/* blsp2_uart8 */
+	serial@f995e000 {
+		status = "okay";
+
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&blsp2_uart8_pins_active>;
+		pinctrl-1 = <&blsp2_uart8_pins_sleep>;
+
+		bluetooth {
+			compatible = "brcm,bcm43540-bt";
+			max-speed = <3000000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&bt_pins>;
+			device-wakeup-gpios = <&msmgpio 91 GPIO_ACTIVE_HIGH>;
+			shutdown-gpios = <&gpio_expander 9 GPIO_ACTIVE_HIGH>;
+			interrupt-parent = <&msmgpio>;
+			interrupts = <75 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "host-wakeup";
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		input-name = "gpio-keys";
@@ -356,6 +377,35 @@ volume-up {
 	};
 
 	pinctrl@fd510000 {
+		blsp2_uart8_pins_active: blsp2-uart8-pins-active {
+			pins = "gpio45", "gpio46", "gpio47", "gpio48";
+			function = "blsp_uart8";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		blsp2_uart8_pins_sleep: blsp2-uart8-pins-sleep {
+			pins = "gpio45", "gpio46", "gpio47", "gpio48";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		bt_pins: bt-pins {
+			hostwake {
+				pins = "gpio75";
+				function = "gpio";
+				drive-strength = <16>;
+				input-enable;
+			};
+
+			devwake {
+				pins = "gpio91";
+				function = "gpio";
+				drive-strength = <2>;
+			};
+		};
+
 		sdhc1_pin_a: sdhc1-pin-active {
 			clk {
 				pins = "sdc1_clk";
-- 
2.26.3

