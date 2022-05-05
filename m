Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 874FA51C672
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 19:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377079AbiEERrX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 13:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382861AbiEERrO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 13:47:14 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D5327B2A
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 10:43:33 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id cq17-20020a17090af99100b001dc0386cd8fso4721440pjb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 10:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NQfFt3HaBAioonm8VTKsJgtS3lpy2wAUQ+cM79qV71A=;
        b=WHGV30FcJ9QXGwlNy9NQ818aOd+zCCtzQKwWTfDpfgjIqf5UNb3qWYknniF19FbsJe
         emGjDd/ktzn3hm/eJHzC6cQQb5LwUHkE3jqc8T6j0VhoBFR3ZCKZime2om2p0xd5Bkgh
         ++s2BwD37u/uwZm0J+c3U9wLnn+1Paa0O7/MM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NQfFt3HaBAioonm8VTKsJgtS3lpy2wAUQ+cM79qV71A=;
        b=ho2i8vicZ8fU97nBDKGTR+nyOe7zI1Gduv4/xXCE0Jwcyoza5l/26cIZR0SlqPhA3H
         VXXF+Zb/IVv+XH3ImREW0CuZRjaEH9dw+IM/pSOEG1IOtJp+lsDu4tTU+2WXyKyZoGXu
         UXi1ngV3vt6hBOBt4r2VevZ0FUgP4nr+/VJaQ8yZ5JNyhtos7Wps+wZtLJJsNtDgTpvj
         A/SpE23y5yKc8KH4QPsaPVFAE/DkBMgZurhDd4UkRYG3MVeWr+JwOiuUQUpnOFRtnMkG
         Wli3lslZJ4cH2Wdg/BHo5LCIoztr3HtHNTsprXxb1RVoE7u/fLfbvDDvKwoO1QwFpk10
         U1ug==
X-Gm-Message-State: AOAM532A4eHHIxj1raqVsSbNYLeLJ6s7B8/rtuDP/FYU8IdPxOD7pySR
        ax2nJTY06A+RIublFzSxuUKtAA==
X-Google-Smtp-Source: ABdhPJwlqXlYXMIoPvcPQ7XNSTA0WwLa3NuXxMOnM6dQT57CNuqNMtwVV0GrdF3vKHAUD/4oLacCyQ==
X-Received: by 2002:a17:902:ab04:b0:156:1517:411a with SMTP id ik4-20020a170902ab0400b001561517411amr28286302plb.128.1651772613049;
        Thu, 05 May 2022 10:43:33 -0700 (PDT)
Received: from joebar-glaptop.lan (c-71-202-34-56.hsd1.ca.comcast.net. [71.202.34.56])
        by smtp.gmail.com with ESMTPSA id a6-20020a636606000000b003c60b1f0dbasm1599928pgc.35.2022.05.05.10.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 10:43:32 -0700 (PDT)
From:   "Joseph S. Barrera III" <joebar@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 5/5] arm64: dts: qcom: sc7180: Add kingoftown dts files
Date:   Thu,  5 May 2022 10:41:16 -0700
Message-Id: <20220505104024.v4.5.Ib62291487a664a65066d18a3e83c5428a6d2cc6c@changeid>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220505104024.v4.1.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
References: <20220505104024.v4.1.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Kingoftown is a trogdor-based board. These dts files are unchanged copies
from the downstream Chrome OS 5.4 kernel.

Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Fixed description (no downstream bits removed).
- Added missing version history.

Changes in v3:
- None

Changes in v2:
- First inclusion in series.

 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../dts/qcom/sc7180-trogdor-kingoftown-r0.dts |  44 ++++
 .../dts/qcom/sc7180-trogdor-kingoftown-r1.dts |  17 ++
 .../dts/qcom/sc7180-trogdor-kingoftown.dtsi   | 223 ++++++++++++++++++
 4 files changed, 286 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index dc26704dfe34..a9f2ad013179 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -60,6 +60,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r3-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-homestar-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-homestar-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-homestar-r4.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-kingoftown-r0.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-kingoftown-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-kb.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts
