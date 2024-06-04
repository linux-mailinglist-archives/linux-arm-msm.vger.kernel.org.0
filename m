Return-Path: <linux-arm-msm+bounces-21642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D6C8FB8D3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 18:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1724B31986
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 16:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D3C13D619;
	Tue,  4 Jun 2024 16:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n3yP1V1y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F48613C9CF
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717517033; cv=none; b=L/Yctr3ReHb50LsrN06Z7+cZkDMy223KrVUpip+z/QNHP2TLECHopz53RnBsNV/pOoSBuk9oSwYYZxYzFoGt9g8nc9ZMe9cWuMObfp6gZy9QZKnD4btQrwuM1RyDOO31wTjnljiuELso2YL7spOA/smOMUJO2iORhkOaEGHiUSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717517033; c=relaxed/simple;
	bh=fCfuzTtN4vxinrnr6ryh7AWn7RkEBSGq87lwfde96Js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2IqgxHTgM79uZExEk4hPmBD+ctW6GVEEDv1Hvy0dSuZLCv/KfgJmjquZFTLkMGwKoMrj4BNqOd7SU3mxBsVEEawJAKzZlcuQvOV32sT7vlvZlj1Ibc2TfZwhgtMAjxqcHTiT+nMLBNo+gTZePU9tQbhrNgFLnpxPCid7Zbig0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n3yP1V1y; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ae4d4abeb8so24718676d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 09:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717517030; x=1718121830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yW6AzAmbhpq5YYuKBleVnj9cgdBmviPhWbCyLtuJLek=;
        b=n3yP1V1y7LLM8rwz8XhdFUTAD6HoZ4fBijBYCtpzK12kk2ebmbG3r4Apte4xKD6vfN
         PkPlq1chXSqNT1zPmBbZjoi64H+9fztWJhOmau8SnzpbNVaBYEJ1sCatxPGQ27+gIj/h
         fJlEy/EEuTG3CJ1YoBiWX+BX/59ODSPJaqVTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717517030; x=1718121830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yW6AzAmbhpq5YYuKBleVnj9cgdBmviPhWbCyLtuJLek=;
        b=QKJKW9ygEYAQvVEtGuI5gmYQrOKoznCTb6mbdWzLV8W6w4rATEx+H16N1M0lojBstp
         ApGp1Qt78kzB9qoZtEc8t4Nz/AfNojxM/6qB8X+AzyL9gnACD0II9UwE0D074qx1jZGf
         MDT1EtztOnQ/wIOim2VY/35Ic4D1IljTunWP/wxA/HNi9YPFR2rgwRgdb8ADoXTAwyNM
         kTvIEGbIbgHscym5rIkSa+AHxQ0nArVl9EVdBuAxkYxlj5mFJSrWKWErbIBSLsN5ivym
         PJMRUofzCkKl49H2lu4BLFZFH9Fo6zVpSadwVMfhllfujNC0koZhhlFiYDODYAB63McG
         El+w==
X-Forwarded-Encrypted: i=1; AJvYcCUpMOX5v1Oe+ZoIAJLejbU9TUAyP31nPzNDUu5Im34yYslHwX1OA7sJ/F/6V4qQrKvf3zwL2z7i8QQimVOpZnH9ky/svqongBaW2fdriA==
X-Gm-Message-State: AOJu0YyWFIMdsd1mhqeeWfJG+qhKG7n7DK7UUc1YKnMSlIFfPwMnI5pM
	ICq6bUscXr1zrvZy5/hlTrLZ1FBXWr7qKPk5ucSjbON9VS62OePQa92jR25tW1Xl71Lpmi7I2Bk
	=
X-Google-Smtp-Source: AGHT+IGR11ZqA3imqJjB9/ySHE9ij9Y/xsWymF1nd6vfECgr2YeqqA73iGHxTwaa4OQRAqo0shm0IA==
X-Received: by 2002:a05:6214:3204:b0:6ae:abc:82fe with SMTP id 6a1803df08f44-6aecd59a276mr137485996d6.27.1717517029608;
        Tue, 04 Jun 2024 09:03:49 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43ff2595290sm50817361cf.89.2024.06.04.09.03.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 09:03:49 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-440075abc22so191831cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 09:03:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1yCi9Mm7C/+QFOXP7ncopPPQcWqf4s8lQjliIFuSsrUsuff42EqzIUuFCmOzqNHFgL6GQLMgRi5NHW0AOwRIoQxO10pFtxt54d2rYmw==
X-Received: by 2002:a05:622a:5806:b0:43f:fc3d:8c27 with SMTP id
 d75a77b69052e-4401e67b64fmr3162831cf.23.1717517028368; Tue, 04 Jun 2024
 09:03:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530224603.730042-1-dianders@chromium.org>
 <20240530154553.v2.6.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid> <5e4b2c9a-aa78-6ee6-f570-baf343cf2569@linux.intel.com>
In-Reply-To: <5e4b2c9a-aa78-6ee6-f570-baf343cf2569@linux.intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 4 Jun 2024 09:03:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQHGZzJzZgEgSYsfCWYCAwM3GY_18sbqcDnGoUAo5bmA@mail.gmail.com>
Message-ID: <CAD=FV=XQHGZzJzZgEgSYsfCWYCAwM3GY_18sbqcDnGoUAo5bmA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] serial: qcom-geni: Fix suspend while active UART xfer
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-msm@vger.kernel.org, John Ogness <john.ogness@linutronix.de>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Tony Lindgren <tony@atomide.com>, Stephen Boyd <swboyd@chromium.org>, 
	linux-serial <linux-serial@vger.kernel.org>, Yicong Yang <yangyicong@hisilicon.com>, 
	Johan Hovold <johan+linaro@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 31, 2024 at 8:13=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 30 May 2024, Douglas Anderson wrote:
