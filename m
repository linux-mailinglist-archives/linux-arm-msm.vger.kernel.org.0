Return-Path: <linux-arm-msm+bounces-50471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F1EA545D2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 10:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6B8B16C974
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D731209F25;
	Thu,  6 Mar 2025 09:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p9TD5p3j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279752080F6
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 09:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251928; cv=none; b=umiaVAFoFRyoIwVXK0gd6IfKPx4+wKqaou2yGLtmNzjQauNOVNSMmsnMWHRQXqMtT+0y0Gx+QbbIM/CjrDPFT9eQ9tdkc7wXe8RjY0NXUSBiKEZAyP4LOeevy9fqCQsxSKuIwWROU+6eS+qDTlQ9MvsFMZSQxPSKEK71jN4HIqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251928; c=relaxed/simple;
	bh=t+Y0A8brRB5YgCWGRghrRgYSrVX97/z2lMKRxC0tYhE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TFGWs6fMwaPd8b4PPKUyJAg6wAwCS6Bz4BDKQia0a2D8quDBXTFvjf04yGAffHtygmZl6z4vqwaj9rbjWtqflIVrOSFuOq1jaARU0+z18PbRqLXKnGKW1rGLs75swxyEy/qg1Brc9hNPS8h+xIRvzqcw+J6tP8qA2O5vPVK6JdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p9TD5p3j; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abf4802b242so81828366b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 01:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741251922; x=1741856722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCgycg6jymVSZB2yKvCN5ZeBoiZyEXaY22cpYRkT5Fo=;
        b=p9TD5p3j+nKnHbWxcAyFmGg/ZewLV1/SgvbBnOUQP//Ef6OOaj9Uwp21LP071EB6+9
         lQWE4VND1zx0K2WM4IBDU0qjZSSlSuLAEpTII0PpcqyF26zOoYbUZQNsAlwezNIJJR17
         hipEuK7BBtq/0gAVpsl6Y6KmIUcZLaklWW1Ipxy5Ylp/UCpmgjlYyhiaL9njXrMKR4Qy
         QKlcB9uKN0JPZWAuYPFFuvsg5tCQ363B+ln81m3DXhDfFOet+q1Cnk/I451ccH54pSWD
         Wm+D+jP+4QHnq5QOiwWa+J59Bm30zzFPePxkKpJVjsghOijzK+M7nFT6zgBAJTVDi2n/
         9oGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251922; x=1741856722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCgycg6jymVSZB2yKvCN5ZeBoiZyEXaY22cpYRkT5Fo=;
        b=Egf7ZHDyiJThMLMMfMQo8J78kL+ghKPvtz/5KuK53+GCQ/Vx+HlETFT+IHjqEEh7oK
         Bi3T990OOUSFsZw/2/dZM7L3KbRQ3MXaoMcvbDNxdceFC08wU9uNpctE6/ZC3urn0sFk
         IOVbaRZGXJOSA7yux8tc7HCz40WJvfXTuRyHYffQbAI8mCAsqeGBag6PiOg3fr218YK3
         QgYJlubkNLnB86KEzRvync+drpkSgbKUAS6SD3DOfqLuD/4njwd7qVWp0ecTWaB+oaDM
         2H+/3vr19LAkxI7HfSoyAodOkQfaRO723kzcoAnkGx6nFA5IHr5/BiSA1gJNMth+w29f
         MkyA==
X-Forwarded-Encrypted: i=1; AJvYcCXAPsxpDLJDLHYAg15/paoGhLaTH6+dfykP7nDRpNx6LM0HqEJP+D0cHhFKb0Ncaqnu96uU3jIdvsI8yw5/@vger.kernel.org
X-Gm-Message-State: AOJu0YxcLHncfGve4P9Lc+G2BCK9erdj0bMoM65v0vBqL3Lbj0uUStzJ
	y8XdtDViyVViYTPKC2gZNbPIV9WbmfYJFArgU+2xHBuSd7JMzgvicL+Nbz0Pdic=
