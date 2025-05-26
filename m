Return-Path: <linux-arm-msm+bounces-59429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E158AC3ED0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 13:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBC89188BBD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 11:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7F91FE443;
	Mon, 26 May 2025 11:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n47CxTzH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ED01FBCAD
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 11:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748260005; cv=none; b=tQ8XcCo7+IYUPmVagsZQg7pbDfc+MhnI0LeP+EcMdksn6ymZ4KnY+km2TK4RGOfKkbqum5/OpAFC+40mmCthw1/g2FGTuJ13/k5u59wZvBWMrCAJ3qjUOV/L2IGS2vo/kRHuI4vVdfu2cQgfkOcn2IlzlUAOsRr69U8t/yZLVPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748260005; c=relaxed/simple;
	bh=cnjqJvhbWuR3WHiIP3fHiQ3G4qGuKG4SN/9SLI6xtK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ID1Q3/43nBUITQGAYvJNWEfwOSsVC+U5YVjfrqq8vGA2ZvgdgwNpKJGLPER9fNN+nHuCYetjXPlipE3jdnoVz8/i4PfWHPfAZQ7auxQVOzZkLf3Z0ykoM7KgXZf1DmKu1+v/OUqUKj6ibdAPedl4i5/xm2jiWQPx7qwtz44j84c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n47CxTzH; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4cfa5c8ddso349222f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 04:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748260001; x=1748864801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psDhaeHurUBXMj/Px7/tCG96t2UI30PEGCPOuXBbmuw=;
        b=n47CxTzH+R4E0UjNI+b1FHqwtQs8a2Q4ueKoH7KdK7tz/GMXOzyanQ8xzNlLdySV3c
         J5QhdD/rxXABiwOwv8ibYxxZmiex9DHPN+weZaZuh+mAYsiOiIej/g7pi8xsgSFG0CkH
         8De2cyortzq9GIGapq/isxpHWodXJtPHoeKRQmG7SqUPqMoj5QMdWreMVJUiy4viNuQF
         UgEQ+sjk6p876JMjkiMtTrEi35LaBnIVWJa9bNZr5B92ScBio/h70r6aq4lq6LykxQCh
         oCuCXXIIRabUSoPID5anpSXQM/ZroQji1RgnY4cInvhErEH4XO9sDaq2r/vThWSahkv3
         5z5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748260001; x=1748864801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psDhaeHurUBXMj/Px7/tCG96t2UI30PEGCPOuXBbmuw=;
        b=iZocZA9I/s+z22z0VIxwp71epLBO7iidgtyuLoE4eIP1yC8p0QunnmiExUJplQla82
         7RhizIVreXt0BLBCauzRCOWvj3q+NnplDkfyTUh8LDoXAXeMXi9F6FfKiI5wjc4cN4QY
         zRYZmLljt6/jXORJZsismKX+1/+oQVBrxzsv0aTU35Dhgr6Usf67UelZ6GDomm5c6PgE
         kNg2+wSq2zohGMKdSkIDY+M/St7K5xKNhkiwfHUnDjbwkrAxbW2bh4Yez9you82ohJ9W
         XDzRn1Lt8FBuyUuxk9wYTHjF+2MTSLIagxveSzEFGnlS+/MoFg5u83TZbeg6cbF/ZVl7
         xQTg==
X-Gm-Message-State: AOJu0Yx7eOeYmhJHtTzggKbKzagGZLpccmkFb9G52gTcypvqF3ro9FFM
	UQK9nTvN5JpBUZU8l55zhfJnn8z06H+kxy/+rFE328h4SAYYpPDnpaMIb1w3xk+E6/A=
X-Gm-Gg: ASbGnctuQ/UAQn3TlScBETMSHWrPI1H1MesTkrZ9ATRUCfPCivHAicWX7RxOGYl/pYS
	Oz+paOZeiGYSzm30vUHGTfbZ1o1SatBo7kzTYN1Txq2ryoe1SDMa3+FHu/ZFmajJGcjUgNvRosD
	Y8HDzQCWePytuLHyrWSds16ap5PlWz2A1oovfHwZG67W0MohxplMEO2l/MvDV4fQH5PeWjsBS12
	cM7Dg1Qcjn0t6DLuRuVAC/Fgsx3w7NQyHzmd9GaPqmN46hvteIpjYNYBS5CMSL0SWDxVOBLzudn
	kTqLayPwmAd6b1T5QSxc1I6weO6MyeBE2MVELHUZjIDFcA2ukvTw2QDV8rIYZr9ZlQA+w0M=
