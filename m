Return-Path: <linux-arm-msm+bounces-22541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2130890647F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 08:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A7F51F230C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 06:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E74A13791E;
	Thu, 13 Jun 2024 06:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htkJPuU8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E5B137933;
	Thu, 13 Jun 2024 06:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718261774; cv=none; b=Ev3XZ2GGMjxuYvSsY6qZ5JWL7NZvUQkMIvH4EhX7Mkk7pMGjx8EMyWrT9a6PsWSIPji2XeDV8okg/8JR1NlaEEcr+PJ3FPjZ7j40+GlGQ7UA7kbCh0w1Ph3RgHanIJiMt4ImSQtvgQJn3Md+hi6cGgf2DQNoEDKObbhH0hJWKTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718261774; c=relaxed/simple;
	bh=WpxKaln42QaWmGoIIAoSAtunAaG5uokc4CAg6/rTG64=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dIKfW7JzZ57uE1+lGB50wc6idfFUJ5vzhxt/2eE+pg2LEOq40nMz4PaV0Pa+jwjNjAe5RQHuzewfXqA6SOfq5FgqUptp2VrQ6BErAsoXEGOCne429m2UXtsGvmUzl18UlfeC7X7G5MqpMxTNu9Ri52ldMDYC9DjT2Hii860UCAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htkJPuU8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718261773; x=1749797773;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WpxKaln42QaWmGoIIAoSAtunAaG5uokc4CAg6/rTG64=;
  b=htkJPuU833v4tPB7EdUL8rQxC+aitfH+UsKwLF9H/gqJSJmoIEgwJCI+
   bcajD4+en47Ticv5hIcuVq0JNpVP3jVC3fQxJSBxLVXalMsZv60Zw9SBs
   IRKZyviQ9APHkE5YCTYbCWINlduIAnhxhKZsTL9PauNRRXbdMMhu9JFfj
   arsJXXUUZlRkbWe6MPU69uG7Dx2M64H+45W3pJO+KpvBgm49mwBDdkkrO
   KreT5fkBsyLLe7GUY5svXBy4zJZPuzjK7L7HpN07/xlxO/P1eTev8uVwc
   gmJxn3PdA917YcLfp9p79789B+7YJ5QStthvdaSxd2JYHRnyaUO19IUCf
   A==;
X-CSE-ConnectionGUID: TYju+PcqQsarh3BUL+ceDA==
X-CSE-MsgGUID: n16lizVoQTKiBIsYb+YjtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15187781"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="15187781"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 23:56:12 -0700
X-CSE-ConnectionGUID: x+oAxnUzSWOOR928zu+KfQ==
X-CSE-MsgGUID: jvydUJVJTA+nD7QtCZWztg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="44487294"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.209])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 23:56:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Jun 2024 09:56:02 +0300 (EEST)
To: Doug Anderson <dianders@chromium.org>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Yicong Yang <yangyicong@hisilicon.com>, 
    Tony Lindgren <tony@atomide.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Johan Hovold <johan+linaro@kernel.org>, 
    John Ogness <john.ogness@linutronix.de>, linux-arm-msm@vger.kernel.org, 
    Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konrad.dybcio@linaro.org>, 
    Stephen Boyd <swboyd@chromium.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v4 2/8] tty: serial: Add uart_fifo_timeout_ms()
