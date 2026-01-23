Return-Path: <linux-arm-msm+bounces-90318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FVeGipGc2mHuQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:58:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2971773C42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 643F2304F97C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 09:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F95437C0E9;
	Fri, 23 Jan 2026 09:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="W76WG/Bt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5412A353EFC;
	Fri, 23 Jan 2026 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162093; cv=none; b=PS1io3AdwDAOhHU8BMojZ0C43L+tOG5ESapP8IrwMtaXNbGOeDXET14sMuXMkGQ0osPmGUkGBv5zZwf1KKrljHATihElUYRVThq48eBeWiX8s5kBAbRwjI0kETFIVaYuRQOyCEHKuOid6jjwbli393izwL2YHyMie0zzSnC+tSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162093; c=relaxed/simple;
	bh=hxIow0PadhcL4Dk8AVGuUsPM+7z5+yYpKfH985TPu88=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=BA51pBB3iJhMvWq1AeicAYsfejpzVpcP9MXwPWXHjHaO8p18OGmgivHVXmKXBYseafwvN7VgJ4xz/d8p+FEneKaVF+fID0Js4frsAnBAjOk3AhcmsnxqsdsCQ30QLWJUxZA7Mx88iiNdK7UI29CkifwcrkQNk1EsVlYLrJth84k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=W76WG/Bt; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eptS1jKg/41yl5yBpoE86cezxFYdKwR8nv6vdTEw4OY=; b=W76WG/BtYNGMRBaNWX636j82RA
	aozyZ111XGYVhnye65He1gwFzYEQ5bjNmtfGCB+QIM1/j9ARCbMVWwNiOtv+bIcAgoMTKi9F+iYHu
	/4aPCN1JcemR6PIfDbafGN8qfLwfY+1Tae6hURgKtBtBgyOzfMdB2OE71qJBgW9sEG2l/WvuSb7rj
	0XaaskiBxpFopMFL+GdIO+uqWHf29UyMIdmz5OOQOUKRcpcgyD+VgNgdS5tzwJ1tDoojnQyKTnYcx
	4KIE5rBBUHEi8ymPdgOrLMm6hNDw4nzQnfyPQpiN/mpifo6dKDl33o2lWZfgMoqawR/VrjMBES1uW
	+CsHQ7Mw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48712 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vjDrh-000000001cE-2TTk;
	Fri, 23 Jan 2026 09:54:06 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vjDrb-00000005fQk-2A8T;
	Fri, 23 Jan 2026 09:53:59 +0000
In-Reply-To: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 08/14] net: stmmac: handle integrated PCS
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
Message-Id: <E1vjDrb-00000005fQk-2A8T@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 23 Jan 2026 09:53:59 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90318-lists,linux-arm-msm=lfdr.de,kernel];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[foss.st.com,lunn.ch,davemloft.net,google.com,kernel.org,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,bootlin.com,gmail.com,oss.qualcomm.com,linaro.org,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.808];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 2971773C42
X-Rspamd-Action: no action

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
index ac588756e450..1644e045cfb3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -108,6 +108,15 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
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


