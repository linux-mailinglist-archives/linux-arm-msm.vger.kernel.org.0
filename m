Return-Path: <linux-arm-msm+bounces-20528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBE68CF8D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 07:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9DDA281C33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A1B1BDDF;
	Mon, 27 May 2024 05:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5rObEY0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA511B5AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 05:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716788345; cv=none; b=u4l8UCSCzWkk41dX3WySjMj9gQ8KrMwJeOkY7uR4fpjeZdbCUF/MeQay139xlHCOpdquEbB0OT0F7hq/6aEvwm+Y8UIXZPgn/mDkLIJEWKkfOy9woHR5o8DDmySMvA6kcJaowxjtT3ws2GXTfZkXbW3WRK37yuiWxlaGuxEDyl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716788345; c=relaxed/simple;
	bh=7GhYbOtb83rAmQ+qmPqwraB4zBIOCOW8vfT9dpSAQbM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MenDIfdr49ICVso4Ol0br32dhRiBvtEq4bovKmLTwjOzvUsqE+ZQ+oiJkKv+SbzhECEo+LTas7CHq1WFZqQFBqsvL6OJvPlOl0PLcDi8ArvsoKyv1Waj+hRJ5for7op0BHRyrEetAUIpl1nos+prs+qE4JTwRUB6zk/fZY2trp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5rObEY0; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f47eb21f0aso7988885ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 May 2024 22:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716788343; x=1717393143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkhQVd82cIp1WKzy//c11C0Lv0bwxk73j3BRxuDvF6w=;
        b=s5rObEY0pTSJYaiNDGNxJJdML7HQyoMMPVcDU0eKVVdW8otE9xXct5PkTDEPCuJcOn
         Vgs6ba4aWB5RcQrR56QDTr0ht1qG9jm/qriR1HICtpnSzG/f2mmV6NO4r10Y+3gwTVVV
         35Fx6Z2zdI9wjAb6XCMNi5J2YRssBmEsnQ3CV3pjq264TgIGhDvIYUQzxfkSG9ukVm+9
         T1KlPxlpKQdgSNZR7f1D7dUn/mnxqckusskIuYk9u3BcT7Cvtp3VSp/tw/sjFy4o/xrf
         KCRHgOoEny7Hc3an00nfa6R7e1gYgvDWv7P+79ZBfdB6TL0aufU2JmkpKmXIC3+HA1FH
         p3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716788343; x=1717393143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkhQVd82cIp1WKzy//c11C0Lv0bwxk73j3BRxuDvF6w=;
        b=nUDOSE6euOFB12qGk3klSDJtrd/UZT7XhyWZdVL+l7ivTYdOK8RJ4Hiw0Momqi/aZn
         eIUGC8CMFOIFEIFwoKfPseQQteF+TruAnNUw0s1mJGym/L3jH2xpagPE8CD0XwbpH5s3
         CT5v7u+cRP/8fwbOII4gY3uqt8ce305b8O7HU0E1TMCX7204+xWMHZjI/M7BSckJQwmp
         G4tLzIABDoo/vn852Ca4UxiA7y9f7Si5nxZe7hbq9hVW6+lakSWZ7hn14OK5EVCMsT1U
         XVHKdu7wE+xU+w/uOl536Rv82ZkNNo+mIxQM+zNPC3n6bxrCnWgEmCpLFrh1yMKM3FK8
         8CAQ==
X-Gm-Message-State: AOJu0YwD/B/2DCyp3NH2b9zcip3yWcIel+RWFkQKitZ6Hj0MCjZ0j4aO
	crBtVXZzm3WvEWJ3GeAwst2y47oSXEWK8yY8HwKWcTSdj+2WqgMKgxGcIHLCVPQ=
X-Google-Smtp-Source: AGHT+IFbvgXPE55NivZyRtRfDzOPUXIjVE2ah6n/j+F3AYzvt02yWNgXzsGD+di1FCmU/FoOLVq8XA==
X-Received: by 2002:a17:903:1111:b0:1ee:9bbe:cbec with SMTP id d9443c01a7336-1f4497d8089mr89142465ad.46.1716788343387;
        Sun, 26 May 2024 22:39:03 -0700 (PDT)
