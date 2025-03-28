Return-Path: <linux-arm-msm+bounces-52795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD7EA75087
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 19:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8855F18950D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 18:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6381DF24D;
	Fri, 28 Mar 2025 18:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYcBzHLF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1D114A0BC;
	Fri, 28 Mar 2025 18:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743187610; cv=none; b=MykrBH4KHkejVuN9PTzS0cbt6Yx7EzDO+wxu88txP1mMEsIwU9VjpgGTWX5DHGTFiwAgwqyoKYGHYLcXIl4axDA4C4K5e023pkiNVvrzLtrYMS2PvH3bdwX/lcT6CtcyyzviUMK7Eg7sUV5LwqELLRFMEXQMiLDbiw+lVePpFNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743187610; c=relaxed/simple;
	bh=VHJsVHFJzhYTuQ7je/5WMk5khxEyqjjoPSkq9jJ3m9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qrTL5JP7CjSfyG0yH46MX7Jhh0jtD1nSfs94R65pYF5526erDFU1+g5mYU23iW/Hbl0xX8x7l6H6hY+NmY/U0LV69IvIn9adTkzZduY8JPzbjbgYfPkLDV0iPaJ+p1VLYSUONpjPDu/9PzGc9lLyBqFCHS+rcZ4s+LPpH8z78V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYcBzHLF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E2C5C4CEE4;
	Fri, 28 Mar 2025 18:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743187610;
	bh=VHJsVHFJzhYTuQ7je/5WMk5khxEyqjjoPSkq9jJ3m9w=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=QYcBzHLFmTEjJZbLsiZde+CEV7GupoFkicqzytGEYhoIqgjhta13yu3hWPFNuRKI7
	 11LYx8z6yiC0g2dgIQD0sT68T0jx2F5OB/MjhlKpLIFrIjOKQ/mC23edqf8rXhrP8d
	 c7Om5M8H51E6SHp/nelet9gnDq4G4C8tckk7d7rWjtNlMZCwMsLDumqdGsVhVPkrzT
	 bGLY0ubcHWyjD48VsElDPpTe3Hkbjk+4Fbo9vlkeinfUZFUib47VQFWZLuM0MBFjWx
	 a/VX3c2q1kBOpuyU5Y1NiZ+FlzWbOl28JaP2gChXqAV7UcVtqD4DpZxUSBUOT1rWoo
	 eOkYh35RaF1Lg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFD6C28B20;
	Fri, 28 Mar 2025 18:46:49 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Fri, 28 Mar 2025 19:46:45 +0100
Subject: [PATCH v7] arm64: dts: qcom: x1e80100-vivobook-s15: Add bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-asus_qcom_display-v7-1-322d2bff937d@hotmail.com>
X-B4-Tracking: v=1; b=H4sIAJTu5mcC/4XQ22rDMAwG4Fcpvp6HLZ/iXu09RilKbC+GtuniL
 rSUvPvUMlhGDLsx/Eb6hHRnJY45Frbd3NkYp1zycKLgXjas6/H0EXkOlBkI0FJKy7F8lf1nNxz
 3IZfzAW+8iyYlB14pLRj1nceY8vVpvu8o97lchvH2HDHJx++PBqqiTZIL3hj0KXnQAvGtHy5Hz
 IdXqmIPb4J/DSADRZtSY5ylurWhloauGYoMIaB1oFrpQawNvTRMzdBkWIk6oLS0jF0b5tegp2Y
 YMqIIyhmgM8u0NuzSqO5iyfBSON+FBpSOf415nr8BnJ0TRwgCAAA=
X-Change-ID: 20241116-asus_qcom_display-ce5ff7293340
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743187609; l=8153;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=lrfh6d5f8dXOFO6Fr6yu9DWe+YdNi/MddlVyp3D4nHw=;
 b=dimc4PITJh12KTxadUeLDyqJ/lval89wQE7jaMxvr3nz+W1yOw5l+R3tG/evERXqD6f6lxD4O
 12Ps0Vo/pwSDlLzDy8+bK3Mr2gurIjD6X/CFexoG+NYi0ZAalQvmee9
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

