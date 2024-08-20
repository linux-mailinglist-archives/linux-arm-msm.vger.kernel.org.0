Return-Path: <linux-arm-msm+bounces-29104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5507958518
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 12:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B7611F22793
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 10:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09AEE18DF80;
	Tue, 20 Aug 2024 10:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPpuTPVz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2B118DF79;
	Tue, 20 Aug 2024 10:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724150727; cv=none; b=TvdzmTvgCbeyBm4vKjPx8tuQ1bcxs7oiyjd3AWEmifpmEx18wEVJTuZUs3eSi7o0ysGu5CZ+BLvCOkgvjGIJ+UAMUAG1IswzkMKH1+0VKvsuqLtguS/Fi7lMzD2iEoY0WQuTMrnbfJF//ucWO2cNgt+MNr/g7WiyrldwdYg9OV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724150727; c=relaxed/simple;
	bh=wuAtLr2pIZq3/TNZi8l0jrdkkMwySDA7fzdbIqWOHjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHD8qS9Yvrpget/HjdfvbKbPh0PA095smCxjNmdORm1n7Gru2Bg2fSA+H0N4yVsY8CRGzgDfKw7z2KXH10gh5ByoyH+i/eaBuq8cAJeVxiPcq64kDbIYIycu3Kgb1g8Ag0gDXyogdVieCQJfpdbIr3FdkK6r5rTKvLnZInG1M0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPpuTPVz; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-710e39961f4so3561504b3a.3;
        Tue, 20 Aug 2024 03:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724150726; x=1724755526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWFJvtWInxnxyNJboaGFr0YAa5APJgiKfOf6l3379ZM=;
        b=gPpuTPVz7I8GcHXEbBHNUZW+dAUTl62JCu9DvOtgDEmUkDq48JKSujKftObnuuyP3J
         Hx6S4c2XhtY86yr7rwkLa52i5sVjS7foc8kGdvUWoK2ocg+y88PTbfX33Q2XoRvZ6YZ7
         +LYzIHOAglc1CXv5XNXZfw+MCcWDZxHmU8IqzU7jJQz6se1xYK9Q4z7JSwxV+6YktR7X
         IXAeqa+HsnImufuP6DbQLuKAyvFoU3RCl6Ltow2L1PmMpa4YXj4j18hlDx80J4NODNgD
         2KzR/wbulGz4HkSPTOvLbJj8QI4SbKW8Pu82DlaC3mcA2cvnw8JEePb7nnBM5W/hB96l
         P52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724150726; x=1724755526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWFJvtWInxnxyNJboaGFr0YAa5APJgiKfOf6l3379ZM=;
        b=Zx4Fn9hvvoha/90PQD44bUq0epotPIcQcnWg6BJkAtSirBb8El7w/7l1inOobVFFyg
         8wyXm0LBcdi+AYzovRVmaWKIbb013k331aBnI19gvYb/lj3qNnsygaBVAhcnAH5Mzr+3
         E+jajSxvZl7/d2oVaCzf+6Z41GulqrqoouJ9DZd6AZvaGToc7VthSP91steQjALbuZc3
         l3Ir19qYU8AantPTRRdBhXl0ZIZ/4+KPOZRi/DlGVpinZzUfxht04245pXooWALSNOqZ
         2Bt4K8Xar9FmYCkkGyYfggSxB9SijTh0QHsNg+65nfnxxooDjV6JOKY/iSuRulHDsJ+8
         BQJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ1aQU6VGRzVRAdYZn96T7TC1CPCFvXIUVHB83BR1k/uNY5mEP4Z1lzqdm7bGuT30bhvqunxiVf6j1A+OP@vger.kernel.org, AJvYcCVJnXjLMh1sPjsfCvQQDIhiMZ+wnRU+NoXwEul4iAFJVTztLCNMEe2y303fTRpyEPSVG+VxZvFm3RMUu3cU@vger.kernel.org
X-Gm-Message-State: AOJu0YyryBSM7M+MfIjjvaMgR61RtYfJAPppOo0XIPQ4O5aWyE30D2Bn
	fe/DdX/F3NWEa8s6S6sStttjO+y5UNb/0PLF/iMcFJNy3XdNYxBkYpBadXPaEqleQuwuo0QUnqs
	xjz/c7ZGZ61JxQtlKziapus5HsungRUX0
X-Google-Smtp-Source: AGHT+IHXJqBpUvGqz6cLbeSh5gliW9v4Gc9+lLcMoERdeOVY2p8XziUqREqZ/yR8nbpXuDBu+sJGK7UroUDTKYw4pFk=
X-Received: by 2002:a05:6a20:c909:b0:1c8:b145:29c6 with SMTP id
 adf61e73a8af0-1c904f6b85dmr13953977637.8.1724150725740; Tue, 20 Aug 2024
 03:45:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-1-7bda26c34037@gmail.com> <e8d1534b-d592-43c4-8a34-4c7c4a04181a@kernel.org>
In-Reply-To: <e8d1534b-d592-43c4-8a34-4c7c4a04181a@kernel.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 Aug 2024 11:45:13 +0100
Message-ID: <CACu1E7H6g=8thZfoRh8-svjqhdTOPg5diKoj+ENa4F5==d5RxA@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm: Fix bv_fence being used as bv_rptr
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Antonino Maniscalco <antomani103@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 11:15=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.=
org> wrote:
>
> On 15.08.2024 8:26 PM, Antonino Maniscalco wrote:
> > The bv_fence field of rbmemptrs was being used incorrectly as the BV
> > rptr shadow pointer in some places.
> >
> > Add a bv_rptr field and change the code to use that instead.
> >
> > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
> >  drivers/gpu/drm/msm/msm_ringbuffer.h  | 1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index bcaec86ac67a..32a4faa93d7f 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1132,7 +1132,7 @@ static int hw_init(struct msm_gpu *gpu)
> >       /* ..which means "always" on A7xx, also for BV shadow */
> >       if (adreno_is_a7xx(adreno_gpu)) {
> >               gpu_write64(gpu, REG_A7XX_CP_BV_RB_RPTR_ADDR,
> > -                         rbmemptr(gpu->rb[0], bv_fence));
> > +                         rbmemptr(gpu->rb[0], bv_rptr));
> >       }
> >
> >       /* Always come up on rb 0 */
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm=
/msm_ringbuffer.h
> > index 0d6beb8cd39a..40791b2ade46 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> > @@ -31,6 +31,7 @@ struct msm_rbmemptrs {
> >       volatile uint32_t rptr;
> >       volatile uint32_t fence;
> >       /* Introduced on A7xx */
> > +     volatile uint32_t bv_rptr;
>
> This is never initialized or assigned any value, no?
>
> Konrad

Neither is the original (retroactively BR) shadow RPTR, except
apparently on suspend (no idea why). It's written by the GPU as it
reads the ringbuffer, because CP_BV_RPTR_ADDR is set to its address.
For the BV shadow RPTR, we aren't really using it for anything (and
neither is kgsl) so we just need to point the register to a valid
"dummy" address that isn't used by anything else.

Connor

