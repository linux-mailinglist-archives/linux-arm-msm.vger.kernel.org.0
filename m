Return-Path: <linux-arm-msm+bounces-32593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACC198757E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 16:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DC88B25004
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 14:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1527F15ECDF;
	Thu, 26 Sep 2024 14:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dmya00Fp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2619015CD7A;
	Thu, 26 Sep 2024 14:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360559; cv=none; b=sz8ppJp8NOspwBCceN3OK4D+8cm5GPwI0l8iDqbqVuIsIpbyhOnaBkbNybhINZLLDBqSu9As8qgVCVsgbrOBVJDGCV9ZClhizLt8poyCSnuQv5CbkueTUObCzgsVVWZnaQ4+tFnc2im4jYFTwfoFk4YCNZLVe4kV0f3cN2YFcwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360559; c=relaxed/simple;
	bh=zxA32SQxJHWkbMPlmZG/NoaCkikBVWLlnv+xwcrdsnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2LaYXbt+MgN929I1vQwIQSDRk3PcUh5X58xZr2OyPgvq05jlooo0I+m6pFn5xXZUQwVol6/yIp2H5jYyEG7/P92MaYWx1K8thhPIEbCljkd2YZltRAkVNaMq1Ci7/+s9dFZKRgpdVrJU6NYTYaGjN2drdJeqJdre8cBkf4GUQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dmya00Fp; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5389917ef34so1093651e87.2;
        Thu, 26 Sep 2024 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360555; x=1727965355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkYiezvXSNRtMLs2Or8bNlS3DRLHFJOdOzKBurCPuQk=;
        b=Dmya00FpPmXJcLLdkSctZEypJYFRrK4NNfYJgWrART/t1Cvvy0xLfCuU09EGWBerxN
         MNEl/mwiq+eUX8h6ocy0IcamwCV0Mc6bJ/gl0LnmAGfrlwmbZeRVNHBnGnEQ44+gKY46
         hqLQ4M8CGx8nNByb1b0LtaDy1c/t/WCwDnaTfm99Fxsr3nKFOjYN/r+g5pSZJz8fV+mi
         Jx0HDVvwKMIQesYrhlo37YOEH5XpNrV17B9aFV4kq10FEgfyaa73NtLN/YpGnQ542zqL
         1huM4zXXjru36sQ7d4VduckKbH639KwK/0077WaEYP/j2LgxgJCylHsMP/PSxdCdmYEj
         +/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360555; x=1727965355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkYiezvXSNRtMLs2Or8bNlS3DRLHFJOdOzKBurCPuQk=;
        b=Op6QfGmSSYCvfZr7of4D+i9uvnA+SnGJ/DbwXhNUUuJMRAlGt07X5b+adYMKBO20yB
         0I5hrU01XZcEJTjx3sB6HMjmGfOAb04Fh73Cf+HIk8poFAnUZAorm4dKaKrO5y3BjcUo
         vdTOjSIGR4NOeZkZRbj8qppcD4tmc5K1He37AuJt4stUdubFp5DQgHB+TRtxtQMWXdYE
         BBBOkF8y5uTe4dimtBMgm7ty1ML+awWPqV4TqLep5y+6pF0J4rDO568s7+/JX8JEiCpR
         MC5mHLRTOPyAS22XQSMRz1AKt46M+OBGEtkCMiCm0F/jDOIO9FyqwfG2TtTb8JnZnv6V
         r8yg==
X-Forwarded-Encrypted: i=1; AJvYcCVUyc8eCR0QsSFeVpuELv7ib1+GGlHjUM7apTSwCIdGV4NLVBjTbTmzDZk3EqOsUw1VmzOAYPtlCB8/8tOp@vger.kernel.org, AJvYcCXE2VUo0ZOR4ggQXfqd2RLvW1GRzcKU/ZlUSrt8Sftbw3vGdQ1jq8t0W5Q4jAOqBjsb5GZyUIhXWkEl@vger.kernel.org
X-Gm-Message-State: AOJu0YyI+jnbvSDlqm9jG3sRJwcg8QyUH8zKdkjrkNhhnGf5gNcWW/nH
	6rOjriOWPTWYZ0G1gJ86eOblLvc9RGpJQgbp5JXg9OJTsojac5jS
X-Google-Smtp-Source: AGHT+IGrtITrxEcW/+ijnKz/x5cAhF35xqPt8sz7W9Yg126EM52ugIf/NW/2IhaXHpcvGRiEZ3KZmg==
X-Received: by 2002:a05:6512:158f:b0:536:5515:e9bc with SMTP id 2adb3069b0e04-5387755eee8mr4256661e87.46.1727360554852;
        Thu, 26 Sep 2024 07:22:34 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-537a864db1bsm815803e87.267.2024.09.26.07.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:22:33 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 26 Sep 2024 17:22:10 +0300
