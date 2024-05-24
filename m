Return-Path: <linux-arm-msm+bounces-20362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D71E8CDEDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 02:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 877A81F2117E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 00:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F574816;
	Fri, 24 May 2024 00:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c0PNkwvg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5E57FB
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 00:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716510315; cv=none; b=MYTiWl/vNhsJwiHwiE605528KFU98EtbbqplWVRjVSItBTHdvT1n0bD7WGPst3QzY4VYxq4uFp3OwEqcZ3BOkoS2scwJmnS2oKXm0KHROFfcWNlEHhfzJpXQsSNI1xpvs8Mt2GUbuXQQSD04MbIkSOOqVF3qmdytRFSIY9fIOJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716510315; c=relaxed/simple;
	bh=U+XQqQjFGY0Dsnz1iYyMGSwZE5e64uigVIBpySGsOWQ=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SnqZojKZZZADX6Kbc1PcYCw+WPBpIkbysP+7djCaGE1BXQyIPp/TpTmHQIAkYu/YlQ1N/KKk2jkoo5UVkIsjku/x3gFdrv4Hm4yXkvGSad8POjBe5hflTk6vfAYrf0FtJRFk7CxszH46d1XMfLOOUFbJ6YOj++gxK6fZ/mU99jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c0PNkwvg; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-79305314956so199436885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 17:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716510312; x=1717115112; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZX2oAdiZue5vGuu38VdxDUrJ1eMtA33xvB1yO4Vm7T4=;
        b=c0PNkwvggpIrbWlbj9sRMJfNM2D47FdObwLX/tEWZIK+r57zbLqX2gMgJ579DDq1zm
         Yn2H0M3E4aw0yr4awUDYI02ixHDnQFpaspApbOmpY6C9Y97jN7M3FJkdoszkRku+3+tQ
         PeDFZjcrH5/BJb0/ARPOs5+/jKWMWvExoo0dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716510312; x=1717115112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZX2oAdiZue5vGuu38VdxDUrJ1eMtA33xvB1yO4Vm7T4=;
        b=CyZ5t+0dKZxsOb9yDtA+mNaSbB8UZvnKLi3ifSWI6ty4WEo1uNkgCYyCCtvgROsVrK
         zp3GDWZOxphIrrgGiqzEpZ3vtaNPZm3ba/q4sGL+DwCYduhbus+76t1wyiHyArv1e/5t
         j14qhK9SNQXSz+psvW8pelnIqBsOjNuxF13W59MpFzBkXy26rcHtSvUqQHSsYzLx8g/y
         EMUBTyDuZNCoH9o33VV5kS3gDVuv8wm6IltuCc9LQxGRUR+7MExVa1Dnl9H9X0hD46Mi
         8iSFx2/2v3MtCZtwhMNev8w6nMM2Q5LXLCsCyqVCMGWOFb5v9eEbScJQ14CHwXWMsJvq
         qJGg==
X-Forwarded-Encrypted: i=1; AJvYcCVcnmP9z6zSJyW1ZP+DL5j6DLqeVQ46psa1tTEN/DbUGMFJG/as3Xvpd/w7I85pJPQ7F4qUbWSsbVJFQDUryUaMSk0WpTMpq/KaIy93ww==
X-Gm-Message-State: AOJu0Yzd5qmYeLXTSpSgxVYY5Uv6o2YY283O0YtH7fvMdd15thTsCBBV
	9ItxwoAOfcg4/xYk8I1aShH4dXXgSzbbXLTUHuHD16VUNv+1ihKc+VRdQe24K5xnk9NOyGb1tiC
	psgN4jd7ojECCiabzZ1AWDa5XfmMXtm9urili
