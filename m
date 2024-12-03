Return-Path: <linux-arm-msm+bounces-40078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC959E1D2E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 14:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9F16161468
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 13:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C761B0F39;
	Tue,  3 Dec 2024 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKYsU8vR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5783619A297
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 13:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733231501; cv=none; b=bkmVY3gx4YKrWFj/BnUD55dNsDUx3lg1d6qsRQFgzzXGQhOzB3OLZssmbYxeHP3019RpmC4obs5HH82zZ8/VqO+nrl0diIl6d37HE7sDbZ7sNt4v/BRSJTPodkXU2o1XnuN467wknd/6/FL5Ayi7Y89glZwrhDtpffRSTpMLt7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733231501; c=relaxed/simple;
	bh=F+xf2YdZ9ZHuA2EJVQXEMV7Kyt4fq2r7m1VRKj5i9vA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZeQ2AwCEGGls1ZJST5WGkzxeYYyrnxbdorBOlm0xfge/BnZZbDdwn3l1elEaQRXutJT3fPZf0HKtwxeHqHu/v8CpBCekdy/onshkdDyysl5bmVOBh8ru4GTl6jO9SUjE6pPBGFXoIOU1oS9GVNve0/qNj6ppBcUsoXiQp6NvmVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKYsU8vR; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ffe2700e91so47598061fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 05:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733231497; x=1733836297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLu545PqDQlxiRA32gSM5zrC3EABG/mkn9my0+hj+vE=;
        b=nKYsU8vR7z8pTzwJjEBzRj9gTYZr8mcwGYNiW9CQQdxbXIXCUNs1HLoxqIiTMQmoAD
         pOy0AvleurovXdWjFCdrWd6XNhhc/Z68ACF1HgcbR+JiyFx/U8qT+bwyTvNmeZIfcerc
         GTWMCqrI1sXWddsQ9KWpwb8XuhI7S2879muEn2KLRGXj1ST7W55UXfp2Ocu5BAAtq0YV
         hDKnnIImkCSFixy6nLW+TQgGnDriRVp0J2TQRJso+Jkd7XZN5LvoeAB7C5bb3dgak/VD
         nJQHQbAbKh+2xpF1Apsvyr0ovk+fK2K3iuRfvY0ekl94/CP39lC/MkIFEMMjD+ApE6m6
         Yb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733231497; x=1733836297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLu545PqDQlxiRA32gSM5zrC3EABG/mkn9my0+hj+vE=;
        b=YzMCrdmx4jTQgwSavaLviGa0Laf8jRspMZxlsApnZx3w1qmFwEWIJCu+wtSwhyO5zx
         HmKxTDheV/XuLLlITnPwmh/lOoreH5v0VcHFwySnBxI4Y98a+BfG3Em4JA6+shHUHoYG
         3IXV7Tdoys0XOwFp+Th0uDiqavfdDzuc8WzsWxONgYa96RZSIYCjhmPCdwOyby0j4mjG
         vy3bHN1L1atQ5hC9nQ5wTP0ALjFaUHP8niVMdGU1z2l4JamhkbL+plIXn7HY/MpngSf8
         kE2LfvOxkSw3B+ugZoe2R1FT+5NfYNEfAX5Tq7oEZo+lNyD0zfWqRbrULvbi2cNVoH6y
         KGpg==
X-Forwarded-Encrypted: i=1; AJvYcCWDD6rM8uT9YyXeD+LgdHcTMQl83p3zX3M+ZD0vrfgvwysc02PXeDV3Gt+Nrcnwi0N+iwxF7P8XnbRoYIZq@vger.kernel.org
X-Gm-Message-State: AOJu0YxojdT4+nM9A7itE3uuMbuVRgYOcZG7Ev4g6ZNwtZv1xKEF+gjf
	0HSmlE9T7/EquEq0nPKlB6GISx0Ad3Dei9V41aMP0wyyvq/Js4cYg0eARoF3vH5KnuoAO2bkddM
	LThJ/yHoI9YFXWGiOTibzLmwTRAk=
X-Gm-Gg: ASbGncu3ZmKcaAlaO0W96YIxGjFtw2z3YX34pmSudjjGKuqUW81mUPP9WDgeZOwJ0ye
	cfrEy7VGlDH1I6Him9hdv/N7rMZx1wIY=
X-Google-Smtp-Source: AGHT+IFZF/HasRFYEWJ1KdVu0ybRDr3hQa5ZiwXWxqtZSA9EIVu86JPEMjTVegsKBCDFcYq0BMh9MhkKO5fdQZ6ONMo=
X-Received: by 2002:a2e:bd84:0:b0:2ff:c016:f293 with SMTP id
 38308e7fff4ca-30009c30148mr12327951fa.15.1733231496996; Tue, 03 Dec 2024
 05:11:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203095920.505018-1-dpiliaiev@igalia.com> <20241203095920.505018-2-dpiliaiev@igalia.com>
