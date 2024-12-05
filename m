Return-Path: <linux-arm-msm+bounces-40573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAC89E5BDF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FA1F167CE5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF93F227BB5;
	Thu,  5 Dec 2024 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TmJbDTem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1BA227B9A;
	Thu,  5 Dec 2024 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733417013; cv=none; b=Ss/mtA01ty+j1FM7CHrMLhQRm+3kB4I9Q7qyl93Uzs1Tv/XKpO1nbCJhZG2J/Md+12iqE9QI+QEWboKPrFWSYH+Q/RnU0kCIftfiI7k0d57qb7RfBDe+ZVg+ovhuQ2xq69Nm6dqYeRBxcVH5i1+OH4zR2g/uhHz/8HVVKuVPpCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733417013; c=relaxed/simple;
	bh=AlRn+WZd6SfhWS2fa7bQSadmkZzrS2yhhKqX7aao6Sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n5eme2DMZwrNBkygRBzLLsRDYa74iRu3jU5eFdjLbtY9PnzrUyb603peAtU2imOvDvqLSNM0sT1FSqusbYwA6pj4OuqDjsTVI/C3+LH3VMn9AQmrYtxqT9qbdHQhv81Z5V7gB50P5U63kaK2O1a6J+5m8xeqEOUimB/UEegHlzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TmJbDTem; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2CFBC4CEE7;
	Thu,  5 Dec 2024 16:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733417012;
	bh=AlRn+WZd6SfhWS2fa7bQSadmkZzrS2yhhKqX7aao6Sg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TmJbDTemO2jVZW2qnNkIWzlh81zLnENRSZ1JjgBLJCcy6My0Q8ksunQTBpkRCYvD9
	 bCmJiCi7dX74qGD7B3pgm63rX/6QmcS0lyArExyci+t/DYSWoyV2VfVqbP6xhtk9Ef
	 rRRF/N4zdoPKZR18t6Dp3KLLcxWASykmOd5h0njZGQRZPuaLUwK5MwZnDy0jPZuPos
	 AJpD4X8IhzdzRnOuJ2qSj4pdSEluKt9Ws1zbaU4+d7xzitroQBQNM9goYsAHolvLjs
	 J3lw2inbcaucpE7L9RlwmAlyRR5ZSHVeHxWDxlUkOGUcnxLSS2x5Lj4WIeVpTHLIpn
	 VeWkdq0v5qgHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4B1E7716D;
	Thu,  5 Dec 2024 16:43:32 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Thu, 05 Dec 2024 17:43:07 +0100
Subject: [PATCH net-next v8 10/15] net: macb: Use helper rgmii_clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-upstream_s32cc_gmac-v8-10-ec1d180df815@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733417009; l=1061;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=lqge0TxoQLFiynEUre89U7vm4A38Pvil86ayrYiUui0=;
 b=HVHZUUwYBwhrlL6BmOOImKqXUfNg2MEpvgsvdQxpheQtqTJkFS1atcWcvBZMIuVU0RGITds2R
 JKKMG6yJ6L2DRn5uzlzCLP26+8gBZZpw93jPiI4gG63B7AyoGOJhtW+
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
 drivers/net/ethernet/cadence/macb_main.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index daa416fb1724..640f500f989d 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -530,19 +530,9 @@ static void macb_set_tx_clk(struct macb *bp, int speed)
 	if (bp->phy_interface == PHY_INTERFACE_MODE_MII)
 		return;
 
-	switch (speed) {
-	case SPEED_10:
-		rate = 2500000;
-		break;
-	case SPEED_100:
-		rate = 25000000;
-		break;
-	case SPEED_1000:
-		rate = 125000000;
-		break;
-	default:
+	rate = rgmii_clock(speed);
+	if (rate < 0)
 		return;
-	}
 
 	rate_rounded = clk_round_rate(bp->tx_clk, rate);
 	if (rate_rounded < 0)

-- 
2.47.0



