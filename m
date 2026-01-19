Return-Path: <linux-arm-msm+bounces-89670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D49A4D3A94D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 552433009FAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C607135CBD4;
	Mon, 19 Jan 2026 12:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="t+ITliaC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D91D35CBB6;
	Mon, 19 Jan 2026 12:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826613; cv=none; b=D0koKJ1GJWOzniq5obdnnUjUTnledasxJ3NQBHEQtMonW0nRFnnqj78175FZo96VOMdDV88Wbpikqnm17jp01F6dx20ZKNw82yYMTVvA3bf/UoYAtXkAPDXAZ6nOY6mmVX7c+yRi6v0xYheXULLu25gL+m7VAKMasmd+7XG5vgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826613; c=relaxed/simple;
	bh=se0A2mTc+B9bgC4swjmykozmDSG7tday5Dc7tF6f6xE=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=Tg508rfrUKAcumBoCvVNzUuXTE2MB2ymzIAI/zIKbt5Iva87YE27khIxMuSwOaGKDoP3NQfr5Trr2+9Yo17T8DzUopxcZlcAZBlDwYx9fIgzIerQoqwwLD/CHEc4ru9CrJLAofiG8zvzb7TVOrnOwS1eUlAfy4Jgf4hnewPQUyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=t+ITliaC; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RIxtW9pHgFoSB9hWlBfDu5uAWfxTZyga1Fv2xaSrx3E=; b=t+ITliaCoeUPZ8eY6voAno2L8Q
	yn8GfIxRXDaaFiIu29f6e3tGIOQP1Mp4ffyH2xmWiOQ97qK+EwVBGhDWASQ3dy1Gdh29QCUiErkF4
	7oKNEy/fcWmMBHJgeUQ77j4+vbGP2oVdLPXZapJM98ulvGw1+trDmCtV4lz0HYaLsO0WNd8nhUbIK
	343hnB9PBSMwcU4scoWxNgz6VnK3OKwyyRUILAWMlQNVIdsCS5TcL/q4+HG4Ha4C5tsAExv5t16vp
	XWkkG1xKC3uu1J85tI+yHih4uJev7KLL7EM7267qUYhrdAx4zj0qc1gxbSKXj9PfayFpG0j3Oy22L
	kQfobhVA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36888 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vhoSy-0000000054y-3iIQ;
	Mon, 19 Jan 2026 12:34:45 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vhoSw-00000005H2T-2oVw;
	Mon, 19 Jan 2026 12:34:42 +0000
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
Subject: [PATCH net-next 13/14] net: stmmac: configure SGMII AN control
 according to phylink
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vhoSw-00000005H2T-2oVw@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 19 Jan 2026 12:34:42 +0000

Provide phylink with the integrated PCS autonegotiation capabilities,
and configure the PCS's AN settings according to phylink's requested
requirements.

This may cause regressions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 9dd7e78cfbc4..0426f608ebdf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -65,7 +65,8 @@ static int dwmac_integrated_pcs_validate(struct phylink_pcs *pcs,
 static unsigned int dwmac_integrated_pcs_inband_caps(struct phylink_pcs *pcs,
 						     phy_interface_t interface)
 {
-	if (phy_interface_mode_is_8023z(interface))
+	if (phy_interface_mode_is_8023z(interface) ||
+	    interface == PHY_INTERFACE_MODE_SGMII)
 		return LINK_INBAND_ENABLE | LINK_INBAND_DISABLE;
 
 	return 0;
@@ -162,8 +163,9 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 				       bool permit_pause_to_mac)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
-	bool changed = false, ane = true;
-	u32 adv;
+	void __iomem *an_control = spcs->base + GMAC_AN_CTRL(0);
+	bool changed = false;
+	u32 adv, ctrl;
 	int ret;
 
 	if (spcs->interface != interface) {
@@ -180,12 +182,16 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 		if (readl(spcs->base + GMAC_ANE_ADV) != adv)
 			changed = true;
 		writel(adv, spcs->base + GMAC_ANE_ADV);
-
-		ane = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
 	}
 
-	dwmac_ctrl_ane(spcs->base, 0, ane,
-		       spcs->priv->hw->reverse_sgmii_enable);
+	ctrl = readl(an_control) & ~(GMAC_AN_CTRL_ANE | GMAC_AN_CTRL_SGMRAL);
+	if (spcs->priv->hw->reverse_sgmii_enable)
+		ctrl |= GMAC_AN_CTRL_SGMRAL | GMAC_AN_CTRL_ANE;
+	else if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
+		ctrl |= GMAC_AN_CTRL_ANE;
+	else
+		ctrl |= GMAC_AN_CTRL_SGMRAL;
+	writel(ctrl, an_control);
 
 	return changed;
 }
-- 
2.47.3


