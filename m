Return-Path: <linux-arm-msm+bounces-61156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEC8AD7E7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 00:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AE823A6D6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 22:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C012E0B69;
	Thu, 12 Jun 2025 22:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NaCcSvsA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1872B2DFA3A;
	Thu, 12 Jun 2025 22:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749767849; cv=none; b=G9MM0ofxfUxClpagr/x6pKTbF/fI7O9OV+TgktP5qHw3Qti1z8YRAwRxB6AMU6PrAHsz5q4B7dtP2JACgN157YTBuQ2FfUQsbQjALYggKQNH4XUg+lGgQPg5VgZtokE6PtlQ6HhbEVaPpdpbkaJJmIhF6+ht+f3a9zf5WuMiIj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749767849; c=relaxed/simple;
	bh=bQKwbfkWZ9mTxfzDjZMv3JMekgXaJnBvKfTLA6DXtyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4QwWU+V0yRrAJtTMejJvc5BZSUrArUclCYeq0Vuw+IL/tjQIid0vxoFbY74lvI58AharGf5yOlr0r/3POCC5SF507hXqyHd46UiSeV6zoefEb6/cq3kAnzMTqF+4UOidj9cumP1cMfQNPgxy+o0tQFj4QbpilZkvBtGLOT34gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NaCcSvsA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4CBFC4CEF6;
	Thu, 12 Jun 2025 22:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749767848;
	bh=bQKwbfkWZ9mTxfzDjZMv3JMekgXaJnBvKfTLA6DXtyc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NaCcSvsAFuhDuV4tP447TaDJZcYMmCTD9Cj8gncutDrzNpclmG9NWTbSpnMgIEec/
	 qB9nCHTVo65WTcPqddjd8euHzw+nL2tLMf90oPIV6mzUwgoM80azPe0t+mEDyv/mzU
	 K3dfuzP8ad8pEAYPJXq8ZTwhp8xm9NWli4qcRIrOVfrvhwfwrOrGQv7OOEnlbyeumJ
	 hHKiejhFG2UCBg5M1Aa/sdCX7DVLGZVzjA4w72haGtAka6OXnq9uHsJA9631cpzK52
	 xM3Pz6MZCwuIXSUwzWB1XQY6UnGUxtdMRRR9b84PKwrx/JZeXm0cXf+5oW/Y0PiSjn
	 Z5Aar+EcwBXAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6F3C71148;
	Thu, 12 Jun 2025 22:37:28 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Fri, 13 Jun 2025 00:37:20 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: msm8976-longcheer-l9360: Add initial
 device tree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250613-bqx5plus-v1-3-2bc2d43707a6@apitzsch.eu>
References: <20250613-bqx5plus-v1-0-2bc2d43707a6@apitzsch.eu>
In-Reply-To: <20250613-bqx5plus-v1-0-2bc2d43707a6@apitzsch.eu>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749767846; l=13022;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=0zZRc6MvI627wnzmatoEQv8oJVJLweVpxrFTgdR6QCc=;
 b=2hcG3l3xp+yGSMosPH4+fRiGucq8V6JP5ey5aaDBAnZzQ50PRQrOTUHXDsQ8D8qFja0MEK6Zc
 6fGmUx9bR21A54L3CS+mkqM3f7A0AoDs8JVqUcYenljJhQw4OpRwt2+
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

This dts adds support for BQ Aquaris X5 Plus (Longcheer L9360) released
in 2016.

Add a device tree with initial support for:

- GPIO keys
- NFC
- SDHCI
- Status LED
- Touchscreen

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/msm8976-longcheer-l9360.dts      | 532 +++++++++++++++++++++
 2 files changed, 533 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 669b888b27a1daa93ac15f47e8b9a302bb0922c2..80fd9a910af478558bb840f7ce5aa52948912be0 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -77,6 +77,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-tissot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-vince.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8956-sony-xperia-loire-kugo.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8956-sony-xperia-loire-suzu.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8976-longcheer-l9360.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-h815.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts b/arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts
