Return-Path: <linux-arm-msm+bounces-18577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 708178B2483
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 17:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 759FB1C20B77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 15:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0FD14A4F8;
	Thu, 25 Apr 2024 15:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SoTbFwLP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3681EB36
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 15:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714057415; cv=none; b=iAeZyiGa3Ctk3yRtErhQsV8BN2bPCtK4eiiOUUfOyeOlTvcz1zcgj+gGP0kCIJKxUOR+05/izLMpqb7n83e/B1YQMkmChXvpBsfpG4sVDtnKMEePmw59u00Gu8ysku+F4teuEKe856aOiJeuG0XBSXrykx8BpxBUCii3J6CG5eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714057415; c=relaxed/simple;
	bh=bYJ7oJTSOpW0STBCOZmqM5JsOarCIi3F9qJGREd4Et0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0W37nV0FXwxR2u/l4Hp0ssj51p9lHCXjefVZp9OzHL+K9cdDv6E0pdJiibyd826cpLR1y+Tw+uHR0eKa34VK/r6CZ9TNcCrkqdg27xdZJ3xV0VRT+zgt/r8Cl9ktDBxPTcoZnLCRkOy0d2IrI1XWNO5tKnLL6ARrrbs32Qc8Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SoTbFwLP; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso1235912276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 08:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714057413; x=1714662213; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G5VORDwXJXgsLkAz45WqUj99ksDJmdeIVfKJG4lpuCM=;
        b=SoTbFwLPQo0+9IXfD+6//HIprohmLbFsrOV4qzhbYLsz9lWZgJdxHDnbC5QDa/NwY0
         2K9kPrGdkV1x5FJHB8voz8Xa/yvw9b5OnEwy07UWKiEtf/pimksS31bdDEWOGFGLin3H
         Xr/9Lw9v8NJpVIC+UcQeyhplT1cmCtN9usL5anKeWdbQh1C6hHutBapA1AAT7Z003zym
         yoTWMr39Ntsj451vXk72kFC6XEC9d3Le7qsU9pantLhHYwxFJ4zvn+KA1Rg9GTRMotzT
         q4ULa5xkHzbs9GAtSGPaYdSRfyv2i+IiRIzjuYxusTC0B14fRzs6C1/iJfQEBBT3dekw
         ZmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714057413; x=1714662213;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5VORDwXJXgsLkAz45WqUj99ksDJmdeIVfKJG4lpuCM=;
        b=ILTkOg67G8t2JoeMYPPc/sKGXDyOqdY4qUAN3N+4S0ho8tWMHA9FcFQEC7XrJnm4B8
         TAe1QQ6/AAahq8cVjsshxHid7es1XLPBZzHMOZ0Uyww1KsRPPf7LK8zlIitT9WnN68Sl
         Aj0hOOJ2+y4xOcwEz1V6gxXGeGi5ElsFZ32DWT9fEVcpM/xpj6F7xVQtSoEn0zmGmE3+
         su3/K2QDOz83A2rzKvojAc3BaEWykUuQk3l/mJfnO4n7BNNQYqVpGE4P9zIUa1fqQJ+u
         sWVeUsglNaRyHNgukDU/hBKvIa26/Yt0P6WJhjeW/JNI/tPP8Q35F5hUyEZCWPyAZQ+Y
         VKig==
X-Forwarded-Encrypted: i=1; AJvYcCXmrwA5+hbs9aO7prZB/sNaprnHxE5wb5VuxA6q8eoekyei0GeS1CAiG4ZfeJI8sMHGe/Bm3h/Gh8X5nl1+Uz5eQzF01PAyxjeloBRIzw==
X-Gm-Message-State: AOJu0Yy3ITwAqQ1XtDsj+P0HE4ud6H9OPYmj3duWzGUINV1qG34aBzqd
	G4rA++3BP/qUSVJRF5gthMjpqzLDiIgVnbNhzoXT7xnGEEfYy0pPnZgTDor2UnRvLNqb0zaKVkR
	ejVQavVcNSBPySpwiBHxmqKq65rOBYeR2NdoXxBJ/rv0rHyn+
X-Google-Smtp-Source: AGHT+IGd0Nqkcroaa8wB4M1xXsdf6Lu6WvMxzAgGJCCZn89+9S8X3fjLDFaV6NVaIaNNPCck6RUmGPMtCFV4lAu5J3Y=
X-Received: by 2002:a05:6902:1b02:b0:de5:5b0c:9c4d with SMTP id
 eh2-20020a0569021b0200b00de55b0c9c4dmr6474342ybb.56.1714057412968; Thu, 25
 Apr 2024 08:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
In-Reply-To: <20240425134354.1233862-1-cwabbott0@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Apr 2024 18:03:21 +0300
Message-ID: <CAA8EJpp+4By9901d4M9M5u878gd=VnKsVguHiY-mPmY4O=wO-A@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/msm: Support a750 "software fuse" for raytracing
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> On a750, Qualcomm decided to gate support for certain features behind a
> "software fuse." This consists of a register in the cx_mem zone, which
> is normally only writeable by the TrustZone firmware.  On bootup it is
> 0, and we must call an SCM method to initialize it. Then we communicate
> its value to userspace. This implements all of this, copying the SCM
> call from the downstream kernel and kgsl.
>
> So far the only optional feature we use is ray tracing (i.e. the
> "ray_intersection" instruction) in a pending Mesa MR [1], so that's what
> we expose to userspace. There's one extra patch to write some missing
> registers, which depends on the register XML bump but is otherwise
> unrelated, I just included it to make things easier on myself.
>
> The drm/msm part of this series depends on [2] to avoid conflicts.
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28447
> [2] https://lore.kernel.org/all/20240324095222.ldnwumjkxk6uymmc@hu-akhilpo-hyd.qualcomm.com/T/
>
> Connor Abbott (6):
>   arm64: dts: qcom: sm8650: Fix GPU cx_mem size
>   firmware: qcom_scm: Add gpu_init_regs call

I don't see patch 2 at all. Granted that patches 1 and 3-6 have
different cc lists, might it be that it went to some blackhole?

>   drm/msm: Update a6xx registers
>   drm/msm/a7xx: Initialize a750 "software fuse"
>   drm/msm: Add MSM_PARAM_RAYTRACING uapi
>   drm/msm/a7xx: Add missing register writes from downstream



-- 
With best wishes
Dmitry

