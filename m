Return-Path: <linux-arm-msm+bounces-61288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0FDAD9EF6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 20:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10D723AE0F0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 18:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5754F1DDA0C;
	Sat, 14 Jun 2025 18:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="AFnGMw0U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C7A148830;
	Sat, 14 Jun 2025 18:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749925343; cv=none; b=BgTqvKUvkUkW89ihLVje7j98CXYkwSitqizkcI6sblB2cdiowas6V0VIFHqfV0bvbWbF+OkpxKV+Mt8/nRG8OsiyM1Fxi8CfUUmT/mn70cIksMBTCg29GKY9gICA/yglcBziiZgloIQef4f6r/0c/uOQD8axUrlf519/MV2iUWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749925343; c=relaxed/simple;
	bh=p4/tmhc4G9lT9+ZXS9UuWgSCRJc/+DG2T209fM/S2bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEZRQIN7ZZkrfGCmRQ4zSFx+VkGGB6Vuy/rKLhWAGbvATNWKpo01aXinqwJnJa6Q6XZuxOqmkqrnJx4bivvoKcFvZYvGN7mn666ZTo+9xMOnd1j3lzgBnSRqPbx0ZGkuZ67xvmBBwu3TarBJ7+OJQvBHx5IG+xNcIs4W5eLqplI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=AFnGMw0U; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LWVGJpxfZxK5NWqKsMehk6v+OXAVVCcYoYUm9xSLX/c=; b=AFnGMw0U82bkfJeUm1qa6MToAQ
	4DNM7+9jW6wRrHGrILCc1akHMwLWpcAODcTO4kRMTR8zKDpDDaMZACfuNkd8LMyjCxKq1f7SREwEg
	+59raP3R8l8vsFX4S0BUsQR9lpfnZgJ0EgZX+jCpxIzPe8vdoex1+W2CxPlyxTvU/1Sp2hYBbm00p
	hO6lLM/+m0qcJk1Irc5h5sXSvF3V33IotOT/w33bOwIRfEb+JmW00/eC6+48RLFHz3Wjl1aQkz9HY
	Sbp3rzOaw1HwVyg10QT6TpP/81H8WWkoVYRumO9m3jiyBFhQ2t6Gywb2pPDmUlAwjdtoeFgu1eBfB
	Drupz9fw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43052)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uQVW4-00027I-1a;
	Sat, 14 Jun 2025 19:22:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uQVW0-00031F-1O;
	Sat, 14 Jun 2025 19:22:04 +0100
Date: Sat, 14 Jun 2025 19:22:04 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
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
Message-ID: <aE29zFKp5PLAM5pP@shell.armlinux.org.uk>
References: <E1uPkbO-004EyA-EU@rmk-PC.armlinux.org.uk>
 <20250614153512.GQ414686@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614153512.GQ414686@horms.kernel.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sat, Jun 14, 2025 at 04:35:12PM +0100, Simon Horman wrote:
> On Thu, Jun 12, 2025 at 05:16:30PM +0100, Russell King (Oracle) wrote:
> > Add ethqos_pcs_set_inband() to improve readability, and to allow future
> > changes when phylink PCS support is properly merged.
> > 
> > Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> > Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thanks Russell,
> 
> The nit below notwithstanding this looks good to me.
> 
> Reviewed-by: Simon Horman <horms@kernel.org>
> 
> > ---
> >  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index e30bdf72331a..2e398574c7a7 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -622,6 +622,11 @@ static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
> >  	}
> >  }
> >  
> > +static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
> > +{
> > +	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, 0, 0);
> 
> FWIIW, I would have gone for the following, as all the type of
> three of the trailing parameters is bool.
> 
> 	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, false, false);

So the original code:

            stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 0, 0, 0);
            stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
            stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
            stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);

While one could convert the last two arguments to true/false, I'd prefer
leaving them as is, as less change means less chance to introduce a bug.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

