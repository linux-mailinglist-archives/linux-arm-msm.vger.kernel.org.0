Return-Path: <linux-arm-msm+bounces-32590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F53A987573
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 16:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DE5C285F2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 14:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4CD15AADB;
	Thu, 26 Sep 2024 14:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXHEpFX9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6221A158205;
	Thu, 26 Sep 2024 14:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360554; cv=none; b=HBWFcR8OG15vP4V0jO2ngMJ60THFuIkwxag2VJzLzTuaImlbXQ/PqA6CiSFTkXxcE7kPElUp0rn3bvQLyOgWEvkPLcjl+hCW0FI4oF9ZnfJIMN8Z7q8y+rvnSwYULamkTdSdJ+IJ388LaLR2h/HWTClNVOAgfS4Yz399JVcU1eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360554; c=relaxed/simple;
	bh=LBuvyZ2Sa1b0qO6et3xaAY8J3SZbm4P6xa33HuSbK7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jFlyjmzMCB5GPDAsgu5KOcvM3AJ1+Np4BhgmpA0dcRXMEaM7fbsuInzEWK+Vr59y/OdV9UHkPO0uD0wrK8EO8gYHt7Nn/aIjpk4mGEoXcj2dSOqCtRxRYt61DE0521PsVozVNp8apKnPr8JOGyTr/P0MEDMByzmO5LlerDXoOCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXHEpFX9; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f763e9e759so12571081fa.3;
        Thu, 26 Sep 2024 07:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360549; x=1727965349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJrP9CEo0oFtx6B2uv41R/vJvZqOqIZSWKIn4ncOsuo=;
        b=NXHEpFX9EUW9qh17c/3vqVeQeo0gsvL47rKnQuf00dY0dEdWsDJdi8jkzL0jzbOsao
         p2duL+kfcNH5piR0OMXpVbxMKaNs2jC65eQGRuokN5egy9+ikvhGkSjbdWlxIK/2oala
         VEy9NlZJvrI/x0autPse2BUnwqmicCIZPn0GDXMKJNGdjbIwQdZJ+mrXmcM4urVygGtN
         kIE5qWAH6JDfLEkmTl/HCnlACKULERFjNBKOSetIq7LXub6E3pzSsTr2HJolNMlwLxPJ
         HIBKRxnRN7i8cJ9kRHzsgdx+CnFMn950tIEnBU5UjLh3JWcE/XNL0HqZS3s1TEl32asG
         ZHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360549; x=1727965349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJrP9CEo0oFtx6B2uv41R/vJvZqOqIZSWKIn4ncOsuo=;
        b=C36/tVbYwNoyqgAeRxxZvYP70T1ZnhQNEt/nJe365oAoZfqP81kDLB1poPyDOcLngn
         On1BKMcrvgzuKhePVVkRcH4OTKAnK9LnaGgdpyxKL/KrjFdlRaAcmH3Un5K3zAmiTf29
         c4F+ejF6EnRJmVMAhiT9vh2J59mWzlM/nIXQcyZjXIFrdX57XyRrzQ9yncqtpOL5hMKl
         z5INB0YyKgiNId9lnsTfk1avadXb+hfsEbHj+1+QTiLqOrE5L9OztOUPvpLByTa7zLH9
         OuI2QRTqqjDCnbVhzZ4Nq8ULCynatkc9MEvjfG04+pYXBQ59VoUUtHZxy8A6R0vU9z08
         qXag==
X-Forwarded-Encrypted: i=1; AJvYcCVHPE+h4AudPBtr5rHVGz+Ln2VKzSwgDrjmW1UPilJvPAUSQpWO974HlqvwnTArQCmttWeGZPr8bNoB@vger.kernel.org, AJvYcCXtiRRdpjuBf6zKED6QTgF9RkXyTACsNxgE8bro1YVGOHnkxb1Ck/rj7xG+Io5i7RZIy4+LIc1+9W0U/z3U@vger.kernel.org
X-Gm-Message-State: AOJu0YzhryKVhQyXoV7Fz/PwS7u+Y6tFNF69c+A1B8ri/F53eTb1fJhx
	NlwqG6rA66HhLfp9UiZQybTZ2w37AmCAoamfENxMuibecGndB+mA
X-Google-Smtp-Source: AGHT+IEqCkeZr2UbIXa9vba+b3DMTmgtLrc+Swh3B7BkjtRSmzeF+gRXLlcVNWJxBxcEqlrfYHi9YA==
X-Received: by 2002:a05:6512:640e:b0:538:9e40:94a with SMTP id 2adb3069b0e04-5389e400b94mr216789e87.20.1727360549328;
        Thu, 26 Sep 2024 07:22:29 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-537a864db1bsm815803e87.267.2024.09.26.07.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:22:29 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 26 Sep 2024 17:22:07 +0300
Subject: [PATCH v5 07/12] arm64: dts: qcom: starqltechn: add max77705 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-starqltechn_integration_upstream-v5-7-d2084672ff2f@gmail.com>
References: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
In-Reply-To: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727360533; l=3668;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=LBuvyZ2Sa1b0qO6et3xaAY8J3SZbm4P6xa33HuSbK7k=;
 b=M7VA0EwNXUUBGkQVy8ES1lWhy7ZR359ulj1ip+Gqr5KyedutPUAMSPcDkxcgeqoqs6JTo1oSU
 eY2TaVS0GfOA168ZjEH4R5qvIpPLHgxsJDp6sh/6UMepPn9PgM3+wvx
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for max77705 MFD device. Supported sub-devices:
 charger, fuelgauge, haptic, led

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v5:
- fix according to binding changes
- reorder vib_pwm node
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 103 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index a3bd5231569d..ebe19c941d75 100644
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
@@ -485,4 +572,20 @@ sd_card_det_n_state: sd-card-det-n-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
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
 };

-- 
2.39.2


