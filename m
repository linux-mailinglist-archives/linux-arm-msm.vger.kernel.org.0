Return-Path: <linux-arm-msm+bounces-50833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D5CA593F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 13:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 673431891799
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 12:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F1122A1CA;
	Mon, 10 Mar 2025 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="A4QTFwP9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00597229B01;
	Mon, 10 Mar 2025 12:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608681; cv=none; b=g6YBdQQi0o476Ju3Z2X+b9rgwN7ZIp+2O/uJm5fxm/yDpX1bd42X4ggGeLxxufK+TK5g65bXoYeWxD7uN+YcOwEVY+IladAQqGvqR3z081MFMCTCajgfNOkNqX8twh9Uu+dpMWh4AVhk0wPa2LACAnDXjpBpPlQbtbb3O5t7Z34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608681; c=relaxed/simple;
	bh=sifMuQ53xcvkWDPW6065dut4WEu8cZqWd0ZhTKTh6Dg=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=f4/mgQ9ao0if3g0pHg1WvKbpKIw8oIeN8T+tWaQW1g8jAtWHCObGD9wQFx5Y8jXh/T/D/0g9ilQBIUHfGy0V0wO+QgmdyK/SpaOdppIxtxQgMudM0Pi31bKWdqgQ+qK1m6g9wyXgbcHQnHdIDHv3k2V1cFbofHAOJXo5JDvdutY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=A4QTFwP9; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ARCXnqS38tZ6SrvZyY4r4LsmND+qBD6vwra/0tog6Ok=; b=A4QTFwP92MvvwiC1CwF600PCv2
	pKuDyEuS43X1T9u2nX1zkmEPe/IAk1zy/FiBCClxg/q5F+J5+cZSr3w49TGekynnqUZ4kk6QRhQtQ
	EuZ/5HAwyvRRpGXtzWLgQ9ZTaZnvpKHlS4Rs3CkKAKB+OEIO4sIWOL/2QZEOHwtdcdybCzxyrC4Q2
	eaeVYKeOgU1oimksoG2uoHyzniS+296SZSNylUWGQg9K/DVkMxcirnghCdqaH2YH6UzUs2e8rPwXF
	ZN0ehYTDxAKEVWdYhHjRF/Yu+6Igix0GaqFM8QJchXFjfTanR7clqfryFDAgGwByM7jhHgEY98nUS
	N5Rn86Gg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58196 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1trbyG-0002ZB-2u;
	Mon, 10 Mar 2025 12:11:01 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1trbxv-005qYM-5m; Mon, 10 Mar 2025 12:10:39 +0000
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
Subject: [PATCH net-next 5/9] net: stmmac: meson8b: remove of_get_phy_mode()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1trbxv-005qYM-5m@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 10 Mar 2025 12:10:39 +0000

devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
which is stored in plat_dat->phy_interface. Therefore, we don't need to
get it in platform code.

Set dwmac->phy_mode from plat_dat->phy_interface.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 9c2d62d133ad..a50782994b97 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -417,11 +417,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 		return PTR_ERR(dwmac->regs);
 
 	dwmac->dev = &pdev->dev;
-	ret = of_get_phy_mode(pdev->dev.of_node, &dwmac->phy_mode);
-	if (ret) {
-		dev_err(&pdev->dev, "missing phy-mode property\n");
-		return ret;
-	}
+	dwmac->phy_mode = plat_dat->phy_interface;
 
 	/* use 2ns as fallback since this value was previously hardcoded */
 	if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
-- 
2.30.2


