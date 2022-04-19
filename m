Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBB450618E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 03:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234301AbiDSBL4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 21:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244838AbiDSBLz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 21:11:55 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 458AF2F025
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 18:09:13 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id c10so20433746wrb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 18:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J1jcuIFIquxguncYu1oFjWv0OUSgyCxbKj51MA1MzeA=;
        b=rwK27+qb1Wbyg/BD0T6Vx0YeQiQ8I0eALkqRJeFPX5aEfIb3qHuNA+08lYMOok2K+R
         kt2KTph5xCEq7nFKm7+wpXa2YS6Y35wZSYP2C9AkTcuda9xZ1MhaPmqA/zbGF6eITPHe
         NUzZILPSWUyWiFpFxPdv9eL8Ac9orUzeR6hvh5qXPPaluv20tXDBZmpKYZnzSe9uKl0l
         t7YDln/m6ZN4v/48/hv3iuX4DuBLJws2dEO4NA/d/4wZPDex3cKOt/9rllNOlbFPwwjF
         JPQ8LQ6foGR3tQdEPdQ+7YlIe4WZpxWVAm0pmHiuGGMLRC8GtDc4l/LePMkS6yvo7tlr
         IWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J1jcuIFIquxguncYu1oFjWv0OUSgyCxbKj51MA1MzeA=;
        b=XLX+XL+ckikbxSBW1VCb52WomkN8tPZnwNIhiRcqRgD/g8x8MHbabZdWDa+rbL5rUU
         X0ob/du1at+RPOlZKLx0StxwivQhCQcCtuab8Kojiavk6Wb2g7xRtptEzYlrXCQ+ZJQj
         /dgpLSq3EBiBPYc7ZR92VQ+p3nCTYICTLZe+b42ColHmsTmXG4OWtMR4+EYSAj2Bpj8O
         B1+7+DoIeRhfPEbrUxv/WQ5qddk1IDKDrh9ajIZbgMMqUHMolRTwwRdaavGXCNYtDTuC
         RUc/Fq5wi8ueXQa4H/aGbpf390VD0SgBNqPASfgOSDUN0K0hrMVqpIjkctN3xK81yxtA
         YMhw==
X-Gm-Message-State: AOAM530hpUMukXaf84engaKJjnRahhyvn8A/uhemK4bNRcKOo7lSiibY
        eZqfPKPjtABo2IjT79Tg2d9G5g==
X-Google-Smtp-Source: ABdhPJyH1UcnnIkTcJB8csVFv8SOY6Z78ItpBvt+W8Ff2TZFZ9gDX7ZMa6sXO5t09DwFN/hQDFOZSg==
X-Received: by 2002:a5d:4563:0:b0:207:bc6f:e345 with SMTP id a3-20020a5d4563000000b00207bc6fe345mr9829758wrc.372.1650330551585;
        Mon, 18 Apr 2022 18:09:11 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m6-20020a05600c4f4600b003918d69b334sm12030732wmq.42.2022.04.18.18.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 18:09:11 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     shawn.guo@linaro.org, jun.nie@linaro.org, benl@squareup.com,
        jwillcox@squareup.com, jgates@squareup.com, mchen@squareup.com,
        zac@squareup.com, bryan.odonoghue@linaro.org
Subject: [PATCH v1 4/4] arm64: dts: Add msm8939 Sony Xperia M4 Aqua
Date:   Tue, 19 Apr 2022 02:09:03 +0100
Message-Id: <20220419010903.3109514-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a basic booting DTS for the Sony Xperia M4 Aqua aka "tulip".

Tulip is paired with:

- wcn3660
- smb1360 battery charger
- 720p Truly NT35521 Panel

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../qcom/msm8939-sony-xperia-kanuti-tulip.dts | 489 ++++++++++++++++++
 2 files changed, 490 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5b8a0eb34733..3ac7f6876c09 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -19,6 +19,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-j5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-serranove.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-sony-xperia-kanuti-tulip.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-msft-lumia-octagon-talkman.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts b/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
