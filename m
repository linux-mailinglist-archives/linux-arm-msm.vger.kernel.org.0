Return-Path: <linux-arm-msm+bounces-82829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C74C78E80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 322DC2D2A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3959346E7B;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlstNGf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DA8337BB3;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763725485; cv=none; b=S8Rpgwp9qtJCk0y26ahtSGb3pgts5FZitoVkvw0WgAYejpPnmGcCxiihnVhHEG98ZWE8hyoXOQfRCWSdeQhR7N4753zF2l+rGAX0r6kWqXtt7l5lJ9N3W7CbqabALS4/Hh8ofRZQLiJVkxG8QPW9GbVnv/keTqyGtRSoGlLX8Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763725485; c=relaxed/simple;
	bh=E+U1wCwAaGFvRbrBt2Yahg/joX2rqj+5DkNks9CKyks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pHiX3TejpABw0352ZE6fuX9e2LZDeUHZ9hgSh99r289/84ckxe0JbuhXClyLLfPhKHVr7LKyHY1tMxvO/A03ARKiUXYoztCXSdd8m7pIalKkXOn72cY/Uq3ixEhqYaTiSR/VP3+neIFI3mK9P5zu6+yWqQaLuN7rOQuzCsVDJ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlstNGf0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3ACD6C4AF0B;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763725485;
	bh=E+U1wCwAaGFvRbrBt2Yahg/joX2rqj+5DkNks9CKyks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RlstNGf0ytX8o3OTEubR47bXA/nDU3BOMQrzLRHphtlKFRxVCXA1moyFQda4nvEf4
	 CZ27mPHCTZB0jdC9BZBc4ovVCqRlOijrJgo8GYywmNEABfhhnn/7TH04Jd1+kFced7
	 CuxvVkzE3doiiYvUINBp0ygIuqS7pwm5FlNIysasP9ZYi9Cc29PEyiJYoI3s718zM+
	 EiG/hrKbwu5vrNVZXQjKrxPtCj4K0urFEwk4XIGsD/yxocff29Aitd9etk69cesLAs
	 99+A0GVRpLoVFkzDy8IPrfPcAh7s2RwLfvp0iDqQ+Tc5fhNnP1h028W0kq1rnd4yQ9
	 Ltx0nADT9HGMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEA1CFC268;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Fri, 21 Nov 2025 03:44:45 -0800
Subject: [PATCH v2 2/5] ARM: dts: qcom: msm8960: expressatt: Add
 Light/Proximity Sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-expressatt_nfc_accel_magn_light-v2-2-54ce493cc6cf@gmail.com>
References: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
In-Reply-To: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763725484; l=1593;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=fp56hpEySbYXEo/V+MxITO76io+YujyO0uohNV0UvEM=;
 b=oKWV+NBFp2+L0ZLUEwhhcyYdcaSafPzXFKeikVAe5qA0sDtTWMhijnwT3zaSww1V3zqSsZpoA
 IqaaZF3Cy2VDvalvGPtsC8YVZEQg5ldFv+qwNBuSPuQRL3p2xtm/ATe
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
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 5ee919dce75b..b68da548a985 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -54,6 +54,32 @@ key-volume-down {
 	};
 };
 
+&gsbi2 {
+	qcom,mode = <GSBI_PROT_I2C>;
+
+	status = "okay";
+};
+
+&gsbi2_i2c {
+	status = "okay";
+
+	light-sensor@39 {
+		compatible = "amstaos,tmd2772";
+		reg = <0x39>;
+		interrupt-parent = <&pm8921_gpio>;
+		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+		vdd-supply = <&pm8921_l9>;
+		vddio-supply = <&pm8921_lvs4>;
+
+		/* TODO: Proximity doesn't work */
+		amstaos,proximity-diodes = <0>;
+		led-max-microamp = <100000>;
+
+		pinctrl-0 = <&prox_sensor_int>;
+		pinctrl-names = "default";
+	};
+};
+
 &gsbi5 {
 	qcom,mode = <GSBI_PROT_I2C_UART>;
 	status = "okay";
@@ -163,6 +189,15 @@ &pm8921 {
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

-- 
2.51.2



