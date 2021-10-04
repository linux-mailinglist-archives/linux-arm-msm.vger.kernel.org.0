Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFB3421852
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 22:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236017AbhJDUXy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 16:23:54 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.169]:25112 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235936AbhJDUXv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 16:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633378911;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=VSY+FBKMPj37RTZdPhA9Dkj0wdgf6yhoES+QAZkncTg=;
    b=jcVlmG/6WWKUXvTEDmNKvMK46xVT0Js0Buxg5bBaI04zv2W5rUniCAtLnoVfgZ3qnB
    8uF8ar1V9Rziyfwl/F6RcBc6iBUljKFJ/YL+xCsfi7r1pzHXAXMU8oO/x2dsyR6D9O6I
    O+mVgXw1DO9N4lDhN/4/DX1wVRNGlYTTTUlrB4Ylnke/aSNfPYIkvz4QGs3uOZaJy6Dr
    vQHz/L8b4nyuwK3u2Hs/C5Pmsd7l8iVBwaFypVd9pZCffjLyutGxwGCOWh1I1DVwgFZw
    bHnZS1mEtPPmPxi9+jHRV7GOa/utK8MlPDUDb5DC9fH+QcLOv/EKENbVhPsTiaQtWSXE
    OBAw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFePxBA="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x94KLoKQn
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Oct 2021 22:21:50 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 03/15] arm64: dts: qcom: msm8916-samsung-serranove: Add touch key
Date:   Mon,  4 Oct 2021 22:19:09 +0200
Message-Id: <20211004201921.18526-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211004201921.18526-1-stephan@gerhold.net>
References: <20211004201921.18526-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the CORERIVER TC360 touch key together with the two necessary
fixed regulators for it.

Note that for some reason Samsung decided to connect this to GPIOs
where no hardware I2C bus is available, so we need to fall back
to software bit-banging using i2c-gpio.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2: None.
---
 .../dts/qcom/msm8916-samsung-serranove.dts    | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index aa1326e5d4cb..564f4f6d4f0f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -91,6 +91,32 @@ reg_vdd_tsp: regulator-vdd-tsp {
 		pinctrl-0 = <&tsp_en_default>;
 	};
 
+	reg_touch_key: regulator-touch-key {
+		compatible = "regulator-fixed";
+		regulator-name = "touch_key";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpio = <&msmgpio 86 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&tkey_en_default>;
+	};
+
+	reg_key_led: regulator-key-led {
+		compatible = "regulator-fixed";
+		regulator-name = "key_led";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&msmgpio 60 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&tkey_led_en_default>;
+	};
+
 	i2c-muic {
 		compatible = "i2c-gpio";
 		sda-gpios = <&msmgpio 105 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -113,6 +139,35 @@ muic: extcon@14 {
 			pinctrl-0 = <&muic_irq_default>;
 		};
 	};
+
+	i2c-tkey {
+		compatible = "i2c-gpio";
+		sda-gpios = <&msmgpio 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&msmgpio 17 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&tkey_i2c_default>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		touchkey@20 {
+			compatible = "coreriver,tc360-touchkey";
+			reg = <0x20>;
+
+			interrupt-parent = <&msmgpio>;
+			interrupts = <98 IRQ_TYPE_EDGE_FALLING>;
+
+			vcc-supply = <&reg_touch_key>;
+			vdd-supply = <&reg_key_led>;
+			vddio-supply = <&pm8916_l6>;
+
+			linux,keycodes = <KEY_APPSELECT KEY_BACK>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&tkey_default>;
+		};
+	};
 };
 
 &blsp_i2c5 {
@@ -333,6 +388,38 @@ muic_irq_default: muic-irq-default {
 		bias-disable;
 	};
 
+	tkey_default: tkey-default {
+		pins = "gpio98";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	tkey_en_default: tkey-en-default {
+		pins = "gpio86";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	tkey_i2c_default: tkey-i2c-default {
+		pins = "gpio16", "gpio17";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	tkey_led_en_default: tkey-led-en-default {
+		pins = "gpio60";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	tsp_en_default: tsp-en-default {
 		pins = "gpio73";
 		function = "gpio";
-- 
2.33.0

