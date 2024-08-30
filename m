Return-Path: <linux-arm-msm+bounces-30304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F4F96694E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 21:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0C421F239D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 19:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1920E1B29D2;
	Fri, 30 Aug 2024 19:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLdaTgMe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817B813B297;
	Fri, 30 Aug 2024 19:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725045001; cv=none; b=BUNTovb7c3lYbjsKTRILBaP7+71jKDvyvCeAS21D6EhTp8e3MwfEScL7beFihCUC+EBNWQVxRlziLPjunECWSllFJ+6Z6U/x54jPWbr9ZKyVzVVpDfDVqU7YWWQlObhAFY12URvCQYHyrmYQE7hJqQH1bQjWUvccU709N3kO8/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725045001; c=relaxed/simple;
	bh=9v4c6eYe6XInWfwmmXNcdoZYfz7QVGmeCfxTCFEj3wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLCMwnSEfi9nYZZngsljB9ycH1kGqynEPTk5dASpE1IaRmaNqTpGNzYa9WtgJmX33Vfp3PL3OAI61w/HnDjYAyakS6dD/rfsZyPTz1qtQ8EEC7RskaihwZV389ehE/ocCD3eQXTUWDRUDN8PqrUrwgreEDtrMnbZLUtyCK9tOl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLdaTgMe; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d87a57c06fso105720a91.2;
        Fri, 30 Aug 2024 12:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725044999; x=1725649799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiQ1ufq0LJDmNAhzzm7F4UAH4C8ldiYpmNwSTNOtiQE=;
        b=FLdaTgMemSmzWqVk6zPh3nbt76i82rfUkzFo7gJ4ggODnIz3ZQNpYu/g8TsvPTohtS
         K13k7oj9F249NbHbxZIUQHr28zOK3cP7gpHR8zCmd4XBuckasGlMhSS4eGgeFLx3DEoJ
         Ti5CvzAU9RqK8zlI6itwaWZ29LW7lPb8UR7ZYJjnH1naHW1DbNi01q1mh72QLDw3y1Ls
         0zS0wDuILOgTHATVlwj++VXlX7Vr8/pLnOvydLDZWlUJConrwaNzqLU+/DTcfBrIZOUK
         akYroobrNLexyevDJTGGMjT7FcXx3PE3MTqqA8GYNsLZt1wnjmvaBicauX966hCVaSxQ
         tbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725044999; x=1725649799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kiQ1ufq0LJDmNAhzzm7F4UAH4C8ldiYpmNwSTNOtiQE=;
        b=E3tOXgQUphu+r+wRkGTuOjnGKqWavyD/6w053+Q/Ewf3TxwB8XoRaBH251SdFocixj
         ktIkvSdgV6ww0zoQSDSNg7zG7xiqV2Kr/1evKOwehI7zKyCOe0irUz+HtxQTeweS56MT
         PuOZa8d0JqUhr5D6Q5e7f3PuttO/veFi57B8hefyMINo0JWhjqqvXr787pZLCu/dcS/W
         W46M0A83mLLA6bEvRsgNoYZkzq2RY6w9Mr96vrNcloiXOpV3BjflpzGUdrYZzjEeKAri
         r+auyMZ4+EVHXN1/0WlZSL04A1sx8D2A1cPK3MV6Cz6ggkLFyXr9Canz/NmvbHVjFvMo
         43/w==
X-Forwarded-Encrypted: i=1; AJvYcCUkd8irS9EFnfvYedzk9DviAh5ta6gkzXhZ4/Dw0aZ++K3E850GJV3TO90BgwjlUoy8c7QLxNBgBPZxQ0Nh@vger.kernel.org, AJvYcCWRJ3sQ1FNyjiLMM9V5O6nkk50lTju5Nx89CnB8wOYU3xjb32klfNr2P05i7Klqo4vx+KUTRYCPujwUF/22@vger.kernel.org
X-Gm-Message-State: AOJu0YxlyvE1wbWsGaqVMuXtgQtB/2X2UH8O7D68B7dUsaEUrYTYe0TG
	Ek5tPp85Cuu2iLGk8Z/B8g0oi1a0qzru1TODFk/pTH8KCNCvk3NxALRtGhrT9u+Yut9dSD7q6Bp
	6w7YzcQ75zB2+mzdGyXlQqTdLXMg=