X-Gm-Gg: ASbGncvDPoIyguPa7rViVSmXnS2s3yW1YIZj5nV4p6E/m2cjW0HjgmYMNKfBpvF1fSL
	Nww71qMQRJ3OgQV9tMO4ecs3DLkqlyRWyoTUWIjMNB2Md67xfoUcTFfCrZZCY7jeY2YRbWUZJKP
	ZzkMSUKC5yr/T1EzoG+FsghXEWQ/pEVkuDEKf3JPcyoiU+oL+DQV+UYLbOJEA9NhitkVeMRU41p
	wbDc3+DIwZE0BrNaMp2ILuVobwib1z8c4zA+mlrIerYX/rctS9j4+XbAL2yK/uvCv1IyMyvUZyG
	ivfxdYHrXEZCUQi3DmlWABqml4D2DjeAIJxiihkLl2w=
X-Google-Smtp-Source: AGHT+IFuRaSR/ACgq9Ia3xiCIZDQrYdN7AqQ3MaCmpfUUbzqVKEEXWtaOuCvzEIaDeydoldMn5l8Ww==
X-Received: by 2002:a17:907:3f0a:b0:ac1:e6bd:a556 with SMTP id a640c23a62f3a-ac20db00619mr645862866b.54.1741251922033;
        Thu, 06 Mar 2025 01:05:22 -0800 (PST)
Received: from hackbox.lan ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23943a194sm61606866b.37.2025.03.06.01.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 01:05:21 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>
Subject: [RFC 1/2] arm64: dts: qcom: x1e78100-t14s: Add LCD variant with backlight support
Date: Thu,  6 Mar 2025 11:05:02 +0200
Message-Id: <20250306090503.724390-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306090503.724390-1-abel.vesa@linaro.org>
References: <20250306090503.724390-1-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Due to the fact that Lenovo Thinkpad T14s Gen6 is available with both
OLED and LCD, the backlight control differs HW-wise. For the LCD variant,
the panel's backlight is controlled via one of the PWMs provided by the
PMK8550 PMIC. For the OLED variant, the backlight is internal to the
panel and therefore it is not described in devicetree.

For this reason, create a generic dtsi for the T14s by renaming the
existing dts. While at it, add a node name to panel and drop the enable
gpio and pinctrl properties from the panel node. Then add the LCD variant
dts file with the old name and describe all backlight related nodes.

So the existing dts will now be used for LCD variant while for OLED new
dts will be added.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 1190 +----------------
 ...dts => x1e78100-lenovo-thinkpad-t14s.dtsi} |    6 +-
 2 files changed, 57 insertions(+), 1139 deletions(-)
 rewrite arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts (98%)
 copy arch/arm64/boot/dts/qcom/{x1e78100-lenovo-thinkpad-t14s.dts => x1e78100-lenovo-thinkpad-t14s.dtsi} (99%)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
