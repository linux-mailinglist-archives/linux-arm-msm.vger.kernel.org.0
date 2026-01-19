Return-Path: <linux-arm-msm+bounces-89660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6D3D3A8F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31D0E30024D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8590A35B140;
	Mon, 19 Jan 2026 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="f4V0kyss"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8838A28FFE7;
	Mon, 19 Jan 2026 12:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826084; cv=none; b=C9SjFbmuYwhezyLDPd4yvFcYPp35FCwROuoY9vqEgowgo0aXgVgDwEy26Nf5DsJAjS+5b0F1YgyOlZjrxjsi0FDtdM8+epCKhQ3ZFyA/RsIq2+5eNwOZOCXNHf5FvDltmxwTuY9/EVPzCjsMgTHuisj3bVSVZaCE1sR1qrz/y74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826084; c=relaxed/simple;
	bh=Mkl0P4UVCtewya7IlQvFxF2rpNhPVtWfFlJKQphdGEw=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=mifW2JZXqje/k8P4h0zPMi2PVFugEbAlxDm5WILORn9Z7diZXryJhygbYEg6FHW0ILQ+Vwcm/BSNi6vqfFsseGI7iq+sNT/vJiqD1gNcjHgmtZAGQeYE5WnHEvAeVS1eHc02GJ02O3uDPn2gXPNG8ck3NH5pu/JgCmwuTuupSs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=f4V0kyss; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tDh4p51oLv7FOb/arX7mMuMExGy4+nCEFyLLly8x3eE=; b=f4V0kyss7JVm9mNGMqTOVtJno0
	rj3eDB2bJT/qW4aImOasG1/2iR1pH61kaCgXpJWmrzhaKaOn69aDUrBSM8NJaOHYALKzXgPfx5z0/
	jwqZA7xgIqOGxhctybUTcmhem/0HxNdVURX06uoilYZNXVwGT5NrAsfoIQSuRmK5A+WIoiaTC9rFU
	Wv5j36ze0JAcrjIlPkhenxHcg3awWTb8caaTV+rx/HVGwNPJ5fnso7ND3G9oaA4U8pNTVTbtSejOZ
	9yK24tFr+sXuPXYDLm0vycK1oCLrcQlbw1/9M7IbScSqXEnOGtMn9RZ3alERJgu6SBH8Qeu27LuiM
	Gu4loP7A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46532 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vhoSa-0000000053c-3azv;
	Mon, 19 Jan 2026 12:34:21 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vhoSX-00000005H1x-0N69;
	Mon, 19 Jan 2026 12:34:17 +0000
In-Reply-To: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 08/14] net: stmmac: handle integrated PCS
 phy_intf_sel separately
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vhoSX-00000005H1x-0N69@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 19 Jan 2026 12:34:17 +0000

The dwmac core has no support for SGMII without using its integrated
PCS. Thus, PHY_INTF_SEL_SGMII is only supported when this block is
present, and it makes no sense for stmmac_get_phy_intf_sel() to decode
this.

None of the platform glue users that use stmmac_get_phy_intf_sel()
directly accept PHY_INTF_SEL_SGMII as a valid mode.

Check whether a PCS will be used by the driver for the interface mode,
and if it is the integrated PCS, query the integrated PCS for the
phy_intf_sel_i value to use.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 ++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c  |  9 +++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h  |  2 ++
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6c515f9efbe7..5254d9d19ffe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3135,8 +3135,6 @@ int stmmac_get_phy_intf_sel(phy_interface_t interface)
 		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 	else if (phy_interface_mode_is_rgmii(interface))
 		phy_intf_sel = PHY_INTF_SEL_RGMII;
-	else if (interface == PHY_INTERFACE_MODE_SGMII)
-		phy_intf_sel = PHY_INTF_SEL_SGMII;
 	else if (interface == PHY_INTERFACE_MODE_RMII)
 		phy_intf_sel = PHY_INTF_SEL_RMII;
 	else if (interface == PHY_INTERFACE_MODE_REVMII)
@@ -3150,13 +3148,24 @@ static int stmmac_prereset_configure(struct stmmac_priv *priv)
 {
 	struct plat_stmmacenet_data *plat_dat = priv->plat;
 	phy_interface_t interface;
+	struct phylink_pcs *pcs;
 	int phy_intf_sel, ret;
 
 	if (!plat_dat->set_phy_intf_sel)
 		return 0;
 
 	interface = plat_dat->phy_interface;
-	phy_intf_sel = stmmac_get_phy_intf_sel(interface);
+
+	/* Check whether this mode uses a PCS */
+	pcs = stmmac_mac_select_pcs(&priv->phylink_config, interface);
+	if (priv->integrated_pcs && pcs == &priv->integrated_pcs->pcs) {
+		/* Request the phy_intf_sel from the integrated PCS */
+		phy_intf_sel = stmmac_integrated_pcs_get_phy_intf_sel(priv,
+								    interface);
+	} else {
+		phy_intf_sel = stmmac_get_phy_intf_sel(interface);
+	}
+
 	if (phy_intf_sel < 0) {
 		netdev_err(priv->dev,
 			   "failed to get phy_intf_sel for %s: %pe\n",
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 718e5360fca3..cf7337e9ed3e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -106,6 +106,15 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 	}
 }
 
+int stmmac_integrated_pcs_get_phy_intf_sel(struct stmmac_priv *priv,
+					   phy_interface_t interface)
+{
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		return PHY_INTF_SEL_SGMII;
+
+	return -EINVAL;
+}
+
 int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 			       u32 int_mask)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 887c4ff302aa..845bcad9d0f7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -43,6 +43,8 @@ phylink_pcs_to_stmmac_pcs(struct phylink_pcs *pcs)
 
 void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 			       struct stmmac_extra_stats *x);
+int stmmac_integrated_pcs_get_phy_intf_sel(struct stmmac_priv *priv,
+					   phy_interface_t interface);
 int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 			       u32 int_mask);
 
-- 
2.47.3


