Return-Path: <linux-arm-msm+bounces-21646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A15578FB904
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 18:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5006D1F231D9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 16:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66AE313A25B;
	Tue,  4 Jun 2024 16:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gqXUki6x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3BF13D526
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717518714; cv=none; b=dgHFSP93s62vYA87EVP4LZ02nsEU4YhteeudItnZAZSA5yX9ixHwzTN7f4IZzREHWz7Pwd6BVW4J3VTyd2a9PPLCCdHkrfwci/M1B0khVhg6CPSrElpOuWqt2Vfper8pMQisoUFb8kX4PkmsGJiffyMLu6g1o8YmP+Om/TDyEfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717518714; c=relaxed/simple;
	bh=IDCFtXscME4uSG075kgF7PgMeKgAKevJIaJ+C5SFD5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mUWRJt+37z3Pd5RGY2tRq35ZVloH+QA+ZBa2Cbh7qPGuF92N8b82TFI74ukXnP4VvVfJhJDCUWcrVm50xKuiCzZeMMdQrHAdvkUDmrnALuyLsuuBFQKuUngxJC7bKeDX2L/1rHDQ6b9gqb5w2cai/jO6BOoQSooI1nXcwDrT/pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gqXUki6x; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-df771b6cf71so1333821276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 09:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717518711; x=1718123511; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9DPwzzySNOh5jKdiFXhLh5D+q0fux/GGS8qouK+GFc=;
        b=gqXUki6xVmHl62ZBK6U6+i8r5bjeod5JQLzw4MXXWfSbPFSI/jlw9I7if96YZVQdhu
         lwWQ9658N7PFIK43+rL3xWDvF2d/qYI8BVRvqfyRWE2VxsMo2QOTJz+SkxUugEKC9n3C
         orDPtF81D2RxXPCwEroXSsa25CS3ulLP5Y0zLzoD0bF6Xm5OqrVywhHlN2cY8PvVeX+9
         09ojV7t0Qf1lFJz0cTx1F9l64kf/WaO2BT7BdEoHUabIV2qnIS9s+p8j5zx9+TNPmDZb
         oTN8ulWIcmJeDASG32EMMQPZl15tLci6Qc75F1Z1F1TsS1mxz6LlcFnlBYgl7HeJtQ68
         Z4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717518711; x=1718123511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9DPwzzySNOh5jKdiFXhLh5D+q0fux/GGS8qouK+GFc=;
        b=F6NjiO0dFwBSOa++NHKkZzG2N1eY3j7hYOq5JYQmO8EV85lNM//NzEgM7y4OH81+IC
         yQUDqxfWzX/0xM0gakVWC9fmZS2XGuE748cDFnDsuM9aiB5sDlXastZGy9wXNvQje4PW
         9qMbwp7no2AnhXWAEPzWE9UCaQRLaJ6xOfj8PvgefnYIf/fZFdjFPflETyMse6W03Vb/
         qolDNMkbwQ5zGE1rNw/wiyqmQE+rHCYSo96XA/sjJm+zubom1l89JtlW/DzQ29N1ZyRH
         6qgC0NDjPRljjzx7iZwz+U7Qy05949+a41PYxXr1mtAS8qNgwUv2qG/Rpx/Px44HRTlZ
         0pIg==
X-Forwarded-Encrypted: i=1; AJvYcCVHbugPRdKvlmjCK0ihet4BJXJ8mTGL3DFzR6wgUE3JsFIYtu/VFZwhKntzBP7PASZxqUmO4uK5GddotM+gJ8q1KQ+JM0JXyVTXbrGMwg==
X-Gm-Message-State: AOJu0YyGfwW4zZc3o0p/EDpSHnpBl7ssXGk5yMUXC2tRsGwmvtPxjMvw
	HSyc3xNsFjpbhnj2ovs82HKWCTySlzuUszLgzrg98aXZeXnRBabrsEk3M2XHF3F1Fx2/gowl10m
	csvrXAuOGSCUiLA+UGK/ufc7Wni51PZOMLutZKw==
