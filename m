Return-Path: <linux-arm-msm+bounces-27779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F6C945C4F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 12:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C757C1F21953
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 10:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2CD1DE878;
	Fri,  2 Aug 2024 10:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Bi6peKW9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5421D1F4B;
	Fri,  2 Aug 2024 10:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722595657; cv=none; b=CLIKuf9HioO6eU9+Vf5HaakX+w4UcXmEOZtdklJv0JFmgZyJS7C7Fhbv+IGFNDoTnbEyHDdPg96HBNy8iT4++oQPOtn+WzmvQu/JxuvHu9qg/NHW1/eWT4RNRLhA6bwjiQ7iUvX2BqHFCiMKCD47JITYomd0XZ5IuD97BgibTWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722595657; c=relaxed/simple;
	bh=p+8IHXl8x1uF882H1bqSTl/7tVK7/Q9FJEvNoLTHLWc=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=QD9rIDmff9Cxx42AQVpmfOgmVqYW+XxFLXwtNe+sH1lfKc0g1gMVBWBY3XOJZC7vK8QG1+lTozf7PYwbq3rWnU3sFEEVrNeOY4PYaGF4hqAkKNbncrA5pK2SekARP8P30tDTu0U4H56a4Iu5oueYKh+KlrDjpNr6RDthfhe/T0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Bi6peKW9; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PBu+kBwVrpwu0aLOAbJWnE+yeChvJS6HtcbuvsSx73w=; b=Bi6peKW9a4oGw1dQ3HqExAWnsE
	HFTrKWBfbSQy+coYNtPtReDf31gPe4smTGUYtz82zptWyXgb9b3vDPIxwiLaGGDdWfzBumrgJB2yd
	DwcW2w740SIO1nZ2pCuDVTUt8aPDhmX/hPkV4e45gUKjLfWHksT8vXY0AWr5zHewkhDjthCbbr/Qe
	DQW6LJLOwfvji9WMyqN9FWdEHBspGm3Jm47jiUFZRcvi6QQVZvj7OPrXFrQIWM4tvzRneLF78ynkO
	ovemk8kPziZva2zmKuVf2GvUZ+w6aK72eSoe9xRkhgbi/8/nfAmVx7pIPKtnf16PetDGKqOQTfczH
	tb/bgzZg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36366 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1sZpoO-0006Eh-0N;
	Fri, 02 Aug 2024 11:47:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1sZpoL-000eHN-OZ; Fri, 02 Aug 2024 11:47:01 +0100
In-Reply-To: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 07/14] net: stmmac: dwmac1000: move PCS interrupt
 control
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1sZpoL-000eHN-OZ@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 02 Aug 2024 11:47:01 +0100

Control the PCS interrupt mask from phylink's pcs_enable() and
pcs_disable() methods rather than relying on driver variables.

This assumes that GMAC_INT_DISABLE_RGMII, GMAC_INT_DISABLE_PCSLINK
and GMAC_INT_DISABLE_PCSAN are all relevant to the PCS.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 33 +++++++++++++++----
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 66c17be79dec..05b2df08cb0f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -56,12 +56,7 @@ static void dwmac1000_core_init(struct mac_device_info *hw,
 	writel(value, ioaddr + GMAC_CONTROL);
 
 	/* Mask GMAC interrupts */
-	value = GMAC_INT_DEFAULT_MASK;
-
-	if (hw->pcs)
-		value &= ~GMAC_INT_DISABLE_PCS;
-
-	writel(value, ioaddr + GMAC_INT_MASK);
+	writel(GMAC_INT_DEFAULT_MASK, ioaddr + GMAC_INT_MASK);
 
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Tag detection without filtering */
@@ -376,6 +371,30 @@ static void dwmac1000_ctrl_ane(struct stmmac_priv *priv, bool ane,
 	dwmac_ctrl_ane(priv->ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
 }
 
+static int dwmac1000_mii_pcs_enable(struct phylink_pcs *pcs)
+{
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	void __iomem *ioaddr = spcs->priv->hw->pcsr;
+	u32 intr_mask;
+
+	intr_mask = readl(ioaddr + GMAC_INT_MASK);
+	intr_mask &= ~GMAC_INT_DISABLE_PCS;
+	writel(intr_mask, ioaddr + GMAC_INT_MASK);
+
+	return 0;
+}
+
+static void dwmac1000_mii_pcs_disable(struct phylink_pcs *pcs)
+{
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	void __iomem *ioaddr = spcs->priv->hw->pcsr;
+	u32 intr_mask;
+
+	intr_mask = readl(ioaddr + GMAC_INT_MASK);
+	intr_mask |= GMAC_INT_DISABLE_PCS;
+	writel(intr_mask, ioaddr + GMAC_INT_MASK);
+}
+
 static void dwmac1000_mii_pcs_get_state(struct phylink_pcs *pcs,
 					struct phylink_link_state *state)
 {
@@ -386,6 +405,8 @@ static void dwmac1000_mii_pcs_get_state(struct phylink_pcs *pcs,
 }
 
 static const struct phylink_pcs_ops dwmac1000_mii_pcs_ops = {
+	.pcs_enable = dwmac1000_mii_pcs_enable,
+	.pcs_disable = dwmac1000_mii_pcs_disable,
 	.pcs_config = dwmac_pcs_config,
 	.pcs_get_state = dwmac1000_mii_pcs_get_state,
 };
-- 
2.30.2


