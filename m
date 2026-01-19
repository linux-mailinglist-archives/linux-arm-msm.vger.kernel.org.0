Return-Path: <linux-arm-msm+bounces-89661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F06D3A914
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6200130F8FF8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193E835B15C;
	Mon, 19 Jan 2026 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="l2HrGxwv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530ED291C10;
	Mon, 19 Jan 2026 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826086; cv=none; b=h8g/sgD2eYDT6cznFXDEXb17TmJSUFTOAhIE2D4ZVaC2truzAIM4D4YgKYToRh+XftG5jfpsAurzvs4WpfVnqd7zqIvE+iChKpXv+2z00s4kXbAZWATqcxtDYImPq3IDL1mV+2ZARBiOIzJyKWc8W6SF5QDhpjhxttIfN8m7Nm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826086; c=relaxed/simple;
	bh=Ig891wSW/20SxJRmGTOkZIF8ROQ8/DDTXWbWP2ySlCg=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=MCCt0BAIZ58Wpk6rEoWe8wCTXVHm4nVIXURj7XC90XTIFrCHY5EzZiw8RIiHeYpxmdJAZc7ot32a+8FUKNvoBxsFR1ie//v7UkyDoQZzH5NhgGkVBZrsbQkT1GPluWa1i7QpP65EbcTfqvsYA9lnOZtYu/l752f9+I6Gg0M7TAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=l2HrGxwv; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2h/tSYyo8iu5oqYURY/nNiWSh/Bd6u+p5RGNHyXJOyE=; b=l2HrGxwvTdIJjYBnlpjn3ih+PC
	dnz8Zk/kozomhPK9VTyRgHg3nl0f4utEQ/Dra79hp2yxB8ATdLpqewDNudZtFpJAe202nTcHoQ+SS
	DkLNRXg9Ze++4zA/9Y90/xtU/3UqnKxk5SHmKLHT7QvDdASvKcF/OQrHtID5o/rUyrENivCHSdpql
	3FI15U+KO8CEGVVoinBUYviSl7w0UpYZIpY2XHSNVQ9ZsLFpvvSJdOvUdAIy43gwkwD02ttEo0Ksx
	O/iOHbHtSvpJkpFQHPtSuab2n/kKwTazjcFj3FRlvzIvCxTzyx1yr+PWFG5+sl2Li1x0MyRGBJ56n
	awkb0hNg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59826 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vhoSf-00000000540-0wnw;
	Mon, 19 Jan 2026 12:34:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vhoSc-00000005H23-0rLU;
	Mon, 19 Jan 2026 12:34:22 +0000
In-Reply-To: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 09/14] net: stmmac: add BASE-X support to integrated
 PCS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vhoSc-00000005H23-0rLU@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 19 Jan 2026 12:34:22 +0000

The integrated PCS supports 802.3z (BASE-X) modes when the Synopsys
IP is coupled with an appropriate SerDes to provide the electrical
interface. The PCS presents a TBI interface to the SerDes for this.
Thus, the BASE-X related registers are only present when TBI mode is
supported.

dwmac-qcom-ethqos added support for using 2.5G with the integrated PCS
by calling dwmac_ctrl_ane() directly.

Add support for 1000BASE-X mode to the integrated PCS support if the
PCS supports TBI, and 2500BASE-X if we have a SerDes that supports
this mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 95 ++++++++++++++++++-
 1 file changed, 92 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index cf7337e9ed3e..edcf36083806 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -17,6 +17,50 @@
 #define GMAC_ANE_LPA	0x0c	/* ANE link partener ability */
 #define GMAC_TBI	0x14	/* TBI extend status */
 
