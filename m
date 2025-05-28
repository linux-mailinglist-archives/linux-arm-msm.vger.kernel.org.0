Return-Path: <linux-arm-msm+bounces-59711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB50FAC6C27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 16:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 187E11BA33E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 14:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB37628C025;
	Wed, 28 May 2025 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAyLUtsM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D9B28B509;
	Wed, 28 May 2025 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748443552; cv=none; b=uJVyaDMA4ZOaaLGSd4Kpkj1ao2bTzHOLwr1BBTAtGv2GbIxu8AVQ28Ty/bxw1HicWosmfHiuFdMH9qES/qyj5LijuRthZXdh4jZTd9Vqos/3yRPk8A0CP2thNB1uca8jNcw7SGddVbbUB7u8rwjo80ZcZhb/BSertLkCxDIzRsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748443552; c=relaxed/simple;
	bh=KDE3jONM29soNGXCY5a31Z2K0OCOU1Kyc6sBdjJm2W4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rA1XMJ1Fe4d1imoNCQedDnNLyWUfhJ4TV4cgJlaIlYcs/mPwPBP9pVhdy2GANOTbupgx9dqe8RvwUWVZt1wmf/dWB2z/rTm5x9Yrpiwv9dkq4yUcwEeoFzQSHzbjxIOZCJeWPxdMd86e1lsbpNMc79NMygPQGpPZh8HV8yBD2IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAyLUtsM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB259C4CEF0;
	Wed, 28 May 2025 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748443551;
	bh=KDE3jONM29soNGXCY5a31Z2K0OCOU1Kyc6sBdjJm2W4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MAyLUtsM/BSCiqduynzRHnqM/tGQ9P4dwuTWF2PhOY2biyg5Um/U9JPb/+f2lkHRH
	 MuhjEc/lR7zqliYhXv7fdxumxKSnlfWuN6P3uXy3cRBjm25FhuwiEQibSR5fNQ1pGc
	 ybzwpaTZK+/gZx/q5P7i6gg8mqXYWpUVUQ/ei73YkwsA7w8NUA/cUj+JmJonHDBgWG
	 86YsswjQILPdsWz/RqXQGbd3xcqei9V2sVrhtwft8nAiCIFCilW/74m90h9FTuioHZ
	 uE0ZLWb54jbVb5RXjLvCiT/nuSXdQwjb97bn2QQnK3MRjohMiszzlpe2sL8cCXPqWe
	 rHhXgfYHuPG8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFECDC5B543;
	Wed, 28 May 2025 14:45:51 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 28 May 2025 18:45:50 +0400
Subject: [PATCH v2 4/5] arm64: dts: qcom: ipq5018: Add MDIO buses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-ipq5018-ge-phy-v2-4-dd063674c71c@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748443549; l=1458;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=4Z6dvq+B+YexBDa/RxyvWcr+v3oZkqxqlrrl5K8MHDY=;
 b=EAjnILhijNnzbfArUiedgXalZcEkkjwbe2NfRJ9PsDO1Uh6HkD4hyOBGO5iexkzcoPH3C0kAP
 4dZ96UtYzZsDJk4OEOxCmSQwZPvB4ZFrDLL+W1eMkObatV7IIe8vOoV
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

IPQ5018 contains two mdio buses of which one bus is used to control the
SoC's internal GE PHY, while the other bus is connected to external PHYs
or switches.

There's already support for IPQ5018 in the mdio-ipq4019 driver, so let's
simply add the mdio nodes for them.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 130360014c5e14c778e348d37e601f60325b0b14..03ebc3e305b267c98a034c41ce47a39269afce75 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -182,6 +182,30 @@ pcie0_phy: phy@86000 {
 			status = "disabled";
 		};
 
+		mdio0: mdio@88000 {
+			compatible = "qcom,ipq5018-mdio";
+			reg = <0x00088000 0x64>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			clocks = <&gcc GCC_MDIO0_AHB_CLK>;
+			clock-names = "gcc_mdio_ahb_clk";
+
+			status = "disabled";
+		};
+
+		mdio1: mdio@90000 {
+			compatible = "qcom,ipq5018-mdio";
+			reg = <0x00090000 0x64>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			clocks = <&gcc GCC_MDIO1_AHB_CLK>;
+			clock-names = "gcc_mdio_ahb_clk";
+
+			status = "disabled";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5018-tlmm";
 			reg = <0x01000000 0x300000>;

-- 
2.49.0



