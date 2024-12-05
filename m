Return-Path: <linux-arm-msm+bounces-40571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C29F9E5BD3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AEBF16759D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3161A226EF2;
	Thu,  5 Dec 2024 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWFXkx/8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DB022579B;
	Thu,  5 Dec 2024 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733417012; cv=none; b=bHuP/5aGrT3Z5M6obcGSei2LCqR1SNOY0y7Seo685GflcbGaGbic11FxeTnsfJD2SLZnEg9cvzmrI7uV/T0kWdj/Xqh7nSYwq6Kb7UgCZyCmIR4nLqjYUfPzg7hkXXaoG7KhL7aWPdyf4MDVwUzXA8g0rzb7+ZW3OOfMmvdf/Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733417012; c=relaxed/simple;
	bh=8EXZPVBYXlmWobRbQGHWVYHGGh1m+iUrmdn4povZRwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JgPjFLBJmtZ6VPIVYBScfEfhVyZSCTco5ssZK4WiL52Q67a/pZPyS51kV4L/j2RDJv4d+th65gTK2QuDBM4EQBc7qgDPSWsT9w45f3YwNuDtfg/1aRo24H4uCM91ZVwfWrKaLWpphzfKMnixyZ3KB1alOyiHPv/eUG3/CCxbBQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWFXkx/8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72B87C4CEF8;
	Thu,  5 Dec 2024 16:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733417012;
	bh=8EXZPVBYXlmWobRbQGHWVYHGGh1m+iUrmdn4povZRwc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LWFXkx/8HF6Rq2j2sUucPlrvEA1Paa0iVHD3pIuQX0BY/whfa8kuhnek763HSD/AK
	 qvjw1sNDvx9zstD+R2I1yJeadCXaSUPX7Pv2frtc6xaHPBshwHdnIxobp8eDnjjKrN
	 IDL1+i7BoB44ofTP+pQV2lGz32snAwxPvGxdj1WiugCUSyxbzcEK9FVnmHxkIjE5T3
	 +PABD1Rs7cjnutFK5Eg6H3rRwMMDs8IxAEJjL+36EbDQNecB3mwArxK1sUeu2JDyzy
	 BtnkCFAhPdbPQ4Tsgd/70NRxQUGV4BN8+ayvQK1obhtPWQVdHM6G5GDm3OLjlr9hHO
	 m6HQR3DdAZw1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E745E7716C;
	Thu,  5 Dec 2024 16:43:32 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Thu, 05 Dec 2024 17:43:05 +0100
Subject: [PATCH net-next v8 08/15] net: dwmac-rk: Use helper rgmii_clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-upstream_s32cc_gmac-v8-8-ec1d180df815@oss.nxp.com>
References: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
In-Reply-To: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
 0x1207@gmail.com, fancer.lancer@gmail.com, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733417009; l=1773;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=gyls2APUKHLlHqQNKqSG/VCF+Tkp2Zbsb4S51j4pUXE=;
 b=qbnpqhoTgsRvcMIEUD4goyvuHM5dCLfQoGYQwklMsFdan4e1Zue3UvG0j2mDkqaMy8CsHkIel
 zdqdSPX83MqB51zs9IE1oQLfkrzH1L/X+4uLO8G7tpEZy2NLVFfkJP0
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Reply-To: jan.petrous@oss.nxp.com

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Utilize a new helper function rgmii_clock().

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 30 ++++++--------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 8cb374668b74..a4dc89e23a68 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1079,20 +1079,11 @@ static void rk3568_set_gmac_speed(struct rk_priv_data *bsp_priv, int speed)
 {
 	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
 	struct device *dev = &bsp_priv->pdev->dev;
-	unsigned long rate;
+	long rate;
 	int ret;
 
-	switch (speed) {
-	case 10:
-		rate = 2500000;
-		break;
-	case 100:
-		rate = 25000000;
-		break;
-	case 1000:
-		rate = 125000000;
-		break;
-	default:
+	rate = rgmii_clock(speed);
+	if (rate < 0) {
 		dev_err(dev, "unknown speed value for GMAC speed=%d", speed);
 		return;
 	}
@@ -1540,20 +1531,11 @@ static void rv1126_set_rgmii_speed(struct rk_priv_data *bsp_priv, int speed)
 {
 	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
 	struct device *dev = &bsp_priv->pdev->dev;
-	unsigned long rate;
+	long rate;
 	int ret;
 
-	switch (speed) {
-	case 10:
-		rate = 2500000;
-		break;
-	case 100:
-		rate = 25000000;
-		break;
-	case 1000:
-		rate = 125000000;
-		break;
-	default:
+	rate = rgmii_clock(speed);
+	if (rate < 0) {
 		dev_err(dev, "unknown speed value for RGMII speed=%d", speed);
 		return;
 	}

-- 
2.47.0



