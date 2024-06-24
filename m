Return-Path: <linux-arm-msm+bounces-24044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB469158AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 23:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02D2C284C41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AF949656;
	Mon, 24 Jun 2024 21:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NWZbaPg3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78147364A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 21:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719263725; cv=none; b=W2cqAQXuKlGrUnnX08QY7gzeDPpq1W/DJUY/z8OJGOB2zdMKvBR3XOoL5ZvptkjqXV36SM4rFCeU7Ib/xOyPzxRrfpQ7gBi3pz8f4JgKACl+G32c7FsQu6WVCb1Eo689XkIcy0CvDS+n2F9Ma1oB572g6Fu9hflJk6H9jqCHQLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719263725; c=relaxed/simple;
	bh=1aS1C8+rNiEE9y97Tf7/4pGGQHLNNIZeCB3/TynbVHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ni95T2YhQ/xzF9hwrWapRXs6ejaj+gs5PMWcrexbBmzi0Q6M8zAsNp/ixaLRzX7LCzg64rj0XDhEyfREGYCBkqCt5hssgePhXsWjdp3L0iFuhyFHUf+EfEjx2vZUyOdvmHe2bBM3a61Z5mDzYdbVf0CI9rh/L4jY32vI8JWEFPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NWZbaPg3; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7961fb2d1cfso378679085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719263721; x=1719868521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/CQWIetOrwwmsDk4Xx3Bzc7g2Sp+y6oh+LBYo/o6no=;
        b=NWZbaPg3jObOWzclWE+RbSuJ7UUwQkliNvdYe8/U+lJ57bQKKbnUEpTP70yooYRQN1
         90J83zHg5m0zbDTCAA7VQSxCU4IdbLJD09AqqnFgLq/a920aYb47H2Bdk6b3SuB+F8FI
         /44NxOahwCkba799Jymtzuc9SYZzdzLXW6wZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263721; x=1719868521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/CQWIetOrwwmsDk4Xx3Bzc7g2Sp+y6oh+LBYo/o6no=;
        b=kqfJ5S1Oz2jsurJGbdA3Qvqhs9aCMaKP6JPKBCZoOz2WyM+Bvfs8T8P6k5WCMb8x3Z
         k6YfqH45UG+lrBBm1GB+0XuxggnxR+6l53Ia5RiCaq/nx3UNuaIzgtS+xdk2gHrQHmLY
         yI9Eu8y/ntHJp2Oi/q3EkShoOZ12vzSUnfV+5g7mOgzVnf1dhuavPVQj0N1KSLMD/hqU
         3iCVozUyI7KTDPNhCWdwrZ7xAgjhMUvfJziaDbe9MnZbJZIs5Sz32ASrCU4KpVIGA0Cc
         ujY9B6A5CWdx2UWDJRJJFZwTSdeU/ONp8dpnZAS5jfn72l2sD8CcxwTOQcN6ILKtyqcn
         TMIw==
X-Forwarded-Encrypted: i=1; AJvYcCVhvLGLpZw8m6Vs2miq3zu3lyXPdSQ8qrEuK+l9/fElv5uQZcCwahi7fWeI1THPTn6U4oGCN9Bd+RzR9aokpQTvatESlNhaWmNXEyxYXQ==
X-Gm-Message-State: AOJu0YwqPqjwBoeDqxzX2LuE6Vh1d8jGa7Jgyqcjw7Ih2/U3jaHOzxDX
	yPuKTTIWhdm+eK0YBMAJRvfak4dZb+Kg44qyIjhZDMRX3xAKoH9I9pf9IOyou1K9ApWfhdMGs5A
	=
X-Google-Smtp-Source: AGHT+IGb7qO4CnoxaMx823K2Dx7n0TY6j6CgTK5fm57tQ/4G+GN/pkYLjBOXdXcKOCbpqOCdP8mrZA==
X-Received: by 2002:a05:620a:4549:b0:797:db7a:bc2 with SMTP id af79cd13be357-79be6f13d66mr655554485a.57.1719263720909;
        Mon, 24 Jun 2024 14:15:20 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bce942edasm347430985a.128.2024.06.24.14.15.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 14:15:20 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-44056f72257so33071cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:15:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvcBvrPs2HCgftRDqbxOjcEaNb4FuvQZAj/TUdmV+9mS1eKWEXsHVkjUEyOWt8C4n6IByW1MX+fjm4JCqA6SjH5DyJWVCvXrR1UjD1lA==
X-Received: by 2002:a05:622a:1981:b0:441:4920:1fc4 with SMTP id
 d75a77b69052e-444f256621dmr960771cf.28.1719263719282; Mon, 24 Jun 2024
 14:15:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610222515.3023730-1-dianders@chromium.org>
 <20240610152420.v4.8.I1af05e555c42a9c98435bb7aee0ee60e3dcd015e@changeid> <Znlp1_F1u-70D3QQ@hovoldconsulting.com>
