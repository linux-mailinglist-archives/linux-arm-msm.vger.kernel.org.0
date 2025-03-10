Return-Path: <linux-arm-msm+bounces-50835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BA5A593E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 13:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 687A616E8D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 12:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CD522A4F3;
	Mon, 10 Mar 2025 12:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="cfsfbkHn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0727229B01;
	Mon, 10 Mar 2025 12:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608693; cv=none; b=SyC5GfRwp3N6qsUxPu8RfAAM2D3UGgpZR5op6UzJ36nafbK4eIfIcZGEKZpJ5QNH4sN59Od/cMJxAE9Lwl9OAnN0BKjMVcJaAURxs+4JKYmI+9PGOoikewYsZOl/nGdgcteIEqBPuaS4m+9fca6pJOYKkL8boH2IPGs5St5VQr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608693; c=relaxed/simple;
	bh=HBQQTMuVmSJuaXVsBzESg5OlPxIwuUvoPHTzXg87S7E=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=ihibEJ/wwILG3RXVL/rAorDENbSf81igu0J7kfA8Ly0GKv3or3siXt3UjPM0pj5NzKmLCCukHj3ycKbBhCGFWxZxmlEcIOUZRfYwhHtEuA29nW9s9eNTgNJoznQqPmSdFmtn/oigVPO96dCVb5uhZ+SYKoEUgRAC1DR6iw6U7P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=cfsfbkHn; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mt2YgBWZEUT0iG0aW0svGoQUDQefZBeHbVh7XZ/Ckxo=; b=cfsfbkHnMPo81oyupsD05mhfb0
	i16j/27Y/Yb4O/djV8MbdjiVMADgjxVT4cCbQGEwemaKPGpBnfHD2pxYjOLrxSCoNhET+1BqM02ng
	ikDvTiTI5FBSYLPSFnwlxEk9VHrHQPWGsafXOBrMYeW1MPaFez2CyPIKU4Nsd3jmhWLe7ut7XO77o
	dn134AYTko5CGT5ME6WW/YR/quKXuzZ/BcD/aPHDhtnEFLgwTtyU5opaPuOPKVWFS2ECIw+SeaUWo
	znwuWwELLyLyuaE77Jcs0nDceavWVcxkB9Iqu26KnSeaMA/86EHFJAnkyYzOTKSPRLLqB++mcctcM
	T3sTN3jA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46328 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1trbyS-0002Zq-25;
	Mon, 10 Mar 2025 12:11:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1trby5-005qYY-Dp; Mon, 10 Mar 2025 12:10:49 +0000
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
Subject: [PATCH net-next 7/9] net: stmmac: sti: remove of_get_phy_mode()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1trby5-005qYY-Dp@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 10 Mar 2025 12:10:49 +0000

devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
which is stored in plat_dat->phy_interface. Therefore, we don't need to
get it in platform code.

Pass plat_dat into sti_dwmac_parse_data(), and set dwmac->interface
from plat_dat->phy_interface.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index 13b9c2a51fce..be57c6c12c1c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -185,7 +185,8 @@ static int sti_dwmac_set_mode(struct sti_dwmac *dwmac)
 }
 
 static int sti_dwmac_parse_data(struct sti_dwmac *dwmac,
-				struct platform_device *pdev)
+				struct platform_device *pdev,
+				struct plat_stmmacenet_data *plat_dat)
 {
 	struct resource *res;
 	struct device *dev = &pdev->dev;
@@ -204,12 +205,7 @@ static int sti_dwmac_parse_data(struct sti_dwmac *dwmac,
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	err = of_get_phy_mode(np, &dwmac->interface);
-	if (err && err != -ENODEV) {
-		dev_err(dev, "Can't get phy-mode\n");
-		return err;
-	}
-
+	dwmac->interface = plat_dat->phy_interface;
 	dwmac->regmap = regmap;
 	dwmac->gmac_en = of_property_read_bool(np, "st,gmac_en");
 	dwmac->ext_phyclk = of_property_read_bool(np, "st,ext-phyclk");
@@ -268,7 +264,7 @@ static int sti_dwmac_probe(struct platform_device *pdev)
 	if (!dwmac)
 		return -ENOMEM;
 
-	ret = sti_dwmac_parse_data(dwmac, pdev);
+	ret = sti_dwmac_parse_data(dwmac, pdev, plat_dat);
 	if (ret) {
 		dev_err(&pdev->dev, "Unable to parse OF data\n");
 		return ret;
-- 
2.30.2


