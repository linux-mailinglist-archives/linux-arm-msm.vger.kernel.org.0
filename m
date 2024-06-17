Return-Path: <linux-arm-msm+bounces-22939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6530990BCE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 23:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02D3CB22F8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 21:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73C01946D0;
	Mon, 17 Jun 2024 21:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zb6TSV2c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5F61741CA;
	Mon, 17 Jun 2024 21:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718659398; cv=none; b=HdoNG7mWaqX4q3eyCitIwa3DMtsnPhukfp6+SjbLgv5ef4cKGV62MPPq1FmpsUAq0Uvb7/yr0jBsx72zD23EBV1ZdiXqDNTngj3jeVqc9z7QgEiczQiZG+NwTpxeUZ+IcpM8XfTgadyyKidqPTM7E85xlDBgSYMr4A1hsmC7NEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718659398; c=relaxed/simple;
	bh=z9FzM7GZ7wU3KOkO5XN4WXRsFslFP8KgxePMoAGxEdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jCW5pw/GJyuUBHmNNlATwrVUI20Pjkr3ywzErtLEPkWYLijpl1ZbKwt2sUA+ZRRhSz1Rni53xm87vCpWLt6mXYhwrMPGKHnicgDrN9/uWir00yOSY4sqgulsvlJZyzZS7ppD/ct19bkaESZaaA1eCAJnG+fe1/hNNDyO+qlW5NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zb6TSV2c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19EE1C4AF1C;
	Mon, 17 Jun 2024 21:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718659398;
	bh=z9FzM7GZ7wU3KOkO5XN4WXRsFslFP8KgxePMoAGxEdQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Zb6TSV2cN0yW6QUs3w7Pz8el6/QiyHwUZ5b+ixuKZWVkWG/aM63PqaQIEf5PC/US8
	 0PyBkieEVG4rhIB8/MpkWhjvICPTOyXWuLLnXlQJyCwFjmHjfNjbSV2kInimJiuLq4
	 j9E+xZC3y+2IwcFH2Nj3EbVpQgGEdUuMojqUfZWmQwK4Vz2kv9/FLFHzPdGOu8LV7g
	 BvYON0bak807rR3fo3nwmmyWChn89iBiLku+BMk0RwHPSBUHl/z1JqcbVQLCFUNIqI
	 5+sUyL4Q4hN0ORQ+J76Uh6E75S5p5WpP2K8m0N/CNZSoQJR3EI4gThQFuML91YZ6qG
	 ywN045gaW0P7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02239C2BA1A;
	Mon, 17 Jun 2024 21:23:18 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 17 Jun 2024 23:22:27 +0200
Subject: [PATCH v2 1/3] ARM: dts: qcom: msm8926-motorola-peregrine: Add
 accelerometer, magnetometer, regulator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-peregrine-v2-1-c8835d2da7af@apitzsch.eu>
References: <20240617-peregrine-v2-0-c8835d2da7af@apitzsch.eu>
In-Reply-To: <20240617-peregrine-v2-0-c8835d2da7af@apitzsch.eu>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718659400; l=2907;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=mj4yxzOm2d+J3umJgLBBLCdJ6UtTa0NpoUWMAtyqNkY=;
 b=cEbuwgEsPA7k5I25OSNgvvgBVtnZm+tO83xlkrVBYyxVG/Gv9kA2EPiXYOHyrbMJXVidIeZ3l
 poCdd9l/2EHBF7/WHqFeBM04bT9Obc/KjI3kpQSzL6XQGDLCXG5eBFp
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Add the accelerometer, magnetometer and regulator that are present on
the Motorola Moto G 4G (2013) device.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 .../dts/qcom/qcom-msm8926-motorola-peregrine.dts   | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
index 0cbe2d2fbbb1..50ae3cfc95bb 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
@@ -68,9 +68,60 @@ smem_region: smem@fa00000 {
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
@@ -278,6 +329,40 @@ &smbb {
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
+};
+
 &usb {
 	extcon = <&smbb>;
 	dr_mode = "peripheral";

-- 
2.45.2



