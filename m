Return-Path: <linux-arm-msm+bounces-38367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5A99D2C24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 18:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D5B71F22E78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 17:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEEB1D0E14;
	Tue, 19 Nov 2024 17:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="V+EI5x9f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DF125763;
	Tue, 19 Nov 2024 17:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732036189; cv=none; b=CJ46I1WlfyfAPDPH3GlKhmloRYEfZwnsTZvOQyr2c7XAvfSQ13eDdTdG1z4emGw+/IoM7MeDEh1VLciqFR+P0+aqhgsqcI9/dr3v24o/q/8EFi1NF4CNJA8NDGdOCyTvjxAJLddlCd48ajHfcvreTaRZUXfCmPzPOfoKoSnfXnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732036189; c=relaxed/simple;
	bh=L6lD6VmUqKcxEpjKjYStL9tVt6sSY1vJPeuxibqExWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NR5BQNyA7o1X9Ga2pLTzYcDtd0klVW1dx6dGIWSNrd4Vn/MFIxBhhQWYF8nymWt8+9q7PgqUr30CnhmBiXUZqLgMcKdV5Upb2OKC35m6boLez0xjVQxC95suvYPB7o4KD2UED8ujf2CsI8/h7+Sg5w2lYV5ck6Kbci3I8z2n7QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=V+EI5x9f; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2g7o3qX8HNqQpFdW0w76lQBmquzjn2sh9zKqXbBe8z0=; b=V+EI5x9fdojHa+anMP+6+G+WQt
	Jn4L/qLS3VTeYjRZ+pBRZLjIEE8enEx4vn2xbr/luVIYyY6m9nDcQs7pVPOy0lxeGqPvCVMDwAx1A
	HNMs0PYLQYjSkhPD62Wcj+J4sjXT4LxLIBdYIae6PZhJXGxRDEemHRtx/4aHCAQ2U5jKJM19Crozs
	y1PG0S6Sjr3H0yCuZN1ohVwOfvvn6D6b2OSeWmvplezsngcROc8iU9+ti2ZvRZoKjtCUwAgXct6vj
	nVcTMFHA5wpxhl9NB2eNsLGxBwYL4S+6y61wRoLiSm7qyddvniWDjQaqO9JSFFo4xRL+lYoQLvQPF
	R973z1sQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33436)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tDRj6-00047C-1y;
	Tue, 19 Nov 2024 17:09:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tDRj1-0006En-2U;
	Tue, 19 Nov 2024 17:09:15 +0000
Date: Tue, 19 Nov 2024 17:09:15 +0000
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
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v5 16/16] net: stmmac: platform: Fix PTP clock rate
 reading
Message-ID: <ZzzGO5zgDvIK6JJ_@shell.armlinux.org.uk>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-16-7dcc90fcffef@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-16-7dcc90fcffef@oss.nxp.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Nov 19, 2024 at 04:00:22PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> The stmmac driver supports many vendors SoCs using Synopsys-licensed
> Ethernet controller IP. Most of these vendors reuse the stmmac_platform
> codebase, which has a potential PTP clock initialization issue.
> The PTP clock rate reading might require ungating what is not provided.
> 
> Fix the PTP clock initialization by enabling it immediately.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index b1e4df1a86a0..db3e8ef4fc3a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -632,7 +632,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  	clk_prepare_enable(plat->pclk);
>  
>  	/* Fall-back to main clock in case of no PTP ref is passed */
> -	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
> +	plat->clk_ptp_ref = devm_clk_get_enabled(&pdev->dev, "ptp_ref");
>  	if (IS_ERR(plat->clk_ptp_ref)) {
>  		plat->clk_ptp_rate = clk_get_rate(plat->stmmac_clk);
>  		plat->clk_ptp_ref = NULL;

Looking at where the driver makes use of clk_ptp_ref, it currently
prepares and enables this clock via stmmac_open(), disables and
unprepares via stmmac_release().

There could be a platform where this is being used as a power saving
measure, and replacing devm_clk_get() with devm_clk_get_enabled() will
defeat that.

I would suggest that if you need the clock to be enabled in order to
get its rate, then the call to clk_get_rate() should have the
enable/disable around it to allow these other sites to work as they
have done.

Alternatively, we may take the view that the power saving is not
necessary, or stopping the clock is not a good idea (loss of time
in the 1588 block?) so the above changed would be sensible but only
if the clk_prepare_enable() and clk_disable_unprepare() calls on
this particular clock are also removed.

I can't say which is the correct way forward.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

