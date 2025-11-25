Return-Path: <linux-arm-msm+bounces-83189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47815C83E75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDA723AB72D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB752D2391;
	Tue, 25 Nov 2025 08:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="QaTiHnsy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE722D8792
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764058385; cv=none; b=NPraS4j9vCkm75njgPxdvX0SAbpRQyp26CqG+fiGe6FJWGaGbTcZ+h5W4lu5gsE9bl1MiWeLgQRZzOSSCvgcgk4rx5gIqBtMajcMt9nCE27H/qujYwkn8arPU7FVl/RtjyLdZ+hqj5PFd1hXILo33YWbI7DuzWRXAuL+XpCvFJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764058385; c=relaxed/simple;
	bh=iFv0nrEhL9liJFh7BySvOpEt1Dj4+JVZAjNKbc0wTcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mD2k2pCcZKzTrm5jtbut3uvvsX/Gt5UzQoqQcoy1vvAYp77jykE4smD3kvZmjRLByzKY0PkB76xjQQISzLJfApUW1TdpGmoFZCrwU5bHuErY0aJCnVkiqtAiVqF36k1dCdNbLUwcpHOarYNv8lBEubUlQbHCRcGXPFE4V/k14eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=QaTiHnsy; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764058380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oBdZlhSgTwrx/IANe8eUJfLN+CwrcLL9TCtP3YpHQTg=;
	b=QaTiHnsyefuVMMn0t7C/U5zwovNyWQxUTOa3pIWXhPnfMJS3QQSg475SlHu0LhXmwkQUlW
	PBTZSKAzeuWZbV7M/31tE4eMQkGUeeS0oAlw9ZlU4/4CnoxxV28E2sNRc6E38GcR7wIlOy
	tkMUDHysHPtSr8bRA0L1GOUv/bIvVrl1Ky++NpxzC+yA4QOgt/tNEbyCv409X+ek3VV4Bm
	zRONdclvEkf4MqwvVJPNLMAyWV6NIyhfkFVlgmJLjaVXxWLkR5rEMJeMQ+oJvEZwoCZeqC
	DL/oMEVLwqNXH8qqWoIVZwNrPACjC/RxQNgWsppQT+jkHWQo6C9hswG2cNyGwg==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 25 Nov 2025 00:12:31 -0800
Subject: [PATCH v4 01/12] arm64: dts: qcom: sdm845-lg-common: Sort nodes
 and properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-judyln-dts-v4-1-a5a60500b267@postmarketos.org>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
