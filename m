Return-Path: <linux-arm-msm+bounces-24090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE00916196
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 10:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 323A5B24D41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 08:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD9E149C4C;
	Tue, 25 Jun 2024 08:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="utoHYsjX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7D5146587;
	Tue, 25 Jun 2024 08:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719305187; cv=none; b=qjINeJR4rXlN8ps+Nyeo8kYpeO8C+eM/fDg9TOwCJ8+hPMhQ1Jxv3iV741CLMliozUcfECGGvgvIpFlmT70KBq9PWPdvGB5Mj5vs7q0XLhLMvTioWQbJ9AdJrUhh634iovlqPf7mUgeMLlFIFpYx1KCp0Va9DeCerlHaRVAdjNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719305187; c=relaxed/simple;
	bh=io+YsU06PfnGMLgZdDSi+i1wl+f5UWTu++sK/jgkxBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEy+2lN5Qr/8zpmtqSlPX5dZCH7hiUp0pXKerAq4Ysif5ANCUgjMPYuXvjiw5n2Ja1/c6nPU1Tla49KO2gUXAxzwPfVoG8A3ieVG1NsvZLCfPmz45/TtJfX6XpLSv/fFN24MkQrPr/0h/AGLij6mWougkF9367rprdvnvNSesRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=utoHYsjX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFE9C32786;
	Tue, 25 Jun 2024 08:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719305186;
	bh=io+YsU06PfnGMLgZdDSi+i1wl+f5UWTu++sK/jgkxBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=utoHYsjX6B17GPU9bmbscNnPG2m3iCvktmccxfRIjsYuJ800o4hUu/rRux0nLWYAj
	 9YOTYBAwPdmfzWqvkKk5A8ohSNCGfx36FobavrpeDrBW5B8ikaJc23rBrJx3BIxkda
	 XHaCBxnksbQxhJFz0vetUvGB9ouEkVhYaHFDHdbXXovx/h6vLpRkMEBaOtng7YNQrT
	 d4NWQ+hQpZl8UUAQ5q4juhACDdfEdfo6IkYwksegU1ME+yTqQ/YJ+8fWEK9Xin4aea
	 G8zn8M77C+/YARQ7iZ+NpFCnkA6dnBKIJCMKYyRnX8urKwCT36BUfpDdgVJ9MYW2vh
	 d09u2I40rd6uA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sM1ov-000000005yW-0F2h;
	Tue, 25 Jun 2024 10:46:33 +0200
Date: Tue, 25 Jun 2024 10:46:33 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Tony Lindgren <tony@atomide.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 7/8] serial: qcom-geni: Fix suspend while active UART
 xfer
Message-ID: <ZnqD6ZFxfU6P5yN5@hovoldconsulting.com>
References: <20240610222515.3023730-1-dianders@chromium.org>
 <20240610152420.v4.7.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid>
 <ZnlilDj5UrvrVasv@hovoldconsulting.com>
 <CAD=FV=U=C+Myrb4cpGyV-J=RHn39C2aF1WT_Xt5M2vczbZ-AbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=U=C+Myrb4cpGyV-J=RHn39C2aF1WT_Xt5M2vczbZ-AbA@mail.gmail.com>

On Mon, Jun 24, 2024 at 01:58:34PM -0700, Doug Anderson wrote:
> On Mon, Jun 24, 2024 at 5:12 AM Johan Hovold <johan@kernel.org> wrote:

> > I'm leaning towards fixing the immediate hard lockup regression
> > separately and then we can address the older bugs and rework driver
> > without having to rush things.
> 
> Yeah, that's fair. I've responded to your patch with a
> counter-proposal to fix the hard lockup regression, but I agree that
> should take priority.
> 
> > I've prepared a minimal three patch series which fixes most of the
> > discussed issues (hard and soft lockup and garbage characters) and that
> > should be backportable as well.
> >
> > Currently, the diffstat is just:
> >
> >          drivers/tty/serial/qcom_geni_serial.c | 36 +++++++++++++++++++++++++-----------
> >          1 file changed, 25 insertions(+), 11 deletions(-)
> 
> I'll respond more in dept to your patches, but I suspect that your
> patch series won't fix the issues that Nícolas reported [1]. I also
> tested and your patch series doesn't fix the kdb issue talked about in
> my patch #8. Part of my reworking of stuff also changed the way that
> the console and the polling commands worked since they were pretty
> broken. Your series doesn't touch them.

Right, I never claimed to fix all the issues, only some of the most
obvious and severe ones. 

> We'll probably need something in-between taking advantage of some of
> the stuff you figured out with "cancel" but also doing a bigger rework
> than you did.

Quite likely. My intention was to try to find minimal fixes for
individual issues, which could also be backported, before doing a larger
rework if that turns out to be necessary (and which can also be done in
more than way, e.g. using 16-byte fifos).

Johan

