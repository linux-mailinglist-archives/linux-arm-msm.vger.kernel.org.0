Return-Path: <linux-arm-msm+bounces-26482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B70B934087
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 18:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24C901F245D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 16:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F822181B99;
	Wed, 17 Jul 2024 16:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWdOlfL9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92A7224FA;
	Wed, 17 Jul 2024 16:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721234040; cv=none; b=AgkNmJWOrZT6vTq5T3WmIjiktfoRhGb/zfUlwhtMJmgyYG2ipalHCsYrfpp4lUM9h1lxr7cFr0aDvUaPnlyOn2Vlj+3gJubd9NwmCaZhhj+TMpkqJwiJnTnUlmix6Jq9FknwjNre8b85755r4HFjc3YXxe3ccGTDod9O7V/PSM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721234040; c=relaxed/simple;
	bh=eR+IpSFHTJwj1F3U9PG174HQKqE7xDYlltM7oX9Ds84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFJPjIlNgLs1sJYUs0W/y9n/jOilcvHZc3/2zNnm42TBeVr6ltinCxNKpyYERTSIv6wOUEEYVjShUUAhgPR3Up9us7ROX1KLZE39zSJJpiEvgUwTUdBbyo8EG4NRy7duCYsMdG5FXho0kP+dZVoZ+0K+1TTEda5DGr1RXXnkisc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWdOlfL9; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a77d85f7fa3so184748266b.0;
        Wed, 17 Jul 2024 09:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721234037; x=1721838837; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GInFX+KjHCh2SZ3uixPMhANVTPTX0s1Mpxztx+WvSTA=;
        b=eWdOlfL9XnGGYpaoxXFgWtX/aKE1V4A/r4x2eatQIwNIbULCo3VlhcVnWI1LAFVGd2
         7yBU4gISEcfG/bT+rs2IhIk03ddTjnwrjJfh3LQXcjl9uPbxwSqKWPkjAZYRh2yo7okw
         /cqBxeFHgBY1AKYBW9pN4k6OQzZUzGEkTydM5S01u6pESqEJ8izZNr4vB0k10Sdu/3dr
         PH7ZkCllz33ZVxpHnowlvprHl3nMrur1ovrR0u0z3WMul5pA6m0UfxB9T6ZUfJ5ioLZn
         KZ405h5ViWO/HhenzsHqGlJP6TOU8p75ZFdNW8tjCsvj9spbpKAyYMiXzhnXWbW0/TZf
         SmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721234037; x=1721838837;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GInFX+KjHCh2SZ3uixPMhANVTPTX0s1Mpxztx+WvSTA=;
        b=KpJEruQIBkUP2PHNEiuzk067ZHGXtLL2IdcYDi7gmOp9wa1UYNm54vjCM9uCnHxGdy
         dXJFDDRxZwP7gAmwQA32dV0kOaWb/F8UrljMCVRMe+qIiTvg5iIWz7eL0gSWz+jA3ED7
         jPXWPCf7GmSpsyEBNXxtemM0QcBH8hs5vWVsFhrjj5STAalWVoGn6VtjvA9vSGF3JKhr
         okvOgHzQ9awp8qNGmISc6KWMtCq5+sf9bwv3zc3HFYIqGb6d5igwDhjxKpgILHexSCvj
         QK6Tq6uGDFvP0tlkKmmMNhD5XQo+JX95WciRxPM7jNXS7KhJ8APiaP1GE3gKi4+eGnw0
         b8tg==
X-Forwarded-Encrypted: i=1; AJvYcCXidQys7uAJP5fNzG5oWY/H+t2GBlF+tmtyJM8HJYBv1PiL9K0DoRCk5EPsJDRsAH7JDhxDsiimB29teCHfKwaoqqiOGBWyPEn85xgMhRHGSfz0QDYIrYF4MgeuR1TuP9yp8RvUUB+5zSszMQ==
X-Gm-Message-State: AOJu0Yy+3BuYLvDjsUErLj9e1CO8873xqnXL3/7MGFDGRsIPV2lKyvTY
	JRx3TWSafpB0C3kZOkVV8cTXyP7WzSbB4OMTF497Dv/lVrGG1BSA
