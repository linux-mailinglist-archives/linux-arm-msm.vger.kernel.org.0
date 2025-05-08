Return-Path: <linux-arm-msm+bounces-57320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FABAB030E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 20:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEA6E3A838D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2ED2222DD;
	Thu,  8 May 2025 18:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWucyzGw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162C11990A7;
	Thu,  8 May 2025 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729687; cv=none; b=maib3Cg0yjs+5yXSs5XCrdDIuY6ekJcM8N+0qRat6yRC9OMjIHd9X8oVElRGMFmSKIoxlT9uBNxf4THOoLHJXHXafBswFaf8Gv0YLZ5UN/D4vSPOFq/YuBYkL1CV7/inRV3Q0IvjSUjL6ihUnWSrvtIN+w4DJ/mffCvm2XBYg+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729687; c=relaxed/simple;
	bh=IFjhEb84wH0qi6JVb7sBwK6FSX3UsXtNp/GN3Yy6cP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGFLYH4PmSSm8stovXHyL2ZCrGC0N4o4FUEhc7LWHSOScLS704agyk3WHOr2xnmqDvDzHCunwyoyxdIvC6Du5CPx13rHRiZztYLZ0TU05D0Kpiiel3XksKql1+V/20cuN8ev6KbessCZpf2wOf3MEci9b9fgFyMELkmaIsGIiPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWucyzGw; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3da79204277so8142535ab.3;
        Thu, 08 May 2025 11:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746729685; x=1747334485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIIIefdaY9sYKEAXeUQFab1kLTouIAql70z4Rrnnjfg=;
        b=MWucyzGwjL2RstzXpPlKxJDfOw1sf4twCEYFoNBj7z/zFG4GbTANL7iGgs2dBPzED9
         UltVuP+m1mWLyxxXjzx2wEQ1ujR6WhDQHfQvrCGYo6dfal86Pkh9oojsPe4N+WPfWMU1
         6qBbgRuC6ikd5ne0ZKPQIMGFCY85HcAkt4mLHwkwyDD21jMS6I+02AOJ20Z16bZnxUlI
         sthqXeSEOayvrOObJi2q65/WdvHJAleGiJxgEnYA62+qy6/+h47/kDIDyZ9dj2l726ob
         ybjIZodnaZDkUny6IdahjmoEhVu+mpqPwB0ttuYe38HTfEyAhTFPeMjaonT3Tc0Ra9qU
         bcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746729685; x=1747334485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIIIefdaY9sYKEAXeUQFab1kLTouIAql70z4Rrnnjfg=;
        b=DHJ1XfhuGrgF4KkZ7LyVo4P0J3dD+6s8A7bAMAl750NKJ69Ufl3HDmGtc1pAVaXfoH
         ZPT1JfA6SPFaD3EkEEUWpA/DxliG60x12lCdUYXGEqwCGbvPXN+czDVqgYcHKs9ES215
         L2vurY0o4tJ4PjrTDxAerw6jnbHvDod04YQ1sin6thdwu+nG4onZBXDdfdmRxT8YzeTb
         xzDCOJY9HqGIGZLHl4kMI/siUh314x7QdyPth1fuoMHe1G3Gi8VkpblZoSE8BLXx+fgT
         bk3wzokhdpqVyukubzjJlQtjFiIL6NTPoigF7dOyBmr9dUMxrdyf1ObF2FeWdcN2RXhU
         uvxw==
X-Forwarded-Encrypted: i=1; AJvYcCUEZGWcjxRo+ntl+eh4JsO57RH7hSRO4y2QBMNCljPD5lw9RNBJeK/HM4I0xrSXnJZfZXw8fgPKiA1F4nBh@vger.kernel.org, AJvYcCWXEFdTOWiaoEk9a6Qd92XjgYKcaOt3/hb7QsML3NuCfzIgQqvD/LzYIwWpQO1sGFqEs92TMpT2wT2A0Twe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy75zxyqpg9YHPVSVZmvAFQXrrrxMa7uYQIZONfFmopa+XWcoDj
	+PbK1DpdKZHLe+3Vt+Cs/SSsl/QXY5dXx3yBR5vlipNzfO/2OmGPKYhFcuAN+TE5gNzbD/+LG+d
	5nNyfLG+72zAqhFNv1MXPRoMjI6s=
X-Gm-Gg: ASbGncv4E6PGpDC1Jr6qcFas2NWe2S7aBxoBXjE8klB89bcBZcAPgOPtntQLmxp/ORQ
	Ggofr1/W4m+M/e9UDXkXJjFvvSpLRgkIKnR7u/JgHusbC12fkdKf6pavu++6thADdQS05oGdeDw
	cLtC9d40/6NWs5Qw2JtOolw54klbdAwPhS68+SKYj7ZZ8b1lZwPds=
