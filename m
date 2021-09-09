Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4255405D43
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 21:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237322AbhIITWQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 15:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbhIITWQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 15:22:16 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A02AC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Sep 2021 12:21:06 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id j10-20020a17090a94ca00b00181f17b7ef7so2282785pjw.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Sep 2021 12:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nnDNP/4fAYQnfKiuqwuD0lctAnWcbA1xGYBarcE6dnk=;
        b=gSK/7f1FiJFXaDkk+NYWHKDGo08uh6Sad9CsRW3vuizKP01XPP0DK569a2b6b8Ltea
         GBX71rIkghb/Bk0/ZkG24RVMq+ejzWIqM6BwQ9xB64/3zX0iX5BhOjj7E3bAzgtCf5HS
         WlweUatn+Qz4yzIjUauSc1ABvH87Tllan+x84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nnDNP/4fAYQnfKiuqwuD0lctAnWcbA1xGYBarcE6dnk=;
        b=d/tzfsqAAeHQvYZ5i08cmg/cFDdl+0Q2iiwEoLo1fUVOYr3Xb91JqtZErV+wvblKZ9
         6IMaF1S+qAFJ+9F9CPeUTCC9CdBg9InaVnrlnkiE8LW2LkGzlFepzzbiLl+g06AnN6ce
         fEW9AOqN1ybs1nxBJJTqQ06Mz8Rfw1URW1/mIqa/dD3rQy4FnG0ma8V8ZawRsxucChpg
         6IvTFSUFkxprmswqYl7Dw9pZY1cBweAGhfv0zlq0vpp61McoSGVdR0qv+Tivsb2FGcIE
         ZFHOXEf6EwqBo95Rlo/guOr6DsAzDIEDcifmSq4Pb9phm5eM1NopgF9OiTDJSmsVaB/o
         ZSUQ==
X-Gm-Message-State: AOAM530haaIG1jGW/2idEWZuAk23TGtiVxq6PgIYfjJVwNqcCvbc6ZCT
        5ltcOgrKN8PfpJkts0synjg6eA==
X-Google-Smtp-Source: ABdhPJyevp6uGy47yFtbFtsi8xLW+ZFfaLlk2iGr+oNOMPZUSisFsxAR44HXhbL7ZtHdjrDawbQKNQ==
X-Received: by 2002:a17:90b:3849:: with SMTP id nl9mr4099428pjb.155.1631215265516;
        Thu, 09 Sep 2021 12:21:05 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c1fe:57b:eb6:58a5])
        by smtp.gmail.com with UTF8SMTPSA id s3sm3030650pfd.188.2021.09.09.12.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Sep 2021 12:21:05 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] arm64: dts: qcom: Add sc7180-trogdor-homestar
Date:   Thu,  9 Sep 2021 12:21:01 -0700
Message-Id: <20210909122053.1.Ieafda79b74f74a2b15ed86e181c06a3060706ec5@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Homestar is a trogdor variant. The DT bits are essentially the same as
in the downstream tree, except for:

- skip -rev0 and rev1 which were early builds and have their issues,
  it's not very useful to support them upstream
- don't include the .dtsi for the MIPI cameras, which doesn't exist
  upstream

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../dts/qcom/sc7180-trogdor-homestar-r2.dts   |  20 ++
 .../dts/qcom/sc7180-trogdor-homestar-r3.dts   |  15 +
 .../dts/qcom/sc7180-trogdor-homestar.dtsi     | 335 ++++++++++++++++++
 4 files changed, 372 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4f0597091976..91ec59c291c7 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -41,6 +41,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r3-lte.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-homestar-r2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-homestar-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-kb.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dts
