Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D58DDDF0E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2019 17:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfJTPII (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Oct 2019 11:08:08 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35800 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbfJTPIH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Oct 2019 11:08:07 -0400
Received: by mail-wm1-f66.google.com with SMTP id 14so3634882wmu.0;
        Sun, 20 Oct 2019 08:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rnoyitpcvLTNXyIGCd/Jn4EKha1n02rB+b7MEByqOMA=;
        b=NMMIxnJfqtmoLhJgGXjS0cwSE5cU2ZvDAIRljR5aJD09+thwesU9C05HOTtY+oDMm6
         cWheCoO/XBsEzMFfD4yw+PhCHFRi62ayRVv0E44ctdciZKdmEOFrv2DPpTUarcfxiHCe
         Wi6/UJ+msMeSyH07fIg/cKdFqKjyQ0fNnqtpbLgObrEa2TSvGHRJkRtSLNztcLm/p35z
         Eq+aDoV+M6Dl/BmhWlYx7x4ieoCKudxz+Z571kkPFAMeozL0Ebppl5GYSZXz9vMxvOid
         rgywdC2v/lGFz3bg8ibktPDh10EUbKTObjaHnP67c6+h2J4K1g/9hifMtj2b6of5n9rR
         6rBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rnoyitpcvLTNXyIGCd/Jn4EKha1n02rB+b7MEByqOMA=;
        b=AXFrVSOAjT5As6/QsOzxhiHudpNQGOJ4OT0x8JiOfYdoeEUkWnRbQBJpQ3t8Ghx0bt
         01ezYl/kSZXfeEt29itfneRBP1TrX90fC159Uml21T8DCeuwvkdjvH530fbEb1bQFD7G
         kgibu/VTFQfbIUM7wnf+xjaJ1oN7uh3BC8GIm4cGe8Vw0Z4Bc88Jd4Nw2sfb/72KDe/A
         YMzC//Akr8BEcswm7M8PrN1DvyFKlrWD54YJUfVS/ds13EGu684/QPJnn/gwSZmTqEgI
         cCttq5M86B/8nC964gfvvAkzO48OhfK+3I0vVmnnYEC6+m8QcMqHaTtLuAwzC5S7SiBq
         O6bA==
X-Gm-Message-State: APjAAAXgmW5eFle3G1kwxRgjL1ekgoQSOCaEXls8P1qwxdBuyFCvsd4N
        l3HOggrSigwng1brloNI+50uG7t4gvlmZA==
X-Google-Smtp-Source: APXvYqwMMkgcYFtIqNfD+RxXw8v/snUOjwR6B9tA+of0qhVSu1cood1fZbzSa/IVLfn6eTbd4xVFvA==
X-Received: by 2002:a1c:6a04:: with SMTP id f4mr6468203wmc.60.1571584083236;
        Sun, 20 Oct 2019 08:08:03 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id z9sm11921172wrv.1.2019.10.20.08.08.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Oct 2019 08:08:02 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, ccross@android.com,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, marijns95@gmail.com, kholk11@gmail.com
Subject: [PATCH 5/5] arm64: dts: qcom: Add Sony Xperia (Loire) X and X Compact support
Date:   Sun, 20 Oct 2019 17:07:46 +0200
Message-Id: <20191020150746.64114-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191020150746.64114-1-kholk11@gmail.com>
References: <20191020150746.64114-1-kholk11@gmail.com>
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
 .../qcom/msm8956-sony-xperia-loire-kugo.dts   |  74 ++
 .../qcom/msm8956-sony-xperia-loire-suzu.dts   |  21 +
 .../dts/qcom/msm8956-sony-xperia-loire.dtsi   | 663 ++++++++++++++++++
 4 files changed, 760 insertions(+)
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
index 000000000000..1c02fb13d8cc
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dts
@@ -0,0 +1,74 @@
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
+	status = "okay";
+};
+
+&blsp_i2c8 {
+	status = "okay";
+};
+
+&pm8950_l1 {
+	regulator-min-microvolt = <1100000>;
+	regulator-max-microvolt = <1300000>;
+	qcom,init-voltage = <1200000>;
+};
+
+/* Machine specific pins override */
+&tlmm {
+	usb_cable_det_n_gpio: usb_cable_det_n {
+		mux {
+			pins = "gpio107";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio107";
+			drive-strength = <2>;
+			bias-pull-up;
+			input-enable;
+		};
+	};
+
+	usb_cable_sense_en_gpio: usb_cable_sense_en {
+		mux {
+			pins = "gpio116";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio116";
+			drive-strength = <2>;
+			bias-disable;
+			output-low;
+		};
+	};
+
+	usb_cc_int_n_gpio: usb_cc_int_n {
+		mux {
+			pins = "gpio131";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio131";
+			drive-strength = <2>;
+			bias-pull-up;
+			input-enable;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dts b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dts
new file mode 100644
index 000000000000..dd11a6a0a189
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dts
@@ -0,0 +1,21 @@
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
+
+&blsp_i2c8 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
new file mode 100644
index 000000000000..8ebe82120197
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
@@ -0,0 +1,663 @@
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
+};
+
+&soc {
+	blsp2_uart2: serial@7af0000 {
+		compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+		reg = <0x7af0000 0x200>;
+		interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>,
+			 <&gcc GCC_BLSP2_AHB_CLK>;
+		clock-names = "core", "iface";
+		dmas = <&blsp2_dma 1>, <&blsp2_dma 0>;
+		dma-names = "rx", "tx";
+		status = "okay";
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
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+
+		button@1 {
+			label = "Volume Down";
+			gpios = <&tlmm 113 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+
+		button@2 {
+			label = "Camera Focus";
+			gpios = <&tlmm 114 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_CAMERA_FOCUS>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+
+		button@3 {
+			label = "Camera Snapshot";
+			gpios = <&tlmm 115 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
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
+/* eMMC */
+&sdhc_1 {
+	vmmc-supply = <&pm8950_l8>;
+	vqmmc-supply = <&pm8950_l5>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &tray_det_n_gpio>;
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdc3_clk_on &sdc3_cmd_on &sdc3_dat_on &wlan_sleep_pin
+		     &wl_host_wake_n_gpio>;
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
+&tlmm {
+	gpio-reserved-ranges = <0 4>;
+
+	blsp2_uart2_active: blsp2_uart2_active {
+		mux {
+			pins = "gpio20", "gpio21";
+			function = "blsp_uart6";
+		};
+		config {
+			pins = "gpio20", "gpio21";
+			drive-strength = <4>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart2_sleep: blsp2_uart2_sleep {
+		mux {
+			pins = "gpio20", "gpio21";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio20", "gpio21";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	disp_reset_n_gpio: disp_reset_n_gpio {
+		mux {
+			pins = "gpio25";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio25";
+			drive-strength = <2>;
+			output-high;
+		};
+	};
+
+	wl_host_wake_n_gpio: wl_host_wake_n_gpio {
+		mux {
+			pins = "gpio45";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio45";
+			drive-strength = <2>;
+			bias-pull-down;
+			input-enable;
+		};
+	};
+
+	wl_vreg_on_gpio: wl_vreg_on_gpio {
+		mux {
+			pins = "gpio48";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio48";
+			drive-strength = <2>;
+			bias-disable;
+			output-high;
+		};
+	};
+
+	tp_reset_n_gpio: tp_reset_n_gpio {
+		mux {
+			pins = "gpio64";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio64";
+			drive-strength = <2>;
+		};
+	};
+
+	tp_int_n_gpio: tp_int_n_gpio {
+		mux {
+			pins = "gpio65";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio65";
+			drive-strength = <2>;
+			bias-pull-up;
+			input-enable;
+		};
+	};
+
+	tray_det_n_gpio: tray_det_n_gpio {
+		mux {
+			pins = "gpio100";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio100";
+			drive-strength = <2>;
+			bias-disable;
+			input-enable;
+		};
+	};
+
+	tp_vddio_en_gpio: tp_vddio_en_gpio {
+		mux {
+			pins = "gpio126";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio126";
+			drive-strength = <2>;
+			bias-disable;
+			output-low;
+		};
+	};
+};
+
+&sdc3_clk_on {
+	config {
+		drive-strength = <10>;
+	};
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
+&smd_rpm_regulators {
+	vdd_s1-supply = <&vph_pwr>;
+	vdd_s2-supply = <&vph_pwr>;
+	vdd_s3-supply = <&vph_pwr>;
+	vdd_s4-supply = <&vph_pwr>;
+	vdd_s5-supply = <&vph_pwr>;
+	vdd_s6-supply = <&vph_pwr>;
+	vdd_l1_l19-supply = <&pm8950_s3>;
+	vdd_l2_l23-supply = <&pm8950_s3>;
+	vdd_l3-supply = <&pm8950_s3>;
+	vdd_l4_l5_l6_l7_l16-supply = <&pm8950_s4>;
+	vdd_l8_l11_l12_l17_l22-supply = <&vph_pwr>;
+	vdd_l20-supply = <&pm8950_s4>;
+	vdd_l21-supply = <&pm8950_s4>;
+
+	s1 {
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1162500>;
+		qcom,init-voltage = <1000000>;
+		status = "okay";
+	};
+
+	s3 {
+		regulator-min-microvolt = <1325000>;
+		regulator-max-microvolt = <1325000>;
+		qcom,init-voltage = <1325000>;
+		regulator-always-on;
+		status = "okay";
+	};
+
+	s4 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		qcom,init-voltage = <1800000>;
+		regulator-always-on;
+		status = "okay";
+	};
+
+	l1 {
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <1100000>;
+		qcom,init-voltage = <1000000>;
+		status = "okay";
+	};
+
+	l2 {
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		qcom,init-voltage = <1200000>;
+		status = "okay";
+	};
+
+	l3 {
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1200000>;
+		qcom,init-voltage = <1000000>;
+		status = "okay";
+	};
+
+	l5 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		qcom,init-voltage = <1800000>;
+
+		regulator-system-load = <300000>;
+		regulator-allow-set-load;
+		status = "okay";
+	};
+
+	l6 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		qcom,init-voltage = <1800000>;
+		status = "okay";
+	};
+
+	l7 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		qcom,init-voltage = <1800000>;
+		status = "okay";
+	};
+
+	l8 {
+		regulator-min-microvolt = <2900000>;
+		regulator-max-microvolt = <2900000>;
+		qcom,init-voltage = <2900000>;
+
+		regulator-system-load = <550000>;
+		regulator-allow-set-load;
+		status = "okay";
+	};
+
+	l9 {
+		regulator-min-microvolt = <2000000>;
+		regulator-max-microvolt = <2400000>;
+		qcom,init-voltage = <2200000>;
+		status = "okay";
+	};
+
+	l10 {
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2900000>;
+		qcom,init-voltage = <2700000>;
+		status = "okay";
+	};
+
+	l11 {
+		regulator-min-microvolt = <2950000>;
+		regulator-max-microvolt = <2950000>;
+		qcom,init-voltage = <2950000>;
+
+		regulator-system-load = <550000>;
+		regulator-allow-set-load;
+		status = "okay";
+	};
+
+	l12 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2950000>;
+		qcom,init-voltage = <1800000>;
+
+		regulator-system-load = <22000>;
+		regulator-allow-set-load;
+		status = "okay";
+	};
+
+	l13 {
+		regulator-min-microvolt = <3075000>;
+		regulator-max-microvolt = <3075000>;
+		qcom,init-voltage = <3075000>;
+		status = "okay";
+	};
+
+	l14 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		qcom,init-voltage = <1800000>;
+		status = "okay";
+	};
+
+	l15 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		qcom,init-voltage = <1800000>;
+		status = "okay";
+	};
+
+	l16 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		qcom,init-voltage = <1800000>;
+		status = "okay";
+	};
+
+	l17 {
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2900000>;
+		qcom,init-voltage = <2700000>;
+		status = "okay";
+	};
+
+	l19 {
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1350000>;
+		qcom,init-voltage = <1200000>;
+		status = "okay";
+	};
+
+	l22 {
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+		qcom,init-voltage = <3000000>;
+		status = "okay";
+	};
+
+	l23 {
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		qcom,init-voltage = <1200000>;
+		status = "okay";
+	};
+};
+
+&pm8950_gpios {
+	cdc_pm_mclk_pin: cdc_pm_mclk {
+		cdc_pm {
+			pins = "gpio1";
+			function = "func1"; /* SF1 */
+			output-low;
+			bias-disable;
+			qcom,drive-strength = <2>;
+			power-source = <2>; /* VIN 2 */
+		};
+	};
+
+	wlan_sleep_pin: wl_sleep_clk {
+		wl_sleep {
+			pins = "gpio2";
+			function = "func1"; /* SF1 SLEEP_CLK2 */
+			output-high;
+			bias-disable;
+			drive-push-pull;
+			qcom,drive-strength = <1>;
+			power-source = <0>; /* VPH_PWR */
+		};
+	};
+
+	wcd_eldo_pin: wcd_eldo_en {
+		wcd_eldo {
+			pins = "gpio7";
+			function = "gpio";
+			output-low;
+			bias-disable;
+			power-source = <0>; /* VPH_PWR */
+		};
+	};
+};
+
+&pmi8950_gpio {
+	usb_switch_sel_gpio: usb_switch_sel {
+		usb_switch {
+			pins = "gpio1";
+			function = "normal";
+			output-low;
+			drive-push-pull;
+			qcom,drive-strength = <1>;
+			power-source = <0>;
+		};
+	};
+
+	vibrator_ldo_en: vib_ldo_en {
+		vibrator_ldo {
+			pins = "gpio2";
+			function = "normal";
+			output-low;
+			drive-push-pull;
+			qcom,drive-strength = <1>;
+			power-source = <0>;
+		};
+	};
+};
-- 
2.21.0

