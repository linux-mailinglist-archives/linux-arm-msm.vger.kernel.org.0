Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A158050618C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 03:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244915AbiDSBLz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 21:11:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237506AbiDSBLz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 21:11:55 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCC52F008
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 18:09:11 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id i20so20381266wrb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 18:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HbumFdbwH02W8k8y1CsoU2KbOZBuF3c518zt2HrlC1o=;
        b=Z1BYxr+7U3cezvT/vAIvBQ4kQ/7vcl/mPUktBqcc7rXwyc8M6U8g5P4f0egybz+7LS
         WZkCi8a3+jc+ZQgi5VhyhOAOJX+tD/V7i+GI2RoqXJKQ3cK0Uqth84owkYEiTabTk6Nv
         vJOVTITHsQCDHNYXdWuf9zxtZ09FjoaK9CbtAXdlbNQ4asSRCFVb6Yh00OcHvXbymF4o
         Vf/eF1K2aHDt+JzBclJoAIxyPbxGtpn0Zbc24JyBHkvO7Nx6Eh6SBpRanyS4dJBg3ov5
         EPZr0GuOGIp+IqbDpgDL8DZDskvEH/qaODp2pDiYc+KbRvB/Rgl6CQSOXEHiXYmtgf+8
         XVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HbumFdbwH02W8k8y1CsoU2KbOZBuF3c518zt2HrlC1o=;
        b=2REJ+AGxutFPVgiWdr0+138GlY2gi6OISoPCag0Clxr4cvlHnoGkufOCIPO/tIFwYz
         4lhkKTKYeWAZ2hyeDGf4zrEEW+TNmgc55Rdc2EIdc5L3eGAhNsYLtse+w8fIAN3w6jLW
         PabPvE8062k2RpvW8iajWUd9Y31rBzu65hgrik6axoc5kqKaf6YzOWVVGp7nD7gc9Jlc
         rvQcKrF14KQzOWoKX7nKe6ZGjRZHLLoAs5Cqfjwu6jy9HHR1sUENeLA23UXySeCPaTAR
         72z9BbnkbOJRW3p0YjUkD69X1NRxZnCP/XTtaKUClkoSTJSxCKlIMeBDh/5mOFzfjuDv
         yN+A==
X-Gm-Message-State: AOAM531bXnFClggumiNoMLWGa3Dz/WP3GtWtDb3a+qTnpHzKVRc8Afws
        81hTO/rP2bM3jS2dwFJtRtDNmg==
X-Google-Smtp-Source: ABdhPJzFFzAYOiWAvtTpzk0PWPsjHYrpW0FIuu/xRE8OofkdjRKnTLtKK4cLbngixjlky5AyzqGVcA==
X-Received: by 2002:adf:b51a:0:b0:20a:8180:532c with SMTP id a26-20020adfb51a000000b0020a8180532cmr10030967wrd.660.1650330550338;
        Mon, 18 Apr 2022 18:09:10 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m6-20020a05600c4f4600b003918d69b334sm12030732wmq.42.2022.04.18.18.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 18:09:09 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     shawn.guo@linaro.org, jun.nie@linaro.org, benl@squareup.com,
        jwillcox@squareup.com, jgates@squareup.com, mchen@squareup.com,
        zac@squareup.com, bryan.odonoghue@linaro.org,
        Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v1 3/4] arm64: dts: Add aqp8039-t2 board
Date:   Tue, 19 Apr 2022 02:09:02 +0100
Message-Id: <20220419010903.3109514-4-bryan.odonoghue@linaro.org>
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

The apq8039-t2 is an apq8039/msm8939 based board paired with a wcn3680b
WiFi chipset.

Co-developed-by: Shawn Guo <shawn.guo@linaro.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Co-developed-by: Jun Nie <jun.nie@linaro.org>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
Co-developed-by: Benjamin Li <benl@squareup.com>
Signed-off-by: Benjamin Li <benl@squareup.com>
Co-developed-by: James Willcox <jwillcox@squareup.com>
Signed-off-by: James Willcox <jwillcox@squareup.com>
Co-developed-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
Co-developed-by: Joseph Gates <jgates@squareup.com>
Signed-off-by: Joseph Gates <jgates@squareup.com>
Co-developed-by: Max Chen <mchen@squareup.com>
Signed-off-by: Max Chen <mchen@squareup.com>
Co-developed-by: Zac Crosby <zac@squareup.com>
Signed-off-by: Zac Crosby <zac@squareup.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/apq8039-t2-pinctl.dtsi      | 277 +++++++++++++++
 arch/arm64/boot/dts/qcom/apq8039-t2.dts       | 326 ++++++++++++++++++
 3 files changed, 604 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8039-t2-pinctl.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/apq8039-t2.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f9e6343acd03..5b8a0eb34733 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
