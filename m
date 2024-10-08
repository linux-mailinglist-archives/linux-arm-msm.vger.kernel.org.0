Return-Path: <linux-arm-msm+bounces-33598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA98995504
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 18:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 591CEB25787
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8747B1E2306;
	Tue,  8 Oct 2024 16:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTwgHOwx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71801E22F9;
	Tue,  8 Oct 2024 16:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728406336; cv=none; b=S3xWSGFhKxNINB6dgFPoH2FA6SrcY5LEKn1T9X04kha0jfzOkxUJr/CGM6LzyjBvH1v2UotDVqqik1zCbxyMSB61VtbdCWT4Wmed5Ngi6eev1eXIMFpQNttSrpdI5/94SG16OZGclcV8+yd4fBuCHJszufaTT5S8ztGhdzYmOAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728406336; c=relaxed/simple;
	bh=wpnib+1Grz9objorNZJkWtA+40DP54d7IOIrdVTRUqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VIqog3RiQrxZxJQaANgKoTg6ICWlEXhxWPEqewdDOo4xSWrYt040jystalWdJDxyPgekxcUhLKRG1WYVrquEUNWZ4k3LwL7m9aADBetuQiDm9zkMHunLRGxYlu1IGapLe9LAHF3z9tW5d2j4vxXLjusI1tGaSr9cro6fu0A+11Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTwgHOwx; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53992157528so6303520e87.2;
        Tue, 08 Oct 2024 09:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728406333; x=1729011133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKy3d95DyP3xtBh1w588dnVQnCmF6HjBrF0HUIaj8fQ=;
        b=gTwgHOwxEXm2iLtY2TZc+dt/tuXH6kNS6OCeh9C9531iSz4UQ9llzwVqMGlKkJRtWA
         BxRrvTaRI52DXacqypU0xzJJOTJi18w1SSkUFN/Mqm0gUU8ozHVH2VA43Kw3szoVpTQ2
         6BI2K86KCLriR+hNOxtcWBPV51IUAuURC6DMogX57t/ZnC572zZwjmYnkmgCTKRypR3B
         0/G8I3qKuZyznELiEb0AKUyaxIgpH9u48IwF87SpU4wfSMzTwDZmO8TfJ7cGtJYTx/N5
         BO0R4kAIDZd4s1Y8xvQq+V/OpZFoW0bClPV5pvTnMlesh3ELfHpwf/YZ//NeW1ztTivN
         EPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728406333; x=1729011133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKy3d95DyP3xtBh1w588dnVQnCmF6HjBrF0HUIaj8fQ=;
        b=I3fq/MjaSlJ9yIF6hwlnRnPMggoDIAqNIUrHxxKgtDrx02VuB7a4mwkH8I50e1j3kS
         3iD9ZxGO9i76ZoGuvmZpGc1bV7nuDYA/QgnLrZvJc76jxPbZUFvE7a0nrDx6OsSJEC5t
         m5ZlirWdBnXQcn0s9/xC05jwDwm8TyeBmm1KB152QBN6qEVrwV5WvLzwgjNj2Ki/b9JQ
         sGZ6nRgJjhcup50SdCQSId0cgmzgjfu1tiyeuhm8BtFfcGAarzsTCs4WOJTO/K3Ofx5U
         KF8vcFai/9m7uXGhTqzaz2gcWtqx9qJO6ctfL86PvdvUF2+CjduKq/HkhlS+kp1Ie/HY
         c07A==
X-Forwarded-Encrypted: i=1; AJvYcCUkcmUKWu36gH/OAdJKMaLArozaOEuXPtTbrZQnplgtTuYUWLhGeqpgVYQat5Z5Wd67hA+md3ZScMMDumZn@vger.kernel.org, AJvYcCWMn3tBGQLh3N6qW7sAayMc8AXXvSPmNEQ/yHoCLMwRwBR9GXwMu5ECl43RpVhKYDCQnKiPdxsInvuR@vger.kernel.org
X-Gm-Message-State: AOJu0YygbyeaDI0dQ6u7QYssZREjgHCH3xc92hZRjZAPfI5WGC9OZO1C
	TT9dMS7MKaMqELQoXMNzKHNdYwWHNyO9beW4ke4L4zHXlQh2rJoXjcx/aA==
