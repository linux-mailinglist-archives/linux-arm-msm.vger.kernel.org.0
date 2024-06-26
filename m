Return-Path: <linux-arm-msm+bounces-24237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F12917AC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 10:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 158E41C239EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 08:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3488116089A;
	Wed, 26 Jun 2024 08:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u9JLOF7l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F63160796;
	Wed, 26 Jun 2024 08:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719389997; cv=none; b=leGbUA0IZKVzRwkmGdm3kHYIxX/mzXvUujZPXy3Zst1ZtykbvkhAYVJL9j+nGFj1M7jl1LbzbA81tgMs9xkHvumliH/aqepB2emgCcggnr8fdcYbiNnyfxLydFru7MUP0WYvVFLw/0SN77HcSregGrrqi2SgXXA/qd6lHBklSy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719389997; c=relaxed/simple;
	bh=E4oJGv2ln2F2mkHKg0UbQEmnSuGrODj0fkfA9bN5peI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCtAavcIdeNx1MYRbu/YGFXWgQ06QtysS2wjThcHZ83UyjZ0appv8eqQD/hqdPsmrGxcxqS2GJMmQlsO+8o/uJZlvhzlGC6iBusHPoePsCm4VG3o+hAGSnkLrCM0uydfa7h8RHXGdLLtcP3cRhOJ6Vk+PpgDdQYxD232nuJWDRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u9JLOF7l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D6AC4AF09;
	Wed, 26 Jun 2024 08:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719389996;
	bh=E4oJGv2ln2F2mkHKg0UbQEmnSuGrODj0fkfA9bN5peI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u9JLOF7l/LQc72Xi9LTPGpSarhpjtdwbfoclqsxQ4iynBlNSbXJk65aStw3Xpoo6k
	 PZMrYCk1rk34uMZuA/XV+5t6IpjQP0sfJvVrXnH/KZzRPGvk4GwEUe1TG33dIuEIsd
	 qAFKqEAowip7IvdR2uU61HTUjklCO15fZNX1m0Tj8k52OYAxrA857O198pLHhlzgce
	 KklT+2wAYffkn6ZOIppL/74dnQFGyT1biwMrXNkZ5XSLn0zBuMRvLKaB7eLrY9m77O
	 V/7It5joG3n9XpJd8UjLFVY/WVviLc/0F93UXaI5fJpYkECg8kxygu9qXZljdZRVQP
	 7ez6oestrwL8g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sMNss-000000000hd-25Eq;
	Wed, 26 Jun 2024 10:20:06 +0200
Date: Wed, 26 Jun 2024 10:20:06 +0200
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
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 8/8] serial: qcom-geni: Rework TX in FIFO mode to fix
 hangs/lockups
Message-ID: <ZnvPNiWWIIsugbhN@hovoldconsulting.com>
References: <20240610222515.3023730-1-dianders@chromium.org>
 <20240610152420.v4.8.I1af05e555c42a9c98435bb7aee0ee60e3dcd015e@changeid>
 <Znlp1_F1u-70D3QQ@hovoldconsulting.com>
 <CAD=FV=XmuKUKvCq7gG+wM-jAAgHLHnYw4NteFEKz5Fmczd=U7g@mail.gmail.com>
 <ZnqoKDnUMxqf7QRy@hovoldconsulting.com>
 <CAD=FV=Ux+ro90xnEEnALiwtjnOk+LT_qaHmE8jS7adWgBPSDbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Ux+ro90xnEEnALiwtjnOk+LT_qaHmE8jS7adWgBPSDbg@mail.gmail.com>

On Tue, Jun 25, 2024 at 07:29:38AM -0700, Doug Anderson wrote:
> On Tue, Jun 25, 2024 at 4:21 AM Johan Hovold <johan@kernel.org> wrote:

> > Right. But with a 16 1-byte word FIFO, we may be able to kick of a
> > really long transfer and just keep it running until it needs to be
> > kicked again (cf. enabling TX). The console code can easily insert
> > characters in the FIFO while the transfer is running (and would only
> > have to wait for 16 characters to drain in the worst case).
> >
> > Effectively, most of the identified issues would just go away, as
> > there's basically never any need to cancel anything except at port
> > shutdown.
> 
> Yeah, though you'd still have to make sure that the corner cases
> worked OK. You'll have to pick _some_ sort of fixed transfer size and
> make sure that all the special cases / console / kdb work if they show
> up right at the end of the transfer.

Yes, there are some details like that would need to be worked out.

> I was also a bit curious if there could be power implications with
> leaving an active TX command always in place. Perhaps geni wouldn't be
> able to drop some resources? Do you happen to know?

Hmm, good point. I'll see if I can ask someone with access to docs.

But I guess we can still continue to stop the command on stop_tx() (as
we are considering anyway) to avoid that.

> > I didn't do an in-depth analysis of the slowdown, but I did rerun the
> > tests now and I'm still seeing a 22-24% slowdown on x1e80100 with rc5.
> > This is a new platform so I compared with sc8280xp, which shows similar
> > numbers even if it's slightly faster to begin with:
> >
> >                                         sc8280xp        x1e80100
> >
> >         rc5 full series                 61 s            67 s
> >         rc5 last patch reverted         50 s            54 s
> >
> > I have a getty running and cat a 10x dmesg file of 543950 bytes to
> > /dev/ttyMSM0 from an ssh session (just catting in a serial console gives
> > similar numbers).
> 
> That's really weird / unexpected. Your hardware should be fancier than
> mine so, if anything, I'd expect it to be faster. Is there something
> causing you really bad interrupt latency or something? ...or is some
> clock misconfigured and "geni" is behaving sub-optimally?

That may be the case. I'm not seeing more interrupts with the last patch
applied, and not more time spent servicing interrupts (based on a quick
look at top), so it may just be geni taking a lot of time to start or
stop commands.

> ...although it wouldn't explain the slowness, I'd at least be a little
> curious if you've confirmed that you're running with a 16-word FIFO
> depth. See the function geni_se_get_tx_fifo_depth() where newer
> hardware can actually have larger FIFO depths.

No, I had confirmed that it is using 16 words (64 bytes).
 
> Just in case it matters, I'd be curious if you have
> `CONFIG_IRQ_TIME_ACCOUNTING=y`

I do, yes.

> Oh: one last thing to confirm: do you have kernel console output
> disabled for your tests? I've been doing tests with the kernel console
> _not_ enabled over the serial port and just an agetty there. I could
> believe things might be different if the kernel console was sending
> messages over the same port.

Yes, there has been no console output during my tests, and I get similar
results with the console disabled.

Johan

