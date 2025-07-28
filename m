Return-Path: <linux-arm-msm+bounces-66816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 620BEB13575
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 09:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2DF83B5CB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 07:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADEC22B8A5;
	Mon, 28 Jul 2025 07:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WUWsc8Rd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F11822A4EA;
	Mon, 28 Jul 2025 07:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753686984; cv=none; b=Cxv/lWtN8coq2onPRZ0YcRS1lB2z5Hes0WYjq11218rDUdEtm1mad7xlqgaxNNkpWr8mMrZXncILOzr2vq1/hiXBCA03xyxlztxBc4khU8b0kCXQV4FH+WKK93kYXAJyOj3J2VxjffueH23sYR4lNxi+9T8uKeHKpBGIZIgETks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753686984; c=relaxed/simple;
	bh=Cnrf2DymUrXTTGJt7WrTFsT9FtK/XbiDM9JmDAYFq0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qxfwINoYLeIAwTGENiXGn5l9Rj9RXgbRb79Kh/kg6MVrsUy4oZ6ZKqjGEfKJLBMb/I+Npv1B5sbv8M26zyPE++L1d4UVYH861oX6g8Ov4VqJJMXkS++OhmAm3XUsCDeqO5yLeZL2hkwrAEa2oTBVHBH1O+N7xLY+yH5Y7Z7+yoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WUWsc8Rd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95CF3C4CEE7;
	Mon, 28 Jul 2025 07:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753686983;
	bh=Cnrf2DymUrXTTGJt7WrTFsT9FtK/XbiDM9JmDAYFq0k=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=WUWsc8RdzA8FcaXtYTbUHaJ3C9ReN/YVC7SPABjGDI+ohnF+WT3U4t8H0NcYg0IHM
	 MeOzkgS7l+QxmPjdjIOdJ7WO/tFq/SB2UWcuZbiKVlaY2KsJ91RmOr+Nt5anfWOLri
	 6K3NfaeTxCRReeuzECKEoto/XEwuB0Z/nngmpntT16EiM1eEtsd9SNx3aoGsCX48/A
	 04n5TfEy6aRzCtHM8UX8tpYW8uHObN//vMknP0eIdX6u/chBeZCyFYHuij60DfET1S
	 JyYh8cBozw4ci36bV3QHEWPsLxY+07vUhEmKtCjS8o7zhpAhzyjpdP/RwOHLET4v6+
	 kHg5ds8cHYGQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F66AC83F26;
	Mon, 28 Jul 2025 07:16:23 +0000 (UTC)
From: leqi via B4 Relay <devnull+leqi.qti.qualcomm.com@kernel.org>
Date: Mon, 28 Jul 2025 15:16:13 +0800
Subject: [PATCH v2] arm64: dts: qcom: Add initial audio support for
 Hamoa-IOT-EVK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-initial_audio_support_for_qualcomm_hamoa_iot_evk_board-v2-1-58aa30b60c7b@qti.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL0jh2gC/x3NywrCMBBA0V8pWRsowVTxV0SGaR52sMnEPEqh9
 N8NLs/m3kMUl8kV8RgOkd1GhTh2qMsgzILx7STZbqFGpceb0pIiVcIVsFliKC0lzhU8Z/g2XA2
 HAAsGRiCu4LYPzIzZSjOr6e6tNpO+ih5P2Xna/+Pn6zx/VJnmo4gAAAA=
X-Change-ID: 20250725-initial_audio_support_for_qualcomm_hamoa_iot_evk_board-cb268fd5c654
To: Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, leqi <leqi@qti.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753686982; l=7436;
 i=leqi@qti.qualcomm.com; s=20250723; h=from:subject:message-id;
 bh=eTu7cGdX/a79+bf8N9XCEA3GXv9hwb6h+ovVE0APbJs=;
 b=1bjLG8g0m84zrVc2qTxu0wyc3DhkaUAptPpkl/OdERjSq9LXmHAUtIeHLlHb3ZGNNtumhbus2
 XK5eqJHarm8BKNRXRJmpd3Raw4XS+5Bo0utThA8LmeFxPQoTBBmuX/M
