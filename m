Return-Path: <linux-arm-msm+bounces-28831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AA295503B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 19:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 161B5285679
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 17:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CAE1AD9F9;
	Fri, 16 Aug 2024 17:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTXoVOUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324034AEE5;
	Fri, 16 Aug 2024 17:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723830485; cv=none; b=DCUB1kKcVhOSdPliZ3Z4KLdiBVExZgKzw7wiD8NPqI9OwQYk3RSCb9pKE06vpv/EYboDr7Tr2Vu6jRDoO+SM9E4fBMOmKOyzDhEULpBRnA8lYUNtX4BLlCvUZ4tCRjl74HwIvlcKr9C1nWqsWMrGx3CP+Hxv5gjqJleCQaWbErc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723830485; c=relaxed/simple;
	bh=EF2j3bp/cvHEgQWOblGJSGOssVd0X9riXzA0JLKpxtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qxupHgLtgOLS+qsL9UgC8AmGykP0blyOiNy2OV1ggpVCzuV9Z9WfMtAhLMrz5MkWXB0LIBenLhpAjBbOexEDFWA9r5gtMYlhnZW+2VjSvIZaedM1cFV541JHWa1mQuGnLVHBd4Ag3upH5YlsWvQgItp7YNsYO0H/vafk+wpOczQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTXoVOUz; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eeb1ba0481so31898791fa.2;
        Fri, 16 Aug 2024 10:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723830482; x=1724435282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riGddCBVcMqSZhpZl90A7CFiqL1QqGXrr5oPhf+7eSE=;
        b=JTXoVOUzhIV+QtBYP42/lKwRp8UEZYQvd0Ih9T9spNuZNeaQQhwiRFCahzxmqDDXeF
         8LAgXff71ZzDQ5sbhaDPcfMWVCoQu1PcfDSkv2SGHtKpBlhQAD4uGq4hK4wkywa2pFeh
         J33uQUolUUjNyMqu7e1sJyMIsI+FWhZ+ZdhXKV79nmCXqafcpqekOH2oCqeKp07TbKB/
         vW4gU1e/HhfCkDoFOAASxU1lzHRxdZAMs3/OCUxfzjrydFeSK1ik0kfaLsjOdgB9Ljqp
         RgCmECmAQoUtaTLqB1LEf2EBxpK0etf72mrr12kv3UIy/gMivkLiGt3FAl4YOXe1iRIT
         v0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723830482; x=1724435282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riGddCBVcMqSZhpZl90A7CFiqL1QqGXrr5oPhf+7eSE=;
        b=nNiJF48kjTsEXXEfbeTaKLbsrcVRGXcGzysJLHUsRXVbD0EMedgYHE6bPbHDB1LGrj
         VCOo3W5xFPZEmzzUdrIazXyoakniC2txUN2Bm11oAG2hGrS79J4+haHaqydGD1lSySBU
         O1Sam0ydqXVY9o5hnzW+ZJFLt938ImJNXaic/KOeYllurc35uDEuHrxSkeRLAgXXB/bQ
         2BgJpA67IllLpZWEad4B72zKkE+iMZCxWSyA2KMADcRqOfG0aLCr8h2GVE3bgA8qEi2D
         X0/WadPrCjh0LzGnoV7YAQIpwjokS60xsX+egqIttOd2GbtLd5YoO9Xa2+/9s7Uof0Dp
         qnWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg6Zr1TZqCuvJNYqIp3KlyNS7xfO1WUtbkbt0TB0DYhxwsF/WRoZiaBU7Q0zce9xeWIo/VS3PZ/1ZrUYs622jD9HWqT5RnoYi9llKFyZj6WCEUL8nUtFkWdsYKcVWcJn4n5PqKKYA5gw1esA==
X-Gm-Message-State: AOJu0YxGQ1YjAsAWVbEvHmQ9YZdUNwYR6XLscS0iAh8l9NgJXys2763y
	a+fVVeJR17WA3duWf8chUpSQVq7KSmO0ER/rGPucJqZOdzlgNztAlp7L1L0aVPUHTAJGLiV2fEU
	L3sqg/Vg6HN7ljU4s0crp4UePVAI=
X-Google-Smtp-Source: AGHT+IHZcHSyJ6Txw10o7YcCIzKf1ZlMMY3wB8pM2a/ajfH8agQCa9ezf0fW4JTyRoX4ydmf7qdRDClG5I7cxWTXrmY=
X-Received: by 2002:a2e:9084:0:b0:2ef:2d58:ec24 with SMTP id
 38308e7fff4ca-2f3be5899a2mr23608561fa.17.1723830481402; Fri, 16 Aug 2024
 10:48:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
In-Reply-To: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 16 Aug 2024 10:47:48 -0700
Message-ID: <CAF6AEGsiu2OBbwQJO5nS55CAQtCvKebc59-mu2h0BDiu4C2gxg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Preemption support for A7XX
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 11:27=E2=80=AFAM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> This series implements preemption for A7XX targets, which allows the GPU =
to
> switch to an higher priority ring when work is pushed to it, reducing lat=
ency
> for high priority submissions.
>
> This series enables L1 preemption with skip_save_restore which requires
> the following userspace patches to function:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
>
> A flag is added to `msm_gem_submit` to only allow submissions from compat=
ible
> userspace to be preempted, therefore maintaining compatibility.

I guess this last para is from an earlier iteration of this series?
Looks like instead you are making this a submitqueue flag (which is an
approach that I prefer)

BR,
-R

> Some commits from this series are based on a previous series to enable
> preemption on A6XX targets:
>
> https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeau=
rora.org
>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
> Antonino Maniscalco (7):
>       drm/msm: Fix bv_fence being used as bv_rptr
>       drm/msm: Add submitqueue setup and close
>       drm/msm: Add a `preempt_record_size` field
>       drm/msm/A6xx: Implement preemption for A7XX targets
>       drm/msm/A6xx: Add traces for preemption
>       drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
>       drm/msm/A6xx: Enable preemption for A7xx targets
>
>  drivers/gpu/drm/msm/Makefile              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |   3 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 339 ++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 441 ++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   1 +
>  drivers/gpu/drm/msm/msm_gpu.h             |   7 +
>  drivers/gpu/drm/msm/msm_gpu_trace.h       |  28 ++
>  drivers/gpu/drm/msm/msm_ringbuffer.h      |   8 +
>  drivers/gpu/drm/msm/msm_submitqueue.c     |  10 +
>  include/uapi/drm/msm_drm.h                |   5 +-
>  11 files changed, 995 insertions(+), 16 deletions(-)
> ---
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> change-id: 20240815-preemption-a750-t-fcee9a844b39
>
> Best regards,
> --
> Antonino Maniscalco <antomani103@gmail.com>
>