new file mode 100644
index 000000000000..85aec1be98fc
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Kingoftown board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180.dtsi"
+#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
+#include "sc7180-trogdor-kingoftown.dtsi"
+
+/ {
+	model = "Google Kingoftown (rev0)";
+	compatible = "google,kingoftown-rev0", "qcom,sc7180";
+};
+
+/*
+ * In rev1+, the enable pin of pp3300_fp_tp will be tied to pp1800_l10a
+ * power rail instead, since kingoftown does not have FP.
+ */
+&pp3300_fp_tp {
+	gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
+	enable-active-high;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&en_fp_rails>;
+};
+
+&tlmm {
+	en_fp_rails: en-fp-rails {
+		pinmux {
+			pins = "gpio74";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio74";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dts
new file mode 100644
index 000000000000..2be9138ba89f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Kingoftown board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180.dtsi"
+#include "sc7180-trogdor-parade-ps8640.dtsi"
+#include "sc7180-trogdor-kingoftown.dtsi"
+
+/ {
+	model = "Google Kingoftown (rev1+)";
+	compatible = "google,kingoftown", "qcom,sc7180";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtsi
new file mode 100644
index 000000000000..e7503a5b0403
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtsi
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Kingoftown board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+ap_ec_spi: &spi6 {};
+ap_h1_spi: &spi0 {};
+
+#include "sc7180-trogdor.dtsi"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+&alc5682 {
+	compatible = "realtek,rt5682s";
+	realtek,dmic1-clk-pin = <2>;
+	realtek,dmic-clk-rate-hz = <2048000>;
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
+&keyboard_controller {
+	function-row-physmap = <
+		MATRIX_KEY(0x00, 0x02, 0)       /* T1 */
+		MATRIX_KEY(0x03, 0x02, 0)       /* T2 */
+		MATRIX_KEY(0x02, 0x02, 0)       /* T3 */
+		MATRIX_KEY(0x01, 0x02, 0)       /* T4 */
+		MATRIX_KEY(0x03, 0x04, 0)       /* T5 */
+		MATRIX_KEY(0x02, 0x04, 0)       /* T6 */
+		MATRIX_KEY(0x01, 0x04, 0)       /* T7 */
+		MATRIX_KEY(0x02, 0x09, 0)       /* T8 */
+		MATRIX_KEY(0x01, 0x09, 0)       /* T9 */
+		MATRIX_KEY(0x00, 0x04, 0)       /* T10 */
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
+
+&panel {
+	compatible = "edp-panel";
+};
+
+&pp3300_dx_edp {
+	gpio = <&tlmm 67 GPIO_ACTIVE_HIGH>;
+};
+
+&sound {
+	compatible = "google,sc7180-trogdor";
+	model = "sc7180-rt5682s-max98357a-1mic";
+};
+
+&wifi {
+	qcom,ath10k-calibration-variant = "GO_KINGOFTOWN";
+};
+
+/* PINCTRL - modifications to sc7180-trogdor.dtsi */
+
+&en_pp3300_dx_edp {
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
+	gpio-line-names = "TP_INT_L",		/* 0 */
+			  "AP_RAM_ID0",
+			  "AP_SKU_ID2",
+			  "AP_RAM_ID1",
+			  "",
+			  "AP_RAM_ID2",
+			  "AP_TP_I2C_SDA",
+			  "AP_TP_I2C_SCL",
+			  "TS_RESET_L",
+			  "TS_INT_L",
+			  "",			/* 10 */
+			  "EDP_BRIJ_IRQ",
+			  "AP_EDP_BKLTEN",
+			  "",
+			  "",
+			  "EDP_BRIJ_I2C_SDA",
+			  "EDP_BRIJ_I2C_SCL",
+			  "HUB_RST_L",
+			  "",
+			  "",
+			  "",			/* 20 */
+			  "",
+			  "",
+			  "AMP_EN",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "HP_IRQ",
+			  "",
+			  "",			/* 30 */
+			  "AP_BRD_ID2",
+			  "BRIJ_SUSPEND",
+			  "AP_BRD_ID0",
+			  "AP_H1_SPI_MISO",
+			  "AP_H1_SPI_MOSI",
+			  "AP_H1_SPI_CLK",
+			  "AP_H1_SPI_CS_L",
+			  "BT_UART_CTS",
+			  "BT_UART_RTS",
+			  "BT_UART_TXD",	/* 40 */
+			  "BT_UART_RXD",
+			  "H1_AP_INT_ODL",
+			  "",
+			  "UART_AP_TX_DBG_RX",
+			  "UART_DBG_TX_AP_RX",
+			  "HP_I2C_SDA",
+			  "HP_I2C_SCL",
+			  "FORCED_USB_BOOT",
+			  "AMP_BCLK",
+			  "AMP_LRCLK",		/* 50 */
+			  "AMP_DIN",
+			  "",
+			  "HP_BCLK",
+			  "HP_LRCLK",
+			  "HP_DOUT",
+			  "HP_DIN",
+			  "HP_MCLK",
+			  "AP_SKU_ID0",
+			  "AP_EC_SPI_MISO",
+			  "AP_EC_SPI_MOSI",	/* 60 */
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
+			  "",
+			  "",			/* 70 */
+			  "",
+			  "",
+			  "",
+			  "EN_FP_RAILS",
+			  "UIM2_DATA",
+			  "UIM2_CLK",
+			  "UIM2_RST",
+			  "UIM2_PRESENT_L",
+			  "UIM1_DATA",
+			  "UIM1_CLK",		/* 80 */
+			  "UIM1_RST",
+			  "",
+			  "CODEC_PWR_EN",
+			  "HUB_EN",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "AP_SKU_ID1",		/* 90 */
+			  "AP_RST_REQ",
+			  "",
+			  "AP_BRD_ID1",
+			  "AP_EC_INT_L",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",			/* 100 */
+			  "",
+			  "",
+			  "",
+			  "EDP_BRIJ_EN",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",			/* 110 */
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
2.31.0