diff --git a/arch/arm64/boot/dts/qcom/apq8039-t2-pinctl.dtsi b/arch/arm64/boot/dts/qcom/apq8039-t2-pinctl.dtsi
new file mode 100644
index 000000000000..60adb3da826a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/apq8039-t2-pinctl.dtsi
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+/*
+ * Line names are taken from the schematic of T2, Ver X03.
+ * July 14, 2018. Page 4 in particular.
+ */
+
+&msmgpio {
+	gpio-line-names =
+		"APQ_UART1_TX",		/* GPIO_0 */
+		"APQ_UART1_RX",
+		"APQ_I2C1_SDA",
+		"APQ_I2C1_SCL",
+		"APQ_UART2_TX_1V8",
+		"APQ_UART2_RX_1V8",
+		"APQ_I2C2_SDA",
+		"APQ_I2C2_SCL",
+		"NC",
+		"APQ_LCD_IOVCC_EN",
+		"APQ_I2C3_SDA",		/* GPIO_10 */
+		"APQ_I2C3_SCL",
+		"TOUCH_RST_1V8_L",
+		"NC",
+		"APQ_I2C4_SDA",
+		"APQ_I2C4_SCL",
+		"APQ_ID5",
+		"USB_DISCONNECT",
+		"APQ_I2C5_SDA",
+		"APQ_I2C5_SCL",
+		"APQ_USBC_SPI_MOSI",	/* GPIO_20 */
+		"APQ_USBC_SPI_MISO",
+		"APQ_USBC_SPI_SS_L",
+		"APQ_USBC_SPI_CLK",
+		"APQ_LCD_TE0",
+		"APQ_LCD_RST_L",
+		"NC",
+		"NC",
+		"ACCELEROMETER_INT1",
+		"APQ_CAM_I2C0_SDA",
+		"APQ_CAM_I2C0_SCL",	/* GPIO_30 */
+		"ACCELEROMETER_INT2",
+		"NC",
+		"NC",
+		"NC",
+		"APQ_K21_RST_1V8_L",
+		"NC",
+		"APQ_EDL_1V8",
+		"TP145",
+		"BT_SSBI",
+		"NC",			/* GPIO_40 */
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"BT_CTRL",
+		"BT_DAT",
+		"PWR_GPIO_IN",
+		"PWR_GPIO_OUT",		/* GPIO_50 */
+		"CARD_DET_MLB_L",
+		"HALL_SENSOR",
+		"TP63",
+		"TP64",
+		"TP65",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",			/* GPIO_60 */
+		"NC",
+		"APQ_K21_GPIO0_1V8",
+		"CDC_PDM_CLK",
+		"CDC_PDM_SYNC",
+		"CDC_PDM_TX",
+		"CDC_PDM_RX0",
+		"CDC_PDM_RX1",
+		"CDC_PDM_RX2",
+		"APQ_K21_GPIO1_1V8",
+		"NC",			/* GPIO_70 */
+		"APQ_HUB_SEL_1V8",
+		"APQ_K21_GPIO2_1V8",
+		"APQ_K21_GPIO3_1V8",
+		"APQ_ID0",
+		"APQ_ID1",
+		"APQ_ID2",
+		"APQ_ID3",
+		"APQ_ID4",
+		"APQ_HUB_SUSP_IND",
+		"BOOT_CONFIG_0",	/* GPIO_80 */
+		"BOOT_CONFIG_1",
+		"BOOT_CONFIG_2",
+		"BOOT_CONFIG_3",
+		"NC",
+		"NC",
+		"APQ_LCD_AVDD_EN",
+		"APQ_LCD_AVEE_EN",
+		"TP70",
+		"NC",
+		"APQ_DEBUG0",		/* GPIO_90 */
+		"APQ_DEBUG1",
+		"APQ_DEBUG2",
+		"APQ_DEBUG3",
+		"TP165",
+		"NC",
+		"APQ_LNA_PWR_EN",
+		"NC",
+		"APQ_LCD_BL_EN",
+		"NC",
+		"APQ_LCD_ID0",		/* GPIO_100 */
+		"APQ_LCD_ID1",
+		"USBC_GPIO5_1V8",
+		"NC",
+		"NC",
+		"NC",
+		"APQ_HUB_RST_1V8_L",
+		"USBC_I2C_IRQ_1V8_L",
+		"SPE_PWR_EN",
+		"NC",
+		"APQ_USB_ID",		/* GPIO_110 */
+		"APQ_EXT_BUCK_VSEL",
+		"APQ_USB_ID_OUT",
+		"NC",
+		"PRNT_RST_L",
+		"APQ_CRQ_I2C_RDY_1V8",
+		"TYPEC_RST_1V8_H",
+		"CHG_BACKPWR_EN",
+		"CHG_PROCHOT_L",
+		"NC",
+		"USBC_GPIO7_1V8",	/* GPIO_120 */
+		"NC";
+
+	blsp1_uart1_default: blsp1-uart1-default {
+		pins = "gpio0", "gpio1";
+		function = "blsp_uart1";
+
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	blsp1_uart1_sleep: blsp1-uart1-sleep {
+		pins = "gpio0", "gpio1";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	pinctrl_lcd_iovcc: lcd-iovcc {
+		pinmux {
+			pins = "gpio9";
+			function = "gpio";
+		};
+	};
+
+	pinctrl_lcd_avdd: lcd-avdd {
+		pinmux {
+			pins = "gpio86";
+			function = "gpio";
+		};
+	};
+
+	pinctrl_lcd_avee: lcd-avee {
+		pinmux {
+			pins = "gpio87";
+			function = "gpio";
+		};
+	};
+
+	pinctrl_backlight: backlight {
+		pinmux {
+			pins = "gpio98";
+			function = "gpio";
+		};
+	};
+
+	pinctrl_panel: panel {
+		pinmux {
+			pins = "gpio25";
+			function = "gpio";
+		};
+	};
+
+	msmgpio_spe_reg: msmgpio_spe_reg {
+		pinmux {
+			pins = "gpio108";
+			function = "gpio";
+			output-high;
+		};
+	};
+
+	sq_spe_enable: sq_spe_enable {
+		pinmux {
+			pins = "gpio35";
+			function = "gpio";
+			output-low;
+		};
+	};
+
+	msmgpio_crq_reg: msmgpio_crq_reg {
+		pinmux {
+			function = "gpio";
+			pins = "gpio12";
+			output-high;
+		};
+	};
+
+	typec_pins: typec_pins {
+		pinmux_irqz {
+			function = "gpio";
+			pins = "gpio107";
+		};
+		pinconf_irqz {
+			pins = "gpio107";
+			bias-pull-up;
+			input-enable;
+		};
+	};
+
+	pinctrl_otg_default: otg_default {
+		pinmux_usb_disconnect {
+			function = "gpio";
+			pins = "gpio17";
+			output-high;
+		};
+	};
+
+	pinctrl_otg_host: otg_host {
+		pinmux_usb_disconnect {
+			function = "gpio";
+			pins = "gpio17";
+			output-low;
+		};
+	};
+
+	pinctrl_otg_device: otg_device {
+		pinmux_usb_disconnect {
+			function = "gpio";
+			pins = "gpio17";
+			output-low;
+		};
+	};
+
+	ext_buck_vsel: ext_buck_vsel {
+		label = "ext-buck-vsel";
+		pinmux {
+			function = "gpio";
+			pins = "gpio111";
+		};
+		pinconf {
+			pins = "gpio111";
+			drive-strength = <2>;
+		};
+	};
+};
+
+&pm8916_gpios {
+	gpio-line-names =
+		"PM_GPIO1",     /* WIFI_GPIO1_PRE */
+		"PM_GPIO2",     /* WIFI_GPIO2_PRE */
+		"PM_GPIO3",
+		"PM_GPIO4";
+
+	wcnss_pin_antennae: wcnss_pin_antennae {
+		pinmux {
+			pins = "gpio1", "gpio2";
+		};
+		pinconf {
+			pins = "gpio1", "gpio2";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			output-high;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/apq8039-t2.dts b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
new file mode 100644
index 000000000000..558f37945d94
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
@@ -0,0 +1,326 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2015, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022, Linaro Ltd.
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
+#include "apq8039-t2-pinctl.dtsi"
+
+/ {
+	model = "Square, Inc. T2 Devkit";
+	compat = "square,apq8039-t2", "qcom,msm8939";
+	qcom,board-id = <0x53 0x54>;
+
+	aliases {
+		serial0 = &blsp1_uart1;
+		serial1 = &blsp1_uart2;
+	};
+
+	chosen {
+		stdout-path = "serial1:115200n8";
+	};
+
+	lcd_iovcc_vreg: lcd-iovcc-vreg {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_iovcc";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lcd_iovcc>;
+		gpios = <&msmgpio 9 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <300>;
+		enable-active-high;
+	};
+
+	lcd_avdd_vreg: lcd-avdd-vreg {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_avdd";
+		regulator-min-microvolt = <5600000>;
+		regulator-max-microvolt = <5600000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lcd_avdd>;
+		gpios = <&msmgpio 86 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <300>;
+		enable-active-high;
+	};
+
+	lcd_avee_vreg: lcd-avee-vreg {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_avee";
+		regulator-min-microvolt = <5600000>;
+		regulator-max-microvolt = <5600000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lcd_avee>;
+		gpios = <&msmgpio 87 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <300>;
+		enable-active-high;
+	};
+
+	bl: backlight {
+		compatible = "gpio-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_backlight>;
+		gpios = <&msmgpio 98 GPIO_ACTIVE_HIGH>;
+	};
+
+	pp_spe_3v3_vreg: pp_spe_3v3_vreg {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&msmgpio_spe_reg>;
+		regulator-name = "pp_spe_3v3";
+		gpios = <&msmgpio 108 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <0>;
+		enable-active-high;
+	};
+
+	pp_crq_3v3_vreg: pp_crq_3v3_vreg {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&msmgpio_crq_reg>;
+		regulator-name = "pp_crq_3v3";
+		gpios = <&msmgpio 12 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <0>;
+		enable-active-high;
+	};
+};
+
+&wcd_codec {
+	status = "okay";
+	qcom,hphl-jack-type-normally-open;
+	qcom,mbhc-vthreshold-low = <75 150 237 450 500>;
+	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
+};
+
+&blsp1_uart1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&blsp1_uart1_default>;
+	pinctrl-1 = <&blsp1_uart1_sleep>;
+	status = "okay";
+};
+
+&blsp1_uart2 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&blsp1_uart2_default>;
+	pinctrl-1 = <&blsp1_uart2_sleep>;
+	status = "okay";
+};
+
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	vdda-supply = <&pm8916_l2>;
+	vddio-supply = <&pm8916_l6>;
+	status = "okay";
+};
+
+&dsi0_phy {
+	vddio-supply = <&pm8916_l6>;
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
+&blsp_i2c1 {
+	status = "okay";
+};
+
+&blsp_i2c2 {
+	status = "okay";
+};
+
+&blsp_i2c3 {
+	status = "okay";
+	tps6598x: tps6598x@38 {
+		compatible = "ti,tps6598x";
+		reg = <0x38>;
+
+		interrupt-parent = <&msmgpio>;
+		interrupts = <107 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "irq";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&typec_pins>;
+
+		typec_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			port {
+				typec_ep: endpoint {
+					remote-endpoint = <&otg_ep>;
+				};
+			};
+		};
+	};
+};
+
+&blsp_i2c5 {
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
+	pinctrl-names = "default", "host", "device";
+	pinctrl-0 = <&pinctrl_otg_default>;
+	pinctrl-1 = <&pinctrl_otg_host>;
+	pinctrl-2 = <&pinctrl_otg_device>;
+	pin-switch-delay-us = <100000>;
+
+	ulpi {
+		usb_hs_phy: phy {
+			qcom,enable-vbus-pullup;
+			v1p8-supply = <&pm8916_l7>;
+			v3p3-supply = <&pm8916_l13>;
+		};
+	};
+	port {
+		otg_ep: endpoint {
+			remote-endpoint = <&typec_ep>;
+		};
+	};
+};
+
+&pronto {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wcnss_pin_a &wcnss_pin_antennae>;
+	status = "okay";
+
+	iris {
+		compatible = "qcom,wcn3680";
+	};
+
+	smd-edge {
+		wcnss {
+			bt {
+				local-bd-address = [ 55 44 33 22 11 00 ];
+			};
+		};
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

