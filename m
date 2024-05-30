Return-Path: <linux-arm-msm+bounces-21166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9F38D55C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 00:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C66D71C20BC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 22:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAED94D8CF;
	Thu, 30 May 2024 22:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nNKtLcvT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AC717545
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 22:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717109464; cv=none; b=Yp+fivO6e6bGZzQZYxgWBX31gVPYx6YFqA2ex9SStFIm0j1tDSnRLWqtChuvYcatCV/f8uvqvnGezs830a0HzheuCI5ARIAqOLzkXk89k3UeZBYnA+Eg3Bu19enNq3PVpaZOrvu89BjHijpo/9pLo9ASqvt0hfm4kbnx4v+zQgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717109464; c=relaxed/simple;
	bh=33aiZOcyTr7wjCXj4MkSVQHEobDBn6/UxXRCxIgAnUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQ0baIXzJXh/0kr6Yp10OjwtePwFiRPeviPM2tTYuld6oq98C2qHsds3+s+a+coJ3XO+jpz0Y65pL49+wJUCbYVvqsX2WtRMe643FrqdS4iKLjEzm98yZKgoSbd3RX90gFRunKbiOtBDRyAGA1n/6IXFj03IclGBMB51O5z9M4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nNKtLcvT; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-794f61f7423so410085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717109461; x=1717714261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33aiZOcyTr7wjCXj4MkSVQHEobDBn6/UxXRCxIgAnUo=;
        b=nNKtLcvT5VLW6JuAGc+xgoVefgIsorowSeGpSVa/bEbKeyaUoZ6baruOdBFYLlQqZx
         uwVbIFBG2Bc0sNqHXqI+jf/P8cSjYPPFY6hitqxVIN9NVYXGp3IYfW/nskjKRN9+Z0du
         XJlOxCM3gB3zPGDLO15PQOahDgK4W2L4nczuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717109461; x=1717714261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33aiZOcyTr7wjCXj4MkSVQHEobDBn6/UxXRCxIgAnUo=;
        b=HJQvcmyRSrD7eTMh8MItasK2dooJjsHZTF7GVbBTWSHMCh7o5CHLChrKGfQagqXhbI
         5BAgIPhfEdM9jjLeEX8jyXVbrXTALMmbfszIqMMV9DMj2nlK3wW170cQfKSu1zEexdAd
         Y8c5uLbcDckhRUb8Tcq+sQyg3mk0rRPA4y9i3I8kqhas+xmEqkpdjqZjApDt8p0EpAdC
         948K0td+5F10m5nm4kwvuhUp8hnRV5RBZNvKpIuvV4MhSa4TaBsLpXIjA9jUmXcnAfz8
         CyMf+VkW+g4Y/EVVpBdCVkbpEyEC6hm5HAlGnMtjY1KuT5yWMeqjVvtfK4oJEBL8ZSJl
         q3sg==
X-Forwarded-Encrypted: i=1; AJvYcCWUq3y6Qrpo83iJ1XT1iLe8eIpot20zsyXZT3yd71pDGhyjokOqc2LpTOpah7W0UJUL177xV558jC89a6aP3Eu6YIfYYMGB/jr54wylew==
X-Gm-Message-State: AOJu0YxHHGP+SCWt+GOH3rXhOt7rdk+z5erMx99w1EFzeQYWiUPv4SXz
	StrHFlfcqq2qs+kFnsvBnugDtgpURVYABQlmH8k4Yc7JhUZCvSgE3un9zOl0JT57H8khetanQbM
	iKw==
X-Google-Smtp-Source: AGHT+IF4DjXnTG0r5RKOspeT+uI4+a6nR0qFO99MZ3fsgeqxwEf29JQimlcDUTrTDZ6KGeJFr+Vv1w==
X-Received: by 2002:a05:620a:1997:b0:792:e0a5:7d54 with SMTP id af79cd13be357-794f5c733d8mr11113885a.29.1717109460452;
        Thu, 30 May 2024 15:51:00 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794f319b915sm16861385a.132.2024.05.30.15.50.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 15:50:59 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-43fe3289fc5so56211cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:50:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlvZia38bFtJ72i74Jyc2bXlIGU3FShwED4k3KS5xc5U+epGKiE/l5lgcmQXh/9OnD8DqPqu2aZnc/nlvQqVGx11c1eFUxYepuVb43Iw==
