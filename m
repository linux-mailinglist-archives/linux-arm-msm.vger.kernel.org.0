Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 319CE62C18D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 15:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234066AbiKPO5J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 09:57:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233881AbiKPO46 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 09:56:58 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A3D5389B;
        Wed, 16 Nov 2022 06:56:57 -0800 (PST)
Received: from g550jk.arnhem.chello.nl (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 76A84D05D0;
        Wed, 16 Nov 2022 14:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1668610615; bh=OwNNHC3ur02S7SAbksK6WL1JCQtVf2UQ7OuQKLiUdP8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=c74L/cNTzsSkBEdxi+jAt2aRO+PN+PxLQgEQzfLpojIAAtIX1E8DX1XefSITatgAc
         /qgjtcEqc8CMSSGonhpufApGE7LKsG4wf9n/64fZW6V4LCsD2L7ahKYws529wN90WK
         km6bC8uBXJNA0vgTvdsut2y99QAAeb6OVchxssZc=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Eugene Lepshy <fekz115@gmail.com>,
        Gianluca Boiano <morf3089@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH 7/8] arm64: dts: qcom: msm8953: Add device tree for Xiaomi Redmi 5 Plus
Date:   Wed, 16 Nov 2022 15:56:08 +0100
Message-Id: <20221116145616.17884-8-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116145616.17884-1-luca@z3ntu.xyz>
References: <20221116145616.17884-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Eugene Lepshy <fekz115@gmail.com>

Add device tree for the Xiaomi Redmi 5 Plus (vince) smartphone. This
device is based on Snapdragon 625 (msm8953) SoC.

Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
Co-developed-by: Gianluca Boiano <morf3089@gmail.com>
Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/msm8953-xiaomi-vince.dts    | 330 ++++++++++++++++++
 2 files changed, 331 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 9517638b2fdd..bed490c095dd 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -25,6 +25,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-motorola-potter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-daisy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-mido.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-tissot.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-vince.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-msft-lumia-octagon-talkman.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts
