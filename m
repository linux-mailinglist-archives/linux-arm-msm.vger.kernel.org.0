Return-Path: <linux-arm-msm+bounces-33597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5DF995500
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 18:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C95BE28530B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0991E22E0;
	Tue,  8 Oct 2024 16:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqAFsXWx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF341E1C2C;
	Tue,  8 Oct 2024 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728406333; cv=none; b=DszyPqdRT6iVCDx6iTVffc28jCkdgWaU/DlV4oLMj7ZOO0zyjjF8v6sTI7QoC/vZmyPIEyIH3Yr2AVm/fWVPdVfvGw3lpUwOg5jBkyRchLv0I3RVh4gSk9A9erNckUMyhzmgX0HzTVwMp62ESGBLcdaxSchu9KKsg3ZE7Q1SJFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728406333; c=relaxed/simple;
	bh=NqCQWLggrQIjnF5xOmH7+34dA1dVfMw9uR64fLM6aMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=llw3PjP+mJnAv8NcbD5J3ZFb4Ibph/+hvINdSc4LfCtexUYgIuUlyltLf5+gRUEwWfruYTpKU+0KK7GDb4cWo710xhR8yzEz+KOQVj39SCG0F9AaoxtQLSAIu6D8vT+rk0gOB1JjJi+4x6gj45JJJTrztBgSWd+8KjPGx0DjHXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqAFsXWx; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5389e24a4d1so7252508e87.3;
        Tue, 08 Oct 2024 09:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728406329; x=1729011129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKESfSYrQ7Ve/4e2rVvyOg4YJptWBqaLBaB6huUwNz8=;
        b=FqAFsXWx3OYiVTH93giB6MchA5MxpVdhDoXUg3UST2m4KPkFsHEN3uTEtdR6xxHo8c
         vk06x252pghBe1J/Dce72wQpOW8T224fGWn2wav1410yl5qk7KO8R6A1sUMx5WKA7UWB
         3obEMp+hNKU3qg2pkKxg9MX720g9wrKqQLCu26+tZT5Z8FcLdnIUrhqELhQe17kHACMh
         KNNc/CIFn8IJv7P3cUfVPkUbb1XUoncbXyoD68ihwtbElMRk5h2D/2LLtzMxAHlqbgcB
         xOQlfvqPNOAQ4TkxdTElpBAPkQn09Kp0qLZ0FsbAIWG2Ttwk7aEB4USQtJws1HyfCbyx
         LAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728406329; x=1729011129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKESfSYrQ7Ve/4e2rVvyOg4YJptWBqaLBaB6huUwNz8=;
        b=nUWzY1e5cPV5+4EfHhkomFaBNC1kuR2prL9IpnwAgqQgcp2Uh148vhF+RwtQteJILH
         kTn4P/ntFiW9NZez5N6fSj88frupZVwnmpyBjN+ccMWUjKKNkjB8aF/MrRjDuDhWYS1d
         C02hzET2Nnz1h2T1/RKAhUYkXOgkAUT6HPqTtJbLBDsy3Urqe0q1DxRE/pdJNOHVqBtT
         YAMsg1KIuV3b3aoMCLnUGhUEJlQMcI+HKrW39X5deDa1QXscNH/sd4ozSQ5RPK/CmpME
         yhp3Br5ybYY6JZjkffCpWfkhkUOcHZ3Nl7CYMK0fLjk+m+b4VtnrEHc6/kgoS6kBgUFs
         sgWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGPV89w2XwdnQVcLE+ejc6xmoMSThGU9CnQaIhuef55RxwbwqW30rsHQoRikLoiaX8yph4MhIfO2r6@vger.kernel.org, AJvYcCUV/aU9R5zY6FMu15VTLEpN+7LhUQ7me9Cg0NJbDqLXXniX4E3fvqx/XQuNQybsOKm/ZitqIRLLYnMn1ryo@vger.kernel.org
X-Gm-Message-State: AOJu0YypbWlY5F5kKRKLMeC/Hqt0SJeSY9AXgInykNzItKiTY8hNyLp3
	gyK778db50ZnafrE0IWk52lnH+aY1rXLBWYAQuuw/nX7joufx2BZ
X-Google-Smtp-Source: AGHT+IHzHuCKrE/GYG+/n1LZNg5C1sg99PXkpAVYsU0V5JQE5eXOKAKz8Y+VFTzmaub4bdPYS3lFhA==
X-Received: by 2002:a05:6512:3b1e:b0:533:47b5:c023 with SMTP id 2adb3069b0e04-539ab8577a5mr8436746e87.13.1728406329085;
        Tue, 08 Oct 2024 09:52:09 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-539aff23e5fsm1260736e87.235.2024.10.08.09.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 09:52:08 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 08 Oct 2024 19:51:44 +0300
Subject: [PATCH v6 07/12] arm64: dts: qcom: sdm845-starqltechn: add
 max77705 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-starqltechn_integration_upstream-v6-7-5445365d3052@gmail.com>
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
In-Reply-To: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728406308; l=3954;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=NqCQWLggrQIjnF5xOmH7+34dA1dVfMw9uR64fLM6aMM=;
 b=NgoMpvP2GeGALJHFuf0oQPmlCBGqhkV3vMDQcA6GpN6IBnPLSHDpbj6QLsea8KNxGUeidhgJT
 bzmPxwjCkkXCveMKlkvpAOIkxtLE5iwOsVCfTYJ05utfckUj77XeqBP
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for max77705 MFD device. Supported sub-devices:
 charger, fuelgauge, haptic, led

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v6:
- refactor: s/starqltechn/sdm845-starqltechn in subject
- refactor: 'm' < 's', so putting motor tlmm nodes first

Changes in v5:
- fix according to binding changes
- reorder vib_pwm node
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 103 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index a3bd5231569d..7d1d57f41024 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -18,6 +18,16 @@ / {
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
@@ -90,6 +100,27 @@ key-wink {
 			debounce-interval = <15>;
 		};
 	};
+
+	vib_regulator: gpio-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "haptic";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&pm8998_gpios 18 GPIO_ACTIVE_HIGH>;
+	};
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
 
 
@@ -385,10 +416,66 @@ &qupv3_id_1 {
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
+
+		leds {
+			compatible = "maxim,max77705-led";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				label = "red:usr1";
+			};
+
+			led@2 {
+				reg = <2>;
+				label = "green:usr2";
+			};
+
+			led@3 {
+				reg = <3>;
+				label = "blue:usr3";
+			};
+		};
+
+		max77705_charger: charger {
+			compatible = "maxim,max77705-charger";
+			monitored-battery = <&battery>;
+		};
+
+		fuel-gauge {
+			compatible = "maxim,max77705-fuel-gauge";
+			monitored-battery = <&battery>;
+			power-supplies = <&max77705_charger>;
+			shunt-resistor-micro-ohms = <5000>;
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
@@ -457,6 +544,22 @@ &tlmm {
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
2.39.2


