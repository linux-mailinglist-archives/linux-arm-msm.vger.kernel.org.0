Return-Path: <linux-arm-msm+bounces-41057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8548E9E937C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B6581885BB5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5E022B8C5;
	Mon,  9 Dec 2024 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deH/pfYZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BA322A1E3;
	Mon,  9 Dec 2024 12:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746197; cv=none; b=kuyRTncurlAF9CyI5PQdGaL1C6h4f0VSexonJTvwHc5NBm5dnqsA6rtbGPHRMYwcALOpB9Y6nwltNwqHxMXulj+V/kzO+gnDHR/TVrjCAXaGfpbq+5per0S87t3HEV047+0l87bzNRRwj0BYHyiNRCZVT6BVQDYFF7vNq/Mbaz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746197; c=relaxed/simple;
	bh=3RIouz0/3WqPsQBUs1mPhR2dKLIzwGRxi0K0mx1RK3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JFXNaqh+XjMy4y01t/MritnSOLyuLKWwd2xmz5Qh5Qfl7gBTJwEUp0slt/LYLWihyCoU8kvi8O9ohR/ykxxtJcL/wskXIqEP9YdaFEXxQHQmhlcFNlYNv2zVQuyitHSW6BjRxP89CftyaYnl+AYMrJ84TROIZO6U4qJXbRGfyow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deH/pfYZ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9e44654ae3so685765666b.1;
        Mon, 09 Dec 2024 04:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746194; x=1734350994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSk4bz0Z5JpRrjbyGlR1qxyngXG02QLF4E9pJ8QrvSw=;
        b=deH/pfYZ/UHp3kxeAI1ngEMDQLNtVgjI3uEOGqCjoVG6jKrvAMOD4iF8I1+gOlbVQL
         O6eRMZ39+Dqew3d3jZC+9/MV+fdpWukO6W98WY6slJ+G+Zv70lNyso3xaesIOKEE5Qhe
         UMiRWDKsZpZ/zQ+W5xa9gbkwdjIMsaq/t50fDl04X0nBaJD+/ApOY6Omf+vMTg0Yq5yG
         6gipnUEXO5CseY1mGfTPp9HHO7/QKbOQuVDgdYScBZIM1ipb+VJFwazTQd06Mg/H54dR
         FIoIZ9e92bKAv6z4h8TFKDESC17rCPeRvMNjsOeYIKbCb/ZAVszZ8fXbzGRKE4EaPEs4
         qVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746194; x=1734350994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSk4bz0Z5JpRrjbyGlR1qxyngXG02QLF4E9pJ8QrvSw=;
        b=RDJVfMzoiQfHtboqvJXiBeUeIMAUVCkKa3YTNaSNBbSVHmgnu0qVGHyNQ0Xs0BIcX4
         6R24bAlyBjQzVvPqlgAslCFmWzzJHMIQgJZMhKgp3ulFnLzWxxTa8ORVPtmLRV1n3t1z
         E/qIpQ/oZ43cX0iurqUcvkrKQ2su7NbEr/3wOBeKnT8sJSm8Q9elQBss/Vt/efgSzxyH
         mJRsWqpSxCBflS0KeiQ4LWrVPPT16icci3sU9DzYy1OFf8mVy8S+AxEHn7f0RNRZbewy
         tfXaRf98vAlSzBPt07HOk9Urpcpbxl7H99i9KUy6gmoB7lIk3eQsiOEJ+Daiue0kEFuj
         cMig==
X-Forwarded-Encrypted: i=1; AJvYcCV9c32V1DgIWfVJsMOMqjyD4Edg4HF8krR4wL5PJrENs2sKR4gtPHOn9u1THdN9aHgTeO2YlHXclTs9m7Bz@vger.kernel.org, AJvYcCWTpkqlCXXqRs7YID9cTJPWk4+VIldkLa6fKADPBTKYTTboVstFFrNMRPOjqrm2jgFr9L7JTNfvpr/F@vger.kernel.org, AJvYcCWcgHghZBEEXkfTDOBQURVOE1zaBq4un+OhMlMUXoNcykJPRsBPg6dFPTteCobNfsJvK0IgxuV/bPKvjLI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+jhvSGha867QVjfpgzItVpK+HJPSdpQ3FynPL3+Ep2KL/vm3I
	0C0aaDI5twXbnFC0RHsfFs9vFS3k2CFPDBVyasUVyzPo/Y0nGL2p
X-Gm-Gg: ASbGnctYDCuolWhrLL7lJgxNwT/0WRsBUwka/QA+LYE5Emax/4WHKgXwFAnObyn/6qs
	FMwZVjUFi8iMkAsYOSthClMh0ceJHnVtGGTyoL83RnK/jHTjc+rwGay/JV8us3z4xBtHS9dLdB3
	WI+5+m+xtpilVzYBjUYkhO0sAW4ddGAnjpJ87YJ+G549sgcF8o19+TiHFRYT6yXMj4PtRozIe2y
	ZE+ehfaVX2Zo6nn6BKXNV14pdvMlmFUSSCZ+btKMKatKjLr
X-Google-Smtp-Source: AGHT+IHAF2vVzPbCtc292FcEXBWuOnnsDMNF6zA1g0QVutxqnM++Ul+aJH5dwUHZA5FIg0hyoQAdFg==
X-Received: by 2002:a17:906:31cd:b0:aa5:44a8:9ae7 with SMTP id a640c23a62f3a-aa69ce22259mr8143666b.47.1733746193535;
        Mon, 09 Dec 2024 04:09:53 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa69964876csm37308766b.49.2024.12.09.04.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:09:53 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 09 Dec 2024 15:09:16 +0300
Subject: [PATCH v8 12/14] arm64: dts: qcom: sdm845-starqltechn: add initial
 sound support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-starqltechn_integration_upstream-v8-12-ec604481d691@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733746173; l=5556;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=3RIouz0/3WqPsQBUs1mPhR2dKLIzwGRxi0K0mx1RK3k=;
 b=Oky75ZKmYLrL2UTW/e+jlzy0scELgGviu6tCyHA8q+dVpAQmikU1+gmSlOOj+LfXfIGwcSlq7
 xBuVqz05SI+CsDY92oAnjxNsQITbTemANiAgbnzn279JZqAwc99siL2
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for sound (headphones and mics only)
Also redefine slpi reserved memory, because adsp_mem overlaps with
slpi_mem inherited from sdm845.dtsi.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
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
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 223 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 223 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 65f33be55da3..3a049459aeb3 100644
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
@@ -590,6 +608,211 @@ touchscreen@48 {
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
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 AIF1_PB>;
+		};
+	};
+
+	slimcap-dai-link {
+		link-name = "SLIM Capture 1";
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 AIF1_CAP>;
+		};
+	};
+
+	slim2-dai-link {
+		link-name = "SLIM Playback 2";
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_1_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 AIF2_PB>;
+		};
+	};
+
+	slimcap2-dai-link {
+		link-name = "SLIM Capture 2";
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_1_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 AIF2_CAP>;
+		};
+	};
+
+	slimcap3-dai-link {
+		link-name = "SLIM Capture 3";
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_2_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 AIF3_CAP>;
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
2.39.5


