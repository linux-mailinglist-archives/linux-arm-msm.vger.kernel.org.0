Return-Path: <linux-arm-msm+bounces-72698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 685CDB4A52B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 10:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CF371883260
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 08:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C4D23C4FD;
	Tue,  9 Sep 2025 08:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRJO40k8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B92227563;
	Tue,  9 Sep 2025 08:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757406252; cv=none; b=seunkeV7JNYZN+bRP2mz8PUAulD99v/3ZSYrvg6GSb8GpZNQQFLvttFimllRkrpBt2bSYWGBNr8J4gvUJ+f4tqkfHcpUmM2iOXglbE1OdUewMRzb9aLZVQ6MLTsF9qLDGxk/Q4+Jo7V1d8s7XYccV3VV6nb30lxEgJxRFZodDH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757406252; c=relaxed/simple;
	bh=x3McTo5jYjLNT6/OPHSgnpYVmTjmnzl8MlRp2mhAlBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hyN2Arjgm8kbTmkIUmR22WvRkIdYLBhhGgtpToyRJKK8Vgb6AP39HipDbnAJMwzlWMv+udaPXMAdK9eVnqqm6telZgmpzLPjnXgBxKEimNGoDOP+qX8l2g2y8Y9ShUHXzjLC/nWchlyRR3laicuBGStRIL4oxPNnBBW4JKY8Dt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRJO40k8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144F1C4CEF4;
	Tue,  9 Sep 2025 08:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757406252;
	bh=x3McTo5jYjLNT6/OPHSgnpYVmTjmnzl8MlRp2mhAlBQ=;
	h=From:Date:Subject:To:Cc:From;
	b=GRJO40k8HIKYN3EpoofalVL1+ItUJ+bpn81Apv/Kuc505sKAwH6RN4O4zr0Q4GRtt
	 dbbdf82kYMuOVLz1tzBdassdxO/vXPeNIY1p5T5x1SWSEvIkmBGOTJ27DLXahYahDH
	 ubcJDWKdg9rW+EUPh9lTulmg+aUpKdig23WEiIvPS+2aoAhM7vQkCOrse9JO5H+4Pu
	 1Ku9/JlduozqWepyv6wpnBNyS4/pdcjNjcE0QZ9XhCmSS4TWyo06MI8Ds9jUR2hkfu
	 oBkkZEM4QVNiKHrYKHwhLrbcRH8iw7rsZ/mPkJ7bIlTi8eFJ9C+rUx5lh+UK4KOXWF
	 VykRwV7rT0B4w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 09 Sep 2025 10:24:07 +0200
Subject: [PATCH v2] arm64: dts: qcom: x1e80100-romulus: Add WCN7850
 Wi-Fi/BT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-topic-romulus_wifi_pci-v2-1-3dc495d5559f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACbkv2gC/4WNXQqDMBCEryJ5biQb0P489R5FJCabuqBGs2pbx
 Ls39QJ9GfgG5ptNMEZCFrdsExFXYgpDAn3KhG3N8ERJLrHQShfqAlrOYSQrY+iXbuH6RZ7q0ZI
 sS4XGO3curiDSeIzo6X2IH1XilngO8XP8rPBr/ypXkEpq4xp00IAHdw/M+bSYzoa+z1OIat/3L
 2Qv+ZXDAAAA
X-Change-ID: 20250812-topic-romulus_wifi_pci-660eafdd7591
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757406249; l=5659;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=aR/RlX56kygu+6tmmGPwrCoISAwywwLg2mFDji09QcI=;
 b=dApDmfEJrKjA8MXjO3yxr1T7q3u9SsdkaBj6STiNB7xRilXhLOUT5i3jH8UwIft2Igx/CF+nR
 EYaMwwLeKGwDUo8c5e/Q2j9ddQzJiv/G6vGwpkc2GJyBhNCgC/W1z/B
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

It comes soldered onboard, just like on the QCP.

Unfortunately, the rfkill pin is triggered by default, so a workaround
is needed to convince the Linux driver to enable the hw, after which it
works just fine.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Trivial changes (similar to other X1 boards), I've been running them
for a couple months without much problems.
---
Changes in v2:
- Drop the PCIe patch, as the supplies don't seem to be controllable
  (keep the patch series name unchanged to make sure tools are happy)
- Link to v1: https://lore.kernel.org/r/20250812-topic-romulus_wifi_pci-v1-0-2adbed1b1f1d@oss.qualcomm.com
---
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 143 +++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 0ad4276e9c5f87910477c3389463a109e8d63ae6..ed468b93ba50e1943671d9e7d8b77d181a7c2658 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -331,6 +331,42 @@ vph_pwr: regulator-vph-pwr {
 		regulator-boot-on;
 	};
 
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
 	sound {
 		compatible = "qcom,x1e80100-sndcard";
 		model = "X1E80100-Romulus";
@@ -410,6 +446,65 @@ platform {
 			};
 		};
 	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		vdd-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_l15b>;
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
@@ -1028,6 +1123,23 @@ &pcie4_phy {
 	status = "okay";
 };
 
+&pcie4_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
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
+	};
+};
+
 &pcie6a {
 	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
@@ -1234,6 +1346,13 @@ ssam_state: ssam-state-state {
 		bias-disable;
 	};
 
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	pcie3_default: pcie3-default-state {
 		perst-n-pins {
 			pins = "gpio143";
@@ -1309,6 +1428,13 @@ wcd_default: wcd-reset-n-active-state {
 		output-low;
 	};
 
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio214";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	cam_indicator_en: cam-indicator-en-state {
 		pins = "gpio225";
 		function = "gpio";
@@ -1332,6 +1458,23 @@ embedded-controller {
 	};
 };
 
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
+};
+
 &usb_1_ss0_hsphy {
 	vdd-supply = <&vreg_l3j>;
 	vdda12-supply = <&vreg_l2j>;

---
base-commit: 4ac65880ebca1b68495bd8704263b26c050ac010
change-id: 20250812-topic-romulus_wifi_pci-660eafdd7591

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


