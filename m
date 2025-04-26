Return-Path: <linux-arm-msm+bounces-55803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FB1A9D96A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 10:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AB317AD910
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 08:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6CF24E4BF;
	Sat, 26 Apr 2025 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kY+47Ise"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2761598F4;
	Sat, 26 Apr 2025 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745656991; cv=none; b=O1qsEulf1GZQ7G0zxoQJt8s0A21Mf6GzNnqjjlVArbvc122JsjVg6SWaMvyjmldImMM82UO82/9VGh1Ad1dvAtA+ALA3pAqPKDSs92bxxEqLJP2u7OZbyHTH+0cqf6t3PdXh7rIgkYd+1rjNKXopvgQyBiQ4MnBL2YEWtzML5gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745656991; c=relaxed/simple;
	bh=UnMJbEMg5DZndLS2FbG6beUOW6596QZPQHMn37N+3ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jUX15NEqKGhVVZjsrZn6l8VDV+WyUWIXpLcM6Iqjs8KF7jrpBVJwX/jZ3ls+QogpIMKARDaAGIbbKzJjWgg1hoYj713hMYj6fxLpqQ773jzVn9STrGK1rZDYnYEAs7q2OnXtiqjymQFQlx1SCU/biVwJ1Vc6ilg5D0NRRkxJwMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kY+47Ise; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCD65C4CEE8;
	Sat, 26 Apr 2025 08:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745656990;
	bh=UnMJbEMg5DZndLS2FbG6beUOW6596QZPQHMn37N+3ww=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=kY+47IseXGHFhGsQqZJwRFrLsQtt6BtHZv+sSozAn/VqNXTEmaPEpv8thBS+XZjev
	 7YHCfY4x0KnSLESBeXT3f79PJM60Fk9sL7LNmsKMNwqGHWiux7sUMDYW3xZPMdzskI
	 ABCSG0JD/8aMyCYrN1XolVw7uFG13ODmPuE2klXe0RTHtSe0lKX/HhdKL6n2Vi+Wfb
	 MsLZtI3xVn8ruPtsIwlfYIKILEbhh+rryCBI04CpzmCooM0jFstzuRoJ//E4qbFuPT
	 g5iqyKY9h3dAefRP0PX1DR22nlTgXHlmFnFv4FmdA+eBKsTeENB+HJ8K1mTrpeAOas
	 zE1ASHIMOqECQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5910C369CB;
	Sat, 26 Apr 2025 08:43:10 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 26 Apr 2025 10:43:02 +0200
Subject: [PATCH] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 Bluetooth support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-slim7x-bt-v1-1-d68f961af886@oldschoolsolutions.biz>
X-B4-Tracking: v=1; b=H4sIAJWcDGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyMz3eKczFzzCt2kEl2zFANDQyNzI0vDFEMloPqCotS0zAqwWdGxtbU
 AsijX1lsAAAA=
X-Change-ID: 20250426-slim7x-bt-6d01127291d1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745656989; l=5031;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=fZY+VhA1blNrTgyvbyjiGPWrn1nJCjJyTv1dlv+p2lo=;
 b=mASlIzI9oKv+x14hqs8kCB4xEfP2AE+CdIqTyYQ74WGNTWYPs39FCch9NiJzygI4mocRt82hj
 OVAX98vC8DyBlLyNdQr0FWVrjY4HOEnSHbGwEDxEVD0eUFEypDpaLOa
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

To enable Bluetooth pwrseq appears to be required for the WCN7850.
Add the nodes from QCP.
Add uart14 for the BT interface.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
This patch adds the Bluetooth support for the WCN7850 card on this laptop.
Since WCN7850 is supposed to need pwrseq, also added this from the QCP.

This is also part of my tree [1] for the Yoga Slim 7X, although with an older
definition for the pwrseq and regulators.

[1] https://github.com/jglathe/linux_ms_dev_kit/blob/jg/ubuntu-qcom-x1e-6.15.0-rc3-jg-2/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts 
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 136 +++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 445d97d67d325853b7dcd2060523e7469ed4e6ea..a91d63508f65efea3786686f0f86a89a4355e0f1 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -18,6 +18,7 @@ / {
 
 	aliases {
 		serial0 = &uart21;
+		serial1 = &uart14;
 	};
 
 	chosen {
@@ -236,6 +237,101 @@ vph_pwr: regulator-vph-pwr {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
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
@@ -679,6 +775,16 @@ &pcie4_port0 {
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
 
@@ -940,6 +1046,36 @@ reset-n-pins {
 		};
 	};
 
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
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250426-slim7x-bt-6d01127291d1

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



