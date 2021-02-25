Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87087325978
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 23:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234498AbhBYWRR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 17:17:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbhBYWQM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 17:16:12 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55326C061A31
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:13:56 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id c19so4372498pjq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=edasQL3iebi6/3aJqNiazwoySFnc+bn60KJuQha0rXo=;
        b=XnAct1ixspItQwbWUnAngVLt7IZqrx7tmARD98Lrze/yTdUQGpbwCO/u7FH6/0guuH
         jbn0iMTIF/Ywy/aQ3ajScfgfzM2WmEGbFfsoyP3Ce1j4Cx66Y9O5LVlISewnfeyTCsGV
         el5R633FhruL8qHTWvwiBAQJKYTfVkFJsdP3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=edasQL3iebi6/3aJqNiazwoySFnc+bn60KJuQha0rXo=;
        b=XeooneHjiBoCmHomnksXX39+N+iypt5BwMaenLobbYfdQfy9JPD3wNscl0At0xSzh1
         wmAO56lqzlRiwL1ilCR/KyUkRHyZhLJhsScCVj5bHw2qYzgqL05RNU08LN8Fj5HU8N6M
         L7lC81LcbgFWf2ZFz9qSlxOIsIxEloa0RYLSTclbPZZ7ijEJjMh4j9AqhXYvoO+sIUsX
         e1hzXmJ4i/77F8pQGq94Kj55KCf/KnJKRYKkAK6HnZUMVxMFIAUtdHUYd9xEwSl6xV0N
         PGVf2F5Kbt/IysH57YPOsbRCcTRmRVrcVeUTUHEmgYtD1tEtHjiAChqpZCv9n/ic3Oc1
         4mMw==
X-Gm-Message-State: AOAM530sF3XLaw8YKGVU3fIJCM0LU8hFwZhkAUlpyQgasxTHRho/yqjX
        Fa1JxRrtfJn/exs8ohxvStT2cw==
X-Google-Smtp-Source: ABdhPJx9q+qj90AjTT7zfLR1NQHoi+NKIkZOmKzO+nf3FCnmAXX8WiKoRUpG0F9Dq7eEmCNKWf6ljw==
X-Received: by 2002:a17:902:c114:b029:e3:b2e7:d410 with SMTP id 20-20020a170902c114b02900e3b2e7d410mr215279pli.16.1614291235887;
        Thu, 25 Feb 2021 14:13:55 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:8414:45a5:94c4:d35d])
        by smtp.gmail.com with ESMTPSA id jt21sm6713301pjb.51.2021.02.25.14.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 14:13:55 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 13/13] arm64: dts: qcom: Add sc7180-lazor-coachz skus
Date:   Thu, 25 Feb 2021 14:13:10 -0800
Message-Id: <20210225141022.13.I3d1f5f8a3bf31e8014229df0d4cfdff20e9cc90f@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210225221310.1939599-1-dianders@chromium.org>
References: <20210225221310.1939599-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a trogdor variant.  This is mostly a grab from the downstream
tree with notable exceptions:
- I skip -rev0.  This was a super early build and there's no advantage
  of long term support.
- I remove sound node since sound hasn't landed upstream yet.

Cc: Gwendal Grignou <gwendal@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@chromium.org>
Cc: Judy Hsiao <judyhsiao@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
NOTE: technically the "google,cros-ec-mkbp-proximity" binding hasn't
landed upstream yet.  However it has a Reviewed-by from Rob and the
series in general sounds about ready to land.  If necessary it can be
removed / readded later.

 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/sc7180-trogdor-coachz-r1-lte.dts |  18 ++
 .../dts/qcom/sc7180-trogdor-coachz-r1.dts     | 154 +++++++++++
 .../dts/qcom/sc7180-trogdor-coachz-r2-lte.dts |  18 ++
 .../dts/qcom/sc7180-trogdor-coachz-r2.dts     |  15 ++
 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  | 249 ++++++++++++++++++
 6 files changed, 458 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d7cdff3dad98..a81966d59cf7 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -31,6 +31,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1-lte.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r2-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-kb.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts
new file mode 100644
index 000000000000..533c048903ea
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google CoachZ board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+#include "sc7180-trogdor-coachz-r1.dts"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+/ {
+	model = "Google CoachZ (rev1) with LTE";
+	compatible = "google,coachz-rev1-sku0", "qcom,sc7180";
+};
+
+&cros_ec_proximity {
+	label = "proximity-wifi-lte";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
new file mode 100644
index 000000000000..86619f6c1134
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google CoachZ board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-coachz.dtsi"
+
+/ {
+	model = "Google CoachZ (rev1)";
+	compatible = "google,coachz-rev1", "qcom,sc7180";
+};
+
+&tlmm {
+	gpio-line-names = "HUB_RST_L",
+			  "AP_RAM_ID0",
+			  "AP_SKU_ID2",
+			  "AP_RAM_ID1",
+			  "FP_TO_AP_IRQ_L",
+			  "AP_RAM_ID2",
+			  "UF_CAM_EN",
+			  "WF_CAM_EN",
+			  "TS_RESET_L",
+			  "TS_INT_L",
+			  "FPMCU_BOOT0",
+			  "EDP_BRIJ_IRQ",
+			  "AP_EDP_BKLTEN",
+			  "UF_CAM_MCLK",
+			  "WF_CAM_CLK",
+			  "EDP_BRIJ_I2C_SDA",
+			  "EDP_BRIJ_I2C_SCL",
+			  "UF_CAM_SDA",
+			  "UF_CAM_SCL",
+			  "WF_CAM_SDA",
+			  "WF_CAM_SCL",
+			  "WLC_IRQ",
+			  "FP_RST_L",
+			  "AMP_EN",
+			  "WLC_NRST",
+			  "AP_SAR_SENSOR_SDA",
+			  "AP_SAR_SENSOR_SCL",
+			  "",
+			  "",
+			  "WF_CAM_RST_L",
+			  "UF_CAM_RST_L",
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
+			  "",
+			  "",
+			  "FORCED_USB_BOOT",
+			  "AMP_BCLK",
+			  "AMP_LRCLK",
+			  "AMP_DIN",
+			  "EN_PP3300_DX_EDP",
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
+			  "FPMCU_SEL",
+			  "UIM2_DATA",
+			  "UIM2_CLK",
+			  "UIM2_RST",
+			  "UIM2_PRESENT_L",
+			  "UIM1_DATA",
+			  "UIM1_CLK",
+			  "UIM1_RST",
+			  "",
+			  "DMIC_CLK_EN",
+			  "HUB_EN",
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
+	dmic_clk_en: dmic_clk_en {
+		pinmux {
+			pins = "gpio83";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio83";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.dts
new file mode 100644
index 000000000000..6e7745801fae
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google CoachZ board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+#include "sc7180-trogdor-coachz-r2.dts"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+/ {
+	model = "Google CoachZ (rev2+) with LTE";
+	compatible = "google,coachz-sku0", "qcom,sc7180";
+};
+
+&cros_ec_proximity {
+	label = "proximity-wifi-lte";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts
new file mode 100644
index 000000000000..4f69b6ba299f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google CoachZ board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-coachz.dtsi"
+
+/ {
+	model = "Google CoachZ (rev2+)";
+	compatible = "google,coachz", "qcom,sc7180";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
new file mode 100644
index 000000000000..5def9953d82b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google CoachZ board device tree source
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
+/* Deleted nodes from trogdor.dtsi */
+
+/delete-node/ &alc5682;
+/delete-node/ &pp3300_codec;
+
+/ {
+	/* BOARD-SPECIFIC TOP LEVEL NODES */
+
+	adau7002: audio-codec-1 {
+		compatible = "adi,adau7002";
+		IOVDD-supply = <&pp1800_l15a>;
+		#sound-dai-cells = <0>;
+	};
+};
+
+&ap_spi_fp {
+	status = "okay";
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
+&cros_ec {
+	cros_ec_proximity: proximity {
+		compatible = "google,cros-ec-mkbp-proximity";
+		label = "proximity-wifi";
+	};
+};
+
+ap_ts_pen_1v8: &i2c4 {
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
+/*
+ * There's no SAR sensor, so i2c5 is re-purposed.  We leave the
+ * proximity@28 node under i2c5 (from trogdor.dtsi) since it's "disabled"
+ * and doesn't hurt.
+ */
+i2c_wlc: &i2c5 {
+	/* Currently not connected to anything; see b/168652326 */
+};
+
+&i2c7 {
+	status = "disabled";
+};
+
+&i2c9 {
+	status = "disabled";
+};
+
+&panel {
+	compatible = "boe,nv110wtm-n61";
+};
+
+&pp3300_dx_edp {
+	gpio = <&tlmm 67 GPIO_ACTIVE_HIGH>;
+};
+
+&sdhc_2 {
+	status = "okay";
+};
+
+&sn65dsi86_out {
+	data-lanes = <0 1 2 3>;
+};
+
+/* PINCTRL - modifications to sc7180-trogdor.dtsi */
+
+&en_pp3300_dx_edp {
+	pinmux  {
+		pins = "gpio67";
+	};
+
+	pinconf {
+		pins = "gpio67";
+	};
+};
+
+&ts_reset_l {
+	pinconf {
+		/*
+		 * We want reset state by default and it will be up to the
+		 * driver to disable this when it's ready.
+		 */
+		output-low;
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
+			  "FP_TO_AP_IRQ_L",
+			  "AP_RAM_ID2",
+			  "UF_CAM_EN",
+			  "WF_CAM_EN",
+			  "TS_RESET_L",
+			  "TS_INT_L",
+			  "FPMCU_BOOT0",
+			  "EDP_BRIJ_IRQ",
+			  "AP_EDP_BKLTEN",
+			  "UF_CAM_MCLK",
+			  "WF_CAM_CLK",
+			  "EDP_BRIJ_I2C_SDA",
+			  "EDP_BRIJ_I2C_SCL",
+			  "UF_CAM_SDA",
+			  "UF_CAM_SCL",
+			  "WF_CAM_SDA",
+			  "WF_CAM_SCL",
+			  "WLC_IRQ",
+			  "FP_RST_L",
+			  "AMP_EN",
+			  "WLC_NRST",
+			  "AP_SAR_SENSOR_SDA",
+			  "AP_SAR_SENSOR_SCL",
+			  "",
+			  "",
+			  "WF_CAM_RST_L",
+			  "UF_CAM_RST_L",
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
+			  "",
+			  "",
+			  "FORCED_USB_BOOT",
+			  "AMP_BCLK",
+			  "AMP_LRCLK",
+			  "AMP_DIN",
+			  "",
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
+			  "EN_FP_RAILS",
+			  "UIM2_DATA",
+			  "UIM2_CLK",
+			  "UIM2_RST",
+			  "UIM2_PRESENT_L",
+			  "UIM1_DATA",
+			  "UIM1_CLK",
+			  "UIM1_RST",
+			  "",
+			  "",
+			  "HUB_EN",
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
+};
-- 
2.30.1.766.gb4fecdf3b7-goog

