Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A3E1D2E4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 13:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgENL31 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 07:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgENL3Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 07:29:25 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC3AC061A0E;
        Thu, 14 May 2020 04:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589455763;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=pviOsIEMTTX0X8EoxRj4qyAZ6lEskNj9OnoyH+3eXwA=;
        b=mczlEgtC9V5H0z3xXK9KnI9CqksN4h9i8Am2wDsE5J8ebhszRgOfkMJRSP0p8S2r3H
        CJpgqK5uIUhXne1h3IRY++GYRVuhh6l0yyGUEEYA8mXmNBGg47cPOze3wKCFsbOncOHY
        3Qw8ggUb/kexKmMIGHfpobxGAmuF2cOn8tQK3ZYhzc9wmS3CXb5HwANZ8sU2GXWY8myZ
        D/kuKuNDd6h4BS30yqZsPbBFwn+qK4/IcRLBbghDPnrKoXZymgXYxeHB9cmXQ0MIugQ4
        GjopbrkHV1M7pcAgCwar3Z4B8Gah8Zn7SXqF87M/t720vNHZukjUEaXWjxv0X0x49gPb
        YfrA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6NBgYo"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id 60b02dw4EBTKHey
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 14 May 2020 13:29:20 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 3/3] arm64: dts: qcom: apq8016-sbc: merge -pins.dtsi into main .dtsi
Date:   Thu, 14 May 2020 13:27:54 +0200
Message-Id: <20200514112754.148919-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514112754.148919-1-stephan@gerhold.net>
References: <20200514112754.148919-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

apq8016-sbc.dtsi is the only remaining device which takes up
4 files since it has its pinctrl split into separate files.

Actually this does not really make the device tree easier to read
(just harder to find nodes). For db820c the files were merged in
commit 88264f1f6bf5 ("arm64: dts: qcom: db820c: Remove pin specific files").

Do the same for apq8016-sbc (db410c) and move the pinctrl definitions
into apq8016-sbc.dtsi.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi  |  74 --------
 .../boot/dts/qcom/apq8016-sbc-soc-pins.dtsi   |  89 ----------
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     | 158 +++++++++++++++++-
 3 files changed, 156 insertions(+), 165 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
