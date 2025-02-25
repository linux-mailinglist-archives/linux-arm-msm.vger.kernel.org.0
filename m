Return-Path: <linux-arm-msm+bounces-49331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA97FA44673
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25A3919E0BB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 16:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1796119F471;
	Tue, 25 Feb 2025 16:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPEwMU5L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E72D195381;
	Tue, 25 Feb 2025 16:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501572; cv=none; b=uLFDPjjpwGUyS6klet9LBBl6tWUwCNzNV6YpNf2fUutlLnmaqu9q5V9nUnkbmSV7nH+dTDHiEWLoqmNhYPPxrXpSIdu+9BIOTjlzqVvC8YSXxWCsm32LnYnd96Cvbw3vn+8FG+kM7leVwe4ze98+LkBrjMFNLRkPWWxuu/e9sRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501572; c=relaxed/simple;
	bh=McfRBWiHvrxlSbAXFIgd05w0mHfjnH6sOxPQdNpFtrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FkX6CE1aSH5/IO3hzmHOIreOMg2yjcFJ7UpwBBVNGpODQ32Ayhl+8eFOddwN4TBuqg6oaFY5Xrem79QLzcaIVGzZqwrx/lWolDUoyPAyMFPb5MbMH6zm0+oi0nZHu4Yo/Ej5kO+fVm8OGT9RZLwn8Y1WWWbm9QfCGSkFNrd1kqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPEwMU5L; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaec61d0f65so1162164366b.1;
        Tue, 25 Feb 2025 08:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740501568; x=1741106368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=291Tm+SKOCmX4o1mPt1wPVPJDAmDACgIe4TmLpUCYW4=;
        b=aPEwMU5LN4+zlL06Lr9Hku06ahg19YR5g9m8QvBJIAUxJOTVzSjQyB3z7OPYs9ds5k
         YBfD3lpFHf+Sv6He+ssQE2RWcb2Uq3tCO0glysQa2g2rePePDTXCbDWTddtWetHgGZI+
         pu3PXsJvuQYlRSvfyHagZQOB1pp4wvUH2yBP2d0C20Lq6G6GB/6yuqyqy9YtHWsLMwmQ
         qmS8ikA3+zZxbQ0S2ilDNsOEm85yOA24PQ2rJGN3X6lx1EG/VmfYJuhAWzxj3+H6abRa
         duZeeJGqV4cFvbX8RR2ZvWyu6k+25tMj342DcNRua0ZR/hdM6mWcb9oiz4VKZ8YJqAQH
         h4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501568; x=1741106368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=291Tm+SKOCmX4o1mPt1wPVPJDAmDACgIe4TmLpUCYW4=;
        b=Qz6YSaJU6kaEsnepCHTyR5RLuP+UC4QnjgIMWS5Du0iaplCMye1t9LNBnNhGLET1ns
         h4uR/UBr6jrMv80RXu+fVAiJx9/FT8cjM3/72FxMDAqamXFn77/1c+2PLko0yosCsOZE
         qYY/KXPdEMmqNxHsVZeikMuj5j1Joe0KDapoU50mwLlIlucrEnoxo/O4EQrZbG6SP4jy
         yckhXHYz2wdL6OWdfma+pGojt68Rerp3bfWpkv+XvLJ65Fmoh/ZwmTQx7qzRsEof7itj
         DLlsWh7s0dN6FtHjssRf+ZmiAHM0k5tsVulPddUiPwdeFvbAUz/BU6MkHLMTrxoGpWuN
         b0Kw==
