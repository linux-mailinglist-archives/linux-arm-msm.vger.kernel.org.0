Return-Path: <linux-arm-msm+bounces-23280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2F390F6E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C63591F20FBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 19:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB25158DA5;
	Wed, 19 Jun 2024 19:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="kYAgxoNp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0E4158D98;
	Wed, 19 Jun 2024 19:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718824798; cv=none; b=rhJBgBJ55UAKgoyHgGOhiPLWiiTLtYpjAzFvX4bHyAciWeJJjbowH5Z0h9HK8iEYsIZHhtWL1tNRmYF5RPfB/o+5uv8acjJL0WgpQ+0iFNy8pybbSKr/42ZK5/heUmD+BKWML8YPPh4vvLS3xDkE6nlXbDhhcNymKYjbxh7i8Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718824798; c=relaxed/simple;
	bh=yj7d/h6x1pMH9BXPLjRLQpkjf5kwi8uwPEaPL+TMUXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0hV9nbGW7ds5rbROXxqTxVIw9v2nMlVLjK1vNIwHhtWf5t4NikOOaHRtqp446L678Gs525iLWB2YTQyySmSgtjMBdZdH2Ek3Ru/0XLkEpWVhybyz2CWdfMspm1BkAUlaoxyN7MsALE0emqgIGDJRhvxxhWciR0OdPKK0+0Omh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=kYAgxoNp; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QUJeCb0b41VEsPZ72O8+y6kiVt6cHBByGNaQU/MidwY=; b=kYAgxoNp+AQnLvGvaT47LKpsQi
	GYKo+KIUWfn6I1/yZ+PC17HYxJEkkqLnopeBbS35ZG8a8BMvTuLPEB2mg44Up4fovNiP+niwqqejD
	sKErVWaCdkc6AE3VrC/h5GCDoh4Xkl0lkjzk3ZBrB7voYRFS4H6/z18qle6pLBLvaAVM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sK0qI-000VA3-WB; Wed, 19 Jun 2024 21:19:39 +0200
Date: Wed, 19 Jun 2024 21:19:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next 4/8] net: phy: aquantia: add support for aqr115c
Message-ID: <a9465b9a-1bfd-4ec1-b641-21867584c9d9@lunn.ch>
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-5-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619184550.34524-5-brgl@bgdev.pl>

>  	case MDIO_PHYXS_VEND_IF_STATUS_TYPE_OCSGMII:
> -		phydev->interface = PHY_INTERFACE_MODE_2500BASEX;
> +		phydev->interface = PHY_INTERFACE_MODE_OCSGMII;

That looks interesting. I wounder what will break.

>  		break;
>  	default:
>  		phydev->interface = PHY_INTERFACE_MODE_NA;
> @@ -721,6 +721,18 @@ static int aqr113c_config_init(struct phy_device *phydev)
>  	return aqr107_fill_interface_modes(phydev);
>  }
>  
> +static int aqr115c_config_init(struct phy_device *phydev)
> +{
> +	/* Check that the PHY interface type is compatible */
> +	if (phydev->interface != PHY_INTERFACE_MODE_SGMII &&
> +	    phydev->interface != PHY_INTERFACE_MODE_OCSGMII)
> +		return -ENODEV;

Does it support 2500BaseX? 

	Andrew

