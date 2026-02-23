Return-Path: <linux-arm-msm+bounces-93626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC/0LyQfnGkZ/wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:34:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D097173F40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E474E3001AFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD1A34E75C;
	Mon, 23 Feb 2026 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="WvyYcdiS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD14D344DAE;
	Mon, 23 Feb 2026 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771839266; cv=none; b=nK+zJh+dHoD27eMCACEg9b2wWQtdnFt8WRuIoA9qTtXNF5sodOoDYHYxr3pr0Y7Hxbpxl1O7vE/3wSd8YkwdTYYgm54npVeegPZ4f3GP2KE5FqfR95mTRBP339xIxKecSHmiT8P7xu3hZVHYjpBd/t0br35Z+y+jWVZn3LtfIo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771839266; c=relaxed/simple;
	bh=uQIocrFRLt4IT579DzMVKsiOr6g8BtE71pIuV9//rsM=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=qUGMyWJaE2YzNnbSy+pGEnhmv7K/4PvE9jmNZ583GoGdgf3msqSEu+vyjptw4UglG1y39+eFg1hTb5yg9yJ9fgc8GLRnxoXvwPZeRNbZ6Rsga/vZjQvoLN3fcy3sALvKFsXQJv3y8I94w72QrUiEDnzlJhFvQZciRGBiBkU9zIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=WvyYcdiS; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yOWokYlxysxFm3xjnehGiJbf7ylIL1Rh5bi686HkNhY=; b=WvyYcdiSy78/oBFRO8hlTCWVDc
	r94yfUhYyXyiw/cGyxhUSRAqeVTiEBfszWKQ3PBwcIT4tgiu/JeZ5oi5gqX+98L9IvjDcDyCINtic
	u2gcJO/bk5eiKBhn00/o1k/PML5+Aq0j9wTw/cedQvGb4p2uQ2VkYmexySiPmu85fgF4QKKGxPGyx
	05zEme9d2b/hZ0WVijjf2XBxfCgJJfkhCin4iBFsxxF3tbAs5aoo2jZzCZClV3JtbsvVNx5YzFW/x
	1H+X03ByhQCe36AfUWT49zLE1+X9C6q+qahz6f4tdSzHm4F+Ql5IE/iST2cBwc9+i1egLTKFsz9jZ
	HUB+1kUA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39730 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vuSKW-000000003m2-2TY9;
	Mon, 23 Feb 2026 09:34:16 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vuSKV-0000000ASbg-28JK;
	Mon, 23 Feb 2026 09:34:15 +0000
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
Subject: [PATCH net-next 01/10] net: stmmac: qcom-ethqos: rename "por" members
 to "rgmii_por"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vuSKV-0000000ASbg-28JK@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 23 Feb 2026 09:34:15 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93626-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.963];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3D097173F40
X-Rspamd-Action: no action

Rename the "por" and "num_por" members to indicate that they are for
RGMII mode only as ethqos_configure_rgmii() is the only place that the
values are programmed into the registers.

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index af8204c0e188..690bd5c7e1a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -87,8 +87,8 @@ struct ethqos_emac_por {
 };
 
 struct ethqos_emac_driver_data {
-	const struct ethqos_emac_por *por;
-	unsigned int num_por;
+	const struct ethqos_emac_por *rgmii_por;
+	unsigned int num_rgmii_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	const char *link_clk_name;
@@ -108,8 +108,8 @@ struct qcom_ethqos {
 	int serdes_speed;
 	phy_interface_t phy_mode;
 
-	const struct ethqos_emac_por *por;
-	unsigned int num_por;
+	const struct ethqos_emac_por *rgmii_por;
+	unsigned int num_rgmii_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	bool needs_sgmii_loopback;
@@ -218,8 +218,8 @@ static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 };
 
 static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
-	.por = emac_v2_3_0_por,
-	.num_por = ARRAY_SIZE(emac_v2_3_0_por),
+	.rgmii_por = emac_v2_3_0_por,
+	.num_rgmii_por = ARRAY_SIZE(emac_v2_3_0_por),
 	.rgmii_config_loopback_en = true,
 	.has_emac_ge_3 = false,
 };
@@ -234,8 +234,8 @@ static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 };
 
 static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
-	.por = emac_v2_1_0_por,
-	.num_por = ARRAY_SIZE(emac_v2_1_0_por),
+	.rgmii_por = emac_v2_1_0_por,
+	.num_rgmii_por = ARRAY_SIZE(emac_v2_1_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = false,
 };
@@ -250,8 +250,8 @@ static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 };
 
 static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
-	.por = emac_v3_0_0_por,
-	.num_por = ARRAY_SIZE(emac_v3_0_0_por),
+	.rgmii_por = emac_v3_0_0_por,
+	.num_rgmii_por = ARRAY_SIZE(emac_v3_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
 	.dwmac4_addrs = {
@@ -282,8 +282,8 @@ static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 };
 
 static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
-	.por = emac_v4_0_0_por,
-	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
+	.rgmii_por = emac_v4_0_0_por,
+	.num_rgmii_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
 	.link_clk_name = "phyaux",
@@ -522,9 +522,9 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	u32 val;
 
 	/* Reset to POR values and enable clk */
-	for (i = 0; i < ethqos->num_por; i++)
-		rgmii_writel(ethqos, ethqos->por[i].value,
-			     ethqos->por[i].offset);
+	for (i = 0; i < ethqos->num_rgmii_por; i++)
+		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
+			     ethqos->rgmii_por[i].offset);
 	ethqos_set_func_clk_en(ethqos);
 
 	/* Initialize the DLL first */
@@ -780,8 +780,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = of_device_get_match_data(dev);
-	ethqos->por = data->por;
-	ethqos->num_por = data->num_por;
+	ethqos->rgmii_por = data->rgmii_por;
+	ethqos->num_rgmii_por = data->num_rgmii_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
 	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
-- 
2.47.3


