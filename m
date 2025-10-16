Return-Path: <linux-arm-msm+bounces-77606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE14BE3F41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 16:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 691041A65693
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 14:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E988E2E764B;
	Thu, 16 Oct 2025 14:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="CjXOylw2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097EC3314BB;
	Thu, 16 Oct 2025 14:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760625514; cv=none; b=DeZ/eBH3PXzd+Stx8K64tNnGyKi5cPbYgR5K9iaJrB4qHjyrn7OPBq1GUt73k08uPPt9ukzO6JZkCm8+4Grr+PthUYSsDKFiadHOy7XLXAywswX9oa00u2RbSv16+NGI+ae7TeAzKdql5pGbpqwg/1RkRMgixw+LpAh8ziw3Id8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760625514; c=relaxed/simple;
	bh=q8YZ9RsHa4hGJ4Opo0x6+hT6sKIuFfCy6YQ0w+kTL9A=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=hPyDblYHaZAH74fMrAYGUHtYZ2enR8B27QoS5MCWx3X4zc3vMlj5+6XD1Sk1LcYILsJuY0SDt3Ry9dgRU7N2TZf4+Hki0SC+WyVul410wy6gRTsfuG4jVmlXzCnIFQtZiqN6qxmalqR4o4g2cLeaa6hQ1fw3YXJILrRiO34LO5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=CjXOylw2; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zKZGKGy/Hhc0gUrzCRXsRGfkbT59NKMuOwnA6gRxZjc=; b=CjXOylw28mx9iSDQpfU74yDKsJ
	XWP3yFEZ+aev9rG07hI86dRj71356k7+B8UGfdKSXHiD6P5ni3RPxUpWe9Mtnc8Jcw3lAu+eFBKQL
	c8qNNH6QnftrxCDEiemSWfM8taGRu0y0ec/dmmWORLdsOoVApJIF3bjt8tnL6RgQk5fRlRQjXA0x5
	UUakKRuesSOR6kHUD1Aq74UHjyvs5zcvk2hmiT5Imw2zcWQ10thpDf8Aer8jCK0RbyMV9nnri7CWG
	k7y67VyswX9RSrQLkhVPo2IeHSIb38MFr0/MBHlqgmetkhjG3nerqY4UwUpT7iO3hgFlgiRL7zN+R
	jN/8I+Mw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53902 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v9P6e-000000006Rb-47Xm;
	Thu, 16 Oct 2025 15:37:29 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v9P6Y-0000000Aolr-0vLH;
	Thu, 16 Oct 2025 15:37:22 +0100
In-Reply-To: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
References: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH net-next v2 08/14] net: stmmac: move reverse-"pcs" mode setup
 to stmmac_check_pcs_mode()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v9P6Y-0000000Aolr-0vLH@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 16 Oct 2025 15:37:22 +0100

The broken reverse-mode, selected by snps,ps-speed, is configured when
the platform provides a valid port speed and a PCS is being used.

Both these remain constant after the driver has probed, so the software
state doesn't need to be re-initialised each time stmmac_hw_setup() is
called (which is called at open and resume time.)

Move the software setup of reverse-mode to stmmac_check_pcs_mode()
which is called from the driver probe function.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d440b1c2b7ff..013a2f3684c7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1091,6 +1091,19 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 		netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
 		priv->hw->pcs = STMMAC_PCS_SGMII;
 	}
+
+	/* PS and related bits will be programmed according to the speed */
+	if (priv->hw->pcs) {
+		int speed = priv->plat->mac_port_sel_speed;
+
+		if ((speed == SPEED_10) || (speed == SPEED_100) ||
+		    (speed == SPEED_1000)) {
+			priv->hw->ps = speed;
+		} else {
+			dev_warn(priv->device, "invalid port speed\n");
+			priv->hw->ps = 0;
+		}
+	}
 }
 
 /**
@@ -3435,19 +3448,6 @@ static int stmmac_hw_setup(struct net_device *dev)
 	stmmac_set_umac_addr(priv, priv->hw, dev->dev_addr, 0);
 	phylink_rx_clk_stop_unblock(priv->phylink);
 
-	/* PS and related bits will be programmed according to the speed */
-	if (priv->hw->pcs) {
-		int speed = priv->plat->mac_port_sel_speed;
-
-		if ((speed == SPEED_10) || (speed == SPEED_100) ||
-		    (speed == SPEED_1000)) {
-			priv->hw->ps = speed;
-		} else {
-			dev_warn(priv->device, "invalid port speed\n");
-			priv->hw->ps = 0;
-		}
-	}
-
 	/* Initialize the MAC Core */
 	stmmac_core_init(priv, priv->hw, dev);
 
-- 
2.47.3


