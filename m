Return-Path: <linux-arm-msm+bounces-73417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9812B563E5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 01:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47726189DF31
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 00:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657CE2D3EE0;
	Sat, 13 Sep 2025 23:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Z1dvkwvY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8994C2D3A94
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Sep 2025 23:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757807877; cv=none; b=rUh9IPlCZaprbfcNEs3SLXORjdBPikuHlkuF/C3kQ0EOc4HI9KQPODTWbBmiTH2PzCVTtO5o0mYsqHNAgTCyjQqrFTSYvk4KIXdRVvmTWU75O30knv4GRbV96R14WGuMRXTym/yd5/4CTxaN9k1w7MFPfbXLye0P7ecX02RlJdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757807877; c=relaxed/simple;
	bh=BbYvSPH0AlONATJmTolAqSy+0SP0XpK9hp2GJ/xoHic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uGeANK/EiFqvIq1EzDFRyLsCtogyer0/W4/IsxntusHVFyXgETaO1imAXf39DLZ8I8Y+gpqCDrcmbAdZphTyP0wxjiOPfHUahdKepuQrzSXAGKr14Fepc2Ow/DoIYKBIbmpfxdA3Qy83bRZCv3BAmOTBTkH/3qsZKIWPfvx4e78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Z1dvkwvY; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1757807873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qK+3BLcRPpf/yh+RsNuUAD0vtLv38tRJZ31nrO2Ikn0=;
	b=Z1dvkwvYkdCgbtSM/53dIquFKo5rkrq2QM0Wj91NaMDEpC/WKJA70a2w6M+P+8x0C754jU
	cfzDlxENX3xViT3mYh6kzDyFsYNZixmWinBKfDU0MIx1DLn7zmkHkKGilnME/uLEq8JLLR
	OX3P7yau0Y7bNVtUVtLtpM3XYRFkqCenBHU9FoanWQMsB2wcsu/KItryeVt2V8BLAIln+3
	sb4mPth1vqCsYgsoqMVGW9517PC7kMGZ+jrd7kO9NsVxKJ+fmQSige6htY+9reqk6B7vB7
	Id/rcJ8LkVmghPaY0LZYDOisAdSwKNvEodcQ+h0maTEeDoezUUhITDUvQvbG/g==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sat, 13 Sep 2025 16:56:44 -0700
