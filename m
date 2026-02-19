Return-Path: <linux-arm-msm+bounces-93379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBQrFk4Hl2lmtwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:51:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E61E315EBE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BB41303454C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 12:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663543382D3;
	Thu, 19 Feb 2026 12:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Rx9ZGMRU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C8733342E;
	Thu, 19 Feb 2026 12:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771505454; cv=none; b=RB+sVg6A4GtUSSD4A1Q78NmQqN7D5fEU38NiHn/tdegqtVDhLWuJyeMiCGRuLpzsPgBv8QsEbQwJoeCu7st7ptGQS8zEBXjpiU0wHHETs/Ved7nBRuJ+GsPE8KNXyMmrbPLylgFWA3e0Ww0Kd/a9MU+pB9A8fu/t9xIj47CSP90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771505454; c=relaxed/simple;
	bh=8e28/SUXIU8y5G8jygy3uC8MvJUSiO/jPLYBNxtg6fw=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=ql3RlbTJlBfVvViupGS9WcCn1sm+KirhyScL2czrhlFJKVLokGuHIvC++7oe98ASn7p9Ht6M3Veus/viT8513IY9Dn4G16Lo3bwHcH72q7lukXyQgSCarTINx4OrlfLPKJ1aMBIS4U7ZnIDTkHboKjg0eKRws+tKZJmkB5/KjI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Rx9ZGMRU; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3/D8ubx8lq0Qo1+kyDRRsPyEEXL7yoci/blsWxCzbXw=; b=Rx9ZGMRUceOp1RA7VOQZnvu9y7
	K90Cd7QiNjC6bYYPHY1ihZarz7ejcd3Ef2kkMFy9r6lzTNkB8/eJQsXaKZGEQ7S7EoW8uDxfQbNgL
	8Xc2cs42w8ZP3gBg/JP7+3R1k2EbTL+98bRfKk5sjpIu5Yjc69C6tggNBIEKGGIJlPsrHocgdK+uO
	TJpVyQRShn/y3qINzCCppIHlabJucXkYIyhUaYUmOvc3I/h+B7ycmPt8bT+pSST8hH+hXLGpFp3Hx
	tF/bd2Se8SavkW7Wa2hvbz1hsvzI8pCl1dVySMbuecA5Bv/GExWudU711MGY5OdvenItgk/Bwzkju
	yZrneucg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58266 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vt3UT-000000000s2-3zxp;
	Thu, 19 Feb 2026 12:50:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vt3US-0000000A5eE-1RHM;
	Thu, 19 Feb 2026 12:50:44 +0000
In-Reply-To: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
References: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
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
Subject: [PATCH RFC net-next+ 4/9] net: stmmac: qcom-ethqos: convert to use
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
Message-Id: <E1vt3US-0000000A5eE-1RHM@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 19 Feb 2026 12:50:44 +0000
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
	TAGGED_FROM(0.00)[bounces-93379-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	NEURAL_HAM(-0.00)[-0.963];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: E61E315EBE9
X-Rspamd-Action: no action

qcom-sgmii-eth now accepts the phy_set_mode*() calls to configure the
SerDes, taking a PHY interface mode rather than a speed. This allows
the elimination of the interface mode to speed conversion in
ethqos_mac_finish_serdes().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 57cbe800f652..65316c603cae 100644
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
+	ret = phy_set_mode(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+			   ethqos->serdes_mode);
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
+		ret = phy_set_mode(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+				   interface);
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


