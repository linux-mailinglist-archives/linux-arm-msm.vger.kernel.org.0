Return-Path: <linux-arm-msm+bounces-96234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FUnOC6urmkSHwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:25:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5BB237E6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE2FD30C1C04
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2F439A80A;
	Mon,  9 Mar 2026 11:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="QlPeQNVG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5978438F947;
	Mon,  9 Mar 2026 11:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773055245; cv=none; b=jAfsjULQh4HOVajzC0whTyAEDouIZFm6EG13TB2ueOvOykiUpMbbzPvpSM6VX4mp0I3ifiX31B9ghhSVd7T9rZpfkhvby6ATUgzFEdN2VLBO/hI3WmOvC3wnxOdkCZyPFFIyxJBKCAfYkx7IyQh22+n2J5+1Ihmzh5hXWcdajn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773055245; c=relaxed/simple;
	bh=k/+UXztiTIRmn5C2HoXVepVuGYFwOktg2pNHu1eRCug=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=JYlLksBPT/4uJXZKG7P6kiuw2iCaiCMndaTJPllgHqSStPUwFsA65RcBrCrZRxVUzVZw0TQAo3vCz4zmQ/blKCnbaMshML22t3I6Qknasctj5lLs1Sywo6vai412ZW0NNL3CHDwkG5D1ew1d+D9mXNU1tz2Fd2V8nYpZd6DtyiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=QlPeQNVG; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=36WRI+JCd4BFmrvad+7p4gmoOsMObEyib/ryrjWih7g=; b=QlPeQNVGJSp+PsqwpWKbc3j6dm
	bC9J7ms7Z3VEYpLBBqp1FYKWPDmWooEGxVyHhsF/oG+e5126mBs+uWqHj+yzuP4AetSPmV0zy3OgW
	xZgA11m3l1WtRh3ZeDwkggFJ/h10RQ4wVLLM5BJu7jySbnzoiQnaJnIBRzmYKbU8KrTn4YJY5k/wA
	dgMCWi5BC0/N2t2QbuGoK3fBRvTL3A9GlI9bwob9Dms+KxlcOEQtRuMkHWrMOJYdXRhf93TD9TI6B
	0ckEyEZc0+KfojiEcEGG2ADGdkRRJt8Vxh9x7ffCKXo/6pw/rnOGpDoXwcaaCMnB43KiG+Kn0TC85
	HpENOvIQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50436 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vzYf8-000000003g4-1s2s;
	Mon, 09 Mar 2026 11:20:38 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vzYf7-0000000CZyh-1jIy;
	Mon, 09 Mar 2026 11:20:37 +0000
In-Reply-To: <aa6sofjFxyi2nkpr@shell.armlinux.org.uk>
References: <aa6sofjFxyi2nkpr@shell.armlinux.org.uk>
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
Subject: [PATCH RFC net-next v3 3/8] net: stmmac: add BASE-X support to
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
Message-Id: <E1vzYf7-0000000CZyh-1jIy@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 09 Mar 2026 11:20:37 +0000
X-Rspamd-Queue-Id: 8D5BB237E6E
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
	TAGGED_FROM(0.00)[bounces-96234-lists,linux-arm-msm=lfdr.de,kernel];
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
	NEURAL_SPAM(0.00)[0.235];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,armlinux.org.uk:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,rmk-PC.armlinux.org.uk:mid]
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

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 89 ++++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |  1 +
 include/linux/stmmac.h                        |  1 +
 3 files changed, 87 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index df72f7c5a6a7..5dbb8fd41099 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -26,6 +26,27 @@
 #define GMAC_RGSMII_SPEED_2_5		0
 #define GMAC_RGSMII_LNKSTS		BIT(3)
 
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
@@ -47,12 +68,20 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
 					   struct phylink_link_state *state)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
-	u32 status, rgsmii;
+	u32 status, lpa, rgsmii;
 
 	status = readl(spcs->base + GMAC_AN_STATUS);
 
 	if (phy_interface_mode_is_8023z(state->interface)) {
-		state->link = false;
+		/* For BASE-X modes, the PCS block supports the advertisement
+		 * and link partner advertisement registers using standard
+		 * 802.3 format. The status register also has the link status
+		 * and AN complete bits in the same bit location. This will
+		 * only be used when AN is enabled.
+		 */
+		lpa = readl(spcs->base + GMAC_ANE_LPA);
+
+		phylink_mii_c22_pcs_decode_state(state, neg_mode, status, lpa);
 	} else {
 		rgsmii = field_get(spcs->rgsmii_status_mask,
 				   readl(spcs->rgsmii));
@@ -84,6 +113,21 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
 	}
 }
 
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
+}
+
 static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 				       unsigned int neg_mode,
 				       phy_interface_t interface,
@@ -91,13 +135,28 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
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
@@ -129,9 +188,18 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
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
 
@@ -151,7 +219,20 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv,
 	spcs->int_mask = pcs_info->int_mask;
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
index 09e609f111b1..b2b12d34b3dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -41,6 +41,7 @@ struct stmmac_pcs {
 	u32 rgsmii_status_mask;
 	u32 int_mask;
 	struct phylink_pcs pcs;
+	bool support_tbi_rtbi;
 };
 
 static inline struct stmmac_pcs *
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 965ada809fdf..3a865216451f 100644
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


