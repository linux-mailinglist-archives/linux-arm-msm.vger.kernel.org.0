Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A06A23442D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 12:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732580AbgGaKkw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 06:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732503AbgGaKkv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 06:40:51 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642C2C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2020 03:40:51 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id o1so17035623plk.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2020 03:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Q/BYkHhkI0myoPFmGmvb8OjoGkTwZH6gWekV7iPJq9I=;
        b=X9hz1SHL6jJBOzumqUf+dz1RwuDVp4r0V8fsOioSNuf6y0TaHmNuo4QKnwKvBRkj3p
         bD2f9SEbo8pjRlkGPv3dMafYK4MmQa3/9lW6zw23+2pQzpROBwoAj/TeQdi4xNAacNqW
         EPVK00VxHVU/yBnFJmwIUq1DqjPN1ICFXz1o/mzNCZsCRSRog0v8ntKMbxqmp/NX+B9e
         b0UfIbVYbkCrNThvTBHHMcSUgkQOEII2wi98NuchJ1uAupUZY5agVX/AtQhBEBj36epR
         6OMcWh2SfC2qbkXcuw/t31M8P4cGyvkli420P9apFrABR2lJkiq1LVZ0CxfRsT1Csd2C
         sYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Q/BYkHhkI0myoPFmGmvb8OjoGkTwZH6gWekV7iPJq9I=;
        b=G/UFBLD6N3bGlri6DMcDy398R1aRLOkVlaH7JwldduFnugx9THN/451XoHgL0FtRXe
         /7vhCOMV9flDKCnNOt4lHotDjTEHsNNd3RE0djnWutUax64ckBmq4rOqlv4+7r3MR5cZ
         5zNrfjlaHZCmHhzt0GtfxMcF95q28XARiUwQ9XrFTEqMoPcgRNwwiRtEc8ALvnp1I1d1
         QnMYrQpV6zEIdinScv8Hpe2jsgwv71hcR9+PtRjZTinaGevHBuc0cRikr3l0fvCFdDYi
         zJZ09DSbYgbCI0Bm2YvvUwF5txRFHvE1Ud8BKutuY2TVfASjcwEbWjm2K9dtT1l41Ghj
         yu1g==
X-Gm-Message-State: AOAM532ZwKEXslFCdH04k9RI+41XWczcW//UqRzE/Qt6jv32QB3WdOZo
        isL6i9GAQwHJeHihLoAC8xAqkg==
X-Google-Smtp-Source: ABdhPJz1haCWZ+VL/uD4a3kFU6XXL4+YY4lot++ca3qlus8XckNt4xjt8eIuOp2o/zm2X9zwyevoqA==
X-Received: by 2002:a63:1a0c:: with SMTP id a12mr3102313pga.24.1596192050716;
        Fri, 31 Jul 2020 03:40:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6803:60a7:796a:53a4:d98b:a871])
        by smtp.gmail.com with ESMTPSA id t10sm7428576pga.73.2020.07.31.03.40.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2020 03:40:50 -0700 (PDT)
From:   Amit Pundir <amit.pundir@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)
Date:   Fri, 31 Jul 2020 16:10:44 +0530
Message-Id: <1596192044-18725-1-git-send-email-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add initial dts support for Xiaomi Poco F1 (Beryllium).

This initial support is based on upstream Dragonboard 845c
(sdm845) device. With this dts, Beryllium boots AOSP up to
ADB shell over USB-C.

Supported functionality includes UFS, USB-C (peripheral),
microSD card and Vol+/Vol-/power keys. Bluetooth should work
too but couldn't be verified from adb command line, it is
verified when enabled from UI with few WIP display patches.

Just like initial db845c support, initializing the SMMU is
clearing the mapping used for the splash screen framebuffer,
which causes the device to hang during boot and recovery
needs a hard power reset. This can be worked around using:

    fastboot oem select-display-panel none

To switch ON the display back run:

    fastboot oem select-display-panel

