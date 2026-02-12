Return-Path: <linux-arm-msm+bounces-92637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNozFnIcjWnjzAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 01:18:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA221289F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 01:18:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0F455301FB7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 00:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE4A19992C;
	Thu, 12 Feb 2026 00:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="1Rxg+0OV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C36191F84;
	Thu, 12 Feb 2026 00:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770855524; cv=none; b=TItdwEOwyX2VR7+p8pV+pafVfpWSvs45aA88CUX00EJcIXTVSzV2AEmUqxfG7lDRjllTGyJ39YDtHuOhUWo4a1E7Wy+JfWs2G+z6FA02JFq25Pi99EP0NuaKcT5x1lz1u8Os37YsM8EGVstrhBxJkIEsaernCd4fW+zCmQe223o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770855524; c=relaxed/simple;
	bh=ponRsLXym26Cyio4myVuwatznH/bCdS9QJBuenSd58E=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=rhbGiMzCR5fX9UlEwJsAwZFnDRDa9Pnae4TnAft1tGHESEL5VEj49C5T9YpwvQDUO8Z36OhaliaarNNm+Y8GLnZee236enTSkNLzACJdi+seOSpPqOL2WmEQ7hnRdujjt+uGfdRwMYNznxKYOiYMr3ohd3p7I/sh7C80hr7Waew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=1Rxg+0OV; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zoQIxxHW3tQ5dnCFOqob5W7fQFN7g3GYarRZ45HNHYs=; b=1Rxg+0OV3AQHi1q07t/l9YydOM
	tWI6MmkyhqfHFBBcMba/fiyd1sKo+dNvdfwlmkQrFUxOoDnT6DXkJx/XrQrKXtE/Syo67+j02NM/F
	FWq1MosJl4D8g9he5U1AJBvVsOQ1AQA3LfFLZE1u64wxZIjjqVHe/ZecM/VcWs7bOQM/ls/z7QZeM
	muDlKDQzgiep3maMBH9qUXZe6LrQl/7rpEwJpZ0MaB20hlO196uLWVppYI4w/qjSnVdxaNphWa+S3
	h+xV6IcrEIM6gf1VRjJJKaHISVd6iCl3Lo2/vmmz4sN+io6tpGaBNjQYXoCSSMawsrNdJsk+QzAvs
	NZWZrYTA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42312 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vqKPT-000000003qD-1Ou7;
	Thu, 12 Feb 2026 00:18:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vqKPQ-000000093ml-3FLd;
	Thu, 12 Feb 2026 00:18:16 +0000
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
Subject: [PATCH RFC net-next 7/9] net: stmmac: qcom-ethqos: pass phy interface
 mode to configs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vqKPQ-000000093ml-3FLd@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 12 Feb 2026 00:18:16 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92637-lists,linux-arm-msm=lfdr.de,kernel];
	URIBL_MULTI_FAIL(0.00)[rmk-PC.armlinux.org.uk:server fail,armlinux.org.uk:server fail,sin.lore.kernel.org:server fail];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AAA221289F5
X-Rspamd-Action: no action

Pass the current phylink phy interface mode to the RGMII and "SGMII"
configuration functions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 9b29516a5a7c..e2dd334ffd31 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -100,7 +100,8 @@ struct ethqos_emac_driver_data {
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
-	void (*configure_func)(struct qcom_ethqos *ethqos, int speed);
+	void (*configure_func)(struct qcom_ethqos *ethqos,
+			       phy_interface_t interface, int speed);
 
 	unsigned int link_clk_rate;
 	struct clk *link_clk;
@@ -521,7 +522,8 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
-static void ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_configure_rgmii(struct qcom_ethqos *ethqos,
+				   phy_interface_t interface, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
 	unsigned int i;
@@ -605,7 +607,8 @@ static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
 /* On interface toggle MAC registers gets reset.
  * Configure MAC block for SGMII on ethernet phy link up
  */
-static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
+				   phy_interface_t interface, int speed)
 {
 	struct net_device *dev = platform_get_drvdata(ethqos->pdev);
 	struct stmmac_priv *priv = netdev_priv(dev);
@@ -638,9 +641,10 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 	}
 }
 
-static void ethqos_configure(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_configure(struct qcom_ethqos *ethqos,
+			     phy_interface_t interface, int speed)
 {
-	return ethqos->configure_func(ethqos, speed);
+	return ethqos->configure_func(ethqos, interface, speed);
 }
 
 static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
@@ -649,7 +653,7 @@ static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
 	struct qcom_ethqos *ethqos = priv;
 
 	ethqos_update_link_clk(ethqos, speed);
-	ethqos_configure(ethqos, speed);
+	ethqos_configure(ethqos, interface, speed);
 }
 
 static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
-- 
2.47.3