Subject: [PATCH v5 10/12] arm64: dts: qcom: starqltechn: add initial sound
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-starqltechn_integration_upstream-v5-10-d2084672ff2f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727360533; l=5151;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=zxA32SQxJHWkbMPlmZG/NoaCkikBVWLlnv+xwcrdsnc=;
 b=iZrca6S9Y8ds5+cspPE2GV10lM0+7awvvWzLz+c4/GqDf7OCxyYVZ3SvZ8kGDIh8IyjAJLuq/
 RfD6wzZqwkKAUmXY+NoRCDWnNQyVKSsGwrEx9N6CK0FmivmA6oEeZt1
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for sound (headphones and mics only)
Also redefine slpi reserved memory, because adsp_mem overlaps with
slpi_mem inherited from sdm845.dtsi.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 213 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 213 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 00f67d1299b2..230e984b5ba3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -10,8 +10,15 @@
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+
 #include "sdm845.dtsi"
 #include "pm8998.dtsi"
+#include "sdm845-wcd9340.dtsi"
+
+/delete-node/ &adsp_mem;
+/delete-node/ &slpi_mem;
 
 / {
 	chassis-type = "handset";
@@ -83,6 +90,16 @@ memory@a1300000 {
 			ftrace-size = <0x40000>;
 			pmsg-size = <0x40000>;
 		};
+
+		slpi_mem: slpi@96700000 {
+			reg = <0 0x96700000 0 0xf00000>;
+			no-map;
+		};
+
+		adsp_mem: memory@97800000 {
+			reg = <0 0x97800000 0 0x2000000>;
+			no-map;
+		};
 	};
 
 	gpio_keys {
@@ -578,6 +595,202 @@ touchscreen@48 {
 	};
 };
 
+&adsp_pas {
+	firmware-name = "qcom/sdm845/starqltechn/adsp.mbn";
+	status = "okay";
+};
+
+&lpasscc {
+	status = "okay";
+};
+
+&wcd9340 {
+	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+	vdd-buck-supply = <&vreg_s4a_1p8>;
+	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
+	vdd-tx-supply = <&vreg_s4a_1p8>;
+	vdd-rx-supply = <&vreg_s4a_1p8>;
+	vdd-io-supply = <&vreg_s4a_1p8>;
+	qcom,micbias1-microvolt = <1800000>;
+	qcom,micbias2-microvolt = <2700000>;
+	qcom,micbias3-microvolt = <1800000>;
+	qcom,micbias4-microvolt = <1800000>;
+};
+
+&sound {
+	compatible = "qcom,sdm845-sndcard";
+	model = "Samsung Galaxy S9";
+	pinctrl-0 = <&quat_mi2s_active &quat_mi2s_sd0_active &quat_mi2s_sd1_active>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	audio-routing =	"RX_BIAS", "MCLK",
+			"AMIC2", "MIC BIAS2", /* Headset Mic */
+			"AMIC3", "MIC BIAS2", /* FMLeft Tx */
+			"AMIC4", "MIC BIAS2", /* FMRight Tx */
+			"DMIC0", "MIC BIAS1", /* Digital Mic0 */
+			"DMIC5", "MIC BIAS4", /* Digital Mic1 */
+			"DMIC4", "MIC BIAS4", /* Digital Mic2 */
+			"DMIC3", "MIC BIAS3", /* Digital Mic3 */
+			"DMIC2", "MIC BIAS3", /* Digital Mic4 */
+			"DMIC1", "MIC BIAS1"; /* Digital Mic5 */
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	mm2-dai-link {
+		link-name = "MultiMedia2";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+		};
+	};
+
+	mm3-dai-link {
+		link-name = "MultiMedia3";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+		};
+	};
+
+	mm4-dai-link {
+		link-name = "MultiMedia4";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA4>;
+		};
+	};
+
+	mm5-dai-link {
+		link-name = "MultiMedia5";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA5>;
+		};
+	};
+
+	mm6-dai-link {
+		link-name = "MultiMedia6";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA6>;
+		};
+	};
+
+	slim-dai-link {
+		link-name = "SLIM Playback 1";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 0>;
+		};
+	};
+
+	slimcap-dai-link {
+		link-name = "SLIM Capture 1";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 1>;
+		};
+	};
+
+	slim2-dai-link {
+		link-name = "SLIM Playback 2";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_1_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 2>; /* AIF2_PB */
+		};
+	};
+
+	slimcap2-dai-link {
+		link-name = "SLIM Capture 2";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_1_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 3>; /* AIF2_CAP */
+		};
+	};
+
+	slimcap3-dai-link {
+		link-name = "SLIM Capture 3";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_2_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 5>; /* AIF3_CAP */
+		};
+	};
+};
+
+&q6afedai {
+	dai@22 {
+		reg = <22>;
+		qcom,sd-lines = <1>;
+	};
+
+	dai@23 {
+		reg = <23>;
+		qcom,sd-lines = <0>;
+	};
+};
+
+&q6asmdai {
+	dai@0 {
+		reg = <0>;
+	};
+
+	dai@1 {
+		reg = <1>;
+	};
+
+	dai@2 {
+		reg = <2>;
+	};
+
+	dai@3 {
+		reg = <3>;
+	};
+
+	dai@4 {
+		reg = <4>;
+	};
+
+	dai@5 {
+		reg = <5>;
+	};
+};
+
 &usb_1 {
 	status = "okay";
 };

-- 
2.39.2