X-Received: by 2002:a05:622a:1b03:b0:43f:db90:2557 with SMTP id
 d75a77b69052e-43ff4f8d821mr207311cf.21.1717109458702; Thu, 30 May 2024
 15:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240523232216.3148367-1-dianders@chromium.org>
 <20240523162207.2.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid>
 <CAE-0n53F3Xg2vOdgy-Vpjw4Kirdgi6B+BnO51fd6qOtDu0iXCg@mail.gmail.com> <CAD=FV=VeKiiHeOwmt_6uf7OSoGvOJLrLLMULVERubU1ut-=WqQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VeKiiHeOwmt_6uf7OSoGvOJLrLLMULVERubU1ut-=WqQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 May 2024 15:50:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJ6oyhbiY89MDbJkq1q1UDwneJ9p+9PVY6ZHdAg==rng@mail.gmail.com>
Message-ID: <CAD=FV=WJ6oyhbiY89MDbJkq1q1UDwneJ9p+9PVY6ZHdAg==rng@mail.gmail.com>
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

On Fri, May 24, 2024 at 5:17=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> 1. It appears that M_GP_LENGTH can still advance after the FIFO
> becomes 0, which is extra proof that the transfer is still happening
> even though the FIFO says it's done. Presumably we could keep track of
> how many bytes we have enqueued into the FIFO for this command and
> then compare. As I was trying to do this, though, I noticed another
> option...
>
> 2. It appears that instead of "cancelling" the current command we can
> just issue a new 0-byte transfer and wait for the 0-byte transfer to
> be "done". This causes geni to give us back a "M_CMD_OVERRUN"
> interrupt, but that's fine and we can ignore it. That interrupt just
> says "hey, you gave me a command before the previous one was done" but
> it does seem to properly accept the new command and it doesn't drop
> any bytes.
>
> ...it turns out that we (apparently) already have been using option #2
> to interrupt a transfer without dropping bytes. When the UART is
> shared between an agetty and the kernel console this happens all the
> time. In qcom_geni_serial_console_write() we'll issue a new command
> before finishing a current one and then re-issue the current command
> with any remaining bytes. So not only should this be safe but it's
> already tested to work.
>
> I'll need to spend a little more time on this to really confirm it
> works as I expect and I'll send up a v2 using approach #2.

Just to connect the dots more, I did more testing and option #2
totally didn't work. The console/kdb stuff was working mostly through
ugly fragile hacks. Polling GP_LENGTH seemed like the only option,
though when I dug more I found that this wasn't the right place to do
it anyway...


> Also note that while spending more time on this I found _yet another_
> bug, this one more serious. My original testing was done on kernel 6.6
> (with stable backports) and I just did confirmation on mainline.
> That's why I didn't see this new bug originally. ...but this time I
> spent more time testing on mainline. It turns out that the recent
> patches for kfifo on mainline have badly broken geni serial.
> Specifically, if you just do "cat /var/log/messages" and then "Ctrl-C"
> the machine will hard lockup! Yikes! This is yet another side effect
> of the geni "packet"-based protocol biting us (so related to the
> problems in ${SUBJECT}, but not identical). Whenever we setup a TX
> transfer we set it up for the number of bytes in the queue at the
> time. If that number goes down then we're in trouble. Specifically, it
> can be noted that:
> * When we start transmitting we look at the current queue size, setup
> a transfer, and store "tx_remaining".
> * Whenever there's space in the FIFO we add bytes and remove them from
> the queue and "tx_remaining".
> * We don't ever expect bytes to disappear from the queue. I think in
> the old code if this happened we're just transfer some bogus bytes.
> Now we'll loop in qcom_geni_serial_send_chunk_fifo() because
> uart_fifo_out() will keep returning 0.
>
> I'll try to take a gander at that, too...

I spent _far_ too long poking at this and I've finally come up with a
v2 that _I think_ fixes everything. For reference:

https://lore.kernel.org/r/20240530224603.730042-1-dianders@chromium.org