X-Google-Smtp-Source: AGHT+IG3ZE0rvws+D2qpV4ZtCuSF7sGdmES6L31WDPmRuXu3QrnJEWvMmGOkifczCoIrvklIMggTqQ==
X-Received: by 2002:a5d:5702:0:b0:3a4:cbc6:9dd0 with SMTP id ffacd0b85a97d-3a4cbc69e7dmr1931155f8f.15.1748260001194;
        Mon, 26 May 2025 04:46:41 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cc52ab88sm7592310f8f.11.2025.05.26.04.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:46:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 May 2025 13:46:33 +0200
Subject: [PATCH v3 2/3] arm64: dts: qcom: sm8750-mtp: Add sound (speakers,
 headset codec, dmics)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-sm8750-audio-part-2-v3-2-74429c686bb1@linaro.org>
References: <20250526-sm8750-audio-part-2-v3-0-74429c686bb1@linaro.org>
In-Reply-To: <20250526-sm8750-audio-part-2-v3-0-74429c686bb1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6735;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cnjqJvhbWuR3WHiIP3fHiQ3G4qGuKG4SN/9SLI6xtK8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNFSbCEMgROTEV8WFLqQ++C00hAy9yoy+pZanq
 agaCmBfz/+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDRUmwAKCRDBN2bmhouD
 11GhD/97K//+Bo6/3QvwkI4sTsvtB9D/Sft5g3Za2Bu6t6JOk3+NwsiDveKNyk5y3p/gxy70AVy
 exuk3W8XgEtXxe+NM/zaCrvVY1LpZq44n1rVT0uweeDIfa28R74kTrA7ShuO+p3YWrKQQQjZeAQ
 GJzdaxMuxe9aLcJa1Swdgc5lG8+OSEwnPhe1ozXPl69TPiFqITJiO5y17dh6ryihiJvFrtcIM0L
 jsakj9gBduMo3wTbP/AGMKmr7U4yeq1hiT60PsozsJKbobvcxC+0j2Z8jjOo8HMwHlwj21ckCLs
 TUFEAOkk1zI/++G6BJIVzODFOawH7HM08eaRbTMXlJoRO0SXDLU9PPdARwGALdeb6CopJgvR9Hv
 hCmKTSRH2xlFg36G2hSxCBJUUzXNKp9WDrLQd3PsrzZ4UWvfzmoGPM18ABBOOSzf+TxaujN7t3n
 k3Vu421GqlIS/KPnLYt0f1wFgv3w7I13HnSXeuLXLJH4oohbz7sL9Rk3EdEd9pPZGiYX8ZrpeHg
 Nfeo7f5W40pH3Tvb+XPj12CM+eH1T9hVNtrzCRrusX3CB9hLSXVylBdlSy5NkKaOO3i2BDoZsER
 9sulELZFbg18+yT5u8G6hHwi5ciHFwRCsQUmrE7mMZEPnUjdPcnvdoNs7WBopOiUf061TGXkgvP
 TdSTQhGXRa5HXpQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add device nodes for most of the sound support - WSA883x smart speakers,
WCD9395 audio codec (headset) and sound card - which allows sound
playback via speakers and recording via DMIC microphones.  Changes bring
necessary foundation for headset playback/recording via USB, but that
part is not yet ready.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 215 ++++++++++++++++++++++++++++++++
 1 file changed, 215 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 72f081a890dfe49bfbee5e91b9e51da53b9d8baf..a9de383d0dddf5c80aee5e1176501238a4977153 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -29,6 +29,33 @@ aliases {
 		serial0 = &uart7;
 	};
 
+	wcd939x: audio-codec {
+		compatible = "qcom,wcd9395-codec", "qcom,wcd9390-codec";
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+		qcom,rx-device = <&wcd_rx>;
+		qcom,tx-device = <&wcd_tx>;
+
+		reset-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b_1p8>;
+		vdd-rxtx-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l15b_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob1>;
+		vdd-px-supply = <&vreg_l2i_1p2>;
+
+		#sound-dai-cells = <1>;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -81,6 +108,89 @@ key-volume-up {
 		};
 	};
 
