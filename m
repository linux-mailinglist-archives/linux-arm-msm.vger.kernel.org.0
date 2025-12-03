Return-Path: <linux-arm-msm+bounces-84184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 77469C9E890
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 10:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7160E4E17AE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 09:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81112E1EE5;
	Wed,  3 Dec 2025 09:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="dDCcHM4w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5DC2E0924
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754936; cv=none; b=Y3lUISlDpWfxz6gtd+XZDkzTWR82gRNSi5jY1tA0GFzKOR86AzMvNtXWuElHea1n9/7sqZ3GfXOQuHTx/dcbua1i+ixL9L9h2zfblwegW5+LoGykxIcKvOtUnTft+ApNg2OFzY1bqE3098+vQ6GbTLNxi9+tBz4A8Snye4HXWV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754936; c=relaxed/simple;
	bh=iFv0nrEhL9liJFh7BySvOpEt1Dj4+JVZAjNKbc0wTcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pYTmYOB+CZ5s3C0hE8sc/ha5NZeiyb/OyGo8isRRcwUY1hLf25YvSeRLYUCzIgGmor0+qWMhjtrTWvwnbdxbIPaHZ2vt/kq3u+FuX/bHj6+YiCAgUBmaDBZe0aJOkBCnKbo5sB9ct5qj0L0oL+uyG91/9DvdP/4mWBmB0QkJyHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=dDCcHM4w; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764754931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oBdZlhSgTwrx/IANe8eUJfLN+CwrcLL9TCtP3YpHQTg=;
	b=dDCcHM4wG/fhOASbAkFQ2RUO/bCXl5Egvj9xgYkrFsd8lilYbvtwFkwtirZ3dd/Vj8jKav
	XIRbh1GNEj/8lejLhfX5hSXDzIqNXu5UHJG3zbgUAeOeNfHAlMhAful1sE8tDlcI/lhQml
	KRM0waiQowjyZghdvHHDjVQU2LNgzKmh/z6UXm1joBQlRRdqaduylKi3tYaCFb43vZpZaC
	+kVawTOaLIdr84goFQb41FVZ5/eaESpOgjcxj0Many8S5FxV+B1M33g5EwC9xvOF3tfgya
	Kl2l4Rqqgyd3+JbwTQWF3W/6ZHh2nqhmFw4JiM1KV23jwUnMuvv/s00VRn2Sqg==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 03 Dec 2025 01:40:50 -0800
Subject: [PATCH v5 01/12] arm64: dts: qcom: sdm845-lg-common: Sort nodes
 and properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-judyln-dts-v5-1-80c1ffca8487@postmarketos.org>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
In-Reply-To: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764754921; l=5097;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=iFv0nrEhL9liJFh7BySvOpEt1Dj4+JVZAjNKbc0wTcw=;
 b=6Ury9rJoWZerIfMlOPecp8ZzzTgwoJmBSnEmJKKqbqIhFNFDeoZgAvhAOYIUy+zDuZKsetvMJ
 IbPfruB+a9cAnCa2IAOsIz5nJYZgDk0lTH7OHMqzb3yrP56+ZLTcne+
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


