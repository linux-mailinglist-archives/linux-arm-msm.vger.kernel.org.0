Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17683EAE9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 12:17:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfJaLQ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 07:16:59 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:38461 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727300AbfJaLQ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 07:16:58 -0400
Received: by mail-wm1-f42.google.com with SMTP id z19so1306895wmk.3;
        Thu, 31 Oct 2019 04:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=werJCHLRluKX9/16hHAnM+yXN05/lUZ4BPUDOipmtuI=;
        b=qlyq5BjjmrW/ONvqMk/A8/CyhQAXslHBgUzOWzduHUUNBV3ZXKca03qyTHsUPSIRpA
         vtS+tGBrxDQRv8p7nhS35w92whENUh0Ay8kYuL07acECGC+17pdnQtBuBmImXD8GQ1VU
         HaiNpw+6BnS/BOUeuOCu+WwMyy2WZfvBSM//Wz2zbozmUw7WmFgwbNDkEL7A62mYiiwT
         zxdMzCrp3k+kqAMOhpcGBTkrRNMxx88A8Htt9ho9YEPPbEHk+EdwGL03UorzxTgMrxr0
         mbE0jjRbo0a+2cum4ifolZzr8RANzeRnbpiOITsDEMLTDqyj6RC1C3IKcc4ktSyhDmEI
         i1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=werJCHLRluKX9/16hHAnM+yXN05/lUZ4BPUDOipmtuI=;
        b=Buj1gjq8bnFaxBA8HNlZacEL5teUWRxgDCEKNAjt0+ZBbs6w5P35igGnw4qJ+XGoa0
         MQIg8+RyQ94lOwmCzb3cuf9/s977DGiy3t0RiabZfIiQURV2x2lqHERnworiB/qdfM3f
         sLLjFUDkf/NkMDZsCs3ZdChab8OWasnHlUrl/t6tIm0wyGAop4Yz1Aujvc8PhaCBZcny
         9Gt9Pfe9hyTooSqQOGVzctt4qVIcJsVfQibrrtV4qFLlBygqp05HuT4E1IWlQny4Y16s
         +OZojrYmj9xXCuo9fB+xXbVatYxl18oFw9k4Gu8VbSTr/Jbdiz9XAQ4N7U4Sqf7e4Mho
         zkAw==
X-Gm-Message-State: APjAAAWa0YTRcX6qV5EpRMR5RV4pMsyTMNV1SB4OBUe89rBPF1DWHGjG
        AIvWnB+7ojS1RND8jOvs/g8TFEce2Mo=
X-Google-Smtp-Source: APXvYqzlVz87j9MAuPGI6M+w1PVd1/26mYqHiDiiais4DeKnR+ywAiUL4jM44vJkHT61OS1zg+Y0Ww==
X-Received: by 2002:a7b:c1da:: with SMTP id a26mr4776685wmj.84.1572520614014;
        Thu, 31 Oct 2019 04:16:54 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id s17sm3009306wmh.3.2019.10.31.04.16.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 04:16:53 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, ccross@android.com,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, marijns95@gmail.com, kholk11@gmail.com
Subject: [PATCH v2 5/5] arm64: dts: qcom: Add Sony Xperia (Loire) X and X Compact support
Date:   Thu, 31 Oct 2019 12:16:45 +0100
Message-Id: <20191031111645.34777-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031111645.34777-1-kholk11@gmail.com>
References: <20191031111645.34777-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This adds support for the Sony Xperia Loire/SmartLoire platform
with a base configuration that is common across all of the
devices that are based on this project.

Also adds a base DT configuration for the Xperia X and Xperia
X Compact (respectively, Suzu and Kugo) which is valid for both
their RoW (single-sim), DSDS (dual-sim) and other regional
variants of these two smartphones, that makes us able to boot
to a UART console.

This configuration also enables the use of the Broadcom SDIO
WiFi solution (BCM43455), vibrator, GPIO Keys, eMMC, MicroSD
card slot, Synaptics touchscreen (i2c) and configures all of
the needed regulators and GPIOs present on all Loire boards.

