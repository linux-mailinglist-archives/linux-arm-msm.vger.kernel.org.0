Return-Path: <linux-arm-msm+bounces-51433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F53EA6143F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06157462CE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647AE202C52;
	Fri, 14 Mar 2025 14:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ydn7qrBr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29BB20127A;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741964108; cv=none; b=cnNbUXZLOiAol1bHpx09Lz26RaVuiZSoeHgU3Y8F6xvHi8E0qL4SCuxLTNrEqGPm8kGC7gkflwTn4Vbf5lrY4yYdPulbx9S5l1KPoEIz8ffLMRXnD9BLH5xWrM966e+FwmwcHG2LiZ5oTAOJrBoliGRIc+vz2gC/4sGx823/4Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741964108; c=relaxed/simple;
	bh=i7kZ6wYmuRLaAfIOVM6uuzu3RdGVBiH3IGLM285iByg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSQ0X4jLT0rydWCQxMKbeH69fP5czVyST7NuksKfdLEWk4fDB93Qw8FH45EQiXY9znh0/RlPOPxvJ+33RcTo+ig73Cy48uZ1orlf7JX8qQ9fAgUiMBhLgVouDc0EIQhjAz2Q7EH3NQxWg3hWnVrH7KxZTPZglAdDKX0NbjOnKzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ydn7qrBr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62BBC16AAE;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741964107;
	bh=i7kZ6wYmuRLaAfIOVM6uuzu3RdGVBiH3IGLM285iByg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ydn7qrBrfmr5u8KDgeRf2n5WCMY1T7cdDKI/NMDmoqlxEfNHqKQgfBwdYpme91Eo3
	 vTm+yARnZ2ThDaztBMGVD7ZBjbxl/S6mzFEPyw/QUJ7h3SALYSsa1Z2X4/+570kHaw
	 cfrE61qXKgYNys3xkGx9qF97f5dSpag4ebFUiugw8/aFwHaJ8rLG8uvcGK1EahpCqf
	 xXO8I1cuhAyUANmx9LDlUTWEw9Mm/CjXcDe1ujDZyRSfL6OxVSQSACoM4nXCULfZ6e
	 nXdqnWnXnjGdhFPPP1fqz27eJ31ZZ3nlF6ogLSdrZQoAMGoRFYsJXzSqGLB4F3VnSz
	 UzxRhv7fTogiw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tt6RH-000000002yp-0gi8;
	Fri, 14 Mar 2025 15:55:07 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 8/8] arm64: dts: qcom: x1e78100-t14s: fix missing HID supplies
Date: Fri, 14 Mar 2025 15:54:40 +0100
Message-ID: <20250314145440.11371-9-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314145440.11371-1-johan+linaro@kernel.org>
References: <20250314145440.11371-1-johan+linaro@kernel.org>
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
	i2c_hid_of 1-002c: supply vdd not found, using dummy regulator
	i2c_hid_of 1-0015: supply vddl not found, using dummy regulator
	i2c_hid_of 1-002c: supply vddl not found, using dummy regulator
	i2c_hid_of 1-003a: supply vdd not found, using dummy regulator
	i2c_hid_of 1-003a: supply vddl not found, using dummy regulator

Note that VCC3B is also used for things like the modem which are not yet
described so mark the regulator as always-on for now.

Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
Cc: stable@vger.kernel.org	# 6.12
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 160c052db1ec..962fb050c55c 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "x1e80100.dtsi"
@@ -169,6 +170,23 @@ vreg_edp_3p3: regulator-edp-3p3 {
 		regulator-boot-on;
 	};
 
+	vreg_misc_3p3: regulator-misc-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VCC3B";
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
 
@@ -692,6 +710,9 @@ touchpad@15 {
 		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
 
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l12b_1p2>;
+
 		wakeup-source;
 	};
 
@@ -703,6 +724,9 @@ touchpad@2c {
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
 
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l12b_1p2>;
+
 		wakeup-source;
 	};
 
@@ -714,6 +738,9 @@ keyboard@3a {
 		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
 
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_1p8>;
+
 		pinctrl-0 = <&kybd_default>;
 		pinctrl-names = "default";
 
@@ -896,6 +923,9 @@ touchscreen@10 {
 		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
 
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_1p8>;
+
 		pinctrl-0 = <&ts0_default>;
 		pinctrl-names = "default";
 	};
@@ -1037,6 +1067,19 @@ usb0_3p3_reg_en: usb0-3p3-reg-en-state {
 	};
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
 &pm8550ve_9_gpios {
 	usb0_1p8_reg_en: usb0-1p8-reg-en-state {
 		pins = "gpio8";
-- 
2.48.1


