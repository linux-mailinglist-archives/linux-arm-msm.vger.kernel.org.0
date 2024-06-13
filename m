Return-Path: <linux-arm-msm+bounces-22588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4AB9074A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 16:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B1181F213C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 14:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B3D1DFFC;
	Thu, 13 Jun 2024 14:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ErVqrhLm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8BB10F9
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 14:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718287758; cv=none; b=hTytAlbybZa3MQ9AYXIvRmZNQ8Yb95NwfFePPiE2/8U2/HDIILBmj3hBWfH+q2UsA8i4iSn4/fh1RfIvzfSDR6Gq0px11X3fj+SvLLV4NiMG4RMLul1KzpMXrGjgRlyJaEqKII5U/Apm8D3af6k8psRrnUnP4kDFovj+DlTKRoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718287758; c=relaxed/simple;
	bh=mH1sIFrMKVp2VTZGTEn6etrgD7V5Q/aaBfZYJ9JQGL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NU9Gn9xZxP0h4PXpDtP2ZK55q8Bp9ZIMuxWThunJVH198OErjIOg1Cku8NHMkMV4kDa/FYmyObRDfbflfk6SKVQjZWGC6I67cz9Yx5SURvExQAKAq6ilJn3o2fzPf9dzGwX4O6pNQD5YCNBrIY3n3MjcaFUd853JbDPTLtb9VbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ErVqrhLm; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-797a8cfc4ecso63106885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 07:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718287755; x=1718892555; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVfQj5frZvhfPIr2bLnPL/vOVro3gTAkFcKcEKhSFvQ=;
        b=ErVqrhLmvDeHFKVpxECiH0Ou0lw5m5Lfk18YCFdYdIjsgEhcS00yv2VgphOQofn9T5
         K6owNoL0Fe1um64EO9qELayp0sEIW4pUBBdCGxhy8fN/+i++pL668PfUE7Dj+c58laCk
         biPihsy9bs6sJz4VnNsVNMSgxhYDZDnJ1VgC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718287755; x=1718892555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVfQj5frZvhfPIr2bLnPL/vOVro3gTAkFcKcEKhSFvQ=;
        b=jJhc69ivNRGBYLVNdoGOP9E92VsKAc6qT1me3TlXN6yfpUuMIWa4RWzc/8X2XvfB16
         3msw5fARTAXE6Vup7rbOSioSalWrxKwr9/o8xlkiyVg8jZPWDRo5Fj4OJsAQUnwplEeD
         uwN2SCyfovVIrA3hfWcOV+yKfKXUHWCVjJ4u0K7DyPrnlanQvw6r31SeMaQ/2BSBmV4Q
         tXsOjszP5ArZMgDaMysPvtTLJa6a9zvSl/qpkAhJ9t4Jfmrj4KASg+4cMy2sPkZZGAcG
         ZaXqiRZZ0WocYKDTyVhaZJpX2WEWsJPE+qtDY9piKOd9VwgUgS5aFeFZcTIqFG3EANGb
         77XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXuVqYZQ92I6dRWmIOC8GHLHXRE8Q4k08uv/8vmEEkcTnLazyANOd6UYiTsb2mW2raIMOuZepZDZAOOTVtBTT0lUxxVwtIFt1+3BQ7Qg==
X-Gm-Message-State: AOJu0Yzo2GQ6oiwBfMQhjAo9PNwYUb3bDG4uwOImV+p2dIaUdbqjlV0H
	SHmvKGtrM3Rpsd/X6AHMQpgvtHTkAAmTomV3L7WG+/+h6FDdMGzMf3B67eqKvAOGjdTMnZucBz8
	=
