Return-Path: <linux-arm-msm+bounces-35552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C8A9ABFAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 09:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFACB1C210DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 07:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B31D14AD3F;
	Wed, 23 Oct 2024 07:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFSgJbX0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4860713A3F3;
	Wed, 23 Oct 2024 07:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729667039; cv=none; b=n/Vx4svFOMZxeH2CSqM0PpISYPEmyO4SyXnYjA6nMxxYfL45iEH6895x6yuHqTIjXrMHTiQ52ITV3nl0V7Q0QgAQ3kkTTggLd7kGoQaS14Qqhl0DAKm7RYK3Oq0gIqo9apmjjah3aWqMxH6NTIlUMdfsjwxutbjRT5smL/Mfmww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729667039; c=relaxed/simple;
	bh=6DVKQTLwDZ80k1XcNjngRcu4GZNFUuwGnFM8c9RnzkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7xyGqy8XfTlFGotKOlpLe2W31xjayu/KYzWta6e13zL1kXmTWPyParIu7Q6erh7QwKUC8kvj2dr4axADvbXx6OU5ZX7wWryS0kByK6VkFi+YvDi3JslhtstOdjZVm2Gd5JXyYjciuxtYQ9dIPgrnnoUMG+01kYB/V+w/hgTOEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFSgJbX0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE82EC4CEC6;
	Wed, 23 Oct 2024 07:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729667038;
	bh=6DVKQTLwDZ80k1XcNjngRcu4GZNFUuwGnFM8c9RnzkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFSgJbX0TOXKZqTgHQeTetPCujY6ARh7Kwo0rEgfyO8Oki0pjsoQE7X9qFVBBVOXm
	 VFBZtwgsPBZuPRRl6DHVDaAv9uUkt2m1553NXprb9iVlQakmUX38lxlpJhb7XgXBdy
	 mVzRL9opR28oW1y/+G38LRUJ1lRDiToBffmYeqNw0fhdBD+2rrnh4AtxzX/m4ybcUZ
	 58N4ttKznHX11xI7JNYrfaP0ZhVguJRGIRbhjcNw9s8+3VH3Uv5YUQXAZSV0A5CRwl
	 jlw8KbnDrj79K9+feR048Q8SAGyt13jrX+f1n1b2ntWbr3yMRpI3BwxVZtA0jXv7Qz
	 hFqpJjtVn63RQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t3VPe-000000001go-2ooC;
	Wed, 23 Oct 2024 09:04:10 +0200
Date: Wed, 23 Oct 2024 09:04:10 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Message-ID: <Zxif6vmh8BE_C-_n@hovoldconsulting.com>
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
 <20241004-x1e80100-ps8830-v2-2-5cd8008c8c40@linaro.org>
 <Zw5oEyMj6cPGFDEI@hovoldconsulting.com>
 <Zxdp2vHzREJAFkwj@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zxdp2vHzREJAFkwj@linaro.org>

On Tue, Oct 22, 2024 at 12:01:14PM +0300, Abel Vesa wrote:
> On 24-10-15 15:03:15, Johan Hovold wrote:
> > On Fri, Oct 04, 2024 at 04:57:38PM +0300, Abel Vesa wrote:

> > > +	ret = ps8830_get_vregs(retimer);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	retimer->xo_clk = devm_clk_get(dev, "xo");
> > > +	if (IS_ERR(retimer->xo_clk))
> > > +		return dev_err_probe(dev, PTR_ERR(retimer->xo_clk),
> > > +				     "failed to get xo clock\n");
> > > +
> > > +	retimer->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > 
> > The reset line is active low and should be described as such in DT. So
> > here you want to request it as logically low if you want to deassert
> > reset.
> 
> This is being reworked in v3 as we need to support cases where the
> retimer has been left enabled and initialized by bootloader and we want
> to keep that state until unplug event for the cold-plug orientation
> to work properly.
> 
> On top of that, we don't want to deassert the reset here. We do that
> via gpiod_set_value() call below, after the clocks and regulators have
> been enabled.

Ok, but you should generally not drive an input high before powering on
the device as that can damage the IC (more below).

That is, in this case, you should not deassert reset before making sure
the supplies are enabled.

> > > +	ret = clk_prepare_enable(retimer->xo_clk);
> > > +	if (ret) {
> > > +		dev_err(dev, "failed to enable XO: %d\n", ret);
> > > +		goto err_retimer_unregister;
> > > +	}
> > 
> > Should you really enable the clock before the regulators?
> 
> So maybe in this case it might not really matter. But in principle,
> the HW might be affected by clock glitches and such when IP block
> is powered up but unclocked. Even more so if the clock enabling
> (prepare, to be more exact) involves switching to a new PLL.
> 
> So clock first, then power up. At least that's my understanding of HW
> in general.

I think you got that backwards as inputs are typically rated for some
maximum voltage based on the supply voltage. That applies also to the
reset line as I also mentioned above.

What does the datasheet say?

> > > +
> > > +	ret = ps8830_enable_vregs(retimer);
> > > +	if (ret)
> > > +		goto err_clk_disable;

Johan

