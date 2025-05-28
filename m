Return-Path: <linux-arm-msm+bounces-59710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7954CAC6C23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 16:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 337AA3BFF6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 14:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B9C28B7EE;
	Wed, 28 May 2025 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bu3Ddp2k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FC728B419;
	Wed, 28 May 2025 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748443552; cv=none; b=saULwrNKzQQJk4UWpQxD3CrmirwOi00l44i12xjeddd8/4Q/5fln5d6RbF3bsyIlCeBYGWi42AFHR2Owbxj3neVQMr6C7XqTgU776IzjICfVa/faa41RSnMK36RgzF3QhNEwgpJp6zo7LNIb8ICwiz5xpBVcZauUBwaZcpbrP5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748443552; c=relaxed/simple;
	bh=fY+l6Ps6NFjPp8H1FTNbFmkXe5TI6m53tpp5kLmq6ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I96Y0IdtRVUycnvEUWFO+eTk7PuwqZe41RduFCFVojT4I9ykRTEorYTLS9jsxj3xdI65BuihmoyzVICND3SM2e+h89ESSs05ePvldqq0Zlkzwc/+8GDWSYf3rZxMErighWSpg1UM/Ni0AvzufOCoZs3GnYCXxtX8Mf6lovozCaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bu3Ddp2k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9514C4CEEF;
	Wed, 28 May 2025 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748443551;
	bh=fY+l6Ps6NFjPp8H1FTNbFmkXe5TI6m53tpp5kLmq6ks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bu3Ddp2ka9q5DyNFUz9Mr98I1vQjHBAMtfVqGyF929IZjna3PpCXfPW/VwbNJ0qRZ
	 C46gIGhwpc/Ow5CzMuvFlM+wEH+hEXZfU5bl5Z+aKTUKNEH29R4gwUvciW0fezeVsi
	 J5+pe4Q2PcMoL/XQstlE/1NnstuLUxDfgRFrTxaOCk41tdQV5+5owQo/z/Gz3sUEn2
	 2A477zqYoxACEfzzRAeKnwVJYOcmecknZ12dIMbqYrUD/RTvSMeH9t+b0wrZBNUdMg
	 iw5L5cSItk/hbHofdgkK7BzB/8YU9oBos930OF2MG1ITz/upkw3m/M4e9iiw8Tgwvg
	 wxarXmu2prKvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF04BC5B552;
	Wed, 28 May 2025 14:45:51 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 28 May 2025 18:45:51 +0400
Subject: [PATCH v2 5/5] arm64: dts: qcom: ipq5018: Add GE PHY to internal
 mdio bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-ipq5018-ge-phy-v2-5-dd063674c71c@outlook.com>
References: <20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com>
In-Reply-To: <20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com>
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
 linux-clk@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748443549; l=2303;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=y1umjiNASV+etOSubDvR4l343800ONATOPkAQu4T8kA=;
 b=kcj8aIQFIt/fW5UDnVZlEfilk6D5Bz84KOgRmYFPp4kkSwV9MLqq/D9RGVOla8XY9WTcrI+uB
 EYMY9578cqCBb8V/l36iuGVB4YIVhdxWUZunRRJr1jwWxv0USERltjR
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

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 03ebc3e305b267c98a034c41ce47a39269afce75..6c42ed826c3c60960b08afb0b324cfb89f02329d 100644
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
 
@@ -192,6 +205,16 @@ mdio0: mdio@88000 {
 			clock-names = "gcc_mdio_ahb_clk";
 
 			status = "disabled";
+
+			ge_phy: ethernet-phy@7 {
+				compatible = "ethernet-phy-id004d.d0c0";
+				reg = <7>;
+
+				clocks = <&gcc GCC_GEPHY_RX_CLK>,
+					 <&gcc GCC_GEPHY_TX_CLK>;
+
+				resets = <&gcc GCC_GEPHY_MISC_ARES>;
+			};
 		};
 
 		mdio1: mdio@90000 {
@@ -232,8 +255,8 @@ gcc: clock-controller@1800000 {
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



