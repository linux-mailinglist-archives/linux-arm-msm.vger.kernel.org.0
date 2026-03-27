Return-Path: <linux-arm-msm+bounces-100385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDL4CpG4xmnoNwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:04:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C494234803C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27970306B14C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA47371D1C;
	Fri, 27 Mar 2026 17:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="bHEMiXE8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE04371CF7;
	Fri, 27 Mar 2026 17:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630955; cv=none; b=jGONkKPOBl6djLJ4B5xFd8GPDIQe5Qw9njE/Cz+QK4F3djp/SFBaw6zcLI/VGH9S5FUd75IDgR7F2rxfK3XFUlxP/Pe/Mfx0PIAN87Kbml6VKWwGPXYCldaqB1PXzMgMosw4Q/C0fl6qKUliJJ86YCUEPfB04XjZBetcQffps8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630955; c=relaxed/simple;
	bh=W2P501+LarFu+XX2WlGp3RvrkmKu/b5e/XAR9VaVnLQ=;
	h=From:To:Cc:Subject:MIME-Version:Content-Disposition:Content-Type:
	 Message-Id:Date; b=JVCMvbuOSRItLNt/yRVsKLaY0tq8Uy1Nhr/e/zWjKl3Ug0uphprIwYw2kjI+C7NGzDFdepx1SHjAEz44jPe1KUL0nXzri3yOrpZEST1f4BkZoK7LJLsJT2P+sdW/pQJ/cn8T1j51rKPN5QmRox4k4Wr3QHQJNUoaTZ4mY1AD27M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=bHEMiXE8; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+M9yYezcxfIh1hPPvvgkIRJqsWvclP69Ajn/rsWdDAg=; b=bHEMiXE8jlRa8mGAupx4zy/RXE
	sRxjTjYdIcYAw1Zoom9A73EC2ndhclH8n58t9u9mfc2Nb5XAo+Y7FEIA5Wtd6/eLNEefy2pOtfOfe
	C/0heJdKlBWVFIlAd/oifUahn/dfz34/+vJBCkUzMZZnkabQkbP8HX6XACzmHYQgv6yQA2zf+bbhr
	OG5OhDDAC2PfGhR87gIRdXsJTBNrsv67FrKDh/cbAYEH90FF2n/XL7XUlyRv1WH6ifuQ/eZUm9cZ1
	GeGKSKAsmSreCQrKRKpWV8osW6ZlHDFpwrkoM82afi1WXlpaazHDN6DU4RlRN0WGSUKf6d1XpjgQ2
	6xTNbWYw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41308 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w6AZn-000000006RA-0MTU;
	Fri, 27 Mar 2026 17:02:27 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w6AZm-0000000E54W-1F6E;
	Fri, 27 Mar 2026 17:02:26 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next] net: stmmac: qcom-ethqos: set clk_csr
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 27 Mar 2026 17:02:26 +0000
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100385-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.728];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: C494234803C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The clocks for qcom-ethqos return a rate of zero as firmware manages
their rate. According to hardware documentation, the clock which is
fed to the slave AHB interface can crange between 50 and 100MHz.

Currently, stmmac uses an undefined divisor value. Instead, use
STMMAC_CSR_60_100M which will mean we meet IEEE 802.3 specification
since this will generate between a 1.19MHz and 2.38MHz MDC clock for
this range. Add a comment describing this.

Link: https://lore.kernel.org/r/acGhQ0oui+dVRdLY@oss.qualcomm.com
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---

This likely needs the qcom-ethqos 15 patch cleanup series.

I think this is what's needed to fix the MDC clocking issue. Please
review and test. Thanks.

 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ad3a983d2a08..ac7d6d3e205a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -764,6 +764,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);
 
+	/* The clocks are controlled by firmware, so we don't know for certain
+	 * what clock rate is being used. Hardware documentation mentions that
+	 * the AHB slave clock will be in the range of 50 to 100MHz, which
+	 * equates to a MDC between 1.19 and 2.38MHz.
+	 */
+	plat_dat->clk_csr = STMMAC_CSR_60_100M;
 	plat_dat->bsp_priv = ethqos;
 	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
 	plat_dat->dump_debug_regs = rgmii_dump;
-- 
2.47.3


