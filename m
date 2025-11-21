Return-Path: <linux-arm-msm+bounces-82828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B5DC78E7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id B8DF12B985
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE85234677E;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QsLUheyp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C04E257848;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763725485; cv=none; b=exhv4cfUtVzMmSJVwTTefKg+6MwW/PlDWl/LDC1oekJ8WXgE+mLfK0hDSAO453nn4hXW++Lx1WIMu2IkllXLcugq6DYmO5CXQ5PsTNbsc+HvGb+KsHogLzww0zLBR7wTechC21+rUv3XWP55qgsMLA5eCfQo7Tdc4S2vopfgHCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763725485; c=relaxed/simple;
	bh=PeVl8m+NO/vzIsEALaCAyt5yzY/3V31Np0fxUGoyoDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fgOf/YOOSPQE5d7OIZVZU22k2MJXhwoG2rZ+vwhi0B/oCx1qxKe2NfPxYGta7e/ZeD1XWxwC+O9XpjjoywwV0oR/YwdF9MyHAJrEFnx5WRagvJmWd85ocbg0xuCJmXS3ZCXr38zJb/SXf4gMEhzMiIe79jD9I3nGsCiSzXf3vWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QsLUheyp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30205C116C6;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763725485;
	bh=PeVl8m+NO/vzIsEALaCAyt5yzY/3V31Np0fxUGoyoDg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QsLUheypV4rYqvlviWtrF5fZFqrs3oVJsOL3HsmjRqljM7Ky01aZvt9crZGMtsI5E
	 UvlEZNPHF/SOAs1OtzhkaQmA5OD0qLBJQgqVAJAEz8pkPoOxNpnfZhnoPGnGjwm2gU
	 8wNvsLMakpQ40gi1MwM2jxdfPbG6nXIX5ox+T3xHM7Mcl74ryJKOqxrDNnA96dd8bm
	 8n1FoXkAoxdOMhfK4ML6c2yeY6f01i/VFnCcpL8/EBZgjafb54ZOsQDqjS0ZBf38gM
	 7ptQV7KIivfp5PL8tZ0UxrnRmLVCMRgaEXoGxDPfQ9KoxpkwFl+7dK6SfmvMsUN2lb
	 bOUC8clYgi/yQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2056DCFC267;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Fri, 21 Nov 2025 03:44:44 -0800
Subject: [PATCH v2 1/5] ARM: dts: qcom: msm8960: Add GSBI2 & GSBI7
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-expressatt_nfc_accel_magn_light-v2-1-54ce493cc6cf@gmail.com>
References: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
In-Reply-To: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763725484; l=3469;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=4Nk6O6uyWk03dAwLPIm6TRyhydcsvG1lXk8mOEIf+Ys=;
 b=HA4FZgNv2HotnBNWd68xx5GWlMN6YDE3UYuatylpRvt+e1CacR+h4zqahIXtbN9QSjYacrWmj
 aZqcsR1nuP1CSpafw4aU+BId9ZjvD7I+kT8QJK7EnZifmdYj4KqwuQK
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Rudraksha Gupta <guptarud@gmail.com>

Add the GSBI2 & GSBI7 Node, which is similar to the
other GSBI nodes in this file.

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
2.51.2