In-Reply-To: <CAD=FV=WWrTHRdwrbOFBrZ94HpWQo6v6FkLTxa1vgN31SC6GqDA@mail.gmail.com>
Message-ID: <ed012fe3-e704-de86-2b5d-bc8d71ebbeaa@linux.intel.com>
References: <20240610222515.3023730-1-dianders@chromium.org> <20240610152420.v4.2.I65a6430ab75f74d20c28b5c5f819dd5b8455933d@changeid> <0bb414fa-851b-40cf-ede9-fc6252c6b173@linux.intel.com>
 <CAD=FV=WWrTHRdwrbOFBrZ94HpWQo6v6FkLTxa1vgN31SC6GqDA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1323085982-1718261762=:1023"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1323085982-1718261762=:1023
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 12 Jun 2024, Doug Anderson wrote:
> On Wed, Jun 12, 2024 at 12:38=E2=80=AFAM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Mon, 10 Jun 2024, Douglas Anderson wrote:
> >
> > > The current uart_fifo_timeout() returns jiffies, which is not always
> > > the most convenient for callers. Add a variant uart_fifo_timeout_ms()
> > > that returns the timeout in milliseconds.
> > >
> > > NOTES:
> > > - msecs_to_jiffies() rounds up, unlike nsecs_to_jiffies(). This is
> > >   because msecs_to_jiffies() is actually intended for device drivers
> > >   to calculate timeout value. This means we don't need to take the ma=
x
> > >   of the timeout and "1" since the timeout will always be > 0 ms (we
> > >   add 20 ms of slop).
> > > - uart_fifo_timeout_ms() returns "unsigned int" but we leave
> > >   uart_fifo_timeout() returning "unsigned long". This matches the
> > >   types of msecs_to_jiffies().
> > >
> > > Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > > Changes in v4:
> > > - New
> > >
> > >  include/linux/serial_core.h | 15 +++++++++++----
> > >  1 file changed, 11 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/include/linux/serial_core.h b/include/linux/serial_core.=
h
> > > index 8cb65f50e830..97968acfd564 100644
> > > --- a/include/linux/serial_core.h
> > > +++ b/include/linux/serial_core.h
> > > @@ -889,14 +889,21 @@ unsigned int uart_get_divisor(struct uart_port =
*port, unsigned int baud);
> > >  /*
> > >   * Calculates FIFO drain time.
> > >   */
> > > -static inline unsigned long uart_fifo_timeout(struct uart_port *port=
)
> > > +static inline unsigned int uart_fifo_timeout_ms(struct uart_port *po=
rt)
> > >  {
> > >       u64 fifo_timeout =3D (u64)READ_ONCE(port->frame_time) * port->f=
ifosize;
> > > +     unsigned int fifo_timeout_ms =3D div_u64(fifo_timeout, NSEC_PER=
_MSEC);
> > >
> > > -     /* Add .02 seconds of slop */
> > > -     fifo_timeout +=3D 20 * NSEC_PER_MSEC;
> > > +     /*
> > > +      * Add .02 seconds of slop. This also helps account for the fac=
t that
> > > +      * when we converted from ns to ms that we didn't round up.
> > > +      */
> > > +     return fifo_timeout_ms + 20;
> > > +}
> > >
> > > -     return max(nsecs_to_jiffies(fifo_timeout), 1UL);
> > > +static inline unsigned long uart_fifo_timeout(struct uart_port *port=
)
> > > +{
> > > +     return msecs_to_jiffies(uart_fifo_timeout_ms(port));
> > >  }
> >
> > Hi,
> >
> > This is definitely towards the right direction! However, it now does
> > double conversion, first div_u64() and then msecs_to_jiffies(). Perhaps=
 it
> > would be better to retain the nsecs version (maybe rename it to _ns for
> > consistency) and add _ms variant that does the nsec -> msec conversion.
>=20
> I spent a bit of time thinking about it and I don't agree. If you feel
> very strongly about it or someone else wants to jump in and break the
> tie then I can look again, but:
>
> 1. The comment before nsecs_to_jiffies() specifically states that it's
> not supposed to be used for this purpose. Specifically, it says:
>=20
>  * Unlike {m,u}secs_to_jiffies, type of input is not unsigned int but u64=
=2E
>  * And this doesn't return MAX_JIFFY_OFFSET since this function is design=
ed
>  * for scheduler, not for use in device drivers to calculate timeout valu=
e.
>=20
> ...so switching away from nsecs_to_jiffies() to msecs_to_jiffies() is
> arguably a "bugfix", or at least avoids using the API in a way that's
> against the documentation.

Okay, I see. However, there's no way around using u64 here even with your=
=20
version that does not use nsecs_to_jiffies() because nsecs is the most=20
useful form of input when starting from frame_time, usecs is a bit=20
coarse-grained for higher data rates.

> 2. As mentioned in the commit message, nsecs_to_jiffies() truncates
> where msecs_to_jiffies() rounds up. Presumably this difference is
> related to the comment above where the "ns" version is intended for
> the scheduler. Using the "ms" version allows us to get rid of the
> extra call to "max()" which is a benefit. Technically since the
> timeout is at least 20 ms the minimum HZ is 100 I guess we didn't need
> the max anyway, but I guess someone thought it was cleaner and now we
> can definitely get rid of it.
>=20
> 3. These functions are inline anyway, so I don't think it's causing a
> huge bloat of instructions. In fact, moving from 64-bit math to 32-bit
> math sooner could make the code smaller.
>
> 4. I don't feel like it hurts the readability to convert down to ms
> and then to jiffies. In fact, IMO it helps since it makes it more
> obvious that we're working with ms.

I'd be lying if I'd say I feel strongly about it but my only argument=20
involves doing an extra divide which is somewhat costly. It's a=20
plain 32-bit divide though so not as bad as the u64 one that is=20
unavoidable.


--=20
 i.

--8323328-1323085982-1718261762=:1023--

