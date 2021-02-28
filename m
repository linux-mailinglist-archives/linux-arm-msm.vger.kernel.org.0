Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE6E327251
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Feb 2021 14:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhB1NJ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Feb 2021 08:09:28 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:54915 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbhB1NJ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Feb 2021 08:09:28 -0500
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id AA0BF1F521;
        Sun, 28 Feb 2021 14:08:36 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] arm64: dts: qcom: msm8996: Sanitize pins
Date:   Sun, 28 Feb 2021 14:08:19 +0100
Message-Id: <20210228130831.203765-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to prepare for feature development, the DTs
have to be workable with.. To achieve that:

- Rename msmgpio to tlmm (consistency with newer DTs)
- Rid msm8996-pins.dtsi and add the contents to msm8996.dtsi
- Modernize the pin nodes, make them more concise
- Add generic pin configuration for some hardware
- Fix up some names in preparation for BLSP/UART name cleaning..

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi |  22 +-
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts |   8 +-
 arch/arm64/boot/dts/qcom/msm8996-pins.dtsi   | 653 -------------------
 arch/arm64/boot/dts/qcom/msm8996.dtsi        | 508 ++++++++++++++-
 4 files changed, 502 insertions(+), 689 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8996-pins.dtsi

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index defcbd15edf9..4ed61675fdd6 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -184,16 +184,16 @@ &blsp2_uart1 {
 	label = "LS-UART1";
 	status = "okay";
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&blsp2_uart1_2pins_default>;
-	pinctrl-1 = <&blsp2_uart1_2pins_sleep>;
+	pinctrl-0 = <&blsp2_uart2_2pins_default>;
+	pinctrl-1 = <&blsp2_uart2_2pins_sleep>;
 };
 
 &blsp2_uart2 {
 	label = "LS-UART0";
 	status = "disabled";
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&blsp2_uart2_4pins_default>;
-	pinctrl-1 = <&blsp2_uart2_4pins_sleep>;
+	pinctrl-0 = <&blsp2_uart3_4pins_default>;
+	pinctrl-1 = <&blsp2_uart3_4pins_sleep>;
 };
 
 &camss {
@@ -245,7 +245,7 @@ &mmcc {
 	vdd-gfx-supply = <&vdd_gfx>;
 };
 
-&msmgpio {
+&tlmm {
 	gpio-line-names =
 		"[SPI0_DOUT]", /* GPIO_0, BLSP1_SPI_MOSI, LSEC pin 14 */
 		"[SPI0_DIN]", /* GPIO_1, BLSP1_SPI_MISO, LSEC pin 10 */
@@ -505,20 +505,20 @@ config {
 
 &pcie0 {
 	status = "okay";
-	perst-gpio = <&msmgpio 35 GPIO_ACTIVE_LOW>;
+	perst-gpio = <&tlmm 35 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&vreg_l28a_0p925>;
 };
 
 &pcie1 {
 	status = "okay";
-	perst-gpio = <&msmgpio 130 GPIO_ACTIVE_LOW>;
+	perst-gpio = <&tlmm 130 GPIO_ACTIVE_LOW>;
 	vdda-supply = <&vreg_l28a_0p925>;
 };
 
 &pcie2 {
 	status = "okay";
-	perst-gpio = <&msmgpio 114 GPIO_ACTIVE_LOW>;
+	perst-gpio = <&tlmm 114 GPIO_ACTIVE_LOW>;
 	vdda-supply = <&vreg_l28a_0p925>;
 };
 
@@ -929,9 +929,9 @@ vreg_s1b_1p025: s1 {
 &sdhc2 {
 	/* External SD card */
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
-	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
-	cd-gpios = <&msmgpio 38 0x1>;
+	pinctrl-0 = <&sdc2_state_on &sdc2_cd_on>;
+	pinctrl-1 = <&sdc2_state_off &sdc2_cd_off>;
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&vreg_l21a_2p95>;
 	vqmmc-supply = <&vreg_l13a_2p95>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
index f6ddf17ada81..9b55eae39e3e 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
@@ -84,11 +84,11 @@ vph_pwr: vph-pwr-regulator {
 &blsp2_uart1 {
 	status = "okay";
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&blsp2_uart1_2pins_default>;
-	pinctrl-1 = <&blsp2_uart1_2pins_sleep>;
+	pinctrl-0 = <&blsp2_uart2_2pins_default>;
+	pinctrl-1 = <&blsp2_uart2_2pins_sleep>;
 };
 
-&msmgpio {
+&tlmm {
 	sdc2_pins_default: sdc2-pins-default {
 		clk {
 			pins = "sdc2_clk";
@@ -352,7 +352,7 @@ &sdhc2 {
 
 	bus-width = <4>;
 
-	cd-gpios = <&msmgpio 38 0x1>;
+	cd-gpios = <&tlmm 38 0x1>;
 
 	vmmc-supply = <&vreg_l21a_2p95>;
 	vqmmc-supply = <&vreg_l13a_2p95>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
deleted file mode 100644
index ac1ede579361..000000000000
--- a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
+++ /dev/null
@@ -1,653 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2013-2016, The Linux Foundation. All rights reserved.
- */
-
-&msmgpio {
-
-	wcd9xxx_intr {
-		wcd_intr_default: wcd_intr_default{
-			mux {
-				pins = "gpio54";
-				function = "gpio";
-			};
-
-			config {
-				pins = "gpio54";
-				drive-strength = <2>; /* 2 mA */
-				bias-pull-down; /* pull down */
-				input-enable;
-			};
-		};
-	};
-
-	cdc_reset_ctrl {
-		cdc_reset_sleep: cdc_reset_sleep {
-			mux {
-				pins = "gpio64";
-				function = "gpio";
-			};
-			config {
-				pins = "gpio64";
-				drive-strength = <16>;
-				bias-disable;
-				output-low;
-			};
-		};
-		cdc_reset_active:cdc_reset_active {
-			mux {
-				pins = "gpio64";
-				function = "gpio";
-			};
-			config {
-				pins = "gpio64";
-				drive-strength = <16>;
-				bias-pull-down;
-				output-high;
-			};
-		};
-	};
-
-	blsp1_spi0_default: blsp1_spi0_default {
-		pinmux {
-			function = "blsp_spi1";
-			pins = "gpio0", "gpio1", "gpio3";
-		};
-		pinmux_cs {
-			function = "gpio";
-			pins = "gpio2";
-		};
-		pinconf {
-			pins = "gpio0", "gpio1", "gpio3";
-			drive-strength = <12>;
-			bias-disable;
-		};
-		pinconf_cs {
-			pins = "gpio2";
-			drive-strength = <16>;
-			bias-disable;
-			output-high;
-		};
-	};
-
-	blsp1_spi0_sleep: blsp1_spi0_sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio0", "gpio1", "gpio2", "gpio3";
-		};
-		pinconf {
-			pins = "gpio0", "gpio1", "gpio2", "gpio3";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
-	};
-
-	blsp1_i2c2_default: blsp1_i2c2_default {
-		pinmux {
-			function = "blsp_i2c3";
-			pins = "gpio47", "gpio48";
-		};
-		pinconf {
-			pins = "gpio47", "gpio48";
-			drive-strength = <16>;
-			bias-disable = <0>;
-		};
-	};
-
-	blsp1_i2c2_sleep: blsp1_i2c2_sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio47", "gpio48";
-		};
-		pinconf {
-			pins = "gpio47", "gpio48";
-			drive-strength = <2>;
-			bias-disable = <0>;
-		};
-	};
-
-	blsp2_i2c0_default: blsp2_i2c0 {
-		pinmux {
-			function = "blsp_i2c7";
-			pins = "gpio55", "gpio56";
-		};
-		pinconf {
-			pins = "gpio55", "gpio56";
-			drive-strength = <16>;
-			bias-disable;
-		};
-	};
-
-	blsp2_i2c0_sleep: blsp2_i2c0_sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio55", "gpio56";
-		};
-		pinconf {
-			pins = "gpio55", "gpio56";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
-	blsp2_uart1_2pins_default: blsp2_uart1_2pins {
-		pinmux {
-			function = "blsp_uart8";
-			pins = "gpio4", "gpio5";
-		};
-		pinconf {
-			pins = "gpio4", "gpio5";
-			drive-strength = <16>;
-			bias-disable;
-		};
-	};
-
-	blsp2_uart1_2pins_sleep: blsp2_uart1_2pins_sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio4", "gpio5";
-		};
-		pinconf {
-			pins = "gpio4", "gpio5";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
-	blsp2_uart1_4pins_default: blsp2_uart1_4pins {
-		pinmux {
-			function = "blsp_uart8";
-			pins = "gpio4", "gpio5", "gpio6", "gpio7";
-		};
-
-		pinconf {
-			pins = "gpio4", "gpio5", "gpio6", "gpio7";
-			drive-strength = <16>;
-			bias-disable;
-		};
-	};
-
-	blsp2_uart1_4pins_sleep: blsp2_uart1_4pins_sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio4", "gpio5", "gpio6", "gpio7";
-		};
-
-		pinconf {
-			pins = "gpio4", "gpio5", "gpio6", "gpio7";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
-	blsp2_i2c1_default: blsp2_i2c1 {
-		pinmux {
-			function = "blsp_i2c8";
-			pins = "gpio6", "gpio7";
-		};
-		pinconf {
-			pins = "gpio6", "gpio7";
-			drive-strength = <16>;
-			bias-disable;
-		};
-	};
-
-	blsp2_i2c1_sleep: blsp2_i2c1_sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio6", "gpio7";
-		};
-		pinconf {
-			pins = "gpio6", "gpio7";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
-	blsp2_uart2_2pins_default: blsp2_uart2_2pins {
-		pinmux {
-			function = "blsp_uart9";
-			pins = "gpio49", "gpio50";
-		};
-		pinconf {
-			pins = "gpio49", "gpio50";
-			drive-strength = <16>;
-			bias-disable;
-		};
-	};
-
-	blsp2_uart2_2pins_sleep: blsp2_uart2_2pins_sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio49", "gpio50";
-		};
-		pinconf {
-			pins = "gpio49", "gpio50";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
-	blsp2_uart2_4pins_default: blsp2_uart2_4pins {
-		pinmux {
-			function = "blsp_uart9";
-			pins = "gpio49", "gpio50", "gpio51", "gpio52";
-		};
-
-		pinconf {
-			pins = "gpio49", "gpio50", "gpio51", "gpio52";
-			drive-strength = <16>;
-			bias-disable;
-		};
-	};
-
-	blsp2_uart2_4pins_sleep: blsp2_uart2_4pins_sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio49", "gpio50", "gpio51", "gpio52";
-		};
-
-		pinconf {
-			pins = "gpio49", "gpio50", "gpio51", "gpio52";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
-	blsp2_spi5_default: blsp2_spi5_default {
-		pinmux {
-			function = "blsp_spi12";
-			pins = "gpio85", "gpio86", "gpio88";
-		};
-		pinmux_cs {
-			function = "gpio";
-			pins = "gpio87";
-		};
-		pinconf {
-			pins = "gpio85", "gpio86", "gpio88";
-			drive-strength = <12>;
-			bias-disable;
-		};
-		pinconf_cs {
-			pins = "gpio87";
-			drive-strength = <16>;
-			bias-disable;
-			output-high;
-		};
-	};
-
-	blsp2_spi5_sleep: blsp2_spi5_sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio85", "gpio86", "gpio87", "gpio88";
-		};
-		pinconf {
-			pins = "gpio85", "gpio86", "gpio87", "gpio88";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
-	};
-
-	sdc2_clk_on: sdc2_clk_on {
-		config {
-			pins = "sdc2_clk";
-			bias-disable;		/* NO pull */
-			drive-strength = <16>;	/* 16 MA */
-		};
-	};
-
-	sdc2_clk_off: sdc2_clk_off {
-		config {
-			pins = "sdc2_clk";
-			bias-disable;		/* NO pull */
-			drive-strength = <2>;	/* 2 MA */
-		};
-	};
-
-	sdc2_cmd_on: sdc2_cmd_on {
-		config {
-			pins = "sdc2_cmd";
-			bias-pull-up;		/* pull up */
-			drive-strength = <10>;	/* 10 MA */
-		};
-	};
-
-	sdc2_cmd_off: sdc2_cmd_off {
-		config {
-			pins = "sdc2_cmd";
-			bias-pull-up;		/* pull up */
-			drive-strength = <2>;	/* 2 MA */
-		};
-	};
-
-	sdc2_data_on: sdc2_data_on {
-		config {
-			pins = "sdc2_data";
-			bias-pull-up;		/* pull up */
-			drive-strength = <10>;	/* 10 MA */
-		};
-	};
-
-	sdc2_data_off: sdc2_data_off {
-		config {
-			pins = "sdc2_data";
-			bias-pull-up;		/* pull up */
-			drive-strength = <2>;	/* 2 MA */
-		};
-	};
-
-	pcie0_clkreq_default: pcie0_clkreq_default {
-		mux {
-			pins = "gpio36";
-			function = "pci_e0";
-		};
-
-		config {
-			pins = "gpio36";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie0_perst_default: pcie0_perst_default {
-		mux {
-			pins = "gpio35";
-			function = "gpio";
-		};
-
-		config {
-			pins = "gpio35";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
-	};
-
-	pcie0_wake_default: pcie0_wake_default {
-		mux {
-			pins = "gpio37";
-			function = "gpio";
-		};
-
-		config {
-			pins = "gpio37";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie0_clkreq_sleep: pcie0_clkreq_sleep {
-		mux {
-			pins = "gpio36";
-			function = "gpio";
-		};
-
-		config {
-			pins = "gpio36";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
-	pcie0_wake_sleep: pcie0_wake_sleep {
-		mux {
-			pins = "gpio37";
-			function = "gpio";
-		};
-
-		config {
-			pins = "gpio37";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
-	pcie1_clkreq_default: pcie1_clkreq_default {
-		mux {
-			pins = "gpio131";
-			function = "pci_e1";
-		};
-
-		config {
-			pins = "gpio131";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie1_perst_default: pcie1_perst_default {
-		mux {
-			pins = "gpio130";
-			function = "gpio";
-		};
-
-		config {
-			pins = "gpio130";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
-	};
-
-	pcie1_wake_default: pcie1_wake_default {
-		mux {
-			pins = "gpio132";
-			function = "gpio";
-		};
-
-		config {
-			pins = "gpio132";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
-	};
-
-	pcie1_clkreq_sleep: pcie1_clkreq_sleep {
-		mux {
-			pins = "gpio131";
-			function = "gpio";
-		};
-
-		config {
-			pins = "gpio131";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
-	pcie1_wake_sleep: pcie1_wake_sleep {
-		mux {
-			pins = "gpio132";
-			function = "gpio";
-		};
-
-		config {
-			pins = "gpio132";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
-	pcie2_clkreq_default: pcie2_clkreq_default {
-		mux {
-			pins = "gpio115";
-			function = "pci_e2";
-		};
-
-		config {
-			pins = "gpio115";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie2_perst_default: pcie2_perst_default {
-		mux {
-			pins = "gpio114";
-			function = "gpio";
-		};
-
-		config {
-			pins = "gpio114";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
-	};
-
-	pcie2_wake_default: pcie2_wake_default {
-		mux {
-			pins = "gpio116";
-			function = "gpio";
-		};
-
-		config {
-			pins = "gpio116";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
-	};
-
-	pcie2_clkreq_sleep: pcie2_clkreq_sleep {
-		mux {
-			pins = "gpio115";
-			function = "gpio";
-		};
-
-		config {
-			pins = "gpio115";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
-	pcie2_wake_sleep: pcie2_wake_sleep {
-		mux {
-			pins = "gpio116";
-			function = "gpio";
-		};
-
-		config {
-			pins = "gpio116";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
-	cci0_default: cci0_default {
-		pinmux {
-			function = "cci_i2c";
-			pins = "gpio17", "gpio18";
-		};
-		pinconf {
-			pins = "gpio17", "gpio18";
-			drive-strength = <16>;
-			bias-disable;
-		};
-	};
-
-	cci1_default: cci1_default {
-		pinmux {
-			function = "cci_i2c";
-			pins = "gpio19", "gpio20";
-		};
-		pinconf {
-			pins = "gpio19", "gpio20";
-			drive-strength = <16>;
-			bias-disable;
-		};
-	};
-
-	camera_board_default: camera_board_default {
-		mux_pwdn {
-			function = "gpio";
-			pins = "gpio98";
-		};
-		config_pwdn {
-			pins = "gpio98";
-			drive-strength = <16>;
-			bias-disable;
-		};
-
-		mux_rst {
-			function = "gpio";
-			pins = "gpio104";
-		};
-		config_rst {
-			pins = "gpio104";
-			drive-strength = <16>;
-			bias-disable;
-		};
-
-		mux_mclk1 {
-			function = "cam_mclk";
-			pins = "gpio14";
-		};
-		config_mclk1 {
-			pins = "gpio14";
-			drive-strength = <16>;
-			bias-disable;
-		};
-	};
-
-	camera_front_default: camera_front_default {
-		mux_pwdn {
-			function = "gpio";
-			pins = "gpio133";
-		};
-		config_pwdn {
-			pins = "gpio133";
-			drive-strength = <16>;
-			bias-disable;
-		};
-
-		mux_rst {
-			function = "gpio";
-			pins = "gpio23";
-		};
-		config_rst {
-			pins = "gpio23";
-			drive-strength = <16>;
-			bias-disable;
-		};
-
-		mux_mclk2 {
-			function = "cam_mclk";
-			pins = "gpio15";
-		};
-		config_mclk2 {
-			pins = "gpio15";
-			drive-strength = <16>;
-			bias-disable;
-		};
-	};
-
-	camera_rear_default: camera_rear_default {
-		mux_pwdn {
-			function = "gpio";
-			pins = "gpio26";
-		};
-		config_pwdn {
-			pins = "gpio26";
-			drive-strength = <16>;
-			bias-disable;
-		};
-
-		mux_rst {
-			function = "gpio";
-			pins = "gpio25";
-		};
-		config_rst {
-			pins = "gpio25";
-			drive-strength = <16>;
-			bias-disable;
-		};
-
-		mux_mclk0 {
-			function = "cam_mclk";
-			pins = "gpio13";
-		};
-		config_mclk0 {
-			pins = "gpio13";
-			drive-strength = <16>;
-			bias-disable;
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index ce430ba9c118..7f7e3fc03bb9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -693,15 +693,482 @@ zap-shader {
 			};
 		};
 
-		msmgpio: pinctrl@1010000 {
+		tlmm: pinctrl@1010000 {
 			compatible = "qcom,msm8996-pinctrl";
 			reg = <0x01010000 0x300000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
-			gpio-ranges = <&msmgpio 0 0 150>;
+			gpio-ranges = <&tlmm 0 0 150>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+
+			blsp1_spi1_default: blsp1-spi1-default {
+				spi {
+					pins = "gpio0", "gpio1", "gpio3";
+					function = "blsp_spi1";
+					drive-strength = <12>;
+					bias-disable;
+				};
+
+				cs {
+					pins = "gpio2";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			blsp1_spi1_sleep: blsp1-spi1-sleep {
+				pins = "gpio0", "gpio1", "gpio2", "gpio3";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			blsp2_uart2_2pins_default: blsp2-uart1-2pins {
+				pins = "gpio4", "gpio5";
+				function = "blsp_uart8";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			blsp2_uart2_2pins_sleep: blsp2-uart1-2pins-sleep {
+				pins = "gpio4", "gpio5";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp2_i2c2_default: blsp2-i2c2 {
+				pins = "gpio6", "gpio7";
+				function = "blsp_i2c8";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			blsp2_i2c2_sleep: blsp2-i2c2-sleep {
+				pins = "gpio6", "gpio7";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cci0_default: cci0-default {
+				pins = "gpio17", "gpio18";
+				function = "cci_i2c";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			camera0_state_on:
+			camera_rear_default: camera-rear-default {
+				mclk0 {
+					pins = "gpio13";
+					function = "cam_mclk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				rst {
+					pins = "gpio25";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				pwdn {
+					pins = "gpio26";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+				};
+			};
+
+			cci1_default: cci1-default {
+				pins = "gpio19", "gpio20";
+				function = "cci_i2c";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			camera1_state_on:
+			camera_board_default: camera-board-default {
+				mclk1 {
+					pins = "gpio14";
+					function = "cam_mclk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				pwdn {
+					pins = "gpio98";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				rst {
+					pins = "gpio104";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+				};
+			};
+
+			camera2_state_on:
+			camera_front_default: camera-front-default {
+				mclk2 {
+					pins = "gpio15";
+					function = "cam_mclk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				rst {
+					pins = "gpio23";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				pwdn {
+					pins = "gpio133";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+				};
+			};
+
+			pcie0_state_on: pcie0-state-on {
+				perst {
+					pins = "gpio35";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				clkreq {
+					pins = "gpio36";
+					function = "pci_e0";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				wake {
+					pins = "gpio37";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			pcie0_state_off: pcie0-state-off {
+				perst {
+					pins = "gpio35";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				clkreq {
+					pins = "gpio36";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				wake {
+					pins = "gpio37";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			blsp1_i2c3_default: blsp1-i2c2-default {
+				pins = "gpio47", "gpio48";
+				function = "blsp_i2c3";
+				drive-strength = <16>;
+				bias-disable = <0>;
+			};
+
+			blsp1_i2c3_sleep: blsp1-i2c2-sleep {
+				pins = "gpio47", "gpio48";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable = <0>;
+			};
+
+			blsp2_uart3_4pins_default: blsp2-uart2-4pins {
+				pins = "gpio49", "gpio50", "gpio51", "gpio52";
+				function = "blsp_uart9";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			blsp2_uart3_4pins_sleep: blsp2-uart2-4pins-sleep {
+				pins = "gpio49", "gpio50", "gpio51", "gpio52";
+				function = "blsp_uart9";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			wcd_intr_default: wcd-intr-default{
+				pins = "gpio54";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+				input-enable;
+			};
+
+			blsp2_i2c1_default: blsp2-i2c1 {
+				pins = "gpio55", "gpio56";
+				function = "blsp_i2c7";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			blsp2_i2c1_sleep: blsp2-i2c0-sleep {
+				pins = "gpio55", "gpio56";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp2_i2c5_default: blsp2-i2c5 {
+				pins = "gpio60", "gpio61";
+				function = "blsp_i2c11";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			/* Sleep state for BLSP2_I2C5 is missing.. */
+
+			cdc_reset_active: cdc-reset-active {
+				pins = "gpio64";
+				function = "gpio";
+				drive-strength = <16>;
+				bias-pull-down;
+				output-high;
+			};
+
+			cdc_reset_sleep: cdc-reset-sleep {
+				pins = "gpio64";
+				function = "gpio";
+				drive-strength = <16>;
+				bias-disable;
+				output-low;
+			};
+
+			blsp2_spi6_default: blsp2-spi5-default {
+				spi {
+					pins = "gpio85", "gpio86", "gpio88";
+					function = "blsp_spi12";
+					drive-strength = <12>;
+					bias-disable;
+				};
+
+				cs {
+					pins = "gpio87";
+					function = "gpio";
+					drive-strength = <16>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			blsp2_spi6_sleep: blsp2-spi5-sleep {
+				pins = "gpio85", "gpio86", "gpio87", "gpio88";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			blsp2_i2c6_default: blsp2-i2c6 {
+				pins = "gpio87", "gpio88";
+				function = "blsp_i2c12";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			blsp2_i2c6_sleep: blsp2-i2c6-sleep {
+				pins = "gpio87", "gpio88";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			pcie1_state_on: pcie1-state-on {
+				perst {
+					pins = "gpio130";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				clkreq {
+					pins = "gpio131";
+					function = "pci_e1";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				wake {
+					pins = "gpio132";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			pcie1_state_off: pcie1-state-off {
+				/* Perst is missing? */
+				clkreq {
+					pins = "gpio131";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				wake {
+					pins = "gpio132";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			pcie2_state_on: pcie2-state-on {
+				perst {
+					pins = "gpio114";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				clkreq {
+					pins = "gpio115";
+					function = "pci_e2";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				wake {
+					pins = "gpio116";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			pcie2_state_off: pcie2-state-off {
+				/* Perst is missing? */
+				clkreq {
+					pins = "gpio115";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				wake {
+					pins = "gpio116";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			sdc1_state_on: sdc1-state-on {
+				clk {
+					pins = "sdc1_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				cmd {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				data {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				rclk {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
+			};
+
+			sdc1_state_off: sdc1-state-off {
+				clk {
+					pins = "sdc1_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+
+				cmd {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				data {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				rclk {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
+			};
+
+			sdc2_state_on: sdc2-clk-on {
+				clk {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				cmd {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				data {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+			};
+
+			sdc2_state_off: sdc2-clk-off {
+				clk {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+
+				cmd {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				data {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
 		};
 
 		spmi_bus: qcom,spmi@400f000 {
@@ -762,8 +1229,8 @@ pcie0: pcie@600000 {
 						<0 0 0 4 &intc 0 248 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 				pinctrl-names = "default", "sleep";
-				pinctrl-0 = <&pcie0_clkreq_default &pcie0_perst_default &pcie0_wake_default>;
-				pinctrl-1 = <&pcie0_clkreq_sleep &pcie0_perst_default &pcie0_wake_sleep>;
+				pinctrl-0 = <&pcie0_state_on>;
+				pinctrl-1 = <&pcie0_state_off>;
 
 				linux,pci-domain = <0>;
 
@@ -816,8 +1283,8 @@ pcie1: pcie@608000 {
 						<0 0 0 4 &intc 0 275 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 				pinctrl-names = "default", "sleep";
-				pinctrl-0 = <&pcie1_clkreq_default &pcie1_perst_default &pcie1_wake_default>;
-				pinctrl-1 = <&pcie1_clkreq_sleep &pcie1_perst_default &pcie1_wake_sleep>;
+				pinctrl-0 = <&pcie1_state_on>;
+				pinctrl-1 = <&pcie1_state_off>;
 
 				linux,pci-domain = <1>;
 
@@ -867,8 +1334,8 @@ pcie2: pcie@610000 {
 						<0 0 0 4 &intc 0 145 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 				pinctrl-names = "default", "sleep";
-				pinctrl-0 = <&pcie2_clkreq_default &pcie2_perst_default &pcie2_wake_default>;
-				pinctrl-1 = <&pcie2_clkreq_sleep &pcie2_perst_default &pcie2_wake_sleep >;
+				pinctrl-0 = <&pcie2_state_on>;
+				pinctrl-1 = <&pcie2_state_off>;
 
 				linux,pci-domain = <2>;
 				clocks = <&gcc GCC_PCIE_2_PIPE_CLK>,
@@ -1876,8 +2343,8 @@ blsp1_spi0: spi@7575000 {
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
 			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp1_spi0_default>;
-			pinctrl-1 = <&blsp1_spi0_sleep>;
+			pinctrl-0 = <&blsp1_spi1_default>;
+			pinctrl-1 = <&blsp1_spi1_sleep>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -1891,8 +2358,8 @@ blsp1_i2c2: i2c@7577000 {
 				<&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
 			clock-names = "iface", "core";
 			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp1_i2c2_default>;
-			pinctrl-1 = <&blsp1_i2c2_sleep>;
+			pinctrl-0 = <&blsp1_i2c3_default>;
+			pinctrl-1 = <&blsp1_i2c3_sleep>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -1926,8 +2393,8 @@ blsp2_i2c0: i2c@75b5000 {
 				<&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>;
 			clock-names = "iface", "core";
 			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp2_i2c0_default>;
-			pinctrl-1 = <&blsp2_i2c0_sleep>;
+			pinctrl-0 = <&blsp2_i2c1_default>;
+			pinctrl-1 = <&blsp2_i2c1_sleep>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -1941,8 +2408,8 @@ blsp2_i2c1: i2c@75b6000 {
 				<&gcc GCC_BLSP2_QUP2_I2C_APPS_CLK>;
 			clock-names = "iface", "core";
 			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp2_i2c1_default>;
-			pinctrl-1 = <&blsp2_i2c1_sleep>;
+			pinctrl-0 = <&blsp2_i2c2_default>;
+			pinctrl-1 = <&blsp2_i2c2_sleep>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -1956,8 +2423,8 @@ blsp2_spi5: spi@75ba000{
 				 <&gcc GCC_BLSP2_AHB_CLK>;
 			clock-names = "core", "iface";
 			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp2_spi5_default>;
-			pinctrl-1 = <&blsp2_spi5_sleep>;
+			pinctrl-0 = <&blsp2_spi6_default>;
+			pinctrl-1 = <&blsp2_spi6_sleep>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -2032,13 +2499,13 @@ wcd9335: codec@1{
 					compatible = "slim217,1a0";
 					reg  = <1 0>;
 
-					interrupt-parent = <&msmgpio>;
+					interrupt-parent = <&tlmm>;
 					interrupts = <54 IRQ_TYPE_LEVEL_HIGH>,
 						     <53 IRQ_TYPE_LEVEL_HIGH>;
 					interrupt-names  = "intr1", "intr2";
 					interrupt-controller;
 					#interrupt-cells = <1>;
-					reset-gpios = <&msmgpio 64 0>;
+					reset-gpios = <&tlmm 64 0>;
 
 					slim-ifc-dev  = <&tasha_ifd>;
 
@@ -2458,4 +2925,3 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
-#include "msm8996-pins.dtsi"
-- 
2.30.1

