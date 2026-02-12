Return-Path: <linux-arm-msm+bounces-92634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJXbK00cjWnjzAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 01:18:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D64D12897D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 01:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F2EF30158B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 00:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB14A19005E;
	Thu, 12 Feb 2026 00:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="aN11oyG/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328CE18BC3D;
	Thu, 12 Feb 2026 00:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770855497; cv=none; b=o7HNyVAmEQ+7H+yONba/q/dGFCV9N+kdOmxmWhZojUjxNBtVzxWOYe/1aRgXn95tiyFRKeFM8VeF6bRC9GtTBWRBrLiKbfAqJeFY/XXy6RtKJTgqqSt/idi6XNo1hn4vI+O7FJhBzUOusVmyWAKDaGpz4H2VCZ3T6N2Q4xgf4WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770855497; c=relaxed/simple;
	bh=SXobWpRuXDxTqNVdV1OMwkCxedEQG+GVdF3EzaA20uw=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=dAxu/nV5OOBjQKCSp+TYJS2ufK/AaMjxEGg2ZYL+CMF8+g6330npFJJe4t7Fv+rEkE+lUSobWnBkp59sx8rEch145qdG93dcwsofocK1ZPnVIL7Jfa+Lg5ybzo89js1xmUBBHR0fx3Q3tgBRCeGGLVkLHat8fbhxGjNZhvQ2Orw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=aN11oyG/; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b4+wi1Keu3e9oZccLPlt1NgUt68FItsUTzsLxnrDVJg=; b=aN11oyG/dAlbSw2zndj+D8oeb1
	fAPhz5nKArnTijO6aYRsHzy1fNOsDN6W2sKuG9cxN+KDf5t3Qq9RrySsTvJm8zXUFrBdLc8T30bcU
	Vexox/C19EeLItVvzx5B99XYjXpOvOe+OSprx8zVLDYvcjtz2ftsdXd2H0aiMxt/HZr2qKfEHnu1p
	0QK5EPb4PwRoSEnFfdoPXgUfcn4m4R5OlW2yomfUHhJll9Hhatnp8oAXRoV3ehScYu0F9O1XRUW6Y
	Ck/8jWdIsYHNgC+rjcqNPABsOqJDni66sibb6/2ytJSVZS9EGxuJiT4Q8O5TGAxE0EljfZJwo6ivi
	s8R60/tw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48776 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vqKPD-000000003pH-0VLu;
	Thu, 12 Feb 2026 00:18:03 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vqKPB-000000093mT-1lwv;
	Thu, 12 Feb 2026 00:18:01 +0000
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
Subject: [PATCH RFC net-next 4/9] net: stmmac: qcom-ethqos: move
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
Message-Id: <E1vqKPB-000000093mT-1lwv@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 12 Feb 2026 00:18:01 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92634-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2D64D12897D
X-Rspamd-Action: no action

ethqos_set_func_clk_en() configures both SGMII loopback and the RGMII
functional clock setting. qcom_ethqos_set_sgmii_loopback() is only
called from within ethqos_set_func_clk_en(), and checks for
PHY_INTERFACE_MODE_2500BASEX.

Move qcom_ethqos_set_sgmii_loopback() to the callers of
ethqos_set_func_clk_en() except for ethqos_configure_rgmii() where we
know that ethqos->phy_mode will not be PHY_INTERFACE_MODE_2500BASEX.

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


