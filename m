Return-Path: <linux-arm-msm+bounces-90313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCOCHURFc2lEuQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:54:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1706673AE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 407D3300B1BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 09:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12C837883E;
	Fri, 23 Jan 2026 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="RHI/9xIW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF83633F8A2;
	Fri, 23 Jan 2026 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162040; cv=none; b=KP3GTAwrkAsATYy961D0kScpfhMxY0DijWFiVqVj1Ou+Q2x01c7XBrTKkEd0/7AZTIGiyokJDLYn/Eh+w0XuCMpAdK2QR72na/UrbkT3BvfutJImw3qsDeYEc4D6QXNFtTW+qZG82r2br5HQuSg5hGONMi0t4YpA4k46N/sL7WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162040; c=relaxed/simple;
	bh=56CE9R5aafUvOC0Qr9SX3HByrWjX36UjEl7BS91y2w4=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=ivHMXHblxRMANYuQ71hYyY974kCAGnMULXb45dSQNjeXKNvOz3d+KW3fduHFxwaXaD//hdwYbJzd7tKS4Pk0ZnbR9wpR2/h8/5+eCaUYBtfwjIf+JPwKL342A4lZwFI/gyT+0CSXb65JKozSKrjHz125dkkOAcEhds1SZ6+jYIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=RHI/9xIW; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PZh72J4Tq0dy1l0Nj6WDkQvyxSW++B/372OvBmFERyE=; b=RHI/9xIWGsDOmWMK4mC5AJqS0L
	RiHFE/FZokoU28ceizHz7GtZ4VNky7e2hxE9kr8renMePrEAYVFRc9oU4qe8lpZzgkEQluz5715w4
	TOKSHASY17fV2PZ51KFV0FaHZZSDp2Wwqu2WGEklrm1w5F5gGXWDGcKwwVxErzLtX8wnTmPyn0KYC
	ZuxcE1HR/3/B7Yjrarkv0lMc/RFNY/19MR0svoE45f4yMm68lebZCJyY6J5oF07McNrpsAxMx1vUM
	ZX4a6k9CpCfutjfrdb/CWNtqMYaKRZIAagbIKJVdqqtdbTVnUph7OAbDtvpTNRxbD2k9ZdItAnttq
	QmVoy0Ug==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37516 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vjDrJ-000000001b1-0g2T;
	Fri, 23 Jan 2026 09:53:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vjDrH-00000005fQL-0QPb;
	Fri, 23 Jan 2026 09:53:39 +0000
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
Subject: [PATCH net-next v2 04/14] net: stmmac: wrap phylink's rx_clk_stop
 functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vjDrH-00000005fQL-0QPb@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 23 Jan 2026 09:53:39 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90313-lists,linux-arm-msm=lfdr.de,kernel];
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
	NEURAL_HAM(-0.00)[-0.807];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1706673AE3
X-Rspamd-Action: no action

With generic SerDes support, stmmac will need to do more work to ensure
that clk_rx_i is running in all configurations. Rather than turn each
site that calls phylink_rx_clk_stop_xxx() into a list of functions,
move these to their own pair of functions so that they can be
augmented at a single location.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 32 ++++++++++++-------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c2589f02ff7e..24a2555ca329 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3547,6 +3547,16 @@ static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
 	}
 }
 
+static void stmmac_clk_rx_i_require(struct stmmac_priv *priv)
+{
+	phylink_rx_clk_stop_block(priv->phylink);
+}
+
+static void stmmac_clk_rx_i_release(struct stmmac_priv *priv)
+{
+	phylink_rx_clk_stop_unblock(priv->phylink);
+}
+
 /**
  * stmmac_hw_setup - setup mac in a usable state.
  *  @dev : pointer to the device structure.
@@ -3578,12 +3588,12 @@ static int stmmac_hw_setup(struct net_device *dev)
 	 * Block the receive clock stop for LPI mode at the PHY in case
 	 * the link is established with EEE mode active.
 	 */
-	phylink_rx_clk_stop_block(priv->phylink);
+	stmmac_clk_rx_i_require(priv);
 
 	/* DMA initialization and SW reset */
 	ret = stmmac_init_dma_engine(priv);
 	if (ret < 0) {
-		phylink_rx_clk_stop_unblock(priv->phylink);
+		stmmac_clk_rx_i_release(priv);
 		netdev_err(priv->dev, "%s: DMA engine initialization failed\n",
 			   __func__);
 		return ret;
@@ -3591,7 +3601,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 
 	/* Copy the MAC addr into the HW  */
 	stmmac_set_umac_addr(priv, priv->hw, dev->dev_addr, 0);
-	phylink_rx_clk_stop_unblock(priv->phylink);
+	stmmac_clk_rx_i_release(priv);
 
 	/* Initialize the MAC Core */
 	stmmac_core_init(priv, priv->hw, dev);
@@ -3670,9 +3680,9 @@ static int stmmac_hw_setup(struct net_device *dev)
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
 
-	phylink_rx_clk_stop_block(priv->phylink);
+	stmmac_clk_rx_i_require(priv);
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
-	phylink_rx_clk_stop_unblock(priv->phylink);
+	stmmac_clk_rx_i_release(priv);
 
 	return 0;
 }
@@ -6107,9 +6117,9 @@ static int stmmac_set_features(struct net_device *netdev,
 	else
 		priv->hw->hw_vlan_en = false;
 
-	phylink_rx_clk_stop_block(priv->phylink);
+	stmmac_clk_rx_i_require(priv);
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
-	phylink_rx_clk_stop_unblock(priv->phylink);
+	stmmac_clk_rx_i_release(priv);
 
 	return 0;
 }
@@ -6378,9 +6388,9 @@ static int stmmac_set_mac_address(struct net_device *ndev, void *addr)
 	if (ret)
 		goto set_mac_error;
 
-	phylink_rx_clk_stop_block(priv->phylink);
+	stmmac_clk_rx_i_require(priv);
 	stmmac_set_umac_addr(priv, priv->hw, ndev->dev_addr, 0);
-	phylink_rx_clk_stop_unblock(priv->phylink);
+	stmmac_clk_rx_i_release(priv);
 
 set_mac_error:
 	pm_runtime_put(priv->device);
@@ -8192,11 +8202,11 @@ int stmmac_resume(struct device *dev)
 	stmmac_init_timestamping(priv);
 
 	stmmac_init_coalesce(priv);
-	phylink_rx_clk_stop_block(priv->phylink);
+	stmmac_clk_rx_i_require(priv);
 	stmmac_set_rx_mode(ndev);
 
 	stmmac_restore_hw_vlan_rx_fltr(priv, ndev, priv->hw);
-	phylink_rx_clk_stop_unblock(priv->phylink);
+	stmmac_clk_rx_i_release(priv);
 
 	stmmac_enable_all_queues(priv);
 	stmmac_enable_all_dma_irq(priv);
-- 
2.47.3


