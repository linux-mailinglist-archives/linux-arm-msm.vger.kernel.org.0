Return-Path: <linux-arm-msm+bounces-24140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F97D916F02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 19:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7D411F22937
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 17:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429E4176AC0;
	Tue, 25 Jun 2024 17:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6y2RRff"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5977117554D;
	Tue, 25 Jun 2024 17:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719336066; cv=none; b=R5YUFFzJSS37zi/vTsPUz1vTNbMLhp4mVTTAbfr2yAFi2bLpCVOW0iH1VDMmFedpcBvr9zFqapXnDRyGjy52M2g9+2fJbsPWMkqbB6iLBVxyMT4DAwVnRDIoC0zTaBnOEx/yt6qYucKosPtQGrExvW48IwJU/FBM1wdDKbuz6lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719336066; c=relaxed/simple;
	bh=1nPHdsGtsC3hxphqJuf52TsUbw1HEdNBJ6hvwyPAcEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5UatQpa5cLoDYGXIzyUB8laRh/M0gXpL9FWiE0PxeYjnmt/zopJv1c7RbbMUqQbbKJT7HrWXdJY1AZZ5qkxmPNN/G0kVGFyPmPM/NLpZ1fVoFAuoX06CPSzudI51c91KoPVJcVVFZ49VzZ4Bpd7qFtB0JMpcnVeohF/wxLHIEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6y2RRff; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57d203d4682so7291240a12.0;
        Tue, 25 Jun 2024 10:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719336062; x=1719940862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rdz7uWIbkRRdjdxNqryMmF6TlJYjYOFRUvZlp1bdWUI=;
        b=L6y2RRffvLN9OxXh/X2wHBXJ2QyAT6/O2V1pc+XIni19uTEZaxrHlOPV7qWMtgLDyF
         GQYRUkM/JyF/6Zxz8gOKb82UzLfYgSg8H8nZdZ/fk5jTKFq+3fr/BSnNhDAaOu0OLk21
         c0iHZiSGJo36xAsRhYpw1b/9ocHZ57RBj2nnRCb9xY1KnYtdWPpzejz7EtI02q3oyba3
         7SpIpK/CGoU4bA5yiLa9KyAi0rUfVmKFFeLnAA4GhzWb7bs8CVOYaF4Bcq9v4pYU2wNQ
         N44pGlRYKmbHMXDQHqHPpAgpUyaoKNu7/GRxbqNDxSw5EiMN7d9dUxMYcoq62e5X1r5w
         hEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719336062; x=1719940862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rdz7uWIbkRRdjdxNqryMmF6TlJYjYOFRUvZlp1bdWUI=;
        b=cPALsAtpdq3cZY1ih7Fhn8tCCgWkNqmPbU1Dkc/DqxR3rDTMnIGxmOIPh5KoxfKfJY
         eSoIYuWcpLVMJLsu9K8UL1IaDzbp0IyLbvqUSG1SZr8vcn8ix/lSfqtEt6rFsEHnzU1C
         77q8XO3WOlbmY5jv4w/4Ona+g3TuSJ2uKrM8gm4AyM7OblRXYPrA+qHqm909MHRdkpsk
         ayh8rknJgBh1XNovvb1DEcwa9F5v+YRDNxfe4jdY6xpzDHPXBDY9sPSjMLReqTrP1o09
         kQNffZYMvel+bJatWLXyskopXdxN6025CnuzSMLtszy5ngUSsq/l0z1RUMI3wl61dlbW
         rsHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtsiQMe3s6eZdniMy4zvWgkIxlYV4kRLiyuI8VQK7Vlx39EmKdhTlX+kZMTmqIICjR4pG8w3C/BHJx9Yb/1tktDV3Vfbo+EC6zIr+z+6lgGe3hlAjjrNJBhzZMjufE+ck7LDHYjY9Zp6unZDftZE26fwpC7Lca8sD3EZpZxt1c9rIWHI9T7xI=
