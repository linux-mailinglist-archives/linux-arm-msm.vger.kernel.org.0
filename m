Return-Path: <linux-arm-msm+bounces-89047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B48E2D209B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 18:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 949BD300D672
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 17:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DCA2FD1DC;
	Wed, 14 Jan 2026 17:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="wswCc7Nv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F36322B83;
	Wed, 14 Jan 2026 17:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768412746; cv=none; b=brLOOEzLjZ9+cPlMrpoDswHmM0GzXyb5yZFn5wFToDbnGWOc0I7jReJw229jIGSivlvBWkkH361l8R7lF0RLZ+BwSUmUL+k0YslyEOJQbPl9KFtI0kLGLtnWuzBWf603tzBTG/5v9Ib66jCdeqtRtlj5HPPKdlAnsYIeECZ00zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768412746; c=relaxed/simple;
	bh=M+aUfnIwYKyN3jqE+P5Kft2SUb17bVuodkptxj3xGQw=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=EpVAbE1UzdPXvl4yPU4WAaNSPrz6ptdlVKEIKjnhIDUDQgNMlz/eq79EH0ma2ohtWwOG30Zz6slTpkjlPYFiUZRXJkT6fz8HSHh/Zc5mIGu0PDjhbyhunQzYlhJuwbXSKcFKpCZ+jK/yplyz5ns+NbBXTWFE6eTfnO2Cn4bXNE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=wswCc7Nv; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UKAhlr5OggK7Kiko5hzrUZsY9UdyS+aSQMwobLSy2wU=; b=wswCc7NvOlzQJtS2vFxO3q+Kgc
	kMHo/dZtkrt79nbhbCqKRx3VoyBWbdiAA9RTdhNyFaQpL+sMa2HNFcHS4K5arCgc/itYE6haMys96
	ClJ8yVQ0nN7BeEHJVMQ1wo/xaGoAx1RWEwSdUJqHrG/HHVXL5lZmd94U1rt3gBsCOuWbruSU4HCjH
	rcG8MMSGeNOWrhNCxnRQ1kKeh2JHuXZUmEw6T0tT8di4Bqrtfk1VUvh9r2cWNDeBGzGS1JHyLmxS6
	B2sBGboEvqJhEgz1GAjevcjdZ6KZbgW7jSboiYFGzz8xSLwf8QQOS4H13PKYzy7bBEYKne7ASLYTy
	jzObsRJg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40208 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vg4w0-000000000Tn-1RQy;
	Wed, 14 Jan 2026 17:45:32 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vg4vx-00000003SFz-1ldy;
	Wed, 14 Jan 2026 17:45:29 +0000
In-Reply-To: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 04/14] net: stmmac: wrap phylink's rx_clk_stop
 functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vg4vx-00000003SFz-1ldy@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 14 Jan 2026 17:45:29 +0000

With generic SerDes support, stmmac will need to do more work to ensure
that clk_rx_i is running in all configurations. Rather than turn each
site that calls phylink_rx_clk_stop_xxx() into a list of functions,
move these to their own pair of functions so that they can be
augmented at a single location.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 32 ++++++++++++-------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c2589f02ff7e..24a2555ca329 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3547,6 +3547,16 @@ static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
 	}
 }
 
+static void stmmac_clk_rx_i_require(struct stmmac_priv *priv)
+{
+	phylink_rx_clk_stop_block(priv->phylink);
+}
+
+static void stmmac_clk_rx_i_release(struct stmmac_priv *priv)
+{
+	phylink_rx_clk_stop_unblock(priv->phylink);
+}
+
 /**
  * stmmac_hw_setup - setup mac in a usable state.
  *  @dev : pointer to the device structure.
@@ -3578,12 +3588,12 @@ static int stmmac_hw_setup(struct net_device *dev)
 	 * Block the receive clock stop for LPI mode at the PHY in case
 	 * the link is established with EEE mode active.
 	 */
-	phylink_rx_clk_stop_block(priv->phylink);
+	stmmac_clk_rx_i_require(priv);
 
 	/* DMA initialization and SW reset */
 	ret = stmmac_init_dma_engine(priv);
 	if (ret < 0) {
-		phylink_rx_clk_stop_unblock(priv->phylink);
+		stmmac_clk_rx_i_release(priv);
 		netdev_err(priv->dev, "%s: DMA engine initialization failed\n",
 			   __func__);
 		return ret;
@@ -3591,7 +3601,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 
 	/* Copy the MAC addr into the HW  */
 	stmmac_set_umac_addr(priv, priv->hw, dev->dev_addr, 0);
-	phylink_rx_clk_stop_unblock(priv->phylink);
+	stmmac_clk_rx_i_release(priv);
 
 	/* Initialize the MAC Core */
 	stmmac_core_init(priv, priv->hw, dev);
@@ -3670,9 +3680,9 @@ static int stmmac_hw_setup(struct net_device *dev)
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
 
-	phylink_rx_clk_stop_block(priv->phylink);
+	stmmac_clk_rx_i_require(priv);
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
-	phylink_rx_clk_stop_unblock(priv->phylink);
+	stmmac_clk_rx_i_release(priv);
 
 	return 0;
 }
@@ -6107,9 +6117,9 @@ static int stmmac_set_features(struct net_device *netdev,
 	else
 		priv->hw->hw_vlan_en = false;
 
-	phylink_rx_clk_stop_block(priv->phylink);
+	stmmac_clk_rx_i_require(priv);
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
-	phylink_rx_clk_stop_unblock(priv->phylink);
+	stmmac_clk_rx_i_release(priv);
 
 	return 0;
 }
@@ -6378,9 +6388,9 @@ static int stmmac_set_mac_address(struct net_device *ndev, void *addr)
 	if (ret)
 		goto set_mac_error;
 
-	phylink_rx_clk_stop_block(priv->phylink);
+	stmmac_clk_rx_i_require(priv);
 	stmmac_set_umac_addr(priv, priv->hw, ndev->dev_addr, 0);
-	phylink_rx_clk_stop_unblock(priv->phylink);
+	stmmac_clk_rx_i_release(priv);
 
 set_mac_error:
 	pm_runtime_put(priv->device);
@@ -8192,11 +8202,11 @@ int stmmac_resume(struct device *dev)
 	stmmac_init_timestamping(priv);
 
 	stmmac_init_coalesce(priv);
-	phylink_rx_clk_stop_block(priv->phylink);
+	stmmac_clk_rx_i_require(priv);
 	stmmac_set_rx_mode(ndev);
 
 	stmmac_restore_hw_vlan_rx_fltr(priv, ndev, priv->hw);
-	phylink_rx_clk_stop_unblock(priv->phylink);
+	stmmac_clk_rx_i_release(priv);
 
 	stmmac_enable_all_queues(priv);
 	stmmac_enable_all_dma_irq(priv);
-- 
2.47.3


