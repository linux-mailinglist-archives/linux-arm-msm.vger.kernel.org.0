Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6CAE203A8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 17:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729510AbgFVPSu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 11:18:50 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:12015 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729456AbgFVPSt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 11:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592839115;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=202o7K3z48r1E4CWu2yx4OqZffrppqdk5HCluxLb7tI=;
        b=H3UGc+psfyL85SWKoGA3KNCNCbI3KHXyEPzSxzVJQtQ7+aRCVLt3cwCnxIqb4ZDgj/
        UKKWkhYsQAnNhapLQTelpn94oziJVxHJr2kAySAWC66JZR2mvf9ph/K+XljUW9NwNkFt
        kqnDfOL31qkmM/QMx+EQEQsRvyLR1hrHSo5Hg6sPNNoK0Rus1AeSE9nqvZaYg2/asKhZ
        f73IFn8X1J1CDncJ8bPYa1PkEEL6I/E3sKCPmnKRYXENSmfAqUc23/LmugqDZKBi6n2j
        Ejf31bJLH4FTq0jtubS3EXRGP7QxyDcRjcJ2s0FR1AYqvdfH0BLUN54VYeQ6J9xrHtoh
        g7cw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6OIUPH"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
        with ESMTPSA id 6005e9w5MFIX5Xs
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 22 Jun 2020 17:18:33 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/4] arm64: dts: qcom: msm8916: Simplify pinctrl configuration
Date:   Mon, 22 Jun 2020 17:17:49 +0200
Message-Id: <20200622151751.408995-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622151751.408995-1-stephan@gerhold.net>
References: <20200622151751.408995-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

So far we have been separating pinctrl entries into pinmux/pinconf.
It turns out it is also possible to combine them: The advantage is
that the device tree is overall more concise because the "pins"
to configure just need to be specified once, not separately for
pinmux/pinconf.

Using the simpler form only for new entries would be rather confusing.
This commit makes all MSM8916 device trees use the simplfied form.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Bjorn suggested using this form here:
https://lore.kernel.org/linux-arm-msm/20200514172326.GC279327@builder.lan/
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     | 171 ++--
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts |  26 +-
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi    | 861 +++++++-----------
 .../qcom/msm8916-samsung-a2015-common.dtsi    |  85 +-
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts |  14 +-
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts |  14 +-
 6 files changed, 426 insertions(+), 745 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 364014c96632..6fff96a158e9 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -781,133 +781,102 @@ l18 {
 
 &msmgpio {
 	msmgpio_leds: msmgpio-leds {
-		pinconf {
-			pins = "gpio21", "gpio120";
-			function = "gpio";
-			output-low;
-		};
+		pins = "gpio21", "gpio120";
+		function = "gpio";
+
+		output-low;
 	};
 
 	usb_id_default: usb-id-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio121";
-		};
+		pins = "gpio121";
+		function = "gpio";
 
-		pinconf {
-			pins = "gpio121";
-			drive-strength = <8>;
-			input-enable;
-			bias-pull-up;
-		};
+		drive-strength = <8>;
+		input-enable;
+		bias-pull-up;
 	};
 
 	adv7533_int_active: adv533-int-active {
-		pinmux {
-			function = "gpio";
-			pins = "gpio31";
-		};
-		pinconf {
-			pins = "gpio31";
-			drive-strength = <16>;
-			bias-disable;
-		};
+		pins = "gpio31";
+		function = "gpio";
+
+		drive-strength = <16>;
+		bias-disable;
 	};
 
 	adv7533_int_suspend: adv7533-int-suspend {
-		pinmux {
-			function = "gpio";
-			pins = "gpio31";
-		};
-		pinconf {
-			pins = "gpio31";
-			drive-strength = <2>;
-			bias-disable;
-		};
+		pins = "gpio31";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
 	};
 
 	adv7533_switch_active: adv7533-switch-active {
-		pinmux {
-			function = "gpio";
-			pins = "gpio32";
-		};
-		pinconf {
-			pins = "gpio32";
-			drive-strength = <16>;
-			bias-disable;
-		};
+		pins = "gpio32";
+		function = "gpio";
+
+		drive-strength = <16>;
+		bias-disable;
 	};
 
 	adv7533_switch_suspend: adv7533-switch-suspend {
-		pinmux {
-			function = "gpio";
-			pins = "gpio32";
-		};
-		pinconf {
-			pins = "gpio32";
-			drive-strength = <2>;
-			bias-disable;
-		};
+		pins = "gpio32";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
 	};
 
 	msm_key_volp_n_default: msm-key-volp-n-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio107";
