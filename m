Return-Path: <linux-arm-msm+bounces-39972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2439E0EAE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 23:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3BCC286F14
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 22:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5479A1E0E0B;
	Mon,  2 Dec 2024 22:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="onAkKEu0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882151E0DF4;
	Mon,  2 Dec 2024 22:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733177276; cv=none; b=kxgB58v6Whru7l7FqaUihZRRnCaJNsv+vx+nPK03wfvYSsMwrcWNvvrDFxUYPkcuuE7Oo5hmMPnB0xUyeI0jq85zhx9gsZSoqDmuDMB1i7JImSeXNKnwevydseTOGHlYIwUwv4j+sbTd8UQ/oMqmGw2GY6hP6QK38Wb9TyqCMjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733177276; c=relaxed/simple;
	bh=UpTDOAh2SM9Av2dj4fbrvCE+NCvXwCG9JOnqnSIZY0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ML0iac8/XjBB/itK18eJk6e/YZjhPvL2b57Ml6yJn/h9KESfdHLeVheBJp6cNUv0GQpKaZZgIqRc3RapE8sYoYMAPM2um+fmo9Yh2S0l4+Rpk1DYc00Y/NzpCS6sGvWOApHcNrXUIVa/KPKIrN44vb1qEnSAB2D0ExiGaiweU8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=onAkKEu0; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tz4mFzbX9P9yZ/D0ZDZ+CHiKfmuXSyJYiag6bxKZjO8=; b=onAkKEu03knw+yi7mGzMg38F/a
	eahRL0lxTZx3whiM4B1MeXRexDYWzMYK9BxBpAjL218lJRkT3cNpjCWYiRjWd334Ah2wQ7MujmY3q
	bq95CThA6JvVB7z3DvP8QhRGb4t27jySO6SfLxGJKdmHLW3jI/DzpTbyhBj8UJqb4JYqp07TzxAEP
	pZ4pxgISjskPougD7Wssqqk44PW/wrW9sEiZGfW1XgZ6DYMZv5O73usxojtbU7Z3m1hBq0o0g6+RC
	ySXEJFbmfd0cgDr6aJ1mRJb0TpQVA9JDZSZsBO8fIVEc/ASQQ6vsXF6uHfFzJVnTFINuN8FiyiaYs
	qrJYl1Tg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39114)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tIEZn-0000ru-0X;
	Mon, 02 Dec 2024 22:07:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tIEZk-0003v9-2I;
	Mon, 02 Dec 2024 22:07:28 +0000
Date: Mon, 2 Dec 2024 22:07:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: jan.petrous@oss.nxp.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, 0x1207@gmail.com,
	fancer.lancer@gmail.com, Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH net-next v7 02/15] net: driver: stmmac: Extend CSR calc
 support
Message-ID: <Z04voJN9uj1Vefef@shell.armlinux.org.uk>
References: <20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com>
 <20241202-upstream_s32cc_gmac-v7-2-bc3e1f9f656e@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-upstream_s32cc_gmac-v7-2-bc3e1f9f656e@oss.nxp.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Hi,

As per patch 1, no need for "driver:" in the subject line.

Thanks.

On Mon, Dec 02, 2024 at 11:03:41PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Add support for CSR clock range up to 800 MHz.
> 
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h      | 2 ++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
>  include/linux/stmmac.h                            | 2 ++
>  3 files changed, 8 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 1367fa5c9b8e..70d601f45481 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -257,6 +257,8 @@ struct stmmac_safety_stats {
>  #define CSR_F_150M	150000000
>  #define CSR_F_250M	250000000
>  #define CSR_F_300M	300000000
> +#define CSR_F_500M	500000000
> +#define CSR_F_800M	800000000
>  
>  #define	MAC_CSR_H_FRQ_MASK	0x20
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 9b262cdad60b..3cb7ad6ccc4e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -325,6 +325,10 @@ static void stmmac_clk_csr_set(struct stmmac_priv *priv)
>  			priv->clk_csr = STMMAC_CSR_150_250M;
>  		else if ((clk_rate >= CSR_F_250M) && (clk_rate <= CSR_F_300M))
>  			priv->clk_csr = STMMAC_CSR_250_300M;
> +		else if ((clk_rate >= CSR_F_300M) && (clk_rate < CSR_F_500M))
> +			priv->clk_csr = STMMAC_CSR_300_500M;
> +		else if ((clk_rate >= CSR_F_500M) && (clk_rate < CSR_F_800M))
> +			priv->clk_csr = STMMAC_CSR_500_800M;
>  	}
>  
>  	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 75cbfb576358..865d0fe26f98 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -34,6 +34,8 @@
>  #define	STMMAC_CSR_35_60M	0x3	/* MDC = clk_scr_i/26 */
>  #define	STMMAC_CSR_150_250M	0x4	/* MDC = clk_scr_i/102 */
>  #define	STMMAC_CSR_250_300M	0x5	/* MDC = clk_scr_i/124 */
> +#define	STMMAC_CSR_300_500M	0x6	/* MDC = clk_scr_i/204 */
> +#define	STMMAC_CSR_500_800M	0x7	/* MDC = clk_scr_i/324 */
>  
>  /* MTL algorithms identifiers */
>  #define MTL_TX_ALGORITHM_WRR	0x0
> 
> -- 
> 2.47.0
> 
> 
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

