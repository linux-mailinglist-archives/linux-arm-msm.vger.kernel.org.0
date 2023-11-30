Return-Path: <linux-arm-msm+bounces-2726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F447FF30F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 15:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40D0C281CFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 14:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CCD51C32;
	Thu, 30 Nov 2023 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="InpbtX+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A516A10F3;
	Thu, 30 Nov 2023 06:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DupwdXKpFNNO1IYb/Kwpndtw685CzVAkyF0rfB3hn3A=; b=InpbtX+Tz/Pi2xwtXz/ZuWpvAT
	xKjQzZX7NFyTyTbAbaQ5vCZlpqPFxCvTaNsGGRPFREwiQ5tmYX32QDt+Elv+YAHfdutK4vugv251Q
	y0hRrc7O8c+36z2CDNZIn9ZWBnHWfqnUO57z4//fcTH7UJXjk+ZCvRlcUUS0O4zNlP2s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r8iUu-001ft8-Fz; Thu, 30 Nov 2023 15:58:36 +0100
Date: Thu, 30 Nov 2023 15:58:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [net-next PATCH 02/14] net: phy: at803x: move disable WOL for
 8031 from probe to config
Message-ID: <e7557dc5-0c96-451a-919d-124847a0dfe8@lunn.ch>
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
 <20231129021219.20914-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129021219.20914-3-ansuelsmth@gmail.com>

>  	if (phydev->drv->phy_id == ATH8031_PHY_ID) {
> +		/* Disable WoL in 1588 register which is enabled
> +		 * by default
> +		 */
> +		ret = phy_modify_mmd(phydev, MDIO_MMD_PCS,
> +				     AT803X_PHY_MMD3_WOL_CTRL,
> +				     AT803X_WOL_EN, 0);
> +		if (ret)
> +			return ret;
> +

Maybe it comes later in the patch series, but i would actually add a
at8031_probe() which calls the common at803x_probe() and then does
this WoL stuff.

I don't see any reason to have just one probe, with

	if (phydev->drv->phy_id == ATH8031_PHY_ID) {

in it.

   Andrew

