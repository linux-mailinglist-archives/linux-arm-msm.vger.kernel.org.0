Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7712B302362
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 10:50:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbhAYJru (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 04:47:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbhAYJrT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 04:47:19 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB72AC06178A;
        Mon, 25 Jan 2021 01:46:38 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id 6so11547161wri.3;
        Mon, 25 Jan 2021 01:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pxvcpCO85zMxQnOkjIoCHct3c15zWE1fr4RG244k1XA=;
        b=h0/r1QifBhbXGGh8ZgHU6T9Ko3dHYzteiwtBzbfvLhXjb8H3iiSL13K4jArfYoTQEb
         VyFpkeqcXcUIQHJUHCnafQOheslO6DqsWpb0tje5XxUIqCBFgaplWMPXLQLXRSTxkOV/
         AVg7rUNZr9M6NYZKTS/mRK3Hw9C+SlpuZYgf5bVmEK3vElq63sxi20Hk+fP3PTNTrstn
         j9kLuO1aAajhcCGq31GUg4xRCvn9NIEYd4uBySulEa+b0iOkgzIKrSik9W3rRnVar9me
         QzkH2m0IBNF6i+7XncL2a7D767f8j8VnQt86aKQ+O4WpoKpgOlItm1MU3y67FOfv6dhZ
         0D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pxvcpCO85zMxQnOkjIoCHct3c15zWE1fr4RG244k1XA=;
        b=uEVorICYTIweXaFNtfqECIg22vZkFXgVBUMBX9aqOXRPBpLCNs0WeukzM3L0L2qX8L
         7FmY3rgigaEVdcI+ql71Qh2bFr3EZvokxu0EusNUDgfp5cc1EVPRR6m+vEwDYr1+WCAA
         KMf5pnNioTxYUEEDwU6MIbkkLlCmD1+GIEpAQB9arXrDl2+pBegH9mQQ5RTnNau9znGF
         xDuWSaCScBnMbHxffUSMGhNpkk6B3/yE22mXUiJV4cIAK0A4z01Yy/wX5Srd5yGKDimH
         RlwP1Ja28UityyZRB8ERYRe8lKyHOJZziOrkC9pF//Ox4fSpFm2bZ/3/l2BWc6W4+V07
         zTpQ==
X-Gm-Message-State: AOAM530aOWdjgQAU9JmXf0hCCOyVgnVYPVIf73GwOAT40lAmCsswWlbg
        kmw7THvySuQjnBO96qPxd/uOXKeBWkY=
X-Google-Smtp-Source: ABdhPJxFWFKlwhBVhM0bukT0G25UtwzZS7hWLPg4Rn+KdyzQ7/quSYlpcdj1tNvvqVpVfZnX8vZYqg==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr771538wrr.199.1611567997100;
        Mon, 25 Jan 2021 01:46:37 -0800 (PST)
Received: from jonathan-N53SV.station ([151.81.101.204])
        by smtp.googlemail.com with ESMTPSA id u5sm22154052wmg.9.2021.01.25.01.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 01:46:36 -0800 (PST)
From:   Jonathan Albrieux <jonathan.albrieux@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, stephan@gerhold.net,
        phone-devel@vger.kernel.org,
        Jonathan Albrieux <jonathan.albrieux@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: dts: qcom: Add device tree for BQ Aquaris X5 (Longcheer L8910)
Date:   Mon, 25 Jan 2021 10:44:30 +0100
Message-Id: <20210125094435.7528-2-jonathan.albrieux@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210125094435.7528-1-jonathan.albrieux@gmail.com>
References: <20210125094435.7528-1-jonathan.albrieux@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

BQ Aquaris X5 (Longcheer L8910) is a smartphone using the MSM8916 SoC.

Add device tree with initial support for:

 - SDHCI (internal and external storage)
 - USB Device Mode
 - UART
 - Regulators
 - WiFi/BT
 - Volume buttons
 - Vibrator
 - Touchkeys backlight

This device tree is based on downstream device tree from BQ and from
Longcheer L8915 device tree.

Co-developed-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Jonathan Albrieux <jonathan.albrieux@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts | 230 ++++++++++++++++++
 2 files changed, 231 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index b5d86739f781..94b76a7ac6ba 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-asus-z00l.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8910.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
new file mode 100644
index 000000000000..7d5eff922f41
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916-pm8916.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "BQ Aquaris X5 (Longcheer L8910)";
+	compatible = "longcheer,l8910", "qcom,msm8916";
+
+	aliases {
+		serial0 = &blsp1_uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_default>;
+
+		label = "GPIO Buttons";
+
+		volume-up {
+			label = "Volume Up";
+			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			gpios = <&msmgpio 17 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_WHITE>;
+			default-state = "off";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&button_backlight_default>;
+		};
+	};
+
+	usb_id: usb-id {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpio = <&msmgpio 110 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_id_default>;
+	};
+};
+
+&blsp1_uart2 {
+	status = "okay";
+};
+
+&pm8916_resin {
+	status = "okay";
+	linux,code = <KEY_VOLUMEDOWN>;
+};
+
+&pm8916_vib {
+	status = "okay";
+};
+
+&pronto {
+	status = "okay";
+};
+
+&sdhc_1 {
+	status = "okay";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
+	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
+	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+
+	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
+};
+
+&usb {
+	status = "okay";
+	extcon = <&usb_id>, <&usb_id>;
+};
+
+&usb_hs_phy {
+	extcon = <&usb_id>;
+};
+
+&smd_rpm_regulators {
+	vdd_l1_l2_l3-supply = <&pm8916_s3>;
+	vdd_l4_l5_l6-supply = <&pm8916_s4>;
+	vdd_l7-supply = <&pm8916_s4>;
+
+	s3 {
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1300000>;
+	};
+
+	s4 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2100000>;
+	};
+
+	l1 {
+		regulator-min-microvolt = <1225000>;
+		regulator-max-microvolt = <1225000>;
+	};
+
+	l2 {
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+
+	l4 {
+		regulator-min-microvolt = <2050000>;
+		regulator-max-microvolt = <2050000>;
+	};
+
+	l5 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	l6 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	l7 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	l8 {
+		regulator-min-microvolt = <2850000>;
+		regulator-max-microvolt = <2900000>;
+	};
+
+	l9 {
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	l10 {
+		regulator-min-microvolt = <2700000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
+	l11 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2950000>;
+		regulator-allow-set-load;
+		regulator-system-load = <200000>;
+	};
+
+	l12 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2950000>;
+	};
+
+	l13 {
+		regulator-min-microvolt = <3075000>;
+		regulator-max-microvolt = <3075000>;
+	};
+
+	l14 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	l15 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	l16 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	l17 {
+		regulator-min-microvolt = <2850000>;
+		regulator-max-microvolt = <2850000>;
+	};
+
+	l18 {
+		regulator-min-microvolt = <2700000>;
+		regulator-max-microvolt = <2700000>;
+	};
+};
+
+&msmgpio {
+	button_backlight_default: button-backlight-default {
+		pins = "gpio17";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	gpio_keys_default: gpio-keys-default {
+		pins = "gpio107";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	usb_id_default: usb-id-default {
+		pins = "gpio110";
+		function = "gpio";
+
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+};
-- 
2.17.1

