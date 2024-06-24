Return-Path: <linux-arm-msm+bounces-24025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE72915866
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 22:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4ADD4B221F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 20:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF6B45010;
	Mon, 24 Jun 2024 20:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aaq6yggM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED151A01B4
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 20:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719262732; cv=none; b=AuSfqXzd0hFkxPK21pcv893hazKoIkRwSFVJyqDpYz5CROFJQcg2kXpIvjutZX3UzBtKd9l1+qDkIRt/nDBBOeWl5gxUe3ce9AoFfOAio7E1Wy9zGhtD/vkbLinApvxRRq7g4fXQF4r4ORl3fMarlfQAY3bOWeevs4pMYtR64t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719262732; c=relaxed/simple;
	bh=rc+uf24RV4wU1ZmPVkashso27WnRydS2+EKRJ3fw3uo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rg4bjaK/SkuXbxgPcZVudqI6pGgwqgFWlITGGu6iiHApSwSGIPozu2+FYWgNS46X/wcd5g1SF+fJ86SxUGzFWkNfigvg0hIGM0iWqbEfZu8RPgujOzq2C6n6OzusOC8pAHcVvM4rz+HkHdis0jGvv/hNbhaV9RyVy3O0ephsCxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aaq6yggM; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7954f8b818fso302306085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 13:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719262728; x=1719867528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F26ETBZiZjhwFkvNSbxGcmTBqIZI6iLTpohts+kXXh4=;
        b=aaq6yggMnmm0yitIXZRAmvfEdQsYysRVY2s3RnVI9fMu0fwBpdWosKKQK7qq/ELqjL
         zO5DBFjsqL7qtIwZLmMNOaw9dNDU3vF5fzEx+O2xjYHlnSSBhVKcR8TUpvQRX7ae8dVs
         yaVfejsT7duydt/mgemvj30BrifBgaEEBjMVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719262728; x=1719867528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F26ETBZiZjhwFkvNSbxGcmTBqIZI6iLTpohts+kXXh4=;
        b=WVsYtj2pfSkGzSTz4UuBk1KjjK8m8ryaOtIFFq2+iwKF1o0ii7ki+YHvRQNVKwjLAU
         yRKWpx6sBYM05zy+Xi0cvHbWpEDinJhaFR8fnf7EO55kkmHTQkXzuXdgPAnEkmQPim9k
         vq80Mm5i0yQRZOQpsh9HYaEkkAe4zc7rcAAOPHqiA/iBsST2N4qKVI0qvSlKsoUqNFKH
         eaJ+2okx+e2lHUCiQwyskk2pLBzTE1VTeLB8UTfzmIWj9PoAMGg5e2rAV5A5BhwplRxW
         ZJqIZybp8zczZYnpuFdqwf59auysMRTDH6ACynfo3s1+cOphhPhNPGL0G9jPy0TkhAT+
         tTUw==
X-Forwarded-Encrypted: i=1; AJvYcCWZZWwHC9mvNLLlEn1s5PSKejAhK61YgrxCNzDaI/n66ZZJ7bkodIHmzaCOKSA+Us+lZkJO8FoDw78knY1GYA6arVQmFlCnain2mpmG0Q==
X-Gm-Message-State: AOJu0YwIkVz/YYEpRAMglvILnijpb6NUoIBHc2VmenJLPpPooD8eAsTG
	f/RfR0TYQZxfIVASSEtwJX5foktTdDL1GhIS71Y66xizbr/YXFRnFYTfl0/4/JOsMJsgD23IJdM
	=
X-Google-Smtp-Source: AGHT+IFkdknFFueERkQskuttpjzX5WB2N6LMLHjMgoQgVYMNZINOaJQOScVItKNNWaVKpyEOy1hB6A==
X-Received: by 2002:a05:620a:400c:b0:795:5f39:e165 with SMTP id af79cd13be357-79be7036781mr726205885a.60.1719262727838;
        Mon, 24 Jun 2024 13:58:47 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bce92e6b4sm347194685a.100.2024.06.24.13.58.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 13:58:47 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-44056f72257so27801cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 13:58:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFzTkzOaw910UrnYl8aAR84AaTey49JzM1p4Chi/jGq7soYk+WH5yWB+fy7CGvVzcreLjZPdEmPCgEv+FDxBXWpLuqLCjta5a+dnSu+Q==
X-Received: by 2002:a05:622a:283:b0:442:1bc4:8fb2 with SMTP id
 d75a77b69052e-444f2566f1fmr919771cf.20.1719262726353; Mon, 24 Jun 2024
 13:58:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610222515.3023730-1-dianders@chromium.org>
 <20240610152420.v4.7.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid> <ZnlilDj5UrvrVasv@hovoldconsulting.com>
