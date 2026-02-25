Return-Path: <linux-arm-msm+bounces-94091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOeLGAjhnmmCXgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:46:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F349A196D2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADC6130037C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468D839902A;
	Wed, 25 Feb 2026 11:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="nErDvr53"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EB1396B7F;
	Wed, 25 Feb 2026 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772019881; cv=none; b=hlbnQKRWNB2UaVB2wXpsp6GkqL/GlxE20yDle9sSx4Ssxzsx+nV1Q18Jkp3MqJjsfKqwfuyqRIDFIKI4LG1uFgp1F/MZVgGoG/BNXPOeTFAeXo5tQZUQQ8RaXtPjw4dP4YHrp7mmd825iWRuRQehCIf5I9MDnw91hVtUbX5NyUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772019881; c=relaxed/simple;
	bh=MZ8MLVBCQgKCYV7hYkikBggFfTP3SD9fvEP6Qi+UWss=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=Ls5Y/a3ZoU3LIHWOSUsHQhj3g53wtA6sfv8K+Ki60YICcBYwNWnaetKK3RVuWqTxNAStYr6zheQbJJHd+mIhUAObfBu9EkrN14RKZXLKyHNegnVlkmzoU3Qh6xPDopR5aYwH+oR6Z1+3ZmBPi39P+lFasePLYY381lk/TuX99t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=nErDvr53; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iH42HmYrX1qGamaSmx4fgAq47taRvrxhaAw00SdGg7M=; b=nErDvr53/dFGp/XGUGBmGtD3OS
	5WnE+nkjt2J1hDbIYgeZbjzR8lw4DyT2gk0Q0ToFW9sOxzH8s5pDU88jLrji5g9hEQTsXYYo5V9Zk
	ibOV3fIEoDBtWxk/w0bvpp0zrgQ2OyF3XG2TpkYLIkVy6nI22M06huaP0hlrWakE72ir+D1i2GGne
	lFKBJw0Hp/1aVmmQPRAJIzLWUt4PQgQi6RQjT5sc7TTuvX+sBHkW8YJbojAO2nC15SNLeJ+XMSpao
	9QI72py//0zsmKbDtH6T0vb+7p+AJlazgqBmrEicBUKiXxEwf5vsyZZcZLzModias/MNLlWcQhzU8
	L+AgDo2A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38568 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvDJe-000000006ZE-2DNi;
	Wed, 25 Feb 2026 11:44:30 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvDJd-0000000ArhB-3DaO;
	Wed, 25 Feb 2026 11:44:29 +0000
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
Subject: [PATCH RFC net-next 1/7] net: stmmac: add BASE-X support to
 integrated PCS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvDJd-0000000ArhB-3DaO@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 25 Feb 2026 11:44:29 +0000
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
	TAGGED_FROM(0.00)[bounces-94091-lists,linux-arm-msm=lfdr.de,kernel];
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
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rmk-PC.armlinux.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:email]
X-Rspamd-Queue-Id: F349A196D2A
X-Rspamd-Action: no action

The integrated PCS supports 802.3z (BASE-X) modes when the Synopsys
IP is coupled with an appropriate SerDes to provide the electrical
interface. The PCS presents a TBI interface to the SerDes for this.
Thus, the BASE-X related registers are only present when TBI mode is
supported.

dwmac-qcom-ethqos added support for using 2.5G with the integrated PCS
by calling dwmac_ctrl_ane() directly.

Add support for the following to the integrated PCS:
- 1000BASE-X protocol unconditionally.
- 2500BASE-X if the coupled SerDes supports 2.5G speed.
- The above without autonegotiation.
- If the PCS supports TBI, then optional BASE-X autonegotiation for each
  of the above.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 96 ++++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |  1 +
 include/linux/stmmac.h                        |  1 +
 3 files changed, 95 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 88fa359ea716..e606dfb85f94 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -16,6 +16,27 @@
 #define GMAC_ANE_LPA	0x0c	/* ANE link partener ability */
 #define GMAC_TBI	0x14	/* TBI extend status */
 
+static unsigned int dwmac_integrated_pcs_inband_caps(struct phylink_pcs *pcs,
+						     phy_interface_t interface)
+{
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	unsigned int ib_caps;
+
+	if (phy_interface_mode_is_8023z(interface)) {
+		ib_caps = LINK_INBAND_DISABLE;
+
+		/* If the PCS supports TBI/RTBI, then BASE-X negotiation is
+		 * supported.
+		 */
+		if (spcs->support_tbi_rtbi)
+			ib_caps |= LINK_INBAND_ENABLE;
+
+		return ib_caps;
+	}
+
+	return 0;
+}
+
 static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
