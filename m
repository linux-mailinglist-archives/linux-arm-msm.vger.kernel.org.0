Return-Path: <linux-arm-msm+bounces-23344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 201D0910259
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 13:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C92451F22F3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 11:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2289A1AB36E;
	Thu, 20 Jun 2024 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="z2ZUPDwp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D6A1AAE04;
	Thu, 20 Jun 2024 11:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718882224; cv=none; b=lhBzvawV0U9DI7BmOQIgWdGZ0NUvZ3RedYzjtijZEa+u9CxOuP7RG0+2a1bgUpfathDNCYgUXLvggIIJv2orZZKXtNa2yDCfjxCi1B9vI9MktAKG1OeKxK1DynSXl+AQCEZ76SCqezRuJB4aOeg0QgyD7DyUDFXinDlhshh8GbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718882224; c=relaxed/simple;
	bh=O3S3VWzVD9fmlc1C98JuAN49aTJ5hu9MtYUiaKsL+PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sV3pvXW6p/ZAuGmBwFTtPIgqbanklK87ESYg+5qsDxfrPnXCNHyptulvJLVJ+GSEY1yey1gIlDTDscGdfSDxg6vsrGyI7p1Sxv6DubmdSOSSpGUbHQVGrwJZcgHZmDXj5p+408c35lhCTEwDPosum2AvyMNHXWKLS8QL8ZvidQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=z2ZUPDwp; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gYwDGJKYUQsFHOxIe5ojcNSki2ui6Az95zkeQzes4OQ=; b=z2ZUPDwpThPLjzeOrfmPFi8xJi
	aVCwWcqk0NwvJDy9sFsIWrob3/2IXt86ZDoxERZ/hfJbNNl0fhYCzwZKqLKsbeGscXIcMt3lHKyYe
	tbTZzvN/xkGLxM2dJiXo5wM6uYrUJ6DAyQl1++cXHJ2ybCueKMZh1A+eYzqJZNVp/YS37igoWD+Ac
	d67Kib2+skIRYavuLpj+w8ePYzM2utwzAaa8f4e1zp4Yy3KXLUYtk7HxCmwozxyGpov59hcCkpzPz
	qyKex2+vpMq/y/3HQt/KrptW4x0pk/GR2VxIKE+EhO2QG7pPtiuOn0WxTqnSgsOz9cfFwSCiS+M0R
	hLD1yr2g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60730)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sKFmX-0001ew-2C;
	Thu, 20 Jun 2024 12:16:45 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sKFmY-0007cc-Pr; Thu, 20 Jun 2024 12:16:46 +0100
Date: Thu, 20 Jun 2024 12:16:46 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next 8/8] net: stmmac: qcom-ethqos: add a DMA-reset
 quirk for sa8775p-ride-r3
Message-ID: <ZnQPnrfoia/njFFZ@shell.armlinux.org.uk>
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-9-brgl@bgdev.pl>
 <ZnQLED/C3Opeim5q@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnQLED/C3Opeim5q@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Jun 20, 2024 at 11:57:20AM +0100, Russell King (Oracle) wrote:
> I don't have time to go through stmmac and make any suggestions (sorry)
> so I can only to say NAK to this change.

Also... where is the cover message? I don't have it, so I don't have the
context behind your patch series - and I haven't received all the
patches either.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

