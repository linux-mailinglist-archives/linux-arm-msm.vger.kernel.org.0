Return-Path: <linux-arm-msm+bounces-82989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E60BC7DC55
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 07:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 564B93AABF8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 06:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D190428507B;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+V0JOUR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1099283682;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763880284; cv=none; b=PFT5ZJIXVcsmG2YSuwpNZJzd4KkGCf7WMqFKn5IfV4Ulv98CJeNNRPjFbETpqal4zmix4JwgrcN6K7KcIe3FgdjR8SorBYVAMsR5899GA/wGkIYShUxgeBiKBwBEVK+OsvRd2Z28fshznC3xGSXEqNekxNC7REXu10PwPSbIRsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763880284; c=relaxed/simple;
	bh=u9aqNiA6Nwt1ajTqNsGO/hPjY+Fe7Gxd2kkZFH/hsZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tAc84oZsRdxaqyUO+Yw2XJBJ3FssIKTjYebsL8Cr/y3H6krFw0uV6X/Xyb/f7tbHDPv2ZCNn1WS0TEZ6keaEo6yVhtNhVvvik5f4Fe1QAiaMKdVl6T+vuEg2rgWSJdBKynfglhAnDh77CpGaT0jOHyWkpeGwNvnUTUfC4uA1BW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+V0JOUR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41B44C116D0;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763880284;
	bh=u9aqNiA6Nwt1ajTqNsGO/hPjY+Fe7Gxd2kkZFH/hsZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=T+V0JOURqb45ROFIOb3fZ84SXvGNIIlN+2IjKvW36lxQCFb2AErtLeZ/yMCH+MTLP
	 TlexPo9Nmj7+ojogo2BeAWp9D+PPUAzOTVxIGg5PvFEOjnLUy+i1A6RiILOZLX2amj
	 B3PVyP8AtHwE6NXecAIlcGNzMLbsgctkZ3BLHIu3pgBIB3N0YcQbcQPriodBIy33FF
	 7a2gstgp2q/9M5VJvaMhrv1s714BymZd7NcNeTB4gcylZhCaIfG8Tpo8oSjPW+OumJ
	 mCIq4wDMT5yryaQ32fw18xT39CTH4YjAHkcmxo8BRGt1jikvU4OBEs2/rzkudESwNS
	 prC/vcibfeEwg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B41CFD313;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Sat, 22 Nov 2025 22:44:43 -0800
Subject: [PATCH v3 2/5] ARM: dts: qcom: msm8960: expressatt: Add
 Light/Proximity Sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-expressatt_nfc_accel_magn_light-v3-2-78d198632360@gmail.com>
References: <20251122-expressatt_nfc_accel_magn_light-v3-0-78d198632360@gmail.com>
In-Reply-To: <20251122-expressatt_nfc_accel_magn_light-v3-0-78d198632360@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763880283; l=1637;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=yZG1sZBCe3vOBZ7yKg0s6tW7F4POpCoTYx3Ig3XEUjI=;
 b=yUo/JTPB7nKxIOQKKayP3rdVh732xy1uVklwBjqYd0HFjnIvL8MGuIogHLxojduLRypDWMTGI
 EaOF5mKCynWDB5ZaqoQtVfvIQoRA7OPKvAUzUNmsR2fJwxq5fSVm8Yw
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Rudraksha Gupta <guptarud@gmail.com>

Currently the Proximity Sensor doesn't work, but light sensor does.
Left the proximity sensor as a TODO for later.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 5ee919dce75b..8d75ebd7976c 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -54,6 +54,31 @@ key-volume-down {
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
+		interrupts-extended = <&pm8921_gpio 6 IRQ_TYPE_EDGE_FALLING>;
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

-- 
2.52.0