X-Developer-Key: i=leqi@qti.qualcomm.com; a=ed25519;
 pk=zFi/rGGqo+G9Nw0VmaL7OqH7uu58kmZCRPPUqE9PH64=
X-Endpoint-Received: by B4 Relay for leqi@qti.qualcomm.com/20250723 with
 auth_id=470
X-Original-From: leqi <leqi@qti.qualcomm.com>
Reply-To: leqi@qti.qualcomm.com

From: leqi <leqi@qti.qualcomm.com>

This patch adds initial audio codec support for the Hamoa-IOT-EVK board,
including WCD9385 configuration, micbias voltage settings, GPIO reset,
and power supply bindings. It enables basic audio functionality for
further development. Basic test is good in Hamoa-IOT-EVK board.

Signed-off-by: leqi <leqi@qti.qualcomm.com>
---
Changes in v2:
- Updated author email address to leqi@qti.qualcomm.com.
- Clarified that audio is validated with this change.
- Link to v1: https://lore.kernel.org/all/20250723-initial_audio_support_for_qualcomm_hamoa_iot_evk_board-v1-1-816991701952@quicinc.com/
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 232 +++++++++++++++++++++++++++++
 1 file changed, 232 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 843f39c9d59286a9303a545411b2518d7649a059..91618e22e86c46c698b3639f60bc19314705b391 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -124,6 +124,94 @@ pmic_glink_ss2_con_sbu_in: endpoint {
 		};
 	};
 
+	sound {
+		compatible = "qcom,x1e80100-sndcard";
+		model = "X1E80100-EVK";
+		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
+				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
+				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
+				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
+				"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2",
+				"VA DMIC0", "MIC BIAS3",
+				"VA DMIC1", "MIC BIAS3",
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
+				sound-dai = <&left_woofer>, <&left_tweeter>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&right_woofer>, <&right_tweeter>,
+					    <&swr3 0>, <&lpass_wsa2macro 0>;
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
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -353,6 +441,33 @@ vreg_wwan: regulator-wwan {
 		regulator-boot-on;
 	};
 
+	wcd938x: audio-codec {
+		compatible = "qcom,wcd9385-codec";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wcd_default>;
+
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000
+							  500000 500000 500000 500000>;
+		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+		qcom,rx-device = <&wcd_rx>;
+		qcom,tx-device = <&wcd_tx>;
+
+		vdd-buck-supply = <&vreg_l15b_1p8>;
+		vdd-rxtx-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l15b_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob1>;
+
+		#sound-dai-cells = <1>;
+	};
+
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -572,6 +687,32 @@ retimer_ss1_con_sbu_out: endpoint {
 	};
 };
 
+&lpass_tlmm {
+	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
+		pins = "gpio13";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&vreg_l1b_1p8>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &pcie6a {
 	vddpe-3v3-supply = <&vreg_nvme>;
 };
@@ -645,6 +786,90 @@ &smb2360_2_eusb2_repeater {
 	vdd3-supply = <&vreg_l8b_3p0>;
 };
 
+&swr0 {
+	status = "okay";
+
+	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
+	pinctrl-names = "default";
+
+	/* WSA8845, Left Woofer */
+	left_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferLeft";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Left Tweeter */
+	left_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterLeft";
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
+&swr3 {
+	status = "okay";
+
+	pinctrl-0 = <&wsa2_swr_active>, <&spkr_23_sd_n_active>;
+	pinctrl-names = "default";
+
+	/* WSA8845, Right Woofer */
+	right_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferRight";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Right Tweeter */
+	right_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterRight";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
 &tlmm {
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";
@@ -733,6 +958,13 @@ usb2_pwr_3p3_reg_en: usb2-pwr-3p3-reg-en-state {
 		bias-disable;
 	};
 
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
 
 	wcn_bt_en: wcn-bt-en-state {
 		pins = "gpio116";

---
base-commit: 3b28da3245e8c43f3f5948513b4e859a3d0fa820
change-id: 20250725-initial_audio_support_for_qualcomm_hamoa_iot_evk_board-cb268fd5c654

Best regards,
-- 
leqi <leqi@qti.qualcomm.com>



