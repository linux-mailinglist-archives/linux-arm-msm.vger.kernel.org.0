Return-Path: <linux-arm-msm+bounces-63067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F208FAEDCED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 14:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEED71886F6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 12:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB351289E2E;
	Mon, 30 Jun 2025 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hiVxAXGX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A883328541A;
	Mon, 30 Jun 2025 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751286909; cv=none; b=YfLP0XNjwzgDO7iCg2WaBXp8+Ga1dp8AuPNM3+Pfc6MB81rG3wH9GYi+YCwkNWyTG0S3OHsuSN3mKgrAK7gQcsNpvxUk9X8kcWO4RECIyb8b24wYAj4Nv3wIR+V9E9rTR37KX9lpDJh/sf2i2Dy2+db8ME1lYBeHKbCoce/ZjzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751286909; c=relaxed/simple;
	bh=YW0aYGk44OBGXMXwnXBPhhKQgB+lh/nINEBWmVaTupA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXNCEAt+SZGE7WA/y8VkOS2ruEsEJPmO779x/djqnu/5VOyttotGjosjDxHHVozwigb94UZzb0EUHPun4wRCcKbZy4RWMM/gyp7TfyB0STt0MdfknpwxPCMubKpLhlMc2niASTZOP32wtRl12Q3tEv0DEv0O90MrI2+musIrz7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hiVxAXGX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49B71C4CEF0;
	Mon, 30 Jun 2025 12:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751286909;
	bh=YW0aYGk44OBGXMXwnXBPhhKQgB+lh/nINEBWmVaTupA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hiVxAXGXQ8H6BdtyN7EFwnMXb/XPGc38WjYW/v2yr3Mg5RweO1YrjAnhtBePaVlia
	 RRD8C1GhKY2gIjKTo225BRlMA3BiErPevvKFHwe/MeQNw0PrdLXr7ulDQ9SZaylhlU
	 B0DfAphss8VK+6PFrDxdGY6+Z74IeQbRoQ10V57sCzaKP5uyQPvIuUCrbp0pN4k8zK
	 SewWjLvTv0219qzLrQ/n6MClsLjxRA8iMMCNc/1iqpeWB/nc0eKvJ34eSUzCfc+mV2
	 fM2Ah1mhUhkNfTSF3+5rTG/WQc4y1C/cyoT/2A/SyXpJRSnmv97Wi/OoZcC5MXSSg2
	 /9g0qsKa06fjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AADEC83035;
	Mon, 30 Jun 2025 12:35:09 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 30 Jun 2025 16:35:02 +0400
Subject: [PATCH v6 3/3] arm64: dts: qcom: ipq5018: Add GE PHY to internal
 mdio bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-ipq5018-ge-phy-v6-3-01be06378c15@outlook.com>
References: <20250630-ipq5018-ge-phy-v6-0-01be06378c15@outlook.com>
In-Reply-To: <20250630-ipq5018-ge-phy-v6-0-01be06378c15@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751286906; l=2285;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=hFpy0osU/0n+A52muRC0D3Drst6JCZAX5hmtJZDrLks=;
 b=IbGpuJzXMc5BTx2N1rUvDYbw3TZRyzsQvQdssmrmVKxNooxUSRgWjgh4ug1nAPUDTG89lVvt1
 4/MbsLOMbeADHLvXCxRNLeck65T452aoe/sE0r8U3a2ZISQfq7/fig9
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

The IPQ5018 SoC contains an internal GE PHY, always at phy address 7.
As such, let's add the GE PHY node to the SoC dtsi.

The LDO controller found in the SoC must be enabled to provide constant
low voltages to the PHY. The mdio-ipq4019 driver already has support
for this, so adding the appropriate TCSR register offset.

In addition, the GE PHY outputs both the RX and TX clocks to the GCC
which gate controls them and routes them back to the PHY itself.
So let's create two DT fixed clocks and register them in the GCC node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 03ebc3e305b267c98a034c41ce47a39269afce75..d47ad62b01991fafa51e7082bd1fcf6670d9b0bc 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -16,6 +16,18 @@ / {
 	#size-cells = <2>;
 
 	clocks {
+		gephy_rx_clk: gephy-rx-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <125000000>;
+			#clock-cells = <0>;
+		};
+
+		gephy_tx_clk: gephy-tx-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <125000000>;
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -184,7 +196,8 @@ pcie0_phy: phy@86000 {
 
 		mdio0: mdio@88000 {
 			compatible = "qcom,ipq5018-mdio";
-			reg = <0x00088000 0x64>;
+			reg = <0x00088000 0x64>,
+			      <0x019475c4 0x4>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 
@@ -192,6 +205,13 @@ mdio0: mdio@88000 {
 			clock-names = "gcc_mdio_ahb_clk";
 
 			status = "disabled";
+
+			ge_phy: ethernet-phy@7 {
+				compatible = "ethernet-phy-id004d.d0c0";
+				reg = <7>;
+
+				resets = <&gcc GCC_GEPHY_MISC_ARES>;
+			};
 		};
 
 		mdio1: mdio@90000 {
@@ -232,8 +252,8 @@ gcc: clock-controller@1800000 {
 				 <&pcie0_phy>,
 				 <&pcie1_phy>,
 				 <0>,
-				 <0>,
-				 <0>,
+				 <&gephy_rx_clk>,
+				 <&gephy_tx_clk>,
 				 <0>,
 				 <0>;
 			#clock-cells = <1>;

-- 
2.49.0



