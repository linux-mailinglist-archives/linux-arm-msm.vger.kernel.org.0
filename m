Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9EC789C57
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 10:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjH0Iwt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 04:52:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjH0IwM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 04:52:12 -0400
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de [80.67.18.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B8C8AB;
        Sun, 27 Aug 2023 01:52:09 -0700 (PDT)
Received: from [77.64.243.219] (helo=note-book.lan)
        by smtprelay02.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <git@apitzsch.eu>)
        id 1qaBS1-0000Bt-5J; Sun, 27 Aug 2023 10:48:53 +0200
From:   =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Date:   Sun, 27 Aug 2023 10:48:00 +0200
Subject: [PATCH v4 2/2] arm64: dts: qcom: msm8939-longcheer-l9100: Add
 initial device tree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230827-bq_m5-v4-2-f8435fb8f955@apitzsch.eu>
References: <20230827-bq_m5-v4-0-f8435fb8f955@apitzsch.eu>
In-Reply-To: <20230827-bq_m5-v4-0-f8435fb8f955@apitzsch.eu>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.12.3
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This dts adds support for BQ Aquaris M5 (Longcheer L9100) released in
2015.

Add a device tree with initial support for:

- GPIO keys
- Hall sensor
- SDHCI
- WCNSS (BT/WIFI)
- Accelerometer/Magnetometer
- Vibrator
- Touchscreen
- Front flash

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      | 334 +++++++++++++++++++++
 2 files changed, 335 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 2cca20563a1d..f79b9eaab323 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-thwc-uf896.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-thwc-ufi001c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-longcheer-l9100.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-samsung-a7.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-sony-xperia-kanuti-tulip.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-motorola-potter.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
new file mode 100644
index 000000000000..6802714fda3f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8939-pm8916.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
+
+/ {
+	model = "BQ Aquaris M5 (Longcheer L9100)";
+	compatible = "longcheer,l9100", "qcom,msm8939";
+	chassis-type = "handset";
+
+	aliases {
+		mmc0 = &sdhc_1; /* eMMC */
+		mmc1 = &sdhc_2; /* SD card */
+		serial0 = &blsp_uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	gpio-hall-sensor {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&gpio_hall_sensor_default>;
+		pinctrl-names = "default";
+
+		label = "GPIO Hall Effect Sensor";
+
+		event-hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&tlmm 20 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		label = "GPIO Buttons";
+
+		button-volume-up {
+			label = "Volume Up";
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_WHITE>;
+			default-state = "off";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+
+			pinctrl-0 = <&button_backlight_default>;
+			pinctrl-names = "default";
+		};
+	};
+
+	reg_ts_vdd: regulator-vdd-ts {
+		compatible = "regulator-fixed";
+		regulator-name = "regulator-vdd-ts";
+		regulator-min-microvolt = <2850000>;
+		regulator-max-microvolt = <2850000>;
+
+		gpio = <&tlmm 78 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&ts_vdd_default>;
+		pinctrl-names = "default";
+	};
+
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pm8916_pwm 0 100000>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <128>;
+		enable-gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&lcd_bl_en_default>;
+		pinctrl-names = "default";
+	};
+
+	flash-led-controller {
+		compatible = "ocs,ocp8110";
+		flash-gpios = <&tlmm 8 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&tlmm 49 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&camera_front_flash_default>;
+		pinctrl-names = "default";
+
+		led {
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
+			flash-max-timeout-us = <250000>;
+		};
+	};
+
+	usb_id: usb-id {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb_id_default &usb_id_switch_default>;
+		pinctrl-names = "default";
+	};
+
+};
+
+&blsp_i2c3 {
+	status = "okay";
+
+	magnetometer@d {
+		compatible = "asahi-kasei,ak09911";
+		reg = <0x0d>;
+
+		vdd-supply = <&pm8916_l17>;
+		vid-supply = <&pm8916_l6>;
+
+		reset-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&mag_reset_default>;
+		pinctrl-names = "default";
+	};
+
+	light-sensor@23 {
+		compatible = "liteon,ltr559";
+		reg = <0x23>;
+
+		vdd-supply = <&pm8916_l17>;
+		vddio-supply = <&pm8916_l5>;
+
+		interrupts-extended = <&tlmm 113 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&light_int_default>;
+		pinctrl-names = "default";
+	};
+
+	imu@68 {
+		compatible = "bosch,bmi160";
+		reg = <0x68>;
+
+		vdd-supply = <&pm8916_l17>;
+		vddio-supply = <&pm8916_l6>;
+	};
+};
+
+&blsp_i2c5 {
+	status = "okay";
+
+	touchscreen@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_LEVEL_LOW>;
+
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+		vdda-supply = <&pm8916_l6>;
+		vdd-supply = <&reg_ts_vdd>;
+
+		pinctrl-0 = <&ts_int_reset_default>;
+		pinctrl-names = "default";
+
+		/* Keys listed from right to left */
+		linux,keycodes = <KEY_APPSELECT KEY_HOMEPAGE KEY_BACK>;
+	};
+};
+
+&blsp_uart2 {
+	status = "okay";
+};
+
+&pm8916_mpps {
+	pwm_out: mpp4-state {
+		pins = "mpp4";
+		function = "digital";
+		power-source = <PM8916_MPP_VPH>;
+		output-low;
+		qcom,dtest = <1>;
+	};
+};
+
+&pm8916_pwm {
+	pinctrl-0 = <&pwm_out>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pm8916_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&pm8916_rpm_regulators {
+	pm8916_l17: l17 {
+		regulator-min-microvolt = <2850000>;
+		regulator-max-microvolt = <2850000>;
+	};
+};
+
+&pm8916_vib {
+	status = "okay";
+};
+
+&sdhc_1 {
+	status = "okay";
+};
+
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_default &sdc2_cd_default>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_cd_default>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&usb {
+	extcon = <&usb_id>, <&usb_id>;
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&usb_id>;
+};
+
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
+&tlmm {
+	button_backlight_default: button-backlight-default-state {
+		pins = "gpio17";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	camera_front_flash_default: camera-front-flash-default-state {
+		pins = "gpio8", "gpio49";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	gpio_hall_sensor_default: gpio-hall-sensor-default-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio107";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	lcd_bl_en_default: lcd-bl-en-default-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	light_int_default: light-int-default-state {
+		pins = "gpio113";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	mag_reset_default: mag-reset-default-state {
+		pins = "gpio68";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	sdc2_cd_default: sdc2-cd-default-state {
+		pins = "gpio38";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	ts_int_reset_default: ts-int-reset-default-state {
+		pins = "gpio12", "gpio13";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	ts_vdd_default: ts-vdd-default-state {
+		pins = "gpio78";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	usb_id_default: usb-id-default-state {
+		pins = "gpio110";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	usb_id_switch_default: usb-id-switch-default-state {
+		pins = "gpio121";
+		function = "gpio";
+		drive-strength = <2>;
+		output-high;
+	};
+};

-- 
2.42.0

