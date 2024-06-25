Return-Path: <linux-arm-msm+bounces-24109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C104916A6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 16:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8048A1C21E6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 14:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7B516EBEB;
	Tue, 25 Jun 2024 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CtfLi9kB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB22517082C
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 14:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719325800; cv=none; b=H8RY0o3dGHTvjxAFDPCw8KdP7I1oCs72LfPSohyx/TNtj/J4KK/YFCqmPiegcECEGuQEt8fPDYF153HnqfHK9n6pY0mA0UdYAOxhER7CP8csr7b0rx8L9ghLItsykImocXhoW8A3TPprskF7OeMMbUxwUTZFH/grOkUPSuSLe8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719325800; c=relaxed/simple;
	bh=3EIzMljfAaU3wCaMbC7Pba/i+sfkfKx7n6Gz4/CnmUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQpDW5lgejKGLAGb2RliD30JR9ftPradAHhH6lGBCSHZG+PjHNVhyPyLEe5SetcgJcQoaqMAeR2DwyoPqRNpXhVqYQ3YeKW0jLbVNRlE8R2JH5GsjwzFvvq0IwYePv46WPziY0INwJYzi0grqSvTeG1VhAbSdjp7zWrPiRTxIeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CtfLi9kB; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5b9794dad09so2578114eaf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 07:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719325796; x=1719930596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rE7xcwL4aw1Y8733YCjFqr/6uCmUd8iYLZuXHEHpnO4=;
        b=CtfLi9kB1oqIpKlyfuSoqOwerBPY9xW0BYbmJHyOtUhbV1q6l2+iebFAQvqkGGyMp3
         kbw4NEcUTwySAqUUmpvNucAM47FYjG7X4AtK2NQ3jopRlg9hpjUNSuXs4FyYnEXWextT
         qIZSNRsIB9ghvooniRmjy6lzg23RF8NJwlWPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719325796; x=1719930596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rE7xcwL4aw1Y8733YCjFqr/6uCmUd8iYLZuXHEHpnO4=;
        b=Ny+kfWca8U8/4jC2C0NZRloFcLnsX2ee/Ia4ATXWcqBhZGgCuNBKjU4dEWMhgyyF2S
         8Lm7Ns/OkhkfluEE7Un/7xvHJo84rz5+8OLZ1TE8lWAJIp9p86S3eeTyG6tckf2AI501
         xzdZ9XtttBQFiDcwjkdYm8Vg46tZklCytkKLERbTtRn1ceV51PeffSME1XtgB62QJwrH
         uJ2H6vUnbv6tV8ORJJapot7mQ1FwHaglEEjwB6A8yGvi5EYqKxq5OevRr/bYlkyh23BZ
         9UrXDHggCpDvl3ZdFGDVbmYbt6YZMNSsscoFyM4HHe5AucqNWn7kKSoKc22AJrUM/vy7
         jAhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsscZXaAc9JrURgpv0eDv4ZNd5Z+6OM4bhmIoViDmP6nt7jNTIOOrLiWB01h5g1ckHYkKRFne5Gc+N7ivx4WbWZX/9s5PAD5oHD6BTmA==
X-Gm-Message-State: AOJu0YxRR51xSt26ohJO4t2aXtL+nKuAWzRSgQwW3gMUJZxbTCuEHQUo
	3lPsAYW3WiID4h/T1xz3tDfD68FJ8l1x4XkXW+jSkEt/k9u24nhPRccH/evasy48B0xikG+RUSo
	=
