Return-Path: <linux-arm-msm+bounces-49334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BCDA446BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70796865D13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 16:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A931DA634;
	Tue, 25 Feb 2025 16:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emdxpO0z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5093B197A67;
	Tue, 25 Feb 2025 16:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501578; cv=none; b=pT2OLH+ANml6Bt0l8WQsyPmYhlFNWLttbUTOMfJy2GqwITWO51RYO01z6cNUsRi6XSpSpig8eLeTQ/ZBXfc3w615vhQJkNNnwfkNPBhXH6SR1WGHKtri8ThOFq17CL6GbKTdnMfdhqahkQ1jlLNRPrkFe0ypFCF6adb4BVt95uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501578; c=relaxed/simple;
	bh=kit8ZJ2Sl67QYuVYSKVIaJfE5+49IGTXWdpdwz98ZmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fbFzwyNYZWrXYuoE7Ni56kCK+QKIPz2xQYfNFqvSAVvLL2ckFH+WyanN0xpurLhDuEQ9981COspJBgnYzQ9ccoBoWtigeCdMRTTw4+lA9Kse1aLnJL0oIi3Kx7NbtW66BPCmk5K4EloIVfMlby7ZSQ4zF2DOjMS4bjejjenezBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emdxpO0z; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abbdf897503so1188697866b.0;
        Tue, 25 Feb 2025 08:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740501573; x=1741106373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=olwzXUkbl7L3Ijdgy9FaKldLZmtXz3S1t0tQ8+qrEJk=;
        b=emdxpO0zf7xyCoouLnTDF+MeyEYBOApHamqahYpjVXkUy26iiC3r2/aa3z0vzM2kIV
         DL+eG28ILlp+VWKViSzD0oVvR3dwlCllj6hH7AN1RS5N7hILAlVdy0nyki3Fj47gdcmX
         ZCc2rI2E604P38dwCUPtdLQwZ+y3T+3EqzHBd7M8q3sqPVv7wIO2o/YdxxbsGARBWO4K
         lLNkGxLhSMwCSCcBMymjJeC8goE09BPV5MJhcRovNvzAdX3zkzI8ZNETFvVnwJsY1wN/
         pOxaOV/OFborKhpHkpT03wXda8Y4B5V6EpD9dlrEreT46QmsqDYrcw0eXU6JHgDZeEuo
         i7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501573; x=1741106373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olwzXUkbl7L3Ijdgy9FaKldLZmtXz3S1t0tQ8+qrEJk=;
        b=Fl13OpxHqpwUQlgvLKmR2FPBKUmVBbTEqW4d75rbgDB42v9hHoNzbNDiZm6FgbBngj
         R/cvbCkfx2zBHgiPeviWR0IFKhLLUBUCz8r2c6TutH8ZkWxNTPmPju2ilE4Zs1JJuR8/
         DpDnUjnwkXOolKSCGBaXaBLQVl5iMDUzndHKaIWOOXXfPf4Rio5hnJltnpgjxBzn0FWg
         vGsFTN9sY57xKmqwJLPiEMkRxDzF4WbiURvGyWw/6cKH4/DUqOTqKcEqdKRPSRfDrnSn
         gN1NjjdW0mJQPlZ/mQYBPv2VcwxxSjDruP41/iWlEufbePNH1uiPDZY3GixzAmlPsHQf
         sm7A==
X-Forwarded-Encrypted: i=1; AJvYcCVK1RQ56uaDA14Nh4sKpLRn9nC29PJSIRbv7y7osvX0hc8Ds8m2/IMg3u/6aH621tj4aQ2mpz5RP0pHJrvr@vger.kernel.org, AJvYcCVpzuFqxDHPzxzQlfQ99fxbeEyydkSO2X1Mn+29eiaaw3enp/oPhyGXjzrfhLALgXE8rJCcthjBUttF+8Y=@vger.kernel.org, AJvYcCWPeJOq2j0rOh3RASpy3I+PJ7rsAsFVFoZYAN9YVjLmN070qAtpOTt5j0FWvATgzqB1szflVPaYysJq@vger.kernel.org
X-Gm-Message-State: AOJu0YzpFGnes+QwN6tIJdRRgIrItx10W4joPx1gMn4vQoU8hRFr8Kl1
	an9KjN9f6ItErREn/LR0DQB/3AE+gtPU/9UjRJtyGGQlCPtRmugp
X-Gm-Gg: ASbGncsAiUhvgLmnxvzNl8eejIIv0OoFW8q0a/zpcWuVmywMmztRi0wKx0RMtg8oGOu
	iMzppRC81iOURW8Tuh9drLxln6ehBFDOUbY0qWpBjFhZzAhQt/n1LZMjcqzyreO6xA6eowajwOS
	Vijm5xDtXqnexcxbVEQGiUbmQWyfkIqpiht16cjBqIZOXBpupFCckMFafs6R7fHr68eB6aVk99i
	GWNeggqmJE7w0uQYgYPyRG6djvg3dX4JiwtvWaeIjxUzytFTcBK5gXoynuUUilLZM60cmdSlT47
	i+WW2kJ/Ti+EuihAHgONDZe9
