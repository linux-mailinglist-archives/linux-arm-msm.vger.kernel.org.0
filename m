Return-Path: <linux-arm-msm+bounces-95164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EmwFg4Ep2k7bgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 16:53:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EB01F2FF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 16:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C6B7300E5AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 15:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2DF4921A4;
	Tue,  3 Mar 2026 15:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="ofNURUQB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88609492192;
	Tue,  3 Mar 2026 15:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553228; cv=none; b=LBssWOXLpkuvIaFCtxjqHx3NyJVo2BnXfDkkSDX9WN8YxJMmD6hGqQJ+X6pVijQWTrhM2nDBU1hYBifMZxhjiVgapOIsIwL5mAsaQePjDGlKKnVU24K51/QUAPA0f6O0DxZYr1baZilSVG1oWlOelgZ2R5OSIl9AFPbQOc1APF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553228; c=relaxed/simple;
	bh=/FrNMfItIhKsRtFsjyAOjM52r6RWmUh1RPKLI9EVTlc=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=cPfAtLzh+19fIWQjGYi3QbuxHVxNwUybqATIY24uMv57oz7lQsztuwcY0a/2N3rEKg1C24lz8snQZm75qESUMWXtH636kKwmKjhhYaUuKDTRmyIvLUYIyKp1+8gwUMbG5KkPHP+KJdcBPEEMw969hXkadwI1t9DkHw5HeItSIpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=ofNURUQB; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KkOxIvc1SxSvRnjK0TVgvqiR/wze5PcXHdGWWYhDlA4=; b=ofNURUQBEmuivIf461QbdILwDf
	ZevCLv+SP0mAUlPVtH6gjr2XHrfcZ8G/ZXaTy8j4zBulXR41/weRvsy2arYQLIoegPEpbbqlJAmCf
	Ci/WHou2w8lJi2uogE7l3cS3iOqlWk1is7rmZ2ogIcL1V3Bgq5U+MkgRRhr34Ob0eo+sjuhsyFzz4
	UBbjDOQ6MhSjJLw6B8qbuoRAViIzMk95pk7lbrvc9cjDYxH1/Lzou2EZoKlNscZT/ENtCp9u6HxkG
	TzhcjLyMng9chc6WnEn2QUx1h9J4opcXyw4dJlUENqinoEanoCqG+U5ncl4r50tXDDzFx24Ca9R2R
	UifsR70A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48794 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vxS45-000000005Jo-2VTC;
	Tue, 03 Mar 2026 15:53:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vxS44-0000000BQXU-38lG;
	Tue, 03 Mar 2026 15:53:40 +0000
In-Reply-To: <aacD3osfaZkLsGxm@shell.armlinux.org.uk>
References: <aacD3osfaZkLsGxm@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next v2 2/7] net: stmmac: qcom-ethqos: convert to use
 phy_set_mode_ext()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vxS44-0000000BQXU-38lG@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 03 Mar 2026 15:53:40 +0000
X-Rspamd-Queue-Id: 03EB01F2FF6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95164-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_SPAM(0.00)[0.175];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,armlinux.org.uk:email]
X-Rspamd-Action: no action

qcom-sgmii-eth now accepts the phy_set_mode*() calls to configure the
SerDes, taking a PHY interface mode rather than a speed. This allows
the elimination of the interface mode to speed conversion in
ethqos_mac_finish_serdes().

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 57cbe800f652..8913f6f02b9e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,7 +105,7 @@ struct qcom_ethqos {
 
 	struct clk *link_clk;
 	struct phy *serdes_phy;
-	int serdes_speed;
+	phy_interface_t serdes_mode;
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *rgmii_por;
@@ -653,7 +653,8 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 		return ret;
 	}
 
-	ret = phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
+	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+			       ethqos->serdes_mode);
 	if (ret) {
 		phy_power_off(ethqos->serdes_phy);
 		phy_exit(ethqos->serdes_phy);
@@ -675,20 +676,16 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 				    phy_interface_t interface)
 {
 	struct qcom_ethqos *ethqos = priv;
-	int speed, ret = 0;
+	int ret = 0;
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 
-	speed = SPEED_UNKNOWN;
-	if (interface == PHY_INTERFACE_MODE_SGMII)
-		speed = SPEED_1000;
-	else if (interface == PHY_INTERFACE_MODE_2500BASEX)
-		speed = SPEED_2500;
-
-	if (speed != SPEED_UNKNOWN && speed != ethqos->serdes_speed) {
-		ret = phy_set_speed(ethqos->serdes_phy, speed);
+	if (interface == PHY_INTERFACE_MODE_SGMII ||
+	    interface == PHY_INTERFACE_MODE_2500BASEX) {
+		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+				       interface);
 		if (ret == 0)
-			ethqos->serdes_speed = speed;
+			ethqos->serdes_mode = interface;
 	}
 
 	return ret;
@@ -819,7 +816,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
 				     "Failed to get serdes phy\n");
 
-	ethqos->serdes_speed = SPEED_1000;
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
 			       SPEED_1000);
 
@@ -843,6 +839,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		plat_dat->host_dma_width = data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
+		ethqos->serdes_mode = PHY_INTERFACE_MODE_SGMII;
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}
-- 
2.47.3


