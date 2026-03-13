Return-Path: <linux-arm-msm+bounces-97465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHMhETYDtGnjfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:29:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D011282F9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D7A863026052
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E25E392C3D;
	Fri, 13 Mar 2026 12:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="HjBD/CCf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049F539098E;
	Fri, 13 Mar 2026 12:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773404962; cv=none; b=k+F8LzUksnbqshvZgSmpeOw6I3FcJaDSEJB6E3XlqEEhMozf+uhw9n4fft5btXYSjx+BwvPsAafUAsGqGwXgFsLpKxqqlpwtdDTu7r+PkFh7dPofcbw8s5MCaH9tt6bmCr01CB7rByXHntyHeIti6owgWRLbDDffFwRrEEOZdho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773404962; c=relaxed/simple;
	bh=SrUKtNbTDjePVmgIV1ukH1YRJpS7Jp1/m3N/MtLY16s=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=MyGRj0v8+IHp1wL0AubpCMeVZ0BI6djlqhtspr7ftTk0SwcBARE9WqkZIusiy4uD/m53lEqEWbmejTPs4kMTPLMDpPFUx1ho2ZLTlf0Wm15+d9C4JKX1CzV8tcQADXS2luzcR2SMsYtj/HG9RzHDBsUCPgAQ4AgbYHxuKdfLz1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=HjBD/CCf; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dkwtyxaeu1TFqzHLC2kV5Q12F42JPNGj6LMN8t6hACM=; b=HjBD/CCfYqxGD/pb4IMfhjW1W9
	tDRIbO82u46aCto2MchWsDPU51AjBH74AcuILEpngO3swH0diPPFjBHBXe94ZzCWiT2fTXRoEu4qc
	vYvZNYpHC8v1DTcyzdQsKbliQseG5qN3s2vyzr9wbL353IcyeTN9a/zw47mBA0YBYkGITcNTIJmyh
	BL8H9CS89Mnle5WIOwTk3oaV+ErPkI66dPumu8gcQgpGN1Su2P+6SZFAnzQSfSG22khkItEr+jW34
	yHd9iGrJggKH1zywvgsWe7iQaRfYHAerMmSGJdBmY4xbOtINEUJoOGJbZPCD6HgVMOwDNWRNPnbHO
	6vY3NK+w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55736 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w11dg-000000000vJ-1OlU;
	Fri, 13 Mar 2026 12:29:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w11df-0000000DEiG-1ilq;
	Fri, 13 Mar 2026 12:29:11 +0000
In-Reply-To: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 4/8] net: stmmac: use integrated PCS for BASE-X modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w11df-0000000DEiG-1ilq@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 13 Mar 2026 12:29:11 +0000
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97465-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rmk-PC.armlinux.org.uk:mid,bootlin.com:email]
X-Rspamd-Queue-Id: 4D011282F9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dwmac-qcom-ethqos supports SGMII and 2500BASE-X using the integrated
PCS, so we need to expand the PCS support to include support for
BASE-X modes.

Add support to the prereset configuration to detect 2500BASE-X, and
arrange for stmmac_mac_select_pcs() to return the integrated PCS if
its supported_interfaces bitmap reports support for the interface mode.

This results in priv->hw->pcs now being write-only, so remove it.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      | 4 ----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index f1628de8ed18..c9dac55d0c02 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -278,9 +278,6 @@ struct stmmac_safety_stats {
 #define FLOW_TX		2
 #define FLOW_AUTO	(FLOW_TX | FLOW_RX)
 
-/* PCS defines */
-#define STMMAC_PCS_SGMII	(1 << 1)
-
 #define SF_DMA_MODE 1		/* DMA STORE-AND-FORWARD Operation Mode */
 
 /* DMA HW feature register fields */
@@ -632,7 +629,6 @@ struct mac_device_info {
 	unsigned int unicast_filter_entries;
 	unsigned int mcast_bits_log2;
 	unsigned int rx_csum;
-	unsigned int pcs;
 	unsigned int num_vlan;
 	u32 vlan_filter[32];
 	bool vlan_fail_q_en;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 11150bddd872..9e6d7f0e88d5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -946,11 +946,8 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
 			return pcs;
 	}
 
-	/* The PCS control register is only relevant for SGMII, TBI and RTBI
-	 * modes. We no longer support TBI or RTBI, so only configure this
-	 * register when operating in SGMII mode with the integrated PCS.
-	 */
-	if (priv->hw->pcs & STMMAC_PCS_SGMII && priv->integrated_pcs)
+	if (priv->integrated_pcs &&
+	    test_bit(interface, priv->integrated_pcs->pcs.supported_interfaces))
 		return &priv->integrated_pcs->pcs;
 
 	return NULL;
@@ -1209,7 +1206,6 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 
 	if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_SGMII) {
 		netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
-		priv->hw->pcs = STMMAC_PCS_SGMII;
 
 		switch (speed) {
 		case SPEED_10:
-- 
2.47.3


