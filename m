Return-Path: <linux-arm-msm+bounces-96175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFfsIamWrmnRGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:45:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3254F236725
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:45:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDD62306CC16
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 09:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAEDD37BE76;
	Mon,  9 Mar 2026 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="EklVRTMR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D6B36A01D;
	Mon,  9 Mar 2026 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049226; cv=none; b=UaUHrxKeiKjiCQeFia9KEDsH9+j5w9dX8t7aaRY4jmE3qUUUCTXFr7ERfjyYsYDXXHrCt2XfGu/mLNBwxjdZWcHXG3YWKnGY367bQD0reVyCAV2bD2aUCD8dprqJAOpIceBq2sxfjRMU8YUyMZtPNEqoF02aTGh0zUyP0/YnE+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049226; c=relaxed/simple;
	bh=1UvZfhTmxc1Sgi0gmKv5ZxX8KNk4t0uGUxFewUZ1wK8=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=dIjN9p016racosAKlqnWRJEJRZNvr5KOugjDJXRsN+phEPRpr/sidCrR9+kTB/ze9dxuoWUng8bLWiok145qHrNO7w0mXe1/BR7Diup/aJlfZLjqTOD1JiTtaowUodd8mNH4BetLnP34XPNInR/gbv9IUFj0kWZUoRpWeqCGBTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=EklVRTMR; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zzQHtoFn7yNl5mgP8jm0AT1Cso1q/JOg4cOlIoYOlsI=; b=EklVRTMRWDNJInw7wEHB7RRHb/
	82NUrtdmUOum9ZETT2DLpiRY43/WK8IOOu87lPeRAGYSDpjRVO9oesANpI9vQi0E7VB33YhRMvBMZ
	SIHih0mwONPxcnVTE6Ereza8VGeCCvuqfwi9K8X3OHY9xTu80AvcQXxccm/A5nU8Ylsb5NRkDSzdw
	bKKy8TKdWHf3TCIdgv+wTIEl1EtRTmE0yvNJik+obwExy2HjdyiF8dJCTGf+EfBFajNfUR2lhSere
	wbiXrG8vsmZo7evothQZHtEyc+vBt6LGoeF+WzhgY93seQQnrX8yobZX/fH+nBpFyJOq068bwsQUK
	w4ABa7iw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44830 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vzX5e-000000003Vd-2jKM;
	Mon, 09 Mar 2026 09:39:54 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vzX5Z-0000000CVsb-1XTm;
	Mon, 09 Mar 2026 09:39:49 +0000
In-Reply-To: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 7/7] net: stmmac: add documentation for clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vzX5Z-0000000CVsb-1XTm@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 09 Mar 2026 09:39:49 +0000
X-Rspamd-Queue-Id: 3254F236725
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96175-lists,linux-arm-msm=lfdr.de,kernel];
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
	NEURAL_SPAM(0.00)[0.215];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,rmk-PC.armlinux.org.uk:mid,armlinux.org.uk:email]
X-Rspamd-Action: no action

Add documentation covering stmmac_clk, pclk, clk_ptp_ref and clk_tx_i
in the hope that this will help understand what each of these clocks
are for.

There is confusion around stmmac_clk and pclk which can't be easily
resolved today as the Imagination Technologies Pistachio board that
pclk was introduced for has no public documentation and is likely now
obsolete. So the origins of pclk are lost to the winds of time.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/linux/stmmac.h | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 1af3a5e197c9..937985276e6b 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -300,10 +300,41 @@ struct plat_stmmacenet_data {
 	struct phylink_pcs *(*select_pcs)(struct stmmac_priv *priv,
 					  phy_interface_t interface);
 	void *bsp_priv;
+
+	/* stmmac clocks:
+	 *  stmmac_clk: CSR clock (which can be hclk_i, clk_csr_i, aclk_i,
+	 *    or clk_app_i depending on GMAC configuration). This clock
+	 *    generates the MDC clock.
+	 *
+	 *  pclk: introduced for Imagination Technologies Pistachio board -
+	 *    see 5f9755d26fbf ("stmmac: Add an optional register interface
+	 *    clock"). This is probably used for cases where separate clocks
+	 *    are provided for the host interface and register interface. In
+	 *    this case, as the MDC clock is derived from stmmac_clk, pclk
+	 *    can only really be the "application clock" for the "host
+	 *    interface" and not the "register interface" aka CSR clock as
+	 *    it is never used when determining the divider for the MDC
+	 *    clock.
+	 *
+	 *  clk_ptp_ref: optional PTP reference clock (clk_ptp_ref_i). When
+	 *    present, this clock increments the timestamp value. Otherwise,
+	 *    the rate of stmmac_clk will be used.
+	 *
+	 *  clk_tx_i: MAC transmit clock, which will be 2.5MHz for 10M,
+	 *    25MHz for 100M, or 125MHz for 1G irrespective of the interface
+	 *    mode. For the DWMAC PHY interface modes:
+	 *
+	 *    GMII/MII	PHY's transmit clock for 10M (2.5MHz) or 100M (25MHz),
+	 *		or 125MHz local clock for 1G mode
+	 *    RMII	50MHz RMII clock divided by 2 or 20.
+	 *    RGMII	125MHz local clock divided by 1, 5, or 50.
+	 *    SGMII	125MHz SerDes clock divided by 1, 5, or 50.
+	 *    TBI/RTBI	125MHz SerDes clock
+	 */
 	struct clk *stmmac_clk;
 	struct clk *pclk;
 	struct clk *clk_ptp_ref;
-	struct clk *clk_tx_i;		/* clk_tx_i to MAC core */
+	struct clk *clk_tx_i;
 	unsigned long clk_ptp_rate;
 	unsigned long clk_ref_rate;
 	struct clk_bulk_data *clks;
-- 
2.47.3


