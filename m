Return-Path: <linux-arm-msm+bounces-82830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D02C78E56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3BA2C353E58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DBD34B41E;
	Fri, 21 Nov 2025 11:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2jHWBUK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C8C3469F6;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763725485; cv=none; b=KrFdNQPE5bZwk9W+wp53EJNU3NOwWfLHtd9i/4/ClYbsGC5VkQ9Cyo86YenJUuZ+708ghpd3N18OhKDmRLSRH+3lRNIxENQtiFXkh0+IYgd0eO0Fu+Txjba8EUvPB0xdPwRXFeCDa/py75npLj2ri+/Bhj601aCOp2BwaD5LWBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763725485; c=relaxed/simple;
	bh=sdtKId5c8cABPmOnKH4sv3Wzx3eo2S0G/P/s1zQ1QTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jy9RtgkOk5SJGbPC09Ssxak05F5rx3wzDJ0Z+vwzYpic9LO8Ue3o0rV6yxj2e6Qu1u4FMYPCbY6C9Tw8xiYazfDDvUWAM8PP+zDrAYDj7GLWkgnbuD+H5FHsOAj86oRXUwmc+SWL78Rr57+rOEYE7ALHqp7a8TlHTrXTTHnoOkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2jHWBUK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46170C116D0;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763725485;
	bh=sdtKId5c8cABPmOnKH4sv3Wzx3eo2S0G/P/s1zQ1QTY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J2jHWBUKXfcxopoHerc5d6dPTv0LlI60cpmOjwSpxZSiLqU09H68mGAVLce7PvlNl
	 e4E7esYsWy6tsi0bxfSWCq+qU+0EHKFF1PlkgA4Dhu1TJacowRqdaFQE45JLdGkMoR
	 tteLO5sdvU5YPR4Q/Nby8vql5lD6Yh6zzP5q0m4UyWgppBZlTLwmZPfkejZvQ2lLKG
	 AlsB3j0OPjTPDiwME/BmdM4A8o3RANpXGoucKE5OuqO7D/1Awkr74FzXzz+kzXnL79
	 er/ab4AQbDGnTMdpPloBcAkZj/TQsE1yrHgTCYEbIDDWxm347IlRRfkgijWzAJvYdn
	 +pPq153HKNK0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CED0CFC266;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Fri, 21 Nov 2025 03:44:46 -0800
Subject: [PATCH v2 3/5] ARM: dts: qcom: msm8960: expressatt: Add NFC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-expressatt_nfc_accel_magn_light-v2-3-54ce493cc6cf@gmail.com>
References: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
In-Reply-To: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763725484; l=1792;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=ywA6A/wAd3sgOXwQKxeyI+0SdP9uGLkdoUuFJZ9N9XQ=;
 b=KgdkXCFJyXfp+vFMttsgXJwr8IaSOs5WruELVVpegkVAEV36a+GeUuyq9HuMmrb6B2VJ/H1+x
 7y5Va4T2aCnDeQfLf0Mdxm/xuBwmTl2Zi2oOvUxHzrESZsUrUDJ3uDd
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
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index b68da548a985..0d6d38b57f00 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -183,6 +183,22 @@ touchscreen: touchscreen-int-state {
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
@@ -196,6 +212,15 @@ prox_sensor_int: prox-sensor-int-state {
 		input-enable;
 		bias-disable;
 	};
+
+	nfc_enable: nfc-enable-state {
+		pins = "gpio21";
+		function = "normal";
+		output-low;
+		bias-disable;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		power-source = <PM8921_GPIO_S4>;
+	};
 };
 
 &rpm {
@@ -443,3 +468,25 @@ &usb1 {
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
+		interrupt-parent = <&tlmm>;
+		interrupts = <106 IRQ_TYPE_EDGE_RISING>;
+		enable-gpios = <&pm8921_gpio 21 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&nfc_default &nfc_enable>;
+	};
+};

-- 
2.51.2



