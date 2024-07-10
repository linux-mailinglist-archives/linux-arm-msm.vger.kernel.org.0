Return-Path: <linux-arm-msm+bounces-25861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A285792D5A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 18:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAD4C1C229BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 16:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34FEE194A68;
	Wed, 10 Jul 2024 16:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cl8q1WAw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624911922CE
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 16:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720627291; cv=none; b=ozg6PnT6ur3jbKmhclOSi4uTHuaXkKupQlVlkWdzm6B7tGxq07UHHh6C5gOFFw2FWFPQkzoWA74WSLlnRXz1fDWiz/LSQ1jCD0DEsUKo6KoGUcY9m5ph56OAX4D0sAU9vMbnLsdNuQJ8Am3MEaCbKQQJ9bBWIkO5AGIdmNMN4rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720627291; c=relaxed/simple;
	bh=hGgQW0B81BUQgE9RlObqbstkTQND3yS3pzPBACJW85s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OnicSDga31DbBEE0GfAX+W2S40AEYxC2FgrlGh82IM9yS16u2H1Ft/tRz33bBgpCcA8XxAjIAiJJLSGFNLdOREhEUvtHWgWUQYGlQCMWddhThXMe3NCJ9pKiUgyQlqpcJ1DVYNJwIprbuzBYf3fdHNtv13mDLDph0rTGmilySwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cl8q1WAw; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52e9b9fb3dcso7779854e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 09:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720627286; x=1721232086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Es++BYrl7MuUEY8tHxL0VOh/sP8aN4itkcXjtpocc8U=;
        b=Cl8q1WAw27KF2NC49Wb1n/XIq0yigqGptoyy61EWbPpJWeX1GaouHSORlacA2qstrw
         2LNIJ6VOdrNyUMnguI9X5LC4jlC3ckfWZJHmCocmm5ScG3kWMVNJ097rmwXJpyfE+7MH
         0N8dFj8CnA8fg+TbCk1HCRo5LD5xiCHbRGifM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720627286; x=1721232086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Es++BYrl7MuUEY8tHxL0VOh/sP8aN4itkcXjtpocc8U=;
        b=DBvIKkCH4tAZ3hhH4SA4sAnq1FCM40AM7Ur6Pnm+dh/62+apo25OCgxx71cN3bwNz3
         +SbMEItNgGqnhWM9O6wiBRtP3F1oKtF2/6deJjo6WNGOXzZ6VSnhdfcmV4+NHhABXiHw
         LyDRv6kJT3TN9R77gvfL1IZwa8moXJmSteVCWOvXNrpmztX1gfesv8mOY4t53hpYtk/8
         m3NbuwTk3JTFY8se73haS8quIQSk3aY1KGXD2vazxJVMcb7BmHFikNtezocMb2wxkhnh
         yAQQwxmqtK0oqUw6vqP7KDu1qS/INmNYPbX30/AGFjdtopZOAhfIma1H6KxeujNzw8U5
         vOYw==
X-Forwarded-Encrypted: i=1; AJvYcCU+YNCh4ZbwGi8zKUCwVL/RynB3k7tRfclNZaY2u0L//TSmwJJCSueOtvFA2zLTRdKsTNuAwi5VN6kl1Y9f5IRMkq23O3uO1LsH3vtaDQ==
X-Gm-Message-State: AOJu0YzKhxbGvOipKDIh5u5tl9gtOOMLF7guOk67b+4LNeqLtTeo5vpc
	Sbo4k3N9utf++gkLWOY8G5gBx5sHPjwjW3iBNczHHjp6CB6WULMy80jdflGjVnjRTUkBleVDCni
	xeA==
X-Google-Smtp-Source: AGHT+IFNFwhn8jx5QCcKXRpvODzmGclEz+7Nvk11EMVTtAFQPp3M+7N1KQ2V6sRRZbBGReQMBFybHQ==
X-Received: by 2002:a05:6512:280c:b0:52c:dca7:c9bd with SMTP id 2adb3069b0e04-52eb99a2c75mr4520731e87.30.1720627285718;
        Wed, 10 Jul 2024 09:01:25 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a871baasm170021166b.189.2024.07.10.09.01.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 09:01:24 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42725f8a789so59735e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 09:01:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUr1r9w/3MzKPpCGFSXpxP4MP/i6LRaacL+nw7Oi+Q1PqiO5d8H/oq5vm7e/3SoJa3MYzzfPsbkDazKfRdSmQRu4u9B19MKMPKZmfAOeA==