Subject: [PATCH 11/11] arm64: dts: qcom: sdm845-lg-common: Sort and cleanup
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-judyln-dts-v1-11-23b4b7790dce@postmarketos.org>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
In-Reply-To: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757807839; l=7280;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=BbYvSPH0AlONATJmTolAqSy+0SP0XpK9hp2GJ/xoHic=;
 b=U1pvUYsHZhGswY0HS1HmLHxrCcf67FvIZN1fcNv8HQCPhk+kcOAJC32nUurh25x5cAX8Vo90S
 GLrxEdqEaLrC4PDMGq2mE7slA27610nGfRWIUcKE408liaMwlmrnegD
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Fix style issues and sort alphabetically

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 226 ++++++++++++-------------
 1 file changed, 113 insertions(+), 113 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 1f4427194fddea238c1b97afd8494d08b006a40a..cbdd0c537a591a4c5365b0cb3a85d85e5c1269fa 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -45,8 +45,8 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		qseecom_mem: memory@b2000000 {
-			reg = <0 0xb2000000 0 0x1800000>;
+		ipa_fw_mem: memory@8c400000 {
+			reg = <0 0x8c400000 0 0x10000>;
 			no-map;
 		};
 
@@ -55,11 +55,6 @@ gpu_mem: memory@8c415000 {
 			no-map;
 		};
 
-		ipa_fw_mem: memory@8c400000 {
-			reg = <0 0x8c400000 0 0x10000>;
-			no-map;
-		};
-
 		adsp_mem: memory@8c500000 {
 			reg = <0 0x8c500000 0 0x1e00000>;
 			no-map;
@@ -100,9 +95,8 @@ spss_mem: memory@99000000 {
 			no-map;
 		};
 
-		/* Framebuffer region */
-		memory@9d400000 {
-			reg = <0x0 0x9d400000 0x0 0x2400000>;
+		qseecom_mem: memory@b2000000 {
+			reg = <0 0xb2000000 0 0x1800000>;
 			no-map;
 		};
 
@@ -465,11 +459,11 @@ vreg_s3c_0p6: smps3 {
 	};
 };
 
-&cdsp_pas {
+&adsp_pas {
 	status = "okay";
 };
 
-&gmu {
+&cdsp_pas {
 	status = "okay";
 };
 
@@ -481,6 +475,10 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
+&gmu {
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 
@@ -500,74 +498,88 @@ &mss_pil {
 	status = "okay";
 };
 
+&pm8998_gpios {
+	vol_up_pin_a: vol-up-active-state {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+	};
+};
+
 &pm8998_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
-	status = "okay";
-};
 
-&sdhc_2 {
 	status = "okay";
+};
 
-	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 
-	pinctrl-names = "default";
-	pinctrl-0 = <&sdc2_clk &sdc2_cmd &sdc2_data &sd_card_det_n>;
+&pmi8998_flash {
+	status = "okay";
 
-	vmmc-supply = <&vreg_l21a_2p95>;
-	vqmmc-supply = <&vddpx_2>;
+	led-0 {
+		label = "flash";
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>;
+		led-max-microamp = <850000>;
+		flash-max-microamp = <850000>;
+		flash-max-timeout-us = <500000>;
+	};
 };
 
-/*
- * UFS works partially and only with clk_ignore_unused.
- * Sometimes it crashes with I/O errors.
- */
-&ufs_mem_hc {
+&pmi8998_wled {
 	status = "okay";
-
-	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
-
-	vcc-supply = <&vreg_l20a_2p95>;
-	vcc-max-microamp = <600000>;
 };
 
-&ufs_mem_phy {
+&pmi8998_lpg {
 	status = "okay";
 
-	vdda-phy-supply = <&vdda_ufs1_core>;
-	vdda-pll-supply = <&vdda_ufs1_1p2>;
+	led@0 {
+		label = "blue";
+		reg = <3>;
+		color = <LED_COLOR_ID_BLUE>;
+		default-state = "off";
+	};
+
+	led@1 {
+		label = "green";
+		reg = <4>;
+		color = <LED_COLOR_ID_GREEN>;
+		default-state = "off";
+	};
+
+	led@2 {
+		label = "red";
+		reg = <5>;
+		color = <LED_COLOR_ID_RED>;
+		default-state = "off";
+	};
 };
 
-&usb_1 {
-	status = "okay";
+&qup_uart9_rx {
+	drive-strength = <2>;
+	bias-pull-up;
 };
 
-&usb_1_dwc3 {
-	/* TODO: these devices have usb id pin */
-	dr_mode = "peripheral";
+&qup_uart9_tx {
+	drive-strength = <2>;
+	bias-disable;
 };
 
-&usb_1_hsphy {
-	status = "okay";
+&sdhc_2 {
+	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 
-	vdd-supply = <&vdda_usb1_ss_core>;
-	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
-	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdc2_clk &sdc2_cmd &sdc2_data &sd_card_det_n>;
 
-	qcom,imp-res-offset-value = <8>;
-	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
-	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
-	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
-};
+	vmmc-supply = <&vreg_l21a_2p95>;
+	vqmmc-supply = <&vddpx_2>;
 
-&usb_1_qmpphy {
 	status = "okay";
-
-	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
-	vdda-pll-supply = <&vdda_usb1_ss_core>;
 };
 
-/* PINCTRL - additions to nodes defined in sdm845.dtsi */
-
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <81 4>;
 
@@ -604,91 +616,79 @@ sd_card_det_n: sd-card-det-n-state {
 	};
 };
 
-&pm8998_gpios {
-	vol_up_pin_a: vol-up-active-state {
-		pins = "gpio6";
-		function = "normal";
-		input-enable;
-		bias-pull-up;
-		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
-	};
+&qupv3_id_0 {
+	status = "okay";
 };
 
-&pmi8998_flash {
+&qupv3_id_1 {
 	status = "okay";
-
-	led-0 {
-		label = "flash";
-		function = LED_FUNCTION_FLASH;
-		color = <LED_COLOR_ID_WHITE>;
-		led-sources = <1>;
-		led-max-microamp = <850000>;
-		flash-max-microamp = <850000>;
-		flash-max-timeout-us = <500000>;
-	};
 };
 
-&pmi8998_lpg {
+&uart6 {
+	pinctrl-0 = <&qup_uart6_4pin>;
+
 	status = "okay";
 
-	led@0 {
-		label = "blue";
-		reg = <3>;
-		color = <LED_COLOR_ID_BLUE>;
-		default-state = "off";
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p3>;
+		max-speed = <3200000>;
 	};
+};
 
-	led@1 {
-		label = "green";
-		reg = <4>;
-		color = <LED_COLOR_ID_GREEN>;
-		default-state = "off";
-	};
+&uart9 {
+	label = "LS-UART1";
 
-	led@2 {
-		label = "red";
-		reg = <5>;
-		color = <LED_COLOR_ID_RED>;
-		default-state = "off";
-	};
+	status = "okay";
 };
 
-&qupv3_id_0 {
+/*
+ * UFS works partially and only with clk_ignore_unused.
+ * Sometimes it crashes with I/O errors.
+ */
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l20a_2p95>;
+	vcc-max-microamp = <600000>;
+
 	status = "okay";
 };
 
-&qupv3_id_1 {
+&ufs_mem_phy {
+	vdda-phy-supply = <&vdda_ufs1_core>;
+	vdda-pll-supply = <&vdda_ufs1_1p2>;
+
 	status = "okay";
 };
 
-&qup_uart9_rx {
-	drive-strength = <2>;
-	bias-pull-up;
+&usb_1 {
+	status = "okay";
 };
 
-&qup_uart9_tx {
-	drive-strength = <2>;
-	bias-disable;
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+	maximum-speed = "high-speed";
 };
 
-&uart6 {
-	pinctrl-0 = <&qup_uart6_4pin>;
-
-	status = "okay";
+&usb_1_hsphy {
+	vdd-supply = <&vdda_usb1_ss_core>;
+	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
+	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
 
-	bluetooth {
-		compatible = "qcom,wcn3990-bt";
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
+	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
 
-		vddio-supply = <&vreg_s4a_1p8>;
-		vddxo-supply = <&vreg_l7a_1p8>;
-		vddrf-supply = <&vreg_l17a_1p3>;
-		vddch0-supply = <&vreg_l25a_3p3>;
-		max-speed = <3200000>;
-	};
+	status = "okay";
 };
 
-&uart9 {
-	label = "LS-UART1";
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
+	vdda-pll-supply = <&vdda_usb1_ss_core>;
 
 	status = "okay";
 };

-- 
2.51.0