@@ -36,7 +57,39 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
 					   unsigned int neg_mode,
 					   struct phylink_link_state *state)
 {
-	state->link = false;
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	u32 status, lpa;
+
+	status = readl(spcs->base + GMAC_AN_STATUS);
+
+	if (phy_interface_mode_is_8023z(state->interface)) {
+		/* For BASE-X modes, the PCS block supports the advertisement
+		 * and link partner advertisement registers using standard
+		 * 802.3 format. The status register also has the link status
+		 * and AN complete bits in the same bit location. This will
+		 * only be used when AN is enabled.
+		 */
+		lpa = readl(spcs->base + GMAC_ANE_LPA);
+
+		phylink_mii_c22_pcs_decode_state(state, neg_mode, status, lpa);
+	} else {
+		state->link = false;
+	}
+}
+
+static int dwmac_integrated_pcs_config_aneg(struct stmmac_pcs *spcs,
+					    phy_interface_t interface,
+					    const unsigned long *advertising)
+{
+	bool changed = false;
+	u32 adv;
+
+	adv = phylink_mii_c22_pcs_encode_advertisement(interface, advertising);
+	if (readl(spcs->base + GMAC_ANE_ADV) != adv)
+		changed = true;
+	writel(adv, spcs->base + GMAC_ANE_ADV);
+
+	return changed;
 }
 
 static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
@@ -46,13 +99,28 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 				       bool permit_pause_to_mac)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	bool changed = false, ane = true;
+
+	/* Only configure the advertisement and allow AN in BASE-X mode if
+	 * the core supports TBI/RTBI. AN will be filtered out by via phylink
+	 * and the .pcs_inband_caps() method above.
+	 */
+	if (phy_interface_mode_is_8023z(interface) &&
+	    spcs->support_tbi_rtbi) {
+		ane = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
+
+		changed = dwmac_integrated_pcs_config_aneg(spcs, interface,
+							   advertising);
+	}
 
-	dwmac_ctrl_ane(spcs->base, 0, 1, spcs->priv->hw->reverse_sgmii_enable);
+	dwmac_ctrl_ane(spcs->base, 0, ane,
+		       spcs->priv->hw->reverse_sgmii_enable);
 
-	return 0;
+	return changed;
 }
 
 static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
+	.pcs_inband_caps = dwmac_integrated_pcs_inband_caps,
 	.pcs_enable = dwmac_integrated_pcs_enable,
 	.pcs_disable = dwmac_integrated_pcs_disable,
 	.pcs_get_state = dwmac_integrated_pcs_get_state,
@@ -84,9 +152,18 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 int stmmac_integrated_pcs_get_phy_intf_sel(struct phylink_pcs *pcs,
 					   phy_interface_t interface)
 {
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+
 	if (interface == PHY_INTERFACE_MODE_SGMII)
 		return PHY_INTF_SEL_SGMII;
 
+	if (phy_interface_mode_is_8023z(interface)) {
+		if (spcs->support_tbi_rtbi)
+			return PHY_INTF_SEL_TBI;
+		else
+			return PHY_INTF_SEL_SGMII;
+	}
+
 	return -EINVAL;
 }
 
@@ -104,7 +181,20 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 	spcs->int_mask = int_mask;
 	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
 
+	/* If the PCS supports extended status, then it supports BASE-X AN
+	 * with a TBI interface to the SerDes. Otherwise, we can support
+	 * BASE-X without AN using SGMII, which is required for qcom-ethqos.
+	 */
+	if (readl(spcs->base + GMAC_AN_STATUS) & BMSR_ESTATEN)
+		spcs->support_tbi_rtbi = true;
+
 	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, spcs->pcs.supported_interfaces);
+
+	/* Only allow 2500BASE-X if the SerDes has support. */
+	if (priv->plat->flags & STMMAC_FLAG_SERDES_SUPPORTS_2500M)
+		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
+			  spcs->pcs.supported_interfaces);
 
 	priv->integrated_pcs = spcs;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 23bbd4f10bf8..12ea87792fcb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -32,6 +32,7 @@ struct stmmac_pcs {
 	void __iomem *base;
 	u32 int_mask;
 	struct phylink_pcs pcs;
+	bool support_tbi_rtbi;
 };
 
 static inline struct stmmac_pcs *
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index b96ae9dadfab..aa57ee327606 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -192,6 +192,7 @@ enum dwmac_core_type {
 #define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(12)
 #define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
 #define STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD	BIT(14)
+#define STMMAC_FLAG_SERDES_SUPPORTS_2500M	BIT(15)
 
 struct mac_device_info;
 
-- 
2.47.3


