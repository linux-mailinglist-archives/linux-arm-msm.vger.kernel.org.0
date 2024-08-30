Return-Path: <linux-arm-msm+bounces-30302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3AF966933
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 20:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C4561F23A80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 18:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724A61B9B5F;
	Fri, 30 Aug 2024 18:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvBEPWXt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E490915852C;
	Fri, 30 Aug 2024 18:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725044055; cv=none; b=erxplTKJhucx/MOB/Bebt+9Qu4oUg0iGaORf477W6MZWKNTW2IwEx+J1LP0TudecYlaijAE0o88WHB2kkuNlw9PGITmjfIkP6OP7eKF9FZ1wuIGoQRlw2W7gPsYi7+LPtF8YZ/OsbjQt8PXMsVCkU9bHdwxarizwDmcJki74UN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725044055; c=relaxed/simple;
	bh=XhJw24fI69QMs3EioycGkxMLL1JSPbOZhpybFcz7x/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wt9E6RkTDwXQCnwjpvNFOvzoyxuF326PqIPzecN0lMyaEV6nKuZGKixBoih+/+V0AukUMP8drEAcT/28OvQjRRb0dmykahn/F/KJrBKNX2HAnOD1C5qqw0jNI6efoXa5CenbY6vKwPwQ3LZzp2doYODOq0a2r3Eg6vtT6Lve78M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvBEPWXt; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7cd894e2adfso239490a12.2;
        Fri, 30 Aug 2024 11:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725044053; x=1725648853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KfcHsIEQ78QG4wmqIkUDXgWsnrv7lBNCcC4rzxigEE=;
        b=DvBEPWXtFCklsbMalfDK1P8dMF8d+d8Raq5Wr3/jahIMrrGJawuzAtE2VE34SEEMJt
         TZ3DqXg5DS5mz9kEPCmDFGMdSEwJu1JTCjhnwMyi5hyUKxnpo1f8aA4PI9gWMAulVwDU
         lWLUJuT3DrEdwhT96sFECci1bvQ0ky6n1VsB/aHDT7XXD5L240FVHo4tiDy5/fwh+TLN
         SOO5+PeejQt5phddq/qosJ/zewhCfyMsHtBOHnsJR0R7/fm4Uoi5zXNvSTFKt7wML2KR
         U2te6M9xLNBkSEg2SDankpF8yU194RnG5Gmnr4IRgO0S/vCXPQnkc2VtvARdYI40PSxY
         6X9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725044053; x=1725648853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KfcHsIEQ78QG4wmqIkUDXgWsnrv7lBNCcC4rzxigEE=;
        b=EmaCVskWvfUzNtem9Jfc4dJENOu37m5Fn/WOEOu3loBJWuLXvgP3KDwZ1rKhNSryL6
         7wbEem8j1wQ7WdPlfZyR11NglE14hqq5Y0gwuOLG4bUOCq2wbSPTi2GY4d7ELNHnQvSs
         7VLgUPUJ/3xiL3hm7rAS24jb/dwRWz3UrdIRNyxWs7ZJHxjljAQs4ZkM2ApHeJQ+KZ91
         NHSj/ddtd4+yEBxqEYSH9LLArIbw3+0nHYkQ/ulY7NWQWYaVbq7sjDp0AbIhdFREHlag
         axuthhfnpRlwNufWYyqloTdfrKAcE76HCe0Wg87a+JO/uU0SlXqJTeAhhxWqE8XUIvce
         pctw==
X-Forwarded-Encrypted: i=1; AJvYcCUT0C064CCY8dTxcsfUFGRi4Al6585T0vd0hATOF1SYmf3gJfRx3OUWqFTrNuE0sbQvWDkF0SM2d4FaLbXS@vger.kernel.org, AJvYcCWqzMMWSg7/mmzSbs/73TE0TPtmcPtmHSDJbP1/gvAqcpEsyJHNGfrTvGXtmPLX2A7ka6wByNwUCoXgMEWw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw10efhPSmu1EetQanUjkuhW9XowYWxDC4pv35YBZ0JeJOoadIP
	rnPJ8NzexhKXl5uYWryTtTWbnhqOqSPVjT4jXx9KV64iVcxGTK55QRy6Pi9ePsqzK71kOi7PQoh
	BWfr8lGd3rJvJcjrj4n47g/whoYE=
X-Google-Smtp-Source: AGHT+IEN2/NbpgRKhjjWVidugB6eB7hDUrdfvKzysd99S/GUizr5agkdSQOOYwT+rQupTIdWJFC5QfINQBLiDnCxWKM=
X-Received: by 2002:a05:6a20:4321:b0:1c4:84ee:63d1 with SMTP id
 adf61e73a8af0-1ccee4ec912mr1947888637.9.1725044052875; Fri, 30 Aug 2024
 11:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com> <CAF6AEGtxCnoyrEHPknV7C9XO3OcTpSOmGq-j2K7UDKXF1j0ssA@mail.gmail.com>
In-Reply-To: <CAF6AEGtxCnoyrEHPknV7C9XO3OcTpSOmGq-j2K7UDKXF1j0ssA@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 30 Aug 2024 19:54:01 +0100
Message-ID: <CACu1E7FC_gPXHm4g7f0iv551orxfh=V_sJF47=6TC+nWdMyTMg@mail.gmail.com>
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

On Fri, Aug 30, 2024 at 7:08=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
> >
> > This patch implements preemption feature for A6xx targets, this allows
> > the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
> > hardware as such supports multiple levels of preemption granularities,
> > ranging from coarse grained(ringbuffer level) to a more fine grained
> > such as draw-call level or a bin boundary level preemption. This patch
> > enables the basic preemption level, with more fine grained preemption
> > support to follow.
> >
> > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> > ---
> >  drivers/gpu/drm/msm/Makefile              |   1 +
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 323 +++++++++++++++++++++-
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
> >  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 431 ++++++++++++++++++++++=
++++++++
> >  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
> >  5 files changed, 921 insertions(+), 9 deletions(-)
> >
>
> [snip]
>
> > +
> > +int a6xx_preempt_submitqueue_setup(struct msm_gpu *gpu,
> > +               struct msm_gpu_submitqueue *queue)
> > +{
> > +       void *ptr;
> > +
> > +       /*
> > +        * Create a per submitqueue buffer for the CP to save and resto=
re user
> > +        * specific information such as the VPC streamout data.
> > +        */
> > +       ptr =3D msm_gem_kernel_new(gpu->dev, A6XX_PREEMPT_USER_RECORD_S=
IZE,
> > +                       MSM_BO_WC, gpu->aspace, &queue->bo, &queue->bo_=
iova);
>
> Can this be MSM_BO_MAP_PRIV?  Otherwise it is visible (and writeable)
> by other proceess's userspace generated cmdstream.
>
> And a similar question for the scratch_bo..  I'd have to give some
> thought to what sort of mischief could be had, but generall kernel
> mappings that are not MAP_PRIV are a thing to be careful about.
>

It seems like the idea behind this is that it's supposed to be
per-context. kgsl allocates it as part of the context, as part of the
userspace address space, and then in order to know which user record
to use when preempting, before each submit (although really it only
needs to be done when setting the pagetable) it does a CP_MEM_WRITE of
the user record address to a scratch buffer holding an array of the
current user record for each ring. Then when preempting it reads the
address for the next ring from the scratch buffer and sets it. I think
we need to do that dance too.

Connor

> BR,
> -R

