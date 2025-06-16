Return-Path: <linux-arm-msm+bounces-61465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEAFADB531
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 17:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBA3F7A18DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 15:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D896D202960;
	Mon, 16 Jun 2025 15:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4bSIrFa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E3F2BEFEB;
	Mon, 16 Jun 2025 15:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087406; cv=none; b=KIFobMj1dAfxQe8YrLDrfPVO6szOziu3HOg2FQwxmdOrXzKu6utpY2OIekp1JwCL24aWqBdQbynTaE00v34pmqTeqBJ7XpWZmfz4wu96GKiN+/Gfgon1DRnUUjYJtZepRx0iV/uLYmb7RVyaCsAzdNukh02qS9OgKvg8MD2xvxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087406; c=relaxed/simple;
	bh=DzAYX/OSHec4aneSP3rKdKZMDvBVK1lYEdX+ohzC8Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jD6W/B0NAb5ZWHYL1SAfZBKSwcP0f4ggMtGg/0hcIG/aGVJ07cYjuldROOMw6LNBtQoma+/AEM/7l4TXCUggj0fZia5/QLI5J8XcLhcA+k9DHRDteCY3Hd8ifc+idFPvFF41l0zUn9AVZKUzxBE3sUgHNk5hI7IzWTOEEjZ2tdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p4bSIrFa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC8BC4CEED;
	Mon, 16 Jun 2025 15:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750087406;
	bh=DzAYX/OSHec4aneSP3rKdKZMDvBVK1lYEdX+ohzC8Z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p4bSIrFatcQ42d88MaNSql4q5Dcs587b0VzQUEpNUgOZlHk+NN8C1yA1R7fPrwy+C
	 78egzc9WK0QVzESvoMXRWSr0heoUW+1Cfc7Wqe4zx6sAym65yTvUPGQXZcvJ40NapN
	 XenE3xQPdDEEliVJItbTX4Q6tmazd2OK2OtpkZfd7ZgVskQL1cuqSPWNm3em/l9Pf9
	 sK5qZHWclWBSvkQo5B8tr8c0b3JtZVj36rX6tMEp5Ai9D/o/e2RRIcnMRPO8w6yWTa
	 17dwO7u1Fs358bBpZcN8RxasCUeYIrfZDjv8V8GXoz2uS+ga3f6qDn9kCdkshrKQEu
	 n7ytYrKkWv0IA==
Date: Mon, 16 Jun 2025 16:23:21 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: add
 ethqos_pcs_set_inband()
Message-ID: <20250616152321.GD6918@horms.kernel.org>
References: <E1uPkbO-004EyA-EU@rmk-PC.armlinux.org.uk>
 <20250614153512.GQ414686@horms.kernel.org>
 <aE29zFKp5PLAM5pP@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aE29zFKp5PLAM5pP@shell.armlinux.org.uk>

On Sat, Jun 14, 2025 at 07:22:04PM +0100, Russell King (Oracle) wrote:
> On Sat, Jun 14, 2025 at 04:35:12PM +0100, Simon Horman wrote:
> > On Thu, Jun 12, 2025 at 05:16:30PM +0100, Russell King (Oracle) wrote:
> > > Add ethqos_pcs_set_inband() to improve readability, and to allow future
> > > changes when phylink PCS support is properly merged.
> > > 
> > > Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> > > Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > 
> > Thanks Russell,
> > 
> > The nit below notwithstanding this looks good to me.
> > 
> > Reviewed-by: Simon Horman <horms@kernel.org>
> > 
> > > ---
> > >  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 13 +++++++++----
> > >  1 file changed, 9 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > index e30bdf72331a..2e398574c7a7 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > @@ -622,6 +622,11 @@ static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
> > >  	}
> > >  }
> > >  
> > > +static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
> > > +{
> > > +	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, 0, 0);
> > 
> > FWIIW, I would have gone for the following, as all the type of
> > three of the trailing parameters is bool.
> > 
> > 	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, false, false);
> 
> So the original code:
> 
>             stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 0, 0, 0);
>             stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
>             stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
>             stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
> 
> While one could convert the last two arguments to true/false, I'd prefer
> leaving them as is, as less change means less chance to introduce a bug.

Sure. No objections on my side.

