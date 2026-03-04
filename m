Return-Path: <linux-arm-msm+bounces-95271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKTjOVXzp2nImwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 09:54:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD381FCFD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 09:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AECE730BC590
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 08:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A129386C0C;
	Wed,  4 Mar 2026 08:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="A+kB/Nxi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C31388365;
	Wed,  4 Mar 2026 08:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614185; cv=none; b=S5lEJ0xctOW4d34gLXaMN2IDjeCy7FWSbUhrbFpLDqRWORgnHZhI39BZWEPV7QFUQ0BG8bMeWk5xfpzzwKRJLxzpFuoqL1fXZ1b685BVRuKOUoEu3hidTIE5oMMtYGtPNxSRMqEBKgqNB1cgXDOmGXjSifG+wAempGXba9a4d8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614185; c=relaxed/simple;
	bh=CTybixJxBxdcj0x2/JUAaqbuEFOaG0od0YShzH5AAD0=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=Hr+FnOaYUSOeigfvhGTa1cX2h1RBwkLQ6yiQciqRmZA8qW7BlQY8kniDnNeYNh6A8ZmOzAuigtakvnDy8Uf3IdO7MPuyPMKfMoSenQ7kb7FG11cgQp1Oa1impx6wImLM06gsuQG4ephLaDVOCSgu1EkS6WXXVpyqYYXexVqUNvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=A+kB/Nxi; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0MtvxB2KyHL1m+s6b8uJYo26xFODbtz3APSycwGsCW8=; b=A+kB/Nxi///vpTL0lVqcrhzDDs
	1wWBgdxe9NP/OwA0FALtHxNTyFLrq2cd6jlOQpHhhHzWe2AiF0EqHfAPEa75HbBR1ILNpRyIkE8V1
	v7fXYdrVDYTH2oYidzQakmi09bn0zWCyirVmxhGZYyQPKhJ8jAqEOClGcxI8DgTirDtM1JUzBMX/j
	W6+GjQMOOs6N+JljM9akphfTeDqrCVvNOuZYQ+daEzltuOSICZMI8Q5Qe2YjgMXUj8XPF12pYSI7P
	LGBGH/gtyRNgLqLtLYCwn3A4gfX7sYt12A+FSN6bnwc+PMrZ4RW267gIKgHkF14PtOxXSRwl/+sGQ
	fIbRQtsg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46612 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vxhvB-000000006Ai-1O6p;
	Wed, 04 Mar 2026 08:49:33 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vxhv8-0000000BqGv-31Rz;
	Wed, 04 Mar 2026 08:49:30 +0000
In-Reply-To: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next v2 7/7] net: stmmac: report PCS configuration
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vxhv8-0000000BqGv-31Rz@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 04 Mar 2026 08:49:30 +0000
X-Rspamd-Queue-Id: 5FD381FCFD1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95271-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_SPAM(0.00)[0.283];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Action: no action

Report if/when qcom-ethqos changes the PCS configuration. With phylink
now setting the PCS configuration, there should be no need for drivers
to change this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index b2b12d34b3dd..83651292578c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -71,6 +71,7 @@ static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
 				  bool srgmi_ral)
 {
 	u32 value = readl(ioaddr + GMAC_AN_CTRL(reg));
+	u32 old = value, diff;
 
 	/* Enable and restart the Auto-Negotiation */
 	if (ane)
@@ -84,6 +85,20 @@ static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
 	if (srgmi_ral)
 		value |= GMAC_AN_CTRL_SGMRAL;
 
+	diff = old ^ value;
+	if (diff & ~GMAC_AN_CTRL_RAN) {
+		pr_warn("dwmac: PCS configuration changed from phylink by glue, please report: 0x%08x -> 0x%08x\n",
+			old & ~GMAC_AN_CTRL_RAN, value & ~GMAC_AN_CTRL_RAN);
+#define REPORT_BIT(x) \
+		if (diff & GMAC_AN_CTRL_##x) \
+			pr_warn("dwmac: %8s %u -> %u\n", #x, \
+				!!(old & GMAC_AN_CTRL_##x), \
+				!!(value & GMAC_AN_CTRL_##x))
+		REPORT_BIT(ANE);
+		REPORT_BIT(SGMRAL);
+#undef REPORT_BIT
+	}
+
 	writel(value, ioaddr + GMAC_AN_CTRL(reg));
 }
 #endif /* __STMMAC_PCS_H__ */
-- 
2.47.3