-		};
-		pinconf {
-			pins = "gpio107";
-			drive-strength = <8>;
-			input-enable;
-			bias-pull-up;
-		};
+		pins = "gpio107";
+		function = "gpio";
+
+		drive-strength = <8>;
+		input-enable;
+		bias-pull-up;
 	};
 };
 
 &pm8916_gpios {
 	usb_hub_reset_pm: usb-hub-reset-pm {
-		pinconf {
-			pins = "gpio3";
-			function = PMIC_GPIO_FUNC_NORMAL;
-			input-disable;
-			output-high;
-		};
+		pins = "gpio3";
+		function = PMIC_GPIO_FUNC_NORMAL;
+
+		input-disable;
+		output-high;
 	};
 
 	usb_hub_reset_pm_device: usb-hub-reset-pm-device {
-		pinconf {
-			pins = "gpio3";
-			function = PMIC_GPIO_FUNC_NORMAL;
-			output-low;
-		};
+		pins = "gpio3";
+		function = PMIC_GPIO_FUNC_NORMAL;
+
+		output-low;
 	};
 
 	usb_sw_sel_pm: usb-sw-sel-pm {
-		pinconf {
-			pins = "gpio4";
-			function = PMIC_GPIO_FUNC_NORMAL;
-			power-source = <PM8916_GPIO_VPH>;
-			input-disable;
-			output-high;
-		};
+		pins = "gpio4";
+		function = PMIC_GPIO_FUNC_NORMAL;
+
+		power-source = <PM8916_GPIO_VPH>;
+		input-disable;
+		output-high;
 	};
 
 	usb_sw_sel_pm_device: usb-sw-sel-pm-device {
-		pinconf {
-			pins = "gpio4";
-			function = PMIC_GPIO_FUNC_NORMAL;
-			power-source = <PM8916_GPIO_VPH>;
-			input-disable;
-			output-low;
-		};
+		pins = "gpio4";
+		function = PMIC_GPIO_FUNC_NORMAL;
+
+		power-source = <PM8916_GPIO_VPH>;
+		input-disable;
+		output-low;
 	};
 
 	pm8916_gpios_leds: pm8916-gpios-leds {
-		pinconf {
-			pins = "gpio1", "gpio2";
-			function = PMIC_GPIO_FUNC_NORMAL;
-			output-low;
-		};
+		pins = "gpio1", "gpio2";
+		function = PMIC_GPIO_FUNC_NORMAL;
+
+		output-low;
 	};
 };
 
