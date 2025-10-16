Return-Path: <linux-arm-msm+bounces-77609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E301BE40C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 16:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EDCE54EC145
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 14:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A72343D89;
	Thu, 16 Oct 2025 14:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="C6w//HGX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A6A33A003;
	Thu, 16 Oct 2025 14:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626739; cv=none; b=oampWjMc8VuWOBuWSKhlQ3tlI5E5aN8RrNoWOnyGCKLT/0d9chNjEeo9vP2arZ7ke9eFr+Ww4iLcNHYrUziUg7S4sBDDZOK1/sbNO2FiPdU1dk14nHpevnJF490LH643pWg+9E/Z83TlXqOdlmS+5F9iMUNKyiUN0J2Kb3sC5Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626739; c=relaxed/simple;
	bh=KcvoRU24NHWkD9NyILmMcK2gV/2qBEEKQRSifS45tL8=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=dPXa62DmwFySoy2203u0uQBJY6YW8X0gCgtapcf65BKBdf9MsRV0ZDTYxLZvlhI7ylq+Qs2rDzl3lFWlPPUS2JnACNnAY8dfuJawjalhy/VtdMZYiToysSd5R9DOJoBnqVnhSLNN4244CiMuOmwM3q1+iL3KrD7N6f76D83xbiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=C6w//HGX; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nncZ0AXhmzc7/NiLcTF1jzX+v3g0XKRPuyG12twUDVY=; b=C6w//HGXJIo4YeoCwKqlhB0Uzl
	aHMM2r/jvyPB18t4W8inTpq2Ok6wHSJf3SByTgWGo7mAR6yIuS6TOadke8K8jA/PtpqKctE5IG5Nr
	UiET2Bk9omHT/0c5K9j03/8krLZFjn9WMSUSF+z2A4xDVLdIJuRvKzpEat/8wPr+h7h6K9XZNCHmL
	AlnT8acCcfujnqKjy1HUO4wbSsrTD63NSld1Xive3sEAy479GuJwXD2bkmm4snMCThXUQnZXykG8J
	Ms6Q/WfOMnpD2u/gnlnfEVvts6iM92Xym7sPlHcf/XB7gK9hapgQ+Rl+cx6ED7EIT74RMesZ8RKVM
	Q6t7/qPA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43238 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v9P71-000000006S8-17lh;
	Thu, 16 Oct 2025 15:37:52 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v9P6n-0000000Aom9-2LuZ;
	Thu, 16 Oct 2025 15:37:37 +0100
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
Subject: [PATCH net-next v2 11/14] net: stmmac: do not require snps,ps-speed
 for SGMII
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v9P6n-0000000Aom9-2LuZ@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 16 Oct 2025 15:37:37 +0100

SGMII mode does not require port-speed to be specified; this only
switches SGMII to use the MAC configuration register speed settings
and the actual value is irrelevant when the link comes up.

As it seems the intention was to support "reverse SGMII" with this
setting, but the code didn't actually configure that due to a typo,
the warning and bad DT binding documentation has led people to
specify snps,ps-speed in their DT files inappropriately.

If mac_port_sel_speed is zero, then don't complain that the speed
is invalid, as this means we're using "normal" SGMII.

This does _not_ obsolete snps,ps-speed, nor does it change the
behaviour of that property, with the exception of not making people
mistakenly believe that they need to specify this option to use
normal SGMII. There is no need to modify the binding.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
v2: add comment about why there's no requirement to change the DT
binding.
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8f08366c25a4..79d09b40dbcc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1101,6 +1101,8 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 
 		default:
 			dev_warn(priv->device, "invalid port speed\n");
+			fallthrough;
+		case 0:
 			priv->hw->reverse_sgmii_enable = false;
 			break;
 		}
-- 
2.47.3


