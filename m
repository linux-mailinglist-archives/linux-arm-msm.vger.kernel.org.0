Return-Path: <linux-arm-msm+bounces-38744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BECB9D5825
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 03:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21A2FB22350
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 02:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E20D15AAB6;
	Fri, 22 Nov 2024 02:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uW8sT40J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516D6158A31;
	Fri, 22 Nov 2024 02:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732241697; cv=none; b=KWrHR/ob8unI0RkmQYToqZzZd9h+SqlmF1XTijucws7S18FWvTCxO7u5vKZ9e9cA4VY3nRb4oqonMaYC8BQHhQU/h+wwPhYb4nzYDw4CGKfKyqMrlg+GB9gdRXYFyMtlMKLODwc0e54lXhuWx5cNtx34a5fOinLfEAFktYuUihE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732241697; c=relaxed/simple;
	bh=K7+sfJr1hllA1qqBigQ3QCyQK4P59Y6u6jVirsYPI/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BK79/sppvKn3lPB33E+AgLThlcG8xphBEDxQDUTsTVRIRAplot5akTUDEj560H+7OXJVchtpbr1CacCgsPoCi906dG/hbhKBv+pAXZjHOdzGDXa8vhSuugZynw8ArbbwKkaMVRB8SDgsnJ1vkXDU64LxvF1Hlt/j041wYJemTXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uW8sT40J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62ACFC4CED6;
	Fri, 22 Nov 2024 02:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732241696;
	bh=K7+sfJr1hllA1qqBigQ3QCyQK4P59Y6u6jVirsYPI/Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uW8sT40JKqFlR8UqBU/ikYuCUoZtsUfgTRTPCUNVrPL8ulSFg8DbjSyuEPmSSbGY1
	 6FOPtALrt3rcs3WtHVyB8hoesxktnr1tNZpabCjO9xdhCr6Mf21LBI26uM5/WHkRXM
	 iKQC72u8/PicSOCmp8dxitEaCTWChdptBc6mKyyTBO3ARqjqnRxgsv3lMLwBT/P4OE
	 JahsPTipwizojPjJJGUeMRmu8J66XvMEKJrVFu/oZ2y9bwfXYCAl6gG1IGCi8sEI/1
	 gfrOLpHBEiOuHtZhUgJIPIUYPzW5ABIUJLuXZSE1C3AIPZrJvl24SuMXCbszPtkQom
	 osICuKoS/V7JQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 22 Nov 2024 03:14:10 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: x1e80100-romulus: Configure audio
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-topic-sl7_feat2-v1-1-33e616be879b@oss.qualcomm.com>
References: <20241122-topic-sl7_feat2-v1-0-33e616be879b@oss.qualcomm.com>
In-Reply-To: <20241122-topic-sl7_feat2-v1-0-33e616be879b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732241690; l=5516;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=kaY4obG6InWT0vG9GUXnVZRepAYtcPO4ICLfhQy7HbM=;
 b=0l//oGGmBzLLRnxUrmBdrJwK03s41KRRzp4a5G5I/Fv2ge+uiwrHAlxxVHw5LK1PG4sHoB6+e
 KHQou4BM50aBZE//kCyVGG+ZIrwVri4/87VcBRxg98aZPcqHjlZOd66
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Laptop 7 features a single pair of speakers and an equal amount of
digital mics.

Add the required nodes to support audio playback and recording.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 187 +++++++++++++++++++++
 1 file changed, 187 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 6835fdeef3aec10206e8b2839d23e4f3494afe1e..6aea8f3573e834273d56448da772edd27855efec 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -22,6 +22,33 @@ aliases {
 		i2c7 = &i2c7;
 	};
 
+	wcd938x: audio-codec {
+		compatible = "qcom,wcd9385-codec";
+
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
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
+
+		vdd-buck-supply = <&vreg_l15b>;
+		vdd-rxtx-supply = <&vreg_l15b>;
+		vdd-io-supply = <&vreg_l15b>;
+		vdd-mic-bias-supply = <&vreg_bob1>;
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		#sound-dai-cells = <1>;
+	};
+
 	backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pmk8550_pwm 0 5000000>;
@@ -184,6 +211,86 @@ vph_pwr: regulator-vph-pwr {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	sound {
+		compatible = "qcom,x1e80100-sndcard";
+		model = "X1E80100-Romulus";
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
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
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
+				sound-dai = <&wcd938x 1>, <&swr2 1>, <&lpass_txmacro 0>;
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
+	};
 };
 
 &apps_rsc {
@@ -595,6 +702,25 @@ &i2c7 {
 	/* PS8830 USB retimer @8 */
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
+	qcom,dmic-sample-rate = <4800000>;
+
+	vdd-micb-supply = <&vreg_l1b>;
+
+	pinctrl-0 = <&dmic01_default>;
+	pinctrl-names = "default";
+};
+
 &mdss {
 	status = "okay";
 };
@@ -737,6 +863,59 @@ &smb2360_2_eusb2_repeater {
 	vdd3-supply = <&vreg_l8b>;
 };
 
+&swr0 {
+	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* WSA8845, Left speaker */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		vdd-1p8-supply = <&vreg_l15b>;
+		vdd-io-supply = <&vreg_l12b>;
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Right speaker */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		vdd-1p8-supply = <&vreg_l15b>;
+		vdd-io-supply = <&vreg_l12b>;
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
 	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
@@ -790,6 +969,14 @@ wake-n-pins {
 		};
 	};
 
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
 	cam_indicator_en: cam-indicator-en-state {
 		pins = "gpio225";
 		function = "gpio";

-- 
2.47.0


