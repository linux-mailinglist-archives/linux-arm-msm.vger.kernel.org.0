Return-Path: <linux-arm-msm+bounces-59346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ECCAC361C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 19:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D86113A1B75
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 17:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB8925F98B;
	Sun, 25 May 2025 17:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSfbwS1+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF93425C70D;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748195769; cv=none; b=H8kkMOJQZK1X287AaLWzoXhr4cyr8RQ4topbUlucnN458f8WXwHi8jjn9WyQZiZ6AH/Y5lkdsUG7wTlBOCkhIQ+b+bL+g4DNvw71bxLyN5siikEcsfeye27ffKEr/Nl9tu3xFwNy1yDoF+Nu7KzPNLGc5amA1IIiJw6WeAA46ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748195769; c=relaxed/simple;
	bh=9A/6O9r2IqeLYzOFaVCEJKjY9Ul0YdWsU/rVzaX6qCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k54rlP0itJhXV5gFHrKflsdZbAe/mhnr+yHov9HbhR+nRhAvGyZijiMI1xZYiUD26XNrvPKepuBAOcfDG7hyL899zlBipMeJPvgfB2zqHxbQkWRT9NHKnfYje3IsdN91ISrngEqy7d2Y4OCzKPuqceFNzUZFblMYEu9p8z0JOoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSfbwS1+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 570D3C4CEFA;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748195768;
	bh=9A/6O9r2IqeLYzOFaVCEJKjY9Ul0YdWsU/rVzaX6qCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BSfbwS1+Z6WZKLQFpUmLvoXUwMsG9ZiYzfdy1Galm+2fkh0Zv97THsbe0HFw60iib
	 GKS7NneNIYYOKPnNczhhCOQS9IfZHaIRiF8tavW1aPmGLQEicBxN7IS04jZF4NKUdP
	 P8Rpip7Oz5rPiUSlJqxa02aRI/mmfzYNWKMhI0/R+La+3PB6vRAfV4uka3rl0WSn5x
	 RBCRm0+BDQevps0HTt5xNBI6JJcdZRiGZ//uF7u31ddtiNU5hQHMPPk04ZcCBFgaR5
	 PVcuJQqeUZFhh1rCd8R4zdimojkVMp4TdDlpPlSTpAdNa+GP3+6icVcgtREvdW9Nhq
	 ZgwdSCgMMqNiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D18FC54FB3;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 25 May 2025 21:56:08 +0400
Subject: [PATCH 5/5] arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio
 bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-ipq5018-ge-phy-v1-5-ddab8854e253@outlook.com>
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
In-Reply-To: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748195765; l=1843;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=RbZYI9mHUjINGh38wXyVEQGgEtjNvQeZPMy+hpynOhA=;
 b=VYUp3FjEr6voXpngVWA+ruIyKayYUaXPmgTAd4U/eODjiXYYjWK3ETaw/TxwWWlHt2kUfaiox
 8HhdPvf0hFaCND7OBVCC0uXcmYJy+ASmjLbH4aV7OY1jhuVkTc4GNSZ
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

The IPQ5018 SoC contains an internal GE PHY, always at phy address 7.
As such, let's add the GE PHY node to the SoC dtsi.

In addition, the GE PHY outputs both the RX and TX clocks to the GCC
which gate controls them and routes them back to the PHY itself.
So let's create two DT fixed clocks and register them in the GCC node.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 03ebc3e305b267c98a034c41ce47a39269afce75..ff2de44f9b85993fb2d426f85676f7d54c5cf637 100644
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
@@ -192,6 +204,17 @@ mdio0: mdio@88000 {
 			clock-names = "gcc_mdio_ahb_clk";
 
 			status = "disabled";
+
+			ge_phy: ethernet-phy@7 {
+				reg = <7>;
+
+				clocks = <&gcc GCC_GEPHY_RX_CLK>,
+					 <&gcc GCC_GEPHY_TX_CLK>;
+
+				resets = <&gcc GCC_GEPHY_MISC_ARES>;
+
+				qca,eth-ldo-ready = <&tcsr 0x105c4>;
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