deleted file mode 100644
index 41907938014c..000000000000
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
+++ /dev/null
@@ -1,74 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
-#include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
-
-&pm8916_gpios {
-
-	usb_hub_reset_pm: usb-hub-reset-pm {
-		pinconf {
-			pins = "gpio3";
-			function = PMIC_GPIO_FUNC_NORMAL;
-			input-disable;
-			output-high;
-		};
-	};
-
-	usb_hub_reset_pm_device: usb-hub-reset-pm-device {
-		pinconf {
-			pins = "gpio3";
-			function = PMIC_GPIO_FUNC_NORMAL;
-			output-low;
-		};
-	};
-
-	usb_sw_sel_pm: usb-sw-sel-pm {
-		pinconf {
-			pins = "gpio4";
-			function = PMIC_GPIO_FUNC_NORMAL;
-			power-source = <PM8916_GPIO_VPH>;
-			input-disable;
-			output-high;
-		};
-	};
-
-	usb_sw_sel_pm_device: usb-sw-sel-pm-device {
-		pinconf {
-			pins = "gpio4";
-			function = PMIC_GPIO_FUNC_NORMAL;
-			power-source = <PM8916_GPIO_VPH>;
-			input-disable;
-			output-low;
-		};
-	};
-
-	pm8916_gpios_leds: pm8916-gpios-leds {
-		pinconf {
-			pins = "gpio1", "gpio2";
-			function = PMIC_GPIO_FUNC_NORMAL;
-			output-low;
-		};
-	};
-};
-
-&pm8916_mpps {
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&ls_exp_gpio_f>;
-
-	ls_exp_gpio_f: pm8916-mpp4 {
-		pinconf {
-			pins = "mpp4";
-			function = "digital";
-			output-low;
-			power-source = <PM8916_MPP_L5>;	// 1.8V
-		};
-	};
-
-	pm8916_mpps_leds: pm8916-mpps-leds {
-		pinconf {
-			pins = "mpp2", "mpp3";
-			function = "digital";
-			output-low;
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi
deleted file mode 100644
index ac00beec102f..000000000000
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi
+++ /dev/null
@@ -1,89 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include <dt-bindings/gpio/gpio.h>
-
-&msmgpio {
-
-	msmgpio_leds: msmgpio-leds {
-		pinconf {
-			pins = "gpio21", "gpio120";
-			function = "gpio";
-			output-low;
-		};
-	};
-
-	usb_id_default: usb-id-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio121";
-		};
-
-		pinconf {
-			pins = "gpio121";
-			drive-strength = <8>;
-			input-enable;
-			bias-pull-up;
-		};
-	};
-
-	adv7533_int_active: adv533-int-active {
-		pinmux {
-			function = "gpio";
-			pins = "gpio31";
-		};
-		pinconf {
-			pins = "gpio31";
-			drive-strength = <16>;
-			bias-disable;
-		};
-	};
-
-	adv7533_int_suspend: adv7533-int-suspend {
-		pinmux {
-			function = "gpio";
-			pins = "gpio31";
-		};
-		pinconf {
-			pins = "gpio31";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
-	adv7533_switch_active: adv7533-switch-active {
-		pinmux {
-			function = "gpio";
-			pins = "gpio32";
-		};
-		pinconf {
-			pins = "gpio32";
-			drive-strength = <16>;
-			bias-disable;
-		};
-	};
-
-	adv7533_switch_suspend: adv7533-switch-suspend {
-		pinmux {
-			function = "gpio";
-			pins = "gpio32";
-		};
-		pinconf {
-			pins = "gpio32";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
-	msm_key_volp_n_default: msm-key-volp-n-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio107";
-		};
-		pinconf {
-			pins = "gpio107";
-			drive-strength = <8>;
-			input-enable;
-			bias-pull-up;
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 08c7538b9c9f..8a4b790aa7ff 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -5,10 +5,10 @@
 
 #include "msm8916.dtsi"
 #include "pm8916.dtsi"
-#include "apq8016-sbc-soc-pins.dtsi"
-#include "apq8016-sbc-pmic-pins.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
 #include <dt-bindings/sound/apq8016-lpass.h>
 
 /*
@@ -777,3 +777,157 @@ l18 {
 		regulator-max-microvolt = <3337000>;
 	};
 };
+
+&msmgpio {
+	msmgpio_leds: msmgpio-leds {
+		pinconf {
+			pins = "gpio21", "gpio120";
+			function = "gpio";
+			output-low;
+		};
+	};
+
+	usb_id_default: usb-id-default {
+		pinmux {
+			function = "gpio";
+			pins = "gpio121";
+		};
+
+		pinconf {
+			pins = "gpio121";
+			drive-strength = <8>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
+	adv7533_int_active: adv533-int-active {
+		pinmux {
+			function = "gpio";
+			pins = "gpio31";
+		};
+		pinconf {
+			pins = "gpio31";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	adv7533_int_suspend: adv7533-int-suspend {
+		pinmux {
+			function = "gpio";
+			pins = "gpio31";
+		};
+		pinconf {
+			pins = "gpio31";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	adv7533_switch_active: adv7533-switch-active {
+		pinmux {
+			function = "gpio";
+			pins = "gpio32";
+		};
+		pinconf {
+			pins = "gpio32";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	adv7533_switch_suspend: adv7533-switch-suspend {
+		pinmux {
+			function = "gpio";
+			pins = "gpio32";
+		};
+		pinconf {
+			pins = "gpio32";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	msm_key_volp_n_default: msm-key-volp-n-default {
+		pinmux {
+			function = "gpio";
+			pins = "gpio107";
+		};
+		pinconf {
+			pins = "gpio107";
+			drive-strength = <8>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+};
+
+&pm8916_gpios {
+	usb_hub_reset_pm: usb-hub-reset-pm {
+		pinconf {
+			pins = "gpio3";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			input-disable;
+			output-high;
+		};
+	};
+
+	usb_hub_reset_pm_device: usb-hub-reset-pm-device {
+		pinconf {
+			pins = "gpio3";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			output-low;
+		};
+	};
+
+	usb_sw_sel_pm: usb-sw-sel-pm {
+		pinconf {
+			pins = "gpio4";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			power-source = <PM8916_GPIO_VPH>;
+			input-disable;
+			output-high;
+		};
+	};
+
+	usb_sw_sel_pm_device: usb-sw-sel-pm-device {
+		pinconf {
+			pins = "gpio4";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			power-source = <PM8916_GPIO_VPH>;
+			input-disable;
+			output-low;
+		};
+	};
+
+	pm8916_gpios_leds: pm8916-gpios-leds {
+		pinconf {
+			pins = "gpio1", "gpio2";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			output-low;
+		};
+	};
+};
+
+&pm8916_mpps {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ls_exp_gpio_f>;
+
+	ls_exp_gpio_f: pm8916-mpp4 {
+		pinconf {
+			pins = "mpp4";
+			function = "digital";
+			output-low;
+			power-source = <PM8916_MPP_L5>;	// 1.8V
+		};
+	};
+
+	pm8916_mpps_leds: pm8916-mpps-leds {
+		pinconf {
+			pins = "mpp2", "mpp3";
+			function = "digital";
+			output-low;
+		};
+	};
+};
-- 
2.26.2

