Return-Path: <linux-arm-msm+bounces-32087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F4097D64A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 15:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C1C6286241
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 13:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23A617B51B;
	Fri, 20 Sep 2024 13:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xhyBlidS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC529158DB1
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 13:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726839537; cv=none; b=J7FnnLl/NtCx22MgTSVCt/NGlJ3OuSvWsGb9DycXAo6QKbm015KwcCzkdk8ui/oMjEF2OmZCEXpdrOp2ezIHq0VcV+t9BkAQPMKHUAh6tIptGvgCToYEFjKkD0mptafINDZm7esY+K3PkAdHHIRaKzPdDGkcWocI7nkY0mQpo5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726839537; c=relaxed/simple;
	bh=uwy521Wq//LDB1VjjbGONgVeYOhq0Cx51x30cZ0QpfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CzvuW0Oz2Lw26jXuenKHE5gBdz4DI9zbyutQahaMkIYmyBphxWrx9EKT4ocakbNav4CJ2wyC7KcFKqBarmFIdQ8R0BhAj91tTvFfBYrVD5m5F9iwJkg4poiVZiDfejTlpGvtEBB7PKYhmRCjv24dOsn7QoiHHVHnDCDnkOgu82w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xhyBlidS; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso356619366b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 06:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726839534; x=1727444334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6nua9lBreH4pniRm9sNeuVot1xTd+1IeLvCiRrKDqCk=;
        b=xhyBlidSyYlZ1dldu3BWqEzuaY/jzsAVjqbhWiDKPM3t0iDDf/75pN3LKASdXZAps0
         LW3sIYkCqnYBhnSeFhCr7TMsbOKicI5pRUesYW9zJxGka6huboc4zuj5bNz3+9wEHncZ
         CG7ydTmD/lVSqMNozkmGAKxaL5piMQRa+shWR0k9Xd9VRf0hLhz7TpxbV5MOGYECpWA3
         e9p1Z3tXvdbdhRmzYDOMgb88srsJnz6pnwQKG06xWK1R838N7CF8U27sEyAoqqBF1Rg6
         rIiHeZfgqURxmHjZb26R86M44O/6dldsWno8Hd19k0PYXXEsW9AxIl3Kbw3o7dBIe7T2
         isTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839534; x=1727444334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nua9lBreH4pniRm9sNeuVot1xTd+1IeLvCiRrKDqCk=;
        b=lihAxjys9yiBGjms0/D2vwgjYMhNZ0qm4W7A+R46q02okrLWUO06pYBB26KbC3YsCs
         6N0BIgGuQUgNROmAomC+SDUZhOYKXYjItk4CL/h3bulm7ltOkkEOMmOct9CA1cahers+
         ceupAth1qdy24iQuH8UvOeVHVkq5JefhtZdK/iMfQ+eE0l2zPtBZhOwzmOGA3fwAEUaP
         jJandSOfTw9yXtOTlDbP63GMoXdl9ntvZkE/ZJVLaDcoaIrNinOCYVMxcfzDG1oJp+rn
         tMbHmRZve2GFv2O/85IU2J3WPA5LtmDY7xTIzUKSBDPzDr3KhijIMU0kKC4UEZ81BgqF
         8SmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyiF2DN27jHOhOvvggO00EZZVgQjp0x3LyScmT40iE33NlmSBE0w5sd7HpoBlPGBJnul7sKN+JA8/1/TH6@vger.kernel.org
X-Gm-Message-State: AOJu0YzUPk8zNf5AAPRbA4B+ImPMJXbtv3QTKaPHBZ20Nfp63HkLC93C
	bpUHPMbs9skpILf5eqDXQpxpfqqtK5+M6bPJb1NwjwULOc+S30r/RVNmhGjXX6c=
X-Google-Smtp-Source: AGHT+IH/b42mb53eprDqyvAXwCp6PuRpZ/h0MnX0Y03+kqaCROwk/vdCC9t8YA/9swqos3U3i1D/Hw==
X-Received: by 2002:a17:907:a0e:b0:a90:3494:2aa9 with SMTP id a640c23a62f3a-a90c1c363c1mr735135066b.2.1726839534014;
        Fri, 20 Sep 2024 06:38:54 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef80:de75:1bb0:80e4:4afd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9061331938sm845930566b.222.2024.09.20.06.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 06:38:53 -0700 (PDT)
Date: Fri, 20 Sep 2024 15:38:47 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, stephan@gerhold.net,
	loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] net: wwan: qcom_bam_dmux: Fix missing
 pm_runtime_disable()
Message-ID: <Zu165w1ZzLiRvXOp@linaro.org>
References: <20240920100711.2744120-1-ruanjinjie@huawei.com>
 <lqj3jfaelgeecf5yynpjxza6h4eblhzumx6rif3lgivfqhb4nk@xeft7zplc2xb>
 <Zu1uKR6v0pI5p01R@linaro.org>
 <CAA8EJprysL1Tn_SzyKaDgzSxzwDTdJo5Zx4jUEmE88qJ66vdFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprysL1Tn_SzyKaDgzSxzwDTdJo5Zx4jUEmE88qJ66vdFg@mail.gmail.com>

On Fri, Sep 20, 2024 at 03:05:13PM +0200, Dmitry Baryshkov wrote:
> On Fri, 20 Sept 2024 at 14:44, Stephan Gerhold
> <stephan.gerhold@linaro.org> wrote:
> >
> > On Fri, Sep 20, 2024 at 01:48:15PM +0300, Dmitry Baryshkov wrote:
> > > On Fri, Sep 20, 2024 at 06:07:11PM GMT, Jinjie Ruan wrote:
> > > > It's important to undo pm_runtime_use_autosuspend() with
> > > > pm_runtime_dont_use_autosuspend() at driver exit time.
> > > >
> > > > But the pm_runtime_disable() and pm_runtime_dont_use_autosuspend()
> > > > is missing in the error path for bam_dmux_probe(). So add it.
> > >
> > > Please use devm_pm_runtime_enable(), which handles autosuspend.
> > >
> >
> > This would conflict with the existing cleanup in bam_dmux_remove(),
> > which probably needs to stay manually managed since the tear down order
> > is quite important there.
> 
> Hmm, the setup and teardown code makes me wonder now.

Yeah, you ask the right questions. :-) It's really tricky to get this
100% right. I spent quite some time to get close, but there are likely
still some loopholes. I haven't heard of anyone running into trouble,
though. This driver has been rock solid for the past few years.

> Are we guaranteed that the IRQs can not be delivered after suspending
> the device?

I think bam_dmux_remove() should be safe. disable_irq(dmux->pc_irq)
prevents any further delivery of IRQs before doing the final power off.

> Also is there a race between IRQs being enabled, manual check of the
> IRQ state and the pc_ack / power_off calls?

Yes, I'm pretty sure this race exists in theory. I'm not sure how to
avoid it. We would need an atomic "return current state and enable IRQ"
operation, but I don't think this exists at the moment. Do you have any
suggestions?

Thanks,
Stephan