new file mode 100644
index 000000000000..db6c2da67cea
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Homestar board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-homestar.dtsi"
+
+/ {
+	model = "Google Homestar (rev2)";
+	compatible = "google,homestar-rev2","google,homestar-rev23", "qcom,sc7180";
+};
+
+&panel {
+	/delete-property/hpd-gpios;
+	no-hpd;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dts
new file mode 100644
index 000000000000..3fd8aa5bb7a6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Homestar board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-homestar.dtsi"
+
+/ {
+	model = "Google Homestar (rev3+)";
+	compatible = "google,homestar", "qcom,sc7180";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
new file mode 100644
index 000000000000..cd3054226865
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Homestar board device tree source
+ *
+ * Copyright 2021 Google LLC.
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
+	/* BOARD-SPECIFIC TOP LEVEL NODES */
+
+	max98360a_1: max98360a_1 {
+		compatible = "maxim,max98360a";
+		#sound-dai-cells = <0>;
+	};
+
+	max98360a_2: max98360a_2 {
+		compatible = "maxim,max98360a";
+		#sound-dai-cells = <0>;
+	};
+
+	max98360a_3: max98360a_3 {
+		compatible = "maxim,max98360a";
+		#sound-dai-cells = <0>;
+	};
+
+	pp3300_touch: pp3300-touch {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_touch";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&en_pp3300_touch>;
+
+		vin-supply = <&pp3300_a>;
+	};
+
+	thermal-zones {
+		skin_temp_thermal: skin-temp-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm6150_adc_tm 1>;
+			sustainable-power = <814>;
+
+			trips {
+				skin_temp_alert0: trip-point0 {
+					temperature = <55000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin_temp_alert1: trip-point1 {
+					temperature = <58000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin-temp-crit {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&skin_temp_alert0>;
+					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&skin_temp_alert1>;
+					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+};
+
+&ap_tp_i2c {
+	status = "disabled";
+};
+
+ap_ts_pen_1v8: &i2c4 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	ap_ts: touchscreen@14 {
+		compatible = "goodix,gt7375p";
+		reg = <0x14>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_l>, <&ts_reset_l>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+
+		vdd-supply = <&pp3300_touch>;
+	};
+};
+
+/* Panel controls backlight over aux channel */
+
+&backlight {
+	status = "disabled";
+};
+
+&camcc {
+	status = "okay";
+};
+
+&panel {
+	compatible = "samsung,atna33xc20";
+	enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+	/delete-property/ backlight;
+};
+
+&pm6150_adc {
+	skin-temp-thermistor@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+};
+
+&pm6150_adc_tm {
+	status = "okay";
+
+	skin-temp-thermistor@1 {
+		reg = <1>;
+		io-channels = <&pm6150_adc ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
+&pp3300_dx_edp {
+	gpio = <&tlmm 67 GPIO_ACTIVE_HIGH>;
+};
+
+&secondary_mi2s {
+	qcom,playback-sd-lines = <0 1>;
+};
+
+&sound_multimedia1_codec {
+	sound-dai = <&max98360a>, <&max98360a_1>, <&max98360a_2>, <&max98360a_3> ;
+};
+
+&wifi {
+	qcom,ath10k-calibration-variant = "GO_HOMESTAR";
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
+&sec_mi2s_active{
+	pinmux {
+		pins = "gpio49", "gpio50", "gpio51", "gpio52";
+		function = "mi2s_1";
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
+			  "",
+			  "AP_RAM_ID2",
+			  "UF_CAM_EN",
+			  "WF_CAM_EN",
+			  "TS_RESET_L",
+			  "TS_INT_L",
+			  "",
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
+			  "AVEE_LCD_EN",
+			  "",
+			  "AMP_EN",
+			  "AMP_EN2",
+			  "AP_SAR_SENSOR_SDA",
+			  "AP_SAR_SENSOR_SCL",
+			  "SEL_LCM",
+			  "HP_IRQ",
+			  "WF_CAM_RST_L",
+			  "UF_CAM_RST_L",
+			  "AP_BRD_ID2",
+			  "BRIJ_SUSPEND",
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
+			  "AMP_DIN_2",
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
+			  "WLAN_SW_CTRL",
+			  "",
+			  "REPORT_E",
+			  "VDD_RESET_1.8V",
+			  "ID0",
+			  "",
+			  "ID1",
+			  "AVDD_LCD_EN",
+			  "MIPI_1.8V_EN",
+			  "",
+			  "CODEC_PWR_EN",
+			  "HUB_EN",
+			  "",
+			  "PP1800_MIPI_SW_EN",
+			  "EN_PP3300_TOUCH",
+			  "",
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
+			  "EDP_BRIJ_EN",
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
+	en_pp3300_touch: en-pp3300-touch {
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
2.33.0.309.g3052b89438-goog