new file mode 100644
index 0000000000000000000000000000000000000000..b7040973f85972fabde3b6b50cb2eb323b645537
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts
@@ -0,0 +1,532 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, André Apitzsch <git@apitzsch.eu>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+
+#include "msm8976.dtsi"
+#include "pm8004.dtsi"
+#include "pm8950.dtsi"
+
+/ {
+	model = "BQ Aquaris X5 Plus (Longcheer L9360)";
+	compatible = "longcheer,l9360", "qcom,msm8976";
+	chassis-type = "handset";
+
+	aliases {
+		mmc0 = &sdhc_1; /* SDC1 eMMC slot */
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer@83200000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0x83200000 0x0 (1080 * 1920 * 3)>;
+			width = <1080>;
+			height = <1920>;
+			stride = <(1080 * 3)>;
+			format = "r8g8b8";
+
+			power-domains = <&gcc MDSS_GDSC>;
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>,
+				 <&gcc GCC_MDSS_MDP_CLK>,
+				 <&gcc GCC_MDSS_BYTE0_CLK>,
+				 <&gcc GCC_MDSS_PCLK0_CLK>,
+				 <&gcc GCC_MDSS_ESC0_CLK>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&hall_sensor_default>, <&volume_up_default>;
+		pinctrl-names = "default";
+
+		event-hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&tlmm 107 GPIO_ACTIVE_HIGH>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+			wakeup-source;
+		};
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&tlmm 113 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			gpios = <&tlmm 101 GPIO_ACTIVE_HIGH>;
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
+
+		gpio = <&tlmm 33 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		framebuffer@83000000 {
+			reg = <0x0 0x83000000 0x0 0x2800000>;
+			no-map;
+		};
+
+		/delete-node/ tz-apps@8dd00000;
+		tzapp@8dd00000 {
+			reg = <0x0 0x8dd00000 0x0 0x1900000>;
+			no-map;
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&blsp1_i2c2 {
+	status = "okay";
+
+	led-controller@30 {
+		compatible = "kinetic,ktd2026";
+		reg = <0x30>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		multi-led {
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+	};
+};
+
+&blsp1_i2c4 {
+	status = "okay";
+
+	nfc@28 {
+		compatible = "nxp,pn547", "nxp,nxp-nci-i2c";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 140 IRQ_TYPE_EDGE_RISING>;
+
+		enable-gpios = <&tlmm 122 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 109 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&nfc_default>;
+		pinctrl-1 = <&nfc_sleep>;
+		pinctrl-names = "default", "sleep";
+	};
+};
+
+&blsp2_i2c2 {
+	status = "okay";
+
+	touchscreen@20 {
+		reg = <0x20>;
+		compatible = "syna,rmi4-i2c";
+
+		interrupts-extended = <&tlmm 65 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ts_int_default>, <&ts_reset_default>;
+		pinctrl-1 = <&ts_int_sleep>, <&ts_reset_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		vdd-supply = <&pm8950_l6>;
+		vio-supply = <&reg_ts_vdd>;
+
+		reset-gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
+
+		syna,reset-delay-ms = <200>;
+		syna,startup-delay-ms = <200>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rmi4-f01@1 {
+			reg = <0x1>;
+			syna,nosleep-mode = <1>; /* Allow sleeping */
+		};
+
+		rmi4-f12@12 {
+			reg = <0x12>;
+			syna,sensor-type = <1>; /* Touchscreen */
+		};
+	};
+};
+
+&blsp2_uart2 {
+	status = "okay";
+};
+
+&gcc {
+	vdd_gfx-supply = <&pm8004_s5>;
+};
+
+&pm8004_spmi_regulators {
+	vdd_s2-supply = <&vph_pwr>;
+	vdd_s5-supply = <&vph_pwr>;
+
+	/* Cluster 1 supply */
+	pm8004_s2: s2 {
+		/* regulator-min-microvolt = <500000>; */
+		/* Set .95V to prevent unstabilities until CPR for this SoC is done */
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <1165000>;
+		regulator-name = "vdd_apc1";
+		/* Set always on until the CPU PLL is done */
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	pm8004_s5: s5 {
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <1165000>;
+		regulator-enable-ramp-delay = <500>;
+		regulator-name = "vdd_gfx";
+		/* Hack this on until the gpu driver is ready for it */
+		regulator-always-on;
+	};
+};
+
+&pm8950_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&pm8950_spmi_regulators {
+	vdd_s5-supply = <&vph_pwr>;
+
+	/* Cluster 0 supply */
+	pm8950_spmi_s5: s5 {
+		/* Set .95V to prevent unstabilities until CPR for this SoC is done */
+		/* regulator-min-microvolt = <500000>; */
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <1165000>;
+		regulator-name = "vdd_apc0";
+		/* Set always on until the CPU PLL is done */
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&rpm_requests {
+	pm8950_regulators: regulators {
+		compatible = "qcom,rpm-pm8950-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+		vdd_l1_l19-supply = <&pm8950_s3>;
+		vdd_l2_l23-supply = <&pm8950_s3>;
+		vdd_l3-supply = <&pm8950_s3>;
+		vdd_l5_l6_l7_l16-supply = <&pm8950_s4>;
+		vdd_l8_l11_l12_l17_l22-supply = <&vph_pwr>;
+
+		pm8950_s1: s1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1162500>;
+		};
+
+		pm8950_s3: s3 {
+			regulator-min-microvolt = <1325000>;
+			regulator-max-microvolt = <1325000>;
+		};
+
+		pm8950_s4: s4 {
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+		};
+
+		pm8950_l1: l1 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8950_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8950_l3: l3 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+		};
+
+		pm8950_l5: l5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8950_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8950_l7: l7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8950_l8: l8 {
+			regulator-min-microvolt = <2900000>;
+			regulator-max-microvolt = <2900000>;
+		};
+
+		pm8950_l9: l9 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8950_l10: l10 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8950_l11: l11 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8950_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8950_l13: l13 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+		};
+
+		pm8950_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8950_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8950_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8950_l17: l17 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+		};
+
+		pm8950_l19: l19 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1350000>;
+		};
+
+		pm8950_l22: l22 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8950_l23: l23 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+	};
+};
+
+&sdhc_1 {
+	bus-width = <8>;
+	non-removable;
+	vmmc-supply = <&pm8950_l8>;
+	vqmmc-supply = <&pm8950_l5>;
+	status = "okay";
+};
+
+&sdhc_2 {
+	bus-width = <4>;
+	cd-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&pm8950_l11>;
+	vqmmc-supply = <&pm8950_l12>;
+
+	pinctrl-0 = <&sdc2_default>, <&sdc2_cd_default>;
+	pinctrl-1 = <&sdc2_sleep>, <&sdc2_cd_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>;
+
+	button_backlight_default: button-backlight-default-state {
+		pins = "gpio101";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	hall_sensor_default: hall-sensor-default-state {
+		pins = "gpio107";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	nfc_default: nfc-default-state {
+		pins = "gpio122", "gpio140";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	nfc_sleep: nfc-sleep-state {
+		int-pins {
+			pins = "gpio140";
+			function = "gpio";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+		ven-pins {
+			pins = "gpio122";
+			function = "gpio";
+			drive-strength = <6>;
+			bias-disable;
+		};
+	};
+
+	sdc2_default: sdc2-default-state {
+		clk-pins {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+		cmd-pins {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+		data-pins {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+	};
+
+	sdc2_sleep: sdc2-sleep-state {
+		clk-pins {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <2>;
+		};
+		cmd-pins {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+		data-pins {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+	};
+
+	sdc2_cd_default: sdc2-cd-default-state {
+		pins = "gpio100";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	sdc2_cd_sleep: sdc2-cd-sleep-state {
+		pins = "gpio100";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	ts_int_default: ts-int-state {
+		pins = "gpio65";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	ts_int_sleep: ts-int-state {
+		pins = "gpio65";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	ts_reset_default: ts-reset-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	ts_reset_sleep: ts-sleep-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	volume_up_default: volume-up-default-state {
+		pins = "gpio113";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&xo_board {
+	clock-frequency = <19200000>;
+};

-- 
2.49.0



