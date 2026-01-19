Return-Path: <linux-arm-msm+bounces-89689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 925B9D3AC24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 660B9307A379
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 14:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1174537F758;
	Mon, 19 Jan 2026 14:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="EByHMWRU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E1D376BF8;
	Mon, 19 Jan 2026 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832870; cv=none; b=Ph95Mr/RO/PuN9Qgs98DZCdeERmqWjanTIqiMGrg3o7sY1vET9wuyWZsy4o8WezLsqNx6PMoULs0GLbhBONp3H6nibmglTeq4DoP91coY+0qomXPgAgbC4hq49jYeU+2xkosLfPf7hUoCDDddlWLQZlfJMR8BqWhNZ/K6SotSnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832870; c=relaxed/simple;
	bh=7X5XqWrgobjuqdR5LEtQm05VtOmnW8zvwKNfdQqLTt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhgdr4rS/E4xopSj5TAr0nOVysYrOlN1BY4Y00LbHzsXkTJqmewQhG2C1DcISewHq2/cJXV7DUmulvjXrbL4zlUGaUoaGKpsQpC/gfrx0X89EzYRW9EyeMNFy/Xycs1QaBmQevHYRJK8Az0ZdCdwjdLPjyFacRaJ1pzqjgrJemE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=EByHMWRU; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oa6ROnre6vr29aI4SNzN9w1inyxLiiLWv/B/wldB++Y=; b=EByHMWRUchgU/DLs8hq0L/dHWD
	5zjuKjJVshFuMrahXJ97rRLOWXT4lg8Khdi+FurcsHRmp9K23Qrr+pb9Ni802OPXiWGImH1MB9899
	5YA6gGkGVdQdoZSZnI+kqH67ez+gy3ye1dCYk1mn5x97JQ1Jga0290Ng8Fb/XNyttVviHN9IadMhS
	PCzgIDyYIoJ2+mVJzUsBlBKiqRex1wSbhd3dBWFvXjw/SkAr1K0VYS8HkVag3ITLGt5mOLMyCjt31
	JAeD9vVdIE81zOjAwOyJJQRjGN8+Nqsh0jMUmARIYdqc18JVL18kVri1ry9Cr/E2+NMB5a27FijmA
	+KotNvRA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45064)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vhqEH-000000005IS-46Rj;
	Mon, 19 Jan 2026 14:27:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vhqEE-000000006d8-2VLt;
	Mon, 19 Jan 2026 14:27:38 +0000
Date: Mon, 19 Jan 2026 14:27:38 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 14/14] net: stmmac: report PCS configuration
 changes
Message-ID: <aW4_WsnDdhpajY93@shell.armlinux.org.uk>
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
 <E1vhoT1-00000005H2a-3EnB@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vhoT1-00000005H2a-3EnB@rmk-PC.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Jan 19, 2026 at 12:34:47PM +0000, Russell King (Oracle) wrote:
> Report if/when qcom-ethqos changes the PCS configuration. With phylink
> now setting the PCS configuration, there should be no need for drivers
> to change this.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> index f9e7a7ed840b..6a1e30b10740 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> @@ -71,6 +71,7 @@ static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
>  				  bool srgmi_ral)
>  {
>  	u32 value = readl(ioaddr + GMAC_AN_CTRL(reg));
> +	u32 old = value, diff;
>  
>  	/* Enable and restart the Auto-Negotiation */
>  	if (ane)
> @@ -84,6 +85,20 @@ static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
>  	if (srgmi_ral)
>  		value |= GMAC_AN_CTRL_SGMRAL;
>  
> +	diff = old ^ value;
> +	if (diff & ~GMAC_AN_CTRL_RAN) {
> +		pr_warn("dwmac: PCS configuration changed from phylink by glue, please report: 0x%08x -> 0x%08x\n",
> +			old & ~GMAC_AN_CTRL_RAN, value & ~GMAC_AN_CTRL_RAN);
> +#define REPORT_BIT(x) \
> +		if (diff & GMAC_AN_CTRL_##x) \
> +			pr_warn("dwmac: %8s %u -> %u\n", #x, \
> +				!!(old & GMAC_AN_CTRL_##x), \
> +				!!(value & GMAC_AN_CTRL_##x))
> +		REPORT_BIT(ANE);
> +		REPORT_BIT(SGMRAL);
> +#undef REPORT_BIT

I notice in patchwork, checkpatch doesn't like the "if" starting the in
the macro definition. While that would be true of definitions in kernel
header files which can be used anwhere, for such a simple limited usage
here, wrapping the thing in do { } while(0) is needless baggage, over-
complicates the code, and makes it less readable. So, IMHO, checkpatch
is wrong.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