X-Google-Smtp-Source: AGHT+IFNR0TZBtXf1FvVm8Hgptd31Nd/vkSeUF99U1jQcXF8dJuqOesoPdRa3c3SfomN8IrJMSl93g==
X-Received: by 2002:a17:907:7a88:b0:ab7:d44b:355f with SMTP id a640c23a62f3a-abc0b0c6077mr1640173766b.25.1740501573389;
        Tue, 25 Feb 2025 08:39:33 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.22])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abed2055011sm163999866b.156.2025.02.25.08.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:39:33 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 25 Feb 2025 19:39:01 +0300
Subject: [PATCH v9 10/12] arm64: dts: qcom: sdm845-starqltechn: add initial
 sound support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-starqltechn_integration_upstream-v9-10-a5d80375cb66@gmail.com>
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
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740501555; l=5702;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=kit8ZJ2Sl67QYuVYSKVIaJfE5+49IGTXWdpdwz98ZmM=;
 b=vthhdut8GUTrLazWOg0Q94n74AlgwUq7+p5IyGvAtO7LSCsC6GLnqiOv0muNqAH12gvbc5bsJ
 y5SDcxRrE85Ar3z5/lun1hMRgXSU4xP/bd0K0g4UrHJTAOtCzAWpjmA
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for sound (headphones and mics only)
Also redefine slpi reserved memory, because adsp_mem overlaps with
slpi_mem inherited from sdm845.dtsi.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v9:
- sort nodes alphabetically

Changes in v8:
- clarify FM with FM -> FM radio

Changes in v7:
- replace indeces with constants from dt-bindings/sound/qcom,wcd9340.h
- add spaces after 'link-name' node
- remove not connected digital mics from audio routing
- add DMIC(0|2) -> MCLK routing, because digital mics
  need clocks
- align mapping comments, add dmics comment

Changes in v6:
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 223 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 223 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 320add4697bf..762182331dc5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -11,8 +11,16 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,wcd934x.h>
+
 #include "sdm845.dtsi"
 #include "pm8998.dtsi"
+#include "sdm845-wcd9340.dtsi"
+
+/delete-node/ &adsp_mem;
+/delete-node/ &slpi_mem;
 
 / {
 	chassis-type = "handset";
@@ -97,6 +105,16 @@ memory@a1300000 {
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
 
 	i2c21 {
@@ -595,6 +613,211 @@ touchscreen@48 {
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
+&sound {
+	compatible = "qcom,sdm845-sndcard";
+	model = "Samsung Galaxy S9";
+	pinctrl-0 = <&quat_mi2s_active &quat_mi2s_sd0_active &quat_mi2s_sd1_active>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	audio-routing =	"RX_BIAS", "MCLK",
+			"AMIC2", "MIC BIAS2",	/* Headset Mic */
+			"AMIC3", "MIC BIAS2",	/* FM radio left Tx */
+			"AMIC4", "MIC BIAS2",	/* FM radio right Tx */
+			"DMIC0", "MCLK",	/* Bottom Mic */
+			"DMIC0", "MIC BIAS1",
+			"DMIC2", "MCLK",	/* Top Mic */
+			"DMIC2", "MIC BIAS3";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	mm2-dai-link {
+		link-name = "MultiMedia2";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+		};
+	};
+
+	mm3-dai-link {
+		link-name = "MultiMedia3";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+		};
+	};
+
+	mm4-dai-link {
+		link-name = "MultiMedia4";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA4>;
+		};
+	};
+
+	mm5-dai-link {
+		link-name = "MultiMedia5";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA5>;
+		};
+	};
+
+	mm6-dai-link {
+		link-name = "MultiMedia6";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA6>;
+		};
+	};
+
+	slim-dai-link {
+		link-name = "SLIM Playback 1";
+
+		codec {
+			sound-dai = <&wcd9340 AIF1_PB>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
+	slimcap-dai-link {
+		link-name = "SLIM Capture 1";
+
+		codec {
+			sound-dai = <&wcd9340 AIF1_CAP>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
+	slim2-dai-link {
+		link-name = "SLIM Playback 2";
+
+		codec {
+			sound-dai = <&wcd9340 AIF2_PB>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_1_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
+	slimcap2-dai-link {
+		link-name = "SLIM Capture 2";
+
+		codec {
+			sound-dai = <&wcd9340 AIF2_CAP>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_1_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
+	slimcap3-dai-link {
+		link-name = "SLIM Capture 3";
+
+		codec {
+			sound-dai = <&wcd9340 AIF3_CAP>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_2_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
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
 &usb_1 {
 	status = "okay";
 };

-- 
2.39.5