X-Google-Smtp-Source: AGHT+IEAkGCt0mp4e4PRDTwjRUPlbvAZKwYLTbRPEt6EfcXZ4TNJfv9TGMNtONAypuSCm8agjeIukw==
X-Received: by 2002:a05:6512:398d:b0:539:9f52:9ea with SMTP id 2adb3069b0e04-539ab9eb09fmr6857680e87.53.1728406332658;
        Tue, 08 Oct 2024 09:52:12 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-539aff23e5fsm1260736e87.235.2024.10.08.09.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 09:52:11 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 08 Oct 2024 19:51:45 +0300
Subject: [PATCH v6 08/12] arm64: dts: qcom: sdm845-starqltechn: add display
 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-starqltechn_integration_upstream-v6-8-5445365d3052@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728406308; l=3442;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=wpnib+1Grz9objorNZJkWtA+40DP54d7IOIrdVTRUqw=;
 b=C03p85AO5+oO0PqJsfAskqQXM82LXlFflDBNUjj/UyJrurVaRHY192OkXFYUmFkMz5+USfBvi
 V2GRSPwpXmeAPYUmTgKLuoYrPkjjqOVFnLN4IkvLIlSuJ3iiy0sVXW4
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for s2dos05 display / touchscreen PMIC

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v6:
- refactor: s/starqltechn/sdm845-starqltechn in subject
- refactor: 'i' < 'm', so put tlmm i2c node before motor*

Changes in v5:
- simplify regulator names
- remove single buck index
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 77 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 7d1d57f41024..5635f3b088cf 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -39,6 +39,9 @@ framebuffer: framebuffer@9d400000 {
 			height = <2960>;
 			stride = <(1440 * 4)>;
 			format = "a8r8g8b8";
+			vci-supply = <&s2dos05_ldo4>;
+			vddr-supply = <&s2dos05_buck>;
+			vdd3-supply = <&s2dos05_ldo1>;
 		};
 	};
 
@@ -101,6 +104,66 @@ key-wink {
 		};
 	};
 
+	i2c21 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&tlmm 127 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
+		i2c-gpio,delay-us = <2>;
+		pinctrl-0 = <&i2c21_sda_state &i2c21_scl_state>;
+		pinctrl-names = "default";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmic@60 {
+			compatible = "samsung,s2dos05";
+			reg = <0x60>;
+
+			regulators {
+				s2dos05_ldo1: ldo1 {
+					regulator-active-discharge = <1>;
+					regulator-enable-ramp-delay = <12000>;
+					regulator-min-microvolt = <1500000>;
+					regulator-max-microvolt = <2000000>;
+					regulator-name = "ldo1";
+				};
+
+				s2dos05_ldo2: ldo2 {
+					regulator-active-discharge = <1>;
+					regulator-boot-on;
+					regulator-enable-ramp-delay = <12000>;
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-name = "ldo2";
+				};
+
+				s2dos05_ldo3: ldo3 {
+					regulator-active-discharge = <1>;
+					regulator-boot-on;
+					regulator-enable-ramp-delay = <12000>;
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3000000>;
+					regulator-name = "ldo3";
+				};
+
+				s2dos05_ldo4: ldo4 {
+					regulator-active-discharge = <1>;
+					regulator-enable-ramp-delay = <12000>;
+					regulator-min-microvolt = <2700000>;
+					regulator-max-microvolt = <3775000>;
+					regulator-name = "ldo4";
+				};
+
+				s2dos05_buck: buck {
+					regulator-active-discharge = <1>;
+					regulator-enable-ramp-delay = <12000>;
+					regulator-min-microvolt = <850000>;
+					regulator-max-microvolt = <2100000>;
+					regulator-name = "buck";
+				};
+			};
+		};
+	};
+
 	vib_regulator: gpio-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "haptic";
@@ -544,6 +607,20 @@ &tlmm {
 	gpio-reserved-ranges = <27 4>, /* SPI (eSE - embedded Secure Element) */
 			       <85 4>; /* SPI (fingerprint reader) */
 
+	i2c21_sda_state: i2c21-sda-state {
+		pins = "gpio127";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	i2c21_scl_state: i2c21-scl-state {
+		pins = "gpio128";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	motor_pwm_default_state: motor-pwm-active-state {
 		pins = "gpio57";
 		function = "gcc_gp1";

-- 
2.39.2


