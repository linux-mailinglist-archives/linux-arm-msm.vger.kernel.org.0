Return-Path: <linux-arm-msm+bounces-41055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD06E9E9376
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79B80283F84
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0986222A1D8;
	Mon,  9 Dec 2024 12:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APfuaGRJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239B5229B08;
	Mon,  9 Dec 2024 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746194; cv=none; b=kndO2TM/NfHwvLzM2cnMuAEx5oYVgwXKHWVLbZjv7vzz0Z+VZzKNHhx5OAZS+ZeAJMRwo8J4CtDAIvrnwsIaZx4yTPZWuipCfkkAQoP6tqbI2dJ/VLMN3PdLvXBS7ThebF6WPHpcAF8EFGUc1uzthi95iQfzYV17STh0Eq6dAsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746194; c=relaxed/simple;
	bh=nRXVNZ0Ir0zthUX6DfaXwI0Q5MBmGNM6CenX2bSw5qE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZMAVEN6XIlFWQVcNUK7YfPtFI5IMN/DJ9St8HLSu4QLJRqvNH/LpDuCVN3XD0gf7ccNwFE0l+Je99MDq7s7ItySbRj8PA3tQxeC7Kh7B2G8vM9X00nwDq42YABPCwyqoBkIYIs8+7NMALZdPtb9qAoxE9dm0tZA8ghyYxewQRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APfuaGRJ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa670ffe302so216397966b.2;
        Mon, 09 Dec 2024 04:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746191; x=1734350991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zx1Qx+13+dzsB0ASQywpDZUNLBzIb09e6F18nInYGhQ=;
        b=APfuaGRJtBO2o4gzPyh56yjJvjo4RdFWoLC2IVSklwAmmT7vn0LtEjpKcGAbt+fAeS
         WHmO25drPNxaDQvzolgFvfLHvkzpEvdpA4/CH+b+BUJhf1svs6lcectN88zRFTtJt40/
         a/S0cBwfWh8tSTgyHow3bSgBbZL8jlDC3UX1YfIgHAT83YpQkcMtJsQdtqG+EPGNcBrs
         tDTyKZ0FhMk5ksUwkcI1PdOtLGs5EbQFKdknU/SREEg31ToMiKetJUFwSNqMA0O9Os5h
         gb2uGcfFgXKKBarErr/Wi+VgYSzEDIBuqbE7Fye1EGY9KXCtXHUWQCLjn1H7Tl/9YKX2
         PmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746191; x=1734350991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zx1Qx+13+dzsB0ASQywpDZUNLBzIb09e6F18nInYGhQ=;
        b=THkzuoNOF9jxMOY7JXtBiwNcQ9FuYvI+YThd6SDrkahF+flo2DybaDSmI3Ck7P8ogv
         AX/d3/JmEjm1+YlPDbci2u3DSYqXSRTjauWk4vlNHEVNUk2oyWfE6hHuj5LtlTEvEAO2
         68YcRGVlwZZgUYizjHyFP6fmRePwVAGyyZVV06Pe7DebhocM7km679EdBSA6JL3Vn5SV
         WnhF/PZF/Od8uDMd0IIHs2Faur5QqNhEpvAXiIpPVKfUzzsyT6c9a+wqNAKcD/j1EC1+
         L4HRAbMfJ6taYqFC/WwPoy45WlDlFCh3l6ctp/bj7WF17toYVUFmwIC883p37IvuAnoD
         ZtTw==
X-Forwarded-Encrypted: i=1; AJvYcCUlEh8nF/kKlS+FI69zLyFBu0fDiUwckDS4ZLV8WGZKT6H2kBb8zdlC4mnhBEO+rPEp6lcTuUrge2NMtl0e@vger.kernel.org, AJvYcCWPBBUvwmyYyK823Adq99uc8+0qXhHowuGW2KLg37oM18rtQAt7hDuuqlpduJHHo7EvDi9hFFRCP5Sb@vger.kernel.org, AJvYcCXtsBx3ziOi48fAn81nZhZHCGD+y17vN/h/6YfSFoXFZjlo6WWp45NOckFD4bfMC6aWx5+loWjHvep/pUY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl5EGlqwwXJ9jtUiWPOW0tB7yHDlWYk1polEvVBB1oW8i9e222
	NC0caag4/W3EsM1oej+bTjW1xtKQ15x9RHEmlxmJu1NqxHXxRzNd
X-Gm-Gg: ASbGncuzPR8jsDuD9VD1iGuOoh9qEBeApWj3S7jY0+NVDN0PjmN3rX+t9rAepOikeaT
	gxtHjflHb64IE2QXvtzHcK1/mjBhuw2/Lts5p/xiH9QhNvyjYEvFYtIj8x41DXlWO0LYs47tQWg
	Z3ghCUDGXujzdVrzPwqCvCCLSuDXsOd1jkbTQ3Csp/SzoTX8PTYw/2F078B2MHMTLwiFdzZYp6u
	/o5Ovoiv2t/SsR5aY9u6r8x0567KPuwWYI8FWnIbH9qdO08
X-Google-Smtp-Source: AGHT+IFeDsL2KGlbI5rT/6wDtInyOgP2pWAJYbREiCn0KmWKG1I9KL+bkORKtdqCXg2Ht48ZH9Xhvw==
X-Received: by 2002:a17:906:cca:b0:aa6:c55:7398 with SMTP id a640c23a62f3a-aa63a2086d5mr1039756466b.43.1733746191258;
        Mon, 09 Dec 2024 04:09:51 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa69964876csm37308766b.49.2024.12.09.04.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:09:50 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 09 Dec 2024 15:09:14 +0300
Subject: [PATCH v8 10/14] arm64: dts: qcom: sdm845-starqltechn: add display
 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-starqltechn_integration_upstream-v8-10-ec604481d691@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733746173; l=3460;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=nRXVNZ0Ir0zthUX6DfaXwI0Q5MBmGNM6CenX2bSw5qE=;
 b=vMSUgdUZ0amhteU4g8fU7+29OvbcQEv3xTJa/ydcbHXfOG2qQ6YynPXaSOFXpBp6pPgxSlNJX
 oijMb0uWHi+DiCU6WwiBYdAT1FY09L/K+W3DMQEcYjzKBUuNi8aDiMX
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for s2dos05 display / touchscreen PMIC

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v7:
- move i2c21 node before gpio-keys

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
index 7ed5aa23ba71..c4d8d7c0bf36 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -40,6 +40,9 @@ framebuffer: framebuffer@9d400000 {
 			height = <2960>;
 			stride = <(1440 * 4)>;
 			format = "a8r8g8b8";
+			vci-supply = <&s2dos05_ldo4>;
+			vddr-supply = <&s2dos05_buck>;
+			vdd3-supply = <&s2dos05_ldo1>;
 		};
 	};
 
@@ -96,6 +99,66 @@ memory@a1300000 {
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
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
@@ -556,6 +619,20 @@ &tlmm {
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
2.39.5


