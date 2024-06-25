Return-Path: <linux-arm-msm+bounces-24095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C18C091660F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 13:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 003181C21BDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 11:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E911494A0;
	Tue, 25 Jun 2024 11:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qfmEArOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1555817BCC;
	Tue, 25 Jun 2024 11:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719314465; cv=none; b=VJ2Zao6T6sQc2zF6qXTbWXCd2igsZPh1RdT0bK85y33kW8krug6tAYaiKmPbA2lijosRk4B0U022WSAHGHEEpo0OYldNXunaHrfVd2aeKMA0do2J3KA0cFNIVk8+UoyHlc3At2qCIy3k7Zvx56CTDhPoTy0xR+kA58uP4lp0FdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719314465; c=relaxed/simple;
	bh=qOGaxfsfM5iSyfa788L/8bzOZXv6TrPtFFQKAZc4E4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9DbiRgpRIXp/hAPFEC1adZaKBIo19YKskbPhq8y+zcQp8UfMlFMs6bZVvlMqjWAGOWZb9NL9EM6n0tvUGzJ3Hs3Ujl+3VUqLeK3jidEa6myyGLKBDRNyUJZ1VDAd19i1O95q/rWGdE0zdxjEA00dLgZ0W1TB6UHqFD0TuPNcVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qfmEArOl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D13CC32781;
	Tue, 25 Jun 2024 11:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719314464;
	bh=qOGaxfsfM5iSyfa788L/8bzOZXv6TrPtFFQKAZc4E4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qfmEArOlYEgMbTlry56ebv1Pl5/Rz4cwO95FE0Q+i+xziu88qSGFhizZkAXQ0SV3X
	 EvJiKaquyr6X5N1emlau22G9eOgsIx30bserkZ8EN9dVYjdBpLBs/2gZYNJS0t8LE+
	 RQkDGSEwbHf/JwaD+4lLUCfsE2cRura+HaaQbnLB8lQ99NGgBYL0v7zNMw/gg5gVU3
	 +EPbIFW2nzM4fsRza0qSdIOBSDIvKaDdu7N+ZdJHlMJenoucs81voATqBqfOxLRil4
	 UI9SBmTEe7COieYPoLHIB6FiLDzabc5GUvm0mvGpHL0UMAJ7s3PWeIERXZbYsi/c/c
	 yY+2VIafdUO+Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sM4Ea-000000002rA-0j0F;
	Tue, 25 Jun 2024 13:21:12 +0200
Date: Tue, 25 Jun 2024 13:21:12 +0200
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
Message-ID: <ZnqoKDnUMxqf7QRy@hovoldconsulting.com>
References: <20240610222515.3023730-1-dianders@chromium.org>
 <20240610152420.v4.8.I1af05e555c42a9c98435bb7aee0ee60e3dcd015e@changeid>
 <Znlp1_F1u-70D3QQ@hovoldconsulting.com>
 <CAD=FV=XmuKUKvCq7gG+wM-jAAgHLHnYw4NteFEKz5Fmczd=U7g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XmuKUKvCq7gG+wM-jAAgHLHnYw4NteFEKz5Fmczd=U7g@mail.gmail.com>

On Mon, Jun 24, 2024 at 02:15:07PM -0700, Doug Anderson wrote:
> On Mon, Jun 24, 2024 at 5:43 AM Johan Hovold <johan@kernel.org> wrote:

> > As I mentioned last week, the slowdown from this is quite noticeable
> > (e.g. 25% slowdown at @115200), but this may be the price we need to pay
> > for correctness, at least temporarily.
> >
> > An alternative might be to switch to using a 16 byte fifo. This should
> > reduce console latency even further, and may be able avoid the idling
> > UART penalty by continuing to use the watermark interrupt for refilling
> > the FIFO.
> 
> I'm a bit confused. Right now we're using (effectively) a 64-byte
> FIFO. The FIFO is 16-words deep and we have 4 bytes per word. ...so
> I'm not sure what you mean by switching to a 16-byte FIFO. Do you mean
> to make less use of the FIFO, or something else?

I meant switching to using one-byte words so that we end up with a
16-byte FIFO where we don't have the issue of adding more data when the
last word is not a full four-byte one.

> Overall the big problem I found in all my testing was that I needed to
> wait for a "command done" before kicking off a new command. When the
> "command done" arrives then the UART has stopped transmitting and
> you've got to suffer an interrupt latency before you can start
> transferring again. Essentially:
> 
> 1. Pick a transfer size.
> 2. You can keep sending bytes / using the FIFO efficiently as long as
> there are still bytes left in the transfer.
> 3. When you get to the end of the transfer, you have to wait for the
> UART to stop, report that it's done, and then suffer an interrupt
> latency to start a new transfer.
> 
> So to be efficient you want to pick a big transfer size but if there's
> any chance that you might not need to transfer that many bytes then
> you need to figure out what to do. If you can handle that properly
> then that's great. If not then we have to make sure we never kick off
> a transfer that we might not finish.

Right. But with a 16 1-byte word FIFO, we may be able to kick of a
really long transfer and just keep it running until it needs to be
kicked again (cf. enabling TX). The console code can easily insert
characters in the FIFO while the transfer is running (and would only
have to wait for 16 characters to drain in the worst case).

Effectively, most of the identified issues would just go away, as
there's basically never any need to cancel anything except at port
shutdown.

> I'd also mention that, as talked about in my response to your other
> patch [1], I'm not seeing a 25% slowdown. I tested both with my simple
> proposal and with this whole series applied and my slowdown is less
> than 2%. I guess there must be something different with your setup?
> Trying to think about what kind of slowdown would be reasonable for my
> patch series at 115200:
> 
> a) We send 64 bytes efficiently, which takes 5.6ms (64 * 1000 / 11520)
> 
> b) We stop transferring and wait for an interrupt.
> 
> c) We start transferring 64 bytes again.
> 
> Let's say that your interrupt latency is 1 ms, which would be really
> terrible. In that case you'll essentially transfer 64 bytes in 6.6ms
> instead of 5.6 ms, right? That would be an 18% hit. Let's imagine
> something more sensible and say that most of the time you can handle
> an interrupt in 100 ms. That would be about a 1.7% slowdown, which
> actually matches what I was seeing. For reference, even an old arm32
> rk3288-veyron device I worked with years ago could usually handle
> interrupts in ~100-200 ms since dwc2 needs you to handle at least one
> (sometimes more) interrupt per USB uFrame (250ms).
> 
> ...so I'm confused about where your 25% number is coming from...

I didn't do an in-depth analysis of the slowdown, but I did rerun the
tests now and I'm still seeing a 22-24% slowdown on x1e80100 with rc5.
This is a new platform so I compared with sc8280xp, which shows similar
numbers even if it's slightly faster to begin with:

					sc8280xp	x1e80100

	rc5 full series			61 s		67 s
	rc5 last patch reverted		50 s		54 s

I have a getty running and cat a 10x dmesg file of 543950 bytes to
/dev/ttyMSM0 from an ssh session (just catting in a serial console gives
similar numbers). 

Johan