@@ -916,19 +885,17 @@ &pm8916_mpps {
 	pinctrl-0 = <&ls_exp_gpio_f>;
 
 	ls_exp_gpio_f: pm8916-mpp4 {
-		pinconf {
-			pins = "mpp4";
-			function = "digital";
-			output-low;
-			power-source = <PM8916_MPP_L5>;	// 1.8V
-		};
+		pins = "mpp4";
+		function = "digital";
+
+		output-low;
+		power-source = <PM8916_MPP_L5>;	// 1.8V
 	};
 
 	pm8916_mpps_leds: pm8916-mpps-leds {
-		pinconf {
-			pins = "mpp2", "mpp3";
-			function = "digital";
-			output-low;
-		};
+		pins = "mpp2", "mpp3";
+		function = "digital";
+
+		output-low;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index ed105e06c3fc..9f2c8e94fd26 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -236,25 +236,17 @@ l18 {
 
 &msmgpio {
 	gpio_keys_default: gpio-keys-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio107";
-		};
-		pinconf {
-			pins = "gpio107";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
+		pins = "gpio107";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-up;
 	};
 
 	usb_vbus_default: usb-vbus-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio62";
-		};
-		pinconf {
-			pins = "gpio62";
-			bias-pull-up;
-		};
+		pins = "gpio62";
+		function = "gpio";
+
+		bias-pull-up;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index 591f48a57535..e1d4f8df7e79 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -6,74 +6,49 @@
 &msmgpio {
 
 	blsp1_uart1_default: blsp1-uart1-default {
-		pinmux {
-			function = "blsp_uart1";
-			//	TX, RX, CTS_N, RTS_N
-			pins = "gpio0", "gpio1",
-			       "gpio2", "gpio3";
-		};
-		pinconf {
-			pins = "gpio0", "gpio1",
-			       "gpio2", "gpio3";
-			drive-strength = <16>;
-			bias-disable;
-		};
+		//	TX, RX, CTS_N, RTS_N
+		pins = "gpio0", "gpio1", "gpio2", "gpio3";
+		function = "blsp_uart1";
+
+		drive-strength = <16>;
+		bias-disable;
 	};
 
 	blsp1_uart1_sleep: blsp1-uart1-sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio0", "gpio1",
-			       "gpio2", "gpio3";
-		};
-		pinconf {
-			pins = "gpio0", "gpio1",
-			       "gpio2", "gpio3";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
+		pins = "gpio0", "gpio1", "gpio2", "gpio3";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-down;
 	};
 
 	blsp1_uart2_default: blsp1-uart2-default {
-		pinmux {
-			function = "blsp_uart2";
-			pins = "gpio4", "gpio5";
-		};
-		pinconf {
-			pins = "gpio4", "gpio5";
-			drive-strength = <16>;
-			bias-disable;
-		};
+		pins = "gpio4", "gpio5";
+		function = "blsp_uart2";
+
+		drive-strength = <16>;
+		bias-disable;
 	};
 
 	blsp1_uart2_sleep: blsp1-uart2-sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio4", "gpio5";
-		};
-		pinconf {
-			pins = "gpio4", "gpio5";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
+		pins = "gpio4", "gpio5";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-down;
 	};
 
 	spi1_default: spi1-default {
-		pinmux {
-			function = "blsp_spi1";
-			pins = "gpio0", "gpio1", "gpio3";
-		};
-		pinmux-cs {
-			function = "gpio";
-			pins = "gpio2";
-		};
-		pinconf {
-			pins = "gpio0", "gpio1", "gpio3";
-			drive-strength = <12>;
-			bias-disable;
-		};
-		pinconf-cs {
+		pins = "gpio0", "gpio1", "gpio3";
+		function = "blsp_spi1";
+
+		drive-strength = <12>;
+		bias-disable;
+
+		cs {
 			pins = "gpio2";
+			function = "gpio";
+
 			drive-strength = <16>;
 			bias-disable;
 			output-high;
@@ -81,33 +56,24 @@ pinconf-cs {
 	};
 
 	spi1_sleep: spi1-sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio0", "gpio1", "gpio2", "gpio3";
-		};
-		pinconf {
-			pins = "gpio0", "gpio1", "gpio2", "gpio3";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
+		pins = "gpio0", "gpio1", "gpio2", "gpio3";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-down;
 	};
 
 	spi2_default: spi2-default {
-		pinmux {
-			function = "blsp_spi2";
-			pins = "gpio4", "gpio5", "gpio7";
-		};
-		pinmux-cs {
-			function = "gpio";
-			pins = "gpio6";
-		};
-		pinconf {
-			pins = "gpio4", "gpio5", "gpio7";
-			drive-strength = <12>;
-			bias-disable;
-		};
-		pinconf-cs {
+		pins = "gpio4", "gpio5", "gpio7";
+		function = "blsp_spi2";
+
+		drive-strength = <12>;
+		bias-disable;
+
+		cs {
 			pins = "gpio6";
+			function = "gpio";
+
 			drive-strength = <16>;
 			bias-disable;
 			output-high;
@@ -115,33 +81,24 @@ pinconf-cs {
 	};
 
 	spi2_sleep: spi2-sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio4", "gpio5", "gpio6", "gpio7";
-		};
-		pinconf {
-			pins = "gpio4", "gpio5", "gpio6", "gpio7";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
+		pins = "gpio4", "gpio5", "gpio6", "gpio7";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-down;
 	};
 
 	spi3_default: spi3-default {
-		pinmux {
-			function = "blsp_spi3";
-			pins = "gpio8", "gpio9", "gpio11";
-		};
-		pinmux-cs {
-			function = "gpio";
-			pins = "gpio10";
-		};
-		pinconf {
-			pins = "gpio8", "gpio9", "gpio11";
-			drive-strength = <12>;
-			bias-disable;
-		};
-		pinconf-cs {
+		pins = "gpio8", "gpio9", "gpio11";
+		function = "blsp_spi3";
+
+		drive-strength = <12>;
+		bias-disable;
+
+		cs {
 			pins = "gpio10";
+			function = "gpio";
+
 			drive-strength = <16>;
 			bias-disable;
 			output-high;
@@ -149,33 +106,24 @@ pinconf-cs {
 	};
 
 	spi3_sleep: spi3-sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio8", "gpio9", "gpio10", "gpio11";
-		};
-		pinconf {
-			pins = "gpio8", "gpio9", "gpio10", "gpio11";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
+		pins = "gpio8", "gpio9", "gpio10", "gpio11";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-down;
 	};
 
 	spi4_default: spi4-default {
-		pinmux {
-			function = "blsp_spi4";
-			pins = "gpio12", "gpio13", "gpio15";
-		};
-		pinmux-cs {
-			function = "gpio";
-			pins = "gpio14";
-		};
-		pinconf {
-			pins = "gpio12", "gpio13", "gpio15";
-			drive-strength = <12>;
-			bias-disable;
-		};
-		pinconf-cs {
+		pins = "gpio12", "gpio13", "gpio15";
+		function = "blsp_spi4";
+
+		drive-strength = <12>;
+		bias-disable;
+
+		cs {
 			pins = "gpio14";
+			function = "gpio";
+
 			drive-strength = <16>;
 			bias-disable;
 			output-high;
@@ -183,33 +131,24 @@ pinconf-cs {
 	};
 
 	spi4_sleep: spi4-sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio12", "gpio13", "gpio14", "gpio15";
-		};
-		pinconf {
-			pins = "gpio12", "gpio13", "gpio14", "gpio15";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
+		pins = "gpio12", "gpio13", "gpio14", "gpio15";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-down;
 	};
 
 	spi5_default: spi5-default {
-		pinmux {
-			function = "blsp_spi5";
-			pins = "gpio16", "gpio17", "gpio19";
-		};
-		pinmux-cs {
-			function = "gpio";
-			pins = "gpio18";
-		};
-		pinconf {
-			pins = "gpio16", "gpio17", "gpio19";
-			drive-strength = <12>;
-			bias-disable;
-		};
-		pinconf-cs {
+		pins = "gpio16", "gpio17", "gpio19";
+		function = "blsp_spi5";
+
+		drive-strength = <12>;
+		bias-disable;
+
+		cs {
 			pins = "gpio18";
+			function = "gpio";
+
 			drive-strength = <16>;
 			bias-disable;
 			output-high;
@@ -217,33 +156,24 @@ pinconf-cs {
 	};
 
 	spi5_sleep: spi5-sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio16", "gpio17", "gpio18", "gpio19";
-		};
-		pinconf {
-			pins = "gpio16", "gpio17", "gpio18", "gpio19";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
+		pins = "gpio16", "gpio17", "gpio18", "gpio19";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-down;
 	};
 
 	spi6_default: spi6-default {
-		pinmux {
-			function = "blsp_spi6";
-			pins = "gpio20", "gpio21", "gpio23";
-		};
-		pinmux-cs {
-			function = "gpio";
-			pins = "gpio22";
-		};
-		pinconf {
-			pins = "gpio20", "gpio21", "gpio23";
-			drive-strength = <12>;
-			bias-disable;
-		};
-		pinconf-cs {
+		pins = "gpio20", "gpio21", "gpio23";
+		function = "blsp_spi6";
+
+		drive-strength = <12>;
+		bias-disable;
+
+		cs {
 			pins = "gpio22";
+			function = "gpio";
+
 			drive-strength = <16>;
 			bias-disable;
 			output-high;
@@ -251,466 +181,315 @@ pinconf-cs {
 	};
 
 	spi6_sleep: spi6-sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio20", "gpio21", "gpio22", "gpio23";
-		};
-		pinconf {
-			pins = "gpio20", "gpio21", "gpio22", "gpio23";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
+		pins = "gpio20", "gpio21", "gpio22", "gpio23";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-down;
 	};
 
 	i2c1_default: i2c1-default {
-		pinmux {
-			function = "blsp_i2c1";
-			pins = "gpio2", "gpio3";
-		};
-		pinconf {
-			pins = "gpio2", "gpio3";
-			drive-strength = <2>;
-			bias-disable;
-		};
+		pins = "gpio2", "gpio3";
+		function = "blsp_i2c1";
+
+		drive-strength = <2>;
+		bias-disable;
 	};
 
 	i2c1_sleep: i2c1-sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio2", "gpio3";
-		};
-		pinconf {
-			pins = "gpio2", "gpio3";
-			drive-strength = <2>;
-			bias-disable;
-		};
+		pins = "gpio2", "gpio3";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
 	};
 
 	i2c2_default: i2c2-default {
-		pinmux {
-			function = "blsp_i2c2";
-			pins = "gpio6", "gpio7";
-		};
-		pinconf {
-			pins = "gpio6", "gpio7";
-			drive-strength = <16>;
-			bias-disable;
-		};
+		pins = "gpio6", "gpio7";
+		function = "blsp_i2c2";
+
+		drive-strength = <16>;
+		bias-disable;
 	};
 
 	i2c2_sleep: i2c2-sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio6", "gpio7";
-		};
-		pinconf {
-			pins = "gpio6", "gpio7";
-			drive-strength = <2>;
-			bias-disable;
-		};
+		pins = "gpio6", "gpio7";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
 	};
 
 	i2c4_default: i2c4-default {
-		pinmux {
-			function = "blsp_i2c4";
-			pins = "gpio14", "gpio15";
-		};
-		pinconf {
-			pins = "gpio14", "gpio15";
-			drive-strength = <16>;
-			bias-disable;
-		};
+		pins = "gpio14", "gpio15";
+		function = "blsp_i2c4";
+
+		drive-strength = <16>;
+		bias-disable;
 	};
 
 	i2c4_sleep: i2c4-sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio14", "gpio15";
-		};
-		pinconf {
-			pins = "gpio14", "gpio15";
-			drive-strength = <2>;
-			bias-disable;
-		};
+		pins = "gpio14", "gpio15";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
 	};
 
 	i2c5_default: i2c5-default {
-		pinmux {
-			function = "blsp_i2c5";
-			pins = "gpio18", "gpio19";
-		};
-		pinconf {
-			pins = "gpio18", "gpio19";
-			drive-strength = <2>;
-			bias-disable;
-		};
+		pins = "gpio18", "gpio19";
+		function = "blsp_i2c5";
+
+		drive-strength = <2>;
+		bias-disable;
 	};
 
 	i2c5_sleep: i2c5-sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio18", "gpio19";
-		};
-		pinconf {
-			pins = "gpio18", "gpio19";
-			drive-strength = <2>;
-			bias-disable;
-		};
+		pins = "gpio18", "gpio19";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
 	};
 
 	i2c6_default: i2c6-default {
-		pinmux {
-			function = "blsp_i2c6";
-			pins = "gpio22", "gpio23";
-		};
-		pinconf {
-			pins = "gpio22", "gpio23";
-			drive-strength = <16>;
-			bias-disable;
-		};
+		pins = "gpio22", "gpio23";
+		function = "blsp_i2c6";
+
+		drive-strength = <16>;
+		bias-disable;
 	};
 
 	i2c6_sleep: i2c6-sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio22", "gpio23";
-		};
-		pinconf {
-			pins = "gpio22", "gpio23";
-			drive-strength = <2>;
-			bias-disable;
-		};
+		pins = "gpio22", "gpio23";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
 	};
 
 	pmx-sdc1-clk {
 		sdc1_clk_on: clk-on {
-			pinmux {
-				pins = "sdc1_clk";
-			};
-			pinconf {
-				pins = "sdc1_clk";
-				bias-disable;
-				drive-strength = <16>;
-			};
+			pins = "sdc1_clk";
+
+			bias-disable;
+			drive-strength = <16>;
 		};
 		sdc1_clk_off: clk-off {
-			pinmux {
-				pins = "sdc1_clk";
-			};
-			pinconf {
-				pins = "sdc1_clk";
-				bias-disable;
-				drive-strength = <2>;
-			};
+			pins = "sdc1_clk";
+
+			bias-disable;
+			drive-strength = <2>;
 		};
 	};
 
 	pmx-sdc1-cmd {
 		sdc1_cmd_on: cmd-on {
-			pinmux {
-				pins = "sdc1_cmd";
-			};
-			pinconf {
-				pins = "sdc1_cmd";
-				bias-pull-up;
-				drive-strength = <10>;
-			};
+			pins = "sdc1_cmd";
+
+			bias-pull-up;
+			drive-strength = <10>;
 		};
 		sdc1_cmd_off: cmd-off {
-			pinmux {
-				pins = "sdc1_cmd";
-			};
-			pinconf {
-				pins = "sdc1_cmd";
-				bias-pull-up;
-				drive-strength = <2>;
-			};
+			pins = "sdc1_cmd";
+
+			bias-pull-up;
+			drive-strength = <2>;
 		};
 	};
 
 	pmx-sdc1-data {
 		sdc1_data_on: data-on {
-			pinmux {
-				pins = "sdc1_data";
-			};
-			pinconf {
-				pins = "sdc1_data";
-				bias-pull-up;
-				drive-strength = <10>;
-			};
+			pins = "sdc1_data";
+
+			bias-pull-up;
+			drive-strength = <10>;
 		};
 		sdc1_data_off: data-off {
-			pinmux {
-				pins = "sdc1_data";
-			};
-			pinconf {
-				pins = "sdc1_data";
-				bias-pull-up;
-				drive-strength = <2>;
-			};
+			pins = "sdc1_data";
+
+			bias-pull-up;
+			drive-strength = <2>;
 		};
 	};
 
 	pmx-sdc2-clk {
 		sdc2_clk_on: clk-on {
-			pinmux {
-				pins = "sdc2_clk";
-			};
-			pinconf {
-				pins = "sdc2_clk";
-				bias-disable;
-				drive-strength = <16>;
-			};
+			pins = "sdc2_clk";
+
+			bias-disable;
+			drive-strength = <16>;
 		};
 		sdc2_clk_off: clk-off {
-			pinmux {
-				pins = "sdc2_clk";
-			};
-			pinconf {
-				pins = "sdc2_clk";
-				bias-disable;
-				drive-strength = <2>;
-			};
+			pins = "sdc2_clk";
+
+			bias-disable;
+			drive-strength = <2>;
 		};
 	};
 
 	pmx-sdc2-cmd {
 		sdc2_cmd_on: cmd-on {
-			pinmux {
-				pins = "sdc2_cmd";
-			};
-			pinconf {
-				pins = "sdc2_cmd";
-				bias-pull-up;
-				drive-strength = <10>;
-			};
+			pins = "sdc2_cmd";
+
+			bias-pull-up;
+			drive-strength = <10>;
 		};
 		sdc2_cmd_off: cmd-off {
-			pinmux {
-				pins = "sdc2_cmd";
-			};
-			pinconf {
-				pins = "sdc2_cmd";
-				bias-pull-up;
-				drive-strength = <2>;
-			};
+			pins = "sdc2_cmd";
+
+			bias-pull-up;
+			drive-strength = <2>;
 		};
 	};
 
 	pmx-sdc2-data {
 		sdc2_data_on: data-on {
-			pinmux {
-				pins = "sdc2_data";
-			};
-			pinconf {
-				pins = "sdc2_data";
-				bias-pull-up;
-				drive-strength = <10>;
-			};
+			pins = "sdc2_data";
+
+			bias-pull-up;
+			drive-strength = <10>;
 		};
 		sdc2_data_off: data-off {
-			pinmux {
-				pins = "sdc2_data";
-			};
-			pinconf {
-				pins = "sdc2_data";
-				bias-pull-up;
-				drive-strength = <2>;
-			};
+			pins = "sdc2_data";
+
+			bias-pull-up;
+			drive-strength = <2>;
 		};
 	};
 
 	pmx-sdc2-cd-pin {
 		sdc2_cd_on: cd-on {
-			pinmux {
-				function = "gpio";
-				pins = "gpio38";
-			};
-			pinconf {
-				pins = "gpio38";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
+			pins = "gpio38";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-pull-up;
 		};
 		sdc2_cd_off: cd-off {
-			pinmux {
-				function = "gpio";
-				pins = "gpio38";
-			};
-			pinconf {
-				pins = "gpio38";
-				drive-strength = <2>;
-				bias-disable;
-			};
+			pins = "gpio38";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-disable;
 		};
 	};
 
 	cdc-pdm-lines {
 		cdc_pdm_lines_act: pdm-lines-on {
-			pinmux {
-				function = "cdc_pdm0";
-				pins = "gpio63", "gpio64", "gpio65", "gpio66",
-				       "gpio67", "gpio68";
-			};
-			pinconf {
-				pins = "gpio63", "gpio64", "gpio65", "gpio66",
-				       "gpio67", "gpio68";
-				drive-strength = <8>;
-				bias-disable;
-			};
+			pins = "gpio63", "gpio64", "gpio65", "gpio66",
+			       "gpio67", "gpio68";
+			function = "cdc_pdm0";
+
+			drive-strength = <8>;
+			bias-disable;
 		};
 		cdc_pdm_lines_sus: pdm-lines-off {
-			pinmux {
-				function = "cdc_pdm0";
-				pins = "gpio63", "gpio64", "gpio65", "gpio66",
-				       "gpio67", "gpio68";
-			};
-			pinconf {
-				pins = "gpio63", "gpio64", "gpio65", "gpio66",
-				       "gpio67", "gpio68";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
+			pins = "gpio63", "gpio64", "gpio65", "gpio66",
+			       "gpio67", "gpio68";
+			function = "cdc_pdm0";
+
+			drive-strength = <2>;
+			bias-pull-down;
 		};
 	};
 
 	ext-pri-tlmm-lines {
 		ext_pri_tlmm_lines_act: ext-pa-on {
-			pinmux {
-				function = "pri_mi2s";
-				pins = "gpio113", "gpio114", "gpio115",
-				       "gpio116";
-			};
-			pinconf {
-				pins = "gpio113", "gpio114", "gpio115",
-				       "gpio116";
-				drive-strength = <8>;
-				bias-disable;
-			};
-		};
+			pins = "gpio113", "gpio114", "gpio115", "gpio116";
+			function = "pri_mi2s";
 
+			drive-strength = <8>;
+			bias-disable;
+		};
 		ext_pri_tlmm_lines_sus: ext-pa-off {
-			pinmux {
-				function = "pri_mi2s";
-				pins = "gpio113", "gpio114", "gpio115",
-				       "gpio116";
-			};
-			pinconf {
-				pins = "gpio113", "gpio114", "gpio115",
-				       "gpio116";
-				drive-strength = <2>;
-				bias-disable;
-			};
+			pins = "gpio113", "gpio114", "gpio115", "gpio116";
+			function = "pri_mi2s";
+
+			drive-strength = <2>;
+			bias-disable;
 		};
 	};
 
 	ext-pri-ws-line {
 		ext_pri_ws_act: ext-pa-on {
-			pinmux {
-				function = "pri_mi2s_ws";
-				pins = "gpio110";
-			};
-			pinconf {
-				pins = "gpio110";
-				drive-strength = <8>;
-				bias-disable;
-			};
-		};
+			pins = "gpio110";
+			function = "pri_mi2s_ws";
 
+			drive-strength = <8>;
+			bias-disable;
+		};
 		ext_pri_ws_sus: ext-pa-off {
-			pinmux {
-				function = "pri_mi2s_ws";
-				pins = "gpio110";
-			};
-			pinconf {
-				pins = "gpio110";
-				drive-strength = <2>;
-				bias-disable;
-			};
+			pins = "gpio110";
+			function = "pri_mi2s_ws";
+
+			drive-strength = <2>;
+			bias-disable;
 		};
 	};
 
 	ext-mclk-tlmm-lines {
 		ext_mclk_tlmm_lines_act: mclk-lines-on {
-			pinmux {
-				function = "pri_mi2s";
-				pins = "gpio116";
-			};
-			pinconf {
-				pins = "gpio116";
-				drive-strength = <8>;
-				bias-disable;
-			};
+			pins = "gpio116";
+			function = "pri_mi2s";
+
+			drive-strength = <8>;
+			bias-disable;
 		};
 		ext_mclk_tlmm_lines_sus: mclk-lines-off {
-			pinmux {
-				function = "pri_mi2s";
-				pins = "gpio116";
-			};
-			pinconf {
-				pins = "gpio116";
-				drive-strength = <2>;
-				bias-disable;
-			};
+			pins = "gpio116";
+			function = "pri_mi2s";
+
+			drive-strength = <2>;
+			bias-disable;
 		};
 	};
 
 	/* secondary Mi2S */
 	ext-sec-tlmm-lines {
 		ext_sec_tlmm_lines_act: tlmm-lines-on {
-			pinmux {
-				function = "sec_mi2s";
-				pins = "gpio112", "gpio117", "gpio118",
-				       "gpio119";
-			};
-			pinconf {
-				pins = "gpio112", "gpio117", "gpio118",
-					"gpio119";
-				drive-strength = <8>;
-				bias-disable;
-			};
+			pins = "gpio112", "gpio117", "gpio118", "gpio119";
+			function = "sec_mi2s";
+
+			drive-strength = <8>;
+			bias-disable;
 		};
 		ext_sec_tlmm_lines_sus: tlmm-lines-off {
-			pinmux {
-				function = "sec_mi2s";
-				pins = "gpio112", "gpio117", "gpio118",
-				       "gpio119";
-			};
-			pinconf {
-				pins = "gpio112", "gpio117", "gpio118",
-					"gpio119";
-				drive-strength = <2>;
-				bias-disable;
-			};
+			pins = "gpio112", "gpio117", "gpio118", "gpio119";
+			function = "sec_mi2s";
+
+			drive-strength = <2>;
+			bias-disable;
 		};
 	};
 
 	cdc-dmic-lines {
 		cdc_dmic_lines_act: dmic-lines-on {
-			pinmux-dmic0-clk {
-				function = "dmic0_clk";
+			clk {
 				pins = "gpio0";
+				function = "dmic0_clk";
+
+				drive-strength = <8>;
 			};
-			pinmux-dmic0-data {
-				function = "dmic0_data";
+			data {
 				pins = "gpio1";
-			};
-			pinconf {
-				pins = "gpio0", "gpio1";
+				function = "dmic0_data";
+
 				drive-strength = <8>;
 			};
 		};
 		cdc_dmic_lines_sus: dmic-lines-off {
-			pinmux-dmic0-clk {
-				function = "dmic0_clk";
+			clk {
 				pins = "gpio0";
+				function = "dmic0_clk";
+
+				drive-strength = <2>;
+				bias-disable;
 			};
-			pinmux-dmic0-data {
-				function = "dmic0_data";
+			data {
 				pins = "gpio1";
-			};
-			pinconf {
-				pins = "gpio0", "gpio1";
+				function = "dmic0_data";
+
 				drive-strength = <2>;
 				bias-disable;
 			};
@@ -718,88 +497,64 @@ pinconf {
 	};
 
 	wcnss_pin_a: wcnss-active {
-		pinmux {
-			pins = "gpio40", "gpio41", "gpio42", "gpio43", "gpio44";
-			function = "wcss_wlan";
-		};
-		pinconf {
-			pins = "gpio40", "gpio41", "gpio42", "gpio43", "gpio44";
-			drive-strength = <6>;
-			bias-pull-up;
-		};
+		pins = "gpio40", "gpio41", "gpio42", "gpio43", "gpio44";
+		function = "wcss_wlan";
+
+		drive-strength = <6>;
+		bias-pull-up;
 	};
 
 	cci0_default: cci0-default {
-		pinmux {
-			function = "cci_i2c";
-			pins = "gpio29", "gpio30";
-		};
-		pinconf {
-			pins = "gpio29", "gpio30";
-			drive-strength = <16>;
-			bias-disable;
-		};
+		pins = "gpio29", "gpio30";
+		function = "cci_i2c";
+
+		drive-strength = <16>;
+		bias-disable;
 	};
 
 	camera_front_default: camera-front-default {
-		pinmux-pwdn {
-			function = "gpio";
-			pins = "gpio33";
-		};
-		pinconf-pwdn {
+		pwdn {
 			pins = "gpio33";
+			function = "gpio";
+
 			drive-strength = <16>;
 			bias-disable;
 		};
-
-		pinmux-rst {
-			function = "gpio";
-			pins = "gpio28";
-		};
-		pinconf-rst {
+		rst {
 			pins = "gpio28";
+			function = "gpio";
+
 			drive-strength = <16>;
 			bias-disable;
 		};
-
-		pinmux-mclk1 {
-			function = "cam_mclk1";
-			pins = "gpio27";
-		};
-		pinconf-mclk1 {
+		mclk1 {
 			pins = "gpio27";
+			function = "cam_mclk1";
+
 			drive-strength = <16>;
 			bias-disable;
 		};
 	};
 
 	camera_rear_default: camera-rear-default {
-		pinmux-pwdn {
-			function = "gpio";
-			pins = "gpio34";
-		};
-		pinconf-pwdn {
+		pwdn {
 			pins = "gpio34";
+			function = "gpio";
+
 			drive-strength = <16>;
 			bias-disable;
 		};
-
-		pinmux-rst {
-			function = "gpio";
-			pins = "gpio35";
-		};
-		pinconf-rst {
+		rst {
 			pins = "gpio35";
+			function = "gpio";
+
 			drive-strength = <16>;
 			bias-disable;
 		};
-
-		pinmux-mclk0 {
-			function = "cam_mclk0";
-			pins = "gpio26";
-		};
-		pinconf-mclk0 {
+		mclk0 {
 			pins = "gpio26";
+			function = "cam_mclk0";
+
 			drive-strength = <16>;
 			bias-disable;
 		};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index b20c1013612f..58485d055241 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -295,76 +295,51 @@ l18 {
 
 &msmgpio {
 	gpio_keys_default: gpio-keys-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio107", "gpio109";
-		};
-		pinconf {
-			pins = "gpio107", "gpio109";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
+		pins = "gpio107", "gpio109";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-up;
 	};
 
 	gpio_hall_sensor_default: gpio-hall-sensor-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio52";
-		};
-		pinconf {
-			pins = "gpio52";
-			drive-strength = <2>;
-			bias-disable;
-		};
+		pins = "gpio52";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
 	};
 
 	mdss {
 		mdss_default: mdss-default {
-			pinmux {
-				function = "gpio";
-				pins = "gpio25";
-			};
-			pinconf {
-				pins = "gpio25";
-				drive-strength = <8>;
-				bias-disable;
-			};
-		};
+			pins = "gpio25";
+			function = "gpio";
 
+			drive-strength = <8>;
+			bias-disable;
+		};
 		mdss_sleep: mdss-sleep {
-			pinmux {
-				function = "gpio";
-				pins = "gpio25";
-			};
-			pinconf {
-				pins = "gpio25";
-				drive-strength = <2>;
-				bias-pull-down;
-			};
+			pins = "gpio25";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-pull-down;
 		};
 	};
 
 	muic_int_default: muic-int-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio12";
-		};
-		pinconf {
-			pins = "gpio12";
-			drive-strength = <2>;
-			bias-disable;
-		};
+		pins = "gpio12";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
 	};
 
 	tsp_en_default: tsp-en-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio73";
-		};
-		pinconf {
-			pins = "gpio73";
-			drive-strength = <2>;
-			bias-disable;
-		};
+		pins = "gpio73";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
index b46c87289033..33160a3687ce 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
@@ -51,14 +51,10 @@ dsi0_out: endpoint {
 
 &msmgpio {
 	panel_vdd3_default: panel-vdd3-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio9";
-		};
-		pinconf {
-			pins = "gpio9";
-			drive-strength = <2>;
-			bias-disable;
-		};
+		pins = "gpio9";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
index a555db8f6b34..e4b6fa18ca25 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
@@ -38,14 +38,10 @@ iris {
 
 &msmgpio {
 	ts_int_default: ts-int-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio13";
-		};
-		pinconf {
-			pins = "gpio13";
-			drive-strength = <2>;
-			bias-disable;
-		};
+		pins = "gpio13";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
 	};
 };
-- 
2.27.0

