Return-Path: <linux-arm-msm+bounces-93633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAFBN/kfnGkZ/wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:38:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 424E7174048
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 953E7303F7DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E32334E75E;
	Mon, 23 Feb 2026 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="GmK/P9nW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ACE1DF27D;
	Mon, 23 Feb 2026 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771839318; cv=none; b=IKnYvf4Q8KG/3SYYB3BS5WM8WYk80eo9meWRc9VnDbYYZl6YrVD0GHLorT6WME1IoZ2eFFNct1Rup88EzRIkZ+2vPnOCG8h34AawOC4OCIyDTTtcijDuUqijyu8yzpGAcwqqAXJf/Dsf5rY8qVGKepuC5rdSTnudDE5b/W4QEtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771839318; c=relaxed/simple;
	bh=+lakLNx1DaTib+X5ztHIkM2wVLUCpdC6jauweGVWFb8=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=puM7iX7G5DMRIgXztPge2/Zb8A86isQ2kSIWSi1IQkIhW06Dm8f1Z44fAxql5hvNlNesgm6JcfAMcD1XQRZRtGbgbBJJ2gM+Jc9Kc6GeGO0gjunY+EeAw1nzPw74kl7Sngz4/knOUyJTLOkgUfd0vHibrOK5GcFyR2nthkKMApg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=GmK/P9nW; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D+r2O9TDkv2B1RgekoZmNt5y+3kSqTj3CgLoC/xyn3w=; b=GmK/P9nWAgETRakxO3QLOlTlN9
	ToZjx8U99dsXy8udQ1iegHVS4GHiSp2BadkexENr2dgevK8AtjChhyyf1aEBrEt9FXyvlnZuQ6qXD
	HbxGTcaobV6qQnWCIOTsu181mpj2cgUbho3gy/yMMTtmvo+f99uekZcA2XnusuTdmLyOGJpN5vemf
	EOogg9DNYg+jZi2esfleNeiCFSdR1Ti4GaFvlJ/nZqqx81g6pRNrakhhgQQtG+E9pEJQyGUH/CYsz
	06vdBxZp/xccCCJC6abR2g6W5O8o0TOas7NdfufjVsm8loucT16uMb4da2/xTuvq+5HrfXV+7S/SQ
	OHrMoxMg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59756 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vuSL5-000000003nm-00Np;
	Mon, 23 Feb 2026 09:34:51 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vuSL0-0000000AScM-2TN0;
	Mon, 23 Feb 2026 09:34:46 +0000
In-Reply-To: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
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
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 07/10] net: stmmac: qcom-ethqos: pass phy interface
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
Message-Id: <E1vuSL0-0000000AScM-2TN0@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 23 Feb 2026 09:34:46 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93633-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.961];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,qualcomm.com:email,rmk-PC.armlinux.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 424E7174048
X-Rspamd-Action: no action

Pass the current phylink phy interface mode to the RGMII and "SGMII"
configuration functions.

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
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


