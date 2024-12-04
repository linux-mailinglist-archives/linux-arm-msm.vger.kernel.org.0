Return-Path: <linux-arm-msm+bounces-40383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CCF9E46D3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB4A2284C4D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526C22066E3;
	Wed,  4 Dec 2024 21:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZtJuPRU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F192202C57;
	Wed,  4 Dec 2024 21:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733348121; cv=none; b=qcWJfqgfu6aNkcfriC1PcSEmuMEylnnTg8bkbn/tWM5cT8YI1RlBu6G11/r9ETSU3qOaWWwxtAWYVMEyQvCkrQKVX0DTPTgB9k4Jid0vG8ameEuWhVctpJ+qcsWSn+mYWIUgnv2kun1AmIhmiUBC1Vk0KFz7gHVf6iqmbD70YX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733348121; c=relaxed/simple;
	bh=Qh+xvGITXTYzBDaqW8FdkjoSIro2L81CrVRIGrvD3qk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nCyFYMZl2S48qVOCH8cSGWFHmwa2JFB1405Un/wcmMDipimulxQ/rSp7br0RF4566H6F7L1Hp0LhMz/cihU1zn7elVS3Jkp4rH5K87nAWDltcFjbOPVHlrSeg89rV3p87nlKdnxxm/PshEDuuIjE9Lf/t/biMkRed9v0OnB+wn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZtJuPRU; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d0e75dd846so250146a12.3;
        Wed, 04 Dec 2024 13:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733348117; x=1733952917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ph/G4SC+VO4P2VZjitmcYB652smYQ5RMzCQYAyRiSB4=;
        b=SZtJuPRUo9vCcvPFeCq+MqarOX397pMzhDrVZpBAeS/2ijinaKjzJp6PI4OAB/VqHF
         FENcCrnzFA7fy5stG0A4KWnrfBORp8+TeklT+bd1vQysBhHcLLrZtbeAT+jd82pAlfgn
         m7Ea322HNC66fNQk1MIJ3CMvEQAX8YmDPfoBr48ZLWxz32WmP7pkGIWau9UH8lCqpmfx
         qapr7JOYniKGEnUGn/Wdz1/m1kzDETh1YjfsGoDj+hA9/CfoJIrBMeRFfiQI4dRuEuyF
         psklihRD1wnIE5/FHzeY7WJ6WRyT9A2B85lysd4/jGfMUUMUzhzM4hbcfz6j/Y0xRyM/
         VS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733348117; x=1733952917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ph/G4SC+VO4P2VZjitmcYB652smYQ5RMzCQYAyRiSB4=;
        b=OmjEZgKQEC3O/3GRuemCNeIXQu2/JRVLSKLgGLRKMCxid7/rcJK5iTesOUjkmXCY9l
         ycy6LTw5+C4VO+3ni/5l3o8ueoi44dbZNwJhYuek9LPi7+1DHuN0AKbA53ai1UOrpyIM
         gxRQ6m3pq/+nuYAezjydVtAVjkfoAYIpmaARhZpoy73pG33ABTG/WTCysxfEugp3CteY
         dE6EQod4wyGufkcLTC8pxWFEAMxCp1Qj35nRss2CNoT2dvPJm73mJCu1Oq6q/OVouGKD
         CAC+NbA27oLkUHsOdjymcownYl7RQcMV6mvHXjDLyJuhYPhvEq6cSNer72iQ7wSWiELs
         gQKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHyPpi29k2OnConcBgTQG6kv680FlTOYW74GCTeF6nsGFjglVrMTJ0BfkItZeElMkEsaRKVL2DOz3m@vger.kernel.org, AJvYcCV5oAmPWWtfYXqU5Q0pdBdhG+9GWBmpqs5pfUSam69tm/dBi2amdx8tTvyhRexxhxdIjabPZ6c8i8q2Eq0=@vger.kernel.org, AJvYcCWBGvP+aHw5LbwJY7RUbdKjYMojsZTCAs6Pe0jaZjM6qAHJ43xqGgxGsNe/bUGWLdZ4b5u2s0KpUp8f5hCr@vger.kernel.org
X-Gm-Message-State: AOJu0Yykp+5RkKI3YNeon0ENHj9MaAueLSz7yiY+zGErj5KyHT7pX4EV
	BDrguYbM8ImJgIinGqQ3Mp4N1IuD8IKEYHqIJcqduM5nhz2gkprBs6ynAg==
X-Gm-Gg: ASbGncsW/Ds9q8tMnPvOfHxgqrzAz/hRXklQLOYwSA7TVIRH3LsIOQ0/icfeLJjWdVc
	3KKwZ5Dp6kKXXtzwwQX8UgXB1SUg3SosSxXFgOJoURI/fsP7uDDQMYBArosWomd2voUB5A9oj4V
	bnGo4UG0ICtpdVzLSqEHB9XFsUgKduFI3AjVnQkynAdW9oibIpwv2SPeXf9Gk8l/vlXkt3pX31I
	rStPs4UDWZeaV2JwgK62tlLKMB8Kq7v7biqbTp8xas8GLOt
X-Google-Smtp-Source: AGHT+IHQiqPl03Z5gHjPB14Pue9iy1xGprs4WvdQcP4lh/YLITsIqSUKYpq7++lObh7T9v5adbtqVQ==
X-Received: by 2002:a05:6402:4301:b0:5d0:d63e:6f43 with SMTP id 4fb4d7f45d1cf-5d10cb5c1d7mr9403129a12.17.1733348117345;
        Wed, 04 Dec 2024 13:35:17 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa62601b5ddsm4506966b.118.2024.12.04.13.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:35:17 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 05 Dec 2024 00:34:56 +0300
Subject: [PATCH v7 09/14] arm64: dts: qcom: sdm845-starqltechn: add
 max77705 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-starqltechn_integration_upstream-v7-9-84f9a3547803@gmail.com>
References: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
In-Reply-To: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733348104; l=5299;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=Qh+xvGITXTYzBDaqW8FdkjoSIro2L81CrVRIGrvD3qk=;
 b=jvJPu3Jb/+c5a2ZQOdfGPppePP/EjJf9l5js3XhCO/V4m0Q9VHgUxnNVP4PTRCEekRbYtIs3H
 fqGniJTfDh7Bv94697XVlWyi2ZxTNtVJZtr7EnkQGh9upCGebXxLpy2
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for max77705 MFD device. Supported sub-devices:
 charger, fuelgauge, haptic, led

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
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
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 126 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 38c09e50ccfb..c143501700a4 100644
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
 
 
@@ -385,10 +420,75 @@ &qupv3_id_1 {
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
+		pinctrl-0 = <&chg_int_default>;
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
+		fuel-gauge@36 {
+			compatible = "maxim,max77705-battery";
+			reg = <0x36>;
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
@@ -443,10 +543,36 @@ &pm8998_resin {
 	status = "okay";
 };
 
+&pm8998_gpios {
+	chg_int_default: chg-int-default-state {
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


