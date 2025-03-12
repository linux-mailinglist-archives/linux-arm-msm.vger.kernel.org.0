Return-Path: <linux-arm-msm+bounces-51119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B78CCA5D941
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 10:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53AC33B9E02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 09:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0E023A99A;
	Wed, 12 Mar 2025 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Xeh2oXMu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE19A2222DB;
	Wed, 12 Mar 2025 09:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741771304; cv=none; b=Qb2rPau5FP7DTd8uQt9Kvqd8f9sS6Qka6rBcaIRk/WMYSOY6xSo9ruMgTwcwG4TFjW6aAJvb1QSxtnmOhazcRTW5LCBHMabN+h59xwKj1iYJEKKRYz2NuVeFWlbPPqXZgGf60JRhxtfnMb5f2gDEHsBYDDZEiPlxGqFs/krOLSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741771304; c=relaxed/simple;
	bh=GpDeYi6/7WXoZ4r4JWpn51k1Gimtbv+y0+TqlZSyQX8=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=U+5hU4HqsDHWW90Q5DTrXSzT8pbxDi3mPP6LvVCZ7NHFd3eJKRXGXXvwr4X+yKjh4GuMD5pxXazm2h5sBEDC88l1c3BrT2TfkecQ1tSpgE+LkyJpOALYrj4ibWW5xC3k2lK46+2xD121K1ezX9PST9yOsiF86RgHR3btejR2GiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Xeh2oXMu; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ljd/4gl9s8BMLZwtY7uCqzAwcB0VrpKpPpDg1DCzLNw=; b=Xeh2oXMuFYJw2GTzizDBHsyuGM
	wZsjxAV4cZVsFm/b+P+vrTEtu4EubFq5O+VecsRs/8AoAumd1gcJeuzq2cX9H0B60XDhXDxxI/Qsm
	mFjEZkDQMWfez7QEzDsXs8vQaKT+zoEtNgetqnoLxfpLYGJUya4PTCcaZY6o+ILGrNvql97WHz5Jc
	tt0y4Z5MTpJhg3K/YIREUFB3hpYV5QCWL/mWSvCyUR3C4ubfuiu1LQr+Mcrb4amNheVKAk2L4Uz+e
	3sSusb6yW+6h04nlxTJ8iXVXvuZsYYBAlLhm4JxELa4nLh7hVW+Ph5d2dGlcENc86lv20xJP3/Xbk
	ZCG6+jBg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53872 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tsIHA-0005D1-37;
	Wed, 12 Mar 2025 09:21:21 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tsIGn-005v02-7G; Wed, 12 Mar 2025 09:20:57 +0000
In-Reply-To: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
References: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 7/9] net: stmmac: sti: remove of_get_phy_mode()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tsIGn-005v02-7G@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 12 Mar 2025 09:20:57 +0000

devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
which is stored in plat_dat->phy_interface. Therefore, we don't need to
get it in platform code.

Pass plat_dat into sti_dwmac_parse_data(), and set dwmac->interface
from plat_dat->phy_interface.

Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>
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


