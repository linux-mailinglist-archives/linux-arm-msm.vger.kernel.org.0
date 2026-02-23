Return-Path: <linux-arm-msm+bounces-93630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Er7Ob8fnGkZ/wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:37:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51089174029
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDB35305BAAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9588834F24A;
	Mon, 23 Feb 2026 09:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="iuyCy5/e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6FC2116F4;
	Mon, 23 Feb 2026 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771839295; cv=none; b=HGygxNz6+aTG4u8elJY18fF9gV/J2/0WdeajXs5h05Hag9wYFUPSt3VyzQYDkSjnUhufjEsVYaKD32Tydi2q7GX1lup6KB5VmxeGO5lVBWxm5E+xU+4lcCgN2L4vmHIOwNhMlKzMAxpBuNDrCK88A24Actf9JChU9aNTMZdZe70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771839295; c=relaxed/simple;
	bh=t4nXy8VV1pdp2AytzCdZm6ysUN4htiCIr75YfoE7VHQ=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=GbCyKGd+gGvp6kgDsO1zyebs8HoFpI+oBn3o7z5rdWJ1HdctCXRbMMNe+te/819PYhqaUSd9Izno0k0MHsrv2OrCtNtRcJe5yam3cbu1KHJsjFY2Emrxqwc/PHgiGVzYKrwYurAe2gafm0mEU9cwFKC85WVvDW8KyZqcQXD98xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=iuyCy5/e; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xX88IRJ5ZZJcwEtQ+Finc0oqOM/Lw45R/MHMHRGIA+Y=; b=iuyCy5/eATQt1ibrp4ccTrE6F9
	o3rfnXojxkLjyo16eXhBZ4Fump3b40lpmRILAolBztxBE6W7NHBXlekinWSKEAW1v4nzO7HPdf9Kq
	gJ9j/nqoL8NDOtVTU6Sj0tevC0TXw7y5uOFfpbH6KJPnFpGfJCmb+6TFBf3cxRKTgTe5Uq7BC2Z5g
	3FjxLu6WO8V46H/E13IZ5GabPQxM2TYLDE85ZiEloI6gKXEhTs1QFGLpwJNeVXKn3r5nbICePtMsv
	p6nnXuNE9gvEROxLOmuMpb6dqtwxhvJQ+WDIs7MOChZElTYEUhj77fZau8aF0ohk0oscB9ebjCSKO
	LjNYUpJQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52934 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vuSKo-000000003mv-205i;
	Mon, 23 Feb 2026 09:34:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vuSKl-0000000ASc1-18ka;
	Mon, 23 Feb 2026 09:34:31 +0000
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
Subject: [PATCH net-next 04/10] net: stmmac: qcom-ethqos: move
 qcom_ethqos_set_sgmii_loopback() up
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vuSKl-0000000ASc1-18ka@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 23 Feb 2026 09:34:31 +0000
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
	TAGGED_FROM(0.00)[bounces-93630-lists,linux-arm-msm=lfdr.de,kernel];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 51089174029
X-Rspamd-Action: no action

ethqos_set_func_clk_en() configures both SGMII loopback and the RGMII
functional clock setting. qcom_ethqos_set_sgmii_loopback() is only
called from within ethqos_set_func_clk_en(), and checks for
PHY_INTERFACE_MODE_2500BASEX.

Move qcom_ethqos_set_sgmii_loopback() to the callers of
ethqos_set_func_clk_en() except for ethqos_configure_rgmii() where we
know that ethqos->phy_mode will not be PHY_INTERFACE_MODE_2500BASEX.

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 168f0fed68c0..964eca46a653 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -204,7 +204,6 @@ qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 
 static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 {
-	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	rgmii_setmask(ethqos, RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
 }
 
@@ -532,6 +531,7 @@ static void ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	for (i = 0; i < ethqos->num_rgmii_por; i++)
 		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
 			     ethqos->rgmii_por[i].offset);
+
 	ethqos_set_func_clk_en(ethqos);
 
 	/* Initialize the DLL first */
@@ -701,6 +701,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 * cycled. The actual configuration will be adjusted once
 		 * ethqos_fix_mac_speed() is invoked.
 		 */
+		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
 		clk_disable_unprepare(ethqos->link_clk);
@@ -809,6 +810,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
+
+	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);
 
 	plat_dat->bsp_priv = ethqos;
-- 
2.47.3


