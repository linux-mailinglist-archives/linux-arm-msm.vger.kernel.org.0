Return-Path: <linux-arm-msm+bounces-46787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0878BA25D76
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 162F5164505
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABEFB209F3F;
	Mon,  3 Feb 2025 14:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHfEiJ5X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8083D209F3B;
	Mon,  3 Feb 2025 14:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593835; cv=none; b=egCMFdQEJSTNzfJJRt0TdgUN2CVQys6XfCFIHRbPuexwvUC9tQG85FcWgOLi65Nu3EAHotHiWw5R0zFYvu9cpOuKwn3H9f8RAP1R4/d6FQCnl6As6GHTVGq4+DGYKg6YvZb2XWRkpMpf+V7fwEjipTw0Vk+tLwOOi1o6On52QJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593835; c=relaxed/simple;
	bh=TICPyOA+VFvMgZNCupGTPPzpxceSOSEVeWOP5X7SSPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PM/OY1esHt5SPh1cz3rdqW1C2mkzfPcOw11h48T+oU82/SAaIPIMJnsGjsRA7JP7mcGtiW/zxVBtj/D5K0maG/BbgG5HcrVpgNDntCd6wQ2zxODt79ufKTMJ3f7aqE6G+ad2u+7tN6EPFSBaz9amSlgaGAGDs0RkLo0+Aw0FDAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHfEiJ5X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD4AC4CED2;
	Mon,  3 Feb 2025 14:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738593833;
	bh=TICPyOA+VFvMgZNCupGTPPzpxceSOSEVeWOP5X7SSPI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fHfEiJ5Xi8qGxhOUIGb2jW/iBOdDisJInz1Emw+T8gzJXgyGBrFdKaPTRlhg1WKC9
	 j5GLqeLwPsz7SgeM9XV6StRlMTLcz99KsCEx2v9hnJePCsdNu2okzylydQhUftmfNO
	 IO9BZtYyNtz1lnpl8CofyJXNRwfPxL2JkkZMU6XA9c6bsa+rL/2W9fGCVNSVGOPX01
	 6FQQHM+N5srdPcfrCeQOE7zvf0fnSc+ZfMfPH3tAj8K3OoN4MdfDE3BimgMgugXHl8
	 h3e3AWb93k9PA+2XOH46tnOGUjpkP6F6b8TZazrTOxcfzI2iozt7suVma2D6+AKgnk
	 Cc0guhP4nfT3Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 03 Feb 2025 15:43:24 +0100
Subject: [PATCH v2 5/6] arm64: dts: qcom: Commonize X1 CRD DTSI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-topic-x1p4_dts-v2-5-72cd4cdc767b@oss.qualcomm.com>
References: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
In-Reply-To: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738593805; l=31327;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ugSWKcmEF1deEIKFODkXmpmclkeVEgs8fPWA54AFlmk=;
 b=862MKsg9ElbaZ1UCVDuD/d1X8tgIjlSXarh0tbOSddnC7cOR35OzyyzzadQDHDdkUWYNXzhDa
 c1wf9T5XMM9CxFJpSvQ6i+pjHBb4aJbNJetDJFYfz1etXb1QFK89OGt
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Certain X1 SKUs vary very noticeably, but the CRDs based on them don't.

Commonize the existing X1E80100 DTSI to allow reuse.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../dts/qcom/{x1e80100-crd.dts => x1-crd.dtsi}     |    7 -
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 1270 +-------------------
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |    2 +-
 3 files changed, 4 insertions(+), 1275 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
similarity index 99%
copy from arch/arm64/boot/dts/qcom/x1e80100-crd.dts
copy to arch/arm64/boot/dts/qcom/x1-crd.dtsi
index ff5b3472fafd35a2a3754c11ab0b9b9e8ea5a4b4..296b41409ad1797d1da837c2674d6048932ff8ee 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -3,15 +3,12 @@
  * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
