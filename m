Return-Path: <linux-arm-msm+bounces-62164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0086BAE5D14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10F393AE6A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B4824678F;
	Tue, 24 Jun 2025 06:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J98Eml5I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E945123C8A0;
	Tue, 24 Jun 2025 06:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747571; cv=none; b=XXMAieyIaPOs0WXJG5kPPETEfH5rg7Ny8Ma1SbunDf7jIbfsfvUHCwecTuL5Ei+hzgQF3NWapD1qmrpJwuc4tB2GxUw4jKFmHJ0dRwjepNxel9gZ8nqZJbbQ+1f4OSpDXteG4eSy0pOSqhksrfbz9lbqPjawho13GJJEToY1Dlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747571; c=relaxed/simple;
	bh=UnUzSUJIrXCgCEFB+1HDuw9p/td8y+NxwkpFeusr7pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dWn1tHznXoiQCgMYXMLaNgoGmCYeJelK+5FoW2TiGfkLECus356Gc7Q8dCPOKY4ENOVozSsbnyzu83JHfW2A6iTpzPOjZpdwd7jW8ESgKrCq5FKma77wcVjCSfz24aUveXphw/Q0lmHGF4DxnYtw4b+ZRJp1vUdAZepYxOyLR90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J98Eml5I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A05AC4CEE3;
	Tue, 24 Jun 2025 06:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750747569;
	bh=UnUzSUJIrXCgCEFB+1HDuw9p/td8y+NxwkpFeusr7pk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=J98Eml5Id7v/XGf/DNWxtddlaoVtMVrYjHP9zrQNJkk3NHg2s+ODYTH8r0vFvTKuk
	 B6+piG/wObTFR4xsG5xBXcOlmGsnGL9B7SQCV7vLL+MT+43+PMAMT87xrmJHCU89wC
	 pUzJJMsa9GR+ABQl2BYSCHe2hviq/H473LIaWRelj5ICg53ITd7j5F5F52TALlgRii
	 yEz+Yg2KwUmEBB8Sgvt4Tx5RwUQiOLlfPcGc1njm2To2VO1ZlDccTmOhYUxjXMrAt9
	 Bob9a6YVTu5+OYXapdFaheUT0plYLJhbTbc+yTnYKwiN8nESnexkx+++gC/wHEu+vM
	 AjHqgSLDkHISg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670DBC7EE2A;
	Tue, 24 Jun 2025 06:46:09 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Tue, 24 Jun 2025 08:46:00 +0200
Subject: [PATCH v3] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 Bluetooth support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-slim7x-bt-v3-1-7ada18058419@oldschoolsolutions.biz>
X-B4-Tracking: v=1; b=H4sIAKdJWmgC/3XOQQ6CMBCF4auYrq3pVBnAlfcwLoApMkmlpsUGJ
 dzdwkYXuvxfJl9mEsF4NkEcN5PwJnJg16fYbzei6ar+aiRTaqGVztRBowyWb/ko60EiKQCd6xI
 IRLq/e9PyuFrnS+qOw+D8c6UjLOsvJYIESVi0JULVFgWenKXQdM7Z4OxjSP+EXc0vsZBRfxgE9
 c3oxChqqCTMcjTlX2ae5zecCJbX9gAAAA==
X-Change-ID: 20250426-slim7x-bt-6d01127291d1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Anthony Ruhier <aruhier@mailbox.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750747567; l=5836;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=Rfj0lKIgurk3KPnFJFcUYsg9HfPliPrwZ5+zSKU+KJQ=;
 b=GEGejG5N8AKEh5vdIqdNmTzPUfM/Y8H/QQmm9C/AT36RKJM+PHBqUsaxfJckORGP1jNgeCGml
 GL1yC7izrMtDZoGxDn6H7dryTqzb/QVw6h8uZaWyMKM7Ypcbpwsxl4A
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

To enable Bluetooth pwrseq appears to be required for the WCN7850.
Add the nodes from QCP, add the TODO hint for vreg_wcn_0p95 and
vreg_wcn_1p9
Add uart14 for the BT interface.

Tested-by: Anthony Ruhier <aruhier@mailbox.org>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
This patch adds the Bluetooth support for the WCN7850 card on this laptop.
Since WCN7850 is supposed to need pwrseq, also added this from the QCP.

This is also part of my tree [1] for the Yoga Slim 7X.
definition for the pwrseq and regulators.

[1] https://github.com/jglathe/linux_ms_dev_kit/blob/jg/ubuntu-qcom-x1e-6.15.0-jg-6/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts 
---
Changes in v3:
- pwrseq: add the TODO hint for vreg_wcn_0p95 and vreg_wcn_1p9 (Stephan)
- Link to v2: https://lore.kernel.org/r/20250610-slim7x-bt-v2-1-0dcd9d6576e9@oldschoolsolutions.biz

Changes in v2:
- rebased to next-20250610
- added tested-by from Anthony Ruhier
- Link to v1: https://lore.kernel.org/r/20250426-slim7x-bt-v1-1-d68f961af886@oldschoolsolutions.biz
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 143 +++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index dad0f11e8e8583df6fd8aeec5be2af86739d85fb..d02f8d4f7baf0a8e7c1bb95cd4a84ffe24ba8ef1 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -18,6 +18,7 @@ / {
 
 	aliases {
 		serial0 = &uart21;
+		serial1 = &uart14;
 	};
 
 	chosen {
@@ -404,6 +405,107 @@ vph_pwr: regulator-vph-pwr {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wcn_sw_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	/*
+	 * TODO: These two regulators are actually part of the removable M.2
+	 * card and not the CRD mainboard. Need to describe this differently.
+	 * Functionally it works correctly, because all we need to do is to
+	 * turn on the actual 3.3V supply above.
+	 */
+	vreg_wcn_0p95: regulator-wcn-0p95 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	vreg_wcn_1p9: regulator-wcn-1p9 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_1P9";
+		regulator-min-microvolt = <1900000>;
+		regulator-max-microvolt = <1900000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		vdd-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_l15b_1p8>;
+		vddaon-supply = <&vreg_wcn_0p95>;
+		vdddig-supply = <&vreg_wcn_0p95>;
+		vddrfa1p2-supply = <&vreg_wcn_1p9>;
+		vddrfa1p8-supply = <&vreg_wcn_1p9>;
+
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -1045,6 +1147,16 @@ &pcie4_port0 {
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
 	};
 };
 
@@ -1403,6 +1515,37 @@ usb2_pwr_3p3_reg_en: usb2-pwr-3p3-reg-en-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio214";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
 };
 
 &uart21 {

---
base-commit: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
change-id: 20250426-slim7x-bt-6d01127291d1

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



