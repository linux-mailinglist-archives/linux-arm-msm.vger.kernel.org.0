Return-Path: <linux-arm-msm+bounces-94248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB7IOJ0IoGm4fQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 09:47:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B2D1A2DC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 09:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E94C13058DC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 08:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692F93939AF;
	Thu, 26 Feb 2026 08:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="FuTTFnBa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40325395240;
	Thu, 26 Feb 2026 08:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772095337; cv=none; b=X5m12DViZT25R1d/HZkrc+/r1frb0yuAxYZWz1Jl7tAIkX3QxDVfioYjb5A3aJ36uSCxAGOmi5AMR8rRsdgNqBl5UIil7jP1MrmtbIjO5RAcbYvLjKhZteVbPDyoFlPbdmxtbGu9AUkJfDlnJmzgLWwCl6uj1UNELYMPhXbKV/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772095337; c=relaxed/simple;
	bh=NMrML7XWpFxonb99SXNOJH6rQio3XyQFef3xUJwrD30=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=hoxK4m+JfUJPUqtECup5lDUlb0g5opdm8wl/ASgJMprKYT2klrxJwVOvf/Y6Wm0yw6qeDeYksRrPe//bKs7Y3JYOduN8NaobPuaWVGOfVO6xPdvIE+SAWU0rJ5VRX+dRdMa0PYJW4+WA3c9Em5fl+hUJt77+WPXphYCKB6/rkAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=FuTTFnBa; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PkRfojPSv3CP3LZanTyC5uu1PLQ8pOplU1rIVTgxy/U=; b=FuTTFnBaht1vnHvhkBb6B+b/+F
	DZtCKUlKcwAXHvEbJw8m5qkUFn/tIGKmtDs8ZWGo1RkDjGz0wKWeKE9m/VfN3ywx3Je9ztKH/eCIb
	DFaRf0yKbW0C1BEaAfOIrk6HMU7avoqa5obYuya0Vxa2V9kIMz7UT9+JJnssjYGWeh2FSPJjvfaRA
	V3laoiHj+Fy6/AG2KwQle20yCg4iMRwdZrLDWEXfmgod1rBJuaVEL3wEBt73MNnCNgi4kUX9nOkKx
	uLRLUSzNNVFGjgZZNe3OfbA2GYAruFz+SOD8Lq5PIexB72Ag0llltRCQwYKa7TS97/ycqbDPseJfP
	ox8Qv4Qg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47470 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvWwf-000000007eH-25Mi;
	Thu, 26 Feb 2026 08:42:06 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvWwb-0000000AtKh-0dWB;
	Thu, 26 Feb 2026 08:42:01 +0000
In-Reply-To: <aaAHD_wWv2xCKntW@shell.armlinux.org.uk>
References: <aaAHD_wWv2xCKntW@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH RESEND net-next 8/8] net: stmmac: qcom-ethqos: remove
 phy_set_mode_ext() after phy_power_on()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvWwb-0000000AtKh-0dWB@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 26 Feb 2026 08:42:01 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94248-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 53B2D1A2DC0
X-Rspamd-Action: no action

The call to phy_set_mode_ext() after phy_power_on() was a work-around
for the qcom-sgmii-eth SerDes driver that only re-enabled its clocks on
phy_power_on() but did not configure the PHY. Now that the SerDes driver
fully configures the SerDes at phy_power_on(), there is no need to call
phy_set_mode_ext() immediately afterwards.

This also means we no longer need to record the previous operating mode
of the driver - this is up to the SerDes driver. In any case, the only
thing that we care about is the SerDes provides the necessary clocks to
the stmmac core to allow it to reset at this point. The actual mode is
irrelevant at this point as the correct mode will be configured in
ethqos_mac_finish_serdes() just before the network device is brought
online.

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c         | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8913f6f02b9e..cb1c074c2053 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,7 +105,6 @@ struct qcom_ethqos {
 
 	struct clk *link_clk;
 	struct phy *serdes_phy;
-	phy_interface_t serdes_mode;
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *rgmii_por;
@@ -648,17 +647,8 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 		return ret;
 
 	ret = phy_power_on(ethqos->serdes_phy);
-	if (ret) {
-		phy_exit(ethqos->serdes_phy);
-		return ret;
-	}
-
-	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
-			       ethqos->serdes_mode);
-	if (ret) {
-		phy_power_off(ethqos->serdes_phy);
+	if (ret)
 		phy_exit(ethqos->serdes_phy);
-	}
 
 	return ret;
 }
@@ -681,12 +671,9 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 
 	if (interface == PHY_INTERFACE_MODE_SGMII ||
-	    interface == PHY_INTERFACE_MODE_2500BASEX) {
+	    interface == PHY_INTERFACE_MODE_2500BASEX)
 		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
 				       interface);
-		if (ret == 0)
-			ethqos->serdes_mode = interface;
-	}
 
 	return ret;
 }
@@ -839,7 +826,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		plat_dat->host_dma_width = data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
-		ethqos->serdes_mode = PHY_INTERFACE_MODE_SGMII;
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}
-- 
2.47.3