X-Forwarded-Encrypted: i=1; AJvYcCW9Er96B+TKHhBWKdUGjt2AlwQ0gSq8pcDrN4qonSjFSyIfoeGRzfWh6oKEWgLffI624RDDxkBoOKSr8Es=@vger.kernel.org, AJvYcCX14srJVHgQ5na/S/H+xjafwiBbNKBu17fDovLhIPNKVeBbSSwV2b1fMJeRQbm5IHCQ4hjYnZ6v8t7U@vger.kernel.org, AJvYcCXlvbJqahKNKj4sl8mdstvdHtNvhIoHAOqf4tydI31njeU76EFDnwLxy1cB9Al4/Q1vi0cHmpywyGsa0xMR@vger.kernel.org
X-Gm-Message-State: AOJu0YxP+HUIrInWjKlMpZWazyhENsxrBC6iGLP/579zLrxwwoxG/OKT
	nFTlerPi7fmajfz4pmyTUkL2lhYhqTUHLIq6OfTF3SdImPELlKeStmypjIna
X-Gm-Gg: ASbGncudqHTxj6PPjP5go9YF47XpXKzxx8Kbn2vMi9bHpL2Od15JYMKnKmDeIl14O5G
	Ly/3IKso+FUbaVkbxmPgFVhRlOHcqcR00mBhwUNMMVL5s/2Vp1M+uAEOg+O1htPk7nLS8WJPyoY
	+eb31svIIKZ2gxxUljdsVD1aWyJj+ku3vO3WGrajLdzoycB+ut+JXpYFIZkwk7mhAS7wNsF97lD
	UjQF6GkNlHzvm7jivf1BzSM56lGU8aeFG+S60045YKZvxrevWhb26+gHdArAFTGA1wF9kvzwdJj
	mYSU1rbrXz8dfvpduVlGNnkB
X-Google-Smtp-Source: AGHT+IFQ5F03/cjZ2VOsQ7IVrdnanVkMqF0Q+LARlZyEgHWWXsPdAjpDSj43pe7EPK4Oz4yllf4B2g==
X-Received: by 2002:a17:907:7815:b0:abc:a40:4194 with SMTP id a640c23a62f3a-abed0c67139mr371267766b.8.1740501568102;
        Tue, 25 Feb 2025 08:39:28 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.22])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abed2055011sm163999866b.156.2025.02.25.08.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:39:27 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 25 Feb 2025 19:38:58 +0300
Subject: [PATCH v9 07/12] arm64: dts: qcom: sdm845-starqltechn: add
 max77705 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-starqltechn_integration_upstream-v9-7-a5d80375cb66@gmail.com>
References: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
In-Reply-To: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
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
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740501555; l=5814;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=McfRBWiHvrxlSbAXFIgd05w0mHfjnH6sOxPQdNpFtrU=;
 b=vVlet2C71d9RDUfhgQRPFY2DgR95cdzhsprkYIFEgKFiNdP9FA9yalsgjZFETGtUuzZ7vhMDx
 1P7Fh2yPFdPCqZRQJuxebUUq8le4I5O5mspsjgbK0BMpCA0h5lP9oAv
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for max77705 MFD device. Supported sub-devices:
 charger, fuelgauge, haptic, led

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v9:
- add tag: Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
- adjust haptic pwm period to match 19200 HZ, as in vendor settings
- move charger and fuel gauge node out of mfd node

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
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 130 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 38c09e50ccfb..bd5c8b319ddf 100644
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
 
 
@@ -385,10 +420,79 @@ &qupv3_id_1 {
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
+		haptic {
+			compatible = "maxim,max77705-haptic";
+			haptic-supply = <&vib_regulator>;
+			pwms = <&vib_pwm 0 52084>;
+		};
+	};
+
+	max77705_charger: charger@69 {
+		reg = <0x69>;
+		compatible = "maxim,max77705-charger";
+		monitored-battery = <&battery>;
+		interrupt-parent = <&pm8998_gpios>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+
+	};
+
+	fuel-gauge@36 {
+		reg = <0x36>;
+		compatible = "maxim,max77705-battery";
+		power-supplies = <&max77705_charger>;
+		maxim,rsns-microohm = <5000>;
+		interrupt-parent = <&pm8998_gpios>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
 	vcc-supply = <&vreg_l20a_2p95>;
@@ -443,10 +547,36 @@ &pm8998_resin {
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