X-Google-Smtp-Source: AGHT+IGFLK1p3SdN9AodStf+OL72IZFLq1VoeAAFc3OOdOka8ZwEhPtfLoJ456ZTTwjV8kUX6SQvIZZmMiHRGzOhlRc=
X-Received: by 2002:a05:620a:2952:b0:792:9a4b:dcd4 with SMTP id
 af79cd13be357-794ab09e87cmr96261885a.45.1716510312469; Thu, 23 May 2024
 17:25:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 May 2024 17:25:11 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240523162207.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid>
References: <20240523232216.3148367-1-dianders@chromium.org> <20240523162207.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 23 May 2024 17:25:11 -0700
Message-ID: <CAE-0n51nBXsaubmtbUxPBsNDiNuOVa1hB9O0bihm8fpEhEDjRg@mail.gmail.com>
Subject: Re: [PATCH 1/2] serial: port: Don't block system suspend even if
 bytes are left to xmit
To: Douglas Anderson <dianders@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	John Ogness <john.ogness@linutronix.de>, Tony Lindgren <tony@atomide.com>, 
	linux-arm-msm@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Yicong Yang <yangyicong@hisilicon.com>, Guanbing Huang <albanhuang@tencent.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Douglas Anderson (2024-05-23 16:22:12)
> Recently, suspend testing on sc7180-trogdor based devices has started
> to sometimes fail with messages like this:
>
>   port a88000.serial:0.0: PM: calling pm_runtime_force_suspend+0x0/0xf8 @ 28934, parent: a88000.serial:0
>   port a88000.serial:0.0: PM: dpm_run_callback(): pm_runtime_force_suspend+0x0/0xf8 returns -16
>   port a88000.serial:0.0: PM: pm_runtime_force_suspend+0x0/0xf8 returned -16 after 33 usecs
>   port a88000.serial:0.0: PM: failed to suspend: error -16
>
> I could reproduce these problem by logging in via an agetty on the
> debug serial port (which was _not_ used for kernel console) and
> running:
>   cat /var/log/messages
> ...and then (via an SSH session) forcing a few suspend/resume cycles.
>
> Tracing through the code and doing some printf debugging shows that
> the -16 (-EBUSY) comes from the recently added
> serial_port_runtime_suspend().
>
> The idea of the serial_port_runtime_suspend() function is to prevent
> the port from being _runtime_ suspended if it still has bytes left to
> transmit. Having bytes left to transmit isn't a reason to block
> _system_ suspend, though.

Can you elaborate? I paused to think that maybe we would want to make
sure that everything that was transmitted had been transmitted but that
doesn't seem right because it's a problem for higher layers to solve,
e.g. serdev would want to make sure some sleep command sent over the
wire actually got sent.

> The DEFINE_RUNTIME_DEV_PM_OPS() used by the
> serial_port code means that the system suspend function will be
> pm_runtime_force_suspend(). In pm_runtime_force_suspend() we can see
> that before calling the runtime suspend function we'll call
> pm_runtime_disable(). This should be a reliable way to detect that
> we're called from system suspend and that we shouldn't look for
> busyness.
>
> Fixes: 43066e32227e ("serial: port: Don't suspend if the port is still busy")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/tty/serial/serial_port.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/tty/serial/serial_port.c b/drivers/tty/serial/serial_port.c
> index 91a338d3cb34..b781227cc996 100644
> --- a/drivers/tty/serial/serial_port.c
> +++ b/drivers/tty/serial/serial_port.c
> @@ -64,6 +64,16 @@ static int serial_port_runtime_suspend(struct device *dev)
>         if (port->flags & UPF_DEAD)
>                 return 0;
>
> +       /*
> +        * We only want to check the busyness of the port if PM Runtime is
> +        * enabled. Specifically PM Runtime will be disabled by
> +        * pm_runtime_force_suspend() during system suspend and we don't want
> +        * to block system suspend even if there is data still left to
> +        * transmit. We only want to block regulator PM Runtime transitions.

s/regulator/regular/

Is this a typo? Also, why is "runtime" capitalized?

> +        */
> +       if (!pm_runtime_enabled(dev))
> +               return 0;

