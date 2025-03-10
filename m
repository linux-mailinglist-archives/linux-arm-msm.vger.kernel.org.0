Return-Path: <linux-arm-msm+bounces-50843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2678A59677
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 14:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 582F03A6E84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 13:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB332288F7;
	Mon, 10 Mar 2025 13:38:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5BA227BB9;
	Mon, 10 Mar 2025 13:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741613908; cv=none; b=bLcCKiclVMNqNGpcWXeeJlp/M/3hGoVw4GaUxBoWDL31aG0lNlCEHnCLwwo/8MUjyJBKAXbSdIILX0CQ3albsTz0Kcm+DkPKAdH9GHB/MIvta/yASOopCgfcNgIRQIvYxC5gawBg7loNRAHzuq981/mc6280HoC8BnyFBt4ROzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741613908; c=relaxed/simple;
	bh=0Ax/+iGwbiSSSQQ+9gL+4cfvAsARamCLqmPyEjZFHOo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sR2rHTxZ7UJSx3aMhlFDiTUoixyRjVlzGXSl/aq/ag4uetITj1XvPa8AlLb4MQhEu0rNJvAP5Z72iZ70w1MsPaT4S66h/3BuIROz9ta5XqjrUlNapoAE4VVuyYfkhamCLq/iXCb0llJr0fEGhiDhVjyBkMSyoyVbaO62lcFst1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6784153B;
	Mon, 10 Mar 2025 06:38:36 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E9E63F673;
	Mon, 10 Mar 2025 06:38:22 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:38:19 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wens@csie.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>, Vinod Koul
 <vkoul@kernel.org>
Subject: Re: [PATCH net-next 8/9] net: stmmac: sun8i: remove
 of_get_phy_mode()
Message-ID: <20250310133819.7c2204a6@donnerap.manchester.arm.com>
In-Reply-To: <E1trbyA-005qYf-Hb@rmk-PC.armlinux.org.uk>
References: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
	<E1trbyA-005qYf-Hb@rmk-PC.armlinux.org.uk>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Mar 2025 12:10:54 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

Hi,

> devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
> which is stored in plat_dat->phy_interface. Therefore, we don't need to
> get it in platform code.
> 
> sun8i was using of_get_phy_mode() to set plat_dat->mac_interface, which
> defaults to plat_dat->phy_interface when the mac-mode DT property is
> not present. As nothing in arch/*/boot/dts sets the mac-mode property,
> it is highly likely that these two will be identical, and thus there
> is no need for this glue driver to set plat_dat->mac_interface.

Well, the current sun8i code wouldn't help anyway, because the driver
would set mac_interface to the value of "phy-mode", not "mac-mode", which
is strictly speaking a bug.
But in any case this is indeed redundant, so:

> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 4b7b2582a120..85723a78793a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -1155,11 +1155,10 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  	struct stmmac_resources stmmac_res;
>  	struct sunxi_priv_data *gmac;
>  	struct device *dev = &pdev->dev;
> -	phy_interface_t interface;
> -	int ret;
>  	struct stmmac_priv *priv;
>  	struct net_device *ndev;
>  	struct regmap *regmap;
> +	int ret;
>  
>  	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
>  	if (ret)
> @@ -1219,10 +1218,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = of_get_phy_mode(dev->of_node, &interface);
> -	if (ret)
> -		return -EINVAL;
> -
>  	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat))
>  		return PTR_ERR(plat_dat);
> @@ -1230,7 +1225,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  	/* platform data specifying hardware features and callbacks.
>  	 * hardware features were copied from Allwinner drivers.
>  	 */
> -	plat_dat->mac_interface = interface;
>  	plat_dat->rx_coe = STMMAC_RX_COE_TYPE2;
>  	plat_dat->tx_coe = 1;
>  	plat_dat->flags |= STMMAC_FLAG_HAS_SUN8I;


