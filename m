Return-Path: <linux-arm-msm+bounces-60038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46432ACAA7C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 10:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C368189A623
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 08:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78481B85C5;
	Mon,  2 Jun 2025 08:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLACAx3u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D892C3240;
	Mon,  2 Jun 2025 08:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748852408; cv=none; b=fUQn4aR//3OQRtQiH5s/d4yfOGy3wBHEGn5xkSTGWhuLu7ttQZTLXp0TTqrIBx9KxwYP3NqcMQphCxj/GghJYFIAlWj9ONrWfWVEJC6rC0jLi8hKkZ0RS/0VpWhcNbMDxgKIhF8FmCQKlySQ+u4M3EAAld2UiR3x/m4GTET90X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748852408; c=relaxed/simple;
	bh=wQmdVQzhmACE/iLA+CILuPts2LFooLyztYYbLPdIp3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jqAyJloMFaqLclZPF43EqL4aMma9vwEAES5FAbCwLANHF2utDsefyQfv7g+JzcOXh3VwslVdJk1TGEfnSwAT1/7A52S2Qz8xcWbP09comPAtyEKde6yO+w9+8jn8isbEU+tTyA+SI8azOGSt7IBOLixrQIl2LBZ9aOzh2urJXiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLACAx3u; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-735a9e65471so2509004a34.1;
        Mon, 02 Jun 2025 01:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748852406; x=1749457206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4AIXpAJK6Qh4J225/GkriMkqC1GAmPuK8nWyY+CVyU=;
        b=HLACAx3uE4Ijcv0DzSM0mFL+AEWZG/6njkrp6f1uj8AJHEyV3Ggq9loMQ8DFci7Bsy
         Oya6RcLQybRy6PU+1BdO1Sybx29+cwe9J6BtV6K4IwdqgzZpZU3FgxDOPDqUh1xBatJj
         NsQSnN1cW+TYIwSLkERJroj5fgJwnyuIeI8VPc2M/GH7KgFLRDM8tK4llXr33VVb7LcL
         CajQrz+mLE1oGigFwBuVG4vX8hFrN/TjjQs+Y1vZNTjXLLL4qip73Er6Y6QbrXiNlugI
         Yh1x6EcfuIQ9tGWzEhEKYp//4e2HEKOAPbDHT30+tyO5kNl1JLYsqW4WeZuGtvQI/mdE
         sXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748852406; x=1749457206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4AIXpAJK6Qh4J225/GkriMkqC1GAmPuK8nWyY+CVyU=;
        b=Z0HgGx0QtqKw9p0EdroZ0XTXitIGR9+n+PaSq3ZlCo7NisMZL0yeggJ1geYoCwstnB
         GwGqaoCFR/G8gd1nFdGLsEeTfycgFUFvxmZGiQeHy2aNPQuzd2M5AIgWterEZNtnmoxL
         5Mpit+XZCFzDjmfapV/pOF/6/kbIDOBQtWz1QdIcMROTj5FgC6nC/R2l5GBUg0aanSK+
         eNOoLRc0b1vf2B4hWyBtj+vOEVNz6qPVht2YaamwMHn/GgsJaNCHi2XGMKqcQDFMol4e
         1BErbLaSAivC9guwONFinE1gYm4CIeucH00E+4CZBop2KlsY2PHK0Fx99AH2OZYhLHUt
         JSWg==
X-Forwarded-Encrypted: i=1; AJvYcCWWQiX8DMEXkwESyTNOYc0M0DOnjkrw5oxVVvdYytwhvwWIBR2X+0la+1E+mARP5knG3sPvmEDBQRRm@vger.kernel.org, AJvYcCXJH78G5lFTaX8ikF1eIkS3YD/uEz6MP6oQ8nMY85QTIsgH6bXou/2TOZ+T181m9L7SoLlqEyiMUf5qZpQdWA==@vger.kernel.org, AJvYcCXkanib/KNqcKyBTYceFyzGZ6/MZ+kzxTwrw/+pBVyWFp4Y+MJI+VYfeXFTCfdG/+TvdH+hSEl69DJfn9iH@vger.kernel.org
X-Gm-Message-State: AOJu0YxOS4B90LnQN3HZj1DXLxpNjK5TmOK7LTVP/VK8E+1PBekCjORx
	GBVFs3wBPCxYr8nLX1g4D5Rt9rBY64h63zn/gf5y6kwR+ZLoeng1jT53UpujjOv+
X-Gm-Gg: ASbGncvsr2pIjEhFJU3sd+r2dELr0okOdbFgZU0TKwi8FQuy26cDdyRGJkeGz6dxiWZ
	5Rzbki2et8fYA36bx3eOosMyy5wD0+4+VHGqIqgCihDNBDg/Eekow9Qu4EOIv7cmT2/OMRSo92K
	Vbw6/cRpQUQuhNkcihGS/BSVKWd6A5RXpaanga5O4GscCBtpRce4n5/Jpb6tYd7bEfADjhTShtP
	ppFlESfsReDRZlGMLipacV40d3mWfK5mCgzQJgL7epojhLIXaK4BJP4DIDVfRRWIpPJh0ymtOqQ
	WN4FrbeF2I8yQQO5oQHcb6H2G0Ho/30RuxHbl6IZxsgbxCezG26ofUNvWYKm1e3k+9F7my3w6HA
	ipPlg+Bmy6FRG+9IdbrdWypxfo3SHYAo8cfFiNKQgmrxe+0CbPCXIX/oyGws1Efi6+Q==
