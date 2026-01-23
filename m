Return-Path: <linux-arm-msm+bounces-90316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP5TGZRFc2lEuQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:55:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1927273BA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1897A3013B49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 09:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6184337D10F;
	Fri, 23 Jan 2026 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="ym6HBLF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D43F367F20;
	Fri, 23 Jan 2026 09:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162068; cv=none; b=UnFl0fCoHdINMqVWlo/RgoAi0RkxFv58O1QadGvXpH4G2UyE6Myk4+qelNU0uJMwCoBgz5/oFqziiKG3vmn0/sOZJEv+hI5g5NQ0XWAjblHQjodreHULe8XQFpADcDsQKPqMATXOwyuXm0d27+7psnYvr1Y9gyyKkvyTGOJllOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162068; c=relaxed/simple;
	bh=+53V+FFMdBVXN6z5Hiu05Uk9+dnpe3a51F0Q2f5DfMQ=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=f6fTXRXDfQiVGI9swTSh33vbpV5aZDGue/qMEBZfFqplYCHT6sBYH46SiUugHt9lpfkVqtOmrQ05HZnTvRntLl5acoy6eXYK9gPMnURl5NkGkzF0DmSSXAaXti55JuWotPWZoIYWr/Naf/bX29LbfwZ5aw4MD9kvD56ADGk+AhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=ym6HBLF3; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oDBoCS/FqGpILWpLE0lVhiMSxShZ0/G2FgbouoQGO9s=; b=ym6HBLF3qcFbUx+4T8B3qfA+Gu
	M/8ZX0DvkidBXwVdo77as6Z4dRU1srZnR1U5PwLUniEkZzS6RDDiP9LKhW8ZRxNbd8sAuNAAB+cON
	PL9bU4ITZ3CyCVaLtKDK4/YjA1QAxMXA044ig/XfXjvsGGZdPrtjjdi5qY+zILG39HjFNfZeFhW8S
	+tNZGKq3pcRRPZwJDB01nkXUIR+7wDtmfL4GYE4FCMtFX0PX4WFrY5HM8NrAbijuCz/uuH7SBygNr
	Ct2aR90nNTo9oFHsWGXY64/TyXqscGS80N+cxUq4HnQoVgel5hos4p9ZCMWofVmyrbiRrKGjp5IeF
	/LXeG+Tw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42414 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vjDra-000000001bw-1tIJ;
	Fri, 23 Jan 2026 09:53:58 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vjDrW-00000005fQe-1kxD;
	Fri, 23 Jan 2026 09:53:54 +0000
In-Reply-To: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next v2 07/14] net: stmmac: move most PCS register
 definitions to stmmac_pcs.c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vjDrW-00000005fQe-1kxD@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 23 Jan 2026 09:53:54 +0000
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
	TAGGED_FROM(0.00)[bounces-90316-lists,linux-arm-msm=lfdr.de,kernel];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[foss.st.com,lunn.ch,davemloft.net,google.com,kernel.org,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,bootlin.com,gmail.com,oss.qualcomm.com,linaro.org,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.844];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rmk-PC.armlinux.org.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 1927273BA1
X-Rspamd-Action: no action

Move most of the PCS register offset definitions to stmmac_pcs.c.
Since stmmac_pcs.c only ever passes zero into the register offset
macros, remove that ability, making them simple constant integer
definitions.

Add appropriate descriptions of the registers, pointing out their
similarity with their IEEE 802.3 counterparts. Make use of the
BMSR definitions for the GMAC_AN_STATUS register and remove the
driver private versions.

Note that BMSR_LSTATUS is non-low-latching, unlike it's 802.3z
counterpart.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 22 +++++++++++++++----
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  | 22 -------------------
 2 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 10a2eb903d2a..ac588756e450 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -3,6 +3,20 @@
 #include "stmmac_pcs.h"
 #include "stmmac_serdes.h"
 
