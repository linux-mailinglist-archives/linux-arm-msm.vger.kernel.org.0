Return-Path: <linux-arm-msm+bounces-74645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E89EB9B7AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 20:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F425165238
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 18:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB39F2417DE;
	Wed, 24 Sep 2025 18:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="lwDhbTzN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F08C2248A4;
	Wed, 24 Sep 2025 18:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758738424; cv=none; b=NAVlMj/02Fyyl17IetoeRczuUmVEXAFgUx7NDH2dYb4uB/9DU7ADYTgzd+4oALXLrPeow6gXkLAYvhRI2yogUNzGNXlaOcWZU9Vdl/w8J+T+2YR6QO8Go86RCpjI2x49svBzLQV90bh9IY8+4pzEq1PCYjZpRekskvsuCJuTuFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758738424; c=relaxed/simple;
	bh=FDZcBJR3wAx3Wc14mVEqdicWlTbd9loueIywMIB4qXs=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=Y8qrHgX9fjNa24nzu/zYEW2Td/1SIYFCBB7U8KwdvHEaqVBLAavM81WSDtU7IEtsXEws7xX9NVCyISX9rJcrZ12TKOdbxOb6E6+Uiq9XCngFJY97iA3NMHIcItxB4RQ1svCEXeAirjRHn4+qfaBIPVgL3V+LxSLeqKyIut14tGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=lwDhbTzN; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=98biKbPuv+kbYg6hY3GxF0OjQQ/oXiCUuA+3Ci5wrLs=; b=lwDhbTzN76RteIqsY0gW6IRtx+
	fm0t4/tLe6GHBxhVW+uzl/q/46ojJYlx2MV5+BleZVSzb2qw1LbImWMVeZwhFL0PWuvC1iEhG2uIE
	5BCykL7bntdKeuBnULo6h2F7lq6taf75Qhs7XV/H6KFsGy6rhNGtkJr38I2yp6VMEPHo+7LkSg6Qr
	cK2VCJn5Il+ylJ6QkYXPBSQWSqqo3tvVG75VinUw8FXOAo9LqxulWa/QG1BikVyyc8sjX/f3UHBku
	L0Le6bb7VQPTsVJ2cBv08WvaBr0MVH0k9jLGDa2JBAhfb15dvwqbhz7uCF5ZO30mp1Y1ktZzrpGWO
	FG+D3Z+A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36588 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v1U6M-0000000012y-0Ch2;
	Wed, 24 Sep 2025 19:20:27 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v1U68-00000007HwG-3nk3;
	Wed, 24 Sep 2025 19:20:13 +0100
In-Reply-To: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
References: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
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
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
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
Subject: [PATCH RFC net-next 7/9] net: stmmac: hw->ps becomes
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
Message-Id: <E1v1U68-00000007HwG-3nk3@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 24 Sep 2025 19:20:12 +0100

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
index 8ff3406cdfbf..87c3f0dd54f0 100644
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
index a90df69ac43f..dff3bba83969 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3476,10 +3476,10 @@ static int stmmac_hw_setup(struct net_device *dev)
 
 		if ((speed == SPEED_10) || (speed == SPEED_100) ||
 		    (speed == SPEED_1000)) {
-			priv->hw->ps = speed;
+			priv->hw->reverse_sgmii_enable = true;
 		} else {
 			dev_warn(priv->device, "invalid port speed\n");
-			priv->hw->ps = 0;
+			priv->hw->reverse_sgmii_enable = false;
 		}
 	}
 
@@ -3520,7 +3520,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 	}
 
 	if (priv->hw->pcs)
-		stmmac_pcs_ctrl_ane(priv, 1, priv->hw->ps);
+		stmmac_pcs_ctrl_ane(priv, 1, priv->hw->reverse_sgmii_enable);
 
 	/* set TX and RX rings length */
 	stmmac_set_rings_length(priv);
-- 
2.47.3