X-Google-Smtp-Source: AGHT+IHclKPqTOEZunbGOPTiEBJQffpUA66wP9SE4O0rQUc1IFZNJvvRVQISZwHrq/VB+kDIa3fxPA==
X-Received: by 2002:a05:6a00:124b:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-747bda09fb4mr16568976b3a.21.1748852395128;
        Mon, 02 Jun 2025 01:19:55 -0700 (PDT)
Received: from localhost.localdomain (ec2-13-229-131-224.ap-southeast-1.compute.amazonaws.com. [13.229.131.224])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcf2f9sm7101372b3a.127.2025.06.02.01.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 01:19:54 -0700 (PDT)
From: binarycraft007 <elliot.huang.signed@gmail.com>
To: andersson@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	johan@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lumag@kernel.org,
	maud_spierings@hotmail.com,
	robh@kernel.org,
	Elliot Huang <elliot.huang.signed@gmail.com>
Subject: [PATCH 1/1] arm64: dts: qcom: support sound on Asus Vivobook S15
Date: Mon,  2 Jun 2025 16:16:38 +0800
Message-ID: <20250602081638.51724-1-elliot.huang.signed@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <174770727723.36693.13352978360096773573.b4-ty@kernel.org>
References: <174770727723.36693.13352978360096773573.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Elliot Huang <elliot.huang.signed@gmail.com>

This adds sound support for vivobook s15, tested:
- 2 speakers.
- 2 dmics
- headset with mic(distorted).

Signed-off-by: Elliot Huang <elliot.huang.signed@gmail.com>
---
 .../dts/qcom/x1e80100-asus-vivobook-s15.dts   | 202 ++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index 71b2cc6..cce2460 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -23,6 +23,32 @@ aliases {
 		serial1 = &uart14;
 	};
 
+	wcd938x: audio-codec {
+		compatible = "qcom,wcd9385-codec";
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
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b_1p8>;
+		vdd-rxtx-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l15b_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob1>;
+
+		#sound-dai-cells = <1>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-0 = <&hall_int_n_default>;
@@ -105,6 +131,88 @@ pmic_glink_ss1_ss_in: endpoint {
 		};
 	};
 
+	sound {
+		compatible = "qcom,x1e80100-sndcard";
+		model = "X1E80100-ASUS-Vivobook-S15";
+		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA WSA_SPK2 OUT",
+				"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2",
+				"VA DMIC0", "MIC BIAS3",
+				"VA DMIC1", "MIC BIAS3",
+				"VA DMIC0", "VA MIC BIAS3",
+				"VA DMIC1", "VA MIC BIAS3",
+				"TX SWR_INPUT1", "ADC2_OUTPUT";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
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
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			codec {
+				sound-dai = <&wcd938x 1>, <&swr2 1>,
+					    <&lpass_txmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&wcd938x 0>, <&swr1 0>,
+					    <&lpass_rxmacro 0>;
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
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	reserved-memory {
 		linux,cma {
 			compatible = "shared-dma-pool";
@@ -290,6 +398,13 @@ vreg_bob2: bob2 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l1b_1p8: ldo1 {
+			regulator-name = "vreg_l1b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l2b_3p0: ldo2 {
 			regulator-name = "vreg_l2b_3p0";
 			regulator-min-microvolt = <3072000>;
@@ -304,6 +419,14 @@ vreg_l4b_1p8: ldo4 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l12b_1p2: ldo12 {
+			regulator-name = "vreg_l12b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
 		vreg_l13b_3p0: ldo13 {
 			regulator-name = "vreg_l13b_3p0";
 			regulator-min-microvolt = <3072000>;
@@ -586,6 +709,24 @@ &i2c7 {
 	/* PS8830 USB4 Retimer? @ 0x8 */
 };
 
+&lpass_tlmm {
+	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&vreg_l1b_1p8>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &mdss {
 	status = "okay";
 };
@@ -742,6 +883,59 @@ &smb2360_1_eusb2_repeater {
 	vdd3-supply = <&vreg_l14b_3p0>;
 };
 
+&swr0 {
+	status = "okay";
+
+	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
+	pinctrl-names = "default";
+
+	/* WSA8845, Left Speaker */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Right Speaker */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	/* WCD9385 RX */
+	wcd_rx: codec@0,4 {
+		compatible = "sdw20217010d00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr2 {
+	status = "okay";
+
+	/* WCD9385 TX */
+	wcd_tx: codec@0,3 {
+		compatible = "sdw20217010d00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <2 2 3 4>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
@@ -849,6 +1043,14 @@ tpad_default: tpad-default-state {
 		bias-disable;
 	};
 
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
 	wcn_bt_en: wcn-bt-en-state {
 		pins = "gpio116";
 		function = "gpio";
-- 
2.49.0


