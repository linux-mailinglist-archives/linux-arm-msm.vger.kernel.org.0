Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B77E055A54B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jun 2022 02:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbiFYANY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 20:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231986AbiFYANY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 20:13:24 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E21DD2250D
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 17:13:22 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id k7so3384586plg.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 17:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/HCZkBQUvOL343dE4cxY4+++wGcoTs8rO+O+El91LTM=;
        b=b6orAJvfi7XeTy+INDB7IXpFrvROl/yQh72Zk5aiDLZLkzD9wovan5eqaiFoZYjT9V
         ARgnooplpwmLX2UD5Vi4qtxovJYeKUkba1Opd0OVWYogzfau+I3LsuYZTm9bvkZd5YU+
         UhR3SRw6oyvMsLeA8qBFW/iLRsml3dSEGfhuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/HCZkBQUvOL343dE4cxY4+++wGcoTs8rO+O+El91LTM=;
        b=ZY0yH9G39CVQUpDaLL9toxRy/myGoyzjyWAm4HT7mJH++wMY/tBldQFM+RKPcymdAZ
         KzAIKs7cSeBZBiC2aqkjqS6wa8vr9to9LyKjJTsnTaEUKtI5nBMFRLM7iSGvwpgFDbT1
         zfuAS+/cumxlef+9tpH0XI2Np3/gCZ8anbYX9Irq9muWQB1uQ4f3tGuv458ZUiQGph99
         3d58qbbxvL26QyV4fYUmHVjO6+cOwTogBO1l8sIvWbnJJGd7EiU0kttZApGKYddp5yZ3
         keZb1V59a+WN3jvYWLhmLiIs6yVZnA7VMd6/L9fItfhJdUxlTK3k0PsfRhJHMbJCZwt6
         zebg==
X-Gm-Message-State: AJIora9sIKhTXpweAiNThJbffCissY0QFRlox8c2SzgcOGVHw+em63/w
        vBHkP1WSZkklnYtZLf3ERwiIVA==
X-Google-Smtp-Source: AGRyM1tND5GT+yb5L04x1fke+kQEqtcJB0ya3ZoaIgOqV0BY17CV45HCwIzQ0KSchlXScp6uDYZgAw==
X-Received: by 2002:a17:90b:4f49:b0:1ed:55f:3b95 with SMTP id pj9-20020a17090b4f4900b001ed055f3b95mr6759354pjb.127.1656116002383;
        Fri, 24 Jun 2022 17:13:22 -0700 (PDT)
Received: from joebar-glaptop.lan (c-71-202-34-56.hsd1.ca.comcast.net. [71.202.34.56])
        by smtp.gmail.com with ESMTPSA id e14-20020a170902ef4e00b0016a275623c1sm2372303plx.219.2022.06.24.17.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 17:13:22 -0700 (PDT)
From:   "Joseph S. Barrera III" <joebar@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandru M Stan <amstan@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v12 2/5] arm64: dts: qcom: sc7180: Add quackingstick dts files
Date:   Fri, 24 Jun 2022 17:10:06 -0700
Message-Id: <20220624170802.v12.2.I0977b1a08830d0caa8bfb1bdedb4ecceac709a7f@changeid>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220625001009.417452-1-joebar@chromium.org>
References: <20220625001009.417452-1-joebar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quackingstick is a trogdor-based board. These dts files are copies from
the downstream Chrome OS 5.4 kernel, but with downstream bits removed.

Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>

---

(no changes since v8)

Changes in v8:
- Incorporate the deletion of the usb_c1 node from 9f9fb70a7294.

Changes in v7:
- Restore changes requested by Doug.
- Only include sc7180.dtsi in sc7180-trogdor.dtsi (19794489fa24).
- Simplify spi0/spi6 labeling (d277cab7afc7).
- Simplify trackpad enabling (51d30402be75).

Changes in v6:
- Accidentally deleted changes requested by Doug.

Changes in v5:
- Remove extra newline
- Add comment that compatible will be filled in per-board

Changes in v4:
- Add missing version history

Changes in v3:
- First inclusion in this series

 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../sc7180-trogdor-quackingstick-r0-lte.dts   |  38 +++
 .../qcom/sc7180-trogdor-quackingstick-r0.dts  |  26 ++
 .../qcom/sc7180-trogdor-quackingstick.dtsi    | 318 ++++++++++++++++++
 4 files changed, 384 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e4114e22548a..7268086f66e8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -81,6 +81,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r2-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r3-lte.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-quackingstick-r0.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-quackingstick-r0-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-wormdingler-rev0-boe.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-wormdingler-rev0-inx.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-wormdingler-rev1-boe.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dts
