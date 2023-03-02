Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307E46A8B04
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 22:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjCBVLo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 16:11:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjCBVLl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 16:11:41 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF57580F8
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 13:11:32 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso288707pjs.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 13:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTSddxTNpAgHZ5lc7mqypY8tb8IcInCtWAIfix9BByA=;
        b=CsWPp14tPvYYFTnl1aWTP1atXLEaAdLGolHJDAtt1atCsoKGDqPS3HdshJBkVVi1Av
         3fOghTmBGjj/Mlb1EfzfUxPVAd3cfQ6/AUJOWM5NIh9CtXjtcdtphSrrvKSdk2VSoziF
         mNfoDi7vqsoPM/58FjPn2bEyVklmL38kD2hTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTSddxTNpAgHZ5lc7mqypY8tb8IcInCtWAIfix9BByA=;
        b=Nxg/eWvuPM5IplRPJYAjlDAZcw+L3ShUIPA2gcJe0tpJcNTcuxgEqFSOkWqt6RNEnb
         rxCnfObN74Mr96+rfKchIFxXYE/w/xAm2BqIdhofKk5Jwpcq0xBZQO0bgDmY6rDX3Ctn
         uGjuPLqXr4NSpc8VLcvp0gwAPL4O6letOOinsLRPRRZbYPh8MChwfDwz8h7KTM/moOOk
         981yi4lYetPZahs75sb6wpesRmnKhwZputqc/VB3cK7zK5yxKkVgvysUdpnz+FWwjUwu
         Rb5pvuG+z4FXU8yb1uu2Mxdq0gn4Y+XvAUgXzKaI1OZTy11+wMVbJOX4B1ksXfUboIrv
         FuRw==
X-Gm-Message-State: AO0yUKWYNUApTNPrcIRQSWI+ixGyzjM/PGBOU0lSLj7qILFzs7YKx7EF
        oDpkMiWQ86IRcGVxM35oQ800nQ==
X-Google-Smtp-Source: AK7set+WiXcdeDFUj3oZxYcq8m4UHPVuvDJBKj57aUnsP8Pd3LwOAR6xHF26hIEB0DCnQJqNysslIQ==
X-Received: by 2002:a17:903:40c2:b0:19c:f096:bbef with SMTP id t2-20020a17090340c200b0019cf096bbefmr9727595pld.49.1677791492085;
        Thu, 02 Mar 2023 13:11:32 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:a558:99c0:81e9:a93c])
        by smtp.gmail.com with ESMTPSA id a16-20020a170902b59000b00195f242d0a0sm114497pls.194.2023.03.02.13.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 13:11:31 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>, mka@chromium.org,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: qcom: sc7180: Delete mrbland
Date:   Thu,  2 Mar 2023 13:11:07 -0800
Message-Id: <20230302131031.v2.4.I79eee3b8e9eb3086ae02760e97a2e12ffa8eb4f0@changeid>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
In-Reply-To: <20230302211108.2129598-1-dianders@chromium.org>
References: <20230302211108.2129598-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The mrbland board was never actually produced and there has been no
activity around the board for quite some time. It seems highly
unlikely to magically get revived. There should be nobody in need of
these device trees, so let's delete them. If somehow the project
resurrects itself then we can re-add support, perhaps just for -rev1+.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/Makefile             |   4 -
 .../qcom/sc7180-trogdor-mrbland-rev0-auo.dts  |  22 --
 .../qcom/sc7180-trogdor-mrbland-rev0-boe.dts  |  22 --
 .../dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi |  36 --
 .../qcom/sc7180-trogdor-mrbland-rev1-auo.dts  |  22 --
 .../qcom/sc7180-trogdor-mrbland-rev1-boe.dts  |  24 --
 .../boot/dts/qcom/sc7180-trogdor-mrbland.dtsi | 320 ------------------
 7 files changed, 450 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e4190a648335..a0ad0a8a62d8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -98,10 +98,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-r9.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots-r4.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots-r5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots-r9.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-mrbland-rev0-auo.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-mrbland-rev0-boe.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-mrbland-rev1-auo.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-mrbland-rev1-boe.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pazquel-lte-parade.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pazquel-lte-ti.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pazquel-parade.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dts