X-Received: by 2002:a7b:ce99:0:b0:424:898b:522b with SMTP id
 5b1f17b1804b1-427942230e7mr1577215e9.1.1720627284244; Wed, 10 Jul 2024
 09:01:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709162841.1.I93bf39f29d1887c46c74fbf8d4b937f6497cdfaa@changeid>
 <2024071001-justice-catfight-37f0@gregkh>
In-Reply-To: <2024071001-justice-catfight-37f0@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jul 2024 09:01:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XX0+jE28CRQmWu9Q09KRf5ZbqLYizmem8kk6ajX05qfw@mail.gmail.com>
Message-ID: <CAD=FV=XX0+jE28CRQmWu9Q09KRf5ZbqLYizmem8kk6ajX05qfw@mail.gmail.com>
Subject: Re: [PATCH] serial: qcom-geni: Show '@' characters if we have a FIFO underrun
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, 
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 9, 2024 at 10:35=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jul 09, 2024 at 04:28:45PM -0700, Douglas Anderson wrote:
> > As of commit 2ac33975abda ("serial: qcom-geni: do not kill the machine
> > on fifo underrun") a FIFO underrun will no longer hard lockup the
> > machine. Instead, a FIFO underrun will cause the UART to output a
> > bunch of '\0' characters. The '\0' characters don't seem to show up on
> > most terminal programs and this hides the fact that we had an
> > underrun. An underrun is aq sign of problems in the driver and
> > should be obvious / debugged.
> >
> > Change the driver to put '@' characters in the case of an underrun
> > which should make it much more obvious.
> >
> > Adding this extra initialization doesn't add any real overhead. In
> > fact, this patch reduces code size because the code was calling
> > memset() to init 4 bytes of data. Disassembling the new code shows
> > that early in the function w22 is setup to hold the '@@@@' constant:
> >   mov     w22, #0x40404040
> >
> > Each time through the loop w22 is simply stored:
> >   str     w22, [sp, #4]
> >
> > Cc: Johan Hovold <johan@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  drivers/tty/serial/qcom_geni_serial.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial=
/qcom_geni_serial.c
> > index 69a632fefc41..332eaa2faa2b 100644
> > --- a/drivers/tty/serial/qcom_geni_serial.c
> > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > @@ -872,10 +872,10 @@ static void qcom_geni_serial_send_chunk_fifo(stru=
ct uart_port *uport,
> >  {
> >       struct qcom_geni_serial_port *port =3D to_dev_port(uport);
> >       unsigned int tx_bytes, remaining =3D chunk;
> > -     u8 buf[BYTES_PER_FIFO_WORD];
> >
> >       while (remaining) {
> > -             memset(buf, 0, sizeof(buf));
> > +             u8 buf[BYTES_PER_FIFO_WORD] =3D { '@', '@', '@', '@' };
>
> Why is '@' a valid character for an underrun?  Why would any characters
> be ok?  Where is this now documented?

'@' is arbitrary. If you have a different character suggestion then
I'm happy to change it. I'm mostly looking for something other than
'\0' to be printed out in the case of underruns, which is what happens
now. Printing out '\0' is much harder to notice but could still end up
causing problems with file transfers / automated programs trying to
work with serial data.

NOTE: this is not an underrun in the sense that we didn't get an
interrupt fast enough or that we couldn't keep up. This is an underrun
that could only happen as a result of a bug in the driver. The driver
should not ever get into this situation.

I have no idea where one would document something like this. Do you
have any suggestions? I'm happy to add a comment in the code saying
that the '@' should never show up but if it does then that's a driver
bug.


> And shouldn't you use a memset to get the BYTES_PER_FIFO_WORD amount of
> '@' here?

That feels like overkill and results in much less efficient code, but
I can change it to that if you want. Let me know. In this case
BYTES_PER_FIFO_WORD is more of a constant to add to readability than
something that we'd expect to change. Technically, the hardware can
handle BYTES_PER_FIFO_WORD of 1/2/4, but if we changed that there
would be a bunch of places in the driver that would need to change. In
this case if someone wanted to try to change it to something other
than 4 at least we'd get a compile error.


-Doug

