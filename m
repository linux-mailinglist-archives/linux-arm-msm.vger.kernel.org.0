Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8533549E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 03:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242796AbhDFBKC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 21:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232923AbhDFBJ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 21:09:59 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A50C061756;
        Mon,  5 Apr 2021 18:09:51 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id o16so14530066ljp.3;
        Mon, 05 Apr 2021 18:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xn8XKVdpWpQ25yEWP33RSR8t7m18E5rzmzqmVGQkizA=;
        b=IiHnv0WPVq6+GlKm0W/ZPSf/hvhkpBQRwKzsMDS+UNkCz5bEFYORrOt0YQ/dD4tK5I
         O0UAIYqbvVEKXxqLyXA7fFZrh5JS3RXwFTQyiCXFQ6WjlzpTWDLB0ftCGsPVNVVETdGz
         Xz50tUEfZpt7WM/YrOrOMClx0Dcs7wq8gRx6/zyHTL8s7e3Zr4k88huaJMxV46TYSlR5
         nFC1gfcygYHlv5JL5KUPHMsbSDqTFuvnj2tSq/L59okGn9xVFA8+liyHSOCaGVDFkFp3
         Dfkn5Mnr3NcB4DJWyxKiWz5MZCUQwUITQfO2WYE8Uhze5afFAhZetSDsShpUBAKbkT/Y
         kIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xn8XKVdpWpQ25yEWP33RSR8t7m18E5rzmzqmVGQkizA=;
        b=e3KpQM/7rn2mzMPr6M9qo4sXVVobSUlXJ92tL0dsH4V/iAYKqanaIkpLZgCmE+cs0t
         6yy/k4kfmrjsgCLkIbbq99/pq8Q5wVQDMwUtM5JxRH3WZn6BpKmaTH76IraM45YetJc/
         vfLEVAIDXppYTzhUIYditAsry8S+gmnlEEI0D/w8RYlbpvo6QAaLH379+B4Luc0ozeag
         jpGJnatcLDtoR3N6HwdUeaoLf3EqlzfmxOF8wkILBmXykcgCb1KCa0fwZRW4xLyeuxCH
         0bsEwgaZhZ1l8X9H2qmV1E6aGRtl0kpGq++lrTDh2Lqr8Gmr5YL2g4P7fQZDWNhY/hAI
         Nrzg==
X-Gm-Message-State: AOAM532sSwUWhXADZCmSdZndW32h4pqDUAA4fSz0sY+KEzyco4krPH3Y
        Dq/o/7UCO+kZMYsP3dfzWOu1KjoFVzI=
X-Google-Smtp-Source: ABdhPJwhdPQXJQeBckeh7qq8y2yhpUA3yiowJ1gLa2bnGOfWuuOx3p7f9XoT0pwIxcZq6JomRl2xPQ==
X-Received: by 2002:a2e:9bcd:: with SMTP id w13mr17209828ljj.43.1617671390241;
        Mon, 05 Apr 2021 18:09:50 -0700 (PDT)
Received: from Ryzen-Workstation.localdomain (df76-hyyyyyyyyyyyyyct-3.rev.dnainternet.fi. [2001:14ba:26f5:f300::5])
        by smtp.googlemail.com with ESMTPSA id p24sm1948063lfj.76.2021.04.05.18.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 18:09:49 -0700 (PDT)
From:   Jami Kettunen <jamipkettunen@gmail.com>
To:     phone-devel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        keescook@chromium.org, anton@enomsg.org, ccross@android.com,
        tony.luck@intel.com, ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Jami Kettunen <jamipkettunen@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: Add support for OnePlus 5/5T
Date:   Tue,  6 Apr 2021 04:07:07 +0300
Message-Id: <20210406010708.2376807-2-jamipkettunen@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406010708.2376807-1-jamipkettunen@gmail.com>
References: <20210406010708.2376807-1-jamipkettunen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device trees for OnePlus 5 (cheeseburger) and 5T (dumpling)
MSM8998 SoC smartphones with initial support included for:

- UFS internal storage
- USB peripheral mode
- Display
- Touch
- Bluetooth
- Hall effect sensor
- Power and volume buttons
- Capacitive keypad button backlight (on cheeseburger)

Signed-off-by: Jami Kettunen <jamipkettunen@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../dts/qcom/msm8998-oneplus-cheeseburger.dts |  42 ++
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi | 514 ++++++++++++++++++
 .../dts/qcom/msm8998-oneplus-dumpling.dts     |  25 +
 4 files changed, 583 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 549a7a2151d4..1beb73f564f7 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -27,6 +27,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-asus-novago-tp370ql.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-oneplus-cheeseburger.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-oneplus-dumpling.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts b/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