Add bluetooth for the asus vivobook s15
Describe wlan configuration

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
Improves several parts of the devicetree:
1. The eDP panel bindings
2. Add a lid switch
3. Add bluetooth and describe wlan (depends on [1])

A big part of the bluetooth/wifi patch was copied from [1] as it is
mostly boiler plate regulator definitions
[1]: https://lore.kernel.org/all/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org/
---
Changes in v7:
- Add todo comment for the bluetooth/wifi regulators
- Rebase on new next tag
- Link to v6: https://lore.kernel.org/r/20241204-asus_qcom_display-v6-0-91079cd8234e@hotmail.com

I seem to get a warning that the pci17cb vendor is undocumented (wlan)
I can find this compatible in
Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
But pci17cb doesn't really seem like a vendor name to me, I have ignored
this warning for now.

Changes in v6:
- Use the proper define for the pmic-gpio drive-strength in the panel
  driver patch
- Add a comment about the voltage to the pmic-gpio power-source in the
  panel driver patch
- Remove the alias for the not (yet) existing debug uart in the bt/wifi
  patch
- Remove output-low from the bt_en gpio in the bt/wifi patch
- Add wcn- prefix to the bt-en and wlan-en gpio node names in the
  bt/wifi patch
- Link to v5: https://lore.kernel.org/r/20241202-asus_qcom_display-v5-0-e0d3752ff71f@hotmail.com

Changes in v5:
- Fix the pinctrl-# definition in the wcn7850-pmu node in the
  bluetooth/wifi patch
- Link to v4: https://lore.kernel.org/r/20241125-asus_qcom_display-v4-0-61a4da162406@hotmail.com

Changes in v4:
- Fixed the pin parameters for the backlight enable pin
- Fixed the wcn_sw_en drive-strength, this was not in the acpi table I
  checked.
- Fixed the ordering of several nodes in the bluetooth/wifi patch
- Link to v3: https://lore.kernel.org/r/20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com

Changes in v3:
- Fixed commit message formatting (line wrapping)
- Fixed bad indentation (lid switch pinctrl)
- Fixed bluetooth addition and added wifi description
- Link to v2: https://lore.kernel.org/r/20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com

Changes in v2:
- Add missing gpiokeys include in the lid switch patch
- Add depends on for the bluetooth patch
- Link to v1: https://lore.kernel.org/r/20241123-asus_qcom_display-v1-0-85a9ff9240aa@hotmail.com
---
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 167 +++++++++++++++++++++
 1 file changed, 167 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index fb9567817be6f887c9214cafbfbabda8b8cb8203..d5ce5388b13d1b3250b16b4ba81ed7f87a51dc0e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -19,6 +19,10 @@ / {
 	compatible = "asus,vivobook-s15", "qcom,x1e80100";
 	chassis-type = "laptop";
 
+	aliases {
+		serial1 = &uart14;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-0 = <&hall_int_n_default>;
@@ -153,6 +157,107 @@ vph_pwr: regulator-vph-pwr {
 		regulator-always-on;
 		regulator-boot-on;
 	};
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
+		pinctrl-0 = <&wcn_wlan_en>, <&wcn_bt_en>;
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
@@ -212,6 +317,13 @@ vreg_l14b_3p0: ldo14 {
 			regulator-max-microvolt = <3072000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
 	};
 
 	regulators-1 {
@@ -539,6 +651,23 @@ &pcie4_phy {
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
@@ -720,6 +849,44 @@ tpad_default: tpad-default-state {
 		function = "gpio";
 		bias-disable;
 	};
+
+	wcn_bt_en: wcn-bt-en-state {
+		pins = "gpio116";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-down;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio214";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	wcn_wlan_en: wcn-wlan-en-state {
+		pins = "gpio117";
+		function = "gpio";
+		drive-strength = <16>;
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
 
 &usb_1_ss0_hsphy {

---
base-commit: e21edb1638e82460f126a6e49bcdd958d452929c
change-id: 20241116-asus_qcom_display-ce5ff7293340

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>



