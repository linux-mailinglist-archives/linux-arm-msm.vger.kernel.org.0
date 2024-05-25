Return-Path: <linux-arm-msm+bounces-20433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF12A8CED34
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 02:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40ACEB2157C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 00:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A746B382;
	Sat, 25 May 2024 00:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nT3dWnyE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D035B7E1
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 00:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716596298; cv=none; b=t1JmrImnyX1/cBE4QceaWuEz82FJhJPRXKWVt0Oqjkfo6Ey4YO45dKBjWG/577YGafjw0TkhjDllltZzs82vhTHqrXuM7JLhuptVL63qpbZX6QrwR4J4aBQAw1zfTDIlhGUpYDYhYJmRDOEZ06uObxoz6sSTxw8o7mtgV1cNtMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716596298; c=relaxed/simple;
	bh=+6AjEhmHbRsl8Ka6lHk9Jc1f+69x8Zhx1YyjzkVdydk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G72UTQgJGk8bC4QORpZRrC4cwNtOy36u7TmxW+ri3a9tXiMRD+2m6MzB26qyLPCPefKkjJ14AyUnhNBI8WEdXTXCefYenvi9SC9ht62XtS+qONyQsfwwJR0AbzWbZV9TkDJmMCLkB1ZiHxAiYiKCp4jgtpec7rqdSxr3+z/9gmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nT3dWnyE; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6ab9ce75777so8587446d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 17:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716596296; x=1717201096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bfn1K9+JwIRdsAuAfjhUfYpdv5tuxz4eH5n99Ay0ULM=;
        b=nT3dWnyEq+QJpoiW+1mP2jef5TPtRohm2Gk2F1HT/L/JiXjaeHG4E2j4LQMF4ev/6E
         er98VoVXDT83NTIDLr2nASyH/SvM8Xfn66fKb1wNycAbgQ9Jk/Rcr6XqEWzlJyckJvHp
         i7vqzj6bv4EVhKt8NVwQV7puEhm/Uj62Jy694=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716596296; x=1717201096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bfn1K9+JwIRdsAuAfjhUfYpdv5tuxz4eH5n99Ay0ULM=;
        b=OTnLYfQB58TDeZW1hN1RD5CGMDtz0yYmF4vxkirPtObYervtSpzBj7Mw4FjoDnNBjr
         RlQ+BASOktgWDNtctkh/00lTAcX0ZiQoLCMOBu3efM20FAlxQT+2R5hpdaJtxMo9JO9s
         HJ2l9UBnbgNQKbvE3o8JvjNj0EMKQyJgFi0+rj0FiS5Zx8QFJTMw/0RVTwxhqv1MK3Jm
         +7Si9d2UBX/tuGPWzc+CdBfPCL/e4n9qhMG3qLUSblXVTR2v7peeOJxdMywizVtOpgy4
         9K6gn7QGX4JfuIiqrewphPuWe/Q2pQW/Ua13Fj+Myp0rbghUsGJ9gdnv9MKtPNPi6tI5
         DYaw==
X-Forwarded-Encrypted: i=1; AJvYcCVvV0xXV84Ws2BH5ZPEcD4vQz2GSfdKQN+cBvZD1KpiaYKZn4rEPYJUlCVhYeo3f8+9t+Vz1fzUkMGaCpXe8mrdywOCaWl+BkONq6psbA==
X-Gm-Message-State: AOJu0Yyv+j5jWX6QYdFsA6XYlLkRRaUmIkvb5UWyOeAfDVv5bryzR+CZ
	slhF5dBoWLg+HJbc0ec0bAjRguyEd6TPjtyJqJMf9wCkgwqtIecSTpIKQdBaP8hljVJE0O3opuc
	=
