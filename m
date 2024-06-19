Return-Path: <linux-arm-msm+bounces-23284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0027F90F72E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78E88B209C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 19:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B95275816;
	Wed, 19 Jun 2024 19:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="wykRAKO9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA13F1876;
	Wed, 19 Jun 2024 19:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718826694; cv=none; b=ub+cbq3qzhGA1xGd66f/MQmEFvPqj/k9J4l0zpFfmZL0TvjZwypZhThnNCiq6Xws8MKPJpA+FWKvZjcdlhBeKxd3RJQWSQQTMeJAOxhjskHl6nvq2d8tF62Ut2pU6qu326k2UUz10u8u+TjIo7S0pRM7TQCEbfRNrBr/YK3XwPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718826694; c=relaxed/simple;
	bh=Zqm1vtW+ID7zxTGrE2BVFpmEo5FykJURlDkbPF8Y448=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzEQApkEgkKTVMRxN+ikGm7mFDy2wq2C9IFFnIcGFLMpfvF6X3OKEhdNE1p2Y7IgYgWNbBBgmAwtEBwCWDwIsIwJbW/fBT97wVJM1snFh1UTOszeotCKS+6abpvTv5SsR0chrB3AeKBr/xUKClFfIP4kxyr2WCxlv3wAtZllDRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=wykRAKO9; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=WnQdVdsbldNc+VO+2ej+8Ij/CjLH8t7u+69BlHcBJow=; b=wy
	kRAKO9vKrjnz8H1Qso+72FuS2LpcBjC3qXjri4XnQgfwKy/G8smmugzkf+RXMAcXgQZCrs2u9Mvmk
	GwDQH0IGVU3G0YetnxedN1jDAMkm8bsWJ7k4ycQCar76oRoOPFldxO8oVV1Y9chzE4GkHBELRTBiM
	Xb4aDyh7xSFGETo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sK1Kq-000VKf-O5; Wed, 19 Jun 2024 21:51:12 +0200
Date: Wed, 19 Jun 2024 21:51:12 +0200
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
Subject: Re: [PATCH net-next 1/8] net: phy: add support for overclocked SGMII
Message-ID: <160b9abd-3972-449d-906d-71d12b2a0aeb@lunn.ch>
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-2-brgl@bgdev.pl>
 <bedd74cb-ee1e-4f8d-86ee-021e5964f6e5@lunn.ch>
 <CAMRc=MeCcrvid=+KG-6Pe5_-u21PBJDdNCChVrib8zT+FUfPJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeCcrvid=+KG-6Pe5_-u21PBJDdNCChVrib8zT+FUfPJw@mail.gmail.com>

On Wed, Jun 19, 2024 at 09:29:03PM +0200, Bartosz Golaszewski wrote:
> On Wed, Jun 19, 2024 at 9:09 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Wed, Jun 19, 2024 at 08:45:42PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > The Aquantia AQR115C PHY supports the Overlocked SGMII mode. In order to
> > > support it in the driver, extend the PHY core with the new mode bits and
> > > pieces.
> >
> > Here we go again....
> >
> 
> Admittedly I don't post to net very often and I assume there's a story
> to this comment? Care to elaborate?

2.5G is a mess because vendors implemented it before the standard came
out, in the form of 2500BaseX. They often did just what this seems to
suggest, they overclocked CISCO SGMII.  But the in-band signalling
SGMII uses cannot work at 2.5G, it makes no sense. So vendors disable
the in-band signalling.

What you likely end up with, is 2500BaseX, but without in-band
signalling.

Now, some real 2500BaseX devices require the peer to perform in-band
signalling. Some will listen for the signalling a while, and if they
hear nothing will go into some sort of fallback mode. Others can be
told the peer does not support inband signalling, and so don't expect
it.

And then we have those which are overclocked SGMII which don't expect
any signalling because SGMII signalling makes no sense at 2.5G.

phylib supports out of band signalling, which is enough to make this
work, so long as two peers will actually establish a link because they
are sufficiently tolerant of what the other end is doing. Sometimes
they need a hint. Russell King has been working on this mess, and i'm
sure he will be along soon.

What i expect will happen is you keep calling this 2500BaseX, without
in band signalling. You can look back in the netdev mailling list for
more details and those that have been here before you. It is always
good to search the history, otherwise you are just going to repeat it.

   Andrew