+	sound {
+		compatible = "qcom,sm8750-sndcard", "qcom,sm8450-sndcard";
+		model = "SM8750-MTP";
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2",
+				"VA DMIC0", "MIC BIAS3", /* MIC4 on schematics */
+				"VA DMIC1", "MIC BIAS3", /* MIC1 on schematics */
+				"VA DMIC2", "MIC BIAS1",
+				"VA DMIC3", "MIC BIAS1",
+				"VA DMIC0", "VA MIC BIAS3",
+				"VA DMIC1", "VA MIC BIAS3",
+				"VA DMIC2", "VA MIC BIAS1",
+				"VA DMIC3", "VA MIC BIAS1",
+				"TX SWR_INPUT1", "ADC2_OUTPUT";
+
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			codec {
+				sound-dai = <&wcd939x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			codec {
+				sound-dai = <&wcd939x 1>, <&swr2 0>, <&lpass_txmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 
@@ -702,6 +812,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&vreg_l1b_1p8>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &pm8550_flash {
 	status = "okay";
 
@@ -806,6 +924,74 @@ &remoteproc_mpss {
 	status = "fail";
 };
 
+&swr0 {
+	status = "okay";
+
+	/* WSA883x, left/front speaker */
+	left_spkr: speaker@0,1 {
+		compatible = "sdw10217020200";
+		reg = <0 1>;
+		pinctrl-0 = <&spkr_0_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lpass_tlmm 17 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		#thermal-sensor-cells = <0>;
+		vdd-supply = <&vreg_l15b_1p8>;
+	};
+
+	/* WSA883x, right/back speaker */
+	right_spkr: speaker@0,2 {
+		compatible = "sdw10217020200";
+		reg = <0 2>;
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		#thermal-sensor-cells = <0>;
+		vdd-supply = <&vreg_l15b_1p8>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	/* WCD9395 RX */
+	wcd_rx: codec@0,4 {
+		compatible = "sdw20217010e00";
+		reg = <0 4>;
+
+		/*
+		 * WCD9395 RX Port 1 (HPH_L/R)      <=> SWR1 Port 1 (HPH_L/R)
+		 * WCD9395 RX Port 2 (CLSH)         <=> SWR1 Port 2 (CLSH)
+		 * WCD9395 RX Port 3 (COMP_L/R)     <=> SWR1 Port 3 (COMP_L/R)
+		 * WCD9395 RX Port 4 (LO)           <=> SWR1 Port 4 (LO)
+		 * WCD9395 RX Port 5 (DSD_L/R)      <=> SWR1 Port 5 (DSD_L/R)
+		 * WCD9395 RX Port 6 (HIFI_PCM_L/R) <=> SWR1 Port 9 (HIFI_PCM_L/R)
+		 */
+		qcom,rx-port-mapping = <1 2 3 4 5 9>;
+	};
+};
+
+&swr2 {
+	status = "okay";
+
+	/* WCD9395 TX */
+	wcd_tx: codec@0,3 {
+		compatible = "sdw20217010e00";
+		reg = <0 3>;
+
+		/*
+		 * WCD9395 TX Port 1 (ADC1,2,3,4)         <=> SWR2 Port 2 (TX SWR_INPUT 0,1,2,3)
+		 * WCD9395 TX Port 2 (ADC3,4 & DMIC0,1)   <=> SWR2 Port 2 (TX SWR_INPUT 0,1,2,3)
+		 * WCD9395 TX Port 3 (DMIC0,1,2,3 & MBHC) <=> SWR2 Port 3 (TX SWR_INPUT 4,5,6,7)
+		 * WCD9395 TX Port 4 (DMIC4,5,6,7)        <=> SWR2 Port 4 (TX SWR_INPUT 8,9,10,11)
+		 */
+		qcom,tx-port-mapping = <2 2 3 4>;
+	};
+};
+
 &tlmm {
 	/* reserved for secure world */
 	gpio-reserved-ranges = <36 4>, <74 1>;
@@ -814,3 +1000,32 @@ &tlmm {
 &uart7 {
 	status = "okay";
 };
+
+/* Pinctrl */
+&lpass_tlmm {
+	spkr_0_sd_n_active: spkr-0-sd-n-active-state {
+		pins = "gpio17";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+};
+
+&tlmm {
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio101";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+};

-- 
2.45.2


