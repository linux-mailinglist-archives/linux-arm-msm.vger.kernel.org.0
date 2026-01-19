Return-Path: <linux-arm-msm+bounces-89662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ED9D3A8F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4498630051BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF26035BDAB;
	Mon, 19 Jan 2026 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="ZrAhTMBn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0697E322B79;
	Mon, 19 Jan 2026 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826087; cv=none; b=lQuYT3DQf3+SNwGQdt8lfj5nIW93KTsftiHA8tys3zHsqSS471WAiP7azrwJVdKonUv6T0ZQ7n0DE5U4j2CmyhLuGRCF+utYktvFeA/ZqgzYacvN3on60WnqcJYeOsoEbrzIggbJKFPjNQd0MXNRY4Mdm90oKurLhfrJMSIu6nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826087; c=relaxed/simple;
	bh=J+lch/QnU6bmhq1dbyFljq3Uq5iMg+y+X3Zi36M54S0=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=ItTgT/hjF1vg5X/4fY3+4GuhmmdGMg5XhoLLykGhkyz/5bU0x5xvbSZoEsojvz4D7CE63/9vGIWvtZVEZjvrG9RGGZCbUQ3WGbgXl9iHGC4lJNzaIbEIYKaFWz7zjbJlHj9brocp98Dn3ywKTTWV2RffS4c5KEBFsA9QEHB7gFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=ZrAhTMBn; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CnXST3r2P+aEVClPx39H5JC8XmfgYGJp1xNWKpd6Nmg=; b=ZrAhTMBn41fQviJeJGEUigRX/k
	bwFaLcB0qDip4xHV8y6uYU5PSIjFPgBvGwhXIks+p3xVaXAgytMqVU0AV9UBiPBGYJqHbji4cTdUl
	U9dOJpebldlc9IvbKhsaho0WUK1QaHnJZ4nVETW3kI9T/yEziwQEHrZgF3O4rpuFwOLapWydgkT0F
	KGVx99HKCIq78Ufy94g+atWFY4gOUfzKeaUQrFEn80Uh1SUxkuSRuIykHItruVzhYwXmuposNMLry
	9SOaWGObG6qxtEGpbixNPeGQ4V0+t8h9EscaiaPC6GIiziTZ9opMg8CVTRoyVBeWVZjqp9iqk72hw
	vvcwzn+g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59828 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vhoSj-0000000054F-3kZR;
	Mon, 19 Jan 2026 12:34:30 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vhoSh-00000005H29-1LYk;
	Mon, 19 Jan 2026 12:34:27 +0000
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
Subject: [PATCH net-next 10/14] net: stmmac: use integrated PCS for BASE-X
 modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vhoSh-00000005H29-1LYk@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 19 Jan 2026 12:34:27 +0000

dwmac-qcom-ethqos supports SGMII and 2500BASE-X using the integrated
PCS, so we need to expand the PCS support to include support for
BASE-X modes.

Add support to the prereset configuration to detect 2500BASE-X, and
arrange for stmmac_mac_select_pcs() to return the integrated PCS if
its supported_interfaces bitmap reports support for the interface mode.

This results in priv->hw->pcs now being write-only, so remove it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 49df46be3669..8ef54f6e78f6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -629,7 +629,6 @@ struct mac_device_info {
 	unsigned int unicast_filter_entries;
 	unsigned int mcast_bits_log2;
 	unsigned int rx_csum;
-	unsigned int pcs;
 	unsigned int xlgmac;
 	unsigned int num_vlan;
 	u32 vlan_filter[32];
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5254d9d19ffe..a63ae6c4bc8a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -911,11 +911,8 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
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
@@ -1173,7 +1170,6 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 
 	if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_SGMII) {
 		netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
-		priv->hw->pcs = STMMAC_PCS_SGMII;
 
 		switch (speed) {
 		case SPEED_10:
-- 
2.47.3