+static enum ethtool_link_mode_bit_indices dwmac_hd_mode_bits[] = {
+	ETHTOOL_LINK_MODE_10baseT_Half_BIT,
+	ETHTOOL_LINK_MODE_100baseT_Half_BIT,
+	ETHTOOL_LINK_MODE_1000baseT_Half_BIT,
+	ETHTOOL_LINK_MODE_100baseFX_Half_BIT,
+	ETHTOOL_LINK_MODE_10baseT1S_Half_BIT,
+	ETHTOOL_LINK_MODE_10baseT1S_P2MP_Half_BIT,
+};
+
+static int dwmac_integrated_pcs_validate(struct phylink_pcs *pcs,
+					 unsigned long *supported,
+					 const struct phylink_link_state *state)
+{
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	size_t i;
+	u32 val;
+
+	if (phy_interface_mode_is_8023z(state->interface)) {
+		/* ESTATUS_1000_XFULL is always set, so full duplex is
+		 * supported. ESTATUS_1000_XHALF depends on core configuration.
+		 */
+		val = readl(spcs->base + GMAC_TBI);
+		if (~val & ESTATUS_1000_XHALF)
+			for (i = 0; i < ARRAY_SIZE(dwmac_hd_mode_bits); i++)
+				linkmode_clear_bit(dwmac_hd_mode_bits[i],
+						   supported);
+
+		return 0;
+	} else if (state->interface == PHY_INTERFACE_MODE_SGMII) {
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static unsigned int dwmac_integrated_pcs_inband_caps(struct phylink_pcs *pcs,
+						     phy_interface_t interface)
+{
+	if (phy_interface_mode_is_8023z(interface))
+		return LINK_INBAND_ENABLE | LINK_INBAND_DISABLE;
+
+	return 0;
+}
+
 static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
@@ -52,7 +96,23 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
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
+		/* For 802.3z modes, the PCS block supports the advertisement
+		 * and link partner advertisement registers using standard
+		 * 802.3 format. The status register also has the link status
+		 * and AN complete bits in the same bit location.
+		 */
+		lpa = readl(spcs->base + GMAC_ANE_LPA);
+
+		phylink_mii_c22_pcs_decode_state(state, neg_mode, status, lpa);
+	} else {
+		state->link = false;
+	}
 }
 
 static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
@@ -62,6 +122,8 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 				       bool permit_pause_to_mac)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	bool changed = false, ane = true;
+	u32 adv;
 	int ret;
 
 	if (spcs->interface != interface) {
@@ -72,12 +134,25 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 		spcs->interface = interface;
 	}
 
-	dwmac_ctrl_ane(spcs->base, 0, 1, spcs->priv->hw->reverse_sgmii_enable);
+	if (phy_interface_mode_is_8023z(interface)) {
+		adv = phylink_mii_c22_pcs_encode_advertisement(interface,
+							       advertising);
+		if (readl(spcs->base + GMAC_ANE_ADV) != adv)
+			changed = true;
+		writel(adv, spcs->base + GMAC_ANE_ADV);
 
-	return 0;
+		ane = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
+	}
+
+	dwmac_ctrl_ane(spcs->base, 0, ane,
+		       spcs->priv->hw->reverse_sgmii_enable);
+
+	return changed;
 }
 
 static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
+	.pcs_validate = dwmac_integrated_pcs_validate,
+	.pcs_inband_caps = dwmac_integrated_pcs_inband_caps,
 	.pcs_enable = dwmac_integrated_pcs_enable,
 	.pcs_disable = dwmac_integrated_pcs_disable,
 	.pcs_get_state = dwmac_integrated_pcs_get_state,
@@ -112,6 +187,9 @@ int stmmac_integrated_pcs_get_phy_intf_sel(struct stmmac_priv *priv,
 	if (interface == PHY_INTERFACE_MODE_SGMII)
 		return PHY_INTF_SEL_SGMII;
 
+	if (phy_interface_mode_is_8023z(interface))
+		return PHY_INTF_SEL_TBI;
+
 	return -EINVAL;
 }
 
@@ -140,6 +218,17 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 
 	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
 
+	if (readl(spcs->base + GMAC_AN_STATUS) & BMSR_ESTATEN) {
+		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+			  spcs->pcs.supported_interfaces);
+
+		/* Only allow 2500Base-X if the SerDes has support. */
+		ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_2500BASEX);
+		if (ret == 0)
+			__set_bit(PHY_INTERFACE_MODE_2500BASEX,
+				  spcs->pcs.supported_interfaces);
+	}
+
 	priv->integrated_pcs = spcs;
 
 	return 0;
-- 
2.47.3


