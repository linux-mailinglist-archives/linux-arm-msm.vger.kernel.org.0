Return-Path: <linux-arm-msm+bounces-68788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 544F4B2299E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 16:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2AD8580FCB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6880286429;
	Tue, 12 Aug 2025 13:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYuiDz+6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDBB27FD7C;
	Tue, 12 Aug 2025 13:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755006453; cv=none; b=HQD8iLNb1Mx3kphwK6/rPJYxfxIzWuK+1d+6njzmZ4e/bhz4R2bytG8lfAvjwVhmLbNshtrlsHehKmrSDUfgx/H3GErQWwwRBzi7iZUI0lkdi3f6J9bqAMeokg8jBgGdSFqKp6BI+FSrdkVRoBuXetq3hqpKjXmT/MkxnbbgyQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755006453; c=relaxed/simple;
	bh=BZ5hMTQYurGf0NQmSqfz55KNSUacc16KWCAcuWk99UY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c60lIh6XrFzpU0/Oi4D0E4snDGguaHfjc5DA59Q6b5nzaMyBm5tM5x99ZB4iha5wmZaFcZ5viFhW42uej9L6LaQoKa4r9SRX2LAPY+YYQI8KZNlNadzG1s5sB1LaEu6bSPBCKHajzhWdBFGswUakhiDVLy9/sFKgw2OT1XVWLHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYuiDz+6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44BC8C4CEF5;
	Tue, 12 Aug 2025 13:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755006453;
	bh=BZ5hMTQYurGf0NQmSqfz55KNSUacc16KWCAcuWk99UY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UYuiDz+6iT9fQlNPNNgaGMz/BqIFszftdzP2YLe29bxQPzb0CoCMwpk/XYLQZHxT3
	 65jyp8H6kfeDWpG0YUex1AmIX8iiOyScYWsEhF4hraVwrSXzSoJur9cvdUglnSCSZt
	 aW9WisJ5q4vj2LG/r5akrINFikhERODEALgT7B54TvN5oPRuhibeDg8v97AzrTBvhQ
	 wwv2tT7eIUybWFiBe151UdhLWM/aeZX/Zw10jopta51iTpQZSKETLg9O02KzHqwdDy
	 4bcGxiDmBrl3TSPZUfJ4GZ/8lm/sVQ2eEB+MZj5gv6VjDN4P12GXPdeZQGxaE06J1o
	 HITDamxJm7YDw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 12 Aug 2025 15:47:23 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: x1e80100-romulus: Describe PCIe
 power supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-topic-romulus_wifi_pci-v1-1-2adbed1b1f1d@oss.qualcomm.com>
References: <20250812-topic-romulus_wifi_pci-v1-0-2adbed1b1f1d@oss.qualcomm.com>
In-Reply-To: <20250812-topic-romulus_wifi_pci-v1-0-2adbed1b1f1d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755006446; l=2863;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=NoiZnVB3hqQV/g8r0n/kexYH1O4OPN8vwstgyeZTCT8=;
 b=HRH9wM7ifegHkobcEFPCley8NO0zM0XKYc8+aromzhKAuAT56gS7/0Bx87hsBjKH/0HYFNOBn
 lB5vSTXzQTmAQ1KtR3299yhtJLmxk8iH9tmBFvXa3fsIKVSfneZGGSy
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Describe the power plumbing to allow fully suspending the slot and the
connected SD controller.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 0fd8516580b2679ee425438cb73fd4078cb20581..3a4df8f8066ae699eb7d889530f976fce565757e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -331,6 +331,54 @@ vph_pwr: regulator-vph-pwr {
 		regulator-boot-on;
 	};
 
+	vreg_pcie_12v: regulator-pcie-12v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_pcie_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+
+		gpio = <&pm8550ve_8_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&vreg_12v_x8_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_pcie_3v3_aux";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmc8380_3_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&sde7_aux_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_pcie_3v3_main: regulator-pcie-3v3-main {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_pcie_3v3_main";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmc8380_3_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&sde7_main_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	sound {
 		compatible = "qcom,x1e80100-sndcard";
 		model = "X1E80100-Romulus";
@@ -1022,6 +1070,12 @@ &pcie3_phy {
 	status = "okay";
 };
 
+&pcie3_port {
+	vpcie12v-supply = <&vreg_pcie_12v>;
+	vpcie3v3-supply = <&vreg_pcie_3v3_main>;
+	vpcie3v3aux-supply = <&vreg_pcie_3v3_aux>;
+};
+
 &pcie4 {
 	status = "okay";
 };
@@ -1066,6 +1120,13 @@ rtmr0_3p3_reg_en: rtmr0-3p3-reg-en-state {
 	};
 };
 
+&pm8550ve_8_gpios {
+	vreg_12v_x8_en: 12v-x8-reg-en-state {
+		pins = "gpio8";
+		function = "normal";
+	};
+};
+
 &pm8550ve_9_gpios {
 	rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
 		pins = "gpio8";
@@ -1082,6 +1143,16 @@ edp_bl_en: edp-bl-en-state {
 		input-disable;
 		output-enable;
 	};
+
+	sde7_main_reg_en: sde7-main-reg-en-state {
+		pins = "gpio6";
+		function = "normal";
+	};
+
+	sde7_aux_reg_en: sde7-aux-reg-en-state {
+		pins = "gpio8";
+		function = "normal";
+	};
 };
 
 &pmc8380_5_gpios {

-- 
2.50.1


