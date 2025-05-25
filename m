Return-Path: <linux-arm-msm+bounces-59342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDFAAC360C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 19:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CF5F3B3F28
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 17:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B943725B1EF;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pygzVr84"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F91B21A458;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748195768; cv=none; b=YuLVaMnpdYyAKXUOYv6p6EGOcVQDRkj1PeZCEO7UVDf0rFYyYUwViv9loJy6sGOhzz/5u7iBWI6u/hNXA/WrIBTigb2eysFyczXJb1oO0ksKp0pgc+mMb0MW+T/AY/EmFcBse8LuPKurHlLaVmE2h2hpFi+SITta+GMPfn++VJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748195768; c=relaxed/simple;
	bh=KDE3jONM29soNGXCY5a31Z2K0OCOU1Kyc6sBdjJm2W4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=luTfhRZpPYxRKFnET+Q1A0c4rpmDHdYymPO68JeE9FpcCNuWZOaWhZIOvTRZbt03cdI4SznpvX4cK3lzHQ26J7aI2+O95NJTAsKCUi1MbqB0E7YbhFYCqpOqqhHkqsrZUwqEhKb5NqyFyPFbM4jFiL4FyJ22cMdQPDN7rcXDFYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pygzVr84; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48E92C4CEF1;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748195768;
	bh=KDE3jONM29soNGXCY5a31Z2K0OCOU1Kyc6sBdjJm2W4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pygzVr84i4TlSy3cY0Ddf7G67c2/RdG9oOevIiDNpDb8AW3kpdxtF1DYH2gniNao+
	 4ru7hgbU1xPZRBO920gsHv5flbLuQ3BNNQyCh0jCQl7w5fw+W24g42TjpSlzH6VuNc
	 tZAZg0LXSLJqSWFUvZw75OeO6aqAgT1atOUBpmPG52uYN82jciDtHox54Hby8uvnNR
	 7UEng6UX+N8A9Z1BHlLgx9yZ81PF5H7gxK2trFsopFP3a2dO6VD0+YqCACtvhJBBNu
	 fzIVJU18m4+4hMHufkrejoEwVkFBrOAvhsCZqV0GSrMk7kkB80Bb1JZYIXWyyKMhU7
	 7U9wrJuh68PnQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA2EC5B542;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 25 May 2025 21:56:07 +0400
Subject: [PATCH 4/5] arm64: dts: qcom: ipq5018: add MDIO buses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-ipq5018-ge-phy-v1-4-ddab8854e253@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748195765; l=1458;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=4Z6dvq+B+YexBDa/RxyvWcr+v3oZkqxqlrrl5K8MHDY=;
 b=gI1hk2iJGzZU8JpoiAL9oggKCV52OlHnYhuWvf+AX1/w5yZ+9vaGGcB8nwoYlz+ItajE/XkkA
 CBxrn0CycT7CGWGhbsxGTsG3hi+PdMujBU3PEpGGyqpAdfZEVlb0iUp
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