+/*
+ * GMAC_AN_STATUS is equivalent to MII_BMSR
+ * GMAC_ANE_ADV is equivalent to 802.3z MII_ADVERTISE
+ * GMAC_ANE_LPA is equivalent to 802.3z MII_LPA
+ * GMAC_ANE_EXP is equivalent to MII_EXPANSION
+ * GMAC_TBI is equivalent to MII_ESTATUS
+ *
+ * ADV, LPA and EXP are only available for the TBI and RTBI modes.
+ */
+#define GMAC_AN_STATUS	0x04	/* AN status */
+#define GMAC_ANE_ADV	0x08	/* ANE Advertisement */
+#define GMAC_ANE_LPA	0x0c	/* ANE link partener ability */
+#define GMAC_TBI	0x14	/* TBI extend status */
+
 static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
@@ -76,11 +90,11 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 			       struct stmmac_extra_stats *x)
 {
 	struct stmmac_pcs *spcs = priv->integrated_pcs;
-	u32 val = readl(spcs->base + GMAC_AN_STATUS(0));
+	u32 val = readl(spcs->base + GMAC_AN_STATUS);
 
 	if (status & PCS_ANE_IRQ) {
 		x->irq_pcs_ane_n++;
-		if (val & GMAC_AN_STATUS_ANC)
+		if (val & BMSR_ANEGCOMPLETE)
 			dev_info(priv->device,
 				 "PCS ANE process completed\n");
 	}
@@ -88,9 +102,9 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 	if (status & PCS_LINK_IRQ) {
 		x->irq_pcs_link_n++;
 		dev_info(priv->device, "PCS Link %s\n",
-			 val & GMAC_AN_STATUS_LS ? "Up" : "Down");
+			 val & BMSR_LSTATUS ? "Up" : "Down");
 
-		phylink_pcs_change(&spcs->pcs, val & GMAC_AN_STATUS_LS);
+		phylink_pcs_change(&spcs->pcs, val & BMSR_LSTATUS);
 	}
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 36bf75fdf478..887c4ff302aa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -16,13 +16,6 @@
 
 /* PCS registers (AN/TBI/SGMII/RGMII) offsets */
 #define GMAC_AN_CTRL(x)		(x)		/* AN control */
-#define GMAC_AN_STATUS(x)	(x + 0x4)	/* AN status */
-
-/* ADV, LPA and EXP are only available for the TBI and RTBI interfaces */
-#define GMAC_ANE_ADV(x)		(x + 0x8)	/* ANE Advertisement */
-#define GMAC_ANE_LPA(x)		(x + 0xc)	/* ANE link partener ability */
-#define GMAC_ANE_EXP(x)		(x + 0x10)	/* ANE expansion */
-#define GMAC_TBI(x)		(x + 0x14)	/* TBI extend status */
 
 /* AN Configuration defines */
 #define GMAC_AN_CTRL_RAN	BIT_U32(9)	/* Restart Auto-Negotiation */
@@ -32,21 +25,6 @@
 #define GMAC_AN_CTRL_LR		BIT_U32(17)	/* Lock to Reference */
 #define GMAC_AN_CTRL_SGMRAL	BIT_U32(18)	/* SGMII RAL Control */
 
-/* AN Status defines */
-#define GMAC_AN_STATUS_LS	BIT_U32(2)	/* Link Status 0:down 1:up */
-#define GMAC_AN_STATUS_ANA	BIT_U32(3)	/* Auto-Negotiation Ability */
-#define GMAC_AN_STATUS_ANC	BIT_U32(5)	/* Auto-Negotiation Complete */
-#define GMAC_AN_STATUS_ES	BIT_U32(8)	/* Extended Status */
-
-/* ADV and LPA defines */
-#define GMAC_ANE_FD		BIT_U32(5)
-#define GMAC_ANE_HD		BIT_U32(6)
-#define GMAC_ANE_PSE		GENMASK_U32(8, 7)
-#define GMAC_ANE_PSE_SHIFT	7
-#define GMAC_ANE_RFE		GENMASK_U32(13, 12)
-#define GMAC_ANE_RFE_SHIFT	12
-#define GMAC_ANE_ACK		BIT_U32(14)
-
 struct stmmac_priv;
 
 struct stmmac_pcs {
-- 
2.47.3