>
> > On devices using Qualcomm's GENI UART it is possible to get the UART
> > stuck such that it no longer outputs data. Specifically, I could
> > reproduce this problem by logging in via an agetty on the debug serial
> > port (which was _not_ used for kernel console) and running:
> >   cat /var/log/messages
> > ...and then (via an SSH session) forcing a few suspend/resume cycles.
> >
> > Digging into this showed a number of problems that are all related.
> >
> > The root of the problems was with qcom_geni_serial_stop_tx_fifo()
> > which is called as part of the suspend process. Specific problems with
> > that function:
> > - When we cancel an in-progress "tx" command it doesn't appear to
> >   fully drain the FIFO. That meant qcom_geni_serial_tx_empty()
> >   continued to report that the FIFO wasn't empty. The
> >   qcom_geni_serial_start_tx_fifo() function didn't re-enable
> >   interrupts in this case so we'd never start transferring again.
> > - We cancelled the current "tx" command but we forgot to zero out
> >   "tx_remaining". This confused logic elsewhere in the driver
> > - From experimentation, it appears that cancelling the "tx" command
> >   could drop some of the queued up bytes. While maybe not the end of
> >   the world, it doesn't seem like we should be dropping bytes when
> >   stopping the FIFO, which is defined more of a "pause".
> >
> > One idea to fix the above would be to add FIFO draining to
> > qcom_geni_serial_stop_tx_fifo(). However, digging into the
> > documentation in serial_core.h for stop_tx() makes this seem like the
> > wrong choice. Specifically stop_tx() is called with local interrupts
> > disabled. Waiting for a FIFO (which might be 64 bytes big) to drain at
> > 115.2 kbps doesn't seem like a wise move.
> >
> > Ideally qcom_geni_serial_stop_tx_fifo() would be able to pause the
> > transmitter, but nothing in the documentation for the GENI UART makes
> > me believe that is possible.
> >
> > Given the lack of better choices, we'll change
> > qcom_geni_serial_stop_tx_fifo() to simply disable the
> > TX_FIFO_WATERMARK interrupt and call it a day. This seems OK as per
> > the serial core docs since stop_tx() is supposed to stop transferring
> > bytes "as soon as possible" and there doesn't seem to be any possible
> > way to stop transferring sooner. As part of this, get rid of some of
> > the extra conditions on qcom_geni_serial_start_tx_fifo() which simply
> > weren't needed and are now getting in the way. It's always fine to
> > turn the interrupts on if we want to receive and it'll be up to the
> > IRQ handler to turn them back off if somehow they're not needed. This
> > works fine.
> >
> > Unfortunately, doing just the above change causes new/different
> > problems with suspend/resume. Now if you suspend while an active
> > transfer is happening you can find that after resume time you're no
> > longer receiving UART interrupts at all. It appears to be important to
> > drain the FIFO and send a "cancel" command if the UART is active to
> > avoid this. Since we've already decided that
> > qcom_geni_serial_stop_tx_fifo() shouldn't be doing this, let's add the
> > draining / cancelling logic to the shutdown() call where it should be
> > OK to delay a bit. This is called as part of the suspend process via
> > uart_suspend_port().
> >
> > Finally, with all of the above, the test case where we're spamming the
> > UART with data and going through suspend/resume cycles doesn't kill
> > the UART and doesn't drop bytes.
> >
> > NOTE: though I haven't gone back and validated on ancient code, it
> > appears from code inspection that many of these problems have existed
> > since the start of the driver. In the very least, I could reproduce
> > the problems on vanilla v5.15. The problems don't seem to reproduce
> > when using the serial port for kernel console output and also don't
> > seem to reproduce if nothing is being printed to the console at
> > suspend time, so this is presumably why they were not noticed until
> > now.
>
> Hi,
>
> This was quite tiring to read. :-) It's has lots of useful information bu=
t
> it could be structured better.
>
> Could you try to rewrite this entire description so that it's easier to
> find the problem and final solution information from it. Start with those
> two things, and in that part, try to avoid detouring to extra branches yo=
u
> took while finding and solving the problem.
>
> You can place how the problem can be reproduced after you've described th=
e
> root cause & final solution first. Extra information why some other
> approaches do not work is also useful information, but please place it
> after the final solution has been covered first.
>
> Also, try to avoid I/you/we, use imperative tone.

Sure. I'll try. It's always a tradeoff between providing too much
information and not providing enough. In general I find that providing
the thought process can help someone else who is likely going to go
through the same thing as they're trying to understand the patch, but
I agree it can also be overwhelming.

Sure. I've attempted to use the imperative tone when possible. In
general (unless my understanding is flawed) it's not possible to use
imperative when explaining to the reader how the hardware/driver works
or what the problem is and (IMO) we shouldn't fully remove these types
of explanations from the commit message. When describing what the
patch actually does, though, I've tried to make sure it's in
imperative form. If you have wording changes on v3 then please suggest
specific changes.

-Doug