dissimilarity index 98%
index b2c2347f54fa..28ee6c74f2b8 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -1,1134 +1,56 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
- * Copyright (c) 2024, Linaro Limited
- */
-
-/dts-v1/;
-
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/gpio-keys.h>
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-
-#include "x1e80100.dtsi"
-#include "x1e80100-pmics.dtsi"
-
-/ {
-	model = "Lenovo ThinkPad T14s Gen 6";
-	compatible = "lenovo,thinkpad-t14s", "qcom,x1e78100", "qcom,x1e80100";
-	chassis-type = "laptop";
-
-	wcd938x: audio-codec {
-		compatible = "qcom,wcd9385-codec";
-
-		pinctrl-0 = <&wcd_default>;
-		pinctrl-names = "default";
-
-		qcom,micbias1-microvolt = <1800000>;
-		qcom,micbias2-microvolt = <1800000>;
-		qcom,micbias3-microvolt = <1800000>;
-		qcom,micbias4-microvolt = <1800000>;
-		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
-		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
-		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
-		qcom,rx-device = <&wcd_rx>;
-		qcom,tx-device = <&wcd_tx>;
-
-		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
-
-		vdd-buck-supply = <&vreg_l15b_1p8>;
-		vdd-rxtx-supply = <&vreg_l15b_1p8>;
-		vdd-io-supply = <&vreg_l15b_1p8>;
-		vdd-mic-bias-supply = <&vreg_bob1>;
-
-		#sound-dai-cells = <1>;
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-
-		pinctrl-0 = <&hall_int_n_default>;
-		pinctrl-names = "default";
-
-		switch-lid {
-			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
-			linux,input-type = <EV_SW>;
-			linux,code = <SW_LID>;
-			wakeup-source;
-			wakeup-event-action = <EV_ACT_DEASSERTED>;
-		};
-	};
-
-	pmic-glink {
-		compatible = "qcom,x1e80100-pmic-glink",
-			     "qcom,sm8550-pmic-glink",
-			     "qcom,pmic-glink";
-		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
-				    <&tlmm 123 GPIO_ACTIVE_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		/* Display-adjacent port */
-		connector@0 {
-			compatible = "usb-c-connector";
-			reg = <0>;
-			power-role = "dual";
-			data-role = "dual";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					pmic_glink_ss0_hs_in: endpoint {
-						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					pmic_glink_ss0_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
-					};
-				};
-			};
-		};
-
-		/* User-adjacent port */
-		connector@1 {
-			compatible = "usb-c-connector";
-			reg = <1>;
-			power-role = "dual";
-			data-role = "dual";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					pmic_glink_ss1_hs_in: endpoint {
-						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					pmic_glink_ss1_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
-					};
-				};
-			};
-		};
-	};
-
-	reserved-memory {
-		linux,cma {
-			compatible = "shared-dma-pool";
-			size = <0x0 0x8000000>;
-			reusable;
-			linux,cma-default;
-		};
-	};
-
-	vreg_edp_3p3: regulator-edp-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_EDP_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_nvme: regulator-nvme {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_NVME_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&nvme_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vph_pwr: regulator-vph-pwr {
-		compatible = "regulator-fixed";
-
-		regulator-name = "vph_pwr";
-		regulator-min-microvolt = <3700000>;
-		regulator-max-microvolt = <3700000>;
-
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	sound {
-		compatible = "qcom,x1e80100-sndcard";
-		model = "X1E80100-LENOVO-Thinkpad-T14s";
-		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
-				"SpkrRight IN", "WSA WSA_SPK2 OUT",
-				"IN1_HPHL", "HPHL_OUT",
-				"IN2_HPHR", "HPHR_OUT",
-				"AMIC2", "MIC BIAS2",
-				"VA DMIC0", "MIC BIAS1",
-				"VA DMIC1", "MIC BIAS1",
-				"VA DMIC0", "VA MIC BIAS1",
-				"VA DMIC1", "VA MIC BIAS1",
-				"TX SWR_INPUT1", "ADC2_OUTPUT";
-
-		wcd-playback-dai-link {
-			link-name = "WCD Playback";
-
-			cpu {
-				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
-			};
-
-			codec {
-				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-
-		wcd-capture-dai-link {
-			link-name = "WCD Capture";
-
-			cpu {
-				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
-			};
-
-			codec {
-				sound-dai = <&wcd938x 1>, <&swr2 1>, <&lpass_txmacro 0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-
-		wsa-dai-link {
-			link-name = "WSA Playback";
-
-			cpu {
-				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
-			};
-
-			codec {
-				sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&lpass_wsamacro 0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-
-		va-dai-link {
-			link-name = "VA Capture";
-
-			cpu {
-				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
-			};
-
-			codec {
-				sound-dai = <&lpass_vamacro 0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-	};
-};
-
-&apps_rsc {
-	regulators-0 {
-		compatible = "qcom,pm8550-rpmh-regulators";
-		qcom,pmic-id = "b";
-
-		vdd-bob1-supply = <&vph_pwr>;
-		vdd-bob2-supply = <&vph_pwr>;
-		vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
-		vdd-l2-l13-l14-supply = <&vreg_bob1>;
-		vdd-l5-l16-supply = <&vreg_bob1>;
-		vdd-l6-l7-supply = <&vreg_bob2>;
-		vdd-l8-l9-supply = <&vreg_bob1>;
-		vdd-l12-supply = <&vreg_s5j_1p2>;
-		vdd-l15-supply = <&vreg_s4c_1p8>;
-		vdd-l17-supply = <&vreg_bob2>;
-
-		vreg_bob1: bob1 {
-			regulator-name = "vreg_bob1";
-			regulator-min-microvolt = <3008000>;
-			regulator-max-microvolt = <3960000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_bob2: bob2 {
-			regulator-name = "vreg_bob2";
-			regulator-min-microvolt = <2504000>;
-			regulator-max-microvolt = <3008000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1b_1p8: ldo1 {
-			regulator-name = "vreg_l1b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2b_3p0: ldo2 {
-			regulator-name = "vreg_l2b_3p0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3072000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4b_1p8: ldo4 {
-			regulator-name = "vreg_l4b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l6b_1p8: ldo6 {
-			regulator-name = "vreg_l6b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <2960000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8b_3p0: ldo8 {
-			regulator-name = "vreg_l8b_3p0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3072000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9b_2p9: ldo9 {
-			regulator-name = "vreg_l9b_2p9";
-			regulator-min-microvolt = <2960000>;
-			regulator-max-microvolt = <2960000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l10b_1p8: ldo10 {
-			regulator-name = "vreg_l10b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l12b_1p2: ldo12 {
-			regulator-name = "vreg_l12b_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l13b_3p0: ldo13 {
-			regulator-name = "vreg_l13b_3p0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3072000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l14b_3p0: ldo14 {
-			regulator-name = "vreg_l14b_3p0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3072000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l15b_1p8: ldo15 {
-			regulator-name = "vreg_l15b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l17b_2p5: ldo17 {
-			regulator-name = "vreg_l17b_2p5";
-			regulator-min-microvolt = <2504000>;
-			regulator-max-microvolt = <2504000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-1 {
-		compatible = "qcom,pm8550ve-rpmh-regulators";
-		qcom,pmic-id = "c";
-
-		vdd-l1-supply = <&vreg_s5j_1p2>;
-		vdd-l2-supply = <&vreg_s1f_0p7>;
-		vdd-l3-supply = <&vreg_s1f_0p7>;
-		vdd-s4-supply = <&vph_pwr>;
-
-		vreg_s4c_1p8: smps4 {
-			regulator-name = "vreg_s4c_1p8";
-			regulator-min-microvolt = <1856000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1c_1p2: ldo1 {
-			regulator-name = "vreg_l1c_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2c_0p8: ldo2 {
-			regulator-name = "vreg_l2c_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3c_0p8: ldo3 {
-			regulator-name = "vreg_l3c_0p8";
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-2 {
-		compatible = "qcom,pmc8380-rpmh-regulators";
-		qcom,pmic-id = "d";
-
-		vdd-l1-supply = <&vreg_s1f_0p7>;
-		vdd-l2-supply = <&vreg_s1f_0p7>;
-		vdd-l3-supply = <&vreg_s4c_1p8>;
-		vdd-s1-supply = <&vph_pwr>;
-
-		vreg_l1d_0p8: ldo1 {
-			regulator-name = "vreg_l1d_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2d_0p9: ldo2 {
-			regulator-name = "vreg_l2d_0p9";
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3d_1p8: ldo3 {
-			regulator-name = "vreg_l3d_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-3 {
-		compatible = "qcom,pmc8380-rpmh-regulators";
-		qcom,pmic-id = "e";
-
-		vdd-l2-supply = <&vreg_s1f_0p7>;
-		vdd-l3-supply = <&vreg_s5j_1p2>;
-
-		vreg_l2e_0p8: ldo2 {
-			regulator-name = "vreg_l2e_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3e_1p2: ldo3 {
-			regulator-name = "vreg_l3e_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-4 {
-		compatible = "qcom,pmc8380-rpmh-regulators";
-		qcom,pmic-id = "f";
-
-		vdd-l1-supply = <&vreg_s5j_1p2>;
-		vdd-l2-supply = <&vreg_s5j_1p2>;
-		vdd-l3-supply = <&vreg_s5j_1p2>;
-		vdd-s1-supply = <&vph_pwr>;
-
-		vreg_s1f_0p7: smps1 {
-			regulator-name = "vreg_s1f_0p7";
-			regulator-min-microvolt = <700000>;
-			regulator-max-microvolt = <1100000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-6 {
-		compatible = "qcom,pm8550ve-rpmh-regulators";
-		qcom,pmic-id = "i";
-
-		vdd-l1-supply = <&vreg_s4c_1p8>;
-		vdd-l2-supply = <&vreg_s5j_1p2>;
-		vdd-l3-supply = <&vreg_s1f_0p7>;
-		vdd-s1-supply = <&vph_pwr>;
-		vdd-s2-supply = <&vph_pwr>;
-
-		vreg_l1i_1p8: ldo1 {
-			regulator-name = "vreg_l1i_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2i_1p2: ldo2 {
-			regulator-name = "vreg_l2i_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3i_0p8: ldo3 {
-			regulator-name = "vreg_l3i_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-7 {
-		compatible = "qcom,pm8550ve-rpmh-regulators";
-		qcom,pmic-id = "j";
-
-		vdd-l1-supply = <&vreg_s1f_0p7>;
-		vdd-l2-supply = <&vreg_s5j_1p2>;
-		vdd-l3-supply = <&vreg_s1f_0p7>;
-		vdd-s5-supply = <&vph_pwr>;
-
-		vreg_s5j_1p2: smps5 {
-			regulator-name = "vreg_s5j_1p2";
-			regulator-min-microvolt = <1256000>;
-			regulator-max-microvolt = <1304000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1j_0p8: ldo1 {
-			regulator-name = "vreg_l1j_0p8";
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2j_1p2: ldo2 {
-			regulator-name = "vreg_l2j_1p2";
-			regulator-min-microvolt = <1256000>;
-			regulator-max-microvolt = <1256000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3j_0p8: ldo3 {
-			regulator-name = "vreg_l3j_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-};
-
-&gpu {
-	status = "okay";
-
-	zap-shader {
-		firmware-name = "qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn";
-	};
-};
-
-&i2c0 {
-	clock-frequency = <400000>;
-
-	pinctrl-0 = <&qup_i2c0_data_clk>, <&tpad_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	/* ELAN06E2 or ELAN06E3 */
-	touchpad@15 {
-		compatible = "hid-over-i2c";
-		reg = <0x15>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
-
-		wakeup-source;
-	};
-
-	/* SYNA8022 or SYNA8024 */
-	touchpad@2c {
-		compatible = "hid-over-i2c";
-		reg = <0x2c>;
-
-		hid-descr-addr = <0x20>;
-		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
-
-		wakeup-source;
-	};
-
-	/* ELAN06F1 or SYNA06F2 */
-	keyboard@3a {
-		compatible = "hid-over-i2c";
-		reg = <0x3a>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
-
-		pinctrl-0 = <&kybd_default>;
-		pinctrl-names = "default";
-
-		wakeup-source;
-	};
-};
-
-&i2c5 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	eusb5_repeater: redriver@43 {
-		compatible = "nxp,ptn3222";
-		reg = <0x43>;
-		#phy-cells = <0>;
-
-		vdd3v3-supply = <&vreg_l13b_3p0>;
-		vdd1v8-supply = <&vreg_l4b_1p8>;
-
-		reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&eusb5_reset_n>;
-		pinctrl-names = "default";
-	};
-
-	eusb3_repeater: redriver@47 {
-		compatible = "nxp,ptn3222";
-		reg = <0x47>;
-		#phy-cells = <0>;
-
-		vdd3v3-supply = <&vreg_l13b_3p0>;
-		vdd1v8-supply = <&vreg_l4b_1p8>;
-
-		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&eusb3_reset_n>;
-		pinctrl-names = "default";
-	};
-
-	eusb6_repeater: redriver@4f {
-		compatible = "nxp,ptn3222";
-		reg = <0x4f>;
-		#phy-cells = <0>;
-
-		vdd3v3-supply = <&vreg_l13b_3p0>;
-		vdd1v8-supply = <&vreg_l4b_1p8>;
-
-		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&eusb6_reset_n>;
-		pinctrl-names = "default";
-	};
-};
-
-&i2c8 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	/* ILIT2911 or GTCH1563 */
-	touchscreen@10 {
-		compatible = "hid-over-i2c";
-		reg = <0x10>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
-
-		pinctrl-0 = <&ts0_default>;
-		pinctrl-names = "default";
-	};
-
-	/* TODO: second-sourced touchscreen @ 0x41 */
-};
-
-&lpass_tlmm {
-	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
-		pins = "gpio12";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-		output-low;
-	};
-};
-
-&lpass_vamacro {
-	pinctrl-0 = <&dmic01_default>;
-	pinctrl-names = "default";
-
-	vdd-micb-supply = <&vreg_l1b_1p8>;
-	qcom,dmic-sample-rate = <4800000>;
-};
-
-&mdss {
-	status = "okay";
-};
-
-&mdss_dp3 {
-	compatible = "qcom,x1e80100-dp";
-	/delete-property/ #sound-dai-cells;
-
-	status = "okay";
-
-	aux-bus {
-		panel {
-			compatible = "edp-panel";
-			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
-			power-supply = <&vreg_edp_3p3>;
-
-			pinctrl-0 = <&edp_bl_en>;
-			pinctrl-names = "default";
-
-			port {
-				edp_panel_in: endpoint {
-					remote-endpoint = <&mdss_dp3_out>;
-				};
-			};
-		};
-	};
-
-	ports {
-		port@1 {
-			reg = <1>;
-
-			mdss_dp3_out: endpoint {
-				data-lanes = <0 1 2 3>;
-				link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-
-				remote-endpoint = <&edp_panel_in>;
-			};
-		};
-	};
-};
-
-&mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l3j_0p8>;
-	vdda-pll-supply = <&vreg_l2j_1p2>;
-
-	status = "okay";
-};
-
-&pcie4 {
-	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
-	pinctrl-0 = <&pcie4_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie4_phy {
-	vdda-phy-supply = <&vreg_l3i_0p8>;
-	vdda-pll-supply = <&vreg_l3e_1p2>;
-
-	status = "okay";
-};
-
-&pcie6a {
-	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
-
-	vddpe-3v3-supply = <&vreg_nvme>;
-
-	pinctrl-0 = <&pcie6a_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie6a_phy {
-	vdda-phy-supply = <&vreg_l1d_0p8>;
-	vdda-pll-supply = <&vreg_l2j_1p2>;
-
-	status = "okay";
-};
-
-&pmc8380_3_gpios {
-	edp_bl_en: edp-bl-en-state {
-		pins = "gpio4";
-		function = "normal";
-		power-source = <1>;
-		input-disable;
-		output-enable;
-	};
-};
-
-&qupv3_0 {
-	status = "okay";
-};
-
-&qupv3_1 {
-	status = "okay";
-};
-
-&qupv3_2 {
-	status = "okay";
-};
-
-&remoteproc_adsp {
-	firmware-name = "qcom/x1e80100/LENOVO/21N1/qcadsp8380.mbn",
-			"qcom/x1e80100/LENOVO/21N1/adsp_dtbs.elf";
-
-	status = "okay";
-};
-
-&remoteproc_cdsp {
-	firmware-name = "qcom/x1e80100/LENOVO/21N1/qccdsp8380.mbn",
-			"qcom/x1e80100/LENOVO/21N1/cdsp_dtbs.elf";
-
-	status = "okay";
-};
-
-&smb2360_0 {
-	status = "okay";
-};
-
-&smb2360_0_eusb2_repeater {
-	vdd18-supply = <&vreg_l3d_1p8>;
-	vdd3-supply = <&vreg_l2b_3p0>;
-};
-
-&smb2360_1 {
-	status = "okay";
-};
-
-&smb2360_1_eusb2_repeater {
-	vdd18-supply = <&vreg_l3d_1p8>;
-	vdd3-supply = <&vreg_l14b_3p0>;
-};
-
-&swr0 {
-	status = "okay";
-
-	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
-	pinctrl-names = "default";
-
-	/* WSA8845, Left Speaker */
-	left_spkr: speaker@0,0 {
-		compatible = "sdw20217020400";
-		reg = <0 0>;
-		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "SpkrLeft";
-		vdd-1p8-supply = <&vreg_l15b_1p8>;
-		vdd-io-supply = <&vreg_l12b_1p2>;
-		qcom,port-mapping = <1 2 3 7 10 13>;
-	};
-
-	/* WSA8845, Right Speaker */
-	right_spkr: speaker@0,1 {
-		compatible = "sdw20217020400";
-		reg = <0 1>;
-		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "SpkrRight";
-		vdd-1p8-supply = <&vreg_l15b_1p8>;
-		vdd-io-supply = <&vreg_l12b_1p2>;
-		qcom,port-mapping = <4 5 6 7 11 13>;
-	};
-};
-
-&swr1 {
-	status = "okay";
-
-	/* WCD9385 RX */
-	wcd_rx: codec@0,4 {
-		compatible = "sdw20217010d00";
-		reg = <0 4>;
-		qcom,rx-port-mapping = <1 2 3 4 5>;
-	};
-};
-
-&swr2 {
-	status = "okay";
-
-	/* WCD9385 TX */
-	wcd_tx: codec@0,3 {
-		compatible = "sdw20217010d00";
-		reg = <0 3>;
-		qcom,tx-port-mapping = <2 2 3 4>;
-	};
-};
-
-&tlmm {
-	gpio-reserved-ranges = <34 2>, /* Unused */
-			       <44 4>, /* SPI (TPM) */
-			       <72 2>, /* Secure EC I2C connection (?) */
-			       <238 1>; /* UFS Reset */
-
-	eusb3_reset_n: eusb3-reset-n-state {
-		pins = "gpio6";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-		output-low;
-	};
-
-	eusb5_reset_n: eusb5-reset-n-state {
-		pins = "gpio7";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-		output-low;
-	};
-
-	eusb6_reset_n: eusb6-reset-n-state {
-		pins = "gpio184";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-		output-low;
-	};
-
-	tpad_default: tpad-default-state {
-		pins = "gpio3";
-		function = "gpio";
-		bias-pull-up;
-	};
-
-	nvme_reg_en: nvme-reg-en-state {
-		pins = "gpio18";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	ts0_default: ts0-default-state {
-		reset-n-pins {
-			pins = "gpio48";
-			function = "gpio";
-			output-high;
-			drive-strength = <16>;
-		};
-
-		int-n-pins {
-			pins = "gpio51";
-			function = "gpio";
-			bias-disable;
-		};
-	};
-
-	kybd_default: kybd-default-state {
-		pins = "gpio67";
-		function = "gpio";
-		bias-disable;
-	};
-
-	edp_reg_en: edp-reg-en-state {
-		pins = "gpio70";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	hall_int_n_default: hall-int-n-state {
-		pins = "gpio92";
-		function = "gpio";
-		bias-disable;
-	};
-
-	pcie4_default: pcie4-default-state {
-		clkreq-n-pins {
-			pins = "gpio147";
-			function = "pcie4_clk";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio146";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio148";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie6a_default: pcie6a-default-state {
-		clkreq-n-pins {
-			pins = "gpio153";
-			function = "pcie6a_clk";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio152";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio154";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	wcd_default: wcd-reset-n-active-state {
-		pins = "gpio191";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-		output-low;
-	};
-};
-
-&usb_1_ss0_hsphy {
-	vdd-supply = <&vreg_l3j_0p8>;
-	vdda12-supply = <&vreg_l2j_1p2>;
-
-	phys = <&smb2360_0_eusb2_repeater>;
-
-	status = "okay";
-};
-
-&usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l1j_0p8>;
-
-	status = "okay";
-};
-
-&usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
-	dr_mode = "host";
-};
-
-&usb_1_ss0_dwc3_hs {
-	remote-endpoint = <&pmic_glink_ss0_hs_in>;
-};
-
-&usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss0_ss_in>;
-};
-
-&usb_1_ss1_hsphy {
-	vdd-supply = <&vreg_l3j_0p8>;
-	vdda12-supply = <&vreg_l2j_1p2>;
-
-	phys = <&smb2360_1_eusb2_repeater>;
-
-	status = "okay";
-};
-
-&usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
-
-	status = "okay";
-};
-
-&usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
-	dr_mode = "host";
-};
-
-&usb_1_ss1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_ss1_hs_in>;
-};
-
-&usb_1_ss1_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss1_ss_in>;
-};
-
-&usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
-	dr_mode = "host";
-};
-
-&usb_2_hsphy {
-	vdd-supply = <&vreg_l2e_0p8>;
-	vdda12-supply = <&vreg_l3e_1p2>;
-
-	phys = <&eusb5_repeater>;
-
-	status = "okay";
-};
-
-&usb_mp {
-	status = "okay";
-};
-
-&usb_mp_hsphy0 {
-	vdd-supply = <&vreg_l2e_0p8>;
-	vdda12-supply = <&vreg_l3e_1p2>;
-
-	phys = <&eusb6_repeater>;
-
-	status = "okay";
-};
-
-&usb_mp_hsphy1 {
-	vdd-supply = <&vreg_l2e_0p8>;
-	vdda12-supply = <&vreg_l3e_1p2>;
-
-	phys = <&eusb3_repeater>;
-
-	status = "okay";
-};
-
-&usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
-
-	status = "okay";
-};
-
-&usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
-
-	status = "okay";
-};
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Linaro Limited
+ */
+
+#include "x1e78100-lenovo-thinkpad-t14s.dtsi"
+
+/ {
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8550_pwm 0 5000000>;
+		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vreg_edp_bl>;
+
+		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
+		pinctrl-names = "default";
+	};
+
+	vreg_edp_bl: regulator-edp-bl {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VBL9";
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&edp_bl_reg_en>;
+
+		regulator-boot-on;
+	};
+};
+
+&panel {
+	backlight = <&backlight>;
+};
+
+&pmc8380_3_gpios {
+	edp_bl_reg_en: edp-bl-reg-en-state {
+		pins = "gpio10";
+		function = "normal";
+	};
+};
+
+&pmk8550_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio5";
+		function = "func3";
+	};
+};
+
+&pmk8550_pwm {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
similarity index 99%
copy from arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
copy to arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index b2c2347f54fa..802c50f78436 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -704,14 +704,10 @@ &mdss_dp3 {
 	status = "okay";
 
 	aux-bus {
-		panel {
+		panel: panel {
 			compatible = "edp-panel";
-			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
 			power-supply = <&vreg_edp_3p3>;
 
-			pinctrl-0 = <&edp_bl_en>;
-			pinctrl-names = "default";
-
 			port {
 				edp_panel_in: endpoint {
 					remote-endpoint = <&mdss_dp3_out>;
-- 
2.34.1


