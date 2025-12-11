Return-Path: <linux-arm-msm+bounces-85031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CD4CB5823
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 11:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE330302177F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 10:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638773016F0;
	Thu, 11 Dec 2025 10:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9C9yWwO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F2D3016EF;
	Thu, 11 Dec 2025 10:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765448591; cv=none; b=rGK/W3BzrrGe6VESX3kMghMx4ObSZOUX/h3PF0aN0jlGeKSSR3Rd4Dk+mCUj3eChQsueVm1424zaFfpJve9+RLuXYZ/LBExhWUY5/HZNSG0H0w8I4pDVtMzTqOj1GYUTSg+bR92r1byx8SA9Y16MqtS0dozB/Y9fpt4MynrLqQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765448591; c=relaxed/simple;
	bh=cLuEKIbfWtyqS4ucO3ap2OAyMb/6+sZmHMi/FojZCjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fhw2ZB3tVs87TPUAriHynmGfzFfolF/XNmp5cJ7heK/TAW9n+FKxmd8LKQwaPprHt6SiQa6CqlyHDnDlw9qeqXuLM8fzh6CDYpMLUORJtHq9LlpzAjF+tzUAS3BDAfjsGEAuPB2W5dR81SVK0PAfp3WMu9byRFDFRyn8cPwa9xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9C9yWwO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AF14C4CEF7;
	Thu, 11 Dec 2025 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765448590;
	bh=cLuEKIbfWtyqS4ucO3ap2OAyMb/6+sZmHMi/FojZCjM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=d9C9yWwOBRGJo93PW54IRt5BrEk1SPi+YNYMcGCtxJGO/ACRKIlk+4mkVUWpDMYHl
	 q4uxOd4dJEVjqKlnofv8IVNuWl6WIX7OMy0o+sNsmTG52kJKiC0DbMG9TxEy03Op72
	 0AweEHR6GU+ZmoRhZ/YoC3E+a/+KIKLxXmDFrti1SXDPA/UcNK1H0cKh24P8dCwkNA
	 GK+mNwVQZesz2TvGSClehUKwlL0swQnwzdhczwO5RdkfQO7nDyR8Q5Mm5FphMo6WUC
	 S+N48nt8KzZUp7D8twf4KmcDPdB9ksnHlvDO0JC+L8IVO147skExhO0PUnIeD2QghL
	 lReK6Oxsp4vXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A60D3E774;
	Thu, 11 Dec 2025 10:23:10 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Thu, 11 Dec 2025 02:23:09 -0800
Subject: [PATCH] ARM: dts: qcom: msm8960: expressatt Add PWM vibrator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-expressatt-vibrator-v1-1-41bdc47217b2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIybOmkC/03MwQ6CMAyA4VchPTvD5haEGON7GA5jFGgUptsgG
 MK7O+Fievqb9lvAoyP0UCQLOJzIkx1i8EMCptNDi4zq2CBSobjgnOH8cui9DoFNVDkdrGM1KpV
 pfW6yWkL8jBcNzZt6L/d2+B4jHvYl9D9iw4vkstup+reDHU33wA+bOIsjpaxykZm8Od3aXtPza
 Gx/hXJdv7sq1nPCAAAA
X-Change-ID: 20251211-expressatt-vibrator-de557aa8f7d4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765448590; l=3861;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=ISLw8u+aVcL38Og1i02YfdmWTkxiTbCmji9uWmWdQeM=;
 b=1QAwfks1/c7/sv6EAAOantjAr/R5zmQv5mVuyOkbZeiOta7c4NjZmqEjILi5sYph1miZeX7AF
 JTWU0Tj3cFKDsHiz+Ue2OA2pShytIdyQHb5QxSQxqCFmcIXR9LtFILZ
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Rudraksha Gupta <guptarud@gmail.com>

Add a pwm-vibrator to expressatt. Currently this vibrates only at 100%

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Add a pwm-vibrator to expressatt. Currently this vibrates only at 100%

Link:
- https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-express.c#L1767
- https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/motor/Makefile#L5

Test:
=====================
samsung-expressatt:~$ dmesg | grep vibra
[   79.892226] input: pwm-vibrator as /devices/platform/vibrator/input/input4
samsung-expressatt:~$ fftest /dev/input/event4 
Force feedback test program.
HOLD FIRMLY YOUR WHEEL OR JOYSTICK TO PREVENT DAMAGES

Device /dev/input/event4 opened
Features:
  * Absolute axes: 
    [00 00 00 00 00 00 00 00 ]
  * Relative axes: 
    [00 00 ]
  * Force feedback effects types: Periodic, Rumble, Gain, 
    Force feedback periodic effects: Square, Triangle, Sine, 
    [00 00 00 00 00 00 00 00 00 00 03 07 01 00 00 00 ]
  * Number of simultaneous effects: 16

Setting master gain to 75% ... OK
Uploading effect #0 (Periodic sinusoidal) ... OK (id 0)
Uploading effect #1 (Constant) ... Error: Invalid argument
Uploading effect #2 (Spring) ... Error: Invalid argument
Uploading effect #3 (Damper) ... Error: Invalid argument
Uploading effect #4 (Strong rumble, with heavy motor) ... OK (id 1)
Uploading effect #5 (Weak rumble, with light motor) ... OK (id 2)
Enter effect number, -1 to exit
0
Now Playing: Sine vibration
Enter effect number, -1 to exit
[  157.967092] pwm-vibrator vibrator: failed to apply pwm state: -16
[  158.017952] pwm-vibrator vibrator: failed to apply pwm state: -16

Note: This patch was assisted with Claude and cleaned up by me.
---
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index c4b98af6955d..09443df0fdce 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -87,6 +87,35 @@ touchkey@20 {
 			linux,keycodes = <KEY_MENU KEY_BACK>;
 		};
 	};
+
+	gp1_pwm: pwm {
+		compatible = "clk-pwm";
+		#pwm-cells = <2>;
+		clocks = <&gcc GP1_CLK>;
+	};
+
+	/* TODO: Vary the frequency besides being 0% or 100% */
+	vibrator {
+		compatible = "pwm-vibrator";
+		pwms = <&gp1_pwm 0 54347 0>;  /* ~18.4 kHz */
+		pwm-names = "enable";
+		enable-gpios = <&pm8921_gpio 4 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&vdd_haptics>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&vib_pwm_gpio>;
+	};
+
+	vdd_haptics: vdd-haptics-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_haptics";
+		gpio = <&tlmm 47 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&haptics_pwr_en>;
+	};
 };
 
 &gsbi2 {
@@ -241,6 +270,21 @@ touchkey_i2c_pins: touchkey-i2c-state {
 		bias-disable;
 	};
 
+	haptics_pwr_en: haptics-pwr-en-state {
+		pins = "gpio47";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	vib_pwm_gpio: vib-pwm-gpio-state {
+		pins = "gpio70";
+		function = "gp_clk_1b";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	touchkey_irq_pin: touchkey-irq-state {
 		pins = "gpio52";
 		function = "gpio";

---
base-commit: b066d7751f99fabaa07939006233781536ab16e5
change-id: 20251211-expressatt-vibrator-de557aa8f7d4
prerequisite-message-id: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
prerequisite-patch-id: 8de4de7909722ccaf385c4224f25a623eaa72c28

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>



