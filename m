Return-Path: <linux-arm-msm+bounces-92638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMnhDYYcjWnjzAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 01:19:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ACD128A0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 01:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BCDE30292D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 00:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0449B192B7D;
	Thu, 12 Feb 2026 00:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="J4acbZB5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587F119992C;
	Thu, 12 Feb 2026 00:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770855529; cv=none; b=IY8oME0wNEy+qe3QREv6rkaUzVBfLEBNJO/5ENeM14zA3FLR33Po78lW6bjPDbTaL/917dkf+vkZ0xhpqHc/2HEcRV7SO7aMVfxJVLj/ibwnYWBYqLCvEX5e9IZKA80OfUjWtwWn9HA+3Gx8SmqNr5rKJqgkKCuWN1KsFbjYiyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770855529; c=relaxed/simple;
	bh=oQnKIcgD/crflYCb3XE9yIWPUCwPGS2IzOYB1LCaZZg=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=jHv/p+nXji67KPsm7QvhcjuqjHb+pPceAW6rnL2Op4QlYeM4VhO9NVa8hbE647rUpGH+mPreWutmlD3+qYvonWr5/p0m4FbQ7eVTSwmwYzGha6HJEnSvmkfu0pOHrYH3O+zNRU64GkhAzts4QRNw581DZ08org6KgMUhdoOo7N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=J4acbZB5; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NUU3G2pIPKImDdviFDBqLROKqQ1tK+TJdl6js+E9CcQ=; b=J4acbZB5ZnKs8MjsZlf/bQBibg
	6p4plPz9zs94RfUBSHH/Ijz8bVK54YTqi62xQx2w/vV+JYumtPGNlvwhtKzzH2ZWdAWyci7VJeAcx
	GrJp7DAfOy5DoPjxUh0LoPLmHwJHw1Io9/Aq6y6xj4R8+u6DH9Jqjw9l8M7BHjfKaBYjOQeLsnmdu
	prBf8aP1pnTfjiXuBI1XzM3QI/3JXYzkUhJ3lp+grl9r5edY+XCp/yu807v+lKxLDW19Gw2Rrth1Z
	FSO7Jpmj+5V6cFwKEdQv+zn+YJ/UWdkhyI8ZEl1y178mY0eSd10xI7JyAntfBGXZ+Yio85ai6UsVz
	9Cu8ChWQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51160 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vqKPY-000000003qW-3dB8;
	Thu, 12 Feb 2026 00:18:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vqKPV-000000093mr-3iT0;
	Thu, 12 Feb 2026 00:18:21 +0000
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
Subject: [PATCH RFC net-next 8/9] net: stmmac: qcom-ethqos: use phy interface
 mode for inband
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vqKPV-000000093mr-3iT0@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 12 Feb 2026 00:18:21 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92638-lists,linux-arm-msm=lfdr.de,kernel];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail,rmk-PC.armlinux.org.uk:server fail,armlinux.org.uk:server fail];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: D3ACD128A0E
X-Rspamd-Action: no action

qcom-ethqos currently forces inband to be enabled for the Cisco SGMII
speeds (1G, 100M and 10M) but not for 2500BASE-X (2.5G).

Rather than using the speed to determine the forced inband state, use
phylink's PHY interface mode which will switch between SGMII for the
10M, 100M and 1G speeds, and 2500BASE-X for 2.5G.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c         | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e2dd334ffd31..cd6d1660bdb2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -615,30 +615,26 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
 
 	switch (speed) {
 	case SPEED_2500:
-		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
-			      RGMII_IO_MACRO_CONFIG2);
-		ethqos_set_serdes_speed(ethqos, SPEED_2500);
-		ethqos_pcs_set_inband(priv, false);
-		break;
 	case SPEED_1000:
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
-		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_100:
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
-		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_10:
 		rgmii_updatel(ethqos, RGMII_CONFIG_SGMII_CLK_DVDR,
 			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR,
 					 SGMII_10M_RX_CLK_DVDR),
 			      RGMII_IO_MACRO_CONFIG);
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
-		ethqos_pcs_set_inband(priv, true);
 		break;
 	}
+
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		ethqos_set_serdes_speed(ethqos, SPEED_1000);
+	else
+		ethqos_set_serdes_speed(ethqos, SPEED_2500);
+
+	ethqos_pcs_set_inband(priv, interface == PHY_INTERFACE_MODE_SGMII);
 }
 
 static void ethqos_configure(struct qcom_ethqos *ethqos,
-- 
2.47.3