X-Google-Smtp-Source: AGHT+IG9nfkGErWgX+Z7kHFPw4NIX7CtJVxIwkdUh4P9tSgvXArctZcIqdy++fD/2bNlzKiw1xHKgyYr+lpeKljr+WU=
X-Received: by 2002:a25:d6d4:0:b0:df7:a75c:28e0 with SMTP id
 3f1490d57ef6-dfa73c40be0mr11980521276.36.1717518711395; Tue, 04 Jun 2024
 09:31:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604154846.500357-1-robdclark@gmail.com>
In-Reply-To: <20240604154846.500357-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jun 2024 19:31:40 +0300
Message-ID: <CAA8EJpooN4gJMfBPam+iVS6rbYWgdk835UB4ruDBxLryHoOy5w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Print SQE fw version
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Jun 2024 at 18:48, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Add the SQE fw version to dmesg and devcoredump.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 32 +++++++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 ++
>  3 files changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 56bfb228808d..5a2a005003c8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -665,6 +665,32 @@ static int a7xx_cp_init(struct msm_gpu *gpu)
>         return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
>  }
>
> +static uint32_t get_ucode_version(const uint32_t *data)
> +{
> +       uint32_t version;
> +
> +       /* NOTE: compared to kgsl, we've already stripped off the first dword: */
> +       version = data[0];
> +
> +       if ((version & 0xf) != 0xa)
> +               return version;
> +
> +       version &= ~0xfff;
> +       return  version | ((data[2] & 0xfff000) >> 12);
> +}
> +
> +uint32_t a6xx_get_sqe_version(struct msm_gpu *gpu)
> +{
> +       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +       uint32_t *buf = msm_gem_get_vaddr(a6xx_gpu->sqe_bo);
> +       uint32_t version = get_ucode_version(buf);
> +
> +       msm_gem_put_vaddr(a6xx_gpu->sqe_bo);

Wouldn't it be easier to save the SQE version when the firmware is
loaded and then just return it?
Or the point is about reading the SQE version at runtime?

> +
> +       return version;
> +}
> +
>  /*
>   * Check that the microcode version is new enough to include several key
>   * security fixes. Return true if the ucode is safe.
> @@ -681,6 +707,8 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>         if (IS_ERR(buf))
>                 return false;
>
> +       DRM_DEV_INFO(&gpu->pdev->dev, "Have SQE version %03x\n", get_ucode_version(buf));

I'd suggest drm_dbg_driver() instead. I think the motto is to keep the
kernel more or less quiet.

> +
>         /* A7xx is safe! */
>         if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu))
>                 return true;
> @@ -714,7 +742,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>                 }
>
>                 DRM_DEV_ERROR(&gpu->pdev->dev,
> -                       "a630 SQE ucode is too old. Have version %x need at least %x\n",
> +                       "a630 SQE ucode is too old. Have version %03x need at least %03x\n",
>                         buf[0] & 0xfff, 0x190);
>         } else if (!strcmp(sqe_name, "a650_sqe.fw")) {
>                 if ((buf[0] & 0xfff) >= 0x095) {
> @@ -723,7 +751,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>                 }
>
>                 DRM_DEV_ERROR(&gpu->pdev->dev,
> -                       "a650 SQE ucode is too old. Have version %x need at least %x\n",
> +                       "a650 SQE ucode is too old. Have version %03x need at least %03x\n",
>                         buf[0] & 0xfff, 0x095);
>         } else if (!strcmp(sqe_name, "a660_sqe.fw")) {
>                 ret = true;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 1c3cc6df70fe..c206dab8bc08 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -109,6 +109,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>                        bool suspended);
>  unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu);
>
> +uint32_t a6xx_get_sqe_version(struct msm_gpu *gpu);
>  void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>                 struct drm_printer *p);
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 0a7717a4fc2f..1acfe39eb8e0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1957,6 +1957,8 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>
>         adreno_show(gpu, state, p);
>
> +       drm_printf(p, "sqe-version: 0x%08x\n", a6xx_get_sqe_version(gpu));
> +
>         drm_puts(p, "gmu-log:\n");
>         if (a6xx_state->gmu_log) {
>                 struct msm_gpu_state_bo *gmu_log = a6xx_state->gmu_log;
> --
> 2.45.1
>


-- 
With best wishes
Dmitry

