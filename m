Return-Path: <linux-arm-msm+bounces-40387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 568809E46E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5B52188019F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028FD20766F;
	Wed,  4 Dec 2024 21:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSKi62n3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F272D206F3A;
	Wed,  4 Dec 2024 21:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733348125; cv=none; b=YoyQr7hoxgbF6B1urGYQ+gdli4LDxlS3J2ZgCDa76IuuBHeUbd9xrBfxrm7DsSjq0wx/HSOICfNM62Dp+px2qsSk2fp/QPRvOcDCAu1e1FIheaOcmc4rTjGy7b028/qnuNEJB6bwhtZPIjh8Fbt3z2MRD0yLtZWkkdjVbzYd+Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733348125; c=relaxed/simple;
	bh=ZktPBha3MJ5/KlA9AlQzgKigSH5l+ZI/rkQsfGWIGo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FFaWzfkOgsJJwjSwrHzh0hjRXd2OE1aPmpLnZSMe4ACpMZ3S/dIVhE1A1KM4lLtoUF8891ZQqXpPqLjhe39gLXVAgPwPKy5iyDCT/pmEJzrGqxxjAAEvaT3aNjQtimn+GkyBQL4GiLXg3XuedHzuS4hYWUUfIgB84B6SF8PTo80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSKi62n3; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53de84e4005so378693e87.0;
        Wed, 04 Dec 2024 13:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733348122; x=1733952922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unOUW9QTZHC1BrDegDGoofl1UJ0TCXgmMQQ4ICNFgMk=;
        b=gSKi62n3OWHIBWa+WGHzBps6KFPD9jcZiXIAWtD9vI/lKuAWuCo8NagX7ekn8Zvo+z
         SAXhS+b5xN/rHwqYDcWI9ig4S2FJzKqUca9OO581nKk1fkntMpIplB3I0NLnIu/GKHIW
         a8Cbm/mQiTbnPXQhmwOtBRkw4UfYlBSoZXLxHqgt6Y74178aezf7GuKT3A8q6klKKXU/
         Gy8lv2PfG9+BNXhkJTrrLVjphKPHD/kLii8LxxdhGEy3+IMqHnBEGb12oyvVkPx5mQ83
         nY5S0rQN31yf3WnMhnwjW7UNUD9kWglIt8m8NYihEDgoCXKIfPu9CLyhcN4wFypcBgGF
         zSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733348122; x=1733952922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unOUW9QTZHC1BrDegDGoofl1UJ0TCXgmMQQ4ICNFgMk=;
        b=SgSh3LlJwZlc/3S4s2TeziuyanUFJnGhPArfMJ2DFbjJXgTbtQrNAOKMUvvlZ5+59v
         Au7EMAM0vg/AHeaqlQW2Jr9RZmksgz8lpN35ewPk8laTZRwx+R6pLuNSokpdJMqHU/cf
         nyq8g7T0akE4UENs7hF8u9OmJCiiZedsZmhLWsfXD/OUGkbKxIC4wIcFUW1LXJ0xrCuU
         JRO2+NTLDn4QKRSgrRchHSLJpz81/4SiRfgeKMeCxqzMM6ir0qxdG7MtnYzlgGl6tmQ7
         n+fNKdsUdK5ndQTfEjtIFwLeulhL1a93X56qHNZzPvcaka7vq+zLClFQexZXRy5EtG30
         3E8g==
X-Forwarded-Encrypted: i=1; AJvYcCUHRfT2iNNsz0ESgmSNDBKbhHGt5fuafNpFgSlqSriYSw6aZA2MSTAHevBxrlFJf/nkb0668luWYLka@vger.kernel.org, AJvYcCUP10YHfC5BCMkuKleATgvH/UYgB91z/DF+9g0PMt2pa1Ecc7C/O4NDoi1Ll5SxyTRGtSFn3bx2K5APZNhb@vger.kernel.org, AJvYcCXSF0wu9RLhnOYrfVCB43FtFKrHjizP0HhoZ32/o0YyJb4Psu0AYciJJgv/QBoLeIbhy56oiWSjS98ttOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOA1cSpGkNhs3F0+rcKglO3A9wVj4feYttKGw/S7NGQUmIDvzW
	owFdzzCbpIyW7mCABts7fuiHssN0U+h0KHX50kfmDr9YridscAUsxeCM/g==
X-Gm-Gg: ASbGncsF/DAk5DPAAKalp+N5KIQ0YZ1LIb34OttXTuk34mcIjzcmmHQHGe5ZzQyZFee
	s/DwNRamNORUZcuvJfKJL2lCwved9YZNYaXzrW3A9dnqI62UJmwo/KWdFLbuaxX1CuTtpBmroOx
	RTfv3gnGoj5aIS/b+KRA6uBH006yj0kgdGXtPN8NCd2mQuyJX+SP/QATq2L/uccOUxPW2p4ypKk
	ogr7qAug0iCxA/bzTQLZ9TqI0ayVZBh+T1gLAeDBmb1k79e
X-Google-Smtp-Source: AGHT+IFpkU19KP0h8tweTA/NAEZg3pan/G3HYU4xPm0rqs5vgGmcuj0QjoU6cif6ee1dDCvu+jCp7g==
X-Received: by 2002:a05:6512:6c9:b0:53d:e4d2:bb3 with SMTP id 2adb3069b0e04-53e12a2e4e5mr5715412e87.50.1733348121816;
        Wed, 04 Dec 2024 13:35:21 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa62601b5ddsm4506966b.118.2024.12.04.13.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:35:20 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 05 Dec 2024 00:34:59 +0300
Subject: [PATCH v7 12/14] arm64: dts: qcom: sdm845-starqltechn: add initial
 sound support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-starqltechn_integration_upstream-v7-12-84f9a3547803@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733348104; l=5490;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=ZktPBha3MJ5/KlA9AlQzgKigSH5l+ZI/rkQsfGWIGo8=;
 b=Am0yDz0wiS+sK7Vn+vDnf9T/2pq+p6KNSC1aq8lTZPFY2qgzeKoIJXlUuoqQGdbJwf2EmH4UP
 IsEgaEp7j5uD8S8nIyxXwY55/0fiGOzO9l+pgUgkjFjKtYJl4YjJSK+
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for sound (headphones and mics only)
Also redefine slpi reserved memory, because adsp_mem overlaps with
slpi_mem inherited from sdm845.dtsi.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
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
index 039feb07ef60..04ef4f030931 100644
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
@@ -591,6 +609,211 @@ touchscreen@48 {
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
+			"AMIC3", "MIC BIAS2",	/* FMLeft Tx */
+			"AMIC4", "MIC BIAS2",	/* FMRight Tx */
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


