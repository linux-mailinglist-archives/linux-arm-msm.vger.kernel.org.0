Return-Path: <linux-arm-msm+bounces-40385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9619E46D9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7914C165DD2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865A8206F0D;
	Wed,  4 Dec 2024 21:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWupeMdl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BED02066D8;
	Wed,  4 Dec 2024 21:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733348122; cv=none; b=iH1rn2ZkjV3YNpEI6E+1MNQqWSBYUqketdytjlQ7Snm/FMJDt7jJNAWhcwWdoYLGv7j39WL6OI0khJAQJF4ZMTmvtt/GfoFoHop4ahYj+R2NOiYhhFqYyJ325BYGPDe1MUPpNuidmVbGTKOV1t9aEYvXIACSK7aQkbGysS0sIBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733348122; c=relaxed/simple;
	bh=I1B6bGjvBKFt4XBd7a8aKNKz7MCwstChV5lIYk6cNX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/RJZm0xW793GVxu6GLQlLQCvhBjJHZx0P2lefzARaRlIhF2exUgwjJRprXskVvDpaxbgklSDgSpOUE06L0CA/IJ6TsvGtmpKC35XvYdPeOpEyWEY17oQvtMyKFGoA7dmAH3mplMbfpkcay79mMgaULdBv48o5OrAtZH4vTZCpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWupeMdl; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa51b8c5f4dso26500766b.2;
        Wed, 04 Dec 2024 13:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733348119; x=1733952919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9v4tDLIwv4qcBhvA0GjLro+h+EIf4V/3OxoVVMD7YQs=;
        b=JWupeMdlNwNy2OFyCz17GB6sQcU/YhejD++ewL4S/jDREdRyRmbWkUqpFOqzhz9RPb
         k9XTQ5sgCVq7DFh8/ew+oU5o2DXrnqt3QrOKL3NsxP+Klw5VfUrFeyEjn3UZIfetnjQQ
         2vBXqZi0zic5rs77rFT+tPa0peczWjwGu2ui3byQF1KMeT7TA6Cvw01YcIVUfb3iJIDX
         AYg7w56brVaFxCRyYAyXD4zK2YnOeE9oTOU/SJZl6HnJH/AgkW0qNeh26eju+4t6JsfB
         yJes7MRe9sT+g/N3C5n7eUqDJK9n5GemncGNUDqRR7fbvSd0QRjF8JizlIi+c+g5/je2
         uTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733348119; x=1733952919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9v4tDLIwv4qcBhvA0GjLro+h+EIf4V/3OxoVVMD7YQs=;
        b=A57+Mm/jdhhOionbVsPIJ7QCVacC+NwcRN3aWTZrPUL288C4jakoIpDszyJPKdhJvB
         RLi9N5Dn1LX0uOZlppKBtjqNql0agfAqIHLF02o6z5wZAyT9uP4V00JUNs4MejkmXvK0
         HjQJ3SkMNtCrDXxfenxXrfEslLPJlWt/tmLGY0gwcpmzjCxb/0YE6oPqOsdHgsVI7rw5
         gyCWKbHlyjrKf+lZLGWBAoB0XqUuhrwXeB1Atwsdb9970wM4Wi27P9Mc1r51LAiJI8sM
         FlRDniOqz7kYQu2R+Pr0xshAmAJuia84uknOei5/3GyCcyCdtb+Gq4/qcimq6CUYezXe
         2v6A==
X-Forwarded-Encrypted: i=1; AJvYcCVMcLMsHrYOHNfE7HJd963S+PhDp6xp1fvv17Nn/uJggprEnOo9oVIt1sKJxn6LvRLAsWxmC8qQitAQ@vger.kernel.org, AJvYcCVUzuY/koopNNNplJU09aQf+wTWru3FMkHiaj6yOlfmMVHe4H6Cwi3OdzC6End7dDQHk0b4kUrQwkD2R9I=@vger.kernel.org, AJvYcCWKUYEPd6nsG6oFD44lpIUc3t8lk0YZTKSRk7HivaB++EObFNb2qXJBmktPb5tBWjnMAIWLF1MGYUkri39R@vger.kernel.org
X-Gm-Message-State: AOJu0YxoJ8oGylVjsU5iqiZ1QSOYyuEVWlfwO6wTUH1hlGaWpZtnuWhG
	rG6i7TBn556a9jlBXVGt52qoXSHMig+RNOH/hINUapDjRe1urwF9QAWuFg==
X-Gm-Gg: ASbGncu2J6RVphUxo4deZ4dgYj7N20KNYtAVVHsHkv6TAN9UU9LmAOpPuIq31BMXUKy
	70J1r6SgmEZyBnR5YZsPkaQykuNqHqlniWB5vQBW2GAZygEd/ip08raawKBhKcEy1ZxVNG22FZr
	gBp5MwVbycg3UApX0rkvd6tn/Vkh0rC5/0GyTCau7ah6uQFo0zT/hviliHvKz1AMduMqxhISIIv
	VO6IzjTL/W6fuP5EQWnoJZfgTInCiKaMYTlSaX1GjJBu4Yb
X-Google-Smtp-Source: AGHT+IFgAGmoGJVsJzPaIMq30KV2D1Qq5ONA0mztbUJgS9L9bVoQF5OqOcYcBkf96O2meVUzed5IGQ==
X-Received: by 2002:a17:907:7714:b0:aa6:2241:e170 with SMTP id a640c23a62f3a-aa62241e6c2mr81938666b.19.1733348118644;
        Wed, 04 Dec 2024 13:35:18 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa62601b5ddsm4506966b.118.2024.12.04.13.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:35:18 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 05 Dec 2024 00:34:57 +0300
Subject: [PATCH v7 10/14] arm64: dts: qcom: sdm845-starqltechn: add display
 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-starqltechn_integration_upstream-v7-10-84f9a3547803@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733348104; l=3460;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=I1B6bGjvBKFt4XBd7a8aKNKz7MCwstChV5lIYk6cNX0=;
 b=qPkS4glj1A7X1Fo7e/l/W2eEBby2Hoj02MyvEZh0gcW5CyvQjrcW9xU5Xhla4KkcdCclvf8fu
 qF4/r0Yf36TANRXEqmxcc3qd4LQYn7Ovc41Lm7yVrcT0UPSeqWgvNg/
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
index c143501700a4..44a70f2f5a09 100644
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
@@ -557,6 +620,20 @@ &tlmm {
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


