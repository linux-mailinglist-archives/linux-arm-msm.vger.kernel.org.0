Return-Path: <linux-arm-msm+bounces-25884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC5492D8BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 21:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14CAF284C37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 19:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF0A19347B;
	Wed, 10 Jul 2024 19:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GOAAkAcJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0F8197A7B;
	Wed, 10 Jul 2024 19:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720638222; cv=none; b=Y4n9JMxX83+zumWhbzNX7tzX8UcQSUXVJRaxKdzhwchfvHXrWhcOh75GprnUK/Pqtq84tG37MY7cYp1Bn5nH6D8njTwqPC7RDDCa0GrQaqUJc4EKie9p3hmjyU9GFFgOJRDht1z9dwKma/DcghZs9IiESqnCCUNA9s10IZy6g8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720638222; c=relaxed/simple;
	bh=H8Px+EITRJFQ+tffYGlNxGy4zN6vgO6jywG9xJg8rB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E82rI7oplUtEiji4wVrT7HZfmt7Idw6pZn40ZOcHUt6KGYuG1ymSBk6ta7wmuw0MF3qYjjPcE7UrzM1zbZ9k9IXsVEXFlo57TylRk6/6ofBoDH/0PJgHkeWq/wPRFE6C/MnN6qfvq0L/eNxnqnKJcvuf9F+b0Vbrax1qs7q2sFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GOAAkAcJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281CBC32781;
	Wed, 10 Jul 2024 19:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720638221;
	bh=H8Px+EITRJFQ+tffYGlNxGy4zN6vgO6jywG9xJg8rB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GOAAkAcJ4lx8MKoSGM6dBaoEpeq1l5gp3gi70dBWvQPPgWsVRX4fApfMM0X5UdIoP
	 DbyFsEdY0yi8eTGNRulBl6ahrCxIEH8BZY7jMw2kniiFpMkAU/vp9BXdIdX6yg+7Xb
	 q+0SsCVA/MKj8rOGOdNhteGzr2QZEQtKon2Hr88A=
Date: Wed, 10 Jul 2024 21:03:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH] serial: qcom-geni: Show '@' characters if we have a FIFO
 underrun
Message-ID: <2024071002-heftiness-situated-6987@gregkh>
References: <20240709162841.1.I93bf39f29d1887c46c74fbf8d4b937f6497cdfaa@changeid>
 <2024071001-justice-catfight-37f0@gregkh>
 <CAD=FV=XX0+jE28CRQmWu9Q09KRf5ZbqLYizmem8kk6ajX05qfw@mail.gmail.com>
 <2024071035-prize-puppy-a288@gregkh>
 <CAD=FV=XQ5Qd1VEcM30ztLY2e4mjTg4Ft6pJt=o-By38eNrtW=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XQ5Qd1VEcM30ztLY2e4mjTg4Ft6pJt=o-By38eNrtW=Q@mail.gmail.com>

On Wed, Jul 10, 2024 at 10:47:16AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jul 10, 2024 at 10:28 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Jul 10, 2024 at 09:01:10AM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Tue, Jul 9, 2024 at 10:35 PM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Tue, Jul 09, 2024 at 04:28:45PM -0700, Douglas Anderson wrote:
> > > > > As of commit 2ac33975abda ("serial: qcom-geni: do not kill the machine
> > > > > on fifo underrun") a FIFO underrun will no longer hard lockup the
> > > > > machine. Instead, a FIFO underrun will cause the UART to output a
> > > > > bunch of '\0' characters. The '\0' characters don't seem to show up on
> > > > > most terminal programs and this hides the fact that we had an
> > > > > underrun. An underrun is aq sign of problems in the driver and
> > > > > should be obvious / debugged.
> > > > >
> > > > > Change the driver to put '@' characters in the case of an underrun
> > > > > which should make it much more obvious.
> > > > >
> > > > > Adding this extra initialization doesn't add any real overhead. In
> > > > > fact, this patch reduces code size because the code was calling
> > > > > memset() to init 4 bytes of data. Disassembling the new code shows
> > > > > that early in the function w22 is setup to hold the '@@@@' constant:
> > > > >   mov     w22, #0x40404040
> > > > >
> > > > > Each time through the loop w22 is simply stored:
> > > > >   str     w22, [sp, #4]
> > > > >
> > > > > Cc: Johan Hovold <johan@kernel.org>
> > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > ---
> > > > >
> > > > >  drivers/tty/serial/qcom_geni_serial.c | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > > > > index 69a632fefc41..332eaa2faa2b 100644
> > > > > --- a/drivers/tty/serial/qcom_geni_serial.c
> > > > > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > > > > @@ -872,10 +872,10 @@ static void qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
> > > > >  {
> > > > >       struct qcom_geni_serial_port *port = to_dev_port(uport);
> > > > >       unsigned int tx_bytes, remaining = chunk;
> > > > > -     u8 buf[BYTES_PER_FIFO_WORD];
> > > > >
> > > > >       while (remaining) {
> > > > > -             memset(buf, 0, sizeof(buf));
> > > > > +             u8 buf[BYTES_PER_FIFO_WORD] = { '@', '@', '@', '@' };
> > > >
> > > > Why is '@' a valid character for an underrun?  Why would any characters
> > > > be ok?  Where is this now documented?
> > >
> > > '@' is arbitrary. If you have a different character suggestion then
> > > I'm happy to change it. I'm mostly looking for something other than
> > > '\0' to be printed out in the case of underruns, which is what happens
> > > now. Printing out '\0' is much harder to notice but could still end up
> > > causing problems with file transfers / automated programs trying to
> > > work with serial data.
> >
> > Any character is "wrong", so picking this one feels odd.
> >
> > Do we know when an underrun happens?  If so, handle that error.  If not,
> > well, something else is really wrong with this uart then
> 
> It no longer happens. Johan's recent patches fixed it. Quick history:
> 
> 1. Pre-kfifo, we used to output stale characters (ones that had been
> dropped) in the FIFO underrun case. Nobody noticed for years.
> 
> 2. After kfifo we got a hard lockup.
> 
> 3. Johan's early patches to fix the hard lockup caused us to output
> '\0' characters upon FIFO underrun. It was not obvious that the '\0'
> characters were being output. To make it easier to debug / see, both
> he and I locally made it output some other character which was more
> obvious.
> 
> 4. Johan fixed the FIFO underrun.
> 
> 5. Johan added a patch such that if we ever get another FIFO underrun
> in the future we'll output '\0' characters in the FIFO instead of
> getting a hard lockup.
> 
> If we're really confident that we can't get a FIFO underun we could
> just revert commit 2ac33975abda ("serial: qcom-geni: do not kill the
> machine on fifo underrun") and we'll get a hard lockup if we ever
> underrun. IMO, though, it's better to output _something_ in this case
> to make it more obvious. If you hate this patch, though, fine. Let's
> drop it and we'll hope that either we never introduce a bug causing a
> FIFO underrun in the future or that someone notices the '\0'
> characters.

Let's just drop this one, if \0 are seen, that's a good enough character
as any to send when something bad happens.

thanks,

greg k-h

