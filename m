Return-Path: <linux-arm-msm+bounces-26423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3D7933A2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 11:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A087B1F213BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 09:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AB714A61B;
	Wed, 17 Jul 2024 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAlEyaxA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46826EB56;
	Wed, 17 Jul 2024 09:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721209240; cv=none; b=SjTUNeXhZuZA9QLh5goFj7plaNhyMeZje9QusSw+/XlRftd8yxFA+xMZ2GKV1dom3poruJUhLJgdFe2eLY3/M8n473YD3H7P4HaEFLBXgG+FGSfXvpuauQnZGttmNPQLIvu/PBdoq2PI5mCLxNg3/UMylc5f3NTyBfVx5dqGbhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721209240; c=relaxed/simple;
	bh=+GKvkx6yO2guQrr2FUpZGbJobMrKjd+iiCrm3hzFdRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hV025Kc6snjZaqrtM6Kn1aLISNv35b7Gr9OWDSC7CFyucNZ6Zaur21/VAleaiHM0d8Jj7z41AmKoUss6nYfQIHkO0EbwOMTmsxBibvk9h26LvhhRM4mQfXyTJdKgGhdivAiDtWhHsUACf6nXWgmJhvewFKYYnbHc8VVeOL7WDHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAlEyaxA; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fb3e9e32ffso35300765ad.0;
        Wed, 17 Jul 2024 02:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721209238; x=1721814038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZT2Up7rkixj135YDsGbBv1AEK5yIre5c4SXPmq/8CE=;
        b=JAlEyaxAiWUk2gqkoVs6VTJ+kIEAYaqMtO2Xp2EPizcFxVmrvR2M0Z16dF9i63Vuhh
         +VYlVjhb9qPYvQklxI/Os/xNe22be9wrIDLKRglW+LqL8lo7wr4WWzoFAL6EREX0qHw8
         kwScDPUmJsN62Y25w1qUwoWHc7Y1OCe3o65BH9s8lVsbdxGLpfRGGckBRWumUy6BlV4S
         R2tMGcz0q+4SO4NotGDHPax+NHAHDkxQBiG8NmrEQAlwXL7k2hQ9rhVjw3L0ahSVVHUN
         sdiWfjpAuKwjlNdS4GdAg5qoZRclHVWQRLcBRgwdP9/GR0K7lIbRjUzDw3wO9DDY644x
         kXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721209238; x=1721814038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZT2Up7rkixj135YDsGbBv1AEK5yIre5c4SXPmq/8CE=;
        b=BZIwk4cfmPU0Is9ky0aaWvXRknVXKOeP2hBQRLIAZIeyNpBIQyT19HIFbgz7/4NjQ5
         s0X+XSpozOBx6LhZCJAxp4tMCdDAm8pPwLx60Xsy8lbQTaY9o+gV+s/mAqhZGqGMLZN9
         bHodZhC1/5jaWkU80BauPjmKq6bLE15Tq6nQ6ZesFk80u8aAyU+/cLXZfwrZ6s4FGIVR
         EE4PbswaawNxpY5fgPrn+KZuGMRL54LqP7nDQ/X6Yse3COvusxqvUjTRF6yYOUB8wviD
         KH0ZYjjgJCfoh1ay8Lupn+g4mrsqMuEKfwMq3vQ1XSkvcm214s+2CdI+9H86XkEcCW5T
         Qvpw==
X-Forwarded-Encrypted: i=1; AJvYcCX+NYJ9WAxToz6Ua0tqW1feIgiEr37Er4Y206fYQUPeVRwknXwiPQ++LK8JaSK2VNVR5LVFQ0+EYQpos3V8YRwN6RIq231W7PX4lgeYOR/jaTG3bM+ZDgr9I2wQfS2Gaq/KLmnrc9YE9N5BNw==
X-Gm-Message-State: AOJu0YymVEu/4KEJcwWEo9hx0XGxJGqFvnfru8ncw+DzJkL8XSgUUdJS
	wNYwnTdxwg4OdWLtqJPqYWSQ+FHWUkFgOjFeH24gf0H6VGeNJV3vrJ9Grx8BAxx99A39bwuNFtT
	bhUpSXFdCrWb4xFOupjUzk4t2gr3VTHGl
X-Google-Smtp-Source: AGHT+IHS92ooffGhwo6QwDnJzDTyj0c6jnCY662I7sKXoxhFBlLCKT0n4+VIMY+tB98bU2E3VvfgvXG02LZhehf59pw=
X-Received: by 2002:a17:90b:148f:b0:2cb:4c5b:2d8a with SMTP id
 98e67ed59e1d1-2cb526928c0mr749820a91.12.1721209237984; Wed, 17 Jul 2024
 02:40:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
In-Reply-To: <20240711100038.268803-1-vladimir.lypak@gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 17 Jul 2024 10:40:26 +0100
Message-ID: <CACu1E7HROtx1Zgyy0EJuHj_HWE8Nd6OtFnxTcrDrHP+2HA5o6A@mail.gmail.com>
Subject: Re: [PATCH 0/4] fixes for Adreno A5Xx preemption
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jordan Crouse <jordan@cosmicpenguin.net>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 11:10=E2=80=AFAM Vladimir Lypak
<vladimir.lypak@gmail.com> wrote:
>
> There are several issues with preemption on Adreno A5XX GPUs which
> render system unusable if more than one priority level is used. Those
> issues include persistent GPU faults and hangs, full UI lockups with
> idling GPU.
>
> ---
> Vladimir Lypak (4):
>   drm/msm/a5xx: disable preemption in submits by default
>   drm/msm/a5xx: properly clear preemption records on resume
>   drm/msm/a5xx: fix races in preemption evaluation stage
>   drm/msm/a5xx: workaround early ring-buffer emptiness check
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 18 ++++++++++----
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 12 ++++++---
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 30 ++++++++++++++++++++---
>  3 files changed, 47 insertions(+), 13 deletions(-)
> ---
> base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
> --
> 2.45.2
>

Hi Vladimir,

While looking at preemption on a7xx, where the overall logic is pretty
much the same, and I've been seeing the same "soft lockups". However
even after porting patch 3, it turns out that's not enough because
there's a different race. The sequence of events is something like
this:

1. Medium-prio app A submits to ring 2.
2. Ring 0 retires its last job and we start a preemption to ring 2.
3. High-prio app B submits to ring 0. It sees the preemption from step
2 ongoing and doesn't write the WTPR register or try to preempt.
4. The preemption finishes and we update WPTR.
5. App A's submit retires. We try to preempt, but the submit and
ring->cur write from step 3 happened on a different CPU and the write
hasn't landed yet so we skip it.

It's a bit tricky because write reordering is involved, but this seems
to be what's happening - everything except my speculation about the
delayed write to ring->cur being the problem comes straight from a
trace of this happening.

Rob suggested on IRC that we make retire handling happen on the same
workqueue as submissions, so that preempt_trigger is always
serialized, which IIUC would also make patch 3 unnecessary. What do
you think?

Best regards,

Connor