In-Reply-To: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764058372; l=5097;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=iFv0nrEhL9liJFh7BySvOpEt1Dj4+JVZAjNKbc0wTcw=;
 b=TilBRE6HCy5783KFwUseOLGPC4Y1qFWFvhckS+c137KJ6Aqwcb44GKpSJPkyEc98gAZMrivqS
 VjhWX7fH4+LDIYrZkRmB5ybFDw7sw0xN4lmSl5FSRdmMCvGT6Y8Ps9M
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Improve adherance to style guidelines below:
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 144 ++++++++++++++-----------
 1 file changed, 82 insertions(+), 62 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 0ee2f4b99fbd..b8ab64a8de1c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -38,11 +38,6 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		qseecom_mem: memory@b2000000 {
-			reg = <0 0xb2000000 0 0x1800000>;
-			no-map;
-		};
-
 		gpu_mem: memory@8c415000 {
 			reg = <0 0x8c415000 0 0x2000>;
 			no-map;
@@ -99,7 +94,12 @@ memory@9d400000 {
 			no-map;
 		};
 
-		rmtfs_mem: rmtfs-region@f0800000 {
+		qseecom_mem: memory@b2000000 {
+			reg = <0 0xb2000000 0 0x1800000>;
+			no-map;
+		};
+
+		rmtfs_mem: memory@f0801000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0 0xf0800000 0 0x202000>;
 			qcom,use-guard-pages;
@@ -467,14 +467,22 @@ &mss_pil {
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
 	status = "okay";
 };
 
 &sdhc_2 {
-	status = "okay";
-
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
@@ -482,26 +490,70 @@ &sdhc_2 {
 
 	vmmc-supply = <&vreg_l21a_2p95>;
 	vqmmc-supply = <&vddpx_2>;
+
+	status = "okay";
 };
 
-/*
- * UFS works partially and only with clk_ignore_unused.
- * Sometimes it crashes with I/O errors.
- */
-&ufs_mem_hc {
+/* PINCTRL - additions to nodes defined in sdm845.dtsi */
+
+&tlmm {
+	gpio-reserved-ranges = <28 4>, <81 4>;
+
+	sdc2_clk: sdc2-clk-state {
+		pins = "sdc2_clk";
+		bias-disable;
+
+		/*
+		 * It seems that mmc_test reports errors if drive
+		 * strength is not 16 on clk, cmd, and data pins.
+		 *
+		 * TODO: copy-pasted from mtp, try other values
+		 * on these devices.
+		 */
+		drive-strength = <16>;
+	};
+
+	sdc2_cmd: sdc2-cmd-state {
+		pins = "sdc2_cmd";
+		bias-pull-up;
+		drive-strength = <16>;
+	};
+
+	sdc2_data: sdc2-data-state {
+		pins = "sdc2_data";
+		bias-pull-up;
+		drive-strength = <16>;
+	};
+
+	sd_card_det_n: sd-card-det-n-state {
+		pins = "gpio126";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
+&qupv3_id_0 {
 	status = "okay";
+};
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
 	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
 
 	vcc-supply = <&vreg_l20a_2p95>;
 	vcc-max-microamp = <600000>;
-};
 
-&ufs_mem_phy {
 	status = "okay";
+};
 
+&ufs_mem_phy {
 	vdda-phy-supply = <&vdda_ufs1_core>;
 	vdda-pll-supply = <&vdda_ufs1_1p2>;
+
+	status = "okay";
 };
 
 &usb_1 {
@@ -514,8 +566,6 @@ &usb_1_dwc3 {
 };
 
 &usb_1_hsphy {
-	status = "okay";
-
 	vdd-supply = <&vdda_usb1_ss_core>;
 	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
 	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
@@ -524,59 +574,29 @@ &usb_1_hsphy {
 	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
 	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
 	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
-};
 
-&usb_1_qmpphy {
 	status = "okay";
+};
 
+&usb_1_qmpphy {
 	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
 	vdda-pll-supply = <&vdda_usb1_ss_core>;
-};
-
-/* PINCTRL - additions to nodes defined in sdm845.dtsi */
-
-&tlmm {
-	gpio-reserved-ranges = <28 4>, <81 4>;
-
-	sdc2_clk: sdc2-clk-state {
-		pins = "sdc2_clk";
-		bias-disable;
 
-		/*
-		 * It seems that mmc_test reports errors if drive
-		 * strength is not 16 on clk, cmd, and data pins.
-		 *
-		 * TODO: copy-pasted from mtp, try other values
-		 * on these devices.
-		 */
-		drive-strength = <16>;
-	};
+	status = "okay";
+};
 
-	sdc2_cmd: sdc2-cmd-state {
-		pins = "sdc2_cmd";
-		bias-pull-up;
-		drive-strength = <16>;
-	};
+&venus {
+	status = "okay";
+};
 
-	sdc2_data: sdc2-data-state {
-		pins = "sdc2_data";
-		bias-pull-up;
-		drive-strength = <16>;
-	};
+&wifi {
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
 
-	sd_card_det_n: sd-card-det-n-state {
-		pins = "gpio126";
-		function = "gpio";
-		bias-pull-up;
-	};
-};
+	qcom,snoc-host-cap-skip-quirk;
 
-&pm8998_gpios {
-	vol_up_pin_a: vol-up-active-state {
-		pins = "gpio6";
-		function = "normal";
-		input-enable;
-		bias-pull-up;
-		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
-	};
+	status = "okay";
 };

-- 
2.52.0


