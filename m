Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA84256223
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 22:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgH1UkS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 16:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgH1UkC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 16:40:02 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E85C061232;
        Fri, 28 Aug 2020 13:40:02 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id 2so118756pjx.5;
        Fri, 28 Aug 2020 13:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5WMFzrNb9Ljl+Cp+A6l+ISHqclwT8ClYZpvGIEv4pRk=;
        b=sgo1zj+4Cn/9TNJBf+fC7czm84VL0cTaOX0kz5V7e4vtikzdXU/bq15NqbaEgm6ysU
         f575hkRDTkAaaVUgnuKKrhcRBbuyw2Z8wjSVcClWftJpEsd/bITyAT+w1RDwN6kbbl9x
         02OwYl27F0MqT34JXKtKFSgm/e/OKX4XW4cH93Te7qziKmRUFgk7U59sUFsA09MeEMPS
         ujHI75XIqd+f64t5n8iqwFp63pjfcv+PCOxfn40XUNdca3yWs38tfZV1I9XV0ENQ0vaa
         BvYOazngneLnfkB/Ur+9Fn+45LFQNup2gsZj8/DrhjMML8Eqa2H+2PQLXcyUTSmhkAzI
         b/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5WMFzrNb9Ljl+Cp+A6l+ISHqclwT8ClYZpvGIEv4pRk=;
        b=p7i01sguqmNqHiiLg2JtNQfnF3JvaszWIQmWDQ5FG5Lh9SvEj8q0AK6ErIJAkmWEf4
         yLBosoP5l81OHTycHPBAlx8UONlYLMQkjYf2qg1+Mja+QIoIxp0VjtGJuihyxMUVpsgk
         azxrGso7jxojxTEzcwZN/hMaNZhZ4xLOXog3a3TFEDEknne4zKvLk0Yh+x+bdr7+zBcm
         zB2wxf7s8hgMEVeEVYMHfa0AkC57w98LKNRvkfCpmV9xEYQoShd8pmhLfK1fEAKGA151
         qMwH/81kt3sDcCTv0To5qcUr8du0OiqdpcpnYVKPkWqD7FwUfaX2bsmuS0dUTV9XW+6J
         sgQQ==
X-Gm-Message-State: AOAM532aIvN8mDaSffvs9FG6kKanMWvm1p4hVnEoPr3/xQ2OBkLuk8R9
        g77T11RcJpZ96dJIxYCg+qWgv1GXM6rCOw==
X-Google-Smtp-Source: ABdhPJylXJ45zWpmljiJkTs1QVmtrWkj1XyPBOyxupYDIfHMnkRZLE1nbd4veoHVi1O1LlI6uZJ23Q==
X-Received: by 2002:a17:902:ed09:: with SMTP id b9mr525552pld.118.1598647199644;
        Fri, 28 Aug 2020 13:39:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id r33sm319468pgm.75.2020.08.28.13.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 13:39:58 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Atul Dhudase <adhudase@codeaurora.org>,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Alexandru Stan <amstan@chromium.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] arm64: dts: qcom: sc7180-trogdor: add initial trogdor and lazor dt
Date:   Fri, 28 Aug 2020 13:40:50 -0700
Message-Id: <20200828204052.2085508-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This is essentialy a squash of a bunch of history of trogdor and lazor
dt updates from the chromium kernel tree.

I don't claim any credit other than wanting to more easily boot upstream
kernel on these devices.

I've tried to add cc tags for all the original authors.

Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Cc: Atul Dhudase <adhudase@codeaurora.org>
Cc: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc: Evan Green <evgreen@chromium.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: Ajit Pandey <ajitp@codeaurora.org>
Cc: Alexandru Stan <amstan@chromium.org>
Cc: Sujit Kautkar <sujitka@chromium.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v2: update for Stephen and Doug's comments
v3: correct wifi node properly (Doug)

 arch/arm64/boot/dts/qcom/Makefile             |    5 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts |   24 +
 .../dts/qcom/sc7180-trogdor-lazor-r1-lte.dts  |   18 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts |   15 +
 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  192 +++
 .../boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi |   15 +
 .../boot/dts/qcom/sc7180-trogdor-r1-lte.dts   |   14 +
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  191 +++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 1348 +++++++++++++++++
 9 files changed, 1822 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index dc22d8a9fd2d..afee730d93e5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -20,6 +20,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r0.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-lte.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-ganges-kirin.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-discovery.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-pioneer.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
