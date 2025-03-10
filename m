Return-Path: <linux-arm-msm+bounces-50836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F40A593F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 13:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48B8C1886E76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 12:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712B222A4E8;
	Mon, 10 Mar 2025 12:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="hL7aGwgR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD78C22A7FF;
	Mon, 10 Mar 2025 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608696; cv=none; b=f0QtsuTb0spQKjNW1OD4yvnY9nN9JEE97b12/FqmRs7kfR6Lz5DbkfYMz0tmzlJBisr8tObo5XTuhvo9RkeaYHDOQSYpeace8LJj4X7oEl0GCZJVYYiAWluD4luAd30CXzQrKEEpwQgIm9XDfEYCEtER6BglRRZkwi3w4wMihs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608696; c=relaxed/simple;
	bh=16t/2PVO4nEY7S+aWnqTfX6323Xu/3ZuNxr+/XAWJ7k=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=aQxN8zjZ5U76q5UjUWm2I4oS+YDeRvnLfHejme4aFpY+5pNvLjt+nm5wlzqLHNhN6Lt0dutIzs9J9V7KQbsIOcLiaIMzXhhSqXVqfG503VPV42kU9TR7QVBsfOGHsz6nCSXq2u3V2Mie9k8CVtzFhnM2DkGMfdLS931bvSZjqVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=hL7aGwgR; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7WUB85UntcvKc4rtS3U46DOMfeTCvt9STpMBA8SjPKo=; b=hL7aGwgRzwa+oGMgpiItpfadBY
	KcqcqTiCdXW4+KmLgKheS8tMa0vgjmg6OTul6zhfz63amhPcaSglqdDCpv9hgtSbEJmU901fSpGCC
	xjZRLVmGE+agKtMu8zVhZMgP9TeBd2+h6cyeLdFzr57v5uUfO4IbNKnGBD6cAX5KG2JoQAigfEHaD
	PXRatEhEZZwHUly7HRgO+EExJS2IL/KOfh5eGz73s8mpfWaJDt1jye7wVotTcpy1dwNVDfnhqh3yx
	gQO7w4mY6fbE1V9zKzLFgV2qVhXEX3vP0lPeHG76wDLGiW2xqsKNNVrU3jC6OdSmdSzNnhfNAkty9
	WIYKF9Qg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54294 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1trbyX-0002aA-2J;
	Mon, 10 Mar 2025 12:11:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1trbyA-005qYf-Hb; Mon, 10 Mar 2025 12:10:54 +0000
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
Subject: [PATCH net-next 8/9] net: stmmac: sun8i: remove of_get_phy_mode()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1trbyA-005qYf-Hb@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 10 Mar 2025 12:10:54 +0000

devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
which is stored in plat_dat->phy_interface. Therefore, we don't need to
get it in platform code.

sun8i was using of_get_phy_mode() to set plat_dat->mac_interface, which
defaults to plat_dat->phy_interface when the mac-mode DT property is
not present. As nothing in arch/*/boot/dts sets the mac-mode property,
it is highly likely that these two will be identical, and thus there
is no need for this glue driver to set plat_dat->mac_interface.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 4b7b2582a120..85723a78793a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1155,11 +1155,10 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	struct stmmac_resources stmmac_res;
 	struct sunxi_priv_data *gmac;
 	struct device *dev = &pdev->dev;
-	phy_interface_t interface;
-	int ret;
 	struct stmmac_priv *priv;
 	struct net_device *ndev;
 	struct regmap *regmap;
+	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
 	if (ret)
@@ -1219,10 +1218,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = of_get_phy_mode(dev->of_node, &interface);
-	if (ret)
-		return -EINVAL;
-
 	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
@@ -1230,7 +1225,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	/* platform data specifying hardware features and callbacks.
 	 * hardware features were copied from Allwinner drivers.
 	 */
-	plat_dat->mac_interface = interface;
 	plat_dat->rx_coe = STMMAC_RX_COE_TYPE2;
 	plat_dat->tx_coe = 1;
 	plat_dat->flags |= STMMAC_FLAG_HAS_SUN8I;
-- 
2.30.2


