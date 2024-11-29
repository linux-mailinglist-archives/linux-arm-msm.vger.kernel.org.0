Return-Path: <linux-arm-msm+bounces-39624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 923959DEB9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 18:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50AEC281C8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 17:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A684519FA9D;
	Fri, 29 Nov 2024 17:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFSiGx1/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE88130AC8;
	Fri, 29 Nov 2024 17:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732900841; cv=none; b=dD/opZT+FlLEW7cJPMITFOozzjjo2+DzS1A9eIl6/KG209dOL7V1qHsmEJxAZ/6L6IMwJFiEP7Tkfz+vB2HCLzawy0DwIajsZDTAiBoor+O0y8s0M5AEZOIy6WJsORMyRyrGbQQrpfe7N6cwORZqsRtvk7+7QeQS30p7ovbW+UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732900841; c=relaxed/simple;
	bh=j7TwsQtzjU9RG7UB+z04vsgocGWjEYpG62w+rnWYrX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lBDkWc2sSx+zIK+rkXdtDxqApvDeXi9p8qwhqfVAGIX/FF5s2UHc6mUopmnWAI8dIptwE4XUIPMymIaMMj3RupVZ2C2sB/b6gM9IiSlXRbe1qKCvebBdqEUAS7OvvnABQdW9x0LXL//skaUy3rRegEc8nDEUDiypsvwds2YeB8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFSiGx1/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C715AC4CECF;
	Fri, 29 Nov 2024 17:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732900841;
	bh=j7TwsQtzjU9RG7UB+z04vsgocGWjEYpG62w+rnWYrX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZFSiGx1/3dw+CiZKQoeZ4/sN4Uk9lASOX7MDw/qQ1JeTFqcTnjXajCJHFwYbizetr
	 sRTlBwUiYDRg9PNp4qjI5GFqRa8I3D2Y+mlUTNi8oWxcJEFqaiF/csVSzIBQbpcpT7
	 sV9Q+YbeEON5ml21NFddhohkikFW9g+L9k78NH+tvbFpZTkxyomzcgQyiJsIAhp6n+
	 l+AfjN3GtyLyXXuxMi6wMNTg6mSwJn9XLSdNDqcNGBqQlbIBgdvGsZVUKhPduxibLW
	 6geRjOK3gYCCUYVoRg9KKc/u09EuSDJRRtIOwk8SS4med+5j4l+NDRbattAHsis2Vd
	 E14uv5KHGaocQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 29 Nov 2024 18:20:25 +0100
Subject: [PATCH v2 1/3] arm64: dts: qcom: x1e80100-romulus: Configure audio
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-topic-sl7_feat2-v2-1-fb6cf5660cfc@oss.qualcomm.com>
References: <20241129-topic-sl7_feat2-v2-0-fb6cf5660cfc@oss.qualcomm.com>
In-Reply-To: <20241129-topic-sl7_feat2-v2-0-fb6cf5660cfc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732900833; l=5516;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=1jIp7bbr97dLJl4qxWC+s79tp/d0FX+6dgZTzezGxIs=;
 b=krZwtvBSOWH2ItIBJIUbJsl+CkSDD0eQs8Gf4p7ayh3IbUl6Bu2IRIvPpdBIdjIaFnJQ5BESQ
 l0TesC+evpfDbvD1kYvb3IhMt+RG4gpKscT2DHWIRzzszX8lYNgYT8b
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
index 6835fdeef3aec10206e8b2839d23e4f3494afe1e..146e3700a3a34954c1653cbd8e148aeca481db6a 100644
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
+				sound-dai = <&wcd938x 1>, <&swr2 1>, <&lpass_txmacro 0>;
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
+				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
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
2.47.1


