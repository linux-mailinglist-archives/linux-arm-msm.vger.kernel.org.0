Return-Path: <linux-arm-msm+bounces-32591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECE5987577
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 16:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0ECD284E85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 14:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F28115B122;
	Thu, 26 Sep 2024 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LtJnhTOo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D7E1386DA;
	Thu, 26 Sep 2024 14:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360555; cv=none; b=H9aR8AumtxihcwnkLyWCAg3K87nTL9kk1YM+/b2WZEE0W9oPdNiN07/Ybol21ihxHyy11A6+TB1T/yRQId33RbisSikMJGe4yeN3gKIkkiG4GobmrqDljECe549eHelY5yZ7j+Beg/UabBWn+P1Hqb25ppjHQLL8JmI2wwq7boA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360555; c=relaxed/simple;
	bh=uzb/pMRRXrbNMZ1B4EBUMQFrU2IEuix8IJPclrqpDjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s4LQWFQiasZTvoF21C3CuVvKEWjKrfIrUBASkhJ9j/0mPJOboqtXTN3ogQK2MV1fOvIQNiG47HZLgfmXPjLLBx9s4pfnBLsuQ5tCHtRwExee051xB8cSLKO5X7ZeGcTILAU4t6XwmvOq9R4UjFOvZjg+PTiyIeDwfuq11oM9Ro0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LtJnhTOo; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5365a9574b6so1778198e87.1;
        Thu, 26 Sep 2024 07:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360551; x=1727965351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hq6yhJwbrSG9d7XomrwqijVRgleK2cUzjMIno+hWkT4=;
        b=LtJnhTOoi9bCBaQUg4s2x629AWTplpCUDXw1bn+BHET3/rIl3KJg5LLUTgRykPs4hA
         Uovhoc+By5zD26NX6DHanOj8ROQ8rL2yh1ShzhAzAc9+kg7I1Gh1zf42Lrl3sTsPSqye
         pqkwYK/wPOFP0Uheqs1sNOeJjWRjkE7b1dvS5vq3/t+6jJSkbbgvtTauYmnOnd9xVS7m
         n/0dNqNR5vhgPohWCbebNiQ/MTAHzrSSBGhD/n4zfv72Wce/Rgyzh+jxjKJWyMkp8rxl
         5wPvBt81KhAMjQQTelZOxUh3sURoKlhOEYSWTgAnrWpO/OTzUpha2Db+GH1FYdUxGnmu
         xdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360551; x=1727965351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hq6yhJwbrSG9d7XomrwqijVRgleK2cUzjMIno+hWkT4=;
        b=VO9j+wI7Pfgh+OZKU9COKulsT8jVq+JsY95+o7+2RBldIJ9Aehx+EW14efqKiSP/YF
         mO50kvDnAlStJDqQm5wyAcmbI1bz5qIH/4SKWNJEr0lz0HPECdnf9sgYlRqJdPqIRJuO
         TWs5UQJREbL1olTBqBIhRZHAud+xPXkqCQdCG1NICtssu5FF6Y9LcU76bP7lbAtNPh8g
         jI1f3N9A1NSroO84y/bmbPwrjsRiKGoOWmYJOmVvDdf2lhanhF8u1OzX019zsYGT7rag
         cUVLNCeWFopRKp7t6ybCwhrPjFzujB5fHVQI9gRfPWQW5AJ+Cx9GbQtKOTPLuiPH2i0e
         98Sw==
X-Forwarded-Encrypted: i=1; AJvYcCU89OME1rVsVb2UyUhuphpsiPRZbx0RuUHdrpPwzylnOKo2fFukcjh9s13nnPIwr9LL/CzN4VlR+d9h@vger.kernel.org, AJvYcCXo0ntjuQ0bbzJ0zSLdfX6ycafd5erbWNBQRzCoLcrFEUC+wrPBsSVze+3VGb+wsSXwN983ojwMGfCSZ3M8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk+FCrOCsOOp0vaLxg79YHGjNBtjt0YZi3xjciY6MsEc2LIggY
	tmhBYyQjxoakgqcvf8XJvNajt/ROyLlIsclpyhvPK3ufi74ndujU
X-Google-Smtp-Source: AGHT+IFquhGLyGjl/hIXjADJI9aq4YGsSfT/nuTzPY3hUb6bD12xvZZFK2Qkxj/zcOIqE7m5CtjAlg==
X-Received: by 2002:a05:6512:b95:b0:535:681d:34b0 with SMTP id 2adb3069b0e04-5387755cdcbmr6362986e87.47.1727360551124;
        Thu, 26 Sep 2024 07:22:31 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-537a864db1bsm815803e87.267.2024.09.26.07.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:22:29 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 26 Sep 2024 17:22:08 +0300
Subject: [PATCH v5 08/12] arm64: dts: qcom: starqltechn: add display PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-starqltechn_integration_upstream-v5-8-d2084672ff2f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727360533; l=3160;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=uzb/pMRRXrbNMZ1B4EBUMQFrU2IEuix8IJPclrqpDjE=;
 b=xquLi1AfUo9cnMZbXSscz0InHNdb4I/jS3CLsyTHSRbJ4MgrSkCTtJbTX36iBp3fhDRhZ/6kl
 q+00qVupzLGA90PGpws+GVwdJ0Bt8ozFf6tqPytigNlRV9DpNsi0E+X
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for s2dos05 display / touchscreen PMIC

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v5:
- simplify regulator names
- remove single buck index
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 77 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index ebe19c941d75..53b9a7d71f1d 100644
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
@@ -588,4 +651,18 @@ motor_pwm_suspend_state: motor-pwm-suspend-state {
 		bias-disable;
 		output-low;
 	};
+
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
 };

-- 
2.39.2