X-Google-Smtp-Source: AGHT+IFCTd3BGvYmUkomMPkclLk8ZjS37K4K4HPsnRJ89LDXFjAY2CQeH9P3PToo0nBlNkvxUy1sgw==
X-Received: by 2002:a05:6358:2908:b0:19f:40ab:e82b with SMTP id e5c5f4694b2df-1a2389dd6b5mr1069466755d.10.1719325796059;
        Tue, 25 Jun 2024 07:29:56 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b51ecfe7a9sm44483796d6.27.2024.06.25.07.29.55
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 07:29:55 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-444fe7e9f11so153651cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 07:29:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGKjevikjQEqejxgwbiPG2PWmrEhQuoMSAj0EeLPoWoOa5IcrKxf9S5AFE8Oqgw8FntqMe1vJY3y9Cnm+ordgtobvms0Hxmlh0EQYSPw==
X-Received: by 2002:a05:622a:18a9:b0:444:ee24:8dc8 with SMTP id
 d75a77b69052e-444f2566c83mr3834021cf.22.1719325794420; Tue, 25 Jun 2024
 07:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610222515.3023730-1-dianders@chromium.org>
 <20240610152420.v4.8.I1af05e555c42a9c98435bb7aee0ee60e3dcd015e@changeid>
 <Znlp1_F1u-70D3QQ@hovoldconsulting.com> <CAD=FV=XmuKUKvCq7gG+wM-jAAgHLHnYw4NteFEKz5Fmczd=U7g@mail.gmail.com>
 <ZnqoKDnUMxqf7QRy@hovoldconsulting.com>
In-Reply-To: <ZnqoKDnUMxqf7QRy@hovoldconsulting.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Jun 2024 07:29:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ux+ro90xnEEnALiwtjnOk+LT_qaHmE8jS7adWgBPSDbg@mail.gmail.com>
Message-ID: <CAD=FV=Ux+ro90xnEEnALiwtjnOk+LT_qaHmE8jS7adWgBPSDbg@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] serial: qcom-geni: Rework TX in FIFO mode to fix hangs/lockups
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Yicong Yang <yangyicong@hisilicon.com>, Tony Lindgren <tony@atomide.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johan Hovold <johan+linaro@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Stephen Boyd <swboyd@chromium.org>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 25, 2024 at 4:21=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Mon, Jun 24, 2024 at 02:15:07PM -0700, Doug Anderson wrote:
> > On Mon, Jun 24, 2024 at 5:43=E2=80=AFAM Johan Hovold <johan@kernel.org>=
 wrote:
>
> > > As I mentioned last week, the slowdown from this is quite noticeable
> > > (e.g. 25% slowdown at @115200), but this may be the price we need to =
pay
> > > for correctness, at least temporarily.
> > >
> > > An alternative might be to switch to using a 16 byte fifo. This shoul=
d
> > > reduce console latency even further, and may be able avoid the idling
> > > UART penalty by continuing to use the watermark interrupt for refilli=
ng
> > > the FIFO.
> >
> > I'm a bit confused. Right now we're using (effectively) a 64-byte
> > FIFO. The FIFO is 16-words deep and we have 4 bytes per word. ...so
> > I'm not sure what you mean by switching to a 16-byte FIFO. Do you mean
> > to make less use of the FIFO, or something else?
>
> I meant switching to using one-byte words so that we end up with a
> 16-byte FIFO where we don't have the issue of adding more data when the
> last word is not a full four-byte one.

Ah, I get it! I guess I would have described it as 1-byte per FIFO word.

Certainly that seems like something that's worth trying but, at least
in the past, I remember getting noticeably worse performance with it.
We used to be in that mode when kdb was enabled which I run with most
of the time. Depending on what you set the watermark level to you may
either end up spending a lot more resources servicing interrupts or
you might end up back in the case where you're stalling the transfer
because you couldn't service the interrupt fast enough. At 115.2, each
byte is about 87 microseconds, and draining a 16-byte FIFO is about
1.4ms. If you set the watermark at halfway then you'll get an
interrupt every 8 bytes or ~8x as many interrupts as with my patch
series. You'll also stall any time your interrupt latency is worse
than 694 microseconds. Hopefully that's not too often, though the
slowdowns you measured below make me worried.