But this only works on Beryllium devices running bootloader
version BOOT.XF.2.0-00369-SDM845LZB-1 that shipped with
Android-9 based release. Newer bootloader version do not
support switching OFF the display panel at all. So we need
a few additional smmu patches (under review) from here to
boot to shell:
https://github.com/pundiramit/linux/commits/beryllium-mainline

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
v2: Updated machine compatible string for seemingly inevitable
    future quirks.

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/sdm845-beryllium.dts | 321 ++++++++++++++++++++++++++
 2 files changed, 322 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-beryllium.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0f2c33d611df..3ef1b48bc0cb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -21,6 +21,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-beryllium.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-beryllium.dts
new file mode 100644
index 000000000000..714c5157d9f8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-beryllium.dts
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sdm845.dtsi"
+#include "pm8998.dtsi"
+#include "pmi8998.dtsi"
+
+/ {
+	model = "Xiaomi Technologies Inc. Beryllium";
+	compatible = "xiaomi,beryllium", "qcom,sdm845";
+
+	/* required for bootloader to select correct board */
+	qcom,board-id = <69 0>;
+	qcom,msm-id = <321 0x20001>;
+
+	aliases {
+		hsuart0 = &uart6;
+	};
+
+	dc12v: dc12v-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "DC12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&vol_up_pin_a>;
+
+		vol-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	vbat: vbat-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VBAT";
+
+		vin-supply = <&dc12v>;
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+		regulator-always-on;
+	};
+
+	vbat_som: vbat-som-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VBAT_SOM";
+
+		vin-supply = <&dc12v>;
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+		regulator-always-on;
+	};
+
+	vdc_3v3: vdc-3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VDC_3V3";
+		vin-supply = <&dc12v>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	vdc_5v: vdc-5v-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VDC_5V";
+
+		vin-supply = <&dc12v>;
+		regulator-min-microvolt = <500000>;
+		regulator-max-microvolt = <500000>;
+		regulator-always-on;
+	};
+
+	vreg_s4a_1p8: vreg-s4a-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s4a_1p8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+};
+
+&apps_rsc {
+	pm8998-rpmh-regulators {
+		compatible = "qcom,pm8998-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_l1a_0p875: ldo1 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p8: ldo7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a_2p95: ldo13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a_1p3: ldo17 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20a_2p95: ldo20 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2968000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21a_2p95: ldo21 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2968000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l24a_3p075: ldo24 {
+			regulator-min-microvolt = <3088000>;
+			regulator-max-microvolt = <3088000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l25a_3p3: ldo25 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l26a_1p2: ldo26 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&gcc {
+	protected-clocks = <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
+};
+
+&pm8998_gpio {
+	vol_up_pin_a: vol-up-active {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+	};
+};
+
+&pm8998_pon {
+	resin {
+		compatible = "qcom,pm8941-resin";
+		interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+		debounce = <15625>;
+		bias-pull-up;
+		linux,code = <KEY_VOLUMEDOWN>;
+	};
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
+
+	vmmc-supply = <&vreg_l21a_2p95>;
+	vqmmc-supply = <&vreg_l13a_2p95>;
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 126 GPIO_ACTIVE_HIGH>;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <81 4>;
+
+	sdc2_default_state: sdc2-default {
+		clk {
+			pins = "sdc2_clk";
+			bias-disable;
+
+			/*
+			 * It seems that mmc_test reports errors if drive
+			 * strength is not 16 on clk, cmd, and data pins.
+			 */
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
+	sdc2_card_det_n: sd-card-det-n {
+		pins = "gpio126";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
+&uart6 {
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
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+
+	vdd-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l12a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
+
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
+	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l26a_1p2>;
+	vdda-pll-supply = <&vreg_l1a_0p875>;
+};
+
+&ufs_mem_hc {
+	status = "okay";
+
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l20a_2p95>;
+	vcc-max-microamp = <800000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+};
+
+/* PINCTRL - additions to nodes defined in sdm845.dtsi */
+
+&qup_uart6_default {
+	pinmux {
+		pins = "gpio45", "gpio46", "gpio47", "gpio48";
+		function = "qup6";
+	};
+
+	cts {
+		pins = "gpio45";
+		bias-disable;
+	};
+
+	rts-tx {
+		pins = "gpio46", "gpio47";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rx {
+		pins = "gpio48";
+		bias-pull-up;
+	};
+};
-- 
2.7.4

