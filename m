Return-Path: <linux-arm-msm+bounces-23299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D7490F873
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 23:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B1932824A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4906D7D075;
	Wed, 19 Jun 2024 21:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="vsVQp8ce"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8C179B84;
	Wed, 19 Jun 2024 21:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718832313; cv=none; b=cK0aU61tiQET8XYL7D8iXBxqB9EcanfUrLU8ODP4tfN+xmOwlOAI8yEekwhn7IRiBYPE3/SOvIrfKvGiFFEHcC3N0jzOtjJBn1A4TwlUwNU3K9TMEAluqxDhLsUTWDVTjSom437mcm/8diwYjpKi4vm/WOc3URtEDMv0g4oHbdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718832313; c=relaxed/simple;
	bh=TAvvtiq8bL4uTtuxbdWSEO3ha5qcXdAyR/EzvToChWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITCtlkDqNOAMNeyRSQ8YRfqQq3r7xXq8/BO+S4ZgD0sYXJY1VFDVk8Y3E9FpmJO9VZfRaEvp85wWK2QER8zyLNboekIBUIgHGgvmlh3vO0GDsgl/MBEK7/E+blzRA0HBFA+N7FSCcSL2CnK/OgmYOp33wGcB2elImAfbLoYxYyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=vsVQp8ce; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ngxBG/bIsZr8BWoqUSJWfqlx+hcMMjTRBj5upmUnUxg=; b=vsVQp8ceCVF/O5bAaR/NpJT9E2
	X7vN8PsIt+9x/gfvT7v77+LZUHkE1C+lY3+LnXpiIF+SF8shQwu+JoZS/om34rUgdRcaxOKocIk7U
	pV3Wa6xzHL+WUaI+V3T0G1r5Tb5vV8aMdkri8eh8iA/KJ/HKFqckswbD3jV4Ok5Cp31E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sK2nQ-000VjL-9b; Wed, 19 Jun 2024 23:24:48 +0200
Date: Wed, 19 Jun 2024 23:24:48 +0200
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
Message-ID: <b0b03680-9842-49ce-badd-5f9826fdc3fa@lunn.ch>
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
>  		break;

O.K. Given Russells reply, what happens if you skip this hunk, don't
add PHY_INTERFACE_MODE_OCSGMII but use PHY_INTERFACE_MODE_2500BASEX,
and change the MAC driver as needed. Given this here, it seems likely
somebody else is using MDIO_PHYXS_VEND_IF_STATUS_TYPE_OCSGMII as
PHY_INTERFACE_MODE_2500BASEX, so i expect it will work.

Adding PHY_INTERFACE_MODE_OCSGMII is a UAPI addition, since it becomes
possible to pass it in phy-mode in DT. That means, it is hard to
remove later, if Russell ever finds the time to finish his patches,
and PHY_INTERFACE_MODE_OCSGMII is not needed. So if we can avoid
adding it, we should.

       Andrew