> > Overall the big problem I found in all my testing was that I needed to
> > wait for a "command done" before kicking off a new command. When the
> > "command done" arrives then the UART has stopped transmitting and
> > you've got to suffer an interrupt latency before you can start
> > transferring again. Essentially:
> >
> > 1. Pick a transfer size.
> > 2. You can keep sending bytes / using the FIFO efficiently as long as
> > there are still bytes left in the transfer.
> > 3. When you get to the end of the transfer, you have to wait for the
> > UART to stop, report that it's done, and then suffer an interrupt
> > latency to start a new transfer.
> >
> > So to be efficient you want to pick a big transfer size but if there's
> > any chance that you might not need to transfer that many bytes then
> > you need to figure out what to do. If you can handle that properly
> > then that's great. If not then we have to make sure we never kick off
> > a transfer that we might not finish.
>
> Right. But with a 16 1-byte word FIFO, we may be able to kick of a
> really long transfer and just keep it running until it needs to be
> kicked again (cf. enabling TX). The console code can easily insert
> characters in the FIFO while the transfer is running (and would only
> have to wait for 16 characters to drain in the worst case).
>
> Effectively, most of the identified issues would just go away, as
> there's basically never any need to cancel anything except at port
> shutdown.

Yeah, though you'd still have to make sure that the corner cases
worked OK. You'll have to pick _some_ sort of fixed transfer size and
make sure that all the special cases / console / kdb work if they show
up right at the end of the transfer.

I was also a bit curious if there could be power implications with
leaving an active TX command always in place. Perhaps geni wouldn't be
able to drop some resources? Do you happen to know?


> > I'd also mention that, as talked about in my response to your other
> > patch [1], I'm not seeing a 25% slowdown. I tested both with my simple
> > proposal and with this whole series applied and my slowdown is less
> > than 2%. I guess there must be something different with your setup?
> > Trying to think about what kind of slowdown would be reasonable for my
> > patch series at 115200:
> >
> > a) We send 64 bytes efficiently, which takes 5.6ms (64 * 1000 / 11520)
> >
> > b) We stop transferring and wait for an interrupt.
> >
> > c) We start transferring 64 bytes again.
> >
> > Let's say that your interrupt latency is 1 ms, which would be really
> > terrible. In that case you'll essentially transfer 64 bytes in 6.6ms
> > instead of 5.6 ms, right? That would be an 18% hit. Let's imagine
> > something more sensible and say that most of the time you can handle
> > an interrupt in 100 ms. That would be about a 1.7% slowdown, which
> > actually matches what I was seeing. For reference, even an old arm32
> > rk3288-veyron device I worked with years ago could usually handle
> > interrupts in ~100-200 ms since dwc2 needs you to handle at least one
> > (sometimes more) interrupt per USB uFrame (250ms).
> >
> > ...so I'm confused about where your 25% number is coming from...
>
> I didn't do an in-depth analysis of the slowdown, but I did rerun the
> tests now and I'm still seeing a 22-24% slowdown on x1e80100 with rc5.
> This is a new platform so I compared with sc8280xp, which shows similar
> numbers even if it's slightly faster to begin with:
>
>                                         sc8280xp        x1e80100
>
>         rc5 full series                 61 s            67 s
>         rc5 last patch reverted         50 s            54 s
>
> I have a getty running and cat a 10x dmesg file of 543950 bytes to
> /dev/ttyMSM0 from an ssh session (just catting in a serial console gives
> similar numbers).

That's really weird / unexpected. Your hardware should be fancier than
mine so, if anything, I'd expect it to be faster. Is there something
causing you really bad interrupt latency or something? ...or is some
clock misconfigured and "geni" is behaving sub-optimally?

...although it wouldn't explain the slowness, I'd at least be a little
curious if you've confirmed that you're running with a 16-word FIFO
depth. See the function geni_se_get_tx_fifo_depth() where newer
hardware can actually have larger FIFO depths.

Just in case it matters, I'd be curious if you have
`CONFIG_IRQ_TIME_ACCOUNTING=3Dy`

Oh: one last thing to confirm: do you have kernel console output
disabled for your tests? I've been doing tests with the kernel console
_not_ enabled over the serial port and just an agetty there. I could
believe things might be different if the kernel console was sending
messages over the same port.

-Doug