deleted file mode 100644
index 2767817fb053..000000000000
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dts
+++ /dev/null
@@ -1,22 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Google Mrbland board device tree source
- *
- * Copyright 2021 Google LLC.
- *
- * SKU: 0x0 => 0
- *  - bits 7..4: Panel ID: 0x0 (AUO)
- */
-
-/dts-v1/;
-
-#include "sc7180-trogdor-mrbland-rev0.dtsi"
-
-/ {
-	model = "Google Mrbland rev0 AUO panel board";
-	compatible = "google,mrbland-rev0-sku0", "qcom,sc7180";
-};
-
-&panel {
-	compatible = "auo,b101uan08.3";
-};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dts
deleted file mode 100644
index 711485574a03..000000000000
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dts
+++ /dev/null
@@ -1,22 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Google Mrbland board device tree source
- *
- * Copyright 2021 Google LLC.
- *
- * SKU: 0x10 => 16
- *  - bits 7..4: Panel ID: 0x1 (BOE)
- */
-
-/dts-v1/;
-
-#include "sc7180-trogdor-mrbland-rev0.dtsi"
-
-/ {
-	model = "Google Mrbland rev0 BOE panel board";
-	compatible = "google,mrbland-rev0-sku16", "qcom,sc7180";
-};
-
-&panel {
-	compatible = "boe,tv101wum-n53";
-};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi
deleted file mode 100644
index f4c1f3813664..000000000000
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi
+++ /dev/null
@@ -1,36 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Google Mrbland board device tree source
- *
- * Copyright 2021 Google LLC.
- *
- */
-
-/dts-v1/;
-
-#include "sc7180-trogdor-mrbland.dtsi"
-
-&avdd_lcd {
-	gpio = <&tlmm 80 GPIO_ACTIVE_HIGH>;
-};
-
-&panel {
-	enable-gpios = <&tlmm 76 GPIO_ACTIVE_HIGH>;
-};
-
-&v1p8_mipi {
-	gpio = <&tlmm 81 GPIO_ACTIVE_HIGH>;
-};
-
-/* PINCTRL - modifications to sc7180-trogdor-mrbland.dtsi */
-&avdd_lcd_en {
-	pins = "gpio80";
-};
-
-&mipi_1800_en {
-	pins = "gpio81";
-};
-
-&vdd_reset_1800 {
-	pins = "gpio76";
-};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dts
deleted file mode 100644
index 275313ef7554..000000000000
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dts
+++ /dev/null
@@ -1,22 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Google Mrbland board device tree source
- *
- * Copyright 2021 Google LLC.
- *
- * SKU: 0x600 => 1536
- *  - bits 11..8: Panel ID: 0x6 (AUO)
- */
-
-/dts-v1/;
-
-#include "sc7180-trogdor-mrbland.dtsi"
-
-/ {
-	model = "Google Mrbland rev1+ AUO panel board";
-	compatible = "google,mrbland-sku1536", "qcom,sc7180";
-};
-
-&panel {
-	compatible = "auo,b101uan08.3";
-};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dts
deleted file mode 100644
index 87c6b6c30b5e..000000000000
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dts
+++ /dev/null
@@ -1,24 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Google Mrbland board device tree source
- *
- * Copyright 2021 Google LLC.
- *
- * SKU: 0x300 => 768
- *  - bits 11..8: Panel ID: 0x3 (BOE)
- */
-
-/dts-v1/;
-
-#include "sc7180-trogdor-mrbland.dtsi"
-
-/ {
-	model = "Google Mrbland (rev1 - 2) BOE panel board";
-	/* Uses ID 768 on rev1 and 1024 on rev2+ */
-	compatible = "google,mrbland-sku1024", "google,mrbland-sku768",
-		"qcom,sc7180";
-};
-
-&panel {
-	compatible = "boe,tv101wum-n53";
-};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi
deleted file mode 100644
index ed12ee35f06b..000000000000
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi
+++ /dev/null
@@ -1,320 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Google Mrbland board device tree source
- *
- * Copyright 2021 Google LLC.
- */
-
-/dts-v1/;
-
-#include "sc7180-trogdor.dtsi"
-
-/* This board only has 1 USB Type-C port. */
-/delete-node/ &usb_c1;
-
-/ {
-	avdd_lcd: avdd-lcd-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "avdd_lcd";
-
-		gpio = <&tlmm 88 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		pinctrl-names = "default";
-		pinctrl-0 = <&avdd_lcd_en>;
-
-		vin-supply = <&pp5000_a>;
-	};
-
-	avee_lcd: avee-lcd-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "avee_lcd";
-
-		gpio = <&tlmm 21 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		pinctrl-names = "default";
-		pinctrl-0 = <&avee_lcd_en>;
-
-		vin-supply = <&pp5000_a>;
-	};
-
-	v1p8_mipi: v1p8-mipi-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "v1p8_mipi";
-
-		gpio = <&tlmm 86 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		pinctrl-names = "default";
-		pinctrl-0 = <&mipi_1800_en>;
-
-		vin-supply = <&pp3300_a>;
-	};
-};
-
-&backlight {
-	pwms = <&cros_ec_pwm 0>;
-};
-
-&camcc {
-	status = "okay";
-};
-
-&cros_ec {
-	keyboard-controller {
-		compatible = "google,cros-ec-keyb-switches";
-	};
-};
-
-&dsi0 {
-
-	panel: panel@0 {
-		/* Compatible will be filled in per-board */
-		reg = <0>;
-		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&vdd_reset_1800>;
-		avdd-supply = <&avdd_lcd>;
-		avee-supply = <&avee_lcd>;
-		pp1800-supply = <&v1p8_mipi>;
-		pp3300-supply = <&pp3300_dx_edp>;
-		backlight = <&backlight>;
-		rotation = <270>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			port@0 {
-				reg = <0>;
-				panel_in: endpoint {
-					remote-endpoint = <&dsi0_out>;
-				};
-			};
-		};
-	};
-
-	ports {
-		port@1 {
-			endpoint {
-				remote-endpoint = <&panel_in>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
-	};
-};
-
-&gpio_keys {
-	status = "okay";
-};
-
-&i2c4 {
-	status = "okay";
-	clock-frequency = <400000>;
-
-	ap_ts: touchscreen@5d {
-		compatible = "goodix,gt7375p";
-		reg = <0x5d>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&ts_int_l>, <&ts_reset_l>;
-
-		interrupt-parent = <&tlmm>;
-		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
-
-		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
-
-		vdd-supply = <&pp3300_ts>;
-	};
-};
-
-&pp1800_uf_cam {
-	status = "okay";
-};
-
-&pp1800_wf_cam {
-	status = "okay";
-};
-
-&pp2800_uf_cam {
-	status = "okay";
-};
-
-&pp2800_wf_cam {
-	status = "okay";
-};
-
-&wifi {
-	qcom,ath10k-calibration-variant = "GO_MRBLAND";
-};
-
-/*
- * No eDP on this board but it's logically the same signal so just give it
- * a new name and assign the proper GPIO.
- */
-pp3300_disp_on: &pp3300_dx_edp {
-	gpio = <&tlmm 85 GPIO_ACTIVE_HIGH>;
-};
-
-/* PINCTRL - modifications to sc7180-trogdor.dtsi */
-
-/*
- * No eDP on this board but it's logically the same signal so just give it
- * a new name and assign the proper GPIO.
- */
-
-tp_en: &en_pp3300_dx_edp {
-	pins = "gpio85";
-};
-
-/* PINCTRL - board-specific pinctrl */
-
-&tlmm {
-	gpio-line-names = "HUB_RST_L",
-			  "AP_RAM_ID0",
-			  "AP_SKU_ID2",
-			  "AP_RAM_ID1",
-			  "",
-			  "AP_RAM_ID2",
-			  "UF_CAM_EN",
-			  "WF_CAM_EN",
-			  "TS_RESET_L",
-			  "TS_INT_L",
-			  "",
-			  "",
-			  "AP_EDP_BKLTEN",
-			  "UF_CAM_MCLK",
-			  "WF_CAM_CLK",
-			  "",
-			  "",
-			  "UF_CAM_SDA",
-			  "UF_CAM_SCL",
-			  "WF_CAM_SDA",
-			  "WF_CAM_SCL",
-			  "AVEE_LCD_EN",
-			  "",
-			  "AMP_EN",
-			  "",
-			  "",
-			  "",
-			  "",
-			  "HP_IRQ",
-			  "WF_CAM_RST_L",
-			  "UF_CAM_RST_L",
-			  "AP_BRD_ID2",
-			  "",
-			  "AP_BRD_ID0",
-			  "AP_H1_SPI_MISO",
-			  "AP_H1_SPI_MOSI",
-			  "AP_H1_SPI_CLK",
-			  "AP_H1_SPI_CS_L",
-			  "BT_UART_CTS",
-			  "BT_UART_RTS",
-			  "BT_UART_TXD",
-			  "BT_UART_RXD",
-			  "H1_AP_INT_ODL",
-			  "",
-			  "UART_AP_TX_DBG_RX",
-			  "UART_DBG_TX_AP_RX",
-			  "HP_I2C_SDA",
-			  "HP_I2C_SCL",
-			  "FORCED_USB_BOOT",
-			  "AMP_BCLK",
-			  "AMP_LRCLK",
-			  "AMP_DIN",
-			  "PEN_DET_ODL",
-			  "HP_BCLK",
-			  "HP_LRCLK",
-			  "HP_DOUT",
-			  "HP_DIN",
-			  "HP_MCLK",
-			  "AP_SKU_ID0",
-			  "AP_EC_SPI_MISO",
-			  "AP_EC_SPI_MOSI",
-			  "AP_EC_SPI_CLK",
-			  "AP_EC_SPI_CS_L",
-			  "AP_SPI_CLK",
-			  "AP_SPI_MOSI",
-			  "AP_SPI_MISO",
-			  /*
-			   * AP_FLASH_WP_L is crossystem ABI. Schematics
-			   * call it BIOS_FLASH_WP_L.
-			   */
-			  "AP_FLASH_WP_L",
-			  "",
-			  "AP_SPI_CS0_L",
-			  "",
-			  "",
-			  "",
-			  "",
-			  "WLAN_SW_CTRL",
-			  "",
-			  "REPORT_E",
-			  "",
-			  "ID0",
-			  "",
-			  "ID1",
-			  "",
-			  "",
-			  "",
-			  "CODEC_PWR_EN",
-			  "HUB_EN",
-			  "TP_EN",
-			  "MIPI_1.8V_EN",
-			  "VDD_RESET_1.8V",
-			  "AVDD_LCD_EN",
-			  "",
-			  "AP_SKU_ID1",
-			  "AP_RST_REQ",
-			  "",
-			  "AP_BRD_ID1",
-			  "AP_EC_INT_L",
-			  "SDM_GRFC_3",
-			  "",
-			  "",
-			  "BOOT_CONFIG_4",
-			  "BOOT_CONFIG_2",
-			  "",
-			  "",
-			  "",
-			  "",
-			  "",
-			  "",
-			  "",
-			  "BOOT_CONFIG_3",
-			  "WCI2_LTE_COEX_TXD",
-			  "WCI2_LTE_COEX_RXD",
-			  "",
-			  "",
-			  "",
-			  "",
-			  "FORCED_USB_BOOT_POL",
-			  "AP_TS_PEN_I2C_SDA",
-			  "AP_TS_PEN_I2C_SCL",
-			  "DP_HOT_PLUG_DET",
-			  "EC_IN_RW_ODL";
-
-	avdd_lcd_en: avdd-lcd-en-state {
-		pins = "gpio88";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	avee_lcd_en: avee-lcd-en-state {
-		pins = "gpio21";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	mipi_1800_en: mipi-1800-en-state {
-		pins = "gpio86";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	vdd_reset_1800: vdd-reset-1800-state {
-		pins = "gpio87";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-};
-- 
2.40.0.rc0.216.gc4246ad0f0-goog

