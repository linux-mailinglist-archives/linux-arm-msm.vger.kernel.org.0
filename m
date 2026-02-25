Return-Path: <linux-arm-msm+bounces-94096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJPJNU7hnmmCXgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:47:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3787C196D72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D70633018754
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAB0399009;
	Wed, 25 Feb 2026 11:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="aH6+LQYk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAEC39903B;
	Wed, 25 Feb 2026 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772019911; cv=none; b=UhqfDAl4BV/urtrsWAJgcsQtYxl9LaBfmK1uxjWKpk1VDiY0uz1T7Ru7iaq4eFiV2Ouk7s8E89QwYKpsA1us/Xucq09Pq1r5bnDRqKV7tZ3n2TJyfKDtlmFeTa71tPWL4xZRcTN67rRvMWr2IVOngUJt37AfD1GYrhdHtc24X08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772019911; c=relaxed/simple;
	bh=e7L/6i4r2nRAWlL4JI6FybyOv/lOE9vW1MtmTZaxiAU=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=O6z3OI0YiVPHoitVxgl75afTdrXCYaxFIMhcuF7ZuS/zmi+rdH54pgVrcjusQ6FZ3WnYaka4MjDouBaiLh+xNaYfLVdPsBi39C1E3wPnsH1lkOeKDZPmj/F8v8GADTc0/ePIAhkNeKwW2QknbhBduDNVmzRiBQVqZM1ozXgvTKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=aH6+LQYk; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QpVZHAyEJ8psaVdJL6ep6frfkNeyqoUFSmGxnRhF8MY=; b=aH6+LQYkbJoDTSx+d/kuzMpeVi
	h8ZfigL/DNeK8Xo4vP00UST0ZviXDe8AXot4TCvfdACepw3Hs1ic8m7PYYjETDBZQTbv2HzCuNpCQ
	r2vEey5ZE8BVv1OBdcWSLYwU3oI+B1BFBKvzBkUTGU2KWtVJgCWKWYdPfyjTqOEf2nv4RyOqjUP0S
	+ebB14hm046GMTQ76XOcBWDCiY5Badvdk76BWu6KjOoahG3PRNMfrEBqXx/10+v2Wqqu9HL5ffFtR
	+XwRedI8ESEWuWkUsCBOrDGxOAlm7oUd+F3u5lUPFdYHZuTqdKUweyfFhbXQUQeHNe3HYDlqBc4hQ
	u261Dsrg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44856 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvDK5-000000006ae-0J6W;
	Wed, 25 Feb 2026 11:44:57 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvDK3-0000000Arhk-1Ubd;
	Wed, 25 Feb 2026 11:44:55 +0000
In-Reply-To: <aZ7ggfQanc8jeCb9@shell.armlinux.org.uk>
References: <aZ7ggfQanc8jeCb9@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH RFC net-next 6/7] net: stmmac: configure SGMII AN control
 according to phylink
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvDK3-0000000Arhk-1Ubd@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 25 Feb 2026 11:44:55 +0000
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
	TAGGED_FROM(0.00)[bounces-94096-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rmk-PC.armlinux.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 3787C196D72
X-Rspamd-Action: no action

Provide phylink with the integrated PCS autonegotiation capabilities,
and configure the PCS's AN settings according to phylink's requested
requirements.

This may cause regressions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index ba0cf51e67f7..0f9616fad4ef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -32,6 +32,9 @@ static unsigned int dwmac_integrated_pcs_inband_caps(struct phylink_pcs *pcs,
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
 	unsigned int ib_caps;
 
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		return LINK_INBAND_ENABLE | LINK_INBAND_DISABLE;
+
 	if (phy_interface_mode_is_8023z(interface)) {
 		ib_caps = LINK_INBAND_DISABLE;
 
@@ -139,22 +142,29 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 				       bool permit_pause_to_mac)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
-	bool changed = false, ane = true;
+	void __iomem *an_control = spcs->base + GMAC_AN_CTRL(0);
+	bool ane, changed = false;
+	u32 ctrl;
+
+	ane = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
 
 	/* Only configure the advertisement and allow AN in BASE-X mode if
 	 * the core supports TBI/RTBI. AN will be filtered out by via phylink
 	 * and the .pcs_inband_caps() method above.
 	 */
 	if (phy_interface_mode_is_8023z(interface) &&
-	    spcs->support_tbi_rtbi) {
-		ane = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
-
+	    spcs->support_tbi_rtbi)
 		changed = dwmac_integrated_pcs_config_aneg(spcs, interface,
 							   advertising);
-	}
 
-	dwmac_ctrl_ane(spcs->base, 0, ane,
-		       spcs->priv->hw->reverse_sgmii_enable);
+	ctrl = readl(an_control) & ~(GMAC_AN_CTRL_ANE | GMAC_AN_CTRL_SGMRAL);
+	if (spcs->priv->hw->reverse_sgmii_enable)
+		ctrl |= GMAC_AN_CTRL_SGMRAL | GMAC_AN_CTRL_ANE;
+	else if (ane)
+		ctrl |= GMAC_AN_CTRL_ANE;
+	else
+		ctrl |= GMAC_AN_CTRL_SGMRAL;
+	writel(ctrl, an_control);
 
 	return changed;
 }
-- 
2.47.3


