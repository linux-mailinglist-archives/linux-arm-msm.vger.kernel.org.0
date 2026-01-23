Return-Path: <linux-arm-msm+bounces-90319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHC3JrBGc2mHuQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 11:00:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B1973D16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 11:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5D7D307115F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 09:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4692378838;
	Fri, 23 Jan 2026 09:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="XgNeUgPk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C339C3783B6;
	Fri, 23 Jan 2026 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162107; cv=none; b=JQ5Ttph3WK6T+rNiNlW/A5o9+/GjC0XYx3DwWn0TvD5K7QjBtdYff/xEvAPyAki9KivAnmGB+7XyxqImxkrZEsHuCEIp0WjX6AwUDG5Itpmv3dRnrDER72i7/mOFgGFW4aLaGEhbRD1RIJV5Th9PZ7JSvXXniYvVeLDm9hMwwNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162107; c=relaxed/simple;
	bh=J+lch/QnU6bmhq1dbyFljq3Uq5iMg+y+X3Zi36M54S0=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=kM7T0Sls275OOyqawizrblocO2aNFPoCh+wsLKKsaj0oMqhOml3k/pUODdO0UbjNR19pa9yIrOXNGjqb5cctfUGzWnLKJn900HI9ZUguwQSTHTSDBULIEVe+zdvyBvpGR3VwdW0VELClWKOlOysAQ2lId+8eTV+GrDlL80Grz7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=XgNeUgPk; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CnXST3r2P+aEVClPx39H5JC8XmfgYGJp1xNWKpd6Nmg=; b=XgNeUgPk9Y7RMdPjVFJqsUotwq
	L08XWmkhik2KPIWO/+8m2sTvRmQpc25pJ1Suyqtuwcu5/xWN+wY03od+OqZh7Gva2YB72HvATLAmx
	ACT/Y5Ti0Ka38UYOtiFxs0s8pZ2qrsnuUbmfJAquelKK6MyCCQjpngJZxdsV0r/rsxytJl/1EvSsS
	Yz4cuG0KwXcKfgK+Fbzv2I5Tqo2we45qIfdQXd+zmP79eh61lqe7CGbh0ZHI7l5vjgHkIWT4uJeBe
	B8sfcCAOoN7Fz5jLYh5afYcdASTGc6QAgRiiDNyhLHXDGyu4bc31OZ3rpTXJbA14q3oFTJX0vVJ7P
	/5S6E7tw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40620 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vjDrt-000000001ce-2Ioe;
	Fri, 23 Jan 2026 09:54:18 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vjDrl-00000005fQw-3ZXq;
	Fri, 23 Jan 2026 09:54:09 +0000
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
Subject: [PATCH net-next v2 10/14] net: stmmac: use integrated PCS for BASE-X
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
Message-Id: <E1vjDrl-00000005fQw-3ZXq@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 23 Jan 2026 09:54:09 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90319-lists,linux-arm-msm=lfdr.de,kernel];
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
	NEURAL_HAM(-0.00)[-0.812];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 23B1973D16
X-Rspamd-Action: no action

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


