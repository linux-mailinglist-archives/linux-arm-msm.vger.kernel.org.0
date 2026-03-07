Return-Path: <linux-arm-msm+bounces-95945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAlnCz8GrGl0jAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:04:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA2222B538
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CBC0300E5E2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B1D34887E;
	Sat,  7 Mar 2026 11:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="mdJLr5cu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00211344D9D;
	Sat,  7 Mar 2026 11:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772881409; cv=none; b=sVdqQFJVPoeF8A3ev36S5IYfnotQHrCbCGKERQsMOlixnN7m2xC7YmLg2dMESiD2KaiinEF4Zza7TE4eY/+S1g08DVhB3eNHhZT0k+riAgePfihGTBobPSCJzCpmGf1CAXPo4A1Gdklegh4FZK/C8lJcHjY3anwyIMyDRDbGeDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772881409; c=relaxed/simple;
	bh=INMNKE8le1EXRM/Gy+YDncLeGSL1UEoQe4AI13RNp/M=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=nE74M76xmni3Xd85kNlfWLBdEAH/8s4MI5r+aH2Tdk0OYxKjQ5XjfJOTnHjvEVPfFv5+S3um3yYdK6otyVpygoxGHVY52c9AdJ6q0gPoj3b5KppYC7PyJX5FzUwj4DqS8xm+2PYvE5uwsLqejl6owA/QxionovFnsKZ6XWH5B4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=mdJLr5cu; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y0sz0jfCf5fn52CP1Am1XmKInKjkiBUk+d0U91h+UQE=; b=mdJLr5cumt/c8n4E+I7XKXNwpQ
	A2nEMBN+bt8Fe3ffoCB6wANarX7W6SpyueciJ3Px/9AuFzavtYe7YkGsDAxkTk9xGFOzucnPeBRTH
	ubi7ROoRdt950bBce9BxS3OjIW4UsUcPrloaIwvL/VimA8AUPeZGdbTQmW/e1jwO0ozkBtPr0c8Tq
	7gXaPDn5TpbtqZYbdmOjBtF9GIYo2q0KwWPXuEosp60IFhYvtEVUhAda4L2M4NKyktJhlcg2CdHRB
	3RfvJCltTdDkM1zydWcyN0xE11/kDkdcsqazE80WwxKBkTiXgX+BYNy2tqKZAtKqyInu2Ty18YrQm
	Ksan5ORA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50310 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vypQp-00000000288-1yfX;
	Sat, 07 Mar 2026 11:02:51 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vypQo-0000000CSwC-1Avc;
	Sat, 07 Mar 2026 11:02:50 +0000
In-Reply-To: <aawFuXTVAgVOrw4k@shell.armlinux.org.uk>
References: <aawFuXTVAgVOrw4k@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	s32@nxp.com,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Yao Zi <me@ziyao.cc>
Subject: [PATCH net-next 3/7] net: stmmac: reorder structs to reduce memory
 consumption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vypQo-0000000CSwC-1Avc@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Sat, 07 Mar 2026 11:02:50 +0000
X-Rspamd-Queue-Id: DFA2222B538
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
	TAGGED_FROM(0.00)[bounces-95945-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_SPAM(0.00)[0.282];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Action: no action

Reorder some of the stmmac structures to allow them to pack better,
thereby using less memory. On aarch64, sizeof(struct stmmac_priv)
was 880, and with this change becomes 816, saving 64 bytes, which
is an 8% saving.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/linux/stmmac.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 9420da96a4ff..411cdd3ea034 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -108,37 +108,37 @@ struct stmmac_dma_cfg {
 
 #define AXI_BLEN	7
 struct stmmac_axi {
-	bool axi_lpi_en;
-	bool axi_xit_frm;
 	u32 axi_wr_osr_lmt;
 	u32 axi_rd_osr_lmt;
-	bool axi_kbbe;
 	u32 axi_blen_regval;
+	bool axi_lpi_en;
+	bool axi_xit_frm;
+	bool axi_kbbe;
 	bool axi_fb;
 	bool axi_mb;
 	bool axi_rb;
 };
 
 struct stmmac_rxq_cfg {
-	u8 mode_to_use;
 	u32 chan;
+	u32 prio;
+	u8 mode_to_use;
 	u8 pkt_route;
 	bool use_prio;
-	u32 prio;
 };
 
 struct stmmac_txq_cfg {
 	u32 weight;
-	bool coe_unsupported;
-	u8 mode_to_use;
 	/* Credit Base Shaper parameters */
 	u32 send_slope;
 	u32 idle_slope;
 	u32 high_credit;
 	u32 low_credit;
-	bool use_prio;
 	u32 prio;
 	int tbs_en;
+	bool use_prio;
+	bool coe_unsupported;
+	u8 mode_to_use;
 };
 
 struct stmmac_safety_feature_cfg {
-- 
2.47.3


