Return-Path: <linux-arm-msm+bounces-77426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CF974BDF06E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9E2634E6E87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 14:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1032798FD;
	Wed, 15 Oct 2025 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="VXEYYjC9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCF6264A76;
	Wed, 15 Oct 2025 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760538542; cv=none; b=lJUPh+bMzP+t5zIRL55HB/gld9Xy0eS3E2FJH04qUKu4K9X1IWwNHrr/dtjfrD5kQMFOdqUBdD3F++yvkYKjoIU671Pa8/N4CodnzYl8XCxdUVBzrRihA1uliZHK0ANyRRRSdoy+V3Sx7urvfLeQsHagndS65g6g3GcREyvMTIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760538542; c=relaxed/simple;
	bh=/GMfkXWKD7Mo4HCkD4StbktXGTZARPv9fiXJGQdP/Co=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=fU0uWxN1YGHjcfoRpVfhVyX4tq/r5o9Z07iusdmgD10zmg/Jf9kvqh/4DeohJtlZjDfukGQfrQX+nIPWwAoXc9K+zUVqIZby2USQYaWJA4hjzNUJRrt734SBYy7kyq5TtykhIuCe5Y2IKpXU2HwMkEO1pDasfUMf5Bm3gEwXcRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=VXEYYjC9; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aaUd4tWFZNUKcPxnE7KNdvYW06fqH0+s6HREJdLSzmQ=; b=VXEYYjC9FYzhm8DfEcHVVCdcvC
	DTBEQrBNMkmHoLbTuNdF9ytUM83G0bfKuyXJctRaxJHhY9xjuEJ3YcgaqZubRsJXZTqewOtyC3pBO
	xVDhK8u0El36GrgatZLs9b7JLcc69MYjCZONELmE+J45cInBU8RPzmYJDcrfU2/0QTCAbzGv6bx64
	ZOt0Aw6cwwSDwwU07u9pMhVK1hAdqqjVa+Vw6DwIF7ZjB8M9epfY06LKI2lUuYeI8+a7n9TtafOll
	YUeXivdsF2WoG1qBuDVhCYhQPaLiGS05R0Wm0n0U3c8ZgAnvbZx5DhqOnCjN4YOnLEnlCH5GD6y5Q
	2SejqPkA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46036 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v92N7-000000004gb-2Of4;
	Wed, 15 Oct 2025 15:20:58 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v92Mt-0000000AmHF-3AQR;
	Wed, 15 Oct 2025 15:20:43 +0100
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
Subject: [PATCH net-next 09/14] net: stmmac: simplify stmmac_check_pcs_mode()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v92Mt-0000000AmHF-3AQR@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 15 Oct 2025 15:20:43 +0100

Now that we only support one mode, simplify stmmac_check_pcs_mode().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c   | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 013a2f3684c7..611197cfa34f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1086,22 +1086,23 @@ static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
 static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 {
 	int interface = priv->plat->phy_interface;
+	int speed = priv->plat->mac_port_sel_speed;
 
 	if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_SGMII) {
 		netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
 		priv->hw->pcs = STMMAC_PCS_SGMII;
-	}
-
-	/* PS and related bits will be programmed according to the speed */
-	if (priv->hw->pcs) {
-		int speed = priv->plat->mac_port_sel_speed;
 
-		if ((speed == SPEED_10) || (speed == SPEED_100) ||
-		    (speed == SPEED_1000)) {
+		switch (speed) {
+		case SPEED_10:
+		case SPEED_100:
+		case SPEED_1000:
 			priv->hw->ps = speed;
-		} else {
+			break;
+
+		default:
 			dev_warn(priv->device, "invalid port speed\n");
 			priv->hw->ps = 0;
+			break;
 		}
 	}
 }
-- 
2.47.3


