Return-Path: <linux-arm-msm+bounces-73827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC50B7F307
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A491523699
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 01:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9871B21CA0D;
	Wed, 17 Sep 2025 01:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="bIYcNHo7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26434221D9E;
	Wed, 17 Sep 2025 01:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758071428; cv=none; b=Pfreymk+0F3/pk5i7wY3NfExkJ8QXUXqlik6PTP/vHZFNQKB0UYWqifZTsF8tCewOl9eqoV+lDZroMp8MhfUoN6Qf0tvxDU3s17j81ge2s1lnj57a4e9D/G+vcFtjqWZJ/BsJtPSiCz/+1ChFykkkvkDhAlMzy7WzMkJRmnqX9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758071428; c=relaxed/simple;
	bh=RIrSmiHxAiZjWjHDVSe2CqGVL6vdh0VRrQe32onNmBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NeoQwCxLHqCK9tcfXsHET8B6FRbRN1PdBl1qeMBlsh7vOc2G9DCYgsZrxE+Ovq/C2qWbrDr6cDIBbllT6jFBXiDH3WTTAUuAPgan1b2uB+4MwZiCWyM65AjqRHejEnCC30DvcMegZUVoNBpQKPnHqc54+/khkYBLeb0Uciscfqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=bIYcNHo7; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1758071424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kr1t0WXFmnE/nXYfua5DQkOEI6al2lTD75XTgTxHqT4=;
	b=bIYcNHo79futnf/Ou9PZfc9f+Lj+nzEImhbevmxN+EscOwHj/rmfvCKg6cM/+3kXTXf5/s
	W01d+k2p3tpcVw5voF2mckxB8NiqdW2zdEIo84UtCbjntJKYf9LGJE9QgFe9D7TLS5ZdvB
	vbTKJj5igQx0/f3nD1dPF6nJ0ul3FsULgj3MduMrn//ghXugEvi8/bkv+LWmUSYgLy9s6M
	u+u+g3zmHTGcJLgSEdDtriGR2iHcApTzif9FQldp6tfboC9exBw89wr8lkbXFYb9ODLhOE
	+5tTBlP/Y/X2GroOJjboqlAvcKZXTuBUn2s7al5iob5uEQU2IyHuoquwvAtfkw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 16 Sep 2025 18:09:47 -0700
Subject: [PATCH v2 01/13] arm64: dts: qcom: sdm845-lg-common: Sort nodes
 and properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-judyln-dts-v2-1-5e16e60263af@postmarketos.org>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
In-Reply-To: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758071415; l=4148;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=RIrSmiHxAiZjWjHDVSe2CqGVL6vdh0VRrQe32onNmBQ=;
 b=y6UmKutJLId9DjFLpuAFf7X39T9ZmHhhVjwDwkxr/STi9b6PVnbt814qFGGOf8RadLInbvP2a
 W2/G2ufwpxkD+y8ezaeP0Koqrh3iOMlNMNLK5a8H0Ly4Frlwk8iute9
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

in accordance with:
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 124 ++++++++++++-------------
 1 file changed, 62 insertions(+), 62 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 99dafc6716e76e25aad0755e6004dc952779689f..82d6543835324ed92300c4ed24c51f4b79321f99 100644
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
@@ -99,6 +94,11 @@ memory@9d400000 {
 			no-map;
 		};
 
+		qseecom_mem: memory@b2000000 {
+			reg = <0 0xb2000000 0 0x1800000>;
+			no-map;
+		};
+
 		/* rmtfs lower guard */
 		memory@f0800000 {
 			reg = <0 0xf0800000 0 0x1000>;
@@ -482,14 +482,22 @@ &mss_pil {
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
@@ -497,55 +505,8 @@ &sdhc_2 {
 
 	vmmc-supply = <&vreg_l21a_2p95>;
 	vqmmc-supply = <&vddpx_2>;
-};
-
-/*
- * UFS works partially and only with clk_ignore_unused.
- * Sometimes it crashes with I/O errors.
- */
-&ufs_mem_hc {
-	status = "okay";
-
-	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
-
-	vcc-supply = <&vreg_l20a_2p95>;
-	vcc-max-microamp = <600000>;
-};
-
-&ufs_mem_phy {
-	status = "okay";
-
-	vdda-phy-supply = <&vdda_ufs1_core>;
-	vdda-pll-supply = <&vdda_ufs1_1p2>;
-};
-
-&usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
-	/* TODO: these devices have usb id pin */
-	dr_mode = "peripheral";
-};
-
-&usb_1_hsphy {
-	status = "okay";
-
-	vdd-supply = <&vdda_usb1_ss_core>;
-	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
-	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
-
-	qcom,imp-res-offset-value = <8>;
-	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
-	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
-	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
-};
 
-&usb_1_qmpphy {
 	status = "okay";
-
-	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
-	vdda-pll-supply = <&vdda_usb1_ss_core>;
 };
 
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */
@@ -586,12 +547,51 @@ sd_card_det_n: sd-card-det-n-state {
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
+/*
+ * UFS works partially and only with clk_ignore_unused.
+ * Sometimes it crashes with I/O errors.
+ */
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l20a_2p95>;
+	vcc-max-microamp = <600000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vdda_ufs1_core>;
+	vdda-pll-supply = <&vdda_ufs1_1p2>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	/* TODO: these devices have usb id pin */
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vdda_usb1_ss_core>;
+	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
+	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
+
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
+	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
+	vdda-pll-supply = <&vdda_usb1_ss_core>;
+
+	status = "okay";
 };

-- 
2.51.0


