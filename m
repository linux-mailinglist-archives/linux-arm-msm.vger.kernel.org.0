Return-Path: <linux-arm-msm+bounces-75421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F421BA6D36
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 11:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4DAC17271A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 09:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8032D73B1;
	Sun, 28 Sep 2025 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="mwJiwUxI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68C12D63F6;
	Sun, 28 Sep 2025 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759051301; cv=none; b=ilaaFqJG+AD2XsFu0+NHYreLLFZkKhAOvhSoe0I6ZeQwIEgqxhMONMjkuxc9JzmD3AGQIM/62qNMRsoXMqjwax12SmuMwNGVS7D0FgjYYZGPQ5itb+bw91n6vyVbzgT7VXUad/OZmn8cwCm5qQ1Hmpt7+gmhmbcvXPPJKZr1GI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759051301; c=relaxed/simple;
	bh=vEG1pzCRP2l8UiBCtpRjNH80AfHUVbdD5hPoTMpg1/M=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=huEhvZf4Y7QKZBFmrA9oyCnRSjM5zOISf4/imgG79mkmZ7tLDyuqGI5STuQ+CD5v4nevGQK3g70/n97jBYbUoLkwFc3NhKyg4NmNvis33CQoRSoSDJ4Yfg6SbT7isb/IeebVZtT7nr1lL9hrwN7Kk0I5glUXgOyypOqWzyyS8ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=mwJiwUxI; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ubf8ru2yeav1iqcn4xlDDDTK5MJ9RiF2NcA/K6NqMrw=; b=mwJiwUxIRZyNFQ0GqD2Qyni4QA
	qWPP5tAXPRJbKg551zuXI5Vb0+L+SNSn0HMPwWY+IYLCTjS7a96+ojWoxIojQAdv8b+NK7N8P3hww
	gDkgb4HTJfRv9c/Di1UQ/o4rU6YAimKivaZ0E/IIJKhLqah3aS9GaUMR0r3ikAeqP67DN149zeB0o
	4w8j3kTF0wyaEvryEvOU0ShH76HIdQX5ASNCHte4ZEbiP2p8IfQDeeIQxEmpxl3G9I9mr//kALDFi
	E8IJEqISwHEGp2aiSMDGAUligtNuAj3UIZ0vlK1oSWQ999TNS/r2e2Z68h0o/Qi4MH8H53FieDeaa
	xymGlC6A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52256 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v2naJ-000000005H2-420C;
	Sun, 28 Sep 2025 10:20:48 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v2naF-00000007oET-3Q5a;
	Sun, 28 Sep 2025 10:20:44 +0100
In-Reply-To: <aNj8U4xPJ0JepmZs@shell.armlinux.org.uk>
References: <aNj8U4xPJ0JepmZs@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	"Alexis Lothor__" <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
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
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
Subject: [PATCH RFC net-next v2 08/19] net: stmmac: move reverse-"pcs" mode
 setup to stmmac_check_pcs_mode()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v2naF-00000007oET-3Q5a@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Sun, 28 Sep 2025 10:20:43 +0100

The broken reverse-mode, selected by snps,ps-speed, is configured when
the platform provides a valid port speed and a PCS is being used.

Both these remain constant after the driver has probed, so the software
state doesn't need to be re-initialised each time stmmac_hw_setup() is
called (which is called at open and resume time.)

Move the software setup of reverse-mode to stmmac_check_pcs_mode()
which is called from the driver probe function.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f90742ab68ae..414a00ab5012 100644
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
@@ -3436,19 +3449,6 @@ static int stmmac_hw_setup(struct net_device *dev)
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


