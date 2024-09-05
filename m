Return-Path: <linux-arm-msm+bounces-30862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C47096D272
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 10:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E6FA1F26C53
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 08:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B861953A9;
	Thu,  5 Sep 2024 08:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5F9kJBH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013E819538A;
	Thu,  5 Sep 2024 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725526076; cv=none; b=ipabeDNPkuBdoOV4VbRQCBAsQwhaSz/oa2OY/iAE6Ej7Du/RnPG8i1PlzjwwZBFTxw+c4tQpi/hIf4JyVXWXLrL7SW0LOb7mefiJL/h/lFa1tNIZXAnFYk8BalGH7woQCPpfrAujEGot9H9fZhXkcoAK1KEBUgNKXcAbc3/iPl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725526076; c=relaxed/simple;
	bh=DnSuif62uCCVhEeRI162fm17cbXet/3kgwd0VQ3vzW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAizto+xVmXFxmF0lYq2FipCxvDcZfqr1fKcOo5UOl+opzndpNr29lc9TjOswfrg7v+QppNcLK2SvqrjcAzks0n1EcnmydEqOAqiOcfvykIjVvPmYUhAyfmHQQH89tVNV+aCOYafI2LeW5tzqrzTcPr1WnmyZmx90NAqI9PCvJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5F9kJBH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C041CC4AF09;
	Thu,  5 Sep 2024 08:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725526075;
	bh=DnSuif62uCCVhEeRI162fm17cbXet/3kgwd0VQ3vzW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a5F9kJBHbKVu5NS4eqt9wfG8qyufkBzZopWKazo+jGncJNZ8epN/xCNBaC0hnkoUe
	 MZLHoAXLXgZoFU9fLTl0ee81NBvd7cQJ+UufyCmpXruMRo57IQTkN/pL2LDrQsB7Rp
	 XrtL8oh+Hpw8YGr5oDL3iP5MBfyuq5EYRwYl34f9C+qpc2WQxCoAhQaV/QU5SWP5Hh
	 wwYuXOSRwrT6xh++S/aJjLb0wRjDNlujly5qE0GnVdKEaZBBUrKex3YLdZWgtWDyPQ
	 YWi4fYo4ZaOu26/3+TAlA3EbW2rxlD4Td6S9R4psU4PawVkACOUXFov+zcNEwqAQfM
	 MlsN2bs06o+nA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sm8A1-000000002xD-3oNJ;
	Thu, 05 Sep 2024 10:48:13 +0200
Date: Thu, 5 Sep 2024 10:48:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/8] serial: qcom-geni: fix fifo polling timeout
Message-ID: <ZtlwTQNZTdyzBChw@hovoldconsulting.com>
References: <20240902152451.862-1-johan+linaro@kernel.org>
 <20240902152451.862-2-johan+linaro@kernel.org>
 <CAD=FV=WDx69BqK2MmhOMfKdEUtExo1wWFMY_n3edQhSF7RoWzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WDx69BqK2MmhOMfKdEUtExo1wWFMY_n3edQhSF7RoWzg@mail.gmail.com>

On Wed, Sep 04, 2024 at 02:50:57PM -0700, Doug Anderson wrote:
> On Mon, Sep 2, 2024 at 8:26 AM Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > The qcom_geni_serial_poll_bit() can be used to wait for events like
> > command completion and is supposed to wait for the time it takes to
> > clear a full fifo before timing out.
> >
> > As noted by Doug, the current implementation does not account for start,
> > stop and parity bits when determining the timeout. The helper also does
> > not currently account for the shift register and the two-word
> > intermediate transfer register.
> >
> > Instead of determining the fifo timeout on every call, store the timeout
> > when updating it in set_termios() and wait for up to 19/16 the time it
> > takes to clear the 16 word fifo to account for the shift and
> > intermediate registers. Note that serial core has already added a 20 ms
> > margin to the fifo timeout.
> >
> > Also note that the current uart_fifo_timeout() interface does
> > unnecessary calculations on every call and also did not exists in
> > earlier kernels so only store its result once. This also facilitates
> > backports as earlier kernels can derive the timeout from uport->timeout,
> > which has since been removed.

> > @@ -270,22 +270,21 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
> >  {
> >         u32 reg;
> >         struct qcom_geni_serial_port *port;
> > -       unsigned int baud;
> > -       unsigned int fifo_bits;
> >         unsigned long timeout_us = 20000;
> >         struct qcom_geni_private_data *private_data = uport->private_data;
> >
> >         if (private_data->drv) {
> >                 port = to_dev_port(uport);
> > -               baud = port->baud;
> > -               if (!baud)
> > -                       baud = 115200;
> > -               fifo_bits = port->tx_fifo_depth * port->tx_fifo_width;
> > +
> >                 /*
> > -                * Total polling iterations based on FIFO worth of bytes to be
> > -                * sent at current baud. Add a little fluff to the wait.
> > +                * Wait up to 19/16 the time it would take to clear a full
> > +                * FIFO, which accounts for the three words in the shift and
> > +                * intermediate registers.
> > +                *
> > +                * Note that fifo_timeout_us already has a 20 ms margin.
> >                  */
> > -               timeout_us = ((fifo_bits * USEC_PER_SEC) / baud) + 500;
> > +               if (port->fifo_timeout_us)
> > +                       timeout_us = 19 * port->fifo_timeout_us / 16;
> 
> It made me giggle a bit that part of the justification for caching
> "fifo_timeout_us" was to avoid calculations each time through the
> function. ...but then the code does the "19/16" math here instead of
> just including it in the cache. ;-) ;-) ;-)

Heh, yeah, but I was really talking about uart_fifo_timeout() doing
unnecessary calculations on each call (and that value used to be
calculated once and stored for later use).

I also realised that we need to account for the intermediate register
after I wrote the initial commit message, and before that this was just
a shift and add.

> That being said, I'm not really a fan of the "19 / 16" anyway. The 16
> value is calculated elsewhere in the code as:
> 
> port->tx_fifo_depth = geni_se_get_tx_fifo_depth(&port->se);
> port->tx_fifo_width = geni_se_get_tx_fifo_width(&port->se);
> port->rx_fifo_depth = geni_se_get_rx_fifo_depth(&port->se);
> uport->fifosize =
>   (port->tx_fifo_depth * port->tx_fifo_width) / BITS_PER_BYTE;
> 
> ...and here you're just hardcoding it to 16. Then there's also the
> fact that the "19 / 16" will also multiply the 20 ms "slop" added by
> uart_fifo_timeout() which doesn't seem ideal.

Indeed, and the early console code also hardcodes this to 16.

I don't care about the slop being 20 ms or 23.5, this is just a timeout
for the error case.

This will over count a bit if there is uart hw with 256 B fifos, but
could potentially undercount if there is hw with less than 16 words. I'm
not sure if such hw exists, but I'll see what I can find out.

> How about this: we just change "uport->fifosize" to account for the 3
> extra words? So it can be:
> 
> ((port->tx_fifo_depth + 3) * port->tx_fifo_width) / BITS_PER_BYTE;
> 
> ...then the cache will be correct and everything will work out. What
> do you think?

I don't think uart_fifo_timeout traditionally accounts for the shift
register and we wait up to *twice* the time it takes to clear to fifo
anyway (in wait_until_sent). The intermediate register I found here
could perhaps be considered part of the fifo however.

I'll give this some more thought.

Johan