In-Reply-To: <Znlp1_F1u-70D3QQ@hovoldconsulting.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Jun 2024 14:15:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XmuKUKvCq7gG+wM-jAAgHLHnYw4NteFEKz5Fmczd=U7g@mail.gmail.com>
Message-ID: <CAD=FV=XmuKUKvCq7gG+wM-jAAgHLHnYw4NteFEKz5Fmczd=U7g@mail.gmail.com>
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

On Mon, Jun 24, 2024 at 5:43=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Mon, Jun 10, 2024 at 03:24:26PM -0700, Douglas Anderson wrote:
> > The fact that the Qualcomm GENI hardware interface is based around
> > "packets" is really awkward to fit into Linux's UART design.
> > Specifically, in order to send bytes you need to start up a new
> > "command" saying how many bytes you want to send and then you need to
> > send all those bytes. Once you've committed to sending that number of
> > bytes it's very awkward to change your mind and send fewer, especially
> > if you want to do so without dropping bytes on the ground.
> >
> > There may be a few cases where you might want to send fewer bytes than
> > you originally expected:
> > 1. You might want to interrupt the transfer with something higher
> >    priority, like the kernel console or kdb.
> > 2. You might want to enter system suspend.
> > 3. The user might have killed the program that had queued bytes for
> >    sending over the UART.
> >
> > Despite this awkwardness the Linux driver has still tried to send
> > bytes using large transfers. Whenever the driver started a new
> > transfer it would look at the number of bytes in the OS's queue and
> > start a transfer for that many. The idea of using larger transfers is
> > that it should be more efficient. When you're in the middle of a large
> > transfer you can get interrupted when the hardware FIFO is close to
> > empty and add more bytes in. Whenever you get to the end of a transfer
> > you have to wait until the transfer is totally done before you can add
> > more bytes and, depending on interrupt latency, that can cause the
> > UART to idle a bit.
>
> As I mentioned last week, the slowdown from this is quite noticeable
> (e.g. 25% slowdown at @115200), but this may be the price we need to pay
> for correctness, at least temporarily.
>
> An alternative might be to switch to using a 16 byte fifo. This should
> reduce console latency even further, and may be able avoid the idling
> UART penalty by continuing to use the watermark interrupt for refilling
> the FIFO.

I'm a bit confused. Right now we're using (effectively) a 64-byte
FIFO. The FIFO is 16-words deep and we have 4 bytes per word. ...so
I'm not sure what you mean by switching to a 16-byte FIFO. Do you mean
to make less use of the FIFO, or something else?

Overall the big problem I found in all my testing was that I needed to
wait for a "command done" before kicking off a new command. When the
"command done" arrives then the UART has stopped transmitting and
you've got to suffer an interrupt latency before you can start
transferring again. Essentially:

1. Pick a transfer size.
2. You can keep sending bytes / using the FIFO efficiently as long as
there are still bytes left in the transfer.
3. When you get to the end of the transfer, you have to wait for the
UART to stop, report that it's done, and then suffer an interrupt
latency to start a new transfer.

So to be efficient you want to pick a big transfer size but if there's
any chance that you might not need to transfer that many bytes then
you need to figure out what to do. If you can handle that properly
then that's great. If not then we have to make sure we never kick off
a transfer that we might not finish.

I'd also mention that, as talked about in my response to your other
patch [1], I'm not seeing a 25% slowdown. I tested both with my simple
proposal and with this whole series applied and my slowdown is less
than 2%. I guess there must be something different with your setup?
Trying to think about what kind of slowdown would be reasonable for my
patch series at 115200:

a) We send 64 bytes efficiently, which takes 5.6ms (64 * 1000 / 11520)

b) We stop transferring and wait for an interrupt.

c) We start transferring 64 bytes again.

Let's say that your interrupt latency is 1 ms, which would be really
terrible. In that case you'll essentially transfer 64 bytes in 6.6ms
instead of 5.6 ms, right? That would be an 18% hit. Let's imagine
something more sensible and say that most of the time you can handle
an interrupt in 100 ms. That would be about a 1.7% slowdown, which
actually matches what I was seeing. For reference, even an old arm32
rk3288-veyron device I worked with years ago could usually handle
interrupts in ~100-200 ms since dwc2 needs you to handle at least one
(sometimes more) interrupt per USB uFrame (250ms).

...so I'm confused about where your 25% number is coming from...


[1] https://lore.kernel.org/r/CAD=3DFV=3DUwyzA614tDoq7BntW1DWmic=3DDOszr+iR=
JVafVEYrXhpw@mail.gmail.com

