Return-Path: <linux-arm-msm+bounces-92636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIiaLGMcjWnjzAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 01:18:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC02F1289C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 01:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1522E30200EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 00:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A5E192B90;
	Thu, 12 Feb 2026 00:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="rJRU1rgu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C606B8834;
	Thu, 12 Feb 2026 00:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770855516; cv=none; b=mBVuzQT1z2OP5BVG/D8MeifzGo4wVj2Td4BDhUrsGfjTihGPARhGBb4uGZddPQe6oYUznl7E9hQVhIHirn4hPX+rn6+OpHCDrsSrNQeVZI+Rp5sCCg5QAib/s29YggxicwYYZ0u4R3hvUZXGzzcgN2xWxnlbIQr4T5AA/vZctBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770855516; c=relaxed/simple;
	bh=4yVl18qaEMorolUPLHv8jLKLG37CYwMsWGbqqp3Ciu0=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=ZtuJ/FNFfj4XFMyfCK6uGtCoc1CgWbRfY+mqacYdLWQRWGwBoLXSyvo/kQ5gDr1NWHIhEpr99gdNiPND5hl0Mk1/hsiwNUYhk9Ub7ya0zDaZgLTVBC6UDD2pOdtXs5wfVve50q3gh97Qm17zrzc7599+naXBIZtBTuf9/iCoeo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=rJRU1rgu; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3PioIm2djrY5XkUhX/od0ojINqr3oaF8Vqt9+DCKUvI=; b=rJRU1rguu8eP2ZrKgKrjh5cM/c
	QQcqskDIL6g711Q4Vi9tFhThEos93YrNNe7vqSpOJFZ5F6sVQsRogiA9N14FeKxr2vcSUGCb/Av2X
	14Kwn5PohWfmMFt2jFpjaqtl0Pc7DZQjE31j+LMT3/eb5H7uUzdaG25NxedZcPELmWT1+ed7pc8ZB
	NNZUjR7LFH6hF/bpEtLDd+hw1l8ybVVx7z4MM0GAA0cEX+Vdzv7O4LI9IJ6OcRktJnHFU0a5s9yZc
	6rcYS0cN2QQWKDSIyNqidyCVYfD5uqAQbmW/9TVJzX9hjHNtsc+6Nl796afsFqX3Yrs4Ctuahzw0I
	x3AItdiQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42310 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vqKPN-000000003px-2XSQ;
	Thu, 12 Feb 2026 00:18:14 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vqKPL-000000093mf-2fkd;
	Thu, 12 Feb 2026 00:18:11 +0000
In-Reply-To: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH RFC net-next 6/9] net: stmmac: pass interface mode into
 fix_mac_speed() method
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vqKPL-000000093mf-2fkd@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 12 Feb 2026 00:18:11 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92636-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rmk-PC.armlinux.org.uk:mid,armlinux.org.uk:email]
X-Rspamd-Queue-Id: DC02F1289C6
X-Rspamd-Action: no action