X-Google-Smtp-Source: AGHT+IF+WLHa8oUGuZqe7l/GA1NDsQZ5rR3XdngI9zSpxOcK/SzS2ClJ7vK6LKeHWb+k0fYne8QLuA==
X-Received: by 2002:a05:620a:1a2a:b0:795:512e:4ae1 with SMTP id af79cd13be357-797f605a114mr507425485a.35.1718287755093;
        Thu, 13 Jun 2024 07:09:15 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441ef4f277esm6447991cf.29.2024.06.13.07.09.14
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 07:09:14 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4405cf01a7fso344861cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 07:09:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXr65jS91iFJlCy2pjWWDfDYuDUmYwxc3eyoJ/i4bwD4i/UuCmTn7zWEUlGGPKP7NCuGF0eP/IczrDjr0aiIQ0izj3ZzCDj6sVbGZzaEg==
X-Received: by 2002:a05:622a:4ccd:b0:441:6177:c228 with SMTP id
 d75a77b69052e-441e243c107mr3525071cf.7.1718287362280; Thu, 13 Jun 2024
 07:02:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610222515.3023730-1-dianders@chromium.org>
 <20240610152420.v4.2.I65a6430ab75f74d20c28b5c5f819dd5b8455933d@changeid>
 <0bb414fa-851b-40cf-ede9-fc6252c6b173@linux.intel.com> <CAD=FV=WWrTHRdwrbOFBrZ94HpWQo6v6FkLTxa1vgN31SC6GqDA@mail.gmail.com>
 <ed012fe3-e704-de86-2b5d-bc8d71ebbeaa@linux.intel.com>
In-Reply-To: <ed012fe3-e704-de86-2b5d-bc8d71ebbeaa@linux.intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Jun 2024 07:02:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Un8+gVfZCx_CEdO2Vh5aprTJfBZ0TVdpVBtGdEhnE3Dg@mail.gmail.com>
Message-ID: <CAD=FV=Un8+gVfZCx_CEdO2Vh5aprTJfBZ0TVdpVBtGdEhnE3Dg@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] tty: serial: Add uart_fifo_timeout_ms()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Yicong Yang <yangyicong@hisilicon.com>, Tony Lindgren <tony@atomide.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johan Hovold <johan+linaro@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Stephen Boyd <swboyd@chromium.org>, linux-serial <linux-serial@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 12, 2024 at 11:56=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 12 Jun 2024, Doug Anderson wrote:
> > On Wed, Jun 12, 2024 at 12:38=E2=80=AFAM Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > >
> > > On Mon, 10 Jun 2024, Douglas Anderson wrote:
> > >
> > > > The current uart_fifo_timeout() returns jiffies, which is not alway=
s
> > > > the most convenient for callers. Add a variant uart_fifo_timeout_ms=
()
> > > > that returns the timeout in milliseconds.
> > > >
> > > > NOTES:
> > > > - msecs_to_jiffies() rounds up, unlike nsecs_to_jiffies(). This is
> > > >   because msecs_to_jiffies() is actually intended for device driver=
s
> > > >   to calculate timeout value. This means we don't need to take the =
max
> > > >   of the timeout and "1" since the timeout will always be > 0 ms (w=
e
> > > >   add 20 ms of slop).
> > > > - uart_fifo_timeout_ms() returns "unsigned int" but we leave
> > > >   uart_fifo_timeout() returning "unsigned long". This matches the
> > > >   types of msecs_to_jiffies().
> > > >
> > > > Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > >
> > > > Changes in v4:
> > > > - New
> > > >
> > > >  include/linux/serial_core.h | 15 +++++++++++----
> > > >  1 file changed, 11 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/include/linux/serial_core.h b/include/linux/serial_cor=
e.h
> > > > index 8cb65f50e830..97968acfd564 100644
> > > > --- a/include/linux/serial_core.h
> > > > +++ b/include/linux/serial_core.h
> > > > @@ -889,14 +889,21 @@ unsigned int uart_get_divisor(struct uart_por=
t *port, unsigned int baud);
> > > >  /*
> > > >   * Calculates FIFO drain time.
> > > >   */
> > > > -static inline unsigned long uart_fifo_timeout(struct uart_port *po=
rt)
> > > > +static inline unsigned int uart_fifo_timeout_ms(struct uart_port *=
port)
> > > >  {
> > > >       u64 fifo_timeout =3D (u64)READ_ONCE(port->frame_time) * port-=
>fifosize;
> > > > +     unsigned int fifo_timeout_ms =3D div_u64(fifo_timeout, NSEC_P=
ER_MSEC);
> > > >
> > > > -     /* Add .02 seconds of slop */
> > > > -     fifo_timeout +=3D 20 * NSEC_PER_MSEC;
> > > > +     /*
> > > > +      * Add .02 seconds of slop. This also helps account for the f=
act that
> > > > +      * when we converted from ns to ms that we didn't round up.
> > > > +      */
> > > > +     return fifo_timeout_ms + 20;
> > > > +}
> > > >
> > > > -     return max(nsecs_to_jiffies(fifo_timeout), 1UL);
> > > > +static inline unsigned long uart_fifo_timeout(struct uart_port *po=
rt)
> > > > +{
> > > > +     return msecs_to_jiffies(uart_fifo_timeout_ms(port));
> > > >  }
> > >
> > > Hi,
> > >
> > > This is definitely towards the right direction! However, it now does
> > > double conversion, first div_u64() and then msecs_to_jiffies(). Perha=
ps it
> > > would be better to retain the nsecs version (maybe rename it to _ns f=
or
> > > consistency) and add _ms variant that does the nsec -> msec conversio=
n.
> >
> > I spent a bit of time thinking about it and I don't agree. If you feel
> > very strongly about it or someone else wants to jump in and break the
> > tie then I can look again, but:
> >
> > 1. The comment before nsecs_to_jiffies() specifically states that it's
> > not supposed to be used for this purpose. Specifically, it says:
> >
> >  * Unlike {m,u}secs_to_jiffies, type of input is not unsigned int but u=
64.
> >  * And this doesn't return MAX_JIFFY_OFFSET since this function is desi=
gned
> >  * for scheduler, not for use in device drivers to calculate timeout va=
lue.
> >
> > ...so switching away from nsecs_to_jiffies() to msecs_to_jiffies() is
> > arguably a "bugfix", or at least avoids using the API in a way that's
> > against the documentation.
>
> Okay, I see. However, there's no way around using u64 here even with your
> version that does not use nsecs_to_jiffies() because nsecs is the most
> useful form of input when starting from frame_time, usecs is a bit
> coarse-grained for higher data rates.