X-Gm-Message-State: AOJu0Yxr9x2vS66OO6xAUID8IpKKbJJBcvmdUVMC4oVvGMHqptN1iKap
	eTy5tvfdISRHu+rWWVr7gM9WzvXwzUMGnailmuXCes/1umutcnGugDcufK2WJYFA9M2gg2sJ2b2
	UUjlqoBvYek/w+GieLPY1qwDjnMk=
X-Google-Smtp-Source: AGHT+IGEmZqq/SpvOkmU673/2JHQNBy+EJxIcFpLbPnpSHffkfTep4AG61Yupl0I8tJELOx4CtCASYRSeLdh0WgaM5w=
X-Received: by 2002:a50:99de:0:b0:57c:fa44:7a04 with SMTP id
 4fb4d7f45d1cf-57d4580b070mr6426553a12.39.1719336062186; Tue, 25 Jun 2024
 10:21:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org> <20240605-topic-smem_speedbin-v2-3-8989d7e3d176@linaro.org>
In-Reply-To: <20240605-topic-smem_speedbin-v2-3-8989d7e3d176@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 25 Jun 2024 10:20:49 -0700
Message-ID: <CAF6AEGvhkEWCtCKdRjhyk18+cxbn0QLkRUrMqEfgGU-c+K1YxQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] drm/msm/adreno: Implement SMEM-based speed bin
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 1:10=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:
>
> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
> abstracted through SMEM, instead of being directly available in a fuse.
>
> Add support for SMEM-based speed binning, which includes getting
> "feature code" and "product code" from said source and parsing them
> to form something that lets us match OPPs against.
>
> Due to the product code being ignored in the context of Adreno on
> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  8 +++---
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  2 ++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 41 ++++++++++++++++++++++++=
+++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 12 ++++++---
>  4 files changed, 53 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 973872ad0474..3f84417ff027 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2894,13 +2894,15 @@ static u32 fuse_to_supp_hw(const struct adreno_in=
fo *info, u32 fuse)
>         return UINT_MAX;
>  }
>
> -static int a6xx_set_supported_hw(struct device *dev, const struct adreno=
_info *info)
> +static int a6xx_set_supported_hw(struct adreno_gpu *adreno_gpu,
> +                                struct device *dev,
> +                                const struct adreno_info *info)
>  {
>         u32 supp_hw;
>         u32 speedbin;
>         int ret;
>
> -       ret =3D adreno_read_speedbin(dev, &speedbin);
> +       ret =3D adreno_read_speedbin(adreno_gpu, dev, &speedbin);
>         /*
>          * -ENOENT means that the platform doesn't support speedbin which=
 is
>          * fine
> @@ -3060,7 +3062,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *de=
v)
>
>         a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
>
> -       ret =3D a6xx_set_supported_hw(&pdev->dev, config->info);
> +       ret =3D a6xx_set_supported_hw(adreno_gpu, &pdev->dev, config->inf=
o);
>         if (ret) {
>                 a6xx_llc_slices_destroy(a6xx_gpu);
>                 kfree(a6xx_gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index c3703a51287b..901ef767e491 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -6,6 +6,8 @@
>   * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
>   */
>
> +#include <linux/soc/qcom/socinfo.h>
> +
>  #include "adreno_gpu.h"
>
>  bool hang_debug =3D false;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 074fb498706f..055072260b3d 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -21,6 +21,9 @@
>  #include "msm_gem.h"
>  #include "msm_mmu.h"
>
> +#include <linux/soc/qcom/smem.h>
> +#include <linux/soc/qcom/socinfo.h>
> +
>  static u64 address_space_size =3D 0;
>  MODULE_PARM_DESC(address_space_size, "Override for size of processes pri=
vate GPU address space");
>  module_param(address_space_size, ullong, 0600);
> @@ -1057,9 +1060,39 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem =
*adreno_ocmem)
>                            adreno_ocmem->hdl);
>  }
>
> -int adreno_read_speedbin(struct device *dev, u32 *speedbin)
> +int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
> +                        struct device *dev, u32 *fuse)
>  {
> -       return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin=
);
> +       u32 fcode;
> +       int ret;
> +
> +       /*
> +        * Try reading the speedbin via a nvmem cell first
> +        * -ENOENT means "no nvmem-cells" and essentially means "old DT" =
or
> +        * "nvmem fuse is irrelevant", simply assume it's fine.
> +        */
> +       ret =3D nvmem_cell_read_variable_le_u32(dev, "speed_bin", fuse);
> +       if (!ret)
> +               return 0;
> +       else if (ret !=3D -ENOENT)
> +               return dev_err_probe(dev, ret, "Couldn't read the speed b=
in fuse value\n");
> +
> +#ifdef CONFIG_QCOM_SMEM
> +       /*
> +        * Only check the feature code - the product code only matters fo=
r
> +        * proto SoCs unavailable outside Qualcomm labs, as far as GPU bi=
n
> +        * matching is concerned.
> +        *
> +        * Ignore EOPNOTSUPP, as not all SoCs expose this info through SM=
EM.
> +        */
> +       ret =3D qcom_smem_get_feature_code(&fcode);
> +       if (!ret) {
> +               *fuse =3D ADRENO_SKU_ID(fcode);
> +       } else if (ret !=3D -EOPNOTSUPP)
> +               return dev_err_probe(dev, ret, "Couldn't get feature code=
 from SMEM\n");
> +#endif
> +
> +       return 0;
>  }
>
>  int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev=
,
> @@ -1098,9 +1131,9 @@ int adreno_gpu_init(struct drm_device *drm, struct =
platform_device *pdev,
>                         devm_pm_opp_set_clkname(dev, "core");
>         }
>
> -       if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
> +       if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin=
)
>                 speedbin =3D 0xffff;
> -       adreno_gpu->speedbin =3D (uint16_t) (0xffff & speedbin);
> +       adreno_gpu->speedbin =3D speedbin;
>
>         gpu_name =3D devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT=
,
>                         ADRENO_CHIPID_ARGS(config->chip_id));
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 77526892eb8c..8f2b70eaf6ad 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -81,7 +81,12 @@ extern const struct adreno_reglist a612_hwcg[], a615_h=
wcg[], a630_hwcg[], a640_h
>  extern const struct adreno_reglist a660_hwcg[], a690_hwcg[], a702_hwcg[]=
, a730_hwcg[], a740_hwcg[];
>
>  struct adreno_speedbin {
> -       uint16_t fuse;
> +       /* <=3D 16-bit for NVMEM fuses, 32b for SOCID values */
> +       uint32_t fuse;
> +/* As of SM8650, PCODE on production SoCs is meaningless wrt the GPU bin=
 */
> +#define ADRENO_SKU_ID_FCODE            GENMASK(15, 0)
> +#define ADRENO_SKU_ID(fcode)   (SOCINFO_PC_UNKNOWN << 16 | fcode)

So, as I understand this, we are actually only using the feature-code,
which is the low 16b.  So in reality the "fuse" is still only 16b?

BR,
-R

> +
>         uint16_t speedbin;
>  };
>
> @@ -136,7 +141,7 @@ struct adreno_gpu {
>         struct msm_gpu base;
>         const struct adreno_info *info;
>         uint32_t chip_id;
> -       uint16_t speedbin;
> +       uint32_t speedbin;
>         const struct adreno_gpu_funcs *funcs;
>
>         /* interesting register offsets to dump: */
> @@ -519,7 +524,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigne=
d long iova, int flags,
>                          struct adreno_smmu_fault_info *info, const char =
*block,
>                          u32 scratch[4]);
>
> -int adreno_read_speedbin(struct device *dev, u32 *speedbin);
> +int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
> +                        struct device *dev, u32 *speedbin);
>
>  /*
>   * For a5xx and a6xx targets load the zap shader that is used to pull th=
e GPU
>
> --
> 2.43.0
>