new file mode 100644
index 000000000000..da029aaa99a1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/dts-v1/;
+
+#include "msm8953.dtsi"
+#include "pm8953.dtsi"
+#include "pmi8950.dtsi"
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Xiaomi Redmi 5 Plus";
+	compatible = "xiaomi,vince", "qcom,msm8953";
+	chassis-type = "handset";
+	qcom,msm-id = <293 0>;
+	qcom,board-id= <0x1000b 0x08>;
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_key_default>;
+
+		key-volume-up {
+			label = "volume_up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	reserved-memory {
+		/delete-node/ memory@85b00000;
+		memory@84a00000 {
+			reg = <0x0 0x84a00000 0x0 0x1900000>;
+			no-map;
+		};
+
+		cont_splash_mem: memory@90001000 {
+			reg = <0x0 0x90001000 0x0 (1080 * 2160 * 3)>;
+			no-map;
+		};
+
+		/delete-node/ memory@8d600000;
+		adsp_fw_mem: memory@8d600000 {
+			reg = <0x0 0x8d600000 0x0 0x1200000>;
+			no-map;
+		};
+
+		/delete-node/ memory@8e700000;
+		wcnss_fw_mem: memory@8e800000 {
+			reg = <0x0 0x8e800000 0x0 0x700000>;
+			no-map;
+		};
+
+		ramoops@9ff00000 {
+			compatible = "ramoops";
+			reg = <0x0 0x9ff00000 0x0 0x100000>;
+			record-size = <0x1000>;
+			console-size = <0x80000>;
+			ftrace-size = <0x1000>;
+			pmsg-size = <0x8000>;
+		};
+	};
+
+	i2c-gpio {
+		compatible = "i2c-gpio";
+		sda-gpios = <&tlmm 14 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <2>;        /* ~100 kHz */
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		imu@6a {
+			compatible = "st,lsm6dsl";
+			reg = <0x6a>;
+			vdd-supply = <&pm8953_l10>;
+			vddio-supply = <&pm8953_l6>;
+			mount-matrix = "1", "0", "0",
+					"0", "-1", "0",
+					"0", "0", "1";
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
+&hsusb_phy {
+	vdd-supply = <&pm8953_l3>;
+	vdda-pll-supply = <&pm8953_l7>;
+	vdda-phy-dpdm-supply = <&pm8953_l13>;
+
+	status = "okay";
+};
+
+&i2c_2 {
+	status = "okay";
+
+	led-controller@45 {
+		compatible = "awinic,aw2013";
+		reg = <0x45>;
+
+		vcc-supply = <&pm8953_l10>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			led-max-microamp = <5000>;
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_WHITE>;
+		};
+	};
+};
+
+&i2c_3 {
+	status = "okay";
+
+	touchscreen@20 {
+		reg = <0x20>;
+		compatible = "syna,rmi4-i2c";
+		interrupts-parent = <&tlmm>;
+		interrupts-extended = <&tlmm 65 IRQ_TYPE_EDGE_FALLING>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vdd-supply = <&pm8953_l10>;
+		vio-supply = <&pm8953_l6>;
+
+		pinctrl-names = "init", "suspend";
+		pinctrl-0 = <&ts_reset_active &ts_int_active>;
+		pinctrl-1 = <&ts_reset_suspend &ts_int_suspend>;
+		syna,reset-delay-ms = <200>;
+		syna,startup-delay-ms = <500>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f12@12 {
+			reg = <0x12>;
+			syna,rezero-wait-ms = <20>;
+			syna,sensor-type = <1>;
+			touchscreen-x-mm = <68>;
+			touchscreen-y-mm = <122>;
+		};
+	};
+};
+
+&pm8953_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&pmi8950_wled {
+	qcom,current-limit-microamp = <20000>;
+	qcom,ovp-millivolt = <29600>;
+	qcom,num-strings = <2>;
+	qcom,external-pfet;
+	qcom,cabc;
+
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm8953-regulators";
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_s5-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+		vdd_s7-supply = <&vph_pwr>;
+		vdd_l1-supply = <&pm8953_s3>;
+		vdd_l2_l3-supply = <&pm8953_s3>;
+		vdd_l4_l5_l6_l7_l16_l19-supply = <&pm8953_s4>;
+		vdd_l8_l11_l12_l13_l14_l15-supply = <&vph_pwr>;
+		vdd_l9_l10_l17_l18_l22-supply = <&vph_pwr>;
+
+		pm8953_s1: s1 {
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <1156000>;
+		};
+
+		pm8953_s3: s3 {
+			regulator-min-microvolt = <984000>;
+			regulator-max-microvolt = <1224000>;
+		};
+		pm8953_s4: s4 {
+			regulator-min-microvolt = <1900000>;
+			regulator-max-microvolt = <2050000>;
+		};
+		pm8953_l1: l1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+		};
+		pm8953_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1225000>;
+		};
+		pm8953_l3: l3 {
+			regulator-min-microvolt = <925000>;
+			regulator-max-microvolt = <925000>;
+		};
+		pm8953_l5: l5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8953_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8953_l7: l7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+		};
+		pm8953_l8: l8 {
+			regulator-min-microvolt = <2900000>;
+			regulator-max-microvolt = <2900000>;
+		};
+		pm8953_l9: l9 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3300000>;
+		};
+		pm8953_l10: l10 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+		};
+		pm8953_l11: l11 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+		};
+		pm8953_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+		pm8953_l13: l13 {
+			regulator-min-microvolt = <3125000>;
+			regulator-max-microvolt = <3125000>;
+		};
+		pm8953_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8953_l17: l17 {
+			regulator-min-microvolt = <2750000>;
+			regulator-max-microvolt = <2850000>;
+		};
+		pm8953_l19: l19 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1380000>;
+		};
+		pm8953_l22: l22 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+		pm8953_l23: l23 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1225000>;
+		};
+	};
+};
+
+&sdhc_1 {
+	status = "okay";
+};
+
+&sdhc_2 {
+	vmmc-supply = <&pm8953_l11>;
+	vqmmc-supply = <&pm8953_l12>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
+	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <16 4>, <135 4>;
+
+	ts_reset_active: ts-reset-active-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	ts_reset_suspend: ts-reset-suspend-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	ts_int_active: ts-int-active-state {
+		pins = "gpio65";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	ts_int_suspend: ts-int-suspend-state {
+		pins = "gpio65";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
+
+&uart_0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart_console_active>;
+
+	status = "okay";
+};
+
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	dr_mode = "peripheral";
+};
-- 
2.38.1