Right. We have to start with u64 because the frame time is in ns and
we can only fit ~4 seconds worth of ns in 32-bits. That seems iffy.


> > 2. As mentioned in the commit message, nsecs_to_jiffies() truncates
> > where msecs_to_jiffies() rounds up. Presumably this difference is
> > related to the comment above where the "ns" version is intended for
> > the scheduler. Using the "ms" version allows us to get rid of the
> > extra call to "max()" which is a benefit. Technically since the
> > timeout is at least 20 ms the minimum HZ is 100 I guess we didn't need
> > the max anyway, but I guess someone thought it was cleaner and now we
> > can definitely get rid of it.
> >
> > 3. These functions are inline anyway, so I don't think it's causing a
> > huge bloat of instructions. In fact, moving from 64-bit math to 32-bit
> > math sooner could make the code smaller.
> >
> > 4. I don't feel like it hurts the readability to convert down to ms
> > and then to jiffies. In fact, IMO it helps since it makes it more
> > obvious that we're working with ms.
>
> I'd be lying if I'd say I feel strongly about it

Fair enough. If someone wants to throw in an opinion and tiebreak then they=
 can.


> but my only argument
> involves doing an extra divide which is somewhat costly. It's a
> plain 32-bit divide though so not as bad as the u64 one that is
> unavoidable.

We shouldn't be calling this in a loop anyway, so it's unlikely to
matter. In any case, I'd note that with the old code we had:

1. 64-bit multiply (time * fifosize)
2. 64-bit addition (result + 20ms)
3. 64-bit =3D> 32-bit division (to jiffies)
4. 32-bit comparison against the value 1.
5. Conditional setting of the value to 1.

Now we have:

1. 64-bit multiply (time * fifosize)
2. 64-bit =3D> 32-bit division (to ms)
3. 32-bit addition with a small immediate (20)
4. 32-bit addition (div round up) if HZ !=3D 1000
5. 32-bit division (div round up) if HZ !=3D 1000

I didn't try disassembling to see what the compiler did and it would
be different for each compiler / ISA / optimization level / value of
HZ, but I guess my point is that while we have one more divide (unless
HZ =3D=3D 1000) we may have one less conditional. We're also tending to do
our math with small immediates which some ISAs can handle more
efficiently.

I think the real answer, though, is that this doesn't really matter
and that we should pick the solution that's cleaner/easier to
understand. I'm still in favor of the patch as it is. As I said, if
folks feel really strongly then it doesn't matter and I can change it,
but otherwise I'd rather keep it the way it is.


-Doug

