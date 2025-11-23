Return-Path: <linux-arm-msm+bounces-82992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED78C7DC64
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 07:45:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 784024E18D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 06:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5862874F6;
	Sun, 23 Nov 2025 06:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSd9RH7Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA83528507E;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763880285; cv=none; b=dmCTwDxSjrHvt+/mvLlzRwxOvCoyBKtC2NJQmF0rbimZ5mxo3viq5z5ghOXVH6CDi5lHaRwN7+InqFxeIOPYu0eh1zPO8dMQ9pQQDvmU8x56C27CrB7fQDlIQuRcWwBe8Nry5SK6gXuhKl98UDc8ysg1cfA92RYFWE85XFfICBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763880285; c=relaxed/simple;
	bh=w6ZDrirmRdZtRFwRPnTP6XJR6YOjZZOZRETVfIKJyAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jDuURgBZWP89eP+5Dw0vOcz2aoEM8BahRENAlWVsvC+DaEE7IUF32csHrpDUg22uUqvoKS+XnRH42HGnVuPk6t3TGofyiKqU2shn+v2IADldoczYZ30oDcJchG3bdpRY9Oa7kFEEVrqNTqBGZrNfT1VqywtRv3ZAyD0aGZU3YXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSd9RH7Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50F06C19422;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763880284;
	bh=w6ZDrirmRdZtRFwRPnTP6XJR6YOjZZOZRETVfIKJyAQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SSd9RH7YPczbHPQEc5qEkEFrolvrrIgrtZEx5CT8l6hZBOYZjzwpIEwP+0fyhtcUv
	 5NRkhRqkQpyKeG/mpRvBHanpIwmLvt7YqwqTXemlhrajGGobPYMiP15oV3wDd6rakn
	 FVFdf4/0bO/r9t9FhZlvZG24UUZyWwpEvoMRyKrKJEE0Q6JoQBRj4sFWphy03Jo+6Y
	 sZY91hlyVt4RzG4xX5osvSnvUqQjNTGSdoH92Ga2K6pZ0gx25H/sJkmf2xLxTET9rq
	 Pe7fxy6R4TBFBZjHTpXzP9iORUX2oMj47zKS+EqjAj+nM6uBMdYrEE5gGJiW4NuSDX
	 T+8HtA/ckdbYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4293ACFC518;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Sat, 22 Nov 2025 22:44:44 -0800
Subject: [PATCH v3 3/5] ARM: dts: qcom: msm8960: expressatt: Add NFC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-expressatt_nfc_accel_magn_light-v3-3-78d198632360@gmail.com>
References: <20251122-expressatt_nfc_accel_magn_light-v3-0-78d198632360@gmail.com>
In-Reply-To: <20251122-expressatt_nfc_accel_magn_light-v3-0-78d198632360@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763880283; l=1759;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=4tUA2e3lrT15JGSUIuN9jYYbDGE8RLLQOZp87biSr04=;
 b=elpCTggUpdmeSXJAxlNuwDwE/e5dQikpYtAJGqzgFOcunWcpmFVkWb98ncaB7NghUC21baW5B
 siLqByeP6BeBHtZ7nmbAkqXag2IOb4aYs2znqfWbiZHRRezZ/+cDm2N
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Rudraksha Gupta <guptarud@gmail.com>

Add pn544 NFC chip

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 8d75ebd7976c..4f9b59db7bc3 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -182,6 +182,22 @@ touchscreen: touchscreen-int-state {
 		bias-disable;
 		drive-strength = <2>;
 	};
+
+	nfc_default: nfc-default-state {
+		irq-pins {
+			pins = "gpio106";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		firmware-pins {
+			pins = "gpio92";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
 };
 
 &pm8921 {
@@ -195,6 +211,14 @@ prox_sensor_int: prox-sensor-int-state {
 		input-enable;
 		bias-disable;
 	};
+
+	nfc_enable: nfc-enable-state {
+		pins = "gpio21";
+		function = "normal";
+		bias-disable;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		power-source = <PM8921_GPIO_S4>;
+	};
 };
 
 &rpm {
@@ -442,3 +466,24 @@ &usb1 {
 	dr_mode = "otg";
 	status = "okay";
 };
+
+&gsbi7 {
+	qcom,mode = <GSBI_PROT_I2C>;
+
+	status = "okay";
+};
+
+&gsbi7_i2c {
+	status = "okay";
+
+	nfc@2b {
+		compatible = "nxp,pn544-i2c";
+		reg = <0x2b>;
+		interrupts-extended = <&tlmm 106 IRQ_TYPE_EDGE_RISING>;
+		enable-gpios = <&pm8921_gpio 21 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&nfc_default &nfc_enable>;
+		pinctrl-names = "default";
+	};
+};

-- 
2.52.0



