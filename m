Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE5355A55D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jun 2022 02:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbiFYANc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 20:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232020AbiFYAN1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 20:13:27 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 713692BB0D
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 17:13:24 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id m14so3395457plg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 17:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mr7cpuqmRn6xpaNrj0168JJ9U51NmQAWQUP19BgumiU=;
        b=TIPZD14/vbtXdvvDsRASOj9qADAFNrSTkS355I0R/mbHn52vmrD2wacbX5vQStnHAx
         nqB9s0gyyWLwKLdQgaNU5JZ5dFwVT2y6/y7UObrCzFXj7L/AGgZX4jpEzkeQkE6kr0NM
         6EANRhD2GIfFTD+D8KnrpYoJBP80MTV50GbUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mr7cpuqmRn6xpaNrj0168JJ9U51NmQAWQUP19BgumiU=;
        b=qlqXwG1JlGFa53yoPGa2OMtHsRnAEyDxLMp02HI8XS0rij4huKpRduKCo99eYUjmW/
         8ypZbkWYcue7Wj9CdPGf03FckqgKWkjLGRK7KSNaTchgi342mtInvIWlF9iTc9au9fDx
         Uj6NWG+cw90JeDWTlZhRd2XHrs6u1dqQdBFaUB1L/cjKx+509fEPzUhiQ83KWzdNcUpb
         cp9YO447BXFq0ymp+jC5uMfdS1ioiQnh3QqTomyixM0c1XfJDLSkbvPkokOk4rqcVyLY
         nFEHcv9/eh55kzU5mfJcEtpVRno91l6MDW3pENpIu07ZPBvLJlBBvVXoNNGUgLOhmWl3
         Qybw==
X-Gm-Message-State: AJIora9aP3q7hZQ2qjG6/vSPsLlnrNKYResbkeo8Yq7BmMHp/dKKQUBU
        O6NCN1waMk8OVRbjyWQL9fFvvw==
X-Google-Smtp-Source: AGRyM1vR2L4My16Eofl5cVXknbM8NGw8OmNO/q+DZpRDE54kmtjCARnZPZxVWzWkkQo1QE/OXYIP6A==
X-Received: by 2002:a17:90a:bf86:b0:1ec:cc6d:c0f with SMTP id d6-20020a17090abf8600b001eccc6d0c0fmr1567817pjs.202.1656116003665;
        Fri, 24 Jun 2022 17:13:23 -0700 (PDT)
Received: from joebar-glaptop.lan (c-71-202-34-56.hsd1.ca.comcast.net. [71.202.34.56])
        by smtp.gmail.com with ESMTPSA id e14-20020a170902ef4e00b0016a275623c1sm2372303plx.219.2022.06.24.17.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 17:13:23 -0700 (PDT)
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
Subject: [PATCH v12 3/5] arm64: dts: qcom: sc7180: Add mrbland dts files
Date:   Fri, 24 Jun 2022 17:10:07 -0700
Message-Id: <20220624170802.v12.3.I71176ebf7e5aebddb211f00e805b32c08376d1be@changeid>
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

Mrbland is a trogdor-based board. These dts files are copies from
the downstream Chrome OS 5.4 kernel, but with downstream bits removed.

Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
---

(no changes since v7)

Changes in v7:
- Restore mrbland patch.
- Only include sc7180.dtsi in sc7180-trogdor.dtsi (19794489fa24).
- Simplify spi0/spi6 labeling (d277cab7afc7).
- Simplify trackpad enabling (51d30402be75).

Changes in v6:
- Remove mrbland patch.

Changes in v5:
- Replace _ in node name with -
- Order nodes by name.
- Add comment that compatible will be filled in per-board.

Changes in v4:
- Add missing version history

