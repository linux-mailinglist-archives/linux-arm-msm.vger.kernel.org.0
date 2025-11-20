Return-Path: <linux-arm-msm+bounces-82649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CB03BC73492
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8BE954E4C1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C742DC35F;
	Thu, 20 Nov 2025 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Lz0IPuPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E841027A93C;
	Thu, 20 Nov 2025 09:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763631991; cv=none; b=XGJPcRA2tvHSbY4PUXqOZ3wrCG3JNax6E4sWD03qPxIhslLMa5ddN2S68ZMfWpXxftmxL1YGxSRurTV5hy4U8Rkw/0961sTMtbmua53BmfcWSHLBSmUOo6JYhdZmi76nnOwc8BcKqM4sa+yci5qTEhIxUx56uCEOO9ssik3nWSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763631991; c=relaxed/simple;
	bh=Dt6opue6Qhmj9J89ZXUEA0DZv0zQtRfNOcUcsGBmaLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXu6X0H42iGWMJ3nQD7+eWRvvry4XVMwsxwwlq/wGO66Mjfm/sTjtnd/KfT8621o3Rv05yfjfqxOZ93vn070n5piXoPkPOKnnPtYWg5zOZt5GaWDjD/Sh1p98RXURzy0Zyx8NaQjLrFZ6hd0kVsGDrNLNWjjw7I3rkxRsP9B+Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Lz0IPuPf; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7sswFl5l2p4ZT3evZ9i3gc9xarSldWVyH7umhKc38wc=; b=Lz0IPuPfFUD4WovXjBHEyMPMOQ
	xm6rjezioffBkDb++RJz8WeiwEl4r86o7ZJDjO0RsJDeFRVkrXzri7xJ9lKkUCdpglWTCx85P7TfU
	Q2zDgXQGw2xx0FkGNUJgViUOODSqxJfjnD0KkTrhmy8USf5IpRQrdFNlNSicvLZdTbymvxUL7ixrK
	Hr447VPZFNiuvO0kNJDe/tE2t0DhwpM9UQBzugIkItt6e+n54Q77ADyiTrTMBKHMNL2q3KPQcWcCh
	rZvn1HKkP4b+aHw0kiIsDOeaKskXW5zd1d3ETJ9GGWXyXnSy6wPuvwldhpJ+N3XDXxBb0bvQ2hnCg
	HxyCh/Hw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50818)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vM1F5-0000000062y-2Z0H;
	Thu, 20 Nov 2025 09:46:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vM1F1-000000004Hk-3fFC;
	Thu, 20 Nov 2025 09:46:15 +0000
Date: Thu, 20 Nov 2025 09:46:15 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 2/3] net: stmmac: qcom-ethqos: add rgmii
 set/clear functions
Message-ID: <aR7jZ4KkKE9nTsMh@shell.armlinux.org.uk>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
 <E1vLgSU-0000000FMrL-0EZT@rmk-PC.armlinux.org.uk>
 <b720570b-6576-41d7-a803-3d5524b685e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b720570b-6576-41d7-a803-3d5524b685e4@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Nov 20, 2025 at 10:42:04AM +0100, Konrad Dybcio wrote:
> On 11/19/25 12:34 PM, Russell King (Oracle) wrote:
> > The driver has a lot of bit manipulation of the RGMII registers. Add
> > a pair of helpers to set bits and clear bits, converting the various
> > calls to rgmii_updatel() as appropriate.
> > 
> > Most of the change was done via this sed script:
> > 
> > /rgmii_updatel/ {
> > 	N
> > 	/,$/N
> > 	/mask, / ! {
> > 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)\2,\s+|rgmii_setmask(\1|
> > 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)0,\s+|rgmii_clrmask(\1|
> > 		s|^\s+$||
> > 	}
> > }
> > 
> > and then formatting tweaked where necessary.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 187 +++++++++---------
> >  1 file changed, 89 insertions(+), 98 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index ae3cf163005b..cdaf02471d3a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -137,6 +137,18 @@ static void rgmii_updatel(struct qcom_ethqos *ethqos, u32 mask, u32 val,
> >  	rgmii_writel(ethqos, temp, offset);
> >  }
> >  
> > +static void rgmii_setmask(struct qcom_ethqos *ethqos, u32 mask,
> > +			  unsigned int offset)
> > +{
> > +	rgmii_updatel(ethqos, mask, mask, offset);
> > +}
> 
> It's almost unbelieveable there's no set/clr/rmw generics for
> readl and friends

Consider what that would mean - such operations can not be atomic, but
users would likely not realise, which means we get a load of new
potential bugs. Not having these means that driver authors get to
code this up, and because they realise they have to do separate read
and write operations, it's more obvious that there may be races.

The phy_* accessors are different - these take the bus lock while they
operate, and thus are atomic.

> 
> [...]
> >  	/* Set DLL_EN */
> > -	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_DLL_EN,
> > -		      SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
> > +	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN,  SDCC_HC_REG_DLL_CONFIG);
> 
> double space
> 
> [...]
> 
> >  	/* Select RGMII, write 0 to interface select */
> > -	rgmii_updatel(ethqos, RGMII_CONFIG_INTF_SEL,
> > -		      0, RGMII_IO_MACRO_CONFIG);
> > +	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL,  RGMII_IO_MACRO_CONFIG);
> 
> and here
> 
> Everything else looks in tact

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

