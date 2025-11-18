Return-Path: <linux-arm-msm+bounces-82364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0867EC6A73D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 16:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC6854EEEF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D028359F89;
	Tue, 18 Nov 2025 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZjjMagb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015CA35A954
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481390; cv=none; b=Z860o+oKf7NcA8gJBonb90lkn/WndRQim/YvNx2HMKs3L98rkj5amCPiPduQYB4qqVfphQKJmGBvZrRd4M2ME7u0nFqPlTVCwMi4R7QFcpDbE9P4XKGb8poYPHRn16UtvYUTjb3hJPA63pkIF+1CDGIP0fQzQyATnWqvGcw00/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481390; c=relaxed/simple;
	bh=FoI/0yIBhBAAdixBGW8+u3ufsR/IeE2MFhE0qzpG8vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfl3tbjkG/sp1PgUVmDsQT1VAlMp0OC0SAxqh9JlCcPCFBClnIvn/C14LhYPIYEzLGm046G/9mOYrItRqi6QYB6M8axwusTK1UMin42H6KzkionYGiMOG9sRlUqXBbtKuoOGfZje50PGlXJuV/6aIEtOPp37rsjiGefkYuBRyLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZjjMagb; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-343e2e1a580so1084186a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763481387; x=1764086187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5WRdUpA2CUE7aS1AisvjTy+gobCtbtissttVLsKK2w=;
        b=VZjjMagbP10QIhEz24Raq4vWxKzcVDKubRzDeFo2pdy9OfFOL0WeCiKFVo2OM8VSN8
         MORRCbaSBVovipEBcFF1mcztA4el7drLrnWcc7G49QzBI+IfYYPQVyABMTGuXL4pBMLe
         ZxkxJWJaNFY6T6gkfNVslbii02khOdFM5WnEjpBrxDkny69hqFrV1ivL9UD6JLjL/7q+
         aHzNXS3H2a3QpSu4rx+BwRAancDFQbRDE4zhdGhVoIj7VSTUJ4L1kzCT0X29wqMvzm4r
         oTwfKUPDuVP6XyM4kaQ+FVoNJTz0Lng+dJazexhpNMnWtWxpIUoymY8NH8nxdlRJZ7WI
         OMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481387; x=1764086187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M5WRdUpA2CUE7aS1AisvjTy+gobCtbtissttVLsKK2w=;
        b=SESsLp0t0xPQpjSXeh/sMRIlnmw6gCxm5qWXPVCE1q1oChTIKdlDz7jv6eB3P5sqT8
         XUlEm069ZANz2s8CoF4gbWFwugiL7ebTQUMnTbjjLdQOZLCvd6LKLEX5A4v6cCwhN+dv
         JR4Qb/ekqi+CYvyH/LAdVk7UMgHZa7wIAPf5zL1meEHt6MjAH4MwChx7JwwBVzRpQ/bs
         Vcen3zWBq0EKOWGxmKY9TsvWFDzWmQMwssBlo5e7hBy3Ye1EAYT+SknmRaiZ85fTavnh
         HBUr7uzkQPwjbragHwu/mQSkfSJCs1/agMJooZrpPn4hfPHVACLNsQtBxxyACftxO07l
         iIeA==
X-Forwarded-Encrypted: i=1; AJvYcCWHVnr+y4rRC2Weknm7kHuDyNhgrHP5g7p8BJvwgu603nvx7bU1DEY5r046x7gefnx2CLy5HdesRyEnE73B@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjby0/iibNi1dFg4o3WDvvK41y/19vkTiepQi3dhoMn4eNmSw5
	sEfFrD+iJ7giNu1c3MISIXNPIJLz6CWXrxoCiqrTJtzz8wrvauAIfg0Vb8u11CyFJ2swlRYf/n+
	jr4rW9yaR72OFzSodhRqHRfty8X4bR8k=
X-Gm-Gg: ASbGnctQTdmILqGbOijJNmdDwpAnyv4U4lwD+LugN8hm7AU1vRCKfuddCR05WXlTTZ7
	T9Kok3H3rtYNGAjwQyxHhpilrg8dEJYfcBLggiXuF60HCjQIbhkdfHhLzwihEbLQQ9BEPb92FlI
	me0r9U9k2yK/39D62A6fGzq7vPzd6KvRkcLsnmZtGtw5dy0Ns/zYDjXPRY8X8BhrD2+Tvf2SRNe
	sv8yFvtdksEhb3gNONvfgud6gkTRN/+VNnJgFLq4jR5zrYhIRH24nAyTF7VpgkspOP9IaFdZlWd
	/gmQ/CkP0drk9VGT