In-Reply-To: <20241203095920.505018-2-dpiliaiev@igalia.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 3 Dec 2024 05:11:13 -0800
Message-ID: <CAF6AEGvuG_TMSVd5i3aMR=--LJUJNRnTJNTzyesOXhZKjY8jaQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/msm: Expose uche trap base via uapi
To: Danylo Piliaiev <danylo.piliaiev@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 1:59=E2=80=AFAM Danylo Piliaiev
<danylo.piliaiev@gmail.com> wrote:
>
> This adds MSM_PARAM_UCHE_TRAP_BASE that will be used by Mesa
> implementation for VK_KHR_shader_clock and GL_ARB_shader_clock.
>
> Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
>  include/uapi/drm/msm_drm.h              |  1 +
>  6 files changed, 23 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a4xx_gpu.c
> index 50c490b492f0..f1b18a6663f7 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -251,8 +251,8 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
>                 gpu_write(gpu, REG_A4XX_UCHE_CACHE_WAYS_VFD, 0x07);
>
>         /* Disable L2 bypass to avoid UCHE out of bounds errors */
> -       gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, 0xffff0000);
> -       gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, 0xffff0000);
> +       gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_g=
pu->uche_trap_base));
> +       gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_g=
pu->uche_trap_base));
>
>         gpu_write(gpu, REG_A4XX_CP_DEBUG, (1 << 25) |
>                         (adreno_is_a420(adreno_gpu) ? (1 << 29) : 0));
> @@ -693,6 +693,8 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>         if (ret)
>                 goto fail;
>
> +       adreno_gpu->uche_trap_base =3D 0xffff0000ffff0000ull;
> +
>         if (!gpu->aspace) {
>                 /* TODO we think it is possible to configure the GPU to
>                  * restrict access to VRAM carveout.  But the required
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index ee89db72e36e..caf2c0a7a29f 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -750,10 +750,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A5XX_UCHE_CACHE_WAYS, 0x02);
>
>         /* Disable L2 bypass in the UCHE */
> -       gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, 0xFFFF0000);
> -       gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, 0x0001FFFF);
> -       gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, 0xFFFF0000);
> -       gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, 0x0001FFFF);
> +       gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_g=
pu->uche_trap_base));
> +       gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_g=
pu->uche_trap_base));
> +       gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, lower_32_bits(ad=
reno_gpu->uche_trap_base));
> +       gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, upper_32_bits(ad=
reno_gpu->uche_trap_base));
>
>         /* Set the GMEM VA range (0 to gpu->gmem) */
>         gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
> @@ -1805,5 +1805,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *de=
v)
>         adreno_gpu->ubwc_config.macrotile_mode =3D 0;
>         adreno_gpu->ubwc_config.ubwc_swizzle =3D 0x7;
>
> +       adreno_gpu->uche_trap_base =3D 0x0001ffffffff0000ull;
> +
>         return gpu;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 019610341df1..0ae29a7c8a4d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1123,12 +1123,12 @@ static int hw_init(struct msm_gpu *gpu)
>
>         /* Disable L2 bypass in the UCHE */
>         if (adreno_is_a7xx(adreno_gpu)) {
> -               gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff=
000llu);
> -               gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fff=
ffffff000llu);
> +               gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uch=
e_trap_base);
> +               gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gp=
u->uche_trap_base);
>         } else {
> -               gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, 0x0001fff=
fffffffc0llu);
> -               gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff=
000llu);
> -               gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fff=
ffffff000llu);
> +               gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, adreno_gp=
u->uche_trap_base + 0xfc0);
> +               gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uch=
e_trap_base);
> +               gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gp=
u->uche_trap_base);
>         }
>
>         if (!(adreno_is_a650_family(adreno_gpu) ||
> @@ -2533,6 +2533,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *de=
v)
>                 }
>         }
>
> +       adreno_gpu->uche_trap_base =3D 0x1fffffffff000ull;
> +
>         if (gpu->aspace)
>                 msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
>                                 a6xx_fault_handler);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 076be0473eb5..774ff6eacb9f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -385,6 +385,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_=
file_private *ctx,
>         case MSM_PARAM_MACROTILE_MODE:
>                 *value =3D adreno_gpu->ubwc_config.macrotile_mode;
>                 return 0;
> +       case MSM_PARAM_UCHE_TRAP_BASE:
> +               *value =3D adreno_gpu->uche_trap_base;
> +               return 0;

Maybe this should return an error on earlier gens.

Also, if possible, rebase on https://patchwork.freedesktop.org/series/14166=
7/

BR,
-R

>         default:
>                 DBG("%s: invalid param: %u", gpu->name, param);
>                 return -EINVAL;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index e71f420f8b3a..9bd38dda4308 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -253,6 +253,8 @@ struct adreno_gpu {
>         bool gmu_is_wrapper;
>
>         bool has_ray_tracing;
> +
> +       u64 uche_trap_base;
>  };
>  #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
>
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index b916aab80dde..2342cb90857e 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -90,6 +90,7 @@ struct drm_msm_timespec {
>  #define MSM_PARAM_RAYTRACING 0x11 /* RO */
>  #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
>  #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
> +#define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
>
>  /* For backwards compat.  The original support for preemption was based =
on
>   * a single ring per priority level so # of priority levels equals the #
> --
> 2.46.2
>

