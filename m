Return-Path: <linux-arm-msm+bounces-73811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB4FB5A42D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 23:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 806953B3C00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 21:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7552F9DBB;
	Tue, 16 Sep 2025 21:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="YFFy8o15"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7995F285C88;
	Tue, 16 Sep 2025 21:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758059223; cv=none; b=stQ9BpYxDvBotHJI3zu7k4X8LVpbbZbsGq1NboRwBj0+XPznSHkF+u6c5te+MFiv9FYDXsc5GMFHQvZHWS8oNWuNQ4gqxDP7kUZkPnujpmbwmgD/qXh9F1zPjaHo52n2kYfDHH0Cj/K8Sfci5/Yqpzfu4U1V/Qt5fDyj+JF5Wqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758059223; c=relaxed/simple;
	bh=N/jZ386+GpqSkA9IYz+JAUdQFRFoYG03bPULdFGwi/0=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=DrTApvkl/GjGOF4pvOMSHQa+VgZvmTGAD6ngOBiZbrF60EO5P1e9b4gzIFAvsX+3awVU5sw6KHWIar6vcQXhjgyyS8yT0mXlHj+KtykLj8gXBWO7Gnwh9gkUKIqFl23Im0KaSVUmEturhj1WLEC9s57vcBuI/gTsh4yJ/Xt9pwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=YFFy8o15; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zlqNRYOof33no4pPk+a240zjTMOoqot7KzVUkbs+y20=; b=YFFy8o15Xu+5WLqpxgGC8hf6Xo
	iI9HCJ3cJLthKpJEOMtZfu2GMvAPFL95hhF36XFgr/5y/GyZY1Ep6jcvtg1Rzf742nAZegafj6/eR
	3foBT0RavoXR04YTBCjqUwD9NtnH8vWqDJ+9uWEiaP0RWjZv5Ow3FnqwR5PPOoylzu69O05FZnwAL
	LsA8F2S2guOof+zEmbXGuptqsgek9aUrONtYPNYEpnOMSrXw7DM3H11jzA8GYNzj/Wp0vTleMbdJ/
	/0stYh3zFUM8iJvB4y4dNE94qjavmZNk3gq59Loi91WE/Q35O/zwvp/S+HL+U+pc7f7Lmw4xh9qlq
	QCMBGAkg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44856 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uydVp-000000006Pr-3Npj;
	Tue, 16 Sep 2025 22:46:57 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uydVp-000000061WW-08YM;
	Tue, 16 Sep 2025 22:46:57 +0100
In-Reply-To: <aMnaoPjIuzEAsESZ@shell.armlinux.org.uk>
References: <aMnaoPjIuzEAsESZ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	"Marek Beh__n" <kabel@kernel.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 5/7] net: phylink: use sfp_get_module_caps()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uydVp-000000061WW-08YM@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 16 Sep 2025 22:46:57 +0100

Use sfp_get_module_caps() to get SFP module's capabilities.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 1b06805f1bd7..9d7799ea1c17 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -3750,17 +3750,18 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 static int phylink_sfp_module_insert(void *upstream,
 				     const struct sfp_eeprom_id *id)
 {
+	const struct sfp_module_caps *caps;
 	struct phylink *pl = upstream;
 
 	ASSERT_RTNL();
 
-	linkmode_zero(pl->sfp_support);
-	phy_interface_zero(pl->sfp_interfaces);
-	sfp_parse_support(pl->sfp_bus, id, pl->sfp_support, pl->sfp_interfaces);
-	pl->sfp_port = sfp_parse_port(pl->sfp_bus, id, pl->sfp_support);
+	caps = sfp_get_module_caps(pl->sfp_bus);
+	phy_interface_copy(pl->sfp_interfaces, caps->interfaces);
+	linkmode_copy(pl->sfp_support, caps->link_modes);
+	pl->sfp_may_have_phy = caps->may_have_phy;
+	pl->sfp_port = caps->port;
 
 	/* If this module may have a PHY connecting later, defer until later */
-	pl->sfp_may_have_phy = sfp_may_have_phy(pl->sfp_bus, id);
 	if (pl->sfp_may_have_phy)
 		return 0;
 
-- 
2.47.3


