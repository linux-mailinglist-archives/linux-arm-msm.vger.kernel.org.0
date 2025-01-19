Return-Path: <linux-arm-msm+bounces-45516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D31BA16248
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 15:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D0813A659C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 14:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F371DF244;
	Sun, 19 Jan 2025 14:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iwk5WlYK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9EC6AA7;
	Sun, 19 Jan 2025 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737298256; cv=none; b=grJEe4fXYvdVemjhfzYh8sq7HfAzgxOYO1u+RBNor556IKJRxBwrUzgyGAUbOtsZDoV/sC02EtI51mBixz1y04w9OebQf21H72FKiaqJ1ZwjXiotFjllsiVA6AMbOziujf1XIEgzeXgtiKhAY6TtQdFfHC8Eh6jcpnbJFUkt+MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737298256; c=relaxed/simple;
	bh=CpqQsIjPSDOfj6zdeEHO9RsdbnTAK7I48FBWPfhfnmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ocyDqvi9a9iA2m8vwlU+4xpK7RqnbeoiyzsTJ+iGNv13h8u5CSbCkJrgbVEDHa5+gbBR7GrJptpPA09I/PAkjmLMSh3ahG78qLvmbz4Ei+e8uJ6qGTecbyH7/Mx5xpwPshF3jmmXn9sDFUtBhbiuHWyAMg7HjI/k+jUs5fuwDCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iwk5WlYK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56FE3C4CEE3;
	Sun, 19 Jan 2025 14:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737298256;
	bh=CpqQsIjPSDOfj6zdeEHO9RsdbnTAK7I48FBWPfhfnmk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Iwk5WlYK03H9Pzss1vQS1dWf9uUhTZh5FWztzNKdnTznqYYdYDeJZ+ZBGRCC0hHxD
	 2sgAVbg1a7hoNj+QTTdGLl4PN5eAiAg21r7ObP19V7qmNxUUVX12rj0KloSQLG0x34
	 PWG3qQwnm3LlOoQ2ryjnXmLeY06xQPVdCcjTcdcHkkvdb5iaBtojLqYOVHCdrK0iIv
	 6dK08tp+OWirM0/0w26lWC6cDZ1+pCK1qwPrK22oBFGYY7wVXDh88i/+yiT6HfS9su
	 mOCWvsOvTh4WhlaTSBxLMY/MbWOKq18UzB4prq4NM+N2wgWI1WrSmReBb2aphaFCxb
	 FeYdeq+UDF3Ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AC2C02188;
	Sun, 19 Jan 2025 14:50:56 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 19 Jan 2025 15:50:51 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: x1e80100-vivobook-s15: Enable USB-A
 ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250119-usb_a_micro_sd-v1-1-01eb7502ae05@hotmail.com>
References: <20250119-usb_a_micro_sd-v1-0-01eb7502ae05@hotmail.com>
In-Reply-To: <20250119-usb_a_micro_sd-v1-0-01eb7502ae05@hotmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737298255; l=3649;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=idUvFTYnjlWc1hne6a9f/k2cF8fXFoNt7OjqqPI7Elg=;
 b=rWhKRfL8YkTdmOrujhoQlvGsFleap4guv118Cjw48KX4aQtMFVnlHGM6lM1p6LQgDdGcLq857
 6xM003uNvPxA6FZ9kAr+JJj60G1tSoz3tqYKBtFMa5v1RcqBnlq3gMo
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

The asus vivobook has 2 USB type A ports on the right side, enable them

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 103 ++++++++++++++++++++-
 1 file changed, 102 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index 53781f9b13af3e8491dcf63c57868eaf7025d0a8..b66d03ee3ff30561e8665be6ad34919f89a79572 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -192,6 +192,20 @@ vreg_l2b_3p0: ldo2 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l4b_1p8: ldo4 {
+			regulator-name = "vreg_l4b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b_3p0: ldo13 {
+			regulator-name = "vreg_l13b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l14b_3p0: ldo14 {
 			regulator-name = "vreg_l14b_3p0";
 			regulator-min-microvolt = <3072000>;
@@ -209,6 +223,13 @@ regulators-1 {
 		vdd-l3-supply = <&vreg_s1f_0p7>;
 		vdd-s4-supply = <&vph_pwr>;
 
+		vreg_l3c_0p8: ldo3 {
+			regulator-name = "vreg_l3c_0p8";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_s4c_1p8: smps4 {
 			regulator-name = "vreg_s4c_1p8";
 			regulator-min-microvolt = <1856000>;
@@ -401,7 +422,35 @@ keyboard@3a {
 		wakeup-source;
 	};
 
-	/* EC? @ 0x5b, 0x76 */
+	eusb3_repeater: redriver@47 {
+		compatible = "nxp,ptn3222";
+		reg = <0x47>;
+		#phy-cells = <0>;
+
+		vdd3v3-supply = <&vreg_l13b_3p0>;
+		vdd1v8-supply = <&vreg_l4b_1p8>;
+
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&eusb3_reset_n>;
+		pinctrl-names = "default";
+	};
+
+	eusb6_repeater: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+		#phy-cells = <0>;
+
+		vdd3v3-supply = <&vreg_l13b_3p0>;
+		vdd1v8-supply = <&vreg_l4b_1p8>;
+
+		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&eusb6_reset_n>;
+		pinctrl-names = "default";
+	};
+
+	/* EC @ 0x76 */
 };
 
 &i2c7 {
@@ -563,6 +612,22 @@ edp_reg_en: edp-reg-en-state {
 		bias-disable;
 	};
 
+	eusb3_reset_n: eusb3-reset-n-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+		output-low;
+	};
+
+	eusb6_reset_n: eusb6-reset-n-state {
+		pins = "gpio184";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+		output-low;
+	};
+
 	hall_int_n_default: hall-int-n-state {
 		pins = "gpio92";
 		function = "gpio";
@@ -698,3 +763,39 @@ &usb_1_ss1_dwc3_hs {
 &usb_1_ss1_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss1_ss_in>;
 };
+
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	phys = <&eusb6_repeater>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	phys = <&eusb3_repeater>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l3c_0p8>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l3c_0p8>;
+
+	status = "okay";
+};

-- 
2.47.1