X-Google-Smtp-Source: AGHT+IHXzBatoIlMu5deREgOdJSUJI8GBTAmXcmOQesQf5GiEeup9YOjW8vyx40HJxa6zTAmrJa2NQ==
X-Received: by 2002:a05:6214:3a84:b0:6ab:6d70:898a with SMTP id 6a1803df08f44-6abbbc5ea69mr42304436d6.8.1716596295757;
        Fri, 24 May 2024 17:18:15 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ac070c2edfsm11679376d6.23.2024.05.24.17.18.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 May 2024 17:18:15 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-43e14f0bd75so62621cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 17:18:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPpKiTozjTqq5EZ9SRBZbIv786GpBqkeSTlcIpcz/XbW6A4DmpD/hHySpV5OUO+3mfVePIi+IofOsgqUCytArKv/CyR9pXD2s0LiK6kw==
X-Received: by 2002:ac8:690d:0:b0:43a:cc48:344f with SMTP id
 d75a77b69052e-43fbb0d8e5emr502191cf.25.1716596294771; Fri, 24 May 2024
 17:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240523232216.3148367-1-dianders@chromium.org>
 <20240523162207.2.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid> <CAE-0n53F3Xg2vOdgy-Vpjw4Kirdgi6B+BnO51fd6qOtDu0iXCg@mail.gmail.com>
In-Reply-To: <CAE-0n53F3Xg2vOdgy-Vpjw4Kirdgi6B+BnO51fd6qOtDu0iXCg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 24 May 2024 17:17:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VeKiiHeOwmt_6uf7OSoGvOJLrLLMULVERubU1ut-=WqQ@mail.gmail.com>
Message-ID: <CAD=FV=VeKiiHeOwmt_6uf7OSoGvOJLrLLMULVERubU1ut-=WqQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: qcom-geni: Fix qcom_geni_serial_stop_tx_fifo()
 while xfer
To: Stephen Boyd <swboyd@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, John Ogness <john.ogness@linutronix.de>, 
	Tony Lindgren <tony@atomide.com>, linux-arm-msm@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Yicong Yang <yangyicong@hisilicon.com>, James Clark <james.clark@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 23, 2024 at 5:38=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> Quoting Douglas Anderson (2024-05-23 16:22:13)
> > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial=
/qcom_geni_serial.c
> > index 2bd25afe0d92..9110ac4bdbbf 100644
> > --- a/drivers/tty/serial/qcom_geni_serial.c
> > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > @@ -265,8 +265,8 @@ static bool qcom_geni_serial_secondary_active(struc=
t uart_port *uport)
> >         return readl(uport->membase + SE_GENI_STATUS) & S_GENI_CMD_ACTI=
VE;
> >  }
> >
> > -static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
> > -                               int offset, int field, bool set)
> > +static bool qcom_geni_serial_poll_bitfield(struct uart_port *uport,
> > +                                          int offset, int field, u32 v=
al)
>
> Can these be unsigned offset and field?

Not new for this patch, but sure. Field should almost certainly be
u32, right? I guess offset could be "unsigned int"? If you want to get
technical it could be "size_t", but that feels like a waste when we
know the offset is tiny.


