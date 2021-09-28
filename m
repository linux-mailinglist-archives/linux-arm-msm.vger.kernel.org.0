Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7B441B4F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 19:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242051AbhI1RXW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 13:23:22 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:13682 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242014AbhI1RXV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 13:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632849688;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Vt28A8btSKr+qswJd0U4CAoaAGGfqbbYx3A/RZjLeJY=;
    b=fJHWfS6iFnoy2NnnEmyGghTIRsITPwDjRPE8mM+ltjtwTAggECEWYzLlXW5KXDNMCW
    bswomA2p2nlUwdNPAbUDlx/YYPpdPJjtp4fUrCzAEl7fl8Fk8fiGb5CvuZkf/xzC+wdc
    ckuc9BuxpVJPMr1R5HeGZjLcjfDjz55oYYf2f0Y55hoiDAma3Y85AL5lwaJwpp0q/VVC
    Vw7k6AHXx/JZk6T4CMRmkhROT/yo9CAIf4qvdTPAgoc7XhobFrVjYnnQ6g7yFbfS2fO8
    FoXVL90B6/3iW/p0dTGV8vQV9qX9LzrmPrEp5nwd0YnKmEEskh1zEfn2J95bRqtNgb/1
    moDg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr3eFSKSxc="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8SHLRoBJ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 28 Sep 2021 19:21:27 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 03/15] arm64: dts: qcom: msm8916-samsung-serranove: Add touch key
Date:   Tue, 28 Sep 2021 19:12:19 +0200
Message-Id: <20210928171231.12766-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928171231.12766-1-stephan@gerhold.net>
References: <20210928171231.12766-1-stephan@gerhold.net>
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
 .../dts/qcom/msm8916-samsung-serranove.dts    | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index 214a863eedbf..6689687f544f 100644
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

