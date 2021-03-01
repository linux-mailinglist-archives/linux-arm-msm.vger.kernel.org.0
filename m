Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC0A329402
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 22:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237430AbhCAVoX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 16:44:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240408AbhCAVmp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 16:42:45 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73113C061A86
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 13:35:04 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id q204so11350080pfq.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 13:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fjurcXM216amT7210txb64G64V6ZiCfzq1JqsNMQIVI=;
        b=M23wfjIem/EfkSDN8vSSr6ePUtqD9WSgofP5Oh9OP/sPBF3jI/WvB+kqloiLE7M0UE
         qqrTBPQbUydWlaG+WBg7ILd8MetBR288zUY61sBPkqqUgKwL0qvEuJRGwnjVw81Lcyyv
         Y5+JR5lFq9+Tz3KrIF12L4eidgRa3chJiNEsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fjurcXM216amT7210txb64G64V6ZiCfzq1JqsNMQIVI=;
        b=V9WGNOUEWz9UezRebakvlwMoY3j0jKflNsQEQTAbblGHKL75i9wECPyRkqFNYM2p2H
         Z4epc+oO4m5EXSY1Gm21bzo7a/TtJgItkGQiCYsBGVR2mPsXyX4kyDaW9BQ8gcQLx53C
         JJ1mwV19Z2/q+JUxk/PP0QeIr+f/QaaTIK2JPiAIG9BHf7wKqSmnASqblIo2MzfOgcn9
         lAoXWAJqlkhABPJaY33ACChQ7jsYIioWY86zzcSHjlm7N5Xs9qS3LHXxQCDrmHCLqCxA
         MdMHCQ/Pwam1RcVrF4b8ejP3zZwnscA2lTVxiiRW1FbL/oFqjC+PsDfbkD7FPq5nUXba
         D7dA==
X-Gm-Message-State: AOAM5317wJkS9CKAu/7lrJbU0hjrMJyLI0vGV+/36rkTq6/gE7YvI4Hq
        83sYsUkGkbDZ+L86vOuqYzZhow==
X-Google-Smtp-Source: ABdhPJwt6whBM0x/cZIogvdmab631CR4/pzYyvsd/I5xQR9vdZhgcQ4C0lUiDkyhZVhrewkpqcFR+g==
X-Received: by 2002:a63:d502:: with SMTP id c2mr15028215pgg.353.1614634504038;
        Mon, 01 Mar 2021 13:35:04 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:c086:5f6:85dd:98c8])
        by smtp.gmail.com with ESMTPSA id f13sm790366pjj.1.2021.03.01.13.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 13:35:03 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Philip Chen <philipchen@google.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/13] arm64: dts: qcom: Add sc7180-trogdor-pompom skus
Date:   Mon,  1 Mar 2021 13:34:36 -0800
Message-Id: <20210301133318.v2.12.If93a01b30d20dccacbad4be8ddc519dc20a51a1e@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210301213437.4165775-1-dianders@chromium.org>
References: <20210301213437.4165775-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a trogdor variant.  This is mostly a grab from the downstream
tree with notable exceptions:
- I skip -rev0.  This was a super early build and there's no advantage
  of long term support.
- In -rev1 I translate the handling of the USB hub like is done for
  similar boards.  See the difference between the downstream and
  upstream 'sc7180-trogdor-lazor-r0.dts' for an example.  This will
  need to be resolved when proper support for the USB hub is figured
  out upstream.
- I remove sound node since sound hasn't landed upstream yet.
- In incorporate the pending <https://crrev.com/c/2719075> for the
  keyboard.

