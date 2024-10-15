Return-Path: <linux-arm-msm+bounces-34424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CA599E9AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 14:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A74851F22D08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 12:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05311EC00A;
	Tue, 15 Oct 2024 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxaTLFlO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15601494DD;
	Tue, 15 Oct 2024 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728995104; cv=none; b=OsIYAh3XoJ1rxjAQ/APIC/QgFpiYdNgMKqg0ATVNye1DHM8L1GjasHCR7/97xNL6HsFDZeCoFq4x7xltt24jAwUhbystNlD4SQibAGrqj2DaNhZUB4/yOigzwg3kzjaNlhhT/VE20+kLVIDsnibno0AzFmotO4Mw4cYNHRhDXZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728995104; c=relaxed/simple;
	bh=z4SgWiXZHclJDFd1CCUtzXwDl19OFmxTuKI5RWATYTg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bYHEDvxUVgZdcP/rMlHQyT/gY2UBwqXSJxyN5IyBhIZpueAIx/fLewYBRJV3vdJnuY56fco7JeevJyjDks3uWcRuUKCmh1bGosvZRYSxFLebO2hshtvTZTILkXQpOiu9IQ6F+kD/CM2sX5pocbPAy6Ak/UqC2kWeGN0W9Vw+LcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxaTLFlO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D130C4CEC6;
	Tue, 15 Oct 2024 12:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728995104;
	bh=z4SgWiXZHclJDFd1CCUtzXwDl19OFmxTuKI5RWATYTg=;
	h=From:To:Cc:Subject:Date:From;
	b=QxaTLFlOj0VIPnqz2QkhahX2/tAGGu/x5I+sd8A44ZfaRhfVWmCb/1jXZSZMBtbUd
	 cNgh2GYWlTlQBU1TepQ8uVeWbfbp5qSVOFJggLixCjb1Z+dzfyX4RsgzsfgM2boy68
	 /xW/64lwUEULFHKvdt/rMCFGrd8EunPb8u019IQGo2GJPJ89JB0DuONRyLjFW/I/LR
	 XTO6bJnHDY+Y1Vz/UrbR/T2xifr17YndNBkYKkRNiFrDUbfWPcqWU+tDEussUCHtjR
	 uWctKKMWSHE4Z/w3Ea+gTX2u48o2QEHjQ81btp7EO2b5puDfIatXnb8W07YQgGAXza
	 Pmb49RrHzzb8A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t0gbt-000000004Aj-1AOE;
	Tue, 15 Oct 2024 14:25:09 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] arm64: dts: x1e80100-crd: describe HID supplies
Date: Tue, 15 Oct 2024 14:24:27 +0200
Message-ID: <20241015122427.15995-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing HID supplies to avoid relying on other consumers to keep
them on.

This also avoids the following warnings on boot:

	i2c_hid_of 0-0010: supply vdd not found, using dummy regulator
	i2c_hid_of 0-0010: supply vddl not found, using dummy regulator
	i2c_hid_of 1-0015: supply vdd not found, using dummy regulator
	i2c_hid_of 1-0015: supply vddl not found, using dummy regulator
	i2c_hid_of 1-003a: supply vdd not found, using dummy regulator
	i2c_hid_of 1-003a: supply vddl not found, using dummy regulator

Note that VREG_MISC_3P3 is also used for things like the fingerprint
reader which are not yet fully described so mark the regulator as always
on for now.

Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
Cc: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 34 +++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 10b28d870f08..4ab7078f76e0 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -288,6 +288,23 @@ vreg_edp_3p3: regulator-edp-3p3 {
 		regulator-boot-on;
 	};
 
+	vreg_misc_3p3: regulator-misc-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_MISC_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pm8550ve_8_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&misc_3p3_reg_en>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -689,6 +706,9 @@ touchpad@15 {
 		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
 
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l12b_1p2>;
+
 		pinctrl-0 = <&tpad_default>;
 		pinctrl-names = "default";
 
@@ -702,6 +722,9 @@ keyboard@3a {
 		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
 
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l12b_1p2>;
+
 		pinctrl-0 = <&kybd_default>;
 		pinctrl-names = "default";
 
@@ -721,6 +744,9 @@ touchscreen@10 {
 		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
 
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_1p8>;
+
 		pinctrl-0 = <&ts0_default>;
 		pinctrl-names = "default";
 	};
@@ -854,6 +880,14 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pm8550ve_8_gpios {
+	misc_3p3_reg_en: misc-3p3-reg-en-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-disable;
+	};
+};
+
 &pmc8380_3_gpios {
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio4";
-- 
2.45.2


