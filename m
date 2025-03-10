Return-Path: <linux-arm-msm+bounces-50831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96459A593D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 13:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E10B1649C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 12:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE9C223702;
	Mon, 10 Mar 2025 12:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Z1RyWBPb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC99D226D1B;
	Mon, 10 Mar 2025 12:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608666; cv=none; b=H0u2ZOuaYadT0tCjD4cPZeDOZB4CpkvcvHdR/ijgj46+CD21dnWEDBp+t4ImldLoA/OwmOJjNkIlkZrqO37xJD3PQLxkWo5bHzWWTyEZD4bPr6cy1jtk07kg1qPur5Z45ef4q7epfrEZzjK8Jm2qNUFLx6ehiTGitPEmcoMVCAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608666; c=relaxed/simple;
	bh=hyyLoqO0SMJ1Wa1ptRrtKiZEp989RGGtnCxJ+SPMIdk=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=DlYonOkSjdRJvxKXMvwbTYkl0uBmwo9sDmL8Nfy5W27IXl7geI4XpvvkHwdpBlJN2GuXv5UuWynNNjcp8Llw32FZVixvANJw2APNDWWTwppSrxdRJVbL+Nhrvl1UZzNhe1d+bGuVmwYYy63jGFvIMwnbbM3lDrxe7l2V5w5mPHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Z1RyWBPb; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yzZe1gV6CHm+hAifr5i33tZFqQ6giFyv3lN1GIZuF9M=; b=Z1RyWBPbYpVSmho+mXWzi6iJaA
	CNh2NaTUMZvLuxbbSeJ29xlqBLX+n7gG/ImOrqRlvLV++R1fVlGx9Yo7EQkHQkPCSUA5aqrTWF4KO
	ai89LWlgj4o5LQSChjxU1IcW2MhZJnwKWN/lqbPLYWqpqujiOJYoA+6RuBchlRAMpIgtt1txSOTTE
	Qe/wXeft3MB3TwbG8Uen5/45dF6QG8zd8SGeWdRGl0HiCGt+NgPDJRlKGSQZYemE9XgD+XknA/0wi
	lh7wD5mBDAhEHQUZK5qXQG0qXjTJhn5DRbW182NfBlEJjzME89u8c2uCSnXQ+0LYmGcFOi4K/gjnq
	3cXF+AcA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40488 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1trby6-0002YW-0z;
	Mon, 10 Mar 2025 12:10:50 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1trbxk-005qYA-Up; Mon, 10 Mar 2025 12:10:28 +0000
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
Subject: [PATCH net-next 3/9] net: stmmac: remove of_get_phy_mode()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1trbxk-005qYA-Up@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 10 Mar 2025 12:10:28 +0000

devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
which is stored in plat_dat->phy_interface. Therefore, we don't need to
get it in platform code.

Rearrange the initialisation order so we can pass plat_dat into
anarion_config_dt(), thereby providing plat_dat->phy_interface as
necessary there.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-anarion.c    | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
index ef99ef3f1ab4..fe47a5c337f6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
@@ -59,7 +59,9 @@ static void anarion_gmac_exit(struct platform_device *pdev, void *priv)
 	gmac_write_reg(gmac, GMAC_RESET_CONTROL_REG, 1);
 }
 
-static struct anarion_gmac *anarion_config_dt(struct platform_device *pdev)
+static struct anarion_gmac *
+anarion_config_dt(struct platform_device *pdev,
+		  struct plat_stmmacenet_data *plat_dat)
 {
 	struct anarion_gmac *gmac;
 	phy_interface_t phy_mode;
@@ -79,11 +81,7 @@ static struct anarion_gmac *anarion_config_dt(struct platform_device *pdev)
 
 	gmac->ctl_block = ctl_block;
 
-	err = of_get_phy_mode(pdev->dev.of_node, &phy_mode);
-	if (err)
-		return ERR_PTR(err);
-
-	switch (phy_mode) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RGMII:
 		fallthrough;
 	case PHY_INTERFACE_MODE_RGMII_ID:
@@ -111,14 +109,14 @@ static int anarion_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	gmac = anarion_config_dt(pdev);
-	if (IS_ERR(gmac))
-		return PTR_ERR(gmac);
-
 	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
+	gmac = anarion_config_dt(pdev, plat_dat);
+	if (IS_ERR(gmac))
+		return PTR_ERR(gmac);
+
 	plat_dat->init = anarion_gmac_init;
 	plat_dat->exit = anarion_gmac_exit;
 	anarion_gmac_init(pdev, gmac);
-- 
2.30.2