-/dts-v1/;
-
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
-#include "x1e80100.dtsi"
 #include "x1e80100-pmics.dtsi"
 
 / {
@@ -691,10 +688,6 @@ vreg_l3j_0p8: ldo3 {
 
 &gpu {
 	status = "okay";
-
-	zap-shader {
-		firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
-	};
 };
 
 &i2c0 {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index ff5b3472fafd35a2a3754c11ab0b9b9e8ea5a4b4..976b8e44b5763b2d6c0f4786bf5809fee29dcecc 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -5,1278 +5,14 @@
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/gpio-keys.h>
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
-#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-
 #include "x1e80100.dtsi"
-#include "x1e80100-pmics.dtsi"
+#include "x1-crd.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. X1E80100 CRD";
 	compatible = "qcom,x1e80100-crd", "qcom,x1e80100";
-
-	aliases {
-		serial0 = &uart21;
-	};
-
-	wcd938x: audio-codec {
-		compatible = "qcom,wcd9385-codec";
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&wcd_default>;
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
-	chosen {
-		stdout-path = "serial0:115200n8";
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
-		#address-cells = <1>;
-		#size-cells = <0>;
-		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
-				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
-				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
-
-		/* Left-side rear port */
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
-		/* Left-side front port */
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
-
-		/* Right-side port */
-		connector@2 {
-			compatible = "usb-c-connector";
-			reg = <2>;
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
-					pmic_glink_ss2_hs_in: endpoint {
-						remote-endpoint = <&usb_1_ss2_dwc3_hs>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					pmic_glink_ss2_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss2_qmpphy_out>;
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
-	sound {
-		compatible = "qcom,x1e80100-sndcard";
-		model = "X1E80100-CRD";
-		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
-				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
-				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
-				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
-				"IN1_HPHL", "HPHL_OUT",
-				"IN2_HPHR", "HPHR_OUT",
-				"AMIC2", "MIC BIAS2",
-				"VA DMIC0", "MIC BIAS3",
-				"VA DMIC1", "MIC BIAS3",
-				"VA DMIC2", "MIC BIAS1",
-				"VA DMIC3", "MIC BIAS1",
-				"VA DMIC0", "VA MIC BIAS3",
-				"VA DMIC1", "VA MIC BIAS3",
-				"VA DMIC2", "VA MIC BIAS1",
-				"VA DMIC3", "VA MIC BIAS1",
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
-				sound-dai = <&left_woofer>, <&left_tweeter>,
-					    <&swr0 0>, <&lpass_wsamacro 0>,
-					    <&right_woofer>, <&right_tweeter>,
-					    <&swr3 0>, <&lpass_wsa2macro 0>;
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
-	vreg_misc_3p3: regulator-misc-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_MISC_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&pm8550ve_8_gpios 6 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&misc_3p3_reg_en>;
-
-		regulator-boot-on;
-		regulator-always-on;
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
-		pinctrl-names = "default";
-		pinctrl-0 = <&nvme_reg_en>;
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
-	vreg_wwan: regulator-wwan {
-		compatible = "regulator-fixed";
-
-		regulator-name = "SDX_VPH_PWR";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 221 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&wwan_sw_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
 };
 
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
-			regulator-max-microvolt = <3100000>;
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
-		vreg_l5b_3p0: ldo5 {
-			regulator-name = "vreg_l5b_3p0";
-			regulator-min-microvolt = <3000000>;
-			regulator-max-microvolt = <3000000>;
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
-		vreg_l7b_2p8: ldo7 {
-			regulator-name = "vreg_l7b_2p8";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
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
-			regulator-max-microvolt = <3100000>;
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
-		vreg_l16b_2p9: ldo16 {
-			regulator-name = "vreg_l16b_2p9";
-			regulator-min-microvolt = <2912000>;
-			regulator-max-microvolt = <2912000>;
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
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3c_0p8: ldo3 {
-			regulator-name = "vreg_l3c_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
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
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2d_0p9: ldo2 {
-			regulator-name = "vreg_l2d_0p9";
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <920000>;
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
-			regulator-max-microvolt = <920000>;
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
-
-		vreg_l1f_1p0: ldo1 {
-			regulator-name = "vreg_l1f_1p0";
-			regulator-min-microvolt = <1024000>;
-			regulator-max-microvolt = <1024000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f_1p0: ldo2 {
-			regulator-name = "vreg_l2f_1p0";
-			regulator-min-microvolt = <1024000>;
-			regulator-max-microvolt = <1024000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3f_1p0: ldo3 {
-			regulator-name = "vreg_l3f_1p0";
-			regulator-min-microvolt = <1024000>;
-			regulator-max-microvolt = <1024000>;
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
-		vreg_s1i_0p9: smps1 {
-			regulator-name = "vreg_s1i_0p9";
-			regulator-min-microvolt = <900000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s2i_1p0: smps2 {
-			regulator-name = "vreg_s2i_1p0";
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1100000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
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
-			regulator-max-microvolt = <920000>;
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
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2j_1p2: ldo2 {
-			regulator-name = "vreg_l2j_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3j_0p8: ldo3 {
-			regulator-name = "vreg_l3j_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-};
-
-&gpu {
-	status = "okay";
-
-	zap-shader {
-		firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
-	};
-};
-
-&i2c0 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	touchpad@15 {
-		compatible = "hid-over-i2c";
-		reg = <0x15>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l12b_1p2>;
-
-		pinctrl-0 = <&tpad_default>;
-		pinctrl-names = "default";
-
-		wakeup-source;
-	};
-
-	keyboard@3a {
-		compatible = "hid-over-i2c";
-		reg = <0x3a>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l12b_1p2>;
-
-		pinctrl-0 = <&kybd_default>;
-		pinctrl-names = "default";
-
-		wakeup-source;
-	};
-};
-
-&i2c8 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	touchscreen@10 {
-		compatible = "hid-over-i2c";
-		reg = <0x10>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_1p8>;
-
-		pinctrl-0 = <&ts0_default>;
-		pinctrl-names = "default";
-	};
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
-
-	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
-		pins = "gpio13";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-		output-low;
-	};
-};
-
-&lpass_vamacro {
-	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
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
-			compatible = "samsung,atna45af01", "samsung,atna33xc20";
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
-&pcie5 {
-	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-
-	vddpe-3v3-supply = <&vreg_wwan>;
-
-	pinctrl-0 = <&pcie5_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie5_phy {
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
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie6a_default>;
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
-&pm8550ve_8_gpios {
-	misc_3p3_reg_en: misc-3p3-reg-en-state {
-		pins = "gpio6";
-		function = "normal";
-		bias-disable;
-		input-disable;
-		output-enable;
-		drive-push-pull;
-		power-source = <1>; /* 1.8 V */
-		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
-	};
-};
-
-&pmc8380_3_gpios {
-	edp_bl_en: edp-bl-en-state {
-		pins = "gpio4";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
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
-	firmware-name = "qcom/x1e80100/adsp.mbn",
-			"qcom/x1e80100/adsp_dtb.mbn";
-
-	status = "okay";
-};
-
-&remoteproc_cdsp {
-	firmware-name = "qcom/x1e80100/cdsp.mbn",
-			"qcom/x1e80100/cdsp_dtb.mbn";
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
-&smb2360_2 {
-	status = "okay";
-};
-
-&smb2360_2_eusb2_repeater {
-	vdd18-supply = <&vreg_l3d_1p8>;
-	vdd3-supply = <&vreg_l8b_3p0>;
-};
-
-&swr0 {
-	status = "okay";
-
-	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
-	pinctrl-names = "default";
-
-	/* WSA8845, Left Woofer */
-	left_woofer: speaker@0,0 {
-		compatible = "sdw20217020400";
-		reg = <0 0>;
-		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "WooferLeft";
-		vdd-1p8-supply = <&vreg_l15b_1p8>;
-		vdd-io-supply = <&vreg_l12b_1p2>;
-		qcom,port-mapping = <1 2 3 7 10 13>;
-	};
-
-	/* WSA8845, Left Tweeter */
-	left_tweeter: speaker@0,1 {
-		compatible = "sdw20217020400";
-		reg = <0 1>;
-		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "TweeterLeft";
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
-&swr3 {
-	status = "okay";
-
-	pinctrl-0 = <&wsa2_swr_active>, <&spkr_23_sd_n_active>;
-	pinctrl-names = "default";
-
-	/* WSA8845, Right Woofer */
-	right_woofer: speaker@0,0 {
-		compatible = "sdw20217020400";
-		reg = <0 0>;
-		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "WooferRight";
-		vdd-1p8-supply = <&vreg_l15b_1p8>;
-		vdd-io-supply = <&vreg_l12b_1p2>;
-		qcom,port-mapping = <1 2 3 7 10 13>;
-	};
-
-	/* WSA8845, Right Tweeter */
-	right_tweeter: speaker@0,1 {
-		compatible = "sdw20217020400";
-		reg = <0 1>;
-		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "TweeterRight";
-		vdd-1p8-supply = <&vreg_l15b_1p8>;
-		vdd-io-supply = <&vreg_l12b_1p2>;
-		qcom,port-mapping = <4 5 6 7 11 13>;
-	};
-};
-
-&tlmm {
-	gpio-reserved-ranges = <34 2>, /* Unused */
-			       <44 4>, /* SPI (TPM) */
-			       <238 1>; /* UFS Reset */
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
-	kybd_default: kybd-default-state {
-		pins = "gpio67";
-		function = "gpio";
-		bias-disable;
-	};
-
-	nvme_reg_en: nvme-reg-en-state {
-		pins = "gpio18";
-		function = "gpio";
-		drive-strength = <2>;
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
-	pcie5_default: pcie5-default-state {
-		clkreq-n-pins {
-			pins = "gpio150";
-			function = "pcie5_clk";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio149";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio151";
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
-	tpad_default: tpad-default-state {
-		pins = "gpio3";
-		function = "gpio";
-		bias-disable;
-	};
-
-	ts0_default: ts0-default-state {
-		int-n-pins {
-			pins = "gpio51";
-			function = "gpio";
-			bias-disable;
-		};
-
-		reset-n-pins {
-			pins = "gpio48";
-			function = "gpio";
-			output-high;
-			drive-strength = <16>;
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
-
-	wwan_sw_en: wwan-sw-en-state {
-		pins = "gpio221";
-		function = "gpio";
-		drive-strength = <4>;
-		bias-disable;
-	};
-};
-
-&uart21 {
-	compatible = "qcom,geni-debug-uart";
-	status = "okay";
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
-&usb_1_ss2_hsphy {
-	vdd-supply = <&vreg_l3j_0p8>;
-	vdda12-supply = <&vreg_l2j_1p2>;
-
-	phys = <&smb2360_2_eusb2_repeater>;
-
-	status = "okay";
-};
-
-&usb_1_ss2_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
-
-	status = "okay";
-};
-
-&usb_1_ss2 {
-	status = "okay";
-};
-
-&usb_1_ss2_dwc3 {
-	dr_mode = "host";
-};
-
-&usb_1_ss2_dwc3_hs {
-	remote-endpoint = <&pmic_glink_ss2_hs_in>;
-};
-
-&usb_1_ss2_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss2_ss_in>;
+&gpu_zap_shader {
+	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
 };
diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a244cbb84aecc23ce11414c41f2e5d0905f455ee..9d14d53180734ed3eda2ed70b54e9ee8acbcd892 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3751,7 +3751,7 @@ gpu: gpu@3d00000 {
 
 			status = "disabled";
 
-			zap-shader {
+			gpu_zap_shader: zap-shader {
 				memory-region = <&gpu_microcode_mem>;
 			};
 

-- 
2.48.1