Cc: Philip Chen <philipchen@google.com>
Cc: Matthias Kaehlcke <mka@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@chromium.org>
Cc: Judy Hsiao <judyhsiao@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2:
- Rebase atop commit 7822de1a2946 ("arm64:...1 for charger temperature")
- lazor => trogdor in subject

 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/sc7180-trogdor-pompom-r1-lte.dts |  14 +
 .../dts/qcom/sc7180-trogdor-pompom-r1.dts     |  26 ++
 .../dts/qcom/sc7180-trogdor-pompom-r2-lte.dts |  14 +
 .../dts/qcom/sc7180-trogdor-pompom-r2.dts     |  44 +++
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  | 288 ++++++++++++++++++
 6 files changed, 390 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index adc915a5f027..d7cdff3dad98 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -41,6 +41,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r3-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots-r4.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r1.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r1-lte.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r2-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-ganges-kirin.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dts
new file mode 100644
index 000000000000..0202f03eafe6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Pompom board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+#include "sc7180-trogdor-pompom-r1.dts"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+/ {
+	model = "Google Pompom (rev1) with LTE";
+	compatible = "google,pompom-rev1-sku0", "qcom,sc7180";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
new file mode 100644
index 000000000000..e720e7bd0d70
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Pompom board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-pompom.dtsi"
+
+/ {
+	model = "Google Pompom (rev1)";
+	compatible = "google,pompom-rev1", "qcom,sc7180";
+};
+
+&pp3300_hub {
+	/* pp3300_l7c is used to power the USB hub */
+	/delete-property/regulator-always-on;
+	/delete-property/regulator-boot-on;
+};
+
+&pp3300_l7c {
+	regulator-always-on;
+	regulator-boot-on;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts
new file mode 100644
index 000000000000..791d496ad046
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Pompom board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+#include "sc7180-trogdor-pompom-r2.dts"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+/ {
+	model = "Google Pompom (rev2+) with LTE";
+	compatible = "google,pompom-sku0", "qcom,sc7180";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
new file mode 100644
index 000000000000..984d7337da78
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Pompom board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-pompom.dtsi"
+
+/ {
+	model = "Google Pompom (rev2+)";
+	compatible = "google,pompom", "qcom,sc7180";
+};
+
+&keyboard_controller {
+	function-row-physmap = <
+		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
+		MATRIX_KEY(0x03, 0x02, 0)	/* T2 */
+		MATRIX_KEY(0x02, 0x02, 0)	/* T3 */
+		MATRIX_KEY(0x01, 0x02, 0)	/* T4 */
+		MATRIX_KEY(0x03, 0x04, 0)	/* T5 */
+		MATRIX_KEY(0x02, 0x04, 0)	/* T6 */
+		MATRIX_KEY(0x01, 0x04, 0)	/* T7 */
+		MATRIX_KEY(0x02, 0x09, 0)	/* T8 */
+		MATRIX_KEY(0x01, 0x09, 0)	/* T9 */
+		MATRIX_KEY(0x00, 0x04, 0)	/* T10 */
+	>;
+	linux,keymap = <
+		MATRIX_KEY(0x00, 0x02, KEY_BACK)
+		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
+		MATRIX_KEY(0x02, 0x02, KEY_ZOOM)
+		MATRIX_KEY(0x01, 0x02, KEY_SCALE)
+		MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
+		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
+		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
+		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
+		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
+		MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
+
+		CROS_STD_MAIN_KEYMAP
+	>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
new file mode 100644
index 000000000000..d253a08f6fc8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Pompom board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+#include "sc7180.dtsi"
+
+ap_ec_spi: &spi6 {};
+ap_h1_spi: &spi0 {};
+
+#include "sc7180-trogdor.dtsi"
+
+/ {
+	thermal-zones {
+		5v-choke-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <250>;
+
+			thermal-sensors = <&pm6150_adc_tm 1>;
+
+			trips {
+				5v-choke-crit {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&alc5682 {
+	realtek,dmic-clk-driving-high = "true";
+};
+
+&cpu6_alert0 {
+	temperature = <60000>;
+};
+
+&cpu6_alert1 {
+	temperature = <65000>;
+};
+
+&cpu6_thermal {
+	sustainable-power = <948>;
+};
+
+&cpu7_alert0 {
+	temperature = <60000>;
+};
+
+&cpu7_alert1 {
+	temperature = <65000>;
+};
+
+&cpu7_thermal {
+	sustainable-power = <948>;
+};
+
+&cpu8_alert0 {
+	temperature = <60000>;
+};
+
+&cpu8_alert1 {
+	temperature = <65000>;
+};
+
+&cpu8_thermal {
+	sustainable-power = <948>;
+};
+
+&cpu9_alert0 {
+	temperature = <60000>;
+};
+
+&cpu9_alert1 {
+	temperature = <65000>;
+};
+
+&cpu9_thermal {
+	sustainable-power = <948>;
+};
+
+&gpio_keys {
+	status = "okay";
+};
+
+ap_ts_pen_1v8: &i2c4 {
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
+&panel {
+	compatible = "kingdisplay,kd116n21-30nv-a010";
+};
+
+&pen_insert {
+	/* Insert = high, eject = low */
+	gpios = <&tlmm 52 GPIO_ACTIVE_HIGH>;
+};
+
+&pm6150_adc {
+	5v-choke-thermistor@4e {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+};
+
+&pm6150_adc_tm {
+	status = "okay";
+
+	5v-choke-thermistor@1 {
+		reg = <1>;
+		io-channels = <&pm6150_adc ADC5_AMUX_THM2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
+&sdhc_2 {
+	status = "okay";
+};
+
+&usb_c1 {
+	status = "disabled";
+};
+
+&wifi {
+	qcom,ath10k-calibration-variant = "GO_POMPOM";
+};
+
+/* PINCTRL - board-specific pinctrl */
+
+&tlmm {
+	gpio-line-names = "TP_INT_ODL",
+			  "AP_RAM_ID0",
+			  "AP_SKU_ID2",
+			  "AP_RAM_ID1",
+			  "",
+			  "AP_RAM_ID2",
+			  "AP_TP_I2C_SDA",
+			  "AP_TP_I2C_SCL",
+			  "TS_RESET_L",
+			  "TS_INT_L",
+			  "",
+			  "EDP_BRIJ_IRQ",
+			  "AP_EDP_BKLTEN",
+			  "",
+			  "",
+			  "EDP_BRIJ_I2C_SDA",
+			  "EDP_BRIJ_I2C_SCL",
+			  "HUB_RST_L",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "AMP_EN",
+			  "P_SENSOR_INT_L",
+			  "AP_SAR_SENSOR_SDA",
+			  "AP_SAR_SENSOR_SCL",
+			  "",
+			  "HP_IRQ",
+			  "",
+			  "EN_PP3300_DX_EDP",
+			  "AP_BRD_ID2",
+			  "BRIJ_SUSPEND",
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
+			  "AMP_BCLK",
+			  "AMP_LRCLK",
+			  "AMP_DIN",
+			  "PEN_PDCT_L",
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
+			  "SD_CD_ODL",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "UIM2_DATA",
+			  "UIM2_CLK",
+			  "UIM2_RST",
+			  "UIM2_PRESENT",
+			  "UIM1_DATA",
+			  "UIM1_CLK",
+			  "UIM1_RST",
+			  "",
+			  "EN_PP3300_CODEC",
+			  "EN_PP3300_HUB",
+			  "",
+			  "DMIC_SEL",
+			  "",
+			  "",
+			  "",
+			  "AP_SKU_ID1",
+			  "AP_RST_REQ",
+			  "",
+			  "AP_BRD_ID1",
+			  "AP_EC_INT_R_L",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "EDP_BRIJ_EN",
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
+			  "AP_TS_PEN_I2C_SDA",
+			  "AP_TS_PEN_I2C_SCL",
+			  "DP_HOT_PLUG_DET",
+			  "EC_IN_RW_ODL";
+
+	dmic_sel: dmic-sel {
+		pinmux {
+			pins = "gpio86";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio86";
+			bias-pull-down;
+		};
+	};
+};
-- 
2.30.1.766.gb4fecdf3b7-goog

