Return-Path: <linux-arm-msm+bounces-38997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A06BA9D78C6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 23:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C835282B46
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 22:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2C718CC08;
	Sun, 24 Nov 2024 22:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNsGwKy0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C075C18991E;
	Sun, 24 Nov 2024 22:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732488194; cv=none; b=EUsqzopehILYD2TSZvdI94onbiJRZ3wy8iK8gPCNeod1QWkLG+tpl0gevdOGu4mobw4xQOAySyNYPobuv2EIilmjwc9TRHHJZ8tuGl6nrv+I0vPVqIfxq4ScH0FcLg4+OucVHLE/JPqwkW2bgThJAau7W6p+r7YzyqPSojyGA0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732488194; c=relaxed/simple;
	bh=zUEz2ANM1tWrM6cItHLJ+CI7tAh+sUssEFYL0gzJjUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ffCPWsLw6RHG3lJx844Z99OPRyTgbc5yTOmQVwmqRJfbeoMgeMLjol0UzKD/8/+HqP2L5Rl/0P+8h23APRp+QJwsExpwxjG+Eog0yDHkNPrF3j2XVnrOTVFxU72wmfNTwoQOCTy4cyOw1UvMERCDqFOa7zEWrts7Bhs7WYu4a1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNsGwKy0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FABDC4CEF8;
	Sun, 24 Nov 2024 22:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732488194;
	bh=zUEz2ANM1tWrM6cItHLJ+CI7tAh+sUssEFYL0gzJjUo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NNsGwKy0mzN9a4VzQsvlFpD/lBDfL9w8NOeHzHyzlB0rO3t4Hilr9jdbrCrDk0a6j
	 1fD6E45XnNb/KcO6cSlDNVFayOdzbmjDCsKCHNXrxpGbmU6fLWaeEUCnus43mKdcZe
	 +N3xaoeIbozcArlDSFenR4tVuJf4k9H7loN0w2dAQHC3Br7XfzjmQmgmIKlz6WNT9q
	 jEIs+UWGW5N2un0CqFU8v4hifQEGDQjXlNPLcKSKgku2ytppV9cAe1o4tRkH09tgpN
	 hPKva/MHpnGn86xKRO32HXY4p31fPPHI1rK4ENFzoJnkDiiSsjuIOY8yY/jIuib7I7
	 DRMDEd7k4aJuw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F3FD3B7C2;
	Sun, 24 Nov 2024 22:43:14 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sun, 24 Nov 2024 23:42:42 +0100
Subject: [PATCH RFC net-next v6 11/15] net: xgene_enet: Use helper
 rgmii_clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241124-upstream_s32cc_gmac-v6-11-dc5718ccf001@oss.nxp.com>
References: <20241124-upstream_s32cc_gmac-v6-0-dc5718ccf001@oss.nxp.com>
In-Reply-To: <20241124-upstream_s32cc_gmac-v6-0-dc5718ccf001@oss.nxp.com>
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
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732488190; l=1191;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=yT5e9PnijROcL6qGdZBMgaJx1+AeFQufN+me46lPuTM=;
 b=MWwT+YAn1OtfqT3jNEoFInoa7erkRTCAewBp6BEfx7ysV1e5kVmbleVqtH268TLZwUjSNPQ82
 FH+lOEu1JTND2EKGP4BKsFDPtTzzCexLodYOiIY3j4pAImCvzuelPG8
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
 drivers/net/ethernet/apm/xgene/xgene_enet_hw.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c b/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c
index e641dbbea1e2..b854b6b42d77 100644
--- a/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c
+++ b/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c
@@ -421,18 +421,12 @@ static void xgene_enet_configure_clock(struct xgene_enet_pdata *pdata)
 
 	if (dev->of_node) {
 		struct clk *parent = clk_get_parent(pdata->clk);
+		long rate = rgmii_clock(pdata->phy_speed);
 
-		switch (pdata->phy_speed) {
-		case SPEED_10:
-			clk_set_rate(parent, 2500000);
-			break;
-		case SPEED_100:
-			clk_set_rate(parent, 25000000);
-			break;
-		default:
-			clk_set_rate(parent, 125000000);
-			break;
-		}
+		if (rate < 0)
+			rate = 125000000;
+
+		clk_set_rate(parent, rate);
 	}
 #ifdef CONFIG_ACPI
 	else {

-- 
2.47.0



