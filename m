Return-Path: <linux-arm-msm+bounces-41054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA9A9E9373
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0745188583C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE493229B31;
	Mon,  9 Dec 2024 12:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFeNHGe3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CAA222587;
	Mon,  9 Dec 2024 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746193; cv=none; b=JU8hwNKUVdf2bLh3DXHPMGsvWvjUGYBQmynPOqU/C8CCfv7a/CAJwOLRwoWBDxXmopEF6Nf3pDBKMmIApDrVwbC+DSkX0wZFv9U3ggAO5vwhRDchx5VE39RHL5ZRuMYuMjIx10NLpLUnEC7TCNXYz4kQ7+Lc1slE6LoOTW21xm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746193; c=relaxed/simple;
	bh=LSPNUCmMrNEp08ttAGRjUsRLSlyCHX1E55FXJGuWuRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U40sA/LyuMPaJAmS2UQ8UIaWlWMtTl/HPj57N/teF/GhC89FMv1AU2TsEoklHWMhTrc+SKQNuW/TXppi7vsQJeXMk6snkbbFjdxtVrZQjkU5uhegdSirMzj/M1J+rQfjB3PtfJynRTnt0f+w3/H8/DA/NjRkwkHAE+OoxYoyyPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFeNHGe3; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so2623859a12.1;
        Mon, 09 Dec 2024 04:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746190; x=1734350990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9GVcRmUREOw+z3UIdzFaTkpOTQAkApvjzIdPEpb/8w=;
        b=mFeNHGe3SryIH5WVKXJ9XLE0NDqF1/aCM/GZfoxWLNEEDmhLSkmqLTxKT0wMBXJeaT
         tj6xHsYZ5D+tUgMta7r5N3l0UNAZgcUJJ2ZbykE5Pu96/Wkxo3vNu0RYsrexkLRZ3/my
         R9xsseCeEJYcZInS/CwSFE/iXKG6NAwtEmUBWCBUmMwDH85Olozw5u+8Taa4rScbiULi
         RZKqlIQuAHvPm1FCzOTn9NQjFZrxHMQNgEGBGVeSxMkuHl5gOz7TyMAefuejlLjkhK29
         MrQ4OLWkBqbo+5pK8lolzfcMIojTugo1mh1ARRCocX2rDHPTOOfxFVDDdPxqmUwV1Fwp
         lXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746190; x=1734350990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9GVcRmUREOw+z3UIdzFaTkpOTQAkApvjzIdPEpb/8w=;
        b=LT4tuLGkNg4bD6dqMYn1zb4xxezuQyUjs0Pzqn0yNF5Z5nEdCA1Ja3mr0YlQFzE+DJ
         qKsKIbrZ+f/GUpZKw7sztoRCwSEI8cXkmnuUKLh31OfZxDhLE0Aw64rZG+qrktVM/B/l
         FpJPEVAZXbS11AAkmQ2oA2pYJ6MjwxPwWGuWv8oqT8F3dSFzR6d/+uit3l8sZjaiYnOp
         ++oyqIjX0UlhQdN+3wv0Jmvg6VJzRdYYvvZ2Did5ryCvyHNLTjQn0j3HoRyFIaxoyWQ7
         VDGa8cEfAKOa9YU7NThgEOIQrrSZpp+hlQB6+nle/H735gnTJr3KPBfk7Pe9yZZYM4A2
         eyNA==
X-Forwarded-Encrypted: i=1; AJvYcCUz8gyxLn/m5Ibld9+iyaVwUxKmeoSPe0g8yS+S36GM+wCTukR84BEeoDhM1TOdwoCt3AVijLpOanEiBMfJ@vger.kernel.org, AJvYcCV5eheo1jH2RpgrDU8awLGH3wHqZJ/94EtJigo5+bGnqp4oFdRJRWFOOnz87c6M0Lxg0IdeXahu2+9D@vger.kernel.org, AJvYcCWMrdAnQZPvCmOelL2J9iU3irSmpmAT2aMq2eNLfT/N28TiGcqbhKKXpq8UcB/wm7RtrOCSkERGtmv40ew=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ9GENk/8/CVWGHv9N3hZB1todegHXyiN71gYRAp3CqqzeSYwa
	08Io5jiWCECbGImGrAgbnVTtOWPicKujWJRzVL3VAUb6Nlx1eyM1
X-Gm-Gg: ASbGnctLFrRjjt6at5oJIHjipgyLuiwTVl7AK8q0LDhlycu5MDlgP6yTqo0SplGnpBf
	eS8lXYwHtK5SNROLbJoxWfRn8m1Wi/4Nxh+u//BH8AVnd6BZCNUgpHX1YQjQh7sYwCn8wQKI/wz
	Gp2UvwjUiJdx4DofJPdhsn/7D6RK13YcuZJp3L42L7/CqGaciXZXhkGEK2W2Bkz+gXPmpgCbVGu
	BQRu4eYY37ziQUrTWFEOMOXFHoR4l74UXGblN0ftgd9me+M
X-Google-Smtp-Source: AGHT+IFvfT4FYBaMhWNsO00d64SX1W5y4FSYS2DHiK83jeEzUazYNlH7gT9IIUVObI3DnhTYTe0jLQ==
X-Received: by 2002:a17:906:9a95:b0:aa6:84ac:ec0a with SMTP id a640c23a62f3a-aa684ad0deamr322990066b.33.1733746190042;
        Mon, 09 Dec 2024 04:09:50 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa69964876csm37308766b.49.2024.12.09.04.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:09:49 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 09 Dec 2024 15:09:13 +0300
