Return-Path: <linux-arm-msm+bounces-25876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C6B92D771
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 19:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0E12B23804
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 17:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E128C1953AD;
	Wed, 10 Jul 2024 17:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y/RWQiaZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DBE194C6B;
	Wed, 10 Jul 2024 17:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720632531; cv=none; b=Nwt2TnzkxU6huRsFoA35U/9MwBDG8Bal5+L8K9pfeBh3FrPjlBXmQfEZpVgqHCE8MUybZKvpvcI1uQ4V4gBox7qWiBcYLcOTmz9fY44utO2K7PhojkTl6cufDIcAojua3U9U599NnQaHRMr9/0AQ7Uw6hCPF1oiSt8gAOm4gBjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720632531; c=relaxed/simple;
	bh=5Xk4Xbfd3WIhHpgUktRaEnY5fFHxsXcztYNHjuTPoF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFVCTV6y33gbBU/EbNrQHTt3IsJ4PTOBLO9VbQp+jQplap1mB6iUc2d1pszLk0ILTSGD0D32Qd0v4tP2csxcJih0hglv4z1DtZQDk/0SdFUsp0p+QsD89yX1M3DnFqLsDTePEt0fvcdEaq1wPSjIC51iIF2FXibe+lHmK+MjKw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y/RWQiaZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE788C32781;
	Wed, 10 Jul 2024 17:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720632531;
	bh=5Xk4Xbfd3WIhHpgUktRaEnY5fFHxsXcztYNHjuTPoF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y/RWQiaZFA051PwvVEBVfz/N2/q1U3ibFkb66lt/lJ83OBnv+2VDQRlwhi/XnmoA4
	 znFCQTgnl52cUb7fnO85shzqK/uivwY7jPoXDhTp8Bn/KPf3rqTIMvQeyuCTg1QHpg
	 l5GtnBhVVuTAcloKqsUnk08DfQUPPyUfF3cDT2+s=
Date: Wed, 10 Jul 2024 19:28:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH] serial: qcom-geni: Show '@' characters if we have a FIFO
 underrun
Message-ID: <2024071035-prize-puppy-a288@gregkh>
References: <20240709162841.1.I93bf39f29d1887c46c74fbf8d4b937f6497cdfaa@changeid>
 <2024071001-justice-catfight-37f0@gregkh>
 <CAD=FV=XX0+jE28CRQmWu9Q09KRf5ZbqLYizmem8kk6ajX05qfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XX0+jE28CRQmWu9Q09KRf5ZbqLYizmem8kk6ajX05qfw@mail.gmail.com>

On Wed, Jul 10, 2024 at 09:01:10AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Jul 9, 2024 at 10:35 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Jul 09, 2024 at 04:28:45PM -0700, Douglas Anderson wrote:
> > > As of commit 2ac33975abda ("serial: qcom-geni: do not kill the machine
> > > on fifo underrun") a FIFO underrun will no longer hard lockup the
> > > machine. Instead, a FIFO underrun will cause the UART to output a
> > > bunch of '\0' characters. The '\0' characters don't seem to show up on
> > > most terminal programs and this hides the fact that we had an
> > > underrun. An underrun is aq sign of problems in the driver and
> > > should be obvious / debugged.
> > >
> > > Change the driver to put '@' characters in the case of an underrun
> > > which should make it much more obvious.
> > >
> > > Adding this extra initialization doesn't add any real overhead. In
> > > fact, this patch reduces code size because the code was calling
> > > memset() to init 4 bytes of data. Disassembling the new code shows
> > > that early in the function w22 is setup to hold the '@@@@' constant:
> > >   mov     w22, #0x40404040
> > >
> > > Each time through the loop w22 is simply stored:
> > >   str     w22, [sp, #4]
> > >
> > > Cc: Johan Hovold <johan@kernel.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > >  drivers/tty/serial/qcom_geni_serial.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > > index 69a632fefc41..332eaa2faa2b 100644
> > > --- a/drivers/tty/serial/qcom_geni_serial.c
> > > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > > @@ -872,10 +872,10 @@ static void qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
> > >  {
> > >       struct qcom_geni_serial_port *port = to_dev_port(uport);
> > >       unsigned int tx_bytes, remaining = chunk;
> > > -     u8 buf[BYTES_PER_FIFO_WORD];
> > >
> > >       while (remaining) {
> > > -             memset(buf, 0, sizeof(buf));
> > > +             u8 buf[BYTES_PER_FIFO_WORD] = { '@', '@', '@', '@' };
> >
> > Why is '@' a valid character for an underrun?  Why would any characters
> > be ok?  Where is this now documented?
> 
> '@' is arbitrary. If you have a different character suggestion then
> I'm happy to change it. I'm mostly looking for something other than
> '\0' to be printed out in the case of underruns, which is what happens
> now. Printing out '\0' is much harder to notice but could still end up
> causing problems with file transfers / automated programs trying to
> work with serial data.

Any character is "wrong", so picking this one feels odd.

Do we know when an underrun happens?  If so, handle that error.  If not,
well, something else is really wrong with this uart then (why are people
making new uarts still...)

> NOTE: this is not an underrun in the sense that we didn't get an
> interrupt fast enough or that we couldn't keep up. This is an underrun
> that could only happen as a result of a bug in the driver. The driver
> should not ever get into this situation.

But obviously it has otherwise you wouldn't have seen it, right?

> I have no idea where one would document something like this. Do you
> have any suggestions? I'm happy to add a comment in the code saying
> that the '@' should never show up but if it does then that's a driver
> bug.
> 
> 
> > And shouldn't you use a memset to get the BYTES_PER_FIFO_WORD amount of
> > '@' here?
> 
> That feels like overkill and results in much less efficient code, but
> I can change it to that if you want.

Are you sure it will?  Constant memcopies should be really fast by the
compiler these days.

> Let me know. In this case
> BYTES_PER_FIFO_WORD is more of a constant to add to readability than
> something that we'd expect to change. Technically, the hardware can
> handle BYTES_PER_FIFO_WORD of 1/2/4, but if we changed that there
> would be a bunch of places in the driver that would need to change. In
> this case if someone wanted to try to change it to something other
> than 4 at least we'd get a compile error.

So this is a define that can never be changed?

Anyway, I don't know what to suggest here.  If this is something that
can happen, handle it properly.  If it can't, then why are we having
this discussion?  :)

thanks,

greg k-h

