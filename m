Return-Path: <linux-arm-msm+bounces-36685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E86A9B8C24
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 08:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 986501C21DFE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 07:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FB41547C9;
	Fri,  1 Nov 2024 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kndf8JpZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D3455896;
	Fri,  1 Nov 2024 07:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730446858; cv=none; b=HzBOle3t3ju92sqnb66uGBbhUbUv4mjdd1QdQjMprcgO/2yzuFte5i/ZYtWwo19+7V6L66CFnr4I9YZdTcwshUyUCTQaeP9pzkxUVqKib4wgZdTEMj4YKfwIua/9FKuem9HdwyrWpU9u1VqUuE7NCd/EmcJ7HZichO3Fktt4qFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730446858; c=relaxed/simple;
	bh=mU0VMdm104wjRtXVgEZ+lSglLurcb/kByS+gvz22oYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ezoW/YP/yqSNzCqcx+5go1jlEupvBuwjir4B2ihvanUuTsXKqi8w+lRaYxEwnxsVEESFeGplsdv3D/iDlAZEOdssUKsSJvrnpo0jM/pg5e+kYdZauDXPrGn8uyYNFT0KDCl6VNjsAEWyyU4IDrKSReFRBVwf5ES0WXcukLvIhJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kndf8JpZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481CDC4CECD;
	Fri,  1 Nov 2024 07:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730446858;
	bh=mU0VMdm104wjRtXVgEZ+lSglLurcb/kByS+gvz22oYQ=;
	h=From:To:Cc:Subject:Date:From;
	b=kndf8JpZMuw9uSCjbF0JPSc2ffqCm95tneDc4TjMoWczMtX/0pFUesBTleAp+/eeT
	 /wScMeTnMYh2gulgTSSLCYpD2W+Jkb9QqF/MFzja+spe3lPSeSw0QauSrdait5WBc1
	 AQqahsuRRPyHSUbWgf0NNDtqV9y9BF1fZXJMDX5I0rd4Ta/C6KzfSc78rvLVoFmTPB
	 DPvaK2JcBVRhbfhZx+hKLpM4cYQwhfs7y2O92BWEX6esIm4L8J7g562wCKgS+uciwe
	 O0AIU9EYScS+D3Clzvd83gR6v36FzAW/B62or1dQhEz0ewJZkOx9BFJunm1Ry6HD5u
	 UIzpzjfE3SPpg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t6mHA-000000005q3-1KoG;
	Fri, 01 Nov 2024 08:40:56 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3] arm64: dts: x1e80100-crd: describe HID supplies
Date: Fri,  1 Nov 2024 08:40:06 +0100
Message-ID: <20241101074006.22390-1-johan+linaro@kernel.org>
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
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

Changes in v3
 - move 'pinctrl-names' after 'pinctrl-0'

Changes in v2:
 - amend the pin config in order not to rely on the boot firmware


 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index b50accb220e5..88f6b1fa7c74 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "x1e80100.dtsi"
@@ -277,6 +278,23 @@ vreg_edp_3p3: regulator-edp-3p3 {
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
+		pinctrl-0 = <&misc_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -691,6 +709,9 @@ touchpad@15 {
 		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
 
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l12b_1p2>;
+
 		pinctrl-0 = <&tpad_default>;
 		pinctrl-names = "default";
 
@@ -704,6 +725,9 @@ keyboard@3a {
 		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
 
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l12b_1p2>;
+
 		pinctrl-0 = <&kybd_default>;
 		pinctrl-names = "default";
 
@@ -723,6 +747,9 @@ touchscreen@10 {
 		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
 
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_1p8>;
+
 		pinctrl-0 = <&ts0_default>;
 		pinctrl-names = "default";
 	};
@@ -856,6 +883,19 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pm8550ve_8_gpios {
+	misc_3p3_reg_en: misc-3p3-reg-en-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-disable;
+		drive-push-pull;
+		input-disable;
+		output-enable;
+		power-source = <1>; /* 1.8 V */
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+	};
+};
+
 &pmc8380_3_gpios {
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio4";
-- 
2.45.2


