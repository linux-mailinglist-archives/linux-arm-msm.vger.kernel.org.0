Return-Path: <linux-arm-msm+bounces-50832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE67A593DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 13:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95B3916E37D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 12:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14656228CB5;
	Mon, 10 Mar 2025 12:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="es/Rpd3P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A76B227EBD;
	Mon, 10 Mar 2025 12:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608674; cv=none; b=TD5OaOJuj1h+lVrn95KmUSq1iOQMR0vMFDJmrZ0gaQvADcupgtPCcDjHjvZwZoDlolVEA9aXaWalT5FdX8aHZXg7FojQ3PLiBd/hpkqYXM+/l5pPC4cqZmwHFezqnWgQ00IJVj1UFZ5C4XvGh4nHIpqQZJM4m+DM93hneV3hpgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608674; c=relaxed/simple;
	bh=/ThFo6M0Cq6dbDtkNjbdcmbDSCng5KkP//1TDiI97zk=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=tW21tWuiqY4MiZJlKjvR+F6HWubTy6/HaPIUVy5uIHH6gUOBEXBYDqnGxdQ9xi06VDzOIc5KQcU/Hc9aMknXiXcJeft+g7qCxeldZmbvCa1VrIHiU3A+DN1fj1e1iy6AXxYNWcItDrZSplIaZQayr/BGXSU0VT0zM61yUHW39eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=es/Rpd3P; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aWTmdggI1wrqKzQN44F171C0Oq8MU3PXDbUpFboH5dg=; b=es/Rpd3PwEPJxZRKiCIjjDwd9k
	ehkjloYok5y0PwNlCriZSGPf90QjawDiKF/SWpXsE42pv5JUCh1XXAp2Msn5v+SHGER1Q75vIEd4u
	dTwo/dhf1bhq0lwMJAZhEfaJsYvH9+jVBuOvEhNA433CkL/MwvGdftcvJtqeiiJ0ZK08OaNYXACMc
	+/dqDn6FwCXr18QuphazWCwzR+QihwgTjRE9frL0UQSXYk5XQQ2NKJYSprvFr3kp7hfL1qBWrzvWv
	8zzbipbZD2mD2EC1gZ5YFTKpIrAsKS+ozt9izFaiCN/9joCwkckAhMthVxcCBMp7FkiBzjDCitGEg
	eBo7RCOw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58186 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1trbyB-0002Yr-2g;
	Mon, 10 Mar 2025 12:10:55 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1trbxq-005qYG-2E; Mon, 10 Mar 2025 12:10:34 +0000
In-Reply-To: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
References: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 4/9] net: stmmac: ipq806x: remove of_get_phy_mode()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1trbxq-005qYG-2E@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 10 Mar 2025 12:10:34 +0000

devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
which is stored in plat_dat->phy_interface. Therefore, we don't need to
get it in platform code.

Pass plat_dat into ipq806x_gmac_of_parse(), and set gmac->phy_mode from
plat_dat->phy_interface.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
index 0a9c137cc4e6..ca4035cbb55b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
@@ -211,16 +211,12 @@ static int ipq806x_gmac_set_speed(struct ipq806x_gmac *gmac, int speed)
 	return 0;
 }
 
-static int ipq806x_gmac_of_parse(struct ipq806x_gmac *gmac)
+static int ipq806x_gmac_of_parse(struct ipq806x_gmac *gmac,
+				 struct plat_stmmacenet_data *plat_dat)
 {
 	struct device *dev = &gmac->pdev->dev;
-	int ret;
 
-	ret = of_get_phy_mode(dev->of_node, &gmac->phy_mode);
-	if (ret) {
-		dev_err(dev, "missing phy mode property\n");
-		return -EINVAL;
-	}
+	gmac->phy_mode = plat_dat->phy_interface;
 
 	if (of_property_read_u32(dev->of_node, "qcom,id", &gmac->id) < 0) {
 		dev_err(dev, "missing qcom id property\n");
@@ -398,7 +394,7 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 
 	gmac->pdev = pdev;
 
-	err = ipq806x_gmac_of_parse(gmac);
+	err = ipq806x_gmac_of_parse(gmac, plat_dat);
 	if (err) {
 		dev_err(dev, "device tree parsing error\n");
 		return err;
-- 
2.30.2


