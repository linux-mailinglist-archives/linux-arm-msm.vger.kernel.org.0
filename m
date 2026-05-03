Return-Path: <linux-arm-msm+bounces-105617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFuoLC6992m5lgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 23:25:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B82034B7806
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 23:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80AF130011AC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 21:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BADF3A641B;
	Sun,  3 May 2026 21:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKaSdiBa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BA53A3E8B;
	Sun,  3 May 2026 21:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777843497; cv=none; b=LNRDU1WbZ2IxGInvgu5Gp+113Fk+El5sJCZAY4aWig2EoDZI0zQsb2lAgjP/1zmVDfo3YKoJc0gNkPiL534TejcL+XRrqyggWE6boP1tjHdKh9IfAROXlfzMGWLbYfZFSO2TzigkdiipkWImXZyelT/Tup1p4CUiAEqn7SXqkU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777843497; c=relaxed/simple;
	bh=MaI8IZsaB50roRDHgSsWkLNVdEW09lgAOc08QCyiKfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r6MV+7t1rUkPa2+cg0PM5exgrB8Xo/qfDOLS5/9KYNhAPx2JMjuZecJWMtgCCFzzVwX5EOjMu2d9vnqMI1oOr5eJ1mURQRyyuYqs6Lwk96KNweQrR+rON9N8U7ltfT0sHs3jAcGxnI1TYlw/K23je+GMFe78S3RiyXzJkE9o088=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKaSdiBa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6046C2BCB4;
	Sun,  3 May 2026 21:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777843496;
	bh=MaI8IZsaB50roRDHgSsWkLNVdEW09lgAOc08QCyiKfo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=AKaSdiBa21sBIozRby+ppvyIvdA3s5wyWQSKGCL+1x7fL5Sf1nnY3UTxR1BQruvpE
	 ZZFtINREKV2aGor0SRz+B3ijHsV/SFInbz2DYurYGEVKrsBo4efgz6qmbeWSRHDapN
	 ONOOD/dVguqIk04Ck+bK4ALSnfZSeLGbpUeMA6GglmD+fE96I4R28VOvK6oaSHPU0l
	 A8GMzgsqZL5W/CnU8ZgEyigCXuOkhyJR8jjXKU58Jb4AAAajAsCYdr11E3V4/eJ6GO
	 Zqe/XFGqnn558TxTtPvyu5L056AQkBPEmBtm+x+8qGxXCbiQg8LWYUGYI8cvW5OfUa
	 GN89MHWV2ounw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34F4CD3427;
	Sun,  3 May 2026 21:24:56 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Sun, 03 May 2026 14:24:48 -0700
Subject: [PATCH RESEND] ARM: dts: qcom: msm8960: expressatt: Add
 coreriver,tc360-touchkey
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260503-expressatt-touchkey-v1-1-f7dd5db64e0d@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777843496; l=5243;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=bVqnx5maQ2+0asrPWYudZakdqnY0csCZUYY5fznTxHc=;
 b=yZ0PEuekOalrlzaGvBnW1A/GLx9mmN6pRqQ9tYU+XIh/RjcNhnjr+j/ZFWkqbEwvm7tmuEyCr
 RIohpm0judADFOJnQ5quFeFssZHzCQJ/Rt/4n3B/1WqFvjecsN+RoFf
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Rspamd-Queue-Id: B82034B7806
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105617-lists,linux-arm-msm=lfdr.de,guptarud.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.20:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

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



