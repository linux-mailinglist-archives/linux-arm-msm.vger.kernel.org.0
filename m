Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422EB1D2E4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 13:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgENL30 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 07:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbgENL3Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 07:29:25 -0400
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5300::10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC32C061A0C;
        Thu, 14 May 2020 04:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589455762;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=arDfpi0G8xcZd8adsAbzIzVK4oKbMQ9xnAGTI1GNtr0=;
        b=tzYAXtKO+2W9WffHnd5Mkb5+JwMuhkkshT/DQ+PJuiIuF9GhHxHYiv3EO7hwjx3/NJ
        rHfFctpxZnJvux6TcPZfBKKIq2JVW0muZ4tFdrg2jCX4KT3c6WsuhxVyxYYkiKK2KgqY
        TIUPXd/DS15aa7FQ/aD02Xf7X2Ry82gerleOq59d3fKxnvCjHx3mLglpakUEV9z/ja0m
        AT/w+wnGXzD04f43+Un1lELLT8T0eEHDA6MAgv8SqgjuPHPLSw1K9jFMRoVcrAV29YwX
        yIYir1wa9PKqdlNjxcpZw0R1rqVK9Q11ZGdSBbVsLVN9Q2jwr1ejrQrRManS1mt+r8nc
        JzEw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6NBgYo"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id 60b02dw4EBTJHew
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 14 May 2020 13:29:19 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/3] arm64: dts: qcom: msm8916: avoid using _ in node names
Date:   Thu, 14 May 2020 13:27:52 +0200
Message-Id: <20200514112754.148919-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Many nodes in the MSM8916 device trees use '_' in node names
(especially pinctrl), even though (seemingly) '-' is preferred now.
Make this more consistent by replacing '_' with '-' where possible.

Similar naming is used for pinctrl in newer device trees (e.g. sdm845.dtsi).

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
See also: https://lore.kernel.org/linux-arm-msm/20200512182959.GJ57962@builder.lan/
---
 .../boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi  |  14 +-
 .../boot/dts/qcom/apq8016-sbc-soc-pins.dtsi   |  12 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     |   8 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts |   2 +-
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi    | 181 +++++++++---------
 .../qcom/msm8916-samsung-a2015-common.dtsi    |   6 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |  10 +-
 7 files changed, 116 insertions(+), 117 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