new file mode 100644
index 000000000000..35e8945fc56d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Quackingstick board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ *
+ * SKU: 0x600 => 1536
+ *  - bits 11..8: Panel ID: 0x6 (AUO)
+ */
+
+#include "sc7180-trogdor-quackingstick-r0.dts"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+/ {
+	model = "Google Quackingstick (rev0+) with LTE";
+	compatible = "google,quackingstick-sku1536", "qcom,sc7180";
+};
+
+&ap_sar_sensor {
+	compatible = "semtech,sx9324";
+	semtech,ph0-pin = <3 1 3>;
+	semtech,ph1-pin = <2 1 2>;
+	semtech,ph2-pin = <3 3 1>;
+	semtech,ph3-pin = <1 3 3>;
+	semtech,ph01-resolution = <1024>;
+	semtech,ph23-resolution = <1024>;
+	semtech,startup-sensor = <1>;
+	semtech,ph01-proxraw-strength = <3>;
+	semtech,ph23-proxraw-strength = <3>;
+	semtech,avg-pos-strength = <256>;
+
+	/delete-property/ svdd-supply;
+	vdd-supply = <&pp1800_prox>;
+};
+
+&ap_sar_sensor_i2c {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dts
new file mode 100644
index 000000000000..5c81e44ed4a5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Quackingstick board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ *
+ * SKU: 0x601 => 1537
+ *  - bits 11..8: Panel ID: 0x6 (AUO)
+ */
+
+#include "sc7180-trogdor-quackingstick.dtsi"
+
+/ {
+	model = "Google Quackingstick (rev0+)";
+	compatible = "google,quackingstick-sku1537", "qcom,sc7180";
+};
+
+&dsi_phy {
+	qcom,phy-rescode-offset-top = /bits/ 8 <(-13) (-13) (-13) (-13) (-13)>;
+	qcom,phy-rescode-offset-bot = /bits/ 8 <(-13) (-13) (-13) (-13) (-13)>;
+	qcom,phy-drive-ldo-level = <375>;
+};
+
+&panel {
+	compatible = "auo,b101uan08.3";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
new file mode 100644
index 000000000000..574b78eb4f28
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
@@ -0,0 +1,318 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Quackingstick board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor.dtsi"
+
+/* This board only has 1 USB Type-C port. */
+/delete-node/ &usb_c1;
+
+/ {
+	ppvar_lcd: ppvar-lcd {
+		compatible = "regulator-fixed";
+		regulator-name = "ppvar_lcd";
+
+		gpio = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ppvar_lcd_en>;
+
+		vin-supply = <&pp5000_a>;
+	};
+
+	v1p8_disp: v1p8-disp {
+		compatible = "regulator-fixed";
+		regulator-name = "v1p8_disp";
+
+		gpio = <&tlmm 86 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp1800_disp_on>;
+
+		vin-supply = <&pp3300_a>;
+	};
+};
+
+&backlight {
+	pwms = <&cros_ec_pwm 0>;
+};
+
+&camcc {
+	status = "okay";
+};
+
+&dsi0 {
+	panel: panel@0 {
+		/* Compatible will be filled in per-board */
+		reg = <0>;
+		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_rst>;
+		avdd-supply = <&ppvar_lcd>;
+		pp1800-supply = <&v1p8_disp>;
+		pp3300-supply = <&pp3300_dx_edp>;
+		backlight = <&backlight>;
+		rotation = <270>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				panel_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+		};
+	};
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&panel_in>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&gpio_keys {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	ap_ts: touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_l>, <&ts_reset_l>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+
+		post-power-on-delay-ms = <20>;
+		hid-descr-addr = <0x0001>;
+
+		vdd-supply = <&pp3300_ts>;
+	};
+};
+
+&sdhc_2 {
+	status = "okay";
+};
+
+&pp1800_uf_cam {
+	status = "okay";
+};
+
+&pp1800_wf_cam {
+	status = "okay";
+};
+
+&pp2800_uf_cam {
+	status = "okay";
+};
+
+&pp2800_wf_cam {
+	status = "okay";
+};
+
+/*
+ * No eDP on this board but it's logically the same signal so just give it
+ * a new name and assign the proper GPIO.
+ */
+pp3300_disp_on: &pp3300_dx_edp {
+	gpio = <&tlmm 67 GPIO_ACTIVE_HIGH>;
+};
+
+/* PINCTRL - modifications to sc7180-trogdor.dtsi */
+
+/*
+ * No eDP on this board but it's logically the same signal so just give it
+ * a new name and assign the proper GPIO.
+ */
+
+tp_en: &en_pp3300_dx_edp {
+	pinmux {
+		pins = "gpio67";
+	};
+
+	pinconf {
+		pins = "gpio67";
+	};
+};
+
+/* PINCTRL - board-specific pinctrl */
+
+&tlmm {
+	gpio-line-names = "HUB_RST_L",
+			  "AP_RAM_ID0",
+			  "AP_SKU_ID2",
+			  "AP_RAM_ID1",
+			  "",
+			  "AP_RAM_ID2",
+			  "UF_CAM_EN",
+			  "WF_CAM_EN",
+			  "TS_RESET_L",
+			  "TS_INT_L",
+			  "",
+			  "",
+			  "AP_EDP_BKLTEN",
+			  "UF_CAM_MCLK",
+			  "WF_CAM_CLK",
+			  "EDP_BRIJ_I2C_SDA",
+			  "EDP_BRIJ_I2C_SCL",
+			  "UF_CAM_SDA",
+			  "UF_CAM_SCL",
+			  "WF_CAM_SDA",
+			  "WF_CAM_SCL",
+			  "",
+			  "",
+			  "AMP_EN",
+			  "P_SENSOR_INT_L",
+			  "AP_SAR_SENSOR_SDA",
+			  "AP_SAR_SENSOR_SCL",
+			  "",
+			  "HP_IRQ",
+			  "WF_CAM_RST_L",
+			  "UF_CAM_RST_L",
+			  "AP_BRD_ID2",
+			  "",
+			  "AP_BRD_ID0",
+			  "AP_H1_SPI_MISO",
+			  "AP_H1_SPI_MOSI",
+			  "AP_H1_SPI_CLK",
+			  "AP_H1_SPI_CS_L",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "H1_AP_INT_ODL",
+			  "",
+			  "UART_AP_TX_DBG_RX",
+			  "UART_DBG_TX_AP_RX",
+			  "HP_I2C_SDA",
+			  "HP_I2C_SCL",
+			  "FORCED_USB_BOOT",
+			  "",
+			  "",
+			  "AMP_DIN",
+			  "PEN_DET_ODL",
+			  "HP_BCLK",
+			  "HP_LRCLK",
+			  "HP_DOUT",
+			  "HP_DIN",
+			  "HP_MCLK",
+			  "AP_SKU_ID0",
+			  "AP_EC_SPI_MISO",
+			  "AP_EC_SPI_MOSI",
+			  "AP_EC_SPI_CLK",
+			  "AP_EC_SPI_CS_L",
+			  "AP_SPI_CLK",
+			  "AP_SPI_MOSI",
+			  "AP_SPI_MISO",
+			  /*
+			   * AP_FLASH_WP_L is crossystem ABI. Schematics
+			   * call it BIOS_FLASH_WP_L.
+			   */
+			  "AP_FLASH_WP_L",
+			  "EN_PP3300_DX_EDP",
+			  "AP_SPI_CS0_L",
+			  "SD_CD_ODL",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "UIM2_DATA",
+			  "UIM2_CLK",
+			  "UIM2_RST",
+			  "UIM2_PRESENT_L",
+			  "UIM1_DATA",
+			  "UIM1_CLK",
+			  "UIM1_RST",
+			  "",
+			  "CODEC_PWR_EN",
+			  "HUB_EN",
+			  "",
+			  "PP1800_DISP_ON",
+			  "LCD_RST",
+			  "PPVAR_LCD_EN",
+			  "",
+			  "AP_SKU_ID1",
+			  "AP_RST_REQ",
+			  "",
+			  "AP_BRD_ID1",
+			  "AP_EC_INT_L",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "AP_TS_I2C_SDA",
+			  "AP_TS_I2C_SCL",
+			  "DP_HOT_PLUG_DET",
+			  "EC_IN_RW_ODL";
+
+	lcd_rst: lcd-rst {
+		pinmux {
+			pins = "gpio87";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio87";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	ppvar_lcd_en: ppvar-lcd-en {
+		pinmux {
+			pins = "gpio88";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio88";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	pp1800_disp_on: pp1800-disp-on {
+		pinmux {
+			pins = "gpio86";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio86";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+};
-- 
2.31.0