X-Google-Smtp-Source: AGHT+IFLdzRNSJoZ7XESTDoYRzQrEdC8kcWMd8Fgqi1Pn13p4zB6Vr7SKOtwpkRilwX7Ji1V/XFn1RrfBI1xcCqPa6w=
X-Received: by 2002:a17:90b:4b4a:b0:2d3:c34b:a071 with SMTP id
 98e67ed59e1d1-2d86b814c6dmr1831729a91.3.1725044998757; Fri, 30 Aug 2024
 12:09:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com> <CAF6AEGtxCnoyrEHPknV7C9XO3OcTpSOmGq-j2K7UDKXF1j0ssA@mail.gmail.com>
 <CACu1E7FC_gPXHm4g7f0iv551orxfh=V_sJF47=6TC+nWdMyTMg@mail.gmail.com> <CAF6AEGvkds04G1XzVr8433S1Za_xZZSkmrWNaH-gUw6cH+cSUw@mail.gmail.com>
In-Reply-To: <CAF6AEGvkds04G1XzVr8433S1Za_xZZSkmrWNaH-gUw6cH+cSUw@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 30 Aug 2024 20:09:47 +0100
Message-ID: <CACu1E7HC_u0WZ5ayXhm3z-Q5Do7tnwQLGdJ5feD99aOB52H1ug@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm/msm/A6xx: Implement preemption for A7XX targets
To: Rob Clark <robdclark@gmail.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 8:00=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Fri, Aug 30, 2024 at 11:54=E2=80=AFAM Connor Abbott <cwabbott0@gmail.c=
om> wrote:
> >
> > On Fri, Aug 30, 2024 at 7:08=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
> > > <antomani103@gmail.com> wrote:
> > > >
> > > > This patch implements preemption feature for A6xx targets, this all=
ows
> > > > the GPU to switch to a higher priority ringbuffer if one is ready. =
A6XX
> > > > hardware as such supports multiple levels of preemption granulariti=
es,
> > > > ranging from coarse grained(ringbuffer level) to a more fine graine=
d
> > > > such as draw-call level or a bin boundary level preemption. This pa=
tch
> > > > enables the basic preemption level, with more fine grained preempti=
on
> > > > support to follow.
> > > >
> > > > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > > > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > > > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-Q=
RD
> > > > ---
> > > >  drivers/gpu/drm/msm/Makefile              |   1 +
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 323 ++++++++++++++++++=
+++-
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
> > > >  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 431 ++++++++++++++++++=
++++++++++++
> > > >  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
> > > >  5 files changed, 921 insertions(+), 9 deletions(-)
> > > >
> > >
> > > [snip]
> > >
> > > > +
> > > > +int a6xx_preempt_submitqueue_setup(struct msm_gpu *gpu,
> > > > +               struct msm_gpu_submitqueue *queue)
> > > > +{
> > > > +       void *ptr;
> > > > +
> > > > +       /*
> > > > +        * Create a per submitqueue buffer for the CP to save and r=
estore user
> > > > +        * specific information such as the VPC streamout data.
> > > > +        */
> > > > +       ptr =3D msm_gem_kernel_new(gpu->dev, A6XX_PREEMPT_USER_RECO=
RD_SIZE,
> > > > +                       MSM_BO_WC, gpu->aspace, &queue->bo, &queue-=
>bo_iova);
> > >
> > > Can this be MSM_BO_MAP_PRIV?  Otherwise it is visible (and writeable)
> > > by other proceess's userspace generated cmdstream.
> > >
> > > And a similar question for the scratch_bo..  I'd have to give some
> > > thought to what sort of mischief could be had, but generall kernel
> > > mappings that are not MAP_PRIV are a thing to be careful about.
> > >
> >
> > It seems like the idea behind this is that it's supposed to be
> > per-context. kgsl allocates it as part of the context, as part of the
> > userspace address space, and then in order to know which user record
> > to use when preempting, before each submit (although really it only
> > needs to be done when setting the pagetable) it does a CP_MEM_WRITE of
> > the user record address to a scratch buffer holding an array of the
> > current user record for each ring. Then when preempting it reads the
> > address for the next ring from the scratch buffer and sets it. I think
> > we need to do that dance too.
>
> Moving it into userspace's address space (vm) would be better.
>
> I assume the preempt record is where state is saved/restored?  So
> would need to be in kernel aspace/vm?  Or is the fw changing ttbr0
> after saving state but before restoring?
>
> BR,
> -R

The preempt record is split into a number of pieces, each with their
own address. One of those pieces is the SMMU record with ttbr0 and
other SMMU things. Another piece is the "private" context record with
sensitive things like RB address/rptr/wptr, although actually the bulk
of the registers are saved here. Then the user or "non-private" record
is its own piece, which is presumably saved before switching ttbr0 and
restored after the SMMU record is restored and ttbr0 is switched.

Connor

>
> > Connor
> >
> > > BR,
> > > -R