new file mode 100644
index 000000000000..336969f16bc9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
@@ -0,0 +1,489 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2015, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022, Bryan O'Donoghue.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/dts-v1/;
+
+#include "msm8939.dtsi"
+#include "pm8916.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+/ {
+	model = "Sony Xperia M4 Aqua";
+	compatible = "sony,kanuti-tulip", "qcom,msm8939";
+	qcom,board-id = <8 0>;
+
+	aliases {
+		serial0 = &blsp1_uart2;
+		mmc0 = &sdhc_1; /* SDC1 eMMC slot */
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	positive5_vreg: positive5_vreg {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&msmgpio_positive5_vreg>;
+		regulator-name = "positive5_vreg";
+		gpios = <&msmgpio 114 GPIO_ACTIVE_LOW>;
+		startup-delay-us = <0>;
+		enable-active-low;
+	};
+
+	negative5_vreg: negative5_vreg {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&msmgpio_negative5_vreg>;
+		regulator-name = "negative5_vreg";
+		gpios = <&msmgpio 17 GPIO_ACTIVE_LOW>;
+		startup-delay-us = <0>;
+		enable-active-low;
+	};
+};
+
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	vdda-supply = <&pm8916_l2>;
+	vddio-supply = <&pm8916_l16>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&panel_in>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+
+	panel@0 {
+		compatible = "sony,tulip-truly-nt35521";
+		reg = <0>;
+		positive5-supply = <&positive5_vreg>;
+		negative5-supply = <&negative5_vreg>;
+		reset-gpios = <&msmgpio 25 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&msmgpio 10 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				panel_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+		};
+
+	};
+};
+
+&dsi0_phy {
+	vddio-supply = <&pm8916_l16>;
+	status = "okay";
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm8916_l8>;
+	vqmmc-supply = <&pm8916_l5>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
+	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
+	status = "okay";
+};
+
+&sdhc_2 {
+	vmmc-supply = <&pm8916_l11>;
+	vqmmc-supply = <&pm8916_l12>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
+	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&blsp_dma {
+	status = "okay";
+};
+
+&otg {
+	status = "okay";
+	usb-role-switch;
+
+	ulpi {
+		usb_hs_phy: phy {
+			qcom,enable-vbus-pullup;
+			v1p8-supply = <&pm8916_l7>;
+			v3p3-supply = <&pm8916_l13>;
+		};
+	};
+};
+
+&pronto {
+	status = "okay";
+	smd-edge {
+		wcnss {
+			bt {
+				local-bd-address = [ 55 44 33 22 11 00 ];
+			};
+		};
+	};
+};
+
+&msmgpio {
+
+	cdc_ext_spk_pa_active: cdc_ext_spk_pa_on {
+		pins = "gpio0";
+		function = "gpio";
+		drive-strength = <8>;
+		output-low;
+		bias-pull-none;
+	};
+
+	cdc_ext_spk_pa_sus: cdc_ext_spk_pa_off {
+		pins = "gpio0";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	nfc_int_active: nfc_int_active {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	nfc_int_suspend: nfc_int_suspend {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	nfc_disable_active: nfc_disable_active {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	nfc_disable_suspend: nfc_disable_suspend {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-disable;
+	};
+
+	smb_int: smb_int {
+		pins = "gpio62";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	usbid: usbid {
+		pins = "gpio110";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	gpio_key_suspend: gpio_key_suspend {
+		pins = "gpio107", "gpio108", "gpio109";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	/* add pingrp for touchscreen */
+	ts_int_active: ts_int_active {
+		pins = "gpio13";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+	};
+
+	ts_int_suspend: ts_int_suspend {
+		pins = "gpio13";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	ts_reset_active: ts_reset_active {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+	};
+
+	ts_reset_suspend: ts_reset_suspend {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	ts_release: ts_release {
+		pins = "gpio13", "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	ext_buck_vsel: vsel0 {
+		pins = "gpio111";
+		function = "gpio";
+		drive-strength = <2>;
+	};
+
+	ext_cdc_tlmm_lines_act: tlmm_lines_on {
+		pins = "gpio116", "gpio112", "gpio117", "gpio118", "gpio119";
+		function = "gpio";
+		drive-strength = <8>;
+	};
+
+	ext_cdc_tlmm_lines_sus: tlmm_lines_off {
+		pins = "gpio116", "gpio112", "gpio117", "gpio118", "gpio119";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cdc_slim_lines_act: lines_on {
+		pins = "gpio63";
+		function = "cdc_pdm0";
+		drive-strength = <8>;
+		output-high;
+		bias-pull-none;
+	};
+
+	cdc_slim_lines_sus: lines_off {
+		pins = "gpio63";
+		function = "cdc_pdm0";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cross_conn_det_act: lines_on {
+		pins = "gpio120";
+		function = "gpio";
+		drive-strength = <8>;
+		output-low;
+		bias-pull-down;
+	};
+
+	cross_conn_det_sus: lines_off {
+		pins = "gpio120";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	cci1_default: cci1-default {
+		pins = "gpio31", "gpio32";
+		function = "cci_i2c";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_sensor_flash_default: default {
+		pins = "gpio98", "gpio97";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	/* Gyroscope and accelerometer sensor combo */
+	mpu6050_default: mpu6050_default {
+		pins = "gpio115";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	mpu6050_sleep: mpu6050_sleep {
+		pins = "gpio115";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	/* Ambient light and proximity sensor apds9930 and apds9900 */
+	apds99xx_default: apds99xx_default {
+		pins = "gpio113";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	apds99xx_sleep: apds99xx_sleep {
+		pins = "gpio113";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	ak8963_default: ak8963_default {
+		pins = "gpio69";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	ak8963_sleep: ak8963_sleep {
+		pins = "gpio69";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	nt35521_te_default: nt35521_te_default {
+		pins = "gpio24";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	nt35521_backlight: nt35521_backlight {
+		pins = "gpio10";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	msmgpio_positive5_vreg: msmgpio_positive5_vreg {
+		pins = "gpio114";
+		function = "gpio";
+		output-low;
+		bias-pull-none;
+	};
+
+	msmgpio_negative5_vreg: msmgpio_negative5_vreg {
+		pins = "gpio17";
+		function = "gpio";
+		output-low;
+		bias-pull-none;
+	};
+};
+
+&rpm_requests {
+	smd_rpm_regulators: pm8916-regulators {
+		compatible = "qcom,rpm-pm8916-regulators";
+		vdd_l1_l2_l3-supply = <&pm8916_s3>;
+		vdd_l4_l5_l6-supply = <&pm8916_s4>;
+		vdd_l7-supply = <&pm8916_s4>;
+
+		pm8916_s3: s3 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		pm8916_s4: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2100000>;
+		};
+
+		/* l1 is fixed to 1225000, but not connected in schematic */
+		pm8916_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8916_l4: l4 {
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+		};
+
+		pm8916_l5: l5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8916_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on; /* copy from v3.10 */
+		};
+
+		pm8916_l7: l7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8916_l8: l8 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2900000>;
+		};
+
+		pm8916_l9: l9 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8916_l10: l10 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8916_l11: l11 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8916_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8916_l13: l13 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+		};
+
+		pm8916_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8916_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8916_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8916_l17: l17 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+		};
+
+		pm8916_l18: l18 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2700000>;
+		};
+	};
+};
-- 
2.35.1

