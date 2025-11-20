Return-Path: <linux-arm-msm+bounces-82623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3C5C728DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 08:17:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 404213460EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 07:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CB2302CB9;
	Thu, 20 Nov 2025 07:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrrkbxcV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFB430147A;
	Thu, 20 Nov 2025 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763622886; cv=none; b=GY5tkLmQMVy1cvsNlqDVkcUnDFIeUHEe/em81FhRRWuzLT9Y2LaHM+xtLY3lfsqzrjr00iHzpMQYWlbxdXZRqmrAhRaIMfyaZUd26788Vwg99tg/liwJ06oz7Qsp8zDkMzPNdeMHSf1fQJ7tQWxuqsRqIMiyV8IpJsjGrV7sOXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763622886; c=relaxed/simple;
	bh=HbpjlJC5wjiJJwt5Em64pMo2FXgLoSKkzcg2EQqvFX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J28Fuha2q+vxlX1VXD0APrr3jm/bB9QASfujNkOsxGGpO1ysy2IVR45SfrzuGPn21T4SoVDj0Ey81DfIk5AEAS00SjWiXC4S0KNyAxqM6PaQZg4ifTgikWXWGt4Tt9b2BPJb13/IpN9MQBxX3NDw/q7G40jLi56h86IaCZStu8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrrkbxcV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F4E2C116B1;
	Thu, 20 Nov 2025 07:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763622885;
	bh=HbpjlJC5wjiJJwt5Em64pMo2FXgLoSKkzcg2EQqvFX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YrrkbxcVFHCGySQQ3bLa3qB1eRefdANHdVRbpQjP7t+sU+T+0fLFYgdZ1Qk3d1fBV
	 aFgXS8QWOvb5qVlxUKlbgd7vv92RkI+De2/XQD6FsCyDBHc2wde3Imw3I+V7H5f/J9
	 sea5Ktj77gCLTEpsi+HXdHCj5yZ77JO06UyP2mMqCHXM8o7BxtxumH3nHeXXdEkKOR
	 QQvOGZznGYm/RKmlRBS34YEwhvgLR+FMZzcxWpZQxIEO/6Y0+n/KXtM1LP8sndUx2Y
	 kyJSF0fhA3MSJOKzLHgwV7r973kZflOz/9jsQi9+jIEzODpBpqvZM2Rv0HPVNSRBpu
	 R18EZFyRGS56A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 888EDCF8549;
	Thu, 20 Nov 2025 07:14:45 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Wed, 19 Nov 2025 23:14:42 -0800
Subject: [PATCH 1/4] ARM: dts: qcom: msm8960: expressatt: Add
 Light/Proximity Sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-expressatt_nfc_accel_magn_light-v1-1-636f16f05cf4@gmail.com>
References: <20251119-expressatt_nfc_accel_magn_light-v1-0-636f16f05cf4@gmail.com>
In-Reply-To: <20251119-expressatt_nfc_accel_magn_light-v1-0-636f16f05cf4@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763622884; l=2089;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=3y/PevugngpXnTyFIerATqp8HygnxRp+u1TfLII58QU=;
 b=LagrKQ+BSjYyxXq0usvsRwsh+wEO+8m2HP/0WG/GjT0hVI/WolqnLCIkdtwbUcrMQIT3cnjO+
 IBWkE9OOAA7DRAFNROgjj8gjJUbfv0N7XDg5uWtF7JCgVGmNz7N8EoO
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Rudraksha Gupta <guptarud@gmail.com>

Currently the Proximity Sensor doesn't work, but light sensor does.
Left the proximity sensor as a TODO for later.

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 5ee919dce75b..1e331a046e7b 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -52,6 +52,31 @@ key-volume-down {
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 	};
+
+	i2c-gpio-sensors {
+		compatible = "i2c-gpio";
+		sda-gpios = <&tlmm 12 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 13 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <5>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		light-sensor@39 {
+			compatible = "amstaos,tmd2772";
+			reg = <0x39>;
+			interrupt-parent = <&pm8921_gpio>;
+			interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+			vdd-supply = <&pm8921_l9>;
+			vddio-supply = <&pm8921_lvs4>;
+
+			// TODO: Proximity doesn't work
+			amstaos,proximity-diodes = <0>;
+			led-max-microamp = <100000>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&prox_sensor_int>;
+		};
+	};
 };
 
 &gsbi5 {
@@ -163,6 +188,15 @@ &pm8921 {
 	interrupts-extended = <&tlmm 104 IRQ_TYPE_LEVEL_LOW>;
 };
 
+&pm8921_gpio {
+	prox_sensor_int: prox-sensor-int-state {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-disable;
+	};
+};
+
 &rpm {
 	regulators {
 		compatible = "qcom,rpm-pm8921-regulators";
@@ -280,6 +314,7 @@ pm8921_l9: l9 {
 			regulator-min-microvolt = <2850000>;
 			regulator-max-microvolt = <2850000>;
 			bias-pull-down;
+			regulator-always-on;
 		};
 
 		pm8921_l10: l10 {
@@ -377,6 +412,7 @@ pm8921_lvs3: lvs3 {
 
 		pm8921_lvs4: lvs4 {
 			bias-pull-down;
+			regulator-always-on;
 		};
 
 		pm8921_lvs5: lvs5 {

-- 
2.51.2