Pass the current interface mode reported by phylink into the
fix_mac_speed() method. This will be used by qcom-ethqos for its
"SGMII" configuration.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c   |  3 ++-
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c       | 11 +++++++----
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c  |  3 ++-
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   |  3 ++-
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c   |  3 ++-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c       | 11 +++++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     |  3 ++-
 include/linux/stmmac.h                                |  3 ++-
 8 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index d043bad4a862..0495437d3a6e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -112,7 +112,8 @@ static int dwc_qos_probe(struct platform_device *pdev,
 #define AUTO_CAL_STATUS 0x880c
 #define  AUTO_CAL_STATUS_ACTIVE BIT(31)
 
-static void tegra_eqos_fix_speed(void *bsp_priv, int speed, unsigned int mode)
+static void tegra_eqos_fix_speed(void *bsp_priv, phy_interface_t interface,
+				 int speed, unsigned int mode)
 {
 	struct tegra_eqos *eqos = bsp_priv;
 	bool needs_calibration = false;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index c4e85197629d..9f5a15b81f8a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -48,7 +48,8 @@ struct imx_dwmac_ops {
 
 	int (*fix_soc_reset)(struct stmmac_priv *priv);
 	int (*set_intf_mode)(struct imx_priv_data *dwmac, u8 phy_intf_sel);
-	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
+	void (*fix_mac_speed)(void *priv, phy_interface_t interface,
+			      int speed, unsigned int mode);
 };
 
 struct imx_priv_data {
@@ -160,7 +161,8 @@ static int imx_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	return stmmac_set_clk_tx_rate(bsp_priv, clk_tx_i, interface, speed);
 }
 
-static void imx_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
+static void imx_dwmac_fix_speed(void *priv, phy_interface_t interface,
+				int speed, unsigned int mode)
 {
 	struct plat_stmmacenet_data *plat_dat;
 	struct imx_priv_data *dwmac = priv;
@@ -185,13 +187,14 @@ static void imx_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
 }
 
-static void imx93_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
+static void imx93_dwmac_fix_speed(void *priv, phy_interface_t interface,
+				  int speed, unsigned int mode)
 {
 	struct imx_priv_data *dwmac = priv;
 	unsigned int iface;
 	int ctrl, old_ctrl;
 
-	imx_dwmac_fix_speed(priv, speed, mode);
+	imx_dwmac_fix_speed(priv, interface, speed, mode);
 
 	if (!dwmac || mode != MLO_AN_FIXED)
 		return;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index d66ae6ea4df5..08ccd5b154a0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -143,7 +143,8 @@ static struct stmmac_pci_info loongson_gmac_pci_info = {
 	.setup = loongson_gmac_data,
 };
 
-static void loongson_gnet_fix_speed(void *priv, int speed, unsigned int mode)
+static void loongson_gnet_fix_speed(void *priv, phy_interface_t interface,
+				    int speed, unsigned int mode)
 {
 	struct loongson_data *ld = (struct loongson_data *)priv;
 	struct net_device *ndev = dev_get_drvdata(ld->dev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index bd5d3bf90400..9b29516a5a7c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -643,7 +643,8 @@ static void ethqos_configure(struct qcom_ethqos *ethqos, int speed)
 	return ethqos->configure_func(ethqos, speed);
 }
 
-static void ethqos_fix_mac_speed(void *priv, int speed, unsigned int mode)
+static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
+				 int speed, unsigned int mode)
 {
 	struct qcom_ethqos *ethqos = priv;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 4c8991f3b38d..c6b99814d391 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -72,7 +72,8 @@ struct socfpga_dwmac {
 	const struct socfpga_dwmac_ops *ops;
 };
 
-static void socfpga_dwmac_fix_mac_speed(void *bsp_priv, int speed,
+static void socfpga_dwmac_fix_mac_speed(void *bsp_priv,
+					phy_interface_t interface, int speed,
 					unsigned int mode)
 {
 	struct socfpga_dwmac *dwmac = (struct socfpga_dwmac *)bsp_priv;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index f50547b67fbc..6ebbf95d158f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -91,11 +91,13 @@ struct sti_dwmac {
 	struct regmap *regmap;
 	bool gmac_en;
 	int speed;
-	void (*fix_retime_src)(void *priv, int speed, unsigned int mode);
+	void (*fix_retime_src)(void *priv, phy_interface_t interface,
+			       int speed, unsigned int mode);
 };
 
 struct sti_dwmac_of_data {
-	void (*fix_retime_src)(void *priv, int speed, unsigned int mode);
+	void (*fix_retime_src)(void *priv, phy_interface_t interface,
+			       int speed, unsigned int mode);
 };
 
 enum {
@@ -114,7 +116,8 @@ static u32 stih4xx_tx_retime_val[] = {
 				 | STIH4XX_ETH_SEL_INTERNAL_NOTEXT_PHYCLK,
 };
 
-static void stih4xx_fix_retime_src(void *priv, int spd, unsigned int mode)
+static void stih4xx_fix_retime_src(void *priv, phy_interface_t interface,
+				   int spd, unsigned int mode)
 {
 	struct sti_dwmac *dwmac = priv;
 	u32 src = dwmac->tx_retime_src;
@@ -170,7 +173,7 @@ static int sti_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
 	val = (dwmac->interface == PHY_INTERFACE_MODE_REVMII) ? 0 : ENMII;
 	regmap_update_bits(regmap, reg, ENMII_MASK, val);
 
-	dwmac->fix_retime_src(dwmac, dwmac->speed, 0);
+	dwmac->fix_retime_src(dwmac, dwmac->interface, dwmac->speed, 0);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c63099a77cc0..a3f209fe54d7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1071,7 +1071,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 	}
 
 	if (priv->plat->fix_mac_speed)
-		priv->plat->fix_mac_speed(priv->plat->bsp_priv, speed, mode);
+		priv->plat->fix_mac_speed(priv->plat->bsp_priv, interface,
+					  speed, mode);
 
 	if (!duplex)
 		ctrl &= ~priv->hw->link.duplex;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 32352a216567..b96ae9dadfab 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -256,7 +256,8 @@ struct plat_stmmacenet_data {
 	int (*set_phy_intf_sel)(void *priv, u8 phy_intf_sel);
 	int (*set_clk_tx_rate)(void *priv, struct clk *clk_tx_i,
 			       phy_interface_t interface, int speed);
-	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
+	void (*fix_mac_speed)(void *priv, phy_interface_t interface,
+			      int speed, unsigned int mode);
 	int (*fix_soc_reset)(struct stmmac_priv *priv);
 	int (*serdes_powerup)(struct net_device *ndev, void *priv);
 	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
-- 
2.47.3