index aff218c1b7b6..41907938014c 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
@@ -4,7 +4,7 @@
 
 &pm8916_gpios {
 
-	usb_hub_reset_pm: usb_hub_reset_pm {
+	usb_hub_reset_pm: usb-hub-reset-pm {
 		pinconf {
 			pins = "gpio3";
 			function = PMIC_GPIO_FUNC_NORMAL;
@@ -13,7 +13,7 @@ pinconf {
 		};
 	};
 
-	usb_hub_reset_pm_device: usb_hub_reset_pm_device {
+	usb_hub_reset_pm_device: usb-hub-reset-pm-device {
 		pinconf {
 			pins = "gpio3";
 			function = PMIC_GPIO_FUNC_NORMAL;
@@ -21,7 +21,7 @@ pinconf {
 		};
 	};
 
-	usb_sw_sel_pm: usb_sw_sel_pm {
+	usb_sw_sel_pm: usb-sw-sel-pm {
 		pinconf {
 			pins = "gpio4";
 			function = PMIC_GPIO_FUNC_NORMAL;
@@ -31,7 +31,7 @@ pinconf {
 		};
 	};
 
-	usb_sw_sel_pm_device: usb_sw_sel_pm_device {
+	usb_sw_sel_pm_device: usb-sw-sel-pm-device {
 		pinconf {
 			pins = "gpio4";
 			function = PMIC_GPIO_FUNC_NORMAL;
@@ -41,7 +41,7 @@ pinconf {
 		};
 	};
 
-	pm8916_gpios_leds: pm8916_gpios_leds {
+	pm8916_gpios_leds: pm8916-gpios-leds {
 		pinconf {
 			pins = "gpio1", "gpio2";
 			function = PMIC_GPIO_FUNC_NORMAL;
@@ -55,7 +55,7 @@ &pm8916_mpps {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ls_exp_gpio_f>;
 
-	ls_exp_gpio_f: pm8916_mpp4 {
+	ls_exp_gpio_f: pm8916-mpp4 {
 		pinconf {
 			pins = "mpp4";
 			function = "digital";
@@ -64,7 +64,7 @@ pinconf {
 		};
 	};
 
-	pm8916_mpps_leds: pm8916_mpps_leds {
+	pm8916_mpps_leds: pm8916-mpps-leds {
 		pinconf {
 			pins = "mpp2", "mpp3";
 			function = "digital";
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi
index 21d0822f1ca6..ac00beec102f 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi
@@ -4,7 +4,7 @@
 
 &msmgpio {
 
-	msmgpio_leds: msmgpio_leds {
+	msmgpio_leds: msmgpio-leds {
 		pinconf {
 			pins = "gpio21", "gpio120";
 			function = "gpio";
@@ -26,7 +26,7 @@ pinconf {
 		};
 	};
 
-	adv7533_int_active: adv533_int_active {
+	adv7533_int_active: adv533-int-active {
 		pinmux {
 			function = "gpio";
 			pins = "gpio31";
@@ -38,7 +38,7 @@ pinconf {
 		};
 	};
 
-	adv7533_int_suspend: adv7533_int_suspend {
+	adv7533_int_suspend: adv7533-int-suspend {
 		pinmux {
 			function = "gpio";
 			pins = "gpio31";
@@ -50,7 +50,7 @@ pinconf {
 		};
 	};
 
-	adv7533_switch_active: adv7533_switch_active {
+	adv7533_switch_active: adv7533-switch-active {
 		pinmux {
 			function = "gpio";
 			pins = "gpio32";
@@ -62,7 +62,7 @@ pinconf {
 		};
 	};
 
-	adv7533_switch_suspend: adv7533_switch_suspend {
+	adv7533_switch_suspend: adv7533-switch-suspend {
 		pinmux {
 			function = "gpio";
 			pins = "gpio32";
@@ -74,7 +74,7 @@ pinconf {
 		};
 	};
 
-	msm_key_volp_n_default: msm_key_volp_n_default {
+	msm_key_volp_n_default: msm-key-volp-n-default {
 		pinmux {
 			function = "gpio";
 			pins = "gpio107";
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 7377bf73390a..08c7538b9c9f 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -51,7 +51,7 @@ chosen {
 		stdout-path = "serial0";
 	};
 
-	camera_vdddo_1v8: camera_vdddo_1v8 {
+	camera_vdddo_1v8: camera-vdddo-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "camera_vdddo";
 		regulator-min-microvolt = <1800000>;
@@ -59,7 +59,7 @@ camera_vdddo_1v8: camera_vdddo_1v8 {
 		regulator-always-on;
 	};
 
-	camera_vdda_2v8: camera_vdda_2v8 {
+	camera_vdda_2v8: camera-vdda-2v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "camera_vdda";
 		regulator-min-microvolt = <2800000>;
@@ -67,7 +67,7 @@ camera_vdda_2v8: camera_vdda_2v8 {
 		regulator-always-on;
 	};
 
-	camera_vddd_1v5: camera_vddd_1v5 {
+	camera_vddd_1v5: camera-vddd-1v5 {
 		compatible = "regulator-fixed";
 		regulator-name = "camera_vddd";
 		regulator-min-microvolt = <1500000>;
@@ -566,7 +566,7 @@ hdmi_con: endpoint {
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 691eb1a87bc9..d5230cb76eb1 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -109,7 +109,7 @@ volume-up {
 };
 
 &msmgpio {
-	gpio_keys_default: gpio_keys_default {
+	gpio_keys_default: gpio-keys-default {
 		pinmux {
 			function = "gpio";
 			pins = "gpio107";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index 31886860766a..e9c00367f7fd 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -5,7 +5,7 @@
 
 &msmgpio {
 
-	blsp1_uart1_default: blsp1_uart1_default {
+	blsp1_uart1_default: blsp1-uart1-default {
 		pinmux {
 			function = "blsp_uart1";
 			//	TX, RX, CTS_N, RTS_N
@@ -20,7 +20,7 @@ pinconf {
 		};
 	};
 
-	blsp1_uart1_sleep: blsp1_uart1_sleep {
+	blsp1_uart1_sleep: blsp1-uart1-sleep {
 		pinmux {
 			function = "gpio";
 			pins = "gpio0", "gpio1",
@@ -34,7 +34,7 @@ pinconf {
 		};
 	};
 
-	blsp1_uart2_default: blsp1_uart2_default {
+	blsp1_uart2_default: blsp1-uart2-default {
 		pinmux {
 			function = "blsp_uart2";
 			pins = "gpio4", "gpio5";
@@ -46,7 +46,7 @@ pinconf {
 		};
 	};
 
-	blsp1_uart2_sleep: blsp1_uart2_sleep {
+	blsp1_uart2_sleep: blsp1-uart2-sleep {
 		pinmux {
 			function = "gpio";
 			pins = "gpio4", "gpio5";
@@ -58,12 +58,12 @@ pinconf {
 		};
 	};
 
-	spi1_default: spi1_default {
+	spi1_default: spi1-default {
 		pinmux {
 			function = "blsp_spi1";
 			pins = "gpio0", "gpio1", "gpio3";
 		};
-		pinmux_cs {
+		pinmux-cs {
 			function = "gpio";
 			pins = "gpio2";
 		};
@@ -72,7 +72,7 @@ pinconf {
 			drive-strength = <12>;
 			bias-disable;
 		};
-		pinconf_cs {
+		pinconf-cs {
 			pins = "gpio2";
 			drive-strength = <16>;
 			bias-disable;
@@ -80,7 +80,7 @@ pinconf_cs {
 		};
 	};
 
-	spi1_sleep: spi1_sleep {
+	spi1_sleep: spi1-sleep {
 		pinmux {
 			function = "gpio";
 			pins = "gpio0", "gpio1", "gpio2", "gpio3";
@@ -92,12 +92,12 @@ pinconf {
 		};
 	};
 
-	spi2_default: spi2_default {
+	spi2_default: spi2-default {
 		pinmux {
 			function = "blsp_spi2";
 			pins = "gpio4", "gpio5", "gpio7";
 		};
-		pinmux_cs {
+		pinmux-cs {
 			function = "gpio";
 			pins = "gpio6";
 		};
@@ -106,7 +106,7 @@ pinconf {
 			drive-strength = <12>;
 			bias-disable;
 		};
-		pinconf_cs {
+		pinconf-cs {
 			pins = "gpio6";
 			drive-strength = <16>;
 			bias-disable;
@@ -114,7 +114,7 @@ pinconf_cs {
 		};
 	};
 
-	spi2_sleep: spi2_sleep {
+	spi2_sleep: spi2-sleep {
 		pinmux {
 			function = "gpio";
 			pins = "gpio4", "gpio5", "gpio6", "gpio7";
@@ -126,12 +126,12 @@ pinconf {
 		};
 	};
 
-	spi3_default: spi3_default {
+	spi3_default: spi3-default {
 		pinmux {
 			function = "blsp_spi3";
 			pins = "gpio8", "gpio9", "gpio11";
 		};
-		pinmux_cs {
+		pinmux-cs {
 			function = "gpio";
 			pins = "gpio10";
 		};
@@ -140,7 +140,7 @@ pinconf {
 			drive-strength = <12>;
 			bias-disable;
 		};
-		pinconf_cs {
+		pinconf-cs {
 			pins = "gpio10";
 			drive-strength = <16>;
 			bias-disable;
@@ -148,7 +148,7 @@ pinconf_cs {
 		};
 	};
 
-	spi3_sleep: spi3_sleep {
+	spi3_sleep: spi3-sleep {
 		pinmux {
 			function = "gpio";
 			pins = "gpio8", "gpio9", "gpio10", "gpio11";
@@ -160,12 +160,12 @@ pinconf {
 		};
 	};
 
-	spi4_default: spi4_default {
+	spi4_default: spi4-default {
 		pinmux {
 			function = "blsp_spi4";
 			pins = "gpio12", "gpio13", "gpio15";
 		};
-		pinmux_cs {
+		pinmux-cs {
 			function = "gpio";
 			pins = "gpio14";
 		};
@@ -174,7 +174,7 @@ pinconf {
 			drive-strength = <12>;
 			bias-disable;
 		};
-		pinconf_cs {
+		pinconf-cs {
 			pins = "gpio14";
 			drive-strength = <16>;
 			bias-disable;
@@ -182,7 +182,7 @@ pinconf_cs {
 		};
 	};
 
-	spi4_sleep: spi4_sleep {
+	spi4_sleep: spi4-sleep {
 		pinmux {
 			function = "gpio";
 			pins = "gpio12", "gpio13", "gpio14", "gpio15";
@@ -194,12 +194,12 @@ pinconf {
 		};
 	};
 
-	spi5_default: spi5_default {
+	spi5_default: spi5-default {
 		pinmux {
 			function = "blsp_spi5";
 			pins = "gpio16", "gpio17", "gpio19";
 		};
-		pinmux_cs {
+		pinmux-cs {
 			function = "gpio";
 			pins = "gpio18";
 		};
@@ -208,7 +208,7 @@ pinconf {
 			drive-strength = <12>;
 			bias-disable;
 		};
-		pinconf_cs {
+		pinconf-cs {
 			pins = "gpio18";
 			drive-strength = <16>;
 			bias-disable;
@@ -216,7 +216,7 @@ pinconf_cs {
 		};
 	};
 
-	spi5_sleep: spi5_sleep {
+	spi5_sleep: spi5-sleep {
 		pinmux {
 			function = "gpio";
 			pins = "gpio16", "gpio17", "gpio18", "gpio19";
@@ -228,12 +228,12 @@ pinconf {
 		};
 	};
 
-	spi6_default: spi6_default {
+	spi6_default: spi6-default {
 		pinmux {
 			function = "blsp_spi6";
 			pins = "gpio20", "gpio21", "gpio23";
 		};
-		pinmux_cs {
+		pinmux-cs {
 			function = "gpio";
 			pins = "gpio22";
 		};
@@ -242,7 +242,7 @@ pinconf {
 			drive-strength = <12>;
 			bias-disable;
 		};
-		pinconf_cs {
+		pinconf-cs {
 			pins = "gpio22";
 			drive-strength = <16>;
 			bias-disable;
@@ -250,7 +250,7 @@ pinconf_cs {
 		};
 	};
 
-	spi6_sleep: spi6_sleep {
+	spi6_sleep: spi6-sleep {
 		pinmux {
 			function = "gpio";
 			pins = "gpio20", "gpio21", "gpio22", "gpio23";
@@ -262,7 +262,7 @@ pinconf {
 		};
 	};
 
-	i2c1_default: i2c1_default {
+	i2c1_default: i2c1-default {
 		pinmux {
 			function = "blsp_i2c1";
 			pins = "gpio2", "gpio3";
@@ -274,7 +274,7 @@ pinconf {
 		};
 	};
 
-	i2c1_sleep: i2c1_sleep {
+	i2c1_sleep: i2c1-sleep {
 		pinmux {
 			function = "gpio";
 			pins = "gpio2", "gpio3";
@@ -286,7 +286,7 @@ pinconf {
 		};
 	};
 
-	i2c2_default: i2c2_default {
+	i2c2_default: i2c2-default {
 		pinmux {
 			function = "blsp_i2c2";
 			pins = "gpio6", "gpio7";
@@ -298,7 +298,7 @@ pinconf {
 		};
 	};
 
-	i2c2_sleep: i2c2_sleep {
+	i2c2_sleep: i2c2-sleep {
 		pinmux {
 			function = "gpio";
 			pins = "gpio6", "gpio7";
@@ -310,7 +310,7 @@ pinconf {
 		};
 	};
 
-	i2c4_default: i2c4_default {
+	i2c4_default: i2c4-default {
 		pinmux {
 			function = "blsp_i2c4";
 			pins = "gpio14", "gpio15";
@@ -322,7 +322,7 @@ pinconf {
 		};
 	};
 
-	i2c4_sleep: i2c4_sleep {
+	i2c4_sleep: i2c4-sleep {
 		pinmux {
 			function = "gpio";
 			pins = "gpio14", "gpio15";
@@ -334,7 +334,7 @@ pinconf {
 		};
 	};
 
-	i2c5_default: i2c5_default {
+	i2c5_default: i2c5-default {
 		pinmux {
 			function = "blsp_i2c5";
 			pins = "gpio18", "gpio19";
@@ -346,7 +346,7 @@ pinconf {
 		};
 	};
 
-	i2c5_sleep: i2c5_sleep {
+	i2c5_sleep: i2c5-sleep {
 		pinmux {
 			function = "gpio";
 			pins = "gpio18", "gpio19";
@@ -358,7 +358,7 @@ pinconf {
 		};
 	};
 
-	i2c6_default: i2c6_default {
+	i2c6_default: i2c6-default {
 		pinmux {
 			function = "blsp_i2c6";
 			pins = "gpio22", "gpio23";
@@ -370,7 +370,7 @@ pinconf {
 		};
 	};
 
-	i2c6_sleep: i2c6_sleep {
+	i2c6_sleep: i2c6-sleep {
 		pinmux {
 			function = "gpio";
 			pins = "gpio22", "gpio23";
@@ -382,8 +382,8 @@ pinconf {
 		};
 	};
 
-	pmx_sdc1_clk {
-		sdc1_clk_on: clk_on {
+	pmx-sdc1-clk {
+		sdc1_clk_on: clk-on {
 			pinmux {
 				pins = "sdc1_clk";
 			};
@@ -393,7 +393,7 @@ pinconf {
 				drive-strength = <16>;
 			};
 		};
-		sdc1_clk_off: clk_off {
+		sdc1_clk_off: clk-off {
 			pinmux {
 				pins = "sdc1_clk";
 			};
@@ -405,8 +405,8 @@ pinconf {
 		};
 	};
 
-	pmx_sdc1_cmd {
-		sdc1_cmd_on: cmd_on {
+	pmx-sdc1-cmd {
+		sdc1_cmd_on: cmd-on {
 			pinmux {
 				pins = "sdc1_cmd";
 			};
@@ -416,7 +416,7 @@ pinconf {
 				drive-strength = <10>;
 			};
 		};
-		sdc1_cmd_off: cmd_off {
+		sdc1_cmd_off: cmd-off {
 			pinmux {
 				pins = "sdc1_cmd";
 			};
@@ -428,8 +428,8 @@ pinconf {
 		};
 	};
 
-	pmx_sdc1_data {
-		sdc1_data_on: data_on {
+	pmx-sdc1-data {
+		sdc1_data_on: data-on {
 			pinmux {
 				pins = "sdc1_data";
 			};
@@ -439,7 +439,7 @@ pinconf {
 				drive-strength = <10>;
 			};
 		};
-		sdc1_data_off: data_off {
+		sdc1_data_off: data-off {
 			pinmux {
 				pins = "sdc1_data";
 			};
@@ -451,8 +451,8 @@ pinconf {
 		};
 	};
 
-	pmx_sdc2_clk {
-		sdc2_clk_on: clk_on {
+	pmx-sdc2-clk {
+		sdc2_clk_on: clk-on {
 			pinmux {
 				pins = "sdc2_clk";
 			};
@@ -462,7 +462,7 @@ pinconf {
 				drive-strength = <16>;
 			};
 		};
-		sdc2_clk_off: clk_off {
+		sdc2_clk_off: clk-off {
 			pinmux {
 				pins = "sdc2_clk";
 			};
@@ -474,8 +474,8 @@ pinconf {
 		};
 	};
 
-	pmx_sdc2_cmd {
-		sdc2_cmd_on: cmd_on {
+	pmx-sdc2-cmd {
+		sdc2_cmd_on: cmd-on {
 			pinmux {
 				pins = "sdc2_cmd";
 			};
@@ -485,7 +485,7 @@ pinconf {
 				drive-strength = <10>;
 			};
 		};
-		sdc2_cmd_off: cmd_off {
+		sdc2_cmd_off: cmd-off {
 			pinmux {
 				pins = "sdc2_cmd";
 			};
@@ -497,8 +497,8 @@ pinconf {
 		};
 	};
 
-	pmx_sdc2_data {
-		sdc2_data_on: data_on {
+	pmx-sdc2-data {
+		sdc2_data_on: data-on {
 			pinmux {
 				pins = "sdc2_data";
 			};
@@ -508,7 +508,7 @@ pinconf {
 				drive-strength = <10>;
 			};
 		};
-		sdc2_data_off: data_off {
+		sdc2_data_off: data-off {
 			pinmux {
 				pins = "sdc2_data";
 			};
@@ -520,8 +520,8 @@ pinconf {
 		};
 	};
 
-	pmx_sdc2_cd_pin {
-		sdc2_cd_on: cd_on {
+	pmx-sdc2-cd-pin {
+		sdc2_cd_on: cd-on {
 			pinmux {
 				function = "gpio";
 				pins = "gpio38";
@@ -532,7 +532,7 @@ pinconf {
 				bias-pull-up;
 			};
 		};
-		sdc2_cd_off: cd_off {
+		sdc2_cd_off: cd-off {
 			pinmux {
 				function = "gpio";
 				pins = "gpio38";
@@ -546,7 +546,7 @@ pinconf {
 	};
 
 	cdc-pdm-lines {
-		cdc_pdm_lines_act: pdm_lines_on {
+		cdc_pdm_lines_act: pdm-lines-on {
 			pinmux {
 				function = "cdc_pdm0";
 				pins = "gpio63", "gpio64", "gpio65", "gpio66",
@@ -559,7 +559,7 @@ pinconf {
 				bias-pull-none;
 			};
 		};
-		cdc_pdm_lines_sus: pdm_lines_off {
+		cdc_pdm_lines_sus: pdm-lines-off {
 			pinmux {
 				function = "cdc_pdm0";
 				pins = "gpio63", "gpio64", "gpio65", "gpio66",
@@ -575,7 +575,7 @@ pinconf {
 	};
 
 	ext-pri-tlmm-lines {
-		ext_pri_tlmm_lines_act: ext_pa_on {
+		ext_pri_tlmm_lines_act: ext-pa-on {
 			pinmux {
 				function = "pri_mi2s";
 				pins = "gpio113", "gpio114", "gpio115",
@@ -589,7 +589,7 @@ pinconf {
 			};
 		};
 
-		ext_pri_tlmm_lines_sus: ext_pa_off {
+		ext_pri_tlmm_lines_sus: ext-pa-off {
 			pinmux {
 				function = "pri_mi2s";
 				pins = "gpio113", "gpio114", "gpio115",
@@ -605,7 +605,7 @@ pinconf {
 	};
 
 	ext-pri-ws-line {
-		ext_pri_ws_act: ext_pa_on {
+		ext_pri_ws_act: ext-pa-on {
 			pinmux {
 				function = "pri_mi2s_ws";
 				pins = "gpio110";
@@ -617,7 +617,7 @@ pinconf {
 			};
 		};
 
-		ext_pri_ws_sus: ext_pa_off {
+		ext_pri_ws_sus: ext-pa-off {
 			pinmux {
 				function = "pri_mi2s_ws";
 				pins = "gpio110";
@@ -631,7 +631,7 @@ pinconf {
 	};
 
 	ext-mclk-tlmm-lines {
-		ext_mclk_tlmm_lines_act: mclk_lines_on {
+		ext_mclk_tlmm_lines_act: mclk-lines-on {
 			pinmux {
 				function = "pri_mi2s";
 				pins = "gpio116";
@@ -642,7 +642,7 @@ pinconf {
 				bias-pull-none;
 			};
 		};
-		ext_mclk_tlmm_lines_sus: mclk_lines_off {
+		ext_mclk_tlmm_lines_sus: mclk-lines-off {
 			pinmux {
 				function = "pri_mi2s";
 				pins = "gpio116";
@@ -657,7 +657,7 @@ pinconf {
 
 	/* secondary Mi2S */
 	ext-sec-tlmm-lines {
-		ext_sec_tlmm_lines_act: tlmm_lines_on {
+		ext_sec_tlmm_lines_act: tlmm-lines-on {
 			pinmux {
 				function = "sec_mi2s";
 				pins = "gpio112", "gpio117", "gpio118",
@@ -670,7 +670,7 @@ pinconf {
 				bias-pull-none;
 			};
 		};
-		ext_sec_tlmm_lines_sus: tlmm_lines_off {
+		ext_sec_tlmm_lines_sus: tlmm-lines-off {
 			pinmux {
 				function = "sec_mi2s";
 				pins = "gpio112", "gpio117", "gpio118",
@@ -686,12 +686,12 @@ pinconf {
 	};
 
 	cdc-dmic-lines {
-		cdc_dmic_lines_act: dmic_lines_on {
-			pinmux_dmic0_clk {
+		cdc_dmic_lines_act: dmic-lines-on {
+			pinmux-dmic0-clk {
 				function = "dmic0_clk";
 				pins = "gpio0";
 			};
-			pinmux_dmic0_data {
+			pinmux-dmic0-data {
 				function = "dmic0_data";
 				pins = "gpio1";
 			};
@@ -700,12 +700,12 @@ pinconf {
 				drive-strength = <8>;
 			};
 		};
-		cdc_dmic_lines_sus: dmic_lines_off {
-			pinmux_dmic0_clk {
+		cdc_dmic_lines_sus: dmic-lines-off {
+			pinmux-dmic0-clk {
 				function = "dmic0_clk";
 				pins = "gpio0";
 			};
-			pinmux_dmic0_data {
+			pinmux-dmic0-data {
 				function = "dmic0_data";
 				pins = "gpio1";
 			};
@@ -722,7 +722,6 @@ pinmux {
 			pins = "gpio40", "gpio41", "gpio42", "gpio43", "gpio44";
 			function = "wcss_wlan";
 		};
-
 		pinconf {
 			pins = "gpio40", "gpio41", "gpio42", "gpio43", "gpio44";
 			drive-strength = <6>;
@@ -730,7 +729,7 @@ pinconf {
 		};
 	};
 
-	cci0_default: cci0_default {
+	cci0_default: cci0-default {
 		pinmux {
 			function = "cci_i2c";
 			pins = "gpio29", "gpio30";
@@ -742,64 +741,64 @@ pinconf {
 		};
 	};
 
-	camera_front_default: camera_front_default {
-		pinmux_pwdn {
+	camera_front_default: camera-front-default {
+		pinmux-pwdn {
 			function = "gpio";
 			pins = "gpio33";
 		};
-		pinconf_pwdn {
+		pinconf-pwdn {
 			pins = "gpio33";
 			drive-strength = <16>;
 			bias-disable;
 		};
 
-		pinmux_rst {
+		pinmux-rst {
 			function = "gpio";
 			pins = "gpio28";
 		};
-		pinconf_rst {
+		pinconf-rst {
 			pins = "gpio28";
 			drive-strength = <16>;
 			bias-disable;
 		};
 
-		pinmux_mclk1 {
+		pinmux-mclk1 {
 			function = "cam_mclk1";
 			pins = "gpio27";
 		};
-		pinconf_mclk1 {
+		pinconf-mclk1 {
 			pins = "gpio27";
 			drive-strength = <16>;
 			bias-disable;
 		};
 	};
 
-	camera_rear_default: camera_rear_default {
-		pinmux_pwdn {
+	camera_rear_default: camera-rear-default {
+		pinmux-pwdn {
 			function = "gpio";
 			pins = "gpio34";
 		};
-		pinconf_pwdn {
+		pinconf-pwdn {
 			pins = "gpio34";
 			drive-strength = <16>;
 			bias-disable;
 		};
 
-		 pinmux_rst {
+		pinmux-rst {
 			function = "gpio";
 			pins = "gpio35";
 		};
-		pinconf_rst {
+		pinconf-rst {
 			pins = "gpio35";
 			drive-strength = <16>;
 			bias-disable;
 		};
 
-		pinmux_mclk0 {
+		pinmux-mclk0 {
 			function = "cam_mclk0";
 			pins = "gpio26";
 		};
-		pinconf_mclk0 {
+		pinconf-mclk0 {
 			pins = "gpio26";
 			drive-strength = <16>;
 			bias-disable;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index 8b5060f4fe0b..6f921e6054e1 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -150,7 +150,7 @@ muic: sm5502@25 {
 };
 
 &msmgpio {
-	gpio_keys_default: gpio_keys_default {
+	gpio_keys_default: gpio-keys-default {
 		pinmux {
 			function = "gpio";
 			pins = "gpio107", "gpio109";
@@ -162,7 +162,7 @@ pinconf {
 		};
 	};
 
-	gpio_hall_sensor_default: gpio_hall_sensor_default {
+	gpio_hall_sensor_default: gpio-hall-sensor-default {
 		pinmux {
 			function = "gpio";
 			pins = "gpio52";
@@ -174,7 +174,7 @@ pinconf {
 		};
 	};
 
-	muic_int_default: muic_int_default {
+	muic_int_default: muic-int-default {
 		pinmux {
 			function = "gpio";
 			pins = "gpio12";
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index cf9ce4a9c912..69129c0b20aa 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -340,7 +340,7 @@ modem_alert0: trip-point0 {
 
 	};
 
-	cpu_opp_table: cpu_opp_table {
+	cpu_opp_table: cpu-opp-table {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -358,7 +358,7 @@ opp-998400000 {
 		};
 	};
 
-	gpu_opp_table: opp_table {
+	gpu_opp_table: gpu-opp-table {
 		compatible = "operating-points-v2";
 
 		opp-400000000 {
@@ -378,13 +378,13 @@ timer {
 	};
 
 	clocks {
-		xo_board: xo_board {
+		xo_board: xo-board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <19200000>;
 		};
 
-		sleep_clk: sleep_clk {
+		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <32768>;
@@ -1783,7 +1783,7 @@ rpm {
 			qcom,ipc = <&apcs 8 0>;
 			qcom,smd-edge = <15>;
 
-			rpm_requests {
+			rpm-requests {
 				compatible = "qcom,rpm-msm8916";
 				qcom,smd-channels = "rpm_requests";
 
-- 
2.26.2

