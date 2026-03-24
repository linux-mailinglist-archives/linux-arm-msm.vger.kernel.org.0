Return-Path: <linux-arm-msm+bounces-99664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJTQHsmQwmkXfAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:25:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 088DA30957B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B07BB3183059
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFE23EDAA9;
	Tue, 24 Mar 2026 13:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="sUz2hAzT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EB63E025D;
	Tue, 24 Mar 2026 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357903; cv=none; b=sxa/9caQS6k5axU/n4k3KBYBcI+MPpGzG0B9AN+ZzDhxIcYKkiV9ap3hP88uafcISzeL8PXhvVPNiQddxAbHQ4hxdsN2N34PmE3pLMyxbaxiIJ6rlkltmsr4VbYpU3nOQbNkQxPihQr5TmYKf796wY+j6s4aCeLYKQmYpdi2cDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357903; c=relaxed/simple;
	bh=0Bz+9tbnRiwVFmZnbuZeJ1v9AfXZSNG1aTi8MTEbJ5E=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=lIWBH9nT6f+W3LZE5/og45vUVwp/jDmTwVX6DroJ2iE+SMMSoHBWZgU6I1ULYzdE9Va0ZtpKcQRnxvNxXaYeIaQFnOljk2Je+HJR+cIETT8nVySIPviR0fCH3DJuHKS6nntoX5mq0WtyuOfUDjCnhh8WX63ZpfNC27K1HSBfEEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=sUz2hAzT; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vnbkI7QqhHof8COZEVwEqUY1RoVpTXdFmiC6hgd168k=; b=sUz2hAzT0HUN4oDR+UCrODNJhS
	83EWW5VRnTE/V3hPLh/EMebbvQJX9RCdbWM0TPhmrgE0qFctodc0cp0omoJ/xwKfs4AhS+UQD6j6E
	yGP7uz5vDNtj+8VIYrpHzW6HlhH005+EeLblKUogr12QuEfqB9j3ZOI4kWdhiyeyteckA3H2npNmm
	tc5bqXznUBeHrioYPDBx2uGW184lP9caDurEWaNpU+MjDPeu/Vk+K0XEJbIksUxSQH6qEcS3QbkDA
	vMT/M/9bCJ48hHkBl+QX78rcMDzeBavkH7R8q7547FBYxr5VZTlyR+DzNSdKt6Oqu6kywQJk2c8RH
	Jr8BGh1A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34644 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w51Xj-0000000022Z-0WVR;
	Tue, 24 Mar 2026 13:11:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w51Xi-0000000DwVJ-1gnA;
	Tue, 24 Mar 2026 13:11:34 +0000
In-Reply-To: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
References: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 01/15] net: stmmac: qcom-ethqos: remove
 ethqos_configure()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w51Xi-0000000DwVJ-1gnA@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 24 Mar 2026 13:11:34 +0000
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99664-lists,linux-arm-msm=lfdr.de,kernel];
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
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 088DA30957B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ethqos_configure() does nothing more than indirect via
ethqos->configure_func, and is only called from ethqos_fix_mac_speed()
just below. Move the indirect call into ethqos_fix_mac_speed().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 3ccf20fdf52a..502f2b184a87 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -623,18 +623,12 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
 	ethqos_pcs_set_inband(priv, interface == PHY_INTERFACE_MODE_SGMII);
 }
 
-static void ethqos_configure(struct qcom_ethqos *ethqos,
-			     phy_interface_t interface, int speed)
-{
-	return ethqos->configure_func(ethqos, interface, speed);
-}
-
 static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
 				 int speed, unsigned int mode)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	ethqos_configure(ethqos, interface, speed);
+	ethqos->configure_func(ethqos, interface, speed);
 }
 
 static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
-- 
2.47.3


