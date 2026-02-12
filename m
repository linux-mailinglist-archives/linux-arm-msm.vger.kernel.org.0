Return-Path: <linux-arm-msm+bounces-92631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCObIDccjWnjzAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 01:17:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D59C0128953
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 01:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9266C301BF65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 00:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0F817DE36;
	Thu, 12 Feb 2026 00:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="HUIEY1+B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A523117A309;
	Thu, 12 Feb 2026 00:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770855476; cv=none; b=pEhkrdvMVRdImemBjmoJIgrz7y35YfW+TlMChdGbZaM3o5q7ZK15GkgA9vFQMgnf0pib9jfuImD9DiUD7L1fkFhwZDjphmW3Hb0+/Qd2e0ZAUORydRJ5td929BpLlpapt9vf+Kn43P8b98fSQhkEZUqadxdwe7oDbK70YXrYC9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770855476; c=relaxed/simple;
	bh=St+BO2fw9R1FQEfdxzHfshQcMJJhOuWo1fdoWxBViko=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=CQ/VBT7a8DBsYAINqXvrY6HX0QsvGoGe1MO24pDGK/FaOB6uqd345AAuHwfQ38q6WqiMixQNyWMD/07twgD1vJsgHuqC5MSpGdaa5pHcO1lWqgbHl+2I80cVgvclVcPJ/Mur/LNLffxNoM8pYTU1oJziK45AUyYRwGtc/KPwxeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=HUIEY1+B; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/difXbGl544Vxk+7AKb/tQiRYHgFC1TnTaz/0KZqzzo=; b=HUIEY1+BJqA8wJzanHrWl7dLIN
	9A8uYhY0ByOTRFwTn9r3Jg8ydy8u3jOWZScpYsHF8zf3PBMv+vVOcoOXYQ6iizosw3vHbN5xfV6wa
	kmHBqdMIO0pJvyMf0wyWcve/cUR5uuN2HTkiaCjYiynn3Y2K3DVOTkD40cimIai3McVRLRh71gaUN
	K1Gq/nvcRQUsFF8aG2ep3daJj94205blgJfv9U/xZagC/zvVmYHBO2+rQXWgWnr+k+QscsnFgt3jl
	ltyPLV9bbY3HQ7e+ssudqbEkHMzbko/vXhI3JKbi9WlVFYR64ACjXeSd/TyNZYFpvrEcyiXi9Iloe
	dt0Tcj2Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38082 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vqKOw-000000003oT-3KDX;
	Thu, 12 Feb 2026 00:17:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vqKOv-000000093mB-48ei;
	Thu, 12 Feb 2026 00:17:46 +0000
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
Subject: [PATCH RFC net-next 1/9] net: stmmac: qcom-ethqos: rename "por"
 memebers to "rgmii_por"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vqKOv-000000093mB-48ei@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 12 Feb 2026 00:17:45 +0000
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
	TAGGED_FROM(0.00)[bounces-92631-lists,linux-arm-msm=lfdr.de,kernel];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D59C0128953
X-Rspamd-Action: no action

Rename the "por" and "num_por" members to indicate that they are for
RGMII mode only as ethqos_configure_rgmii() is the only place that the
values are programmed into the registers.

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