Changes in v2:
- Add word wrapping to patch description.
- Remove "Author" from patch description.
- Fix whitespace around "en_pp3300_dx_edp".

 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../qcom/sc7180-trogdor-mrbland-rev0-auo.dts  |  22 ++
 .../qcom/sc7180-trogdor-mrbland-rev0-boe.dts  |  22 ++
 .../dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi |  53 +++
 .../qcom/sc7180-trogdor-mrbland-rev1-auo.dts  |  22 ++
 .../qcom/sc7180-trogdor-mrbland-rev1-boe.dts  |  24 ++
 .../boot/dts/qcom/sc7180-trogdor-mrbland.dtsi | 344 ++++++++++++++++++
 7 files changed, 491 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 7268086f66e8..5cfd6316768c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -75,6 +75,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-r9.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots-r4.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots-r5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots-r9.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-mrbland-rev0-auo.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-mrbland-rev0-boe.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-mrbland-rev1-auo.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-mrbland-rev1-boe.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r2.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dts
new file mode 100644
index 000000000000..2767817fb053
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Mrbland board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ *
+ * SKU: 0x0 => 0
+ *  - bits 7..4: Panel ID: 0x0 (AUO)
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-mrbland-rev0.dtsi"
+
+/ {
+	model = "Google Mrbland rev0 AUO panel board";
+	compatible = "google,mrbland-rev0-sku0", "qcom,sc7180";
+};
+
+&panel {
+	compatible = "auo,b101uan08.3";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dts
new file mode 100644
index 000000000000..711485574a03
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Mrbland board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ *
+ * SKU: 0x10 => 16
+ *  - bits 7..4: Panel ID: 0x1 (BOE)
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-mrbland-rev0.dtsi"
+
+/ {
+	model = "Google Mrbland rev0 BOE panel board";
+	compatible = "google,mrbland-rev0-sku16", "qcom,sc7180";
+};
+
+&panel {
+	compatible = "boe,tv101wum-n53";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi
new file mode 100644
index 000000000000..7bc8402c018e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Mrbland board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ *
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-mrbland.dtsi"
+
+&avdd_lcd {
+	gpio = <&tlmm 80 GPIO_ACTIVE_HIGH>;
+};
+
+&panel {
+	enable-gpios = <&tlmm 76 GPIO_ACTIVE_HIGH>;
+};
+
+&v1p8_mipi {
+	gpio = <&tlmm 81 GPIO_ACTIVE_HIGH>;
+};
+
+/* PINCTRL - modifications to sc7180-trogdor-mrbland.dtsi */
+&avdd_lcd_en {
+	pinmux {
+		pins = "gpio80";
+	};
+
+	pinconf {
+		pins = "gpio80";
+	};
+};
+
+&mipi_1800_en {
+	pinmux {
+		pins = "gpio81";
+	};
+
+	pinconf {
+		pins = "gpio81";
+	};
+};
+&vdd_reset_1800 {
+	pinmux {
+		pins = "gpio76";
+	};
+
+	pinconf {
+		pins = "gpio76";
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dts
new file mode 100644
index 000000000000..275313ef7554
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Mrbland board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ *
+ * SKU: 0x600 => 1536
+ *  - bits 11..8: Panel ID: 0x6 (AUO)
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-mrbland.dtsi"
+
+/ {
+	model = "Google Mrbland rev1+ AUO panel board";
+	compatible = "google,mrbland-sku1536", "qcom,sc7180";
+};
+
+&panel {
+	compatible = "auo,b101uan08.3";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dts
new file mode 100644
index 000000000000..87c6b6c30b5e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Mrbland board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ *
+ * SKU: 0x300 => 768
+ *  - bits 11..8: Panel ID: 0x3 (BOE)
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-mrbland.dtsi"
+
+/ {
+	model = "Google Mrbland (rev1 - 2) BOE panel board";
+	/* Uses ID 768 on rev1 and 1024 on rev2+ */
+	compatible = "google,mrbland-sku1024", "google,mrbland-sku768",
+		"qcom,sc7180";
+};
+
+&panel {
+	compatible = "boe,tv101wum-n53";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi
new file mode 100644
index 000000000000..33d1d8a29038
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi
@@ -0,0 +1,344 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Mrbland board device tree source
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
+	avdd_lcd: avdd-lcd {
+		compatible = "regulator-fixed";
+		regulator-name = "avdd_lcd";
+
+		gpio = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&avdd_lcd_en>;
+
+		vin-supply = <&pp5000_a>;
+	};
+
+	avee_lcd: avee-lcd {
+		compatible = "regulator-fixed";
+		regulator-name = "avee_lcd";
+
+		gpio = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&avee_lcd_en>;
+
+		vin-supply = <&pp5000_a>;
+	};
+
+	v1p8_mipi: v1p8-mipi {
+		compatible = "regulator-fixed";
+		regulator-name = "v1p8_mipi";
+
+		gpio = <&tlmm 86 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&mipi_1800_en>;
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
+
+	panel: panel@0 {
+		/* Compatible will be filled in per-board */
+		reg = <0>;
+		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vdd_reset_1800>;
+		avdd-supply = <&avdd_lcd>;
+		avee-supply = <&avee_lcd>;
+		pp1800-supply = <&v1p8_mipi>;
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
+	ap_ts: touchscreen@5d {
+		compatible = "goodix,gt7375p";
+		reg = <0x5d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_l>, <&ts_reset_l>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+
+		vdd-supply = <&pp3300_ts>;
+	};
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
+&wifi {
+	qcom,ath10k-calibration-variant = "GO_MRBLAND";
+};
+
+/*
+ * No eDP on this board but it's logically the same signal so just give it
+ * a new name and assign the proper GPIO.
+ */
+pp3300_disp_on: &pp3300_dx_edp {
+	gpio = <&tlmm 85 GPIO_ACTIVE_HIGH>;
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
+		pins = "gpio85";
+	};
+
+	pinconf {
+		pins = "gpio85";
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
+			  "",
+			  "",
+			  "UF_CAM_SDA",
+			  "UF_CAM_SCL",
+			  "WF_CAM_SDA",
+			  "WF_CAM_SCL",
+			  "AVEE_LCD_EN",
+			  "",
+			  "AMP_EN",
+			  "",
+			  "",
+			  "",
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
+			  "BT_UART_CTS",
+			  "BT_UART_RTS",
+			  "BT_UART_TXD",
+			  "BT_UART_RXD",
+			  "H1_AP_INT_ODL",
+			  "",
+			  "UART_AP_TX_DBG_RX",
+			  "UART_DBG_TX_AP_RX",
+			  "HP_I2C_SDA",
+			  "HP_I2C_SCL",
+			  "FORCED_USB_BOOT",
+			  "AMP_BCLK",
+			  "AMP_LRCLK",
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
+			  "",
+			  "AP_SPI_CS0_L",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "WLAN_SW_CTRL",
+			  "",
+			  "REPORT_E",
+			  "",
+			  "ID0",
+			  "",
+			  "ID1",
+			  "",
+			  "",
+			  "",
+			  "CODEC_PWR_EN",
+			  "HUB_EN",
+			  "TP_EN",
+			  "MIPI_1.8V_EN",
+			  "VDD_RESET_1.8V",
+			  "AVDD_LCD_EN",
+			  "",
+			  "AP_SKU_ID1",
+			  "AP_RST_REQ",
+			  "",
+			  "AP_BRD_ID1",
+			  "AP_EC_INT_L",
+			  "SDM_GRFC_3",
+			  "",
+			  "",
+			  "BOOT_CONFIG_4",
+			  "BOOT_CONFIG_2",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "BOOT_CONFIG_3",
+			  "WCI2_LTE_COEX_TXD",
+			  "WCI2_LTE_COEX_RXD",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "FORCED_USB_BOOT_POL",
+			  "AP_TS_PEN_I2C_SDA",
+			  "AP_TS_PEN_I2C_SCL",
+			  "DP_HOT_PLUG_DET",
+			  "EC_IN_RW_ODL";
+
+	avdd_lcd_en: avdd-lcd-en {
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
+	avee_lcd_en: avee-lcd-en {
+		pinmux {
+			pins = "gpio21";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio21";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	mipi_1800_en: mipi-1800-en {
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
+
+	vdd_reset_1800: vdd-reset-1800 {
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
+};
-- 
2.31.0

