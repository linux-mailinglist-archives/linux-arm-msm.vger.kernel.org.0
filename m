Return-Path: <linux-arm-msm+bounces-19083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 147DC8B8F6E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 20:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFCF72843CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 18:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9831474B1;
	Wed,  1 May 2024 18:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rFma4A9e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D96146D5F
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 18:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714587089; cv=none; b=LaIUTsrUN0RaHLKhZUvIW20RrgYARkAzAkMRieYR9eOaMLarsDxreyIh9jRbXA6Rf3HxfsLpXMh091aBcK0cCzZ8XkH/jwYXqEC7bSl91BSb0/MyqStq0Oz1wgVgv8EnMmMEdjlUNNzghkB5rGgSY9UX4t259AMb6Ad+kVo8VjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714587089; c=relaxed/simple;
	bh=nFKXvXLadFn2sb+yZv1KYPN17au5eDoEgdinwHBjegs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H1j5a4D4tYAi9rje3cauKFVBDspUDAdmYGakPS6DEj4yqQScLsw8/9+jk2PcCHBpMj41bku0LYtjZTe9vJvSsMtVelPE8iwT6DEeP6PAApbydzuueBJiB76BDBbO5exJtcdy8SJloNopxxzHHz8FKUcStHvQcrV23OK0F6DQ5WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rFma4A9e; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-de46da8ced2so8055149276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 11:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714587087; x=1715191887; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nFKXvXLadFn2sb+yZv1KYPN17au5eDoEgdinwHBjegs=;
        b=rFma4A9efte33EURdRIpaparIC1NRvk+pVkelqXW2FhJIWYQEIn7h7jTR09O88Og05
         jPY2Qg8EIuezqOBS2eNR5g3u3hOCJ1yP8Y369zcKTwehQqZvItSh5zWBIsh1nTKUdSOk
         wsCjXJ9j2UV2OtXDnZEEWWxGV4BuKMCCtOwqmy2kOJMLTjdTOSj9LFDMmydBh+U/KI/M
         XwPJL5rmMP+JuX3MiIj0944wh2xCdcgjHg4ej2Rir7m9zUIrXfYrxpUwFHGKi67V5NlZ
         BIinxa6PGReOK16M46V4c5XFyii0+50wpdut74IJUzflRXGBgX9LTdUU6skj3Z1wu7OD
         VkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714587087; x=1715191887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFKXvXLadFn2sb+yZv1KYPN17au5eDoEgdinwHBjegs=;
        b=XYQmyRYT3pmDlxifh04C+39Iii5EKLUk1+/rmiJYTJkw2A3DCMYEt2qXzoZbVJsYpS
         mmoDl9F1uwkeL6MluhtKnOGRBBXQncanKVTOho7gZ/DHLmnn0v3tAgAHjQDdGx7MDI9g
         F9MRBY7Nsgil9bpYiFcHOCaY7gcQ/8taoKeOXuBXXPNqhNEQ8k6R5OPRACSY3YHIE8yM
         JL/M05m1mUQzkx4O1qhShEAzZO5kHpAr3hFgVCK7+XSqdDfT3W1kzufWVK0cvrCLPeTv
         6O6c8OlHAV1JRsxSEIEv1RKI1dpH/Q3yT4Q28Uw8vIENOuleRjDl0JzF5CqNJBGB3hPZ
         HT7g==
X-Forwarded-Encrypted: i=1; AJvYcCUa+UbTjbQ2wGoJMJZ6AZ948PSzvRPtwSAdqv/uTGV80GuUylCKLmlt8cKztNuaNy5JhFLfIUKofVI5SV/9NYVQYJJlamSudSYzpIQgMQ==
X-Gm-Message-State: AOJu0YxoFwIOH+KXb2bAuTXG14cVnR+kHDfH7gVyM/OY3L3IOYyIyoqy
	8fgpsvPETX4sQY4e0DNbeaGRTSrVdSmPb+rAbMOzgaRzts2crPygYWEtyxmxRslAEv2pprZdhAo
	4yIeiTapfifRpsg1vzM1E0MF8/1/d+yzcEBynxg==
