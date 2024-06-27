Return-Path: <linux-arm-msm+bounces-24527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FA891AFBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 21:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE191282499
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 19:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252B043AC0;
	Thu, 27 Jun 2024 19:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="M9/lb0bH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C638360;
	Thu, 27 Jun 2024 19:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719517058; cv=none; b=Qp9p5DeUSBzuv+PepfGuIhBGUYJ5bLWKnGd0a8lASnPkJkNf7xZh2V5CIx9coE+4B+AvmDP14l7i8zuHH7NM6SmGPdkvykqnbCaSwyjXieeTvrwKv1/oTaylMu4NNo6lIQGVQjg1ODEuMNwVLFOs06DsUSz9MXB6UyvCdInI7Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719517058; c=relaxed/simple;
	bh=0x5S0cUBNgYTh8sD2RmvuEbypBYiNLBr+bxK84fPwAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CaLnGj9ARg6zgwa9I/HdymzXCzhf+otDQBczI5OkVmjuTvHxAKy81scnyQ9gUqMiLKyu2ZdDBElj3z2dSPSqKWrwR5GmV5tt5L646n3iHBy9283h1anP1JejR5f3FhWfTMYeRBcF9F82CN4ihpCzjMqD2A/KeZvYsQ0tfBre9Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=M9/lb0bH; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oYCCFUsdbLvFXZA3WkDkIuUbJppe2HN72PE2NIGZw5M=; b=M9/lb0bHeHkOSDmbEMEU84cAOp
	lHtPAlQ6bgsfBtAWBS7ZNPF6jgnQfjCpWJbzeZC+2deBvYGVdlfqvb78D6IpQr5bMYw0MPjQzgI0m
	8lHQl0NkzmykT2HHYFc623bPGYQnjXvjnJwyDtvHj9NL+7UvfJ3jfiMCSNp+Sr3IKDDY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sMuvl-001Cgs-9J; Thu, 27 Jun 2024 21:37:17 +0200
Date: Thu, 27 Jun 2024 21:37:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 net-next 2/2] net: stmmac: qcom-ethqos: add a
 DMA-reset quirk for sa8775p-ride
Message-ID: <f416e06e-e354-4628-883b-07850f05e276@lunn.ch>
References: <20240627113948.25358-1-brgl@bgdev.pl>
 <20240627113948.25358-3-brgl@bgdev.pl>
 <td5jbseo7gtu6d4xai6q2zkfmxw4ijimyiromrf52he5hze3w3@fd3kayixf4lw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <td5jbseo7gtu6d4xai6q2zkfmxw4ijimyiromrf52he5hze3w3@fd3kayixf4lw>

On Thu, Jun 27, 2024 at 12:07:22PM -0500, Andrew Halaney wrote:
> On Thu, Jun 27, 2024 at 01:39:47PM GMT, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > 
> > On sa8775p-ride the RX clocks from the AQR115C PHY are not available at
> > the time of the DMA reset so we need to loop TX clocks to RX and then
> > disable loopback after link-up. Use the existing callbacks to do it just
> > for this board.
> > 
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Sorry, not being very helpful but trying to understand these changes
> and the general cleanup of stmmac... so I'll point out that I'm still
> confused by this based on Russell's last response:
> https://lore.kernel.org/netdev/ZnQLED%2FC3Opeim5q@shell.armlinux.org.uk/
> 
> Quote:
> 
>     If you're using true Cisco SGMII, there are _no_ clocks transferred
>     between the PHY and PCS/MAC. There are two balanced pairs of data
>     lines and that is all - one for transmit and one for receive. So this
>     explanation doesn't make sense to me.
> 

Agreed. We need a deeper understanding of the clocking to find an
acceptable solution to this problem.

Is the MAC extracting a clock from the SERDES lines?

Is the PHY not driving the SERDES lines when there is no link?

For RGMII PHYs, they often do have a clock output at 25 or 50MHz which
the MAC uses. And some PHY drivers need asking to not turn this clock
off.  Maybe we need the same here, by asking the PHY to keep the
SERDES lines running when there is no link?

https://elixir.bootlin.com/linux/v6.10-rc5/source/include/linux/phy.h#L781

I also wounder why this is not an issue with plain SGMII, rather than
overclocked SGMII? Maybe there is already a workaround for SGMII and
it just needs extended to this not quiet 2500BaseX mode.

      Andrew

