Return-Path: <linux-arm-msm+bounces-60588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6EEAD1C9E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 13:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF529188DC50
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 11:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26694257ACF;
	Mon,  9 Jun 2025 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9v2g+/m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6944256C7C;
	Mon,  9 Jun 2025 11:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749469491; cv=none; b=bqSRv4G564rcZ1Td505qLONCTBEecX4luAlN0vRN/arAWly2MYvd8lsrKlN7SEMBxXNda23GZqe99EvHhqpIHbM/FiISaYP9sP8ov3xvnUWRSGpYaidJr4i/fpXeqH+628y3XRoje2UIrFdBG+t3YU0ZRVTXwub4FAiRA5Vt19A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749469491; c=relaxed/simple;
	bh=YW0aYGk44OBGXMXwnXBPhhKQgB+lh/nINEBWmVaTupA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0YcDu/XYKIfdw5NKA10Opr079iKzqq0Bv5FXDG5/PbVePTcGgqFvymO3OilhT0rRj6RzteB83ql4VQLrN67dBBMnwxs8/bO9G4eJewSpS1TzkUnhBQZfGoKnRmaMwoWlht/K9+7t+Eqf97D7bBMMsh3aqfMRflfxkvJAkrBr6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9v2g+/m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22CC7C4AF10;
	Mon,  9 Jun 2025 11:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749469491;
	bh=YW0aYGk44OBGXMXwnXBPhhKQgB+lh/nINEBWmVaTupA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=D9v2g+/mNvGdWqIGkeep2Ubl7BtwISFnfdV7Ta2z51F83v88MrufnKHnAXizkbRpC
	 1kmyG+GM82WqAuepKI6KQwBAV/2fQs1oVmOywKbsIwi8vjz0uSLmxieLq16ZQOOl8o
	 ON5nfTvLMJu1lBwI+nnGm8w46zCr4Y1N67pHg7nmymKHDiQWesZIojG/n7GtZS54so
	 SUi/AOr7RJz86ydMANk3/cibUgGv8pVopYRgS/DnucaUWYHFOnCzLjy/m69mGxl65v
	 Dp3/3l2c6f3TFean5Y7eGYg5CIWqCNGr5Wvt+7X4Ag0QX0Q8VMZv98r+PJ9F7nPO8/
	 JCAHJkk/1tswA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D49C5B552;
	Mon,  9 Jun 2025 11:44:51 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 09 Jun 2025 15:44:38 +0400
Subject: [PATCH v4 5/5] arm64: dts: qcom: ipq5018: Add GE PHY to internal
 mdio bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-ipq5018-ge-phy-v4-5-1d3a125282c3@outlook.com>
References: <20250609-ipq5018-ge-phy-v4-0-1d3a125282c3@outlook.com>
In-Reply-To: <20250609-ipq5018-ge-phy-v4-0-1d3a125282c3@outlook.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749469488; l=2285;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=hFpy0osU/0n+A52muRC0D3Drst6JCZAX5hmtJZDrLks=;
 b=xF58fHaVe5CdBWFWgt/+XyW54YYT7Y+h9PffZNYc34X3UhJbm3MdOio9g8b+5Sr0s/pUDINcH
 o0iDVafNj+YDHqToxyrAFB/0nJDAiZkxDgdECVJ12CUfALaUIiFwUbX
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



