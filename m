Return-Path: <linux-arm-msm+bounces-84437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8391CCA7201
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 11:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC9A8304AC91
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 10:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E6A31A076;
	Fri,  5 Dec 2025 10:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etK+P1+c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470112836BE;
	Fri,  5 Dec 2025 10:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764929806; cv=none; b=D4kSne+y1DzFbE8tJjDsUqN7CQFgantaCc1lAdExObt7yiUn53BEAFe+zjyyRVs6x9dz+e/JZwbCeyfDj4Ka6O5/frg5BtDyrWQeENkdlzDWiETvqmdJZoZnR3qCXNTSr8eO8ooYmydPqpOtE7XNaz8hmISl8DJtF5QUWhF/Q3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764929806; c=relaxed/simple;
	bh=MaI8IZsaB50roRDHgSsWkLNVdEW09lgAOc08QCyiKfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pu5bQtCkq4Kb3txx1iURT/5IwuSZC2oRdVEpU5hr2oszXEYtR4MSsriIBQgmbz6nZbYAoDfB6IN7PNz7d8SHAnZQ0WjAPye7TFZxY5fpkd2W5+Q8Y7GcHnKphZ8L6et1Sq6R8uF3rZ6nDTuqMV9MxrDVtPsmlwSfXJCE3y8tivg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etK+P1+c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69BC0C4CEF1;
	Fri,  5 Dec 2025 10:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764929805;
	bh=MaI8IZsaB50roRDHgSsWkLNVdEW09lgAOc08QCyiKfo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=etK+P1+cWGP3K0/B3fDDI4m0zBha9nhnPjfN/GS2c2jPgs9oOANTKRbkZE8NeQyNF
	 Y/eYNsGVrrNrUOq9ceqdr9yOmqZWKAfcBMLTCPUycaIwegBoKvRSPOQKJKiR9ibbMl
	 p7ANoLkCoqh6MOHMvVHv2utr+EV3SOEKWPdAqLtSqDA4DOGPt5I99lVnnPfy8vF5RM
	 a94fvFlUxmFpDqTIxudRgVcHHktSWoHwIXGQSR2rNWoULVlxlo0Y90o4IylybvY2Lt
	 EfCWsCni5P5XHdQTZnUS0ayLNvzCRl+EybMir3CLeqYTYJ3HNCTgim7Ckp8479hc2T
	 cvsVMZekOVeew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4A8D216B3;
	Fri,  5 Dec 2025 10:16:45 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Fri, 05 Dec 2025 02:16:45 -0800
Subject: [PATCH] ARM: dts: qcom: msm8960: expressatt: Add
 coreriver,tc360-touchkey
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAyxMmkC/03MQQ6DIBCF4auYWZcEUIp6lcYQQgcltdgCGhvj3
 Ut00S7/ybxvg4jBYYS22CDg4qKbfA52KcAM2vdI3D03cMoF41QQXF8BY9QpkTTNZnjghzBZSSN
 oqbktIS/zh3Xrod66swO+54yn8/iz2+KQGWv+ZOWtUdoYHNVT916Nrh8SsbJGyutGsvraLhV0+
 /4F2xSEIr8AAAA=
X-Change-ID: 20251205-expressatt-touchkey-1747c503a2f3
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764929805; l=5243;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=bVqnx5maQ2+0asrPWYudZakdqnY0csCZUYY5fznTxHc=;
 b=vV9FXcHwDs8xcyZwCAhkS1lDBXWwNWso6YRMP8HJC1ShPXQo+PQr2Cm/OUqbLQZVwNDiRQKoe
 /c0OqzGawwqDjPvq3UBmBYchzbEnMfM4tAIJk4jvMAr9Iuey168raXz
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Rudraksha Gupta <guptarud@gmail.com>

Add the tc360 touchkey. It's unknown if this is the actual model of the
touchkey, as downstream doesn't mention a variant, but this works.

Link:
https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/input/keyboard/cypress_touchkey_236/Makefile#L5

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Add the tc360 touchkey. It's unknown if this is the actual model of the
touchkey, as downstream doesn't mention a variant, but this works.

Link:
https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/input/keyboard/cypress_touchkey_236/Makefile#L5

Test:
=============
- LEDs:
samsung-expressatt:/sys/class/leds/tm2-touchkey$ echo heartbeat > trigger
// Flashes LEDs :)

