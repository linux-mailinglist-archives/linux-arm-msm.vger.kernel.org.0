Return-Path: <linux-arm-msm+bounces-110032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJQqB/KkF2oTMAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 04:14:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ED75EBB77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 04:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4512F3030062
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 02:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CBF2F4A18;
	Thu, 28 May 2026 02:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0THgojI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F072F361E;
	Thu, 28 May 2026 02:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779934422; cv=none; b=ZBURECEvBD6s1qJIgIHdMk3Nhbz6AFhsQBMavREF87qN0NOJVgC1fraXp1RIXZZ0Gj669kuumhYBA+CjAFNaY3EXl73DF9ar+mKQ6oWzgLdnFiStHZtYYbQEmBBBIqpCzOO/f1BcYLM9IDQ4gucTC7sl28r6cpYx0WZc4pmZN8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779934422; c=relaxed/simple;
	bh=l1a2/mDB9FsmByRZHT5JzE46+y6/2ln+HvPITWNrDwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N2H6sQUzXMYTZ0NJyD38Oz4HLKKjTuSTT08zW9mMyaRebQWBHX+Of4iDs6PXjDp3Nn9kC0XvR52GaFY0D8Lo5C9VnFqN/cFTJ0ISQvTsKkK5hFOEB72ihBBvKimXwvB4bas0Pz+2lmeiOYxAfp+KuwVrWKxCvLfX1aDt1fYFcp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0THgojI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 639AFC2BCB3;
	Thu, 28 May 2026 02:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779934422;
	bh=l1a2/mDB9FsmByRZHT5JzE46+y6/2ln+HvPITWNrDwU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=a0THgojICdJaB6Oij6F1mPVxF7/NSdo8YExBCMVXqrQp3Nm4bs7QOyDC3x0sOOSFX
	 eXffoI7f3M1JhAqnHsxy0OYpE9rhzRcoD2+zIl/kvAx8jJMg3CvZkzB9CB6ghJgkxc
	 E6sV5H5gBirPwkYWysGWTQ0lXUVFX76S4+o9GPGqbVOu+I2/ssijfrGrvl6cs0WKEP
	 Sboa9gJl3sogAAxMnAJe17eQLVYp3Vngl28m/n5MNSujbe2gB2nTQE/GTkmY1db7xj
	 cJuXqpZkTNJEodmkDMUWkGY73EFNcOWaJEV3LicB/DNX66Nt87XcNuDJI20Bx1Hq5t
	 Bfj5gVBtufUng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A594CD6E44;
	Thu, 28 May 2026 02:13:42 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Wed, 27 May 2026 19:13:41 -0700
Subject: [PATCH v2] ARM: dts: qcom: msm8960: expressatt: Add
 coreriver,tc360-touchkey
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-expressatt-touchkey-v2-1-049dca41fc3a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OQQ6DIBBFr2JmXQwgxuiq92hcIB110lpaQKIx3
 r1U982s3uTNn7+BR0foock2cBjJk30lkJcMzKhfAzK6JwbJZSkkLxkub4fe6xBYsLMZH7gyUan
 KlLzQsi8gXSajp+VIvbUnO/zMKTycS+i0R2bsNFFosljlHH7eSD5Ytx5lojjEv3+jYGmUUl0tK
 1P3xXWYND3zFAztvu9fZL55KN4AAAA=
X-Change-ID: 20251205-expressatt-touchkey-1747c503a2f3
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779934422; l=5127;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=QKeXmWv32UYGOnYCe6uOdzYUC+QSTTFeTGr6mUqA+oU=;
 b=KtaXdbdrs6N2DxKOXa8+rKWRxO8BoT+09CU2hHO8sm5itm2N3tRFNhPx45NgTaHcP4MirEGtT
 kwu4Iw9uH07ACUrK9BCpSDo6UHQTRp5yFjxY7vBcd7ptj/10wq2T8W8
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110032-lists,linux-arm-msm=lfdr.de,guptarud.gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,0.0.0.20:email]
X-Rspamd-Queue-Id: F1ED75EBB77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rudraksha Gupta <guptarud@gmail.com>

Add the tc360 touchkey. It's unknown if this is the actual model of the
touchkey, as downstream doesn't mention a variant, but this works.

Link:
https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/input/keyboard/cypress_touchkey_236/Makefile#L5

Assisted-by: Claude:claude-opus-4.6
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Changes in v2:
- drop status = okay
- reorder pinctrl-{n,names}
- Resend of v1: https://lore.kernel.org/all/20260503-expressatt-touchkey-v1-1-f7dd5db64e0d@gmail.com/
- Link to v1: https://lore.kernel.org/r/20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com
---
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 5a39abd6f3ce..5a3d88e31cf5 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -52,6 +52,40 @@ key-volume-down {
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
+		pinctrl-0 = <&touchkey_i2c_pins>;
+		pinctrl-names = "default";
+		i2c-gpio,delay-us = <2>;
+
+		touchkey@20 {
+			compatible = "coreriver,tc360-touchkey";
+			reg = <0x20>;
+
+			interrupts-extended = <&tlmm 52 IRQ_TYPE_EDGE_FALLING>;
+			pinctrl-0 = <&touchkey_irq_pin>;
+			pinctrl-names = "default";
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
@@ -198,6 +232,20 @@ firmware-pins {
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
@@ -420,6 +468,12 @@ pm8921_l25: l25 {
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
base-commit: 3131ff5a117498bb4b9db3a238bb311cbf8383ce
change-id: 20251205-expressatt-touchkey-1747c503a2f3

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>



