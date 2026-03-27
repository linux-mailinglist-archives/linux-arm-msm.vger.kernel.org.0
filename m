Return-Path: <linux-arm-msm+bounces-100211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGThNuhDxmmgIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:46:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A5D341413
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D8883033537
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 08:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714993BED2D;
	Fri, 27 Mar 2026 08:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="F3xpG18+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28A53D9DD3;
	Fri, 27 Mar 2026 08:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774601022; cv=none; b=N4ij8UBilbezfREray9TvI57jrIu8OXJ5YYqywY9bg68hNHCQA79PEd8DPVyvXZiMV46duhohagO9aTADcFrse/Pi5smUWoDN5yJq+Lfpd2Pc0x+Yvif0WB0nXFvQ5c+sgp7pmNn/0k1G6mBOgDqATXXWzU3K6HLNtU+iAU7+h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774601022; c=relaxed/simple;
	bh=g8bfuwt1amwOA4d5ow6yKGQwmbrP8RLSo2jgfxCnKYY=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=V768LrZbsPG8z+0AU8aY9PvEclEnf7Lsr7oB9zTd63t5XwCyMMAbmZ616ZIiro9GBXzwVSOlazeH3sgxknFUAm1D1e1ByamE6v2d1Kr/gy0JZyxzj19LZdrPKODQvJUgPsmImtL0DxldH2Tyvc9TmbYY5bn4Ns1l1vXUrp78lfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=F3xpG18+; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7+oR9CjUjeU2ZjMW8v/A1iUxamDrC7VbATO8vn8+PJM=; b=F3xpG18+8legrxdWS06GpJzL7W
	kq/pzLPn6NJLDEm/xuYNDHLD0Ea3HEYynzv0eTlm5MJbTK//qMPmNl4rJ88kKDaewKW2iGmYz0jd3
	voSh0xvxhdlj6LUci/NMtMBcOpF+i5aElxXMkhQ4gfvqQ0HwK1i32ch49b+BlJHYMrjYe2e1/xsnH
	ARjpdHE/NoYXeiAgAnuaFtJ+Q5+OtfvqICBmBUKfXjZgmjjPmbDWtpP3+VTzJpziJaPsxkyhbaZCQ
	5KyrFfnpbwnllxVCKMEruTyona+f+miZKAILSpvIvPs/M+Vezxyikm4L1yKuVXE64UhN9XbSyIGB1
	6EJSodXQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55802 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62n0-000000005oc-12H5;
	Fri, 27 Mar 2026 08:43:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62mz-0000000E3Bx-1Xd8;
	Fri, 27 Mar 2026 08:43:33 +0000
In-Reply-To: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
References: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 02/15] net: stmmac: qcom-ethqos: pass ethqos to
 ethqos_pcs_set_inband()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62mz-0000000E3Bx-1Xd8@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:43:33 +0000
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100211-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: D1A5D341413
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rather than getting the stmmac_priv pointer in
ethqos_configure_sgmii(), move it into ethqos_pcs_set_inband() and pass
the struct qcom_ethqos pointer instead.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 502f2b184a87..b9cfcf32cebc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -590,8 +590,11 @@ static void ethqos_configure_rgmii(struct qcom_ethqos *ethqos,
 	ethqos_rgmii_macro_init(ethqos, speed);
 }
 
-static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
+static void ethqos_pcs_set_inband(struct qcom_ethqos *ethqos, bool enable)
 {
+	struct net_device *dev = platform_get_drvdata(ethqos->pdev);
+	struct stmmac_priv *priv = netdev_priv(dev);
+
 	stmmac_pcs_ctrl_ane(priv, enable, 0);
 }
 
@@ -601,9 +604,6 @@ static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
 static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
 				   phy_interface_t interface, int speed)
 {
-	struct net_device *dev = platform_get_drvdata(ethqos->pdev);
-	struct stmmac_priv *priv = netdev_priv(dev);
-
 	switch (speed) {
 	case SPEED_2500:
 	case SPEED_1000:
@@ -620,7 +620,7 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
 		break;
 	}
 
-	ethqos_pcs_set_inband(priv, interface == PHY_INTERFACE_MODE_SGMII);
+	ethqos_pcs_set_inband(ethqos, interface == PHY_INTERFACE_MODE_SGMII);
 }
 
 static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
-- 
2.47.3