X-Google-Smtp-Source: AGHT+IG+pJCuJO7wqUIo6mEWXUTt+L9f5QLWe2SlWxtz8fE12AIl6KwlmaFJE+tbVXCalbz5FHfNHg==
X-Received: by 2002:a17:906:af0d:b0:a77:ecf0:84e5 with SMTP id a640c23a62f3a-a7a0f13be53mr16604966b.14.1721234036828;
        Wed, 17 Jul 2024 09:33:56 -0700 (PDT)
Received: from trashcan (public-nat-01.vpngate.v4.open.ad.jp. [219.100.37.233])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5a342esm463059366b.40.2024.07.17.09.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 09:33:56 -0700 (PDT)
Date: Wed, 17 Jul 2024 16:31:59 +0000
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] fixes for Adreno A5Xx preemption
Message-ID: <Zpfx_xnRmwoMkSFw@trashcan>
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <CACu1E7HROtx1Zgyy0EJuHj_HWE8Nd6OtFnxTcrDrHP+2HA5o6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7HROtx1Zgyy0EJuHj_HWE8Nd6OtFnxTcrDrHP+2HA5o6A@mail.gmail.com>

On Wed, Jul 17, 2024 at 10:40:26AM +0100, Connor Abbott wrote:
> On Thu, Jul 11, 2024 at 11:10 AM Vladimir Lypak
> <vladimir.lypak@gmail.com> wrote:
> >
> > There are several issues with preemption on Adreno A5XX GPUs which
> > render system unusable if more than one priority level is used. Those
> > issues include persistent GPU faults and hangs, full UI lockups with
> > idling GPU.
> >
> > ---
> > Vladimir Lypak (4):
> >   drm/msm/a5xx: disable preemption in submits by default
> >   drm/msm/a5xx: properly clear preemption records on resume
> >   drm/msm/a5xx: fix races in preemption evaluation stage
> >   drm/msm/a5xx: workaround early ring-buffer emptiness check
> >
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 18 ++++++++++----
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 12 ++++++---
> >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 30 ++++++++++++++++++++---
> >  3 files changed, 47 insertions(+), 13 deletions(-)
> > ---
> > base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
> > --
> > 2.45.2
> >
> 
> Hi Vladimir,

Hi Connor!

> 
> While looking at preemption on a7xx, where the overall logic is pretty
> much the same, and I've been seeing the same "soft lockups". However
> even after porting patch 3, it turns out that's not enough because
> there's a different race. The sequence of events is something like
> this:
> 
> 1. Medium-prio app A submits to ring 2.
> 2. Ring 0 retires its last job and we start a preemption to ring 2.
> 3. High-prio app B submits to ring 0. It sees the preemption from step
> 2 ongoing and doesn't write the WTPR register or try to preempt.
> 4. The preemption finishes and we update WPTR.
At this point with patch 3 applied it should switch to ring 0 right away
because of trigger call in the end of a5xx_preempt_irq. Didn't you
forget it? Downstream has such call too. Even though it makes preemption
a little more aggressive it doesn't work without it.

> 5. App A's submit retires. We try to preempt, but the submit and
> ring->cur write from step 3 happened on a different CPU and the write
> hasn't landed yet so we skip it.

I don't think this is possible on modern CPUs. Could it be that retire
IRQ appeared earlier (while it was switching from 0 to 2) and you are
looking at msm_gpu_submit_retired trace event which is called from
retire work later.

> 
> It's a bit tricky because write reordering is involved, but this seems
> to be what's happening - everything except my speculation about the
> delayed write to ring->cur being the problem comes straight from a
> trace of this happening.
> 
> Rob suggested on IRC that we make retire handling happen on the same
> workqueue as submissions, so that preempt_trigger is always
> serialized, which IIUC would also make patch 3 unnecessary. What do
> you think?

In this patch series i have tried to do least amount of changes so it
could be easily back-ported. It isn't pretty but it works reliably for
me. Otherwise it would be fine to just disable preemption like it's done
on LTS before 5.4 and rework preemption in new kernel releases.

Kind regards,

Vladimir

> 
> Best regards,
> 
> Connor