new file mode 100644
index 000000000000..66b9297588ab
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * OnePlus 5 (cheeseburger) device tree
+ *
+ * Copyright (c) 2021, Jami Kettunen <jamipkettunen@gmail.com>
+ */
+
+#include <dt-bindings/leds/common.h>
+#include "msm8998-oneplus-common.dtsi"
+
+/ {
+	model = "OnePlus 5";
+	compatible = "oneplus,cheeseburger", "qcom,msm8998";
+	/* Required for bootloader to select correct board */
+	qcom,board-id = <8 0 16859 23>;
+
+	/* Capacitive keypad button backlight */
+	leds {
+		compatible = "gpio-leds";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&button_backlight_default>;
+
+		button-backlight {
+			gpios = <&pmi8998_gpio 5 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+			default-state = "off";
+		};
+	};
+};
+
+&pmi8998_gpio {
+	button_backlight_default: button-backlight-default {
+		pinconf {
+			pins = "gpio5";
+			function = "normal";
+			bias-pull-down;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
new file mode 100644
index 000000000000..0f5c7828a901
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
@@ -0,0 +1,514 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * OnePlus 5(T) (cheeseburger / dumpling) common device tree source based on msm8998-mtp.dtsi
+ *
+ * Copyright (c) 2021, Jami Kettunen <jamipkettunen@gmail.com>
+ * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include "msm8998.dtsi"
+#include "pm8998.dtsi"
+#include "pmi8998.dtsi"
+#include "pm8005.dtsi"
+
+/ {
+	/* Required for bootloader to select correct board */
+	qcom,msm-id = <292 0x20001>; /* 8998 v2.1 */
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* Use display framebuffer setup by the UEFI XBL bootloader for simplefb */
+		framebuffer0: framebuffer@9d400000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0x9d400000 0x0 0x2400000>;
+			width = <1080>;
+			height = <1920>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	reserved-memory {
+		/* Bootloader display framebuffer region */
+		cont_splash_mem: memory@9d400000 {
+			reg = <0x0 0x9d400000 0x0 0x2400000>;
+			no-map;
+		};
+
+		/* For getting crash logs using Android downstream kernels */
+		ramoops@ac000000 {
+			compatible = "ramoops";
+			reg = <0x0 0xac000000 0x0 0x200000>;
+			console-size = <0x80000>;
+			pmsg-size = <0x40000>;
+			record-size = <0x8000>;
+			ftrace-size = <0x20000>;
+		};
+
+		/*
+		 * The following memory regions on downstream are "dynamically allocated"
+		 * but given the same addresses every time. Hard code them as these addresses
+		 * are where the OnePlus signed firmware expects them to be.
+		 */
+		ipa_fws_region: ipa@f6800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0xf6800000 0x0 0x5000>;
+			no-map;
+		};
+		zap_shader_region: gpu@f6900000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0xf6900000 0x0 0x2000>;
+			no-map;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		label = "Volume buttons";
+		autorepeat;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&vol_keys_default>;
+
+		vol-down {
+			label = "Volume down";
+			gpios = <&pm8998_gpio 5 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <15>;
+			wakeup-source;
+		};
+
+		vol-up {
+			label = "Volume up";
+			gpios = <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+			wakeup-source;
+		};
+	};
+
+	gpio-hall-sensor {
+		compatible = "gpio-keys";
+		label = "Hall effect sensor";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&hall_sensor_default>;
+
+		hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&tlmm 124 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+/*
+ * OnePlus' ADSP firmware requires 30 MiB in total, so increase the adsp_mem
+ * region by 4 MiB to account for this while relocating the other now
+ * conflicting memory nodes accordingly.
+ */
+&adsp_mem {
+	reg = <0x0 0x8b200000 0x0 0x1e00000>;
+};
+&mpss_mem {
+	reg = <0x0 0x8d000000 0x0 0x7000000>;
+};
+&venus_mem {
+	reg = <0x0 0x94000000 0x0 0x500000>;
+};
+&mba_mem {
+	reg = <0x0 0x94500000 0x0 0x200000>;
+};
+&slpi_mem {
+	reg = <0x0 0x94700000 0x0 0xf00000>;
+};
+&ipa_fw_mem {
+	reg = <0x0 0x95600000 0x0 0x10000>;
+};
+&ipa_gsi_mem {
+	reg = <0x0 0x95610000 0x0 0x5000>;
+};
+&gpu_mem {
+	reg = <0x0 0x95615000 0x0 0x100000>;
+};
+&wlan_msa_mem {
+	reg = <0x0 0x95715000 0x0 0x100000>;
+};
+
+&blsp1_i2c5 {
+	status = "okay";
+
+	touchscreen@20 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <125 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_active &ts_reset_active>;
+
+		vdd-supply = <&vreg_l28_3p0>;
+		vio-supply = <&vreg_l6a_1p8>;
+
+		syna,reset-delay-ms = <20>;
+		syna,startup-delay-ms = <20>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4_f12: rmi4-f12@12 {
+			reg = <0x12>;
+			syna,rezero-wait-ms = <20>;
+			syna,sensor-type = <1>;
+			touchscreen-x-mm = <68>;
+			touchscreen-y-mm = <122>;
+		};
+	};
+};
+
+&blsp1_uart3 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p3>;
+		max-speed = <3200000>;
+	};
+};
+
+&blsp1_uart3_on {
+	rx {
+		/delete-property/ bias-disable;
+		/*
+		 * Configure a pull-up on 46 (RX). This is needed to
+		 * avoid garbage data when the TX pin of the Bluetooth
+		 * module is in tri-state (module powered off or not
+		 * driving the signal yet).
+		 */
+		bias-pull-up;
+	};
+
+	cts {
+		/delete-property/ bias-disable;
+		/*
+		 * Configure a pull-down on 47 (CTS) to match the pull
+		 * of the Bluetooth module.
+		 */
+		bias-pull-down;
+	};
+};
+
+&blsp2_uart1 {
+	status = "okay";
+};
+
+&pm8005_lsid1 {
+	pm8005-regulators {
+		compatible = "qcom,pm8005-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+
+		pm8005_s1: s1 { /* VDD_GFX supply */
+			regulator-min-microvolt = <524000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-enable-ramp-delay = <500>;
+
+			/* hack until we rig up the gpu consumer */
+			regulator-always-on;
+		};
+	};
+};
+
+&pm8998_gpio {
+	vol_keys_default: vol-keys-default {
+		pinconf {
+			pins = "gpio5", "gpio6";
+			function = "normal";
+			bias-pull-up;
+			input-enable;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+		};
+	};
+};
+
+&qusb2phy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l12a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
+};
+
+&rpm_requests {
+	pm8998-regulators {
+		compatible = "qcom,rpm-pm8998-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_s5-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+		vdd_s7-supply = <&vph_pwr>;
+		vdd_s8-supply = <&vph_pwr>;
+		vdd_s9-supply = <&vph_pwr>;
+		vdd_s10-supply = <&vph_pwr>;
+		vdd_s11-supply = <&vph_pwr>;
+		vdd_s12-supply = <&vph_pwr>;
+		vdd_s13-supply = <&vph_pwr>;
+		vdd_l1_l27-supply = <&vreg_s7a_1p025>;
+		vdd_l2_l8_l17-supply = <&vreg_s3a_1p35>;
+		vdd_l3_l11-supply = <&vreg_s7a_1p025>;
+		vdd_l4_l5-supply = <&vreg_s7a_1p025>;
+		vdd_l6-supply = <&vreg_s5a_2p04>;
+		vdd_l7_l12_l14_l15-supply = <&vreg_s5a_2p04>;
+		vdd_l9-supply = <&vreg_bob>;
+		vdd_l10_l23_l25-supply = <&vreg_bob>;
+		vdd_l13_l19_l21-supply = <&vreg_bob>;
+		vdd_l16_l28-supply = <&vreg_bob>;
+		vdd_l18_l22-supply = <&vreg_bob>;
+		vdd_l20_l24-supply = <&vreg_bob>;
+		vdd_l26-supply = <&vreg_s3a_1p35>;
+		vdd_lvs1_lvs2-supply = <&vreg_s4a_1p8>;
+
+		vreg_s3a_1p35: s3 {
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+		};
+		vreg_s4a_1p8: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-allow-set-load;
+		};
+		vreg_s5a_2p04: s5 {
+			regulator-min-microvolt = <1904000>;
+			regulator-max-microvolt = <2040000>;
+		};
+		vreg_s7a_1p025: s7 {
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1028000>;
+		};
+		vreg_l1a_0p875: l1 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+		};
+		vreg_l2a_1p2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+		vreg_l3a_1p0: l3 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+		vreg_l5a_0p8: l5 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+		};
+		vreg_l6a_1p8: l6 {
+			regulator-min-microvolt = <1808000>;
+			regulator-max-microvolt = <1808000>;
+		};
+		vreg_l7a_1p8: l7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		vreg_l8a_1p2: l8 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+		vreg_l9a_1p8: l9 {
+			regulator-min-microvolt = <1808000>;
+			regulator-max-microvolt = <2960000>;
+		};
+		vreg_l10a_1p8: l10 {
+			regulator-min-microvolt = <1808000>;
+			regulator-max-microvolt = <2960000>;
+		};
+		vreg_l11a_1p0: l11 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+		vreg_l12a_1p8: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		vreg_l13a_2p95: l13 {
+			regulator-min-microvolt = <1808000>;
+			regulator-max-microvolt = <2960000>;
+		};
+		vreg_l14a_1p88: l14 {
+			regulator-min-microvolt = <1880000>;
+			regulator-max-microvolt = <1880000>;
+		};
+		vreg_l15a_1p8: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		vreg_l16a_2p7: l16 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2704000>;
+		};
+		vreg_l17a_1p3: l17 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+		};
+		vreg_l18a_2p7: l18 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2704000>;
+		};
+		vreg_l19a_3p0: l19 {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+		};
+		vreg_l20a_2p95: l20 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-allow-set-load;
+		};
+		vreg_l21a_2p95: l21 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-allow-set-load;
+			regulator-system-load = <800000>;
+		};
+		vreg_l22a_2p85: l22 {
+			regulator-min-microvolt = <2864000>;
+			regulator-max-microvolt = <2864000>;
+		};
+		vreg_l23a_3p3: l23 {
+			regulator-min-microvolt = <3312000>;
+			regulator-max-microvolt = <3312000>;
+		};
+		vreg_l24a_3p075: l24 {
+			regulator-min-microvolt = <3088000>;
+			regulator-max-microvolt = <3088000>;
+		};
+		vreg_l25a_3p3: l25 {
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3312000>;
+		};
+		vreg_l26a_1p2: l26 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-allow-set-load;
+		};
+		vreg_l28_3p0: l28 {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+		};
+		vreg_lvs1a_1p8: lvs1 { };
+		vreg_lvs2a_1p8: lvs2 { };
+	};
+
+	pmi8998-regulators {
+		compatible = "qcom,rpm-pmi8998-regulators";
+
+		vdd_bob-supply = <&vph_pwr>;
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3312000>;
+			regulator-max-microvolt = <3600000>;
+		};
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <81 4>;
+
+	hall_sensor_default: hall-sensor-default {
+		pins = "gpio124";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		input-enable;
+	};
+
+	ts_int_active: ts-int-active {
+		pins = "gpio125";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	ts_reset_active: ts-reset-active {
+		pins = "gpio89";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+};
+
+&ufshc {
+	status = "okay";
+
+	vcc-supply = <&vreg_l20a_2p95>;
+	vccq-supply = <&vreg_l26a_1p2>;
+	vccq2-supply = <&vreg_s4a_1p8>;
+	vcc-max-microamp = <750000>;
+	vccq-max-microamp = <560000>;
+	vccq2-max-microamp = <750000>;
+};
+
+&ufsphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l2a_1p2>;
+	vddp-ref-clk-supply = <&vreg_l26a_1p2>;
+	vdda-phy-max-microamp = <51400>;
+	vdda-pll-max-microamp = <14600>;
+	vddp-ref-clk-max-microamp = <100>;
+	vddp-ref-clk-always-on;
+};
+
+&usb3 {
+	status = "okay";
+
+	/* Disable USB3 clock requirement as the device only supports USB2 */
+	qcom,select-utmi-as-pipe-clk;
+};
+
+&usb3_dwc3 {
+	/* Drop the unused USB 3 PHY */
+	phys = <&qusb2phy>;
+	phy-names = "usb2-phy";
+
+	/* Fastest mode for USB 2 */
+	maximum-speed = "high-speed";
+
+	/* Force to peripheral until we can switch modes */
+	dr_mode = "peripheral";
+};
+
+&wifi {
+	/* Leave disabled until MSS is functional */
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dts b/arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dts
new file mode 100644
index 000000000000..544b9b0ae44b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * OnePlus 5T (dumpling) device tree
+ *
+ * Copyright (c) 2021, Jami Kettunen <jamipkettunen@gmail.com>
+ */
+
+#include "msm8998-oneplus-common.dtsi"
+
+/ {
+	model = "OnePlus 5T";
+	compatible = "oneplus,dumpling", "qcom,msm8998";
+	/* Required for bootloader to select correct board */
+	qcom,board-id = <8 0 17801 43>;
+};
+
+/* Update the screen height values from 1920 to 2160 on the 5T */
+&framebuffer0 {
+	height = <2160>;
+};
+
+/* Adjust digitizer area height to match the 5T's taller panel */
+&rmi4_f12 {
+	touchscreen-y-mm = <137>;
+};
-- 
2.31.1

