Return-Path: <linux-arm-msm+bounces-49332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD3FA44665
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22E217A8B8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 16:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851111A2392;
	Tue, 25 Feb 2025 16:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koZmXA7D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A689A19F130;
	Tue, 25 Feb 2025 16:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501574; cv=none; b=qKoUsZE3yzEjQk9ePekBhE4uZTHthHiVfKumjIxNDKV14eM3ZDRO+y42C3NT76n8YZdOsbMR1rRJQhWbKkO0KGIDRDLx35syKe53m7j0vQSMr3ci674RBhNq1JahdAuJmsXyyOffi7x7Mexmg/knkP9XeYQ08X1KnHECAbn7ljg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501574; c=relaxed/simple;
	bh=T5YcxfnQBFkit6vIFdJo2Iyytp6hTBnWhNy868bQh5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nSFV8JLS6+zc3sfhbSw95PygciqYWs8SkTaDIPPIZdKzSC5W26mI/uHDOKDtSXzn5XtkbemL0MD/Tokq89V1c+9jPw1rk11usy+wDk2M52i9FvRGBWMf6oEuLOlb5LYP64d4/KhCGhPP5kwKo06n0v8BkEOzb6tLBidUJrAPFyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koZmXA7D; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso842791666b.1;
        Tue, 25 Feb 2025 08:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740501570; x=1741106370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WY8gl/9/WuOiQS6kmJ11fMrRlmlSb8HWPxuXu1hB3Rk=;
        b=koZmXA7D3ECCWLX2kGox7Uq4Wushx+ykEkhfqL8zg74J3s4ki/Q4z7F9pfky2M0Lrx
         PW0FpNHoiO3/jWQtIEYQf1X05UUz1NxecEeoszCyD5a9PmOOe7wa/nCe3mHRex93urL0
         EY/OQQ7M15dShCSnepDXZDPx9OUI07sbmpu+9BS7W93pSVd77KAtbtxebkbU6Qa64gdY
         jUFWgNoF9JRWxi4p6+YNXkVOE+QvxlTeH05F4VG1A6KjLC3jHmlIpak30oWyNOR1/iBW
         QQ3DsqeFBuYRngN+9Wntoq13W5FCzIY0niKk/NoTbXkEI4yYD4+mU+icxdfh/vVdRWS4
         yP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501570; x=1741106370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WY8gl/9/WuOiQS6kmJ11fMrRlmlSb8HWPxuXu1hB3Rk=;
        b=d9MloIQ/DuCsUTrznFqsj8fPZikQj7Uo/T1Yy4mjjcYshXsGpTL2XGHJCjdcnjBBks
         Sp+r9xLkMMr/KmQj6mAhCQOxxz5CRTE3yTECophrUZ0DvdMowW8Z2nhOLbeUnN7vdwIp
         6n6iSHt/AIa6hw2ALLjLtPDJYUswvyZC/16dCSsIMSTLLJFxC9PwlmqY3//bB8wluFoI
         I4CyD+gV/28btE6jhwZIXtkow17s209A6Dn/Qt4c7iB1+MCwhjCSi8zSjjcxbXtVlToA
         CR/SHW2THCvnkTmAeh5YHjU7jsD0++uFJjAjfMt7I1klNZtcrWU/XOMQvxWUgSX9QoK1
         R6bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIIIq/VCI9naBoNptj4Dr1sfMyvOwGFfodcdAbDtX1QY/hm8NuRF4UGZJFIwwOJKvY3MEuVB8+vaBH@vger.kernel.org, AJvYcCUfgjy7zPDZNPRxMSB17QZMvFPmRnG90z7327fbzpqz0jNKyW9GlCGFW/NfaIW+kALhCTt0bS1HeeTERT8=@vger.kernel.org, AJvYcCX1zIRW8kDjnkQmV2gqvJrbRxUiS2sGQjtqdu2bdri+eGX03fg2iEmCbI/HOPjpFFa4B7FDXOnMXUjqFekc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq0U9EiGtKY+FYI442BniHX1rBjHdtDzaZBATRqyyXhDfHHVr6
	5fHGLB3gXiNwsXD4MX0yA9+U01nGyZffvA+IL0Wp9vvi3MJv+D6b
X-Gm-Gg: ASbGncsequ1xJtABdtmnkFe9RTRygbClKKjpj4P9ZC5zCflWycwymSUDzZHWXRZuxxf
	MaZBgU6wfkRzD1q0wRy8v704rdCdS1gymw+DBQUe0MPVmxG2QLIgygSVnamdjpNi0jDBZd4MWGh
	I2RCXGvwvXvTAIv+lEEqeOmNXmT7G945UFsZtXPz/hV2PJOkLwIiUFWrbkK1ZC7k+zLPOCJOPsZ
	7jV6IDjnPGVM1O5ps5ZGtcAXl8um5MqTPE5qR3IMnXFumEAEAQW0nGHgfrBHvyAVqPpeDqAVeMu
	piQ9iw4xvGDMQyKZm5iX2m+0
X-Google-Smtp-Source: AGHT+IFQ43lrVKYL51nnREjNo1p42iqQv4YSt93D75dmtUv0ub56vr6weR1e3SHMQTEwhxtaS3c7uA==
X-Received: by 2002:a17:907:94c8:b0:abb:6722:f98c with SMTP id a640c23a62f3a-abc09aefd0fmr1789566566b.34.1740501569615;
        Tue, 25 Feb 2025 08:39:29 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.22])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abed2055011sm163999866b.156.2025.02.25.08.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:39:29 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 25 Feb 2025 19:38:59 +0300
Subject: [PATCH v9 08/12] arm64: dts: qcom: sdm845-starqltechn: add display
 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-starqltechn_integration_upstream-v9-8-a5d80375cb66@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740501555; l=3611;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=T5YcxfnQBFkit6vIFdJo2Iyytp6hTBnWhNy868bQh5I=;
 b=rTd4ttFJT4eW7vBmiUdOoHVZQCE8OKMnQjKJDE5V2dgcrq1gC9e+YLoIConuN5oZS0gAmHpNu
 ns4/duUeyjSAQxLVndTafffh7NN3li0/iNHfWVhnVH1Yog7fS2CEZKK
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for s2dos05 display / touchscreen PMIC

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v9:
- add tag: Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

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
index bd5c8b319ddf..77abfadb4cc5 100644
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
@@ -561,6 +624,20 @@ &tlmm {
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


