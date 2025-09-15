Return-Path: <linux-arm-msm+bounces-73588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ECFB57D64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 15:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B04211709EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25350315D56;
	Mon, 15 Sep 2025 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="vJce4lqN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7690C30FC17;
	Mon, 15 Sep 2025 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757943132; cv=none; b=jEOiBlL6O0QW2EqGRGXoTg47L6g04UDw0ggVRyjDKCrIS+GQh5Zx3XBcq4Vn0eaFIFZN0elN/vADw2h4VARHyUG9wpLcG8pXn7V+StBNRp6oMUnUdd7WJhxX/YHxzs2ghWk8Q2rIPH5alqJEWq/1lCFhH420yQozHMplco+Faew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757943132; c=relaxed/simple;
	bh=9dFDPFmtZ/9LGuBu1fnXanu7z5/nsogk7phMx3vrkpY=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=XAli28iuCdLx8vuyXnkLyT0nIz4Z6v/9cbAK1Iy70qp6j3N9mQNXd8x3nPZJb6r50mn7aBWmNnnnUqqVlyXLek6tGePY5APGM8L6OGOJcChsgUV9inVa9oOYGAuU+kewEvL5c6cjDqV63MhBLHueLzN535ZoSuJxOvFVP+OezQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=vJce4lqN; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XrZQjeXWFXcPjV0BXPB31uzCMYyTCFRzpQL/v8AKa/4=; b=vJce4lqNlbNGDlzJMlEdmG7o9c
	piqVfR1tWNSmeH6aHDzmrsOGfQ/Mw7bdn60/eqjchp5ccQUiNVJyZ6hgfCesAIVtOgYZBskwNIBNK
	CnIzqnDptX83/8snbTD1sHmBn7Dp35Cp3q4OlDhqkgjd/1KiGLHH/Mu9wJmdVWAz/iNRmF2Cf9FBE
	AOwsexP7nCntk3yFkMWb0Ups3sg8/SrrjRhk0OTTdjPOGHXnc8iHQLZcwj7cop92Tf1AJ/QkTrw2A
	IlBGfjSdHklHHAnNR78qZL+0O+szd2gX3Ii2/DKvlwA3atIxcufWKcMLHRr2PxLO9NupDtBqCZRFX
	jG3QIv9w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56256 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uy9JO-000000000N5-2EQi;
	Mon, 15 Sep 2025 14:32:06 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uy9JN-00000005ji7-3TOB;
	Mon, 15 Sep 2025 14:32:05 +0100
In-Reply-To: <aMgRwdtmDPNqbx4n@shell.armlinux.org.uk>
References: <aMgRwdtmDPNqbx4n@shell.armlinux.org.uk>
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
Message-Id: <E1uy9JN-00000005ji7-3TOB@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 15 Sep 2025 14:32:05 +0100

Use sfp_get_module_caps() to get SFP module's capabilities.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 1988b7d2089a..0c2b7538e492 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -3747,17 +3747,18 @@ static int phylink_sfp_config_optical(struct phylink *pl)
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


