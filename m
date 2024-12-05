Return-Path: <linux-arm-msm+bounces-40574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C74F59E5BE4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78E4916BA62
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFFE229B19;
	Thu,  5 Dec 2024 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3Se5s91"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1285227BAE;
	Thu,  5 Dec 2024 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733417013; cv=none; b=ZsFcipU3GudmKuI9IgiTSwjBaAVyOEj6NbUDvgBAZtWMn5j0Gb2xWd80v/5waQpiifvzItaCK2LkOAy+rHloL87u6J/wTg4WZMvagDOafG0WP5MxNcouxbnvipJjDi2Sg7ci0qs9W8iFpN7aJisrrR6M7GCrng6oxkecYNthgUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733417013; c=relaxed/simple;
	bh=zUEz2ANM1tWrM6cItHLJ+CI7tAh+sUssEFYL0gzJjUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OU+bCxudNo51RcG57SjCGmJwRK2TJdk75g+4YbJ/UXLaqr52BC15tpd0cK+gh4/tmwsPCkF1NXzrS7vxpaJRJuhAvCkigGQI3dxCfjpxWIUdcwlMIX/8wCwFwTE/O4OE+sN1MUlX1tYUwEvqQJwfSJKUrw0vmCL1/9qYqZkpKfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3Se5s91; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB615C4CEFF;
	Thu,  5 Dec 2024 16:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733417013;
	bh=zUEz2ANM1tWrM6cItHLJ+CI7tAh+sUssEFYL0gzJjUo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=S3Se5s91KmNBupBt6GTjHQmRqPzstj5nC9S5/XWgmfPtT5ZeWqNK1RcdBcusahgm9
	 9mHYS8rbL2TTD/yPWbvFFPwCWTX+YSsblS/cIJezPOjGxr7sMIfAk+qsDwQhMcef9f
	 nojh+3QfBJy9yr/wg/zDn2mGSdNE92osS4yGb01fT/Q+bruJzO0BjDAbGf0yiH30kZ
	 HaVZDmdJdjf2tFbyOoAD6Bmb+9phh96SSNyTNKTDT6cB76ZGvGvujRNRhzjXuhwNBe
	 Jhlky9PIW9SPVqfRwlQNl0OCOTmH9E0+VufvvSHLOhKEDIPjFOwF8dN4FoV9g0EjTE
	 2CANKPn1+Q6Zw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4AD2E7716E;
	Thu,  5 Dec 2024 16:43:32 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Thu, 05 Dec 2024 17:43:08 +0100
Subject: [PATCH net-next v8 11/15] net: xgene_enet: Use helper rgmii_clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-upstream_s32cc_gmac-v8-11-ec1d180df815@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733417009; l=1191;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=yT5e9PnijROcL6qGdZBMgaJx1+AeFQufN+me46lPuTM=;
 b=buC5c2GkYhQ/NsyQePazI8hBsK8E3aHOL9F+ZxsQbkzw8cI6D6S6tQJOI9vbMfYOi13+7YJjR
 ZAG+pz3zR00DO4Le1o6AMqEhmjBhUx127NpkLAsBkBoG+9HltoNpzeA
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



