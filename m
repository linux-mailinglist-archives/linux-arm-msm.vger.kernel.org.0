Return-Path: <linux-arm-msm+bounces-82987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7B5C7DC49
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 07:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2A2A934F888
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 06:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE93E2848AA;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s8SDmFho"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A101D28313D;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763880284; cv=none; b=Nf6WHjoerfHT2r/H3bMLW1vo1KavgQ+HJ/e6vRGsfnk5uF7k5LXu9rnyEDhqfVV3qV3SFxrdNzJWc4yA9S1VEU1CfTnagJpuNgvoEpbjDoVk4UFOd4D9oAFo8IJBclMyek/9MezKxnBGLaGv84ekV2V/UECnzFGBgWkQxdVrRT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763880284; c=relaxed/simple;
	bh=2+2D57vUBJDKAdDzoMNELJCQxPSzsQHTvkfFA03FK70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OBy+PeC4cUxoYDJ2nmJsZlDLhG7I+94KVXZOq0tZ93342ty6dDPPwaAVe2czsdHmSThoeUFnk6J0YnFTkier+L4H/iyCI6jDX/+2mdkfKSXuBtN3aPr3d5gArbLB3GMytHdOcd8iGuKnGGdn8qyLxFPFadwbkbY0gY6Rhl60lCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s8SDmFho; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32F06C16AAE;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763880284;
	bh=2+2D57vUBJDKAdDzoMNELJCQxPSzsQHTvkfFA03FK70=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s8SDmFhoIP76+6IJ2HgbXdQTxxuuN4yn4zgTZfuDaziSr0gpTrw7NP2z50FTy5kHw
	 ILYsqF0pN5c4DrH4bp/aWYMl2Uokq+0uqXAV/QvlG4nvI2LC8gLyoodVhQSbHl0lEi
	 2P1gHKyk80yB8pcOSp7wgnMA+hh/8kXsRFy72AjdDZpvYWu+QqZvSD8Wcdixo8My43
	 a+/EJy+l5sXQZ0JuEd68raZEiDLgFLjjcm6EkW4XzuuCs23dk54UW7fvTuGIafD5d4
	 nVPHBmm3GOGFoN+hZPR6/ZOWdiy0E/QpLRO85kUGooa02iOlWwhY+tpZxUjdZkACN/
	 i53Ea7kLjh7Ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268A4CFA46B;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Sat, 22 Nov 2025 22:44:42 -0800
Subject: [PATCH v3 1/5] ARM: dts: qcom: msm8960: Add GSBI2 & GSBI7
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-expressatt_nfc_accel_magn_light-v3-1-78d198632360@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763880283; l=3530;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=2ICK00hH1Y/N2rJ/MOOdERF0k2Q1yj8a78xAIbTZBmM=;
 b=GIDpc613vT55FqRpJawFEKHmJy86q3X3rXW/pTlAybc57o0nZmiZnPtGDqwsMUd0LJ4zl6ZbN
 LV6HpxAkHgDCeeigIfppASaKEmBdN5YKoPxU3zgpslrX77577aPZwPC
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Rudraksha Gupta <guptarud@gmail.com>

Add the GSBI2 & GSBI7 Node, which is similar to the
other GSBI nodes in this file.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 96 ++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 38bd4fd8dda5..fd28401cebb5 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -149,6 +149,24 @@ i2c1-pins {
 				};
 			};
 
+			i2c2_default_state: i2c2-default-state {
+				i2c2-pins {
+					pins = "gpio12", "gpio13";
+					function = "gsbi2";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			i2c2_sleep_state: i2c2-sleep-state {
+				i2c2-pins {
+					pins = "gpio12", "gpio13";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+			};
+
 			i2c3_default_state: i2c3-default-state {
 				i2c3-pins {
 					pins = "gpio16", "gpio17";
@@ -167,6 +185,24 @@ i2c3-pins {
 				};
 			};
 
+			i2c7_default_state: i2c7-default-state {
+				i2c7-pins {
+					pins = "gpio32", "gpio33";
+					function = "gsbi7";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			i2c7_sleep_state: i2c7-sleep-state {
+				i2c7-pins {
+					pins = "gpio32", "gpio33";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+			};
+
 			i2c8_default_state: i2c8-default-state {
 				i2c8-pins {
 					pins = "gpio36", "gpio37";
@@ -543,6 +579,36 @@ gsbi1_spi: spi@16080000 {
 			};
 		};
 
+		gsbi2: gsbi@16100000 {
+			compatible = "qcom,gsbi-v1.0.0";
+			reg = <0x16100000 0x100>;
+			ranges;
+			cell-index = <2>;
+			clocks = <&gcc GSBI2_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			status = "disabled";
+
+			gsbi2_i2c: i2c@16180000 {
+				compatible = "qcom,i2c-qup-v1.1.1";
+				reg = <0x16180000 0x1000>;
+				pinctrl-0 = <&i2c2_default_state>;
+				pinctrl-1 = <&i2c2_sleep_state>;
+				pinctrl-names = "default", "sleep";
+				interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI2_QUP_CLK>,
+					 <&gcc GSBI2_H_CLK>;
+				clock-names = "core",
+					      "iface";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
 		gsbi3: gsbi@16200000 {
 			compatible = "qcom,gsbi-v1.0.0";
 			reg = <0x16200000 0x100>;
@@ -600,6 +666,36 @@ gsbi5_serial: serial@16440000 {
 			};
 		};
 
+		gsbi7: gsbi@16600000 {
+			compatible = "qcom,gsbi-v1.0.0";
+			reg = <0x16600000 0x100>;
+			ranges;
+			cell-index = <7>;
+			clocks = <&gcc GSBI7_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			status = "disabled";
+
+			gsbi7_i2c: i2c@16680000 {
+				compatible = "qcom,i2c-qup-v1.1.1";
+				reg = <0x16680000 0x1000>;
+				pinctrl-0 = <&i2c7_default_state>;
+				pinctrl-1 = <&i2c7_sleep_state>;
+				pinctrl-names = "default", "sleep";
+				interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI7_QUP_CLK>,
+					 <&gcc GSBI7_H_CLK>;
+				clock-names = "core",
+					      "iface";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
 		gsbi8: gsbi@1a000000 {
 			compatible = "qcom,gsbi-v1.0.0";
 			reg = <0x1a000000 0x100>;

-- 
2.52.0



