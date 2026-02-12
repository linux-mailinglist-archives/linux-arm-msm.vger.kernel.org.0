Return-Path: <linux-arm-msm+bounces-92633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BwHG2ccjWnjzAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 01:18:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C59091289DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 01:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A10D73094FBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 00:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DA618E025;
	Thu, 12 Feb 2026 00:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="e97rYoGw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A333A1D2;
	Thu, 12 Feb 2026 00:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770855490; cv=none; b=GuTe6QwBobNww+ZTNpD2Q7kZVlSCtEukIRVx5+WUoUUpr6NxNniN0CFUftIEOCFJ0/Tjx14H97aR0+tpwEIxZjsES5Ug/uPXadwPyMq8Fz5I1Hkhj2M0cp27bi/H/fg1SyZHcJHFvbsQ9cBExj7Rlc+WaS48BTZPvHUFgT2dFCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770855490; c=relaxed/simple;
	bh=4ZBvzq+/SkyFJ7sEKFCWU3bMbnXx6S+yJcNKlkWevLQ=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=nLrtd0j9jgq8QspWgDciFYllsWUAUxj83HJq/bQckCpZtT8f3rvuGm6aMZtabzgA18zM1TNO+U0IF7bP4+9/jQSPGW4URicMeTTWZlvgwrBEtcmdyiIwVUeYyYFuvCAfgL96lpQPWWcORPAJeYQMc8CWOrIbpQN8V1z8zTrch5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=e97rYoGw; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DXKMrkHkGDllrLxi/aKrUsxEpaICVURMuz9xDlbG98g=; b=e97rYoGwZjwRBtzR/+owI00niF
	Qb5aTCp6g2MrMMhEcrPZvMh0+nIHMic2DIzKB7ucyx4aqJOuA72ncQDpU1z0dO2oahrvwXxv7kdLj
	bD0BhQk8ir1mOHQHEw95PaLJk9Tao/wnocjo4lq+LTDqvWPjr13szqCiIQ5yoEo3mw28dzVAVK+41
	N1V9oNOXE7E+ULKcsaN71vp19IAgqpVq2dQuMpHw/FbPu3PtucRG6MS6hhNa/oAu2/rcM3IRzE37e
	/Fe9LhAqLdiWqiolaFN2KiJrl1nmsXYm5mVN4kSqJVrjuIWxK47HqsjhPor2MQdzOg8rf/UxqbFf9
	oL3Zzj/w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50148 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vqKP7-000000003oy-0YaC;
	Thu, 12 Feb 2026 00:17:57 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vqKP6-000000093mN-1IDF;
	Thu, 12 Feb 2026 00:17:56 +0000
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
Subject: [PATCH RFC net-next 3/9] net: stmmac: qcom-ethqos: change
 ethqos_configure*() to return void
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vqKP6-000000093mN-1IDF@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 12 Feb 2026 00:17:56 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92633-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rmk-PC.armlinux.org.uk:mid,armlinux.org.uk:email]
X-Rspamd-Queue-Id: C59091289DD
X-Rspamd-Action: no action

The ethqos_configure*() family of functions always return zero, and the
return value is never checked. Change the int return type to void.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 50b95fd19f9d..168f0fed68c0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -100,7 +100,7 @@ struct ethqos_emac_driver_data {
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
-	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
+	void (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
 	unsigned int link_clk_rate;
 	struct clk *link_clk;
@@ -522,7 +522,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
-static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
 	unsigned int i;
@@ -587,8 +587,6 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 		ethqos_dll_configure(ethqos);
 
 	ethqos_rgmii_macro_init(ethqos, speed);
-
-	return 0;
 }
 
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
@@ -607,7 +605,7 @@ static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
 /* On interface toggle MAC registers gets reset.
  * Configure MAC block for SGMII on ethernet phy link up
  */
-static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 {
 	struct net_device *dev = platform_get_drvdata(ethqos->pdev);
 	struct stmmac_priv *priv = netdev_priv(dev);
@@ -638,11 +636,9 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 		ethqos_pcs_set_inband(priv, true);
 		break;
 	}
-
-	return 0;
 }
 
-static int ethqos_configure(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_configure(struct qcom_ethqos *ethqos, int speed)
 {
 	return ethqos->configure_func(ethqos, speed);
 }
-- 
2.47.3