Received: from sumit-X1.. ([223.178.210.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9684ecsm51903745ad.177.2024.05.26.22.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 22:39:03 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	stephan@gerhold.net,
	caleb.connolly@linaro.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@linaro.org,
	laetitia.mariottini@se.com,
	pascal.eberhard@se.com,
	abdou.saker@se.com,
	jimmy.lalande@se.com,
	benjamin.missey@non.se.com,
	daniel.thompson@linaro.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@linaro.org>,
	Jagdish Gediya <jagdish.gediya@linaro.org>
Subject: [PATCH RESEND2 v5 3/3] arm64: dts: qcom: apq8016: Add Schneider HMIBSC board DTS
Date: Mon, 27 May 2024 11:08:26 +0530
Message-Id: <20240527053826.294526-4-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527053826.294526-1-sumit.garg@linaro.org>
References: <20240527053826.294526-1-sumit.garg@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Schneider Electric HMIBSC board DTS. The HMIBSC board is an IIoT Edge
Box Core board based on the Qualcomm APQ8016E SoC.

Support for Schneider Electric HMIBSC. Features:
- Qualcomm Snapdragon 410C SoC - APQ8016 (4xCortex A53, Adreno 306)
- 1GiB RAM
- 8GiB eMMC, SD slot
- WiFi and Bluetooth
- 2x Host, 1x Device USB port
- HDMI
- Discrete TPM2 chip over SPI
- USB ethernet adaptors (soldered)

Co-developed-by: Jagdish Gediya <jagdish.gediya@linaro.org>
Signed-off-by: Jagdish Gediya <jagdish.gediya@linaro.org>
Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/apq8016-schneider-hmibsc.dts     | 491 ++++++++++++++++++
 2 files changed, 492 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 39889d5f8e12..ad55e52e950b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -5,6 +5,7 @@ apq8016-sbc-usb-host-dtbs	:= apq8016-sbc.dtb apq8016-sbc-usb-host.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc-usb-host.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc-d3-camera-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-schneider-hmibsc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
diff --git a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
new file mode 100644
index 000000000000..75c6137e5a11
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
@@ -0,0 +1,491 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2015, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Linaro Ltd.
+ */
+
+/dts-v1/;
+
+#include "msm8916-pm8916.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
+#include <dt-bindings/sound/apq8016-lpass.h>
+
+/ {
+	model = "Schneider Electric HMIBSC Board";
+	compatible = "schneider,apq8016-hmibsc", "qcom,apq8016";
+
+	aliases {
+		i2c1 = &blsp_i2c6;
+		i2c3 = &blsp_i2c4;
+		i2c4 = &blsp_i2c3;
+		mmc0 = &sdhc_1; /* eMMC */
+		mmc1 = &sdhc_2; /* SD card */
+		serial0 = &blsp_uart1;
+		serial1 = &blsp_uart2;
+		spi0 = &blsp_spi5;
+		usid0 = &pm8916_0;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&adv7533_out>;
+			};
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+		pinctrl-0 = <&msm_key_volp_n_default>;
+		pinctrl-names = "default";
+
+		button {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&pm8916_mpps_leds>;
+		pinctrl-names = "default";
+
+		led-1 {
+			function = LED_FUNCTION_WLAN;
+			color = <LED_COLOR_ID_YELLOW>;
+			gpios = <&pm8916_mpps 2 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "phy0tx";
+			default-state = "off";
+		};
+
+		led-2 {
+			function = LED_FUNCTION_BLUETOOTH;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pm8916_mpps 3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "bluetooth-power";
+			default-state = "off";
+		};
+	};
+
+	memory@80000000 {
+		reg = <0 0x80000000 0 0x40000000>;
+	};
+
+	reserved-memory {
+		ramoops@bff00000 {
+			compatible = "ramoops";
+			reg = <0x0 0xbff00000 0x0 0x100000>;
+			record-size = <0x20000>;
+			console-size = <0x20000>;
+			ftrace-size = <0x20000>;
+			ecc-size = <16>;
+		};
+	};
+
+	usb-hub {
+		compatible = "smsc,usb3503";
+		reset-gpios = <&pm8916_gpios 1 GPIO_ACTIVE_LOW>;
+		initial-mode = <1>;
+	};
+
+	usb_id: usb-id {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb_id_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&blsp_i2c3 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+	};
+};
+
+&blsp_i2c4 {
+	status = "okay";
+
+	adv_bridge: bridge@39 {
+		compatible = "adi,adv7533";
+		reg = <0x39>;
+		interrupts-extended = <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
+
+		adi,dsi-lanes = <4>;
+		clocks = <&rpmcc RPM_SMD_BB_CLK2>;
+		clock-names = "cec";
+		pd-gpios = <&tlmm 32 GPIO_ACTIVE_HIGH>;
+
+		avdd-supply = <&pm8916_l6>;
+		a2vdd-supply = <&pm8916_l6>;
+		dvdd-supply = <&pm8916_l6>;
+		pvdd-supply = <&pm8916_l6>;
+		v1p2-supply = <&pm8916_l6>;
+		v3p3-supply = <&pm8916_l17>;
+
+		pinctrl-0 = <&adv7533_int_active &adv7533_switch_active>;
+		pinctrl-1 = <&adv7533_int_suspend &adv7533_switch_suspend>;
+		pinctrl-names = "default","sleep";
+		#sound-dai-cells = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7533_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7533_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&blsp_i2c6 {
+	status = "okay";
+
+	rtc@30 {
+		compatible = "sii,s35390a";
+		reg = <0x30>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+	};
+};
+
+&blsp_spi5 {
+	cs-gpios = <&tlmm 18 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	tpm@0 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <500000>;
+	};
+};
+
+&blsp_uart1 {
+	label = "UART0";
+	status = "okay";
+};
+
+&blsp_uart2 {
+	label = "UART1";
+	status = "okay";
+};
+
+&lpass {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&adv7533_in>;
+};
+
+&pm8916_codec {
+	qcom,mbhc-vthreshold-low = <75 150 237 450 500>;
+	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
+	status = "okay";
+};
+
+&pm8916_gpios {
+	gpio-line-names =
+		"USB_HUB_RESET_N_PM",
+		"USB_SW_SEL_PM",
+		"NC",
+		"NC";
+
+	usb_hub_reset_pm: usb-hub-reset-pm-state {
+		pins = "gpio1";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		input-disable;
+		output-high;
+	};
+
+	usb_hub_reset_pm_device: usb-hub-reset-pm-device-state {
+		pins = "gpio1";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		input-disable;
+		output-low;
+	};
+
+	usb_sw_sel_pm: usb-sw-sel-pm-state {
+		pins = "gpio2";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		power-source = <PM8916_GPIO_VPH>;
+		input-disable;
+		output-high;
+	};
+
+	usb_sw_sel_pm_device: usb-sw-sel-pm-device-state {
+		pins = "gpio2";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		power-source = <PM8916_GPIO_VPH>;
+		input-disable;
+		output-low;
+	};
+};
+
+&pm8916_mpps {
+	gpio-line-names =
+		"NC",
+		"WLAN_LED_CTRL",
+		"BT_LED_CTRL",
+		"NC";
+
+	pm8916_mpps_leds: pm8916-mpps-state {
+		pins = "mpp2", "mpp3";
+		function = "digital";
+		output-low;
+	};
+};
+
+&pm8916_resin {
+	linux,code = <KEY_POWER>;
+	status = "okay";
+};
+
+&pm8916_rpm_regulators {
+	pm8916_l17: l17 {
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
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
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&sound {
+	pinctrl-0 = <&cdc_pdm_default &sec_mi2s_default>;
+	pinctrl-1 = <&cdc_pdm_sleep &sec_mi2s_sleep>;
+	pinctrl-names = "default", "sleep";
+	model = "HMIBSC";
+	audio-routing =
+		"AMIC2", "MIC BIAS Internal2",
+		"AMIC3", "MIC BIAS External1";
+	status = "okay";
+
+	quaternary-dai-link {
+		link-name = "ADV7533";
+		cpu {
+			sound-dai = <&lpass MI2S_QUATERNARY>;
+		};
+		codec {
+			sound-dai = <&adv_bridge 0>;
+		};
+	};
+
+	primary-dai-link {
+		link-name = "WCD";
+		cpu {
+			sound-dai = <&lpass MI2S_PRIMARY>;
+		};
+		codec {
+			sound-dai = <&lpass_codec 0>, <&pm8916_codec 0>;
+		};
+	};
+
+	tertiary-dai-link {
+		link-name = "WCD-Capture";
+		cpu {
+			sound-dai = <&lpass MI2S_TERTIARY>;
+		};
+		codec {
+			sound-dai = <&lpass_codec 1>, <&pm8916_codec 1>;
+		};
+	};
+};
+
+&tlmm {
+	pinctrl-0 = <&uart1_mux0_rs232_high &uart1_mux1_rs232_low>;
+	pinctrl-names = "default";
+
+	adv7533_int_active: adv533-int-active-state {
+		pins = "gpio31";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	adv7533_int_suspend: adv7533-int-suspend-state {
+		pins = "gpio31";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	adv7533_switch_active: adv7533-switch-active-state {
+		pins = "gpio32";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	adv7533_switch_suspend: adv7533-switch-suspend-state {
+		pins = "gpio32";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	msm_key_volp_n_default: msm-key-volp-n-default-state {
+		pins = "gpio107";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	sdc2_cd_default: sdc2-cd-default-state {
+		pins = "gpio38";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	/*
+	 * UART1 being the debug console supports various modes of
+	 * operation (RS-232/485/422) controlled via GPIOs configured
+	 * mux as follows:
+	 *
+	 *   gpio100    gpio99    UART mode
+	 *   0          0         loopback
+	 *   0          1         RS-232
+	 *   1          0         RS-485
+	 *   1          1         RS-422
+	 *
+	 * The default mode configured here is RS-232 mode.
+	 */
+	uart1_mux0_rs232_high: uart1-mux0-rs232-state {
+		bootph-all;
+		pins = "gpio99";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-high;
+	};
+
+	uart1_mux1_rs232_low: uart1-mux1-rs232-state {
+		bootph-all;
+		pins = "gpio100";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	usb_id_default: usb-id-default-state {
+		pins = "gpio110";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+};
+
+&usb {
+	extcon = <&usb_id>, <&usb_id>;
+	pinctrl-0 = <&usb_sw_sel_pm &usb_hub_reset_pm>;
+	pinctrl-1 = <&usb_sw_sel_pm_device &usb_hub_reset_pm_device>;
+	pinctrl-names = "default", "device";
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&usb_id>;
+};
+
+&wcnss {
+	firmware-name = "qcom/apq8016/wcnss.mbn";
+	status = "okay";
+};
+
+&wcnss_ctrl {
+	firmware-name = "qcom/apq8016/WCNSS_qcom_wlan_nv_sbc.bin";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
+&wcnss_mem {
+	status = "okay";
+};
+
+/* PINCTRL - additions to nodes defined in msm8916.dtsi */
+
+/*
+ * 2mA drive strength is not enough when connecting multiple
+ * I2C devices with different pull up resistors.
+ */
+&blsp_i2c4_default {
+	drive-strength = <16>;
+};
+
+&blsp_i2c6_default {
+	drive-strength = <16>;
+};
+
+&blsp_uart1_default {
+	bootph-all;
+};
+
+/* Enable CoreSight */
+&cti0 { status = "okay"; };
+&cti1 { status = "okay"; };
+&cti12 { status = "okay"; };
+&cti13 { status = "okay"; };
+&cti14 { status = "okay"; };
+&cti15 { status = "okay"; };
+&debug0 { status = "okay"; };
+&debug1 { status = "okay"; };
+&debug2 { status = "okay"; };
+&debug3 { status = "okay"; };
+&etf { status = "okay"; };
+&etm0 { status = "okay"; };
+&etm1 { status = "okay"; };
+&etm2 { status = "okay"; };
+&etm3 { status = "okay"; };
+&etr { status = "okay"; };
+&funnel0 { status = "okay"; };
+&funnel1 { status = "okay"; };
+&replicator { status = "okay"; };
+&stm { status = "okay"; };
+&tpiu { status = "okay"; };
-- 
2.34.1


