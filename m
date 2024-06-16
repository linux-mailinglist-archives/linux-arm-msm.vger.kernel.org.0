Return-Path: <linux-arm-msm+bounces-22770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C15BE909DE9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2024 16:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C0C91F217BA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2024 14:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40A87492;
	Sun, 16 Jun 2024 14:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4H8jRIZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB93525D;
	Sun, 16 Jun 2024 14:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718547353; cv=none; b=vBiYiTlelCNBiy1yGv/HJ3F8wxVQo1mtibAHSTRCL1kVfQkZvGvMwT8ych8xjKgn0MQ5jC5cpLmrFoZewttXNd9+lvbyYoF+hJSO4Xouo/+zDGYCqnYLW+OXezlBsMb0eMtX9Sr+aUDmd0j4McEeuzts3Kr4apY1pQ3SmERnQZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718547353; c=relaxed/simple;
	bh=TsiqY5ghTt6zNS7is2HIehRASQyN6+nUzZNoGJEVlqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ux1+dq5BpOWQDaFJ3jDyONf0yolCLLxTg7ssR5SRcciC1MPfQF4MaVTkn0bShRurrJcy08tNCkZL1USW7ysEaaVicyw1FtoTJOqjQsTQDtvHOVxkg5qE7L0233qkHVQ0LW0rw3LT186N9EfVPFbK28B1lLXSRpBXzEAfEp+e9i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4H8jRIZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCF38C2BBFC;
	Sun, 16 Jun 2024 14:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718547352;
	bh=TsiqY5ghTt6zNS7is2HIehRASQyN6+nUzZNoGJEVlqg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=l4H8jRIZnD6PJV6t+JXDSt4nEn629qeP/R7K1vL5YKIchvpqsfREE8WTmqHDITy+B
	 Pj5tZsJzQ4nSaToAmyNmssNW1yFH/zncjIprmzd/iRImhYTcOCw/ykEdZ7PsZzCpJ6
	 Uq22CSCNIhhmlYPgYD4eX7cujzGGvc2lH3n9CGXY525VOxmONhwsDnyu1JIYAtTlDQ
	 JRCkgkEIsz2ENnD/jRY/2NR2tUCIjhPqVFQw49j+9bDIL7sX68SQg7X3b/cYvzYzQe
	 INlVY3oNX5LDIf+iSrOApHkEGDUi4WpXbBGHbgI7dm/Z9BactcSei3iceG6fYgpJ3W
	 3kG7rcTAbE3oQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2132C27C53;
	Sun, 16 Jun 2024 14:15:52 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 16 Jun 2024 16:15:45 +0200
Subject: [PATCH] ARM: dts: qcom: msm8926-motorola-peregrine: Add
 accelerometer, magnetometer, regulator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240616-peregrine-v1-1-85d14ae1a11a@apitzsch.eu>
X-B4-Tracking: v=1; b=H4sIAJDzbmYC/x3MQQqAIBBG4avIrBNU0kVXiRZlfzYbkxEikO6et
 Pzg8RpVCKPSpBoJbq585Q47KIrnmhM0793kjBtNsEEXCJJwhg6IHi5s1iNS74vg4Od/zcv7fu4
 y4albAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718547355; l=4379;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=fAaRpnS34tfTExhh2XisZxapKdoWeOZI5ZaxJ4uIxC0=;
 b=TsGnsIqG+BESQgTILEz3JVRyswhIQ43+1QR+8irCA1StScDthFMgV6jNYbBp9qeaRMF/fZ7KY
 IDtHYY8zb7LC7S3Me07s09pIr/K1wONbrIB/dsmKDI4NmbAIyrfnTqL
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Add the accelerometer, magnetometer and regulator that are present on
the Motorola Moto G 4G (2013) device.

While at it, update framebuffer supplies and temperature sensor.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 .../dts/qcom/qcom-msm8926-motorola-peregrine.dts   | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
index 0cbe2d2fbbb1..376a33125941 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
@@ -29,6 +29,10 @@ framebuffer0: framebuffer@3200000 {
 			height = <1280>;
 			stride = <(720 * 3)>;
 			format = "r8g8b8";
+			vsp-supply = <&reg_lcd_pos>;
+			vsn-supply = <&reg_lcd_neg>;
+			vdd-supply = <&pm8226_l28>;
+			vddio-supply = <&vddio_disp_vreg>;
 		};
 	};
 
@@ -51,6 +55,18 @@ key-volume-up {
 		};
 	};
 
+	vddio_disp_vreg: regulator-vddio-disp {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio_disp";
+		gpio = <&tlmm 34 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <300>;
+		enable-active-high;
+		regulator-boot-on;
+		vin-supply = <&pm8226_l8>;
+		pinctrl-0 = <&disp_vddio_default>;
+		pinctrl-names = "default";
+	};
+
 	reserved-memory {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -68,12 +84,67 @@ smem_region: smem@fa00000 {
 	};
 };
 
+&blsp1_i2c2 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	magnetometer@c {
+		compatible = "asahi-kasei,ak8963";
+		reg = <0xc>;
+		interrupts-extended = <&tlmm 38 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 62 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pm8226_l19>;
+		pinctrl-0 = <&mag_int_default &mag_reset_default>;
+		pinctrl-names = "default";
+	};
+
+	accelerometer@18 {
+		compatible = "st,lis3dh-accel";
+		reg = <0x18>;
+		interrupts-extended = <&tlmm 1 IRQ_TYPE_EDGE_FALLING>;
+		vdd-supply = <&pm8226_l19>;
+		pinctrl-0 = <&accel_int_default>;
+		pinctrl-names = "default";
+		st,drdy-int-pin = <1>;
+	};
+};
+
 &blsp1_i2c3 {
+	clock-frequency = <400000>;
 	status = "okay";
 
+	regulator@3e {
+		compatible = "ti,tps65132";
+		reg = <0x3e>;
+		pinctrl-0 = <&reg_lcd_default>;
+		pinctrl-names = "default";
+
+		reg_lcd_pos: outp {
+			regulator-name = "outp";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <6000000>;
+			regulator-active-discharge = <1>;
+			regulator-boot-on;
+			enable-gpios = <&tlmm 31 GPIO_ACTIVE_HIGH>;
+		};
+
+		reg_lcd_neg: outn {
+			regulator-name = "outn";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <6000000>;
+			regulator-active-discharge = <1>;
+			regulator-boot-on;
+			enable-gpios = <&tlmm 33 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	sensor@48 {
 		compatible = "ti,tmp108";
 		reg = <0x48>;
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&temp_alert_default>;
+		pinctrl-names = "default";
+		#thermal-sensor-cells = <0>;
 	};
 };
 
@@ -278,6 +349,56 @@ &smbb {
 	status = "okay";
 };
 
+&tlmm {
+	accel_int_default: accel-int-default-state {
+		pins = "gpio1";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-disable;
+	};
+
+	disp_vddio_default: disp-vddio-default-state {
+		pins = "gpio34";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	mag_int_default: mag-int-default-state {
+		pins = "gpio38";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-disable;
+	};
+
+	mag_reset_default: mag-reset-default-state {
+		pins = "gpio62";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	reg_lcd_default: reg-lcd-default-state {
+		pins = "gpio31", "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	temp_alert_default: temp-alert-default-state {
+		pins = "gpio13";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-disable;
+	};
+};
+
 &usb {
 	extcon = <&smbb>;
 	dr_mode = "peripheral";

---
base-commit: c71189547381bb5f176c6b22a9edc3414f1837b9
change-id: 20240616-peregrine-6ec5e26b15ec

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