In-Reply-To: <ZnlilDj5UrvrVasv@hovoldconsulting.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Jun 2024 13:58:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U=C+Myrb4cpGyV-J=RHn39C2aF1WT_Xt5M2vczbZ-AbA@mail.gmail.com>
Message-ID: <CAD=FV=U=C+Myrb4cpGyV-J=RHn39C2aF1WT_Xt5M2vczbZ-AbA@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] serial: qcom-geni: Fix suspend while active UART xfer
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
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 24, 2024 at 5:12=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Mon, Jun 10, 2024 at 03:24:25PM -0700, Douglas Anderson wrote:
> > On devices using Qualcomm's GENI UART it is possible to get the UART
> > stuck such that it no longer outputs data. Specifically, logging in
> > via an agetty on the debug serial port (which was _not_ used for
> > kernel console) and running:
> >   cat /var/log/messages
> > ...and then (via an SSH session) forcing a few suspend/resume cycles
> > causes the UART to stop transmitting.
>
> An easier way to trigger this old bug is to just run a command like
> dmesg and hit ctrl-s in a serial console to stop tx. Interrupting the
> command or hitting ctrl-q to restart tx then triggers the soft lockup.
>
> > The root of the problems was with qcom_geni_serial_stop_tx_fifo()
> > which is called as part of the suspend process. Specific problems with
> > that function:
> > - When an in-progress "tx" command is cancelled it doesn't appear to
> >   fully drain the FIFO. That meant qcom_geni_serial_tx_empty()
> >   continued to report that the FIFO wasn't empty. The
> >   qcom_geni_serial_start_tx_fifo() function didn't re-enable
> >   interrupts in this case so the driver would never start transferring
> >   again.
> > - When the driver cancelled the current "tx" command but it forgot to
> >   zero out "tx_remaining". This confused logic elsewhere in the
> >   driver.
> > - From experimentation, it appears that cancelling the "tx" command
> >   could drop some of the queued up bytes.
> >
> > While qcom_geni_serial_stop_tx_fifo() could be fixed to drain the FIFO
> > and shut things down properly, stop_tx() isn't supposed to be a slow
> > function. It is run with local interrupts off and is documented to
> > stop transmitting "as soon as possible". Change the function to just
> > stop new bytes from being queued. In order to make this work, change
> > qcom_geni_serial_start_tx_fifo() to remove some conditions. It's
> > always safe to enable the watermark interrupt and the IRQ handler will
> > disable it if it's not needed.
> >
> > For system suspend the queue still needs to be drained. Failure to do
> > so means that the hardware won't provide new interrupts until a
> > "cancel" command is sent. Add draining logic (fixing the issues noted
> > above) at suspend time.
>
> So I spent the better part of the weekend looking at this driver and
> this is one of the bits I worry about with your approach as relying on
> draining anything won't work with hardware flow control.
>
> Cancelling commands can result stalled TX in a number of ways and
> there's still at least one that you don't handle. If you end up with
> data in in the FIFO, the watermark interrupt may never fire when you try
> to restart tx.

Ah, that's a good call. Right now it doesn't really happen since
people tend to hook up the debug UART without flow control lines (as
far as I've seen), but it's good to make sure it works.


> I'm leaning towards fixing the immediate hard lockup regression
> separately and then we can address the older bugs and rework driver
> without having to rush things.

Yeah, that's fair. I've responded to your patch with a
counter-proposal to fix the hard lockup regression, but I agree that
should take priority.


> I've prepared a minimal three patch series which fixes most of the
> discussed issues (hard and soft lockup and garbage characters) and that
> should be backportable as well.
>
> Currently, the diffstat is just:
>
>          drivers/tty/serial/qcom_geni_serial.c | 36 +++++++++++++++++++++=
++++-----------
>          1 file changed, 25 insertions(+), 11 deletions(-)

I'll respond more in dept to your patches, but I suspect that your
patch series won't fix the issues that N=C3=ADcolas reported [1]. I also
tested and your patch series doesn't fix the kdb issue talked about in
my patch #8. Part of my reworking of stuff also changed the way that
the console and the polling commands worked since they were pretty
broken. Your series doesn't touch them.

We'll probably need something in-between taking advantage of some of
the stuff you figured out with "cancel" but also doing a bigger rework
than you did.

[1] https://lore.kernel.org/r/46f57349-1217-4594-85b2-84fa3a365c0c@notapian=
o