Subject: [PATCH v8 09/14] arm64: dts: qcom: sdm845-starqltechn: add
 max77705 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-starqltechn_integration_upstream-v8-9-ec604481d691@gmail.com>
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733746173; l=5421;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=LSPNUCmMrNEp08ttAGRjUsRLSlyCHX1E55FXJGuWuRk=;
 b=FV3CnUCD3gOR1MxlFTPkK/yEhc9zla/SK8h3Dgcj4xUdn6tm0QCI9gl0d6payzRe88PeklJsk
 7f59hcCgckNBZSvTMCpUoPM9vBwINyI+jC+TBAvcPuAI1oufWFU9Hcu
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for max77705 MFD device. Supported sub-devices:
 charger, fuelgauge, haptic, led

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v8:
- revert: add fuelgauge reg property
- rename chg_int_default to pmic_int_default, because used not only for
  charging

Changes in v7:
- adjust fuelgauge node for max17042 driver
  (remove monitored-battery because not supprted, rename
   shunt resistor property)
- reorder 'haptic' fixed regulator node
- move 'haptic' fixed regulator node to regulators
- change leds compatible *-led *-rgb
- wrap leds into multi-led node
- add fuelgauge reg property
- wrap led properties into multi-led
- add chg_int_default pinctrl

Changes in v6:
- refactor: s/starqltechn/sdm845-starqltechn in subject
- refactor: 'm' < 's', so putting motor tlmm nodes first

Changes in v5:
- fix according to binding changes
- reorder vib_pwm node
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 125 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 38c09e50ccfb..7ed5aa23ba71 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -9,6 +9,7 @@
 
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sdm845.dtsi"
 #include "pm8998.dtsi"
@@ -18,6 +19,16 @@ / {
 	model = "Samsung Galaxy S9 SM-G9600";
 	compatible = "samsung,starqltechn", "qcom,sdm845";
 
+	battery: battery {
+		compatible = "simple-battery";
+		constant-charge-current-max-microamp = <2150000>;
+		charge-full-design-microamp-hours = <3000000>;
+
+		over-voltage-threshold-microvolt = <4500000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4350000>;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -32,6 +43,19 @@ framebuffer: framebuffer@9d400000 {
 		};
 	};
 
+	vib_regulator: gpio-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "haptic";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&pm8998_gpios 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		regulator-boot-on;
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -90,6 +114,17 @@ key-wink {
 			debounce-interval = <15>;
 		};
 	};
+
+	vib_pwm: pwm {
+		compatible = "clk-pwm";
+		#pwm-cells = <2>;
+		assigned-clock-parents = <&rpmhcc RPMH_CXO_CLK>;
+		assigned-clocks = <&gcc GCC_GP1_CLK_SRC>;
+		clocks = <&gcc GCC_GP1_CLK>;
+		pinctrl-0 = <&motor_pwm_default_state>;
+		pinctrl-1 = <&motor_pwm_suspend_state>;
+		pinctrl-names = "default", "suspend";
+	};
 };
 
 
@@ -385,10 +420,74 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&gpi_dma1 {
+	status = "okay";
+};
+
 &uart9 {
 	status = "okay";
 };
 
+&i2c14 {
+	status = "okay";
+
+	pmic@66 {
+		compatible = "maxim,max77705";
+		reg = <0x66>;
+		interrupt-parent = <&pm8998_gpios>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pmic_int_default>;
+		pinctrl-names = "default";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		leds {
+			compatible = "maxim,max77705-rgb";
+
+			multi-led {
+				color = <LED_COLOR_ID_RGB>;
+				function = LED_FUNCTION_STATUS;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_RED>;
+				};
+
+				led@2 {
+					reg = <2>;
+					color = <LED_COLOR_ID_GREEN>;
+				};
+
+				led@3 {
+					reg = <3>;
+					color = <LED_COLOR_ID_BLUE>;
+				};
+			};
+		};
+
+		max77705_charger: charger {
+			compatible = "maxim,max77705-charger";
+			monitored-battery = <&battery>;
+		};
+
+		fuel-gauge {
+			compatible = "maxim,max77705-battery";
+			power-supplies = <&max77705_charger>;
+			maxim,rsns-microohm = <5000>;
+			interrupt-parent = <&pm8998_gpios>;
+			interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		};
+
+		haptic {
+			compatible = "maxim,max77705-haptic";
+			haptic-supply = <&vib_regulator>;
+			pwms = <&vib_pwm 0 100000>;
+		};
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
 	vcc-supply = <&vreg_l20a_2p95>;
@@ -443,10 +542,36 @@ &pm8998_resin {
 	status = "okay";
 };
 
+&pm8998_gpios {
+	pmic_int_default: pmic-int-default-state {
+		pins = "gpio11";
+		function = "normal";
+		input-enable;
+		bias-disable;
+		power-source = <0>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <27 4>, /* SPI (eSE - embedded Secure Element) */
 			       <85 4>; /* SPI (fingerprint reader) */
 
+	motor_pwm_default_state: motor-pwm-active-state {
+		pins = "gpio57";
+		function = "gcc_gp1";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	motor_pwm_suspend_state: motor-pwm-suspend-state {
+		pins = "gpio57";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
 	sdc2_clk_state: sdc2-clk-state {
 		pins = "sdc2_clk";
 		bias-disable;

-- 
2.39.5


