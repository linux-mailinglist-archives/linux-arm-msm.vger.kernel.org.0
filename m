Return-Path: <linux-arm-msm+bounces-101554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIcGL2qCzmmDoAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 16:51:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0ED38AD17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 16:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24334301DCDD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 14:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A975D31AF1F;
	Thu,  2 Apr 2026 14:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="yz0hZk2T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C528E25B30D;
	Thu,  2 Apr 2026 14:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141281; cv=none; b=ZMvq5sMfuIE8gULEAZkznhBACEGc9OOSB6x1DHuMTUfJeiyi2wfX70Dpl9YQQDmrK2EsNRmq3GyStgJdlGvyEdJ3oLHBPjjoNq7vzG5MfVYVdyZuGrbrN1BEaM6lL/b+C4hDAombEgQDb917rGBBzvvwMjRSdNWWXjqY79RcqnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141281; c=relaxed/simple;
	bh=O+Z5Fpxv4NCjeuyfdcBZq+agmf3NULY5A5L0NkR4gJc=;
	h=From:To:Cc:Subject:MIME-Version:Content-Disposition:Content-Type:
	 Message-Id:Date; b=KudRNiTPdSmnsaryL3C+LHmtMWQr2uz/bX3Z7wjfmj40WufmD3nuMBaVTSZm1QKJ3hdXZSLoJKoZ2eGTHQ4dO1OHzFb4BlyHhOEjinBlRHnz31co3bn8VZCIPndTfbriyuAX6U+Bzoyzvusny9kKGoFZNTL/Bx2ppWxi4M1UnOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=yz0hZk2T; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xD9Ws0wj/oKKCviSDFh+SyGUaZONQvwUQ/re7IVmgTY=; b=yz0hZk2TQ0z0WN4LzR8/RPaHBf
	nAiQSMV47/v6hNhGL00u0kvvA+d4wkN6hBaKazAIonNrKRBBqpMWRvyaFD47A5qeRvpvn0sbr0QEO
	jy1D9swn36xdIPvtU9pybae20tbQchAZOnbqc8nDyiWZ8OC8CcfpJXQWE71H73asbTI28r1cWC3pM
	oHYUQ6dShP5Ju/BHedcgJsRExiUmoxaSF5+cWeN7A0UOlhRt7kboTYn+idcRYB9XUbtReSbaIMeAU
	OD95J8ymPcdm4gcn+mL19jVZ0OFaMl1xrtfxUHtx3ugEUkstqPo6XJh9spVwECze1E4Ne1qicie0m
	uwLwV3Ww==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59264 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w8JKs-000000004ao-2o1I;
	Thu, 02 Apr 2026 15:47:54 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w8JKr-0000000EdLC-41Bt;
	Thu, 02 Apr 2026 15:47:54 +0100
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
Subject: [PATCH net-next] net: stmmac: qcom-ethqos: set clk_csr
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w8JKr-0000000EdLC-41Bt@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 02 Apr 2026 15:47:53 +0100
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101554-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.556];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rmk-PC.armlinux.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:email,qualcomm.com:email]
X-Rspamd-Queue-Id: ED0ED38AD17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The clocks for qcom-ethqos return a rate of zero as firmware manages
their rate. According to hardware documentation, the clock which is
fed to the slave AHB interface can range between 50 to 100MHz for
non-RGMII and 30 to 75MHz for boards with a RGMII interfaces.

Currently, stmmac uses an undefined divisor value. Instead, use
STMMAC_CSR_60_100M which will mean we meet IEEE 802.3 specification
since this will generate:

  714kHz  @ 30MHz
  1.19MHz @ 50MHz
  1.79MHz @ 75MHz
  2.42MHz @ 100MHz

This gives MDC rates within the IEEE 802.3 specification, although the
30MHz case is particularly slow.

Selecting the next lowest divisor, STMMAC_CSR_35_60M, which is /26
will give:

   1.15MHz @ 30MHz
   1.92MHz @ 50MHz
   2.88MHz @ 75MHz (exceeding 802.3 spec)
   3.85MHz @ 100MHz (exceeding 802.3 spec)

Unfortunately, this divisor makes the upper bound of both ranges exeed
the IEEE 802.3 specification, and thus we can not use it without knowing
for certain what the current CSR clock rate actually is.

So, STMMAC_CSR_60_100M is the best fit for all boards based on the
information provided thus far.

Link: https://lore.kernel.org/r/acGhQ0oui+dVRdLY@oss.qualcomm.com
Link: https://lore.kernel.org/r/acw1habUsiSqlrky@oss.qualcomm.com
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
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