new file mode 100644
index 000000000000..ae4c23a4fe65
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-lazor.dtsi"
+
+/ {
+	model = "Google Lazor (rev0)";
+	compatible = "google,lazor-rev0", "qcom,sc7180";
+};
+
+&sn65dsi86_out {
+	/*
+	 * Lane 0 was incorrectly mapped on the cable, but we've now decided
+	 * that the cable is canon and in -rev1+ we'll make a board change
+	 * that means we no longer need the swizzle.
+	 */
+	lane-polarities = <1 0>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
new file mode 100644
index 000000000000..73e59cf7752a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+#include "sc7180-trogdor-lazor-r1.dts"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+/ {
+	model = "Google Lazor (rev1+) with LTE";
+	compatible = "google,lazor-sku0", "qcom,sc7180";
+};
+
+&keyboard_backlight {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
new file mode 100644
index 000000000000..3151ae31c1cc
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-lazor.dtsi"
+
+/ {
+	model = "Google Lazor (rev1+)";
+	compatible = "google,lazor", "qcom,sc7180";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
new file mode 100644
index 000000000000..180ef9e04306
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor board device tree source
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
+	panel: panel {
+		compatible = "boe,nv133fhm-n62";
+		power-supply = <&pp3300_dx_edp>;
+		backlight = <&backlight>;
+		hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			port {
+				panel_in_edp: endpoint {
+					remote-endpoint = <&sn65dsi86_out>;
+				};
+			};
+		};
+	};
+};
+
+&ap_sar_sensor {
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
+/* PINCTRL - modifications to sc7180-trogdor.dtsi */
+
+&ts_reset_l {
+	pinconf {
+		/* This pin is not connected on -rev0, pull up to park. */
+		/delete-property/bias-disable;
+		bias-pull-up;
+	};
+};
+
+/* PINCTRL - board-specific pinctrl */
+
+&tlmm {
+	gpio-line-names = "ESIM_MISO",
+			  "ESIM_MOSI",
+			  "ESIM_CLK",
+			  "ESIM_CS_L",
+			  "",
+			  "",
+			  "AP_TP_I2C_SDA",
+			  "AP_TP_I2C_SCL",
+			  "TS_RESET_L",
+			  "TS_INT_L",
+			  "",
+			  "EDP_BRIJ_IRQ",
+			  "AP_EDP_BKLTEN",
+			  "AP_RAM_ID2",
+			  "",
+			  "EDP_BRIJ_I2C_SDA",
+			  "EDP_BRIJ_I2C_SCL",
+			  "HUB_RST_L",
+			  "",
+			  "AP_RAM_ID1",
+			  "AP_SKU_ID2",
+			  "",
+			  "",
+			  "AMP_EN",
+			  "P_SENSOR_INT_L",
+			  "AP_SAR_SENSOR_SDA",
+			  "AP_SAR_SENSOR_SCL",
+			  "",
+			  "HP_IRQ",
+			  "AP_RAM_ID0",
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
+			  "",
+			  "",
+			  "AMP_DIN",
+			  "",
+			  "HP_BCLK",
+			  "HP_LRCLK",
+			  "HP_DOUT",
+			  "HP_DIN",
+			  "HP_MCLK",
+			  "TRACKPAD_INT_1V8_ODL",
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
+			  "DBG_SPI_HOLD_L",
+			  "AP_SPI_CS0_L",
+			  "",
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
+			  "",
+			  "",
+			  "",
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
+			  "EDP_BRIJ_EN",
+			  "AP_SKU_ID0",
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
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi
new file mode 100644
index 000000000000..44956e3165a1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Trogdor dts fragment for LTE SKUs
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+&ap_sar_sensor {
+	label = "proximity-wifi-lte";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/sc7180-trogdor/modem/mba.mbn",
+			"qcom/sc7180-trogdor/modem/qdsp6sw.mbn";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dts
new file mode 100644
index 000000000000..1123c02bd539
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Trogdor board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+#include "sc7180-trogdor-r1.dts"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+/ {
+	model = "Google Trogdor (rev1+) with LTE";
+	compatible = "google,trogdor-sku0", "qcom,sc7180";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
new file mode 100644
index 000000000000..0a281c24841c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Trogdor board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180.dtsi"
+
+ap_ec_spi: &spi6 {};
+ap_h1_spi: &spi0 {};
+
+#include "sc7180-trogdor.dtsi"
+
+/ {
+	model = "Google Trogdor (rev1+)";
+	compatible = "google,trogdor", "qcom,sc7180";
+
+	panel: panel {
+		compatible = "auo,b116xa01";
+		power-supply = <&pp3300_dx_edp>;
+		backlight = <&backlight>;
+		hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			port {
+				panel_in_edp: endpoint {
+					remote-endpoint = <&sn65dsi86_out>;
+				};
+			};
+		};
+	};
+};
+
+&ap_sar_sensor_i2c {
+	/* Not hooked up */
+	status = "disabled";
+};
+
+ap_ts_pen_1v8: &i2c4 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	ap_ts: touchscreen@10 {
+		compatible = "elan,ekth3500";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_l>, <&ts_reset_l>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc33-supply = <&pp3300_ts>;
+
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&sdhc_2 {
+	status = "okay";
+};
+
+/* PINCTRL - board-specific pinctrl */
+
+&tlmm {
+	gpio-line-names = "ESIM_MISO",
+			  "ESIM_MOSI",
+			  "ESIM_CLK",
+			  "ESIM_CS_L",
+			  "FP_TO_AP_IRQ_L",
+			  "FP_RST_L",
+			  "AP_TP_I2C_SDA",
+			  "AP_TP_I2C_SCL",
+			  "TS_RESET_L",
+			  "TS_INT_L",
+			  "FPMCU_BOOT0",
+			  "EDP_BRIJ_IRQ",
+			  "AP_EDP_BKLTEN",
+			  "",
+			  "",
+			  "EDP_BRIJ_I2C_SDA",
+			  "EDP_BRIJ_I2C_SCL",
+			  "HUB_RST_L",
+			  "PEN_RST_ODL",
+			  "AP_RAM_ID1",
+			  "AP_RAM_ID2",
+			  "PEN_IRQ_L",
+			  "FPMCU_SEL",
+			  "AMP_EN",
+			  "P_SENSOR_INT_L",
+			  "AP_SAR_SENSOR_SDA",
+			  "AP_SAR_SENSOR_SCL",
+			  "",
+			  "HP_IRQ",
+			  "AP_RAM_ID0",
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
+			  "",
+			  "",
+			  "AMP_DIN",
+			  "PEN_PDCT_L",
+			  "HP_BCLK",
+			  "HP_LRCLK",
+			  "HP_DOUT",
+			  "HP_DIN",
+			  "HP_MCLK",
+			  "TRACKPAD_INT_1V8_ODL",
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
+			  "DBG_SPI_HOLD_L",
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
+			  "AP_SPI_FP_MISO",
+			  "AP_SPI_FP_MOSI",
+			  "AP_SPI_FP_CLK",
+			  "AP_SPI_FP_CS_L",
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
+			  "EDP_BRIJ_EN",
+			  "AP_SKU_ID0",
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
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
new file mode 100644
index 000000000000..a6b9beb29be9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -0,0 +1,1348 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Trogdor device tree source (common between revisions)
+ *
+ * Copyright 2019 Google LLC.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+/* PMICs depend on spmi_bus label and so must come after SoC */
+#include "pm6150.dtsi"
+#include "pm6150l.dtsi"
+
+/*
+ * Reserved memory changes
+ *
+ * Delete all unused memory nodes and define the peripheral memory regions
+ * required by the board dts.
+ */
+
+/delete-node/ &hyp_mem;
+/delete-node/ &xbl_mem;
+/delete-node/ &aop_mem;
+/delete-node/ &sec_apps_mem;
+/delete-node/ &tz_mem;
+
+/* Increase the size from 2MB to 8MB */
+&rmtfs_mem {
+	reg = <0x0 0x84400000 0x0 0x800000>;
+};
+
+/ {
+	reserved-memory {
+		atf_mem: memory@80b00000 {
+			reg = <0x0 0x80b00000 0x0 0x100000>;
+			no-map;
+		};
+
+		mpss_mem: memory@86000000 {
+			reg = <0x0 0x86000000 0x0 0x8c00000>;
+			no-map;
+		};
+
+		camera_mem: memory@8ec00000 {
+			reg = <0x0 0x8ec00000 0x0 0x500000>;
+			no-map;
+		};
+
+		venus_mem: memory@8f600000 {
+			reg = <0 0x8f600000 0 0x500000>;
+			no-map;
+		};
+
+		wlan_mem: memory@94100000 {
+			reg = <0x0 0x94100000 0x0 0x200000>;
+			no-map;
+		};
+
+		mba_mem: memory@94400000 {
+			reg = <0x0 0x94400000 0x0 0x200000>;
+			no-map;
+		};
+	};
+
+	aliases {
+		bluetooth0 = &bluetooth;
+		hsuart0 = &uart3;
+		serial0 = &uart8;
+		wifi0 = &wifi;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	/* FIXED REGULATORS - parents above children */
+
+	/* This is the top level supply and variable voltage */
+	ppvar_sys: ppvar-sys-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "ppvar_sys";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	/* This divides ppvar_sys by 2, so voltage is variable */
+	src_vph_pwr: src-vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "src_vph_pwr";
+
+		/* EC turns on with switchcap_on; always on for AP */
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&ppvar_sys>;
+	};
+
+	pp5000_a: pp5000-a-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "pp5000_a";
+
+		/* EC turns on with en_pp5000_a; always on for AP */
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		vin-supply = <&ppvar_sys>;
+	};
+
+	pp3300_a: pp3300-a-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_a";
+
+		/* EC turns on with en_pp3300_a; always on for AP */
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		/*
+		 * Actually should be pp3300 but that's practically an alias for
+		 * pp3300_a so we use pp3300's vin-supply here to avoid one more
+		 * node.
+		 */
+		vin-supply = <&ppvar_sys>;
+	};
+
+	pp3300_audio:
+	pp3300_codec: pp3300-codec-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_codec";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 83 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&en_pp3300_codec>;
+
+		vin-supply = <&pp3300_a>;
+	};
+
+	pp3300_dx_edp:
+	pp3300_ts: pp3300-dx-edp-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_dx_edp";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 30 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&en_pp3300_dx_edp>;
+
+		vin-supply = <&pp3300_a>;
+	};
+
+	pp3300_fp_tp: pp3300-fp-tp-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_fp_tp";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		/* AP turns on with PP1800_VIO_OUT; always on for AP */
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&pp3300_a>;
+	};
+
+	/* BOARD-SPECIFIC TOP LEVEL NODES */
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+
+		pwms = <&cros_ec_pwm 1>;
+		enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+		power-supply = <&ppvar_sys>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ap_edp_bklten>;
+	};
+
+	gpio_keys: gpio-keys {
+		compatible = "gpio-keys";
+		status = "disabled";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pen_pdct_l>;
+
+		pen-insert {
+			label = "Pen Insert";
+
+			/* Insert = low, eject = high */
+			gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
+			linux,code = <SW_PEN_INSERTED>;
+			linux,input-type = <EV_SW>;
+			wakeup-source;
+		};
+	};
+
+	max98357a: audio-codec-0 {
+		compatible = "maxim,max98357a";
+		pinctrl-names = "default";
+		pinctrl-0 = <&amp_en>;
+		sdmode-gpios = <&tlmm 23 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+	};
+
+	pwmleds {
+		compatible = "pwm-leds";
+		keyboard_backlight: keyboard-backlight {
+			status = "disabled";
+			label = "cros_ec::kbd_backlight";
+			pwms = <&cros_ec_pwm 0>;
+			max-brightness = <1023>;
+		};
+	};
+};
+
+&qfprom {
+	vcc-supply = <&pp1800_l11a>;
+};
+
+&qspi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data01>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+
+		/* TODO: Increase frequency after testing */
+		spi-max-frequency = <25000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
+&apps_rsc {
+	pm6150-rpmh-regulators {
+		compatible = "qcom,pm6150-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vddpx_1:
+		vdd2:
+		pp1125_s1a: smps1 {
+			regulator-min-microvolt = <1128000>;
+			regulator-max-microvolt = <1128000>;
+		};
+
+		/*
+		 * pp2040_s5a (smps5) and pp1056_s4a (smps4) are just
+		 * inputs to other rails on AOP-managed PMICs on trogdor.
+		 * The system is already configured to manage these rails
+		 * automatically (enable when needed, adjust voltage for
+		 * headroom) so we won't specify anything here.
+		 *
+		 * NOTE: though the rails have a voltage implied by their
+		 * name, the automatic headroom calculation might not result
+		 * in them being that voltage.  ...and that's OK.
+		 * Specifically the only point of these rails is to provide
+		 * an input source for other rails and if we can satisify the
+		 * needs of those other rails with a lower source voltage then
+		 * we save power.
+		 */
+
+		pp1200_l1a: ldo1 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp1000_l2a: ldo2 {
+			regulator-min-microvolt = <944000>;
+			regulator-max-microvolt = <1056000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp1000_l3a: ldo3 {
+			regulator-min-microvolt = <968000>;
+			regulator-max-microvolt = <1064000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_qlink_lv:
+		vdd_qlink_lv_ck:
+		vdd_qusb_hs0_core:
+		vdd_ufs1_core:
+		vdda_mipi_csi0_0p9:
+		vdda_mipi_csi1_0p9:
+		vdda_mipi_csi2_0p9:
+		vdda_mipi_csi3_0p9:
+		vdda_mipi_dsi0_pll:
+		vdda_pll_cc_ebi01:
+		vdda_qrefs_0p9:
+		vdda_usb_ss_dp_core:
+		pp900_l4a: ldo4 {
+			regulator-min-microvolt = <824000>;
+			regulator-max-microvolt = <928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp2700_l5a: ldo5 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2704000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		ebi0_cal:
+		ebi1_cal:
+		vddio_ck_ebi0:
+		vddio_ck_ebi1:
+		vddio_ebi0:
+		vddq:
+		pp600_l6a: ldo6 {
+			regulator-min-microvolt = <568000>;
+			regulator-max-microvolt = <648000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_cx_wlan:
+		pp800_l9a: ldo9 {
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd1:
+		vddpx_3:
+		vddpx_7:
+		vio_in:
+		pp1800_l10a: ldo10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_qfprom:
+		vdda_apc1_cs_1p8:
+		vdda_qrefs_1p8:
+		vdda_qusb_hs0_1p8:
+		vddpx_11:
+		vreg_bb_clk:
+		pp1800_l11a: ldo11 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		mcp_vccq:
+		pp1800_l12a_r: ldo12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp1800_l13a: ldo13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp1800_prox:
+		pp1800_l14a: ldo14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp1800_alc5682:
+		pp1800_l15a: ldo15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp2700_l16a: ldo16 {
+			regulator-min-microvolt = <2496000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdda_qusb_hs0_3p1:
+		vdd_pdphy:
+		pp3100_l17a: ldo17 {
+			regulator-min-microvolt = <2920000>;
+			regulator-max-microvolt = <3232000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp1800_pen:
+		pp1800_l18a: ldo18 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		mcp_vcc:
+		pp2850_l19a: ldo19 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	pm6150l-rpmh-regulators {
+		compatible = "qcom,pm6150l-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		pp1300_s8c: smps8 {
+			regulator-min-microvolt = <1120000>;
+			regulator-max-microvolt = <1408000>;
+		};
+
+		pp1800_l1c: ldo1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_wcss_adc_dac:
+		pp1300_l2c: ldo2 {
+			regulator-min-microvolt = <1168000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp1200_brij:
+		vdd_ufs1_1p2:
+		vdda_csi0_1p25:
+		vdda_csi1_1p25:
+		vdda_csi2_1p25:
+		vdda_csi3_1p25:
+		vdda_hv_ebi0:
+		vdda_mipi_dsi0_1p2:
+		vdda_usb_ss_dp_1p2:
+		vddpx_10:
+		pp1200_l3c: ldo3 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		ld_pp1800_esim_l4c:
+		vddpx_5:
+		pp1800_l4c: ldo4 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vddpx_6:
+		pp1800_l5c: ldo5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vddpx_2:
+		ppvar_l6c: ldo6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp3300_hub:
+		pp3300_l7c: ldo7 {
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		pp1800_brij_vccio:
+		pp1800_edp_vpll:
+		pp1800_l8c: ldo8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp2950_l9c: ldo9 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <2952000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp3300_l10c: ldo10 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		pp3300_l11c: ldo11 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		src_vreg_bob: bob {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+};
+
+&ap_ec_spi {
+	status = "okay";
+	cros_ec: ec@0 {
+		compatible = "google,cros-ec-spi";
+		reg = <0>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <94 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ap_ec_int_l>;
+		spi-max-frequency = <3000000>;
+
+		cros_ec_pwm: ec-pwm {
+			compatible = "google,cros-ec-pwm";
+			#pwm-cells = <1>;
+		};
+
+		i2c_tunnel: i2c-tunnel {
+			compatible = "google,cros-ec-i2c-tunnel";
+			google,remote-bus = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		pdupdate {
+			compatible = "google,cros-ec-pd-update";
+		};
+
+		typec {
+			compatible = "google,cros-ec-typec";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			connector@0 {
+				compatible = "usb-c-connector";
+				reg = <0>;
+				label = "left";
+				power-role = "dual";
+				data-role = "host";
+				try-power-role = "source";
+			};
+
+			connector@1 {
+				compatible = "usb-c-connector";
+				reg = <1>;
+				label = "right";
+				power-role = "dual";
+				data-role = "host";
+				try-power-role = "source";
+			};
+		};
+	};
+};
+
+&ap_h1_spi {
+	status = "okay";
+	cr50: tpm@0 {
+		compatible = "google,cr50";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&h1_ap_int_odl>;
+		spi-max-frequency = <800000>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <42 IRQ_TYPE_EDGE_RISING>;
+	};
+};
+
+&dsi0 {
+	status = "okay";
+	vdda-supply = <&vdda_mipi_dsi0_1p2>;
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&sn65dsi86_in>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&dsi_phy {
+	status = "okay";
+	vdds-supply = <&vdda_mipi_dsi0_pll>;
+};
+
+edp_brij_i2c: &i2c2 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	sn65dsi86_bridge: bridge@2d {
+		compatible = "ti,sn65dsi86";
+		reg = <0x2d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&edp_brij_en>, <&edp_brij_irq>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
+
+		enable-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+
+		vpll-supply = <&pp1800_edp_vpll>;
+		vccio-supply = <&pp1800_brij_vccio>;
+		vcca-supply = <&pp1200_brij>;
+		vcc-supply = <&pp1200_brij>;
+
+		clocks = <&rpmhcc RPMH_LN_BB_CLK3>;
+		clock-names = "refclk";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sn65dsi86_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				sn65dsi86_out: endpoint {
+					data-lanes = <0 1>;
+					remote-endpoint = <&panel_in_edp>;
+				};
+			};
+		};
+	};
+};
+
+ap_sar_sensor_i2c: &i2c5 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	ap_sar_sensor: proximity@28 {
+		compatible = "semtech,sx9310";
+		reg = <0x28>;
+		#io-channel-cells = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&p_sensor_int_l>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&pp3300_a>;
+		svdd-supply = <&pp1800_prox>;
+
+		status = "disabled";
+		label = "proximity-wifi";
+	};
+};
+
+ap_tp_i2c: &i2c7 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	trackpad@15 {
+		compatible = "elan,ekth3000";
+		reg = <0x15>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_int_1v8_odl>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <58 IRQ_TYPE_EDGE_FALLING>;
+
+		vcc-supply = <&pp3300_fp_tp>;
+
+		wakeup-source;
+	};
+};
+
+hp_i2c: &i2c9 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	alc5682: codec@1a {
+		compatible = "realtek,rt5682i";
+		reg = <0x1a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_irq>;
+
+		#sound-dai-cells = <1>;
+
+		interrupt-parent = <&tlmm>;
+		/*
+		 * This will get ignored because the interrupt type
+		 * is set in rt5682.c.
+		 */
+		interrupts = <28 IRQ_TYPE_EDGE_BOTH>;
+
+		AVDD-supply = <&pp1800_alc5682>;
+		MICVDD-supply = <&pp3300_codec>;
+		VBAT-supply = <&pp3300_audio>;
+
+		realtek,dmic1-data-pin = <1>;
+		realtek,dmic1-clk-pin = <1>;
+		realtek,jd-src = <1>;
+	};
+};
+
+&ipa {
+	status = "okay";
+
+	/*
+	 * Trogdor doesn't have QHEE (Qualcomm's EL2 blob), so the
+	 * modem needs to cover certain init steps (GSI init), and
+	 * the AP needs to wait for it.
+	 */
+	modem-init;
+};
+
+&mdp {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&pm6150_pwrkey {
+	status = "disabled";
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	status = "okay";
+	compatible = "qcom,sc7180-mss-pil";
+	iommus = <&apps_smmu 0x461 0x0>, <&apps_smmu 0x444 0x3>;
+	memory-region = <&mba_mem &mpss_mem>;
+
+	/* This gets overridden for SKUs with LTE support. */
+	firmware-name = "qcom/sc7180-trogdor/modem-nolte/mba.mbn",
+			"qcom/sc7180-trogdor/modem-nolte/qdsp6sw.mbn";
+};
+
+&sdhc_1 {
+	status = "okay";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc1_on>;
+	pinctrl-1 = <&sdc1_off>;
+	vmmc-supply = <&mcp_vcc>;
+	vqmmc-supply = <&mcp_vccq>;
+};
+
+&sdhc_2 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_on>;
+	pinctrl-1 = <&sdc2_off>;
+	vmmc-supply = <&pp2950_l9c>;
+	vqmmc-supply = <&ppvar_l6c>;
+
+	cd-gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
+};
+
+ap_spi_fp: &spi10 {
+	cros_ec_fp: ec@0 {
+		compatible = "google,cros-ec-spi";
+		reg = <0>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&fp_to_ap_irq_l>, <&fp_rst_l>, <&fpmcu_boot0>, <&fpmcu_sel>;
+		spi-max-frequency = <3000000>;
+	};
+};
+
+#include <arm/cros-ec-keyboard.dtsi>
+#include <arm/cros-ec-sbs.dtsi>
+
+&uart3 {
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "qcom,wcn3991-bt";
+		vddio-supply = <&pp1800_l10a>;
+		vddxo-supply = <&pp1800_l1c>;
+		vddrf-supply = <&pp1300_l2c>;
+		vddch0-supply = <&pp3300_l10c>;
+		max-speed = <3200000>;
+		clocks = <&rpmhcc RPMH_RF_CLK2>;
+	};
+};
+
+&uart8 {
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+	vdd-supply = <&vdd_qusb_hs0_core>;
+	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
+	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
+	qcom,imp-res-offset-value = <8>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_15_PERCENT>;
+	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+	qcom,bias-ctrl-value = <0x22>;
+	qcom,charge-ctrl-value = <3>;
+	qcom,hsdisc-trim-value = <0>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+	vdda-phy-supply = <&vdda_usb_ss_dp_1p2>;
+	vdda-pll-supply = <&vdda_usb_ss_dp_core>;
+};
+
+&venus {
+	video-firmware {
+		iommus = <&apps_smmu 0x0c42 0x0>;
+	};
+};
+
+&wifi {
+	status = "okay";
+	vdd-0.8-cx-mx-supply = <&vdd_cx_wlan>;
+	vdd-1.8-xo-supply = <&pp1800_l1c>;
+	vdd-1.3-rfa-supply = <&pp1300_l2c>;
+	vdd-3.3-ch0-supply = <&pp3300_l10c>;
+	vdd-3.3-ch1-supply = <&pp3300_l11c>;
+
+	wifi-firmware {
+		iommus = <&apps_smmu 0xc2 0x1>;
+	};
+};
+
+/* PINCTRL - additions to nodes defined in sc7180.dtsi */
+
+&qspi_cs0 {
+	pinconf {
+		pins = "gpio68";
+		bias-disable;
+	};
+};
+
+&qspi_clk {
+	pinconf {
+		pins = "gpio63";
+		bias-disable;
+	};
+};
+
+&qspi_data01 {
+	pinconf {
+		pins = "gpio64", "gpio65";
+
+		/* High-Z when no transfers; nice to park the lines */
+		bias-pull-up;
+	};
+};
+
+&qup_i2c2_default {
+	pinconf {
+		pins = "gpio15", "gpio16";
+		drive-strength = <2>;
+
+		/* Has external pullup */
+		bias-disable;
+	};
+};
+
+&qup_i2c4_default {
+	pinconf {
+		pins = "gpio115", "gpio116";
+		drive-strength = <2>;
+
+		/* Has external pullup */
+		bias-disable;
+	};
+};
+
+&qup_i2c5_default {
+	pinconf {
+		pins = "gpio25", "gpio26";
+		drive-strength = <2>;
+
+		/* Has external pullup */
+		bias-disable;
+	};
+};
+
+&qup_i2c7_default {
+	pinconf {
+		pins = "gpio6", "gpio7";
+		drive-strength = <2>;
+
+		/* Has external pullup */
+		bias-disable;
+	};
+};
+
+&qup_i2c9_default {
+	pinconf {
+		pins = "gpio46", "gpio47";
+		drive-strength = <2>;
+
+		/* Has external pullup */
+		bias-disable;
+	};
+};
+
+&qup_spi0_default {
+	pinconf {
+		pins = "gpio34", "gpio35", "gpio36", "gpio37";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&qup_spi6_default {
+	pinconf {
+		pins = "gpio59", "gpio60", "gpio61", "gpio62";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&qup_spi10_default {
+	pinconf {
+		pins = "gpio86", "gpio87", "gpio88", "gpio89";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&qup_uart3_default {
+	pinconf-cts {
+		/*
+		 * Configure a pull-down on CTS to match the pull of
+		 * the Bluetooth module.
+		 */
+		pins = "gpio38";
+		bias-pull-down;
+	};
+
+	pinconf-rts-tx {
+		/* We'll drive RTS and TX, so no pull */
+		pins = "gpio39", "gpio40";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pinconf-rx {
+		/*
+		 * Configure a pull-up on RX. This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module is
+		 * in tri-state (module powered off or not driving the
+		 * signal yet).
+		 */
+		pins = "gpio41";
+		bias-pull-up;
+	};
+};
+
+&qup_uart8_default {
+	pinconf-tx {
+		pins = "gpio44";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pinconf-rx {
+		pins = "gpio45";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+/* PINCTRL - board-specific pinctrl */
+
+&pm6150_gpio {
+	status = "disabled"; /* No GPIOs are connected */
+};
+
+&pm6150l_gpio {
+	gpio-line-names = "AP_SUSPEND",
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
+			  "";
+};
+
+&tlmm {
+	/*
+	 * pinctrl settings for pins that have no real owners.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&bios_flash_wp_l>, <&ap_suspend_l_neuter>;
+
+	amp_en: amp-en {
+		pinmux {
+			pins = "gpio23";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio23";
+			bias-pull-down;
+		};
+	};
+
+	ap_ec_int_l: ap-ec-int-l {
+		pinmux {
+			pins = "gpio94";
+			function = "gpio";
+			input-enable;
+		};
+
+		pinconf {
+			pins = "gpio94";
+			bias-pull-up;
+		};
+	};
+
+	ap_edp_bklten: ap-edp-bklten {
+		pinmux {
+			pins = "gpio12";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio12";
+			drive-strength = <2>;
+			bias-disable;
+
+			/* Force backlight to be disabled to match state at boot. */
+			output-low;
+		};
+	};
+
+	ap_suspend_l_neuter: ap-suspend-l-neuter {
+		pinmux  {
+			pins = "gpio27";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio27";
+			bias-disable;
+		};
+	};
+
+	bios_flash_wp_l: bios-flash-wp-l {
+		pinmux {
+			pins = "gpio66";
+			function = "gpio";
+			input-enable;
+		};
+
+		pinconf {
+			pins = "gpio66";
+			bias-disable;
+		};
+	};
+
+	dp_hot_plug_det: dp-hot-plug-det {
+		 pinmux {
+			 pins = "gpio117";
+			 function = "dp_hot";
+		 };
+
+		 config {
+			 pins = "gpio117";
+			 bias-disable;
+			 input-enable;
+			 drive-strength = <2>;
+		 };
+	 };
+
+	edp_brij_en: edp-brij-en {
+		pinmux {
+			pins = "gpio104";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio104";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	edp_brij_irq: edp-brij-irq {
+		pinmux {
+			pins = "gpio11";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio11";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
+
+	en_pp3300_codec: en-pp3300-codec {
+		pinmux {
+			pins = "gpio83";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio83";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	en_pp3300_dx_edp: en-pp3300-dx-edp {
+		pinmux {
+			pins = "gpio30";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio30";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	fpmcu_boot0: fpmcu-boot0 {
+		pinmux {
+			pins = "gpio10";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio10";
+			bias-disable;
+			drive-strength = <2>;
+			output-low;
+		};
+	};
+
+	fpmcu_sel: fpmcu-sel {
+		pinmux {
+			pins = "gpio22";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio22";
+			bias-disable;
+			drive-strength = <2>;
+			output-high;
+		};
+	};
+
+	fp_rst_l: fp-rst-l {
+		pinmux {
+			pins = "gpio5";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio5";
+			bias-disable;
+			drive-strength = <2>;
+			output-high;
+		};
+	};
+
+	fp_to_ap_irq_l: fp-to-ap-irq-l {
+		pinmux {
+			pins = "gpio4";
+			function = "gpio";
+			input-enable;
+		};
+
+		pinconf {
+			pins = "gpio4";
+
+			/* Has external pullup */
+			bias-disable;
+		};
+	};
+
+
+	h1_ap_int_odl: h1-ap-int-odl {
+		pinmux {
+			pins = "gpio42";
+			function = "gpio";
+			input-enable;
+		};
+
+		pinconf {
+			pins = "gpio42";
+			bias-pull-up;
+		};
+	};
+
+	hp_irq: hp-irq {
+		pinmux {
+			pins = "gpio28";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio28";
+			bias-pull-up;
+		};
+	};
+
+	pen_irq_l: pen-irq-l {
+		pinmux {
+			pins = "gpio21";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio21";
+
+			/* Has external pullup */
+			bias-disable;
+		};
+	};
+
+	pen_pdct_l: pen-pdct-l {
+		pinmux {
+			pins = "gpio52";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio52";
+
+			/* Has external pullup */
+			bias-disable;
+		};
+	};
+
+	pen_rst_odl: pen-rst-odl {
+		pinmux  {
+			pins = "gpio18";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio18";
+			bias-disable;
+			drive-strength = <2>;
+
+			/*
+			 * The pen driver doesn't currently support
+			 * driving this reset line.  By specifying
+			 * output-high here we're relying on the fact
+			 * that this pin has a default pulldown at boot
+			 * (which makes sure the pen was in reset if it
+			 * was powered) and then we set it high here to
+			 * take it out of reset.  Better would be if the
+			 * pen driver could control this and we could
+			 * remove "output-high" here.
+			 */
+			output-high; /* TODO: Remove this? */
+		};
+	};
+
+	p_sensor_int_l: p-sensor-int-l {
+		pinmux {
+			pins = "gpio24";
+			function = "gpio";
+			input-enable;
+		};
+
+		pinconf {
+			pins = "gpio24";
+			bias-pull-up;
+		};
+	};
+
+	trackpad_int_1v8_odl: trackpad-int-1v8-odl {
+		pinmux {
+			pins = "gpio58";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio58";
+
+			/* Has external pullup */
+			bias-disable;
+		};
+	};
+
+	ts_int_l: ts-int-l {
+		pinmux  {
+			pins = "gpio9";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio9";
+			bias-pull-up;
+		};
+	};
+
+	ts_reset_l: ts-reset-l {
+		pinmux  {
+			pins = "gpio8";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio8";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
+};
-- 
2.26.2

