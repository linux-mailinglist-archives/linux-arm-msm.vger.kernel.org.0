Return-Path: <linux-arm-msm+bounces-77427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBC8BDF086
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE0014801C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 14:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A9727F017;
	Wed, 15 Oct 2025 14:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="o6kQizJI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99AC27D77A;
	Wed, 15 Oct 2025 14:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760538566; cv=none; b=j8ck/9g0WkhznkbP2BhwQZWB7biPi7dP8FcGn8h74wk6Fyp0ulmKcWcvLqZFMSDCEKg3Y+QEZFRteZqliC8yLSCzxuCCKSBP6lyeAkSf87OCugrWP0W6PUicMvSg5AA2ZY1zYWFV/W58RyMJbDuouxPmB+dO1Cc8Ez/XBHEvrno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760538566; c=relaxed/simple;
	bh=ImuDiyaiLjKKg3z+jptFbZkugv6c+SgdpQhL6a1R1XI=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=INUm5cq7yQPvV/SlqFz2Jo6bgOd3LD7Us3tEZXf82wR1rn7d1UuUlM5qkStkqqhuJbv2J35PURc9LiyNxzwRkX7xipeFhFPc0nDieW66TV9BPzvnO8FUW6HglQmqVHGskU4Qkq9u1DywYqg215LJUizOejCUQj3i8lcTBi4A6XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=o6kQizJI; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zmS08+FhLOUYgyxiQSp5PPpa9iaz2hbylu/2eY8JKsY=; b=o6kQizJIu74Tfypf09ldLZbJoK
	g1346eUdN2SH1ZpWRMI1oc41wNA96ILRXzL+dCciGppZR25iW4ilbBOK5mVSywqkTUoSk3z4dt0tt
	fUDpB98TUkAVUOuOc1w9bD7QMSE1P/cCYEis0Am+SCE4+5gk8L8I703ykttz2AA041VK/GFaSGocy
	nTBQfRhUgMAp//95CHM4VvaMCy5SBg/THNqbKAW1MPs14lOrUA1wKswXpZCQrPIJtWESPdp1Mlcof
	MmOcrGtr2919NbQNMcLI2uAUO3wn0OfUe+OtBJJPXpRroLYmQ+gBHrdwjVpp/xqVMOhDQh6CK1ZZt
	p09ugTZw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46038 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v92N7-000000004gd-3oa5;
	Wed, 15 Oct 2025 15:20:58 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v92My-0000000AmHJ-3chv;
	Wed, 15 Oct 2025 15:20:48 +0100
In-Reply-To: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
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
Subject: [PATCH net-next 10/14] net: stmmac: hw->ps becomes
 hw->reverse_sgmii_enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v92My-0000000AmHJ-3chv@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 15 Oct 2025 15:20:48 +0100

After a lot of digging, it seems that the oddly named hw->ps member
is all about setting the core into reverse SGMII speed. When set to
a non-zero value, it:

1. Configures the MAC at initialisation time to operate at a specific
   speed.
2. It _incorrectly_ enables the transmitter (GMAC_CONFIG_TE) which
   makes no sense, rather than enabling the "transmit configuration"
   bit (GMAC_CONFIG_TC).
3. It configures the SGMII rate adapter layer to retrieve its speed
   setting from the MAC configuration register rather than the PHY.

In the previous commit, we removed (1) and (2) as phylink overwrites
the configuration set at that step.

Thus, the only functional aspect is (3), which is a boolean operation.
This means there is no need to store the actual speed, and just have a
boolean flag.

Convert the priv->ps member to a boolean, and rename it to
priv->reverse_sgmii_enable to make it more understandable.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index ed5e207ffdba..fee7021246b1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -599,13 +599,13 @@ struct mac_device_info {
 	unsigned int mcast_bits_log2;
 	unsigned int rx_csum;
 	unsigned int pcs;
-	unsigned int ps;
 	unsigned int xlgmac;
 	unsigned int num_vlan;
 	u32 vlan_filter[32];
 	bool vlan_fail_q_en;
 	u8 vlan_fail_q;
 	bool hw_vlan_en;
+	bool reverse_sgmii_enable;
 };
 
 struct stmmac_rx_routing {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 611197cfa34f..8f08366c25a4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1096,12 +1096,12 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 		case SPEED_10:
 		case SPEED_100:
 		case SPEED_1000:
-			priv->hw->ps = speed;
+			priv->hw->reverse_sgmii_enable = true;
 			break;
 
 		default:
 			dev_warn(priv->device, "invalid port speed\n");
-			priv->hw->ps = 0;
+			priv->hw->reverse_sgmii_enable = false;
 			break;
 		}
 	}
@@ -3486,7 +3486,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 	}
 
 	if (priv->hw->pcs)
-		stmmac_pcs_ctrl_ane(priv, 1, priv->hw->ps);
+		stmmac_pcs_ctrl_ane(priv, 1, priv->hw->reverse_sgmii_enable);
 
 	/* set TX and RX rings length */
 	stmmac_set_rings_length(priv);
-- 
2.47.3