> >  {
> >         u32 reg;
> >         struct qcom_geni_serial_port *port;
> > @@ -295,7 +295,7 @@ static bool qcom_geni_serial_poll_bit(struct uart_p=
ort *uport,
> >         timeout_us =3D DIV_ROUND_UP(timeout_us, 10) * 10;
> >         while (timeout_us) {
> >                 reg =3D readl(uport->membase + offset);
> > -               if ((bool)(reg & field) =3D=3D set)
> > +               if ((reg & field) =3D=3D val)
> >                         return true;
> >                 udelay(10);
> >                 timeout_us -=3D 10;
> > @@ -303,6 +303,12 @@ static bool qcom_geni_serial_poll_bit(struct uart_=
port *uport,
> >         return false;
> >  }
> >
> > +static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
> > +                                     int offset, int field, bool set)
>
> Can these be unsigned offset and field?

Sure. Same as above.



> > +{
> > +       return qcom_geni_serial_poll_bitfield(uport, offset, field, set=
 ? field : 0);
> > +}
> > +
> >  static void qcom_geni_serial_setup_tx(struct uart_port *uport, u32 xmi=
t_size)
> >  {
> >         u32 m_cmd;
> > @@ -675,6 +681,31 @@ static void qcom_geni_serial_stop_tx_fifo(struct u=
art_port *uport)
> >         if (!qcom_geni_serial_main_active(uport))
> >                 return;
> >
> > +       /*
> > +        * Wait until the FIFO has been drained. We've already taken by=
tes out
> > +        * of the higher level queue in qcom_geni_serial_send_chunk_fif=
o() so
> > +        * if we don't drain the FIFO but send the "cancel" below they =
seem to
> > +        * get lost.
> > +        */
> > +       qcom_geni_serial_poll_bitfield(uport, SE_GENI_TX_FIFO_STATUS, T=
X_FIFO_WC, 0);
> > +
> > +       /*
> > +        * If we send the cancel immediately after the FIFO reports tha=
t it's
> > +        * empty then bytes still seem to get lost. From trial and erro=
r, it
> > +        * appears that a small delay here keeps bytes from being lost =
and
> > +        * there is (apparently) no bit that we can poll instead of thi=
s.
> > +        * Specifically it can be noted that the sequencer is still "ac=
tive"
> > +        * if it's waiting for us to send it more bytes from the curren=
t
> > +        * transfer.
> > +        */
> > +       mdelay(1);
>
> I wonder if the FIFO is in a different 1kb chunk of device memory and so
> this needs to be an instruction barrier (isb()) to prevent the cancel
> from being executed before or in parallel to the FIFO polling. Hopefully
> someone at qcom can confirm this. It looks like SE_GENI_TX_FIFO_STATUS
> is 0x800 offset and the cancel is at 0x600 so it looks like it may be
> this problem. Device memory doesn't save us even if that has ordered
> accesses :(

I spent a bunch of time digging into this today. isb() didn't help,
nor did isb() plus mb().

I searched the docs and also did a brute force attempt to figure out
what to do. I finally found two answers:

1. It appears that M_GP_LENGTH can still advance after the FIFO
becomes 0, which is extra proof that the transfer is still happening
even though the FIFO says it's done. Presumably we could keep track of
how many bytes we have enqueued into the FIFO for this command and
then compare. As I was trying to do this, though, I noticed another
option...

2. It appears that instead of "cancelling" the current command we can
just issue a new 0-byte transfer and wait for the 0-byte transfer to
be "done". This causes geni to give us back a "M_CMD_OVERRUN"
interrupt, but that's fine and we can ignore it. That interrupt just
says "hey, you gave me a command before the previous one was done" but
it does seem to properly accept the new command and it doesn't drop
any bytes.

...it turns out that we (apparently) already have been using option #2
to interrupt a transfer without dropping bytes. When the UART is
shared between an agetty and the kernel console this happens all the
time. In qcom_geni_serial_console_write() we'll issue a new command
before finishing a current one and then re-issue the current command
with any remaining bytes. So not only should this be safe but it's
already tested to work.

I'll need to spend a little more time on this to really confirm it
works as I expect and I'll send up a v2 using approach #2.

Also note that while spending more time on this I found _yet another_
bug, this one more serious. My original testing was done on kernel 6.6
(with stable backports) and I just did confirmation on mainline.
That's why I didn't see this new bug originally. ...but this time I
spent more time testing on mainline. It turns out that the recent
patches for kfifo on mainline have badly broken geni serial.
Specifically, if you just do "cat /var/log/messages" and then "Ctrl-C"
the machine will hard lockup! Yikes! This is yet another side effect
of the geni "packet"-based protocol biting us (so related to the
problems in ${SUBJECT}, but not identical). Whenever we setup a TX
transfer we set it up for the number of bytes in the queue at the
time. If that number goes down then we're in trouble. Specifically, it
can be noted that:
* When we start transmitting we look at the current queue size, setup
a transfer, and store "tx_remaining".
* Whenever there's space in the FIFO we add bytes and remove them from
the queue and "tx_remaining".
* We don't ever expect bytes to disappear from the queue. I think in
the old code if this happened we're just transfer some bogus bytes.
Now we'll loop in qcom_geni_serial_send_chunk_fifo() because
uart_fifo_out() will keep returning 0.

I'll try to take a gander at that, too...

-Doug