Please note that, currently, the APC0/1 (cluster 0/1) vregs
are set to a safe voltage in order to ensure boot stability
until a proper solution for CPU DVFS scaling lands.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../qcom/msm8956-sony-xperia-loire-kugo.dts   |  56 ++
 .../qcom/msm8956-sony-xperia-loire-suzu.dts   |  17 +
 .../dts/qcom/msm8956-sony-xperia-loire.dtsi   | 744 ++++++++++++++++++
 4 files changed, 819 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6498a1ec893f..a6fdd97de83e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -6,6 +6,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8956-sony-xperia-loire-kugo.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8956-sony-xperia-loire-suzu.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dts b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dts
new file mode 100644
index 000000000000..f77cfd5424f0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dts
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2014 Sony Mobile Communications Inc.
+ * Copyright (c) 2016-2019 AngeloGioacchino Del Regno <kholk11@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "msm8956-sony-xperia-loire.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Sony Xperia X Compact (Loire Kugo)";
+	compatible = "sony,xperia-kugo", "qcom,msm8956";
+
+	qcom,msm-id = <266 0x10001>; /* MSM8956 PM/PMI8956 */
+	qcom,board-id = <8 0>;
+};
+
+&blsp_i2c6 {
+	status = "ok";
+};
+
+&pm8950_l1 {
+	regulator-min-microvolt = <1100000>;
+	regulator-max-microvolt = <1300000>;
+};
+
+/* Machine specific pins */
+&tlmm {
+	usb_cable_det_n_gpio: usb_cable_det_n {
+		pins = "gpio107";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-up;
+		input-enable;
+	};
+
+	usb_cable_sense_en_gpio: usb_cable_sense_en {
+		pins = "gpio116";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	usb_cc_int_n_gpio: usb_cc_int_n {
+		pins = "gpio131";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-up;
+		input-enable;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dts b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dts
new file mode 100644
index 000000000000..14d65e68f300
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2014 Sony Mobile Communications Inc.
+ * Copyright (c) 2016-2019 AngeloGioacchino Del Regno <kholk11@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "msm8956-sony-xperia-loire.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Sony Xperia X (Loire Suzu)";
+	compatible = "sony,xperia-suzu", "qcom,msm8956";
+
+	qcom,msm-id = <266 0x10001>; /* MSM8956 PM/PMI8956 */
+	qcom,board-id = <8 0>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
new file mode 100644
index 000000000000..8da88bb24e7d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
@@ -0,0 +1,744 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sony Xperia Loire/SmartLoire platform (MSM8956/APQ8056) configuration
+ * This configuration is common across a range of Xperia devices
+ * based on the Loire and SmartLoire projects.
+ *
+ * Copyright (C) 2014 Sony Mobile Communications Inc.
+ * Copyright (c) 2016-2019 AngeloGioacchino Del Regno <kholk11@gmail.com>
+ */
+
+#include "msm8976.dtsi"
+#include "pmi8950.dtsi"
+#include "pm8950.dtsi"
+#include "pm8004.dtsi"
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+/ {
+	aliases {
+		serial0 = &blsp2_uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reserved-memory {
+		ramoops {
+			compatible = "ramoops";
+			reg = <0 0x57f00000 0 0x00100000>;
+			record-size = <0x20000>;
+			console-size = <0x40000>;
+			ftrace-size = <0x20000>;
+			pmsg-size = <0x20000>;
+			ecc-size = <16>;
+			status = "ok";
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	tp_vddio_vreg: tp-vddio-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "tp-vddio";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 126 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&tp_vddio_en_gpio>;
+	};
+
+	bcm43455_pwr_vreg: wlan-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "wlan-vreg";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 48 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wl_vreg_on_gpio>;
+	};
+
+	bcm43455_pwrseq: wlan-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pm8950_gpios 2 GPIO_ACTIVE_LOW>;
+	};
+
+	vibrator {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&pmi8950_gpio 2 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&vibrator_ldo_en>;
+	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		input-name = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		autorepeat;
+
+		button@0 {
+			label = "Volume Up";
+			gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+
+		button@1 {
+			label = "Volume Down";
+			gpios = <&tlmm 113 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+
+		button@2 {
+			label = "Camera Focus";
+			gpios = <&tlmm 114 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_CAMERA_FOCUS>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+
+		button@3 {
+			label = "Camera Snapshot";
+			gpios = <&tlmm 115 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_CAMERA>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			debounce-interval = <15>;
+		};
+	};
+};
+
+&blsp_dma {
+	status = "ok";
+};
+
+&blsp2_dma {
+	status = "ok";
+};
+
+&blsp1_uart1 {
+	status = "disabled";
+};
+
+&blsp1_uart2 {
+	status = "disabled";
+};
+
+&blsp2_uart2 {
+	status = "ok";
+};
+
+/* eMMC */
+&sdhc_1 {
+	vmmc-supply = <&pm8950_l8>;
+	vqmmc-supply = <&pm8950_l5>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc1_on>;
+	pinctrl-1 = <&sdc1_off>;
+
+	status = "ok";
+};
+
+/* MicroSD card slot */
+&sdhc_2 {
+	vmmc-supply = <&pm8950_l11>;
+	vqmmc-supply = <&pm8950_l12>;
+	cd-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_on &tray_det_n_gpio>;
+	pinctrl-1 = <&sdc2_off &tray_det_n_gpio>;
+
+	status = "ok";
+};
+
+/* SDIO (internal) to BCM WiFi */
+&sdhc_3 {
+	status = "ok";
+	no-sd;
+	no-mmc;
+
+	bus-width = <4>;
+	max-frequency = <100000000>;
+	keep-power-in-suspend;
+
+	non-removable;
+	wakeup-source;
+	vmmc-supply = <&bcm43455_pwr_vreg>;
+	mmc-pwrseq = <&bcm43455_pwrseq>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc3_on &wlan_sleep_pin &wl_host_wake_n_gpio>;
+	pinctrl-1 = <&sdc3_off &wlan_sleep_pin &wl_host_wake_n_gpio>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	brcmf: brcmf@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		interrupt-parent = <&tlmm>;
+		interrupts = <45 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "host-wake";
+	};
+};
+
+&blsp_i2c4 {
+	status = "ok";
+
+	rmi4-i2c-dev@2c {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x2c>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <65 IRQ_TYPE_EDGE_FALLING>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vdd-supply = <&tp_vddio_vreg>;
+
+		syna,reset-delay-ms = <220>;
+		syna,startup-delay-ms = <220>;
+
+		rmi4-f01@1 {
+			reg = <0x1>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f12@12 {
+			reg = <0x12>;
+			syna,sensor-type = <1>;
+		};
+	};
+};
+
+&blsp_i2c8 {
+	status = "ok";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>;
+
+	mdp_vsync_p_gpio: mdp_sync_p_gpio {
+		pins = "gpio24";
+		function = "mdp_vsync";
+
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	disp_reset_n_gpio: disp_reset_n_gpio {
+		pins = "gpio25";
+		function = "gpio";
+
+		drive-strength = <2>;
+		output-high;
+	};
+
+	wl_host_wake_n_gpio: wl_host_wake_n_gpio {
+		pins = "gpio45";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-down;
+		input-enable;
+	};
+
+	wl_vreg_on_gpio: wl_vreg_on_gpio {
+		pins = "gpio48";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	tp_reset_n_gpio: tp_reset_n_gpio {
+		pins = "gpio64";
+		function = "gpio";
+
+		drive-strength = <2>;
+	};
+
+	tp_int_n_gpio: tp_int_n_gpio {
+		pins = "gpio65";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-up;
+		input-enable;
+	};
+
+	tray_det_n_gpio: tray_det_n_gpio {
+		pins = "gpio100";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+		input-enable;
+	};
+
+	tp_vddio_en_gpio: tp_vddio_en_gpio {
+		pins = "gpio126";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	sdc1_on: sdc1-on {
+		clk {
+			pins = "sdc1_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		cmd {
+			pins = "sdc1_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		data {
+			pins = "sdc1_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		rclk {
+			pins = "sdc1_rclk";
+			bias-pull-down;
+		};
+	};
+
+	sdc1_off: sdc1-off {
+		clk {
+			pins = "sdc1_clk";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		cmd {
+			pins = "sdc1_cmd";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		data {
+			pins = "sdc1_data";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		rclk {
+			pins = "sdc1_rclk";
+			bias-pull-down;
+		};
+	};
+
+	sdc2_on: sdc2-on {
+		clk {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		cmd {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		data {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+	};
+
+	sdc2_off: sdc2-off {
+		clk {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		cmd {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		data {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+	};
+
+	sdc3_on: sdc3-on {
+		clk {
+			pins = "gpio44";
+			function = "sdc3";
+			bias-disable;
+			drive-strength = <10>;
+		};
+
+		cmd {
+			pins = "gpio43";
+			function = "sdc3";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		data {
+			pins = "gpio39", "gpio40", "gpio41", "gpio42";
+			function = "sdc3";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+	};
+
+	sdc3_off: sdc3-off {
+		clk {
+			pins = "gpio44";
+			function = "sdc3";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		cmd {
+			pins = "gpio43";
+			function = "sdc3";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		data {
+			pins = "gpio39", "gpio40", "gpio41", "gpio42";
+			function = "sdc3";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+	};
+};
+
+&mdss {
+	vdd-supply = <&pm8950_l17>;
+};
+
+&dsi0 {
+	vdda-supply = <&pm8950_l1>;
+	vddio-supply = <&pm8950_l6>;
+};
+
+&dsi1 {
+	vdda-supply = <&pm8950_l1>;
+	vddio-supply = <&pm8950_l6>;
+};
+
+&dsi_phy0 {
+	vddio-supply = <&pm8950_l6>;
+};
+
+&dsi_phy1 {
+	vddio-supply = <&pm8950_l6>;
+};
+
+&pm8004_lsid5 {
+	status = "ok";
+};
+
+&pm8004_spmi_regulators {
+	vdd_s2-supply = <&vph_pwr>;
+	vdd_s5-supply = <&vph_pwr>;
+
+	/* Cluster 1 supply */
+	pm8004_s2: s2 {
+		/* Set APC1 always-on and raise min voltage to .95V
+		 * until a proper CPU scaling solution lands
+		 */
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-name = "vdd_apc1";
+		regulator-min-microvolt = <950000>; /* 500000 */
+		regulator-max-microvolt = <1165000>;
+	};
+
+	pm8004_s5: s5 {
+		/* Put GFX VDD up at boot until a proper solution lands */
+		regulator-boot-on;
+
+		regulator-name = "vdd_gfx";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <1165000>;
+		regulator-enable-ramp-delay = <500>;
+	};
+};
+
+&adreno_gpu {
+	vdd-supply = <&pm8004_s5>;
+};
+
+&pm8950_spmi_regulators {
+	vdd_s5-supply = <&vph_pwr>;
+
+	/* Cluster 0 supply */
+	pm8950_spmi_s5: s5 {
+		/* Set APC0 always-on and raise min voltage to .95V
+		 * until a proper CPU scaling solution lands
+		 */
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-name = "vdd_apc0";
+		regulator-min-microvolt = <950000>; /* 790000 */
+		regulator-max-microvolt = <1165000>;
+	};
+};
+
+&rpm_requests {
+	smd_rpm_regulators: pm8950-rpm-regulators {
+		compatible = "qcom,rpm-pm8950-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_s5-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+		vdd_l1_l19-supply = <&pm8950_s3>;
+		vdd_l2_l23-supply = <&pm8950_s3>;
+		vdd_l3-supply = <&pm8950_s3>;
+		vdd_l4_l5_l6_l7_l16-supply = <&pm8950_s4>;
+		vdd_l8_l11_l12_l17_l22-supply = <&vph_pwr>;
+		vdd_l20-supply = <&pm8950_s4>;
+		vdd_l21-supply = <&pm8950_s4>;
+
+		pm8950_s1: s1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1162500>;
+		};
+
+		pm8950_s3: s3 {
+			regulator-min-microvolt = <1325000>;
+			regulator-max-microvolt = <1325000>;
+			regulator-always-on;
+		};
+
+		pm8950_s4: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+
+		pm8950_s5: s5 {};
+
+		pm8950_s6: s6 {};
+
+		pm8950_l1: l1 {
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-min-microamp = <100>;
+			regulator-max-microamp = <100000>;
+			regulator-enable-ramp-delay = <10>;
+
+			regulator-system-load = <100000>;
+			regulator-allow-set-load;
+		};
+
+		pm8950_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8950_l3: l3 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8950_l5: l5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+
+			regulator-system-load = <300000>;
+			regulator-allow-set-load;
+		};
+
+		pm8950_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-min-microamp = <100>;
+			regulator-max-microamp = <100000>;
+
+			regulator-system-load = <100000>;
+			regulator-allow-set-load;
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
+
+			regulator-system-load = <550000>;
+			regulator-allow-set-load;
+		};
+
+		pm8950_l9: l9 {
+			regulator-min-microvolt = <2000000>;
+			regulator-max-microvolt = <2400000>;
+		};
+
+		pm8950_l10: l10 {
+			regulator-min-microvolt = <2500000>;
+			regulator-max-microvolt = <2900000>;
+		};
+
+		pm8950_l11: l11 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+
+			regulator-system-load = <550000>;
+			regulator-allow-set-load;
+		};
+
+		pm8950_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+
+			regulator-system-load = <22000>;
+			regulator-allow-set-load;
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
+			regulator-min-microvolt = <2500000>;
+			regulator-max-microvolt = <2900000>;
+		};
+
+		pm8950_l19: l19 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1350000>;
+		};
+
+		pm8950_l22: l22 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-min-microamp = <100>;
+			regulator-max-microamp = <100000>;
+
+			regulator-system-load = <100000>;
+			regulator-allow-set-load;
+		};
+
+		pm8950_l23: l23 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-min-microamp = <100>;
+			regulator-max-microamp = <100000>;
+
+			regulator-system-load = <100000>;
+			regulator-allow-set-load;
+		};
+	};
+};
+
+&pm8950_gpios {
+	cdc_pm_mclk_pin: cdc_pm_mclk {
+		pins = "gpio1";
+		function = PMIC_GPIO_FUNC_FUNC1; /* SF1 */
+		output-low;
+		bias-disable;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_MED>;
+		power-source = <2>; /* VIN 2 */
+	};
+
+	wlan_sleep_pin: wl_sleep_clk {
+		pins = "gpio2";
+		function = PMIC_GPIO_FUNC_FUNC1; /* SF1 SLEEP_CLK2 */
+		output-high;
+		bias-disable;
+		drive-push-pull;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+		power-source = <0>; /* VPH_PWR */
+	};
+
+	wcd_eldo_pin: wcd_eldo_en {
+		pins = "gpio7";
+		function = "gpio";
+		output-low;
+		bias-disable;
+		power-source = <0>; /* VPH_PWR */
+	};
+};
+
+&pmi8950_gpio {
+	usb_switch_sel_gpio: usb_switch_sel {
+		pins = "gpio1";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		output-low;
+		drive-push-pull;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+		power-source = <0>;
+	};
+
+	vibrator_ldo_en: vib_ldo_en {
+		pins = "gpio2";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		output-low;
+		drive-push-pull;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+		power-source = <0>;
+	};
+};
-- 
2.21.0