X-Google-Smtp-Source: AGHT+IHYNIdvTb4iBMDLqUY1RqQeF19T75NgRtsKlfmqPhm1TYOhVCTd8FMhMWbpI1r7ar+/niUA1T2KEBeRinx6paM=
X-Received: by 2002:a25:bcc5:0:b0:de6:1245:c3d5 with SMTP id
 l5-20020a25bcc5000000b00de61245c3d5mr3406926ybm.60.1714587085478; Wed, 01 May
 2024 11:11:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327202740.3075378-1-swboyd@chromium.org> <CAD=FV=VLwa0AFsrXXxKGG+hcyW+h7u7-tyg3uoDB8M_XdPti_Q@mail.gmail.com>
 <CAE-0n51osUcpqqh6o9OhURLbRKjcWbRZT-5oHLi_mwfJsUngEw@mail.gmail.com>
In-Reply-To: <CAE-0n51osUcpqqh6o9OhURLbRKjcWbRZT-5oHLi_mwfJsUngEw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 1 May 2024 21:11:14 +0300
Message-ID: <CAA8EJpqVGHqufKo1kV52RzQCNL5D92mmnCzUwKZn4o+5=wF9pQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix a black screen on sc7180 Trogdor devices
To: Stephen Boyd <swboyd@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Laura Nao <laura.nao@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 May 2024 at 03:17, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2024-03-28 09:39:54)
> >
> > I spent a bunch of time discussing this offline with Stephen and I'll
> > try to summarize. Hopefully this isn't too much nonsense...
> >
> > 1. We'll likely land the patches downstream in ChromeOS for now while
> > we're figuring things out since we're seeing actual breakages. Whether
> > to land upstream is a question. The first patch is a bit of a hack but
> > unlikely to cause any real problems. The second patch seems correct
> > but it also feels like it's going to cause stuck clocks for a pile of
> > other SoCs because we're not adding hacks similar to the sc7180 hack
> > for all the other SoCs. I guess we could hope we get lucky or play
> > whack-a-mole? ...or we try to find a more generic solution... Dunno
> > what others think.
>
> I think we should hope to get lucky or play whack-a-mole and merge
> something like this series. If we have to we can similarly turn off RCGs
> or branches during driver probe that are using shared parents like we
> have on sc7180.
>
> Put simply, the shared RCG implementation is broken because it reports
> the wrong parent for clk_ops::get_parent() and doesn't clear the force
> enable bit. With the current code we're switching the parent to XO when
> the clk is enabled the first time. That's an obvious bug that we should
> fix regardless of implementing proper clk handoff. We haven't
> implemented handoff in over a decade. Blocking this bug fix on
> implementing handoff isn't practical.

Yes, that needs to be fixed. My approach was to drop the XO parent and
consider the clock to be off if it is fed by the XO.

> Furthermore, we're relying on clk
> consumers to clear that force enable bit by enabling the clk once. That
> doesn't make any sense, although we could use that force enable bit to
> consider the RCG as enabled for clk_disable_unused.

That patch seems fine to me. Will it work if we take the force-enable
bit into account when considering the clock to be on or off?

>
> An alternative approach to this series would be to force all shared RCGs
> to be parented to XO at clk registration time, and continue to clear
> that RCG force enable bit. That's sort of what Dmitry was going for
> earlier. Doing this would break anything that's relying on the clks
> staying enabled at some frequency through boot, but that isn't supported
> anyway because clk handoff isn't implemented. It avoids the problem that
> the first patch is for too because XO doesn't turn off causing a clk to
> get stuck on. I can certainly craft this patch up if folks think that's
> better.

I think this approach makes sense too (and might be preferable to
boot-time hacks).
On most of the platforms we are already resetting the MDSS as soon as
the mdss (root device) is being probed. Then the display is going to
be broken until DPU collects all the coonectors and outpus and finally
creates the DRM device.

But I think we should fix the get_parent() too irrespectively of this.

> To ease the transition we can make a new clk_ops for the RCG as well so
> that each SoC has to opt-in to use this behavior. Then we can be certain
> that other platforms aren't affected without being tested first. I'd
> prefer to not do that though because I fear we'll be leaving drivers in
> the broken state for some time.

SGTM

--
With best wishes
Dmitry

