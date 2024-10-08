Return-Path: <linux-arm-msm+bounces-33600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBD199550A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 18:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3559B25E7A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B421E104B;
	Tue,  8 Oct 2024 16:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3lSmo0d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F63D136327;
	Tue,  8 Oct 2024 16:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728406343; cv=none; b=esal/pm4mpij3vxl1hWaZSuxy+S4pACflqZbHMK+hEkXWtTLUAq8eLgOJgbMvX2uwwpH23E64o3y/UoO0EbEoM05ZuA7LhXYjerVszvDPbcMyF/sLgjRfJtoUqhRu9FpAzh9Bi5JYSoA3T3RWgdL9ZDQ/sARNaMW8XJtdXjgUmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728406343; c=relaxed/simple;
	bh=a+8ZZYzmMPo+J5xySH7T3E+wwwWtd4Yi6aDarm3ZQk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NscrIfnA2EmuvX5LOpVerFmC8PEsMdXvby+Qq0UyusBrZlklngKYl4z2500vV8r3lKoQ+RqJh8a4Nbo+rZI+osfxtOcfQ/BSvE2uCAa2OqEG28jRsEbRsXvSIqJFj6FjPPZvin8pNQo0A6k5kiNPY0OdkYdp9e05pL+OR5LNj28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3lSmo0d; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5398e53ca28so6531486e87.3;
        Tue, 08 Oct 2024 09:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728406340; x=1729011140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/crTbP2euxVMPYT2tqlSTPbcBcn1gCJOoaOnz8gXO8=;
        b=K3lSmo0dX32kvjPtFcdKWOkbX2ESDGesN9eshKgByc1Is9fQ8kamZlBI+cd2crBlqp
         IBBuI4+ga4KU8+R1HNketLfqiiGq6u5STHSjAu4yKgsYyxsgvq4C0OodDzjYl00KjcSl
         ZJyCZsa2JtbjYfMIRKPGcw8lFy+xRGRFgxpEDqiivAtsT5BE3CvUu6uOIdDJSU50XMhb
         i92ER2ZAIWJE/HWGsbOASglDr7qe13qEmmYS8KVrRgaNOIypocIlxYNQah/xxKYlL2IN
         C/spIbJZ8vLEio8tuisYAkmBR+dX8N1wznA0mTqwbQIP8gC+kGd+qHw3RnIiro8S4m3P
         aV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728406340; x=1729011140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/crTbP2euxVMPYT2tqlSTPbcBcn1gCJOoaOnz8gXO8=;
        b=AXw2ZZDMKk6u4PFect8t1F1/KOwf6IrjYwX8GbgEKroSYTE32NzIXKkSlfP+BpYprJ
         8yziRPiMSJNqKjFpQAdkv+3sh87ltiN/cXw7oj3ag8DYAMJ2f9Q4FlsGlVdTCTWic1bb
         LUvOi8dIwMJ56VJw970AnumG2xUcl87KrB7cYGjNZSXDdj0gsmRAOaKxxw8Xujm7AhGW
         V5GY8FOBMYxaAWdG0eibaoqBkM+KJXyaMIqzcN14U6JDOkZBFU+qOqqQWbhKgpLWHOSi
         pBlgLc0IXH51F0xGc8fSjJ/zHVV0UqFlS8OUMXT5JkbPw2FOHp4qNlwJJh8c5UEzYIlN
         +S2A==
X-Forwarded-Encrypted: i=1; AJvYcCVfvsXB331iFirGs/utCXd9dmSzlZktF5c9TdTXPncdHsaUh5MBer/3wct0Aej4CA4w0261cxeQ1QxEkmqm@vger.kernel.org, AJvYcCXpDQhbiVw8hXT4Gzftk/7a2s6c7EQeTEg0OsKm0HWPzs6tcEdwGqWW7vkbKMtbuzivuYUoqxFu9NIw@vger.kernel.org
X-Gm-Message-State: AOJu0YyL2hIXr12WizJA/FZvQASycq2vnZe/JGRpkqnO8MxqiZ6e0bkZ
	zfscqk1thJHMWyZezW1Th5GSMUdDJ0NM987O3cTX7SBDTTo9DtqLTiritw==
X-Google-Smtp-Source: AGHT+IG08hQKUvstlXrGqV0tctCcyaacBHua2YuZJY9sU1nUAL3PqSRsFkngr4xt3TM9FzufTDNQpg==
X-Received: by 2002:a05:6512:4026:b0:539:8b49:893e with SMTP id 2adb3069b0e04-539ab9de307mr8451176e87.38.1728406339485;
        Tue, 08 Oct 2024 09:52:19 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-539aff23e5fsm1260736e87.235.2024.10.08.09.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 09:52:17 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 08 Oct 2024 19:51:47 +0300
Subject: [PATCH v6 10/12] arm64: dts: qcom: sdm845-starqltechn: add initial
 sound support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-starqltechn_integration_upstream-v6-10-5445365d3052@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728406308; l=5269;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=a+8ZZYzmMPo+J5xySH7T3E+wwwWtd4Yi6aDarm3ZQk0=;
 b=KSwDBb6rOo1aNU0+oWqPeTWf5uEK8sFqSfNFZZ6bC+6V28uh1ZpxobXeSLxnxBIQQguWfEgUP
 7sq4OBnGGZtCWWCDvUALzMT6Uyx7czeER3+liusCJv846VwlAPb/TTG
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for sound (headphones and mics only)
Also redefine slpi reserved memory, because adsp_mem overlaps with
slpi_mem inherited from sdm845.dtsi.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v6:
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 213 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 213 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 2a367625d591..4d459fb85782 100644
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