X-Google-Smtp-Source: AGHT+IEnu1L6F7VfV0Ubjw5sm0H1uMFjC+BmvIneeK2e24BLLnOMQ238GCHU+ApH04ZY1S2AcpFqb+ZwprrQ5Xvp1Oc=
X-Received: by 2002:a05:6e02:1809:b0:3d8:19e8:e738 with SMTP id
 e9e14a558f8ab-3da7e20cfd3mr7774505ab.17.1746729684889; Thu, 08 May 2025
 11:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com> <20250508-topic-ubwc_central-v1-4-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-4-035c4c5cbe50@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 8 May 2025 11:41:12 -0700
X-Gm-Features: ATxdqUGX42iaxTvC7pe_iBnJYk6Ho2xV2KhxTzfU1hlmmWDCQoDzombs5VYi5E8
Message-ID: <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com>
Subject: Re: [PATCH RFT 04/14] drm/msm/a6xx: Get a handle to the common UBWC config
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 11:13=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Start the great despaghettification by getting a pointer to the common
> UBWC configuration, which houses e.g. UBWC versions that we need to
> make decisions.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>  3 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index b161b5cd991fc645dfcd69754b82be9691775ffe..89eb725f0950f3679d6214366=
cfbd22d5bcf4bc7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -585,8 +585,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), prote=
ct->regs[i]);
>  }
>
> -static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> +static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  {
> +       /* Inherit the common config and make some necessary fixups */
> +       gpu->common_ubwc_cfg =3D qcom_ubwc_config_get_data();

This does look a bit funny given the devm_kzalloc() below.. I guess
just so that the ptr is never NULL?

BR,
-R

> +       if (IS_ERR(gpu->common_ubwc_cfg))
> +               return -EINVAL;
> +
>         gpu->ubwc_config.rgb565_predicator =3D 0;
>         gpu->ubwc_config.uavflagprd_inv =3D 0;
>         gpu->ubwc_config.min_acc_len =3D 0;
> @@ -663,6 +668,8 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *=
gpu)
>                 gpu->ubwc_config.highest_bank_bit =3D 1;
>                 gpu->ubwc_config.min_acc_len =3D 1;
>         }
> +
> +       return 0;
>  }
>
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
> @@ -2540,7 +2547,12 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *d=
ev)
>                 msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
>                                 a6xx_fault_handler);
>
> -       a6xx_calc_ubwc_config(adreno_gpu);
> +       ret =3D a6xx_calc_ubwc_config(adreno_gpu);
> +       if (ret) {
> +               a6xx_destroy(&(a6xx_gpu->base.base));
> +               return ERR_PTR(ret);
> +       }
> +
>         /* Set up the preemption specific bits and pieces for each ringbu=
ffer */
>         a6xx_preempt_init(gpu);
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 2348ffb35f7eb73a26da47881901d9111dca1ad9..b7f7eb8dcb272394dce8ed1e6=
8310a394c1734a9 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -1149,6 +1149,12 @@ int adreno_gpu_init(struct drm_device *drm, struct=
 platform_device *pdev,
>                 speedbin =3D 0xffff;
>         adreno_gpu->speedbin =3D (uint16_t) (0xffff & speedbin);
>
> +       adreno_gpu->common_ubwc_cfg =3D devm_kzalloc(dev,
> +                                                  sizeof(*adreno_gpu->co=
mmon_ubwc_cfg),
> +                                                  GFP_KERNEL);
> +       if (!adreno_gpu->common_ubwc_cfg)
> +               return -ENOMEM;
> +
>         gpu_name =3D devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT=
,
>                         ADRENO_CHIPID_ARGS(config->chip_id));
>         if (!gpu_name)
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index a8f4bf416e64fadbd1c61c991db13d539581e324..06be95d3efaee94e4107a484a=
d3132e0a6a9ea46 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -12,6 +12,8 @@
>  #include <linux/firmware.h>
>  #include <linux/iopoll.h>
>
> +#include <linux/soc/qcom/ubwc.h>
> +
>  #include "msm_gpu.h"
>
>  #include "adreno_common.xml.h"
> @@ -243,6 +245,7 @@ struct adreno_gpu {
>                  */
>                 u32 macrotile_mode;
>         } ubwc_config;
> +       const struct qcom_ubwc_cfg_data *common_ubwc_cfg;
>
>         /*
>          * Register offsets are different between some GPUs.
>
> --
> 2.49.0
>