X-Google-Smtp-Source: AGHT+IE8t1o/EHIJG7uVd/X+qmNh/IfoMFCfRZRkp7Xo8e8ghyzgHnHIC3pizFSaKdc3W9ZzA4z9Bd0F68Sq2swtnFU=
X-Received: by 2002:a17:90b:1b01:b0:341:b5a2:3e78 with SMTP id
 98e67ed59e1d1-343fa74f0bfmr9250914a91.3.1763481387271; Tue, 18 Nov 2025
 07:56:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com> <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 18 Nov 2025 10:56:16 -0500
X-Gm-Features: AWmQ_bmdki1r5-87hufvE1VD2aBWZ9nuG-r_2OiqIAnZ7-v6leUi15c6-xeP3Cc
Message-ID: <CACu1E7HzsnSjz0SiUJT0SMNJ7cFhiNdtUE9jKHpvD3UzG6EegQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/22] drm/msm/adreno: Support AQE engine
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 3:53=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
>
> Since AQE engine has dependency on preemption context records, expose
> Raytracing support to userspace only when preemption is enabled.

I guess the plan is to expose MSM_PARAM_AQE later once preemption
records are in place and for now just load the firmware to ensure that
people have it?

The interrupt error handling is still missing, but I guess that can be
handled later if that's the plan.

Connor

>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  4 files changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 810b64b909f5..9a643bcccdcf 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1118,6 +1118,23 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>                 }
>         }
>
> +       if (!a6xx_gpu->aqe_bo && adreno_gpu->fw[ADRENO_FW_AQE]) {
> +               a6xx_gpu->aqe_bo =3D adreno_fw_create_bo(gpu,
> +                       adreno_gpu->fw[ADRENO_FW_AQE], &a6xx_gpu->aqe_iov=
a);
> +
> +               if (IS_ERR(a6xx_gpu->aqe_bo)) {
> +                       int ret =3D PTR_ERR(a6xx_gpu->aqe_bo);
> +
> +                       a6xx_gpu->aqe_bo =3D NULL;
> +                       DRM_DEV_ERROR(&gpu->pdev->dev,
> +                               "Could not allocate AQE ucode: %d\n", ret=
);
> +
> +                       return ret;
> +               }
> +
> +               msm_gem_object_set_name(a6xx_gpu->aqe_bo, "aqefw");
> +       }
> +
>         /*
>          * Expanded APRIV and targets that support WHERE_AM_I both need a
>          * privileged buffer to store the RPTR shadow
> @@ -2400,6 +2417,11 @@ static void a6xx_destroy(struct msm_gpu *gpu)
>                 drm_gem_object_put(a6xx_gpu->sqe_bo);
>         }
>
> +       if (a6xx_gpu->aqe_bo) {
> +               msm_gem_unpin_iova(a6xx_gpu->aqe_bo, gpu->vm);
> +               drm_gem_object_put(a6xx_gpu->aqe_bo);
> +       }
> +
>         if (a6xx_gpu->shadow_bo) {
>                 msm_gem_unpin_iova(a6xx_gpu->shadow_bo, gpu->vm);
>                 drm_gem_object_put(a6xx_gpu->shadow_bo);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.h
> index e6218b0b9732..3a054fcdeb4a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -59,6 +59,8 @@ struct a6xx_gpu {
>
>         struct drm_gem_object *sqe_bo;
>         uint64_t sqe_iova;
> +       struct drm_gem_object *aqe_bo;
> +       uint64_t aqe_iova;
>
>         struct msm_ringbuffer *cur_ring;
>         struct msm_ringbuffer *next_ring;
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a8xx_gpu.c
> index c9cd7546024a..e011e80ceb50 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -627,6 +627,9 @@ static int hw_init(struct msm_gpu *gpu)
>                 goto out;
>
>         gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
> +       if (a6xx_gpu->aqe_iova)
> +               gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->=
aqe_iova);
> +
>         /* Set the ringbuffer address */
>         gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
>         gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index c496b63ffd41..0aca222c46bc 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -27,6 +27,7 @@ enum {
>         ADRENO_FW_PFP =3D 1,
>         ADRENO_FW_GMU =3D 1, /* a6xx */
>         ADRENO_FW_GPMU =3D 2,
> +       ADRENO_FW_AQE =3D 3,
>         ADRENO_FW_MAX,
>  };
>
>
> --
> 2.51.0
>