- Touching buttons:
samsung-expressatt:/sys/class/leds/tm2-touchkey$ evtest
No device specified, trying to scan all of /dev/input/event*
Not running as root, no devices may be available.
Available devices:
/dev/input/event0:      pmic8xxx_pwrkey
/dev/input/event1:      gpio-keys
/dev/input/event2:      tm2-touchkey
/dev/input/event3:      Atmel maXTouch Touchscreen
Select the device event number [0-3]: 2
Input driver version is 1.0.1
Input device ID: bus 0x18 vendor 0x0 product 0x0 version 0x0
Input device name: "tm2-touchkey"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 139 (KEY_MENU)
    Event code 158 (KEY_BACK)
  Event type 4 (EV_MSC)
    Event code 4 (MSC_SCAN)
Properties:
Testing ... (interrupt to exit)
Event: time 1761059686.899755, type 4 (EV_MSC), code 4 (MSC_SCAN), value 00
Event: time 1761059686.899755, type 1 (EV_KEY), code 139 (KEY_MENU), value 1
Event: time 1761059686.899755, -------------- SYN_REPORT ------------
Event: time 1761059687.113489, type 4 (EV_MSC), code 4 (MSC_SCAN), value 00
Event: time 1761059687.113489, type 1 (EV_KEY), code 139 (KEY_MENU), value 0
Event: time 1761059687.113489, -------------- SYN_REPORT ------------
Event: time 1761059688.764757, type 4 (EV_MSC), code 4 (MSC_SCAN), value 01
Event: time 1761059688.764757, type 1 (EV_KEY), code 158 (KEY_BACK), value 1
Event: time 1761059688.764757, -------------- SYN_REPORT ------------
Event: time 1761059688.817516, type 4 (EV_MSC), code 4 (MSC_SCAN), value 01
Event: time 1761059688.817516, type 1 (EV_KEY), code 158 (KEY_BACK), value 0
Event: time 1761059688.817516, -------------- SYN_REPORT ------------
---
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 5a39abd6f3ce..c4b98af6955d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -52,6 +52,41 @@ key-volume-down {
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 	};
+
+	touchkey_enable: touchkey-enable {
+		compatible = "regulator-fixed";
+		regulator-name = "touchkey_enable";
+		gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	i2c-gpio-touchkey {
+		compatible = "i2c-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		sda-gpios = <&tlmm 71 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 72 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchkey_i2c_pins>;
+		status = "okay";
+		i2c-gpio,delay-us = <2>;
+
+		touchkey@20 {
+			compatible = "coreriver,tc360-touchkey";
+			reg = <0x20>;
+
+			interrupts-extended = <&tlmm 52 IRQ_TYPE_EDGE_FALLING>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&touchkey_irq_pin>;
+
+			vddio-supply = <&touchkey_enable>;
+			vdd-supply = <&pm8921_l29>;
+			vcc-supply = <&pm8921_l29>;
+
+			linux,keycodes = <KEY_MENU KEY_BACK>;
+		};
+	};
 };
 
 &gsbi2 {
@@ -198,6 +233,20 @@ firmware-pins {
 			bias-disable;
 		};
 	};
+
+	touchkey_i2c_pins: touchkey-i2c-state {
+		pins = "gpio71", "gpio72";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	touchkey_irq_pin: touchkey-irq-state {
+		pins = "gpio52";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &pm8921 {
@@ -420,6 +469,12 @@ pm8921_l25: l25 {
 			bias-pull-down;
 		};
 
+		pm8921_l29: l29 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+			bias-pull-down;
+		};
+
 		/* Low Voltage Switch */
 		pm8921_lvs1: lvs1 {
 			bias-pull-down;

---
base-commit: 0ccd3ddf45c93ab06c9b1a9d266dcab1e52bf3d2
change-id: 20251205-expressatt-touchkey-1747c503a2f3
prerequisite-change-id: 20251119-expressatt_nfc_accel_magn_light-f78e02897186:v4
prerequisite-patch-id: 6fdd0efa5eda512b442b885df80774d1a7037df7
prerequisite-patch-id: 12d296f83ccb1bdfb8d06a72e476bf51ae5f4e6c
prerequisite-patch-id: a970acf2080143f41ae0935dd2c57bb71f5bf338
prerequisite-patch-id: fd25fef58503c5e5cf742e79b124948c7f6b98d9
prerequisite-patch-id: 966ae746687ebf8eb29c6185a8909b047e70dbb1
prerequisite-patch-id: 68603a680b24921759425fc289e61fc4435e5ccd

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>



