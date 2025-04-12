Return-Path: <linux-arm-msm+bounces-54106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D833A86D87
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 16:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87EAB17AE20
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 14:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6511EA7CA;
	Sat, 12 Apr 2025 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="W7pGDeRs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAC31E835C;
	Sat, 12 Apr 2025 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744467048; cv=none; b=d1OkeyATil23lXj5ejzqjZesI2qPRG/8zFWmL3GAqWGLjygeN4sDT5/C3XbVJmZJr694UfSDLO/bu5h4mpskZNgE/oHBhdSj6/BAl8Eil42yga29RFrlNxg9Nu6y/1qDoWFAlwdfuOAp8WIJ+wit+dJCm+ukVBX8SNoWLxS30os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744467048; c=relaxed/simple;
	bh=Zuh6rjYqHv/udRISGAo+nGTrjAsjQpYiiu+wvf1BIA4=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=SZrc0sM9GihFLZ1d+q3uHhI5sZ6TgjymlLdioMZGGesoKsDMlkzlR3ESFWzhe/rWZ+LVcuhNbq5sBlfJ8s8P4OoXztQdDXX1O4olAliCnN7Bh+Jy2UOnBEj25xafQmSTU+iVf1IvucNyoxdjYLBAvppAGe+XEs5yNzvHNwLR+A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=W7pGDeRs; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AjpPx4diUTD55faBtP4P4XYjVA7r8a4pIDQt1k+4gFo=; b=W7pGDeRsVYz/bLC54KhffjdXao
	qUE9VUc2SW30decX6bDS+huRGHympzQaT3nviRrKPfsk44bET76kjQxbG8G7gDrG+qBqIRmZfn5Gx
	0302N+RzkVlzUSraDNkrL1JaxkVfjSNT+c6KlnB65appcts3xDojgF4RuTRskmX47OWKZS0FBp9bf
	amIXzlSnEqCdxyzOO3gUIQ8Pf75uxLoLrKq3pZDKYgmAxHdQFtOUHCoYqUIq46nD8rK7Ot9Iyzk5b
	1t7/NSKRES7BJfIoh8y7kyi/n43T3/iJX0myCxCyiipkbeDsuze3Vy69/ye+hOYuWtpvyEQoVyd+3
	L2vw1wHQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43894 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u3bZB-0004az-2M;
	Sat, 12 Apr 2025 15:10:41 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u3bYa-000EcW-H1; Sat, 12 Apr 2025 15:10:04 +0100
In-Reply-To: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
References: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
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
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 4/4] net: stmmac: qcom-ethqos: remove
 speed_mode_2500() method
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u3bYa-000EcW-H1@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Sat, 12 Apr 2025 15:10:04 +0100

qcom-ethqos doesn't need to implement the speed_mode_2500() method as
it is only setting priv->plat->phy_interface to 2500BASE-X, which is
already a pre-condition for assigning speed_mode_2500 in
qcom_ethqos_probe(). So, qcom_ethqos_speed_mode_2500() has no effect.
Remove it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e8d4925be21c..e30bdf72331a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -672,13 +672,6 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 	return val;
 }
 
-static void qcom_ethqos_speed_mode_2500(struct net_device *ndev, void *data)
-{
-	struct stmmac_priv *priv = netdev_priv(ndev);
-
-	priv->plat->phy_interface = PHY_INTERFACE_MODE_2500BASEX;
-}
-
 static int ethqos_configure(struct qcom_ethqos *ethqos, int speed)
 {
 	return ethqos->configure_func(ethqos, speed);
@@ -800,8 +793,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		ethqos->configure_func = ethqos_configure_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_2500BASEX:
-		plat_dat->speed_mode_2500 = qcom_ethqos_speed_mode_2500;
-		fallthrough;
 	case PHY_INTERFACE_MODE_SGMII:
 		ethqos->configure_func = ethqos_configure_sgmii;
 		break;
-- 
2.30.2


