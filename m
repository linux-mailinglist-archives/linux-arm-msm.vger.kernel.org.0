Return-Path: <linux-arm-msm+bounces-32321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD23A984997
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 18:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BB04280A24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 16:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCE91AB6E4;
	Tue, 24 Sep 2024 16:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wua6sy3y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAFA1B85D2;
	Tue, 24 Sep 2024 16:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727195250; cv=none; b=XsYTj48U15tSreuL9CRUr2aw+TpfU0CS6J/FQFkNHKFUt8nvauPc+TJrQgrgDgz/J/MaOqpo4ulf7CUwaCb7g2+GFOCDhNZQqpy5ihQ7fFthAbkPNLi8zcLyC5JFYPFlDpu/m9cgLq3RETOvtm5Vp2W5NbXN0g72lP8q5+fnYIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727195250; c=relaxed/simple;
	bh=9HF8JVLN9dQ2kLahJhqOyeSX7NT07bcL0IEtmzfd7nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tuHH6cUhzLS35m8ewM9jahMcGiIqiP0VrPUHi/4tnIsVOjFrVR7lNZCzWlIREJyhDdy6fa4jgZ529Rn1rhWCRKWUuhH75WW7GaWTBjXTvVuMtJ7rXMpoSLY87NkVuq1W8e0U0OEjflNK6nPzqFho6gq6b+fEOnKNou0TtWrtpmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wua6sy3y; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a1a3090f39so5720785ab.3;
        Tue, 24 Sep 2024 09:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727195248; x=1727800048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIKJ3tLYnjzjQAicXIIqfWRcuCEsTe9hsi8L1oCHUJE=;
        b=Wua6sy3yuDyKsGD9hyg/EytfrvOyIXg5ppwLy8HPacWpHjmW9lAx0+L+MFz9uA4CHA
         NUpN9gQQucZUvdmmTpFyTapKdJU6ojEl5ZVnc3pWG5LzQ72JmrmRkRuVMpUihZDuSXO1
         35b+A/3Em7uzMeXHtVhxAimWdgC3s0FNoGL8iUF8AuvkWUaFFw/E3+ixP7Y1P8/UZq4Z
         10XzY0Be8+jDFmJkVkP3UrLLUVWI5VT49cBP6b9/quHgNeMK5vPLv5h2BeYtBTVIlCNX
         P8adgLgDjR/sgnvG8F28F99PCah8+vqbRjtxItaqtX3c8xI8sOyxjcbTXDTmZ9VQ+3B2
         2S7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727195248; x=1727800048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIKJ3tLYnjzjQAicXIIqfWRcuCEsTe9hsi8L1oCHUJE=;
        b=L1hivqEOjq8mMss5y4AgUoAPqzJt+Zfzjijx3/47BavIl1wvBjMEh9Q1hOp3CaP7Q/
         lA1njvJswnVWXIw4smTxp6AS6jq0uvrxSt1vg/3fiLgM/VqYOJ9kSjk+xDTR2AMWVCBg
         Ppji/iFpa8Qw1VzG/IFump9sOmFQNj+I0hxBqHCPkLfh6/UwHWBFpaOnADmbQqjlWaAU
         f0P9XaEEV0NfxXN2gAxqPQ/tRCdUsQzbyWdqO6OSSv1Qff8kpmTw6GTzNoJ+5iVcZsLN
         H4dmH95X4e9BcXXfwVGMvWpWkrvKZoUHKKhZtef72vjv2BOzQ7sZJv9DJbapHNqlJTFg
         Z6ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmqYAWmlc58AMA0k2w3ryenTxoUZdD8Mwf5cCUDH8bDGOh+elLkjUlDrIuPEZUI6xL0XSxzHMhQLeA@vger.kernel.org, AJvYcCWEkwxBn3i+Hzrdox93gR5RTA4f1EZGoYG6CioE6quuu2tEUnhixG2r67fgJnZXxursVb+xydYJZDJ/nL9/@vger.kernel.org, AJvYcCWxBuzmKKaPKSerRxfikAqnooJrgYN99WTUDBJ6blzRrzjexOyvD8zj3gWEStVlZnuwRzdxAqK1DoET+Y2u@vger.kernel.org
X-Gm-Message-State: AOJu0Yya5gA+2//19cSBYo8shV89USmKDAwcZn7J9LJHDo0gzYpfsfO0
	WnrF/YnEK1X4AiIcshNm7JQ+hpS7RZVx+Re66UTOupHkUl4Hzb7YbFrDN5R0rlFnDIkdZAUY2rC
	Av5gU4wnA6jK9YsksXHW/2K0gNac=
X-Google-Smtp-Source: AGHT+IG9boXyVk/1DBYrjUtsCFlsGG3k5A0clibRl0uG/AxfB6qhwgN3oUtXzCNhhSbUc7BmikIteq3R9XRZ7x4hGyY=
X-Received: by 2002:a05:6e02:20c8:b0:3a0:9aff:5046 with SMTP id
 e9e14a558f8ab-3a26d795471mr409395ab.15.1727195248272; Tue, 24 Sep 2024
 09:27:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com> <20240924-preemption-a750-t-v5-10-0be2bf81c187@gmail.com>
In-Reply-To: <20240924-preemption-a750-t-v5-10-0be2bf81c187@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 24 Sep 2024 09:27:16 -0700
Message-ID: <CAF6AEGsixas1wa4k6QjjwdjKqq1hHk8RDBeL-MUHTcmMRrFDoQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] drm/msm/A6xx: Enable preemption for A750
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

nit, lowercase "a6xx" in subject prefix

(no need to resend just for this, I can fix it up when applying
patches if needed.. but if you do resend pls fix that)

BR
-R

On Tue, Sep 24, 2024 at 4:30=E2=80=AFAM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> Initialize with 4 rings to enable preemption.
>
> For now only on A750 as other targets require testing.
>
> Add the "preemption_enabled" module parameter to override this for other
> A7xx targets.
>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 3 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 6 +++++-
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 1 +
>  4 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/=
msm/adreno/a6xx_catalog.c
> index 316f23ca91671d973797f2a5b69344f376707325..0e3041b2941905f1acdc9e571=
e0549a960a7edfa 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1240,7 +1240,8 @@ static const struct adreno_info a7xx_gpus[] =3D {
>                 .gmem =3D 3 * SZ_1M,
>                 .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
>                 .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -                         ADRENO_QUIRK_HAS_HW_APRIV,
> +                         ADRENO_QUIRK_HAS_HW_APRIV |
> +                         ADRENO_QUIRK_PREEMPTION,
>                 .init =3D a6xx_gpu_init,
>                 .zapfw =3D "gen70900_zap.mbn",
>                 .a6xx =3D &(const struct a6xx_info) {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index edbcb6d229ba614be910ee70e75731538116e4a4..4760f9469613c0bf208f56be9=
608747b5aa75606 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2529,6 +2529,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *de=
v)
>         struct a6xx_gpu *a6xx_gpu;
>         struct adreno_gpu *adreno_gpu;
>         struct msm_gpu *gpu;
> +       extern int enable_preemption;
>         bool is_a7xx;
>         int ret;
>
> @@ -2567,7 +2568,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *d=
ev)
>                 return ERR_PTR(ret);
>         }
>
> -       if (is_a7xx)
> +       if ((enable_preemption =3D=3D 1) || (enable_preemption =3D=3D -1 =
&&
> +           (config->info->quirks & ADRENO_QUIRK_PREEMPTION)))
> +               ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7x=
x, 4);
> +       else if (is_a7xx)
>                 ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7x=
x, 1);
>         else if (adreno_has_gmu_wrapper(adreno_gpu))
>                 ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmu=
wrapper, 1);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index cfc74a9e2646d3de76a06bd67457d69afa49e309..9ffe91920fbfb4841b28aabec=
9fbde94539fdd83 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -20,6 +20,10 @@ bool allow_vram_carveout =3D false;
>  MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in pla=
ce of IOMMU");
>  module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600)=
;
>
> +int enable_preemption =3D -1;
> +MODULE_PARM_DESC(enable_preemption, "Enable preemption (A7xx only) (1=3D=
on , 0=3Ddisable, -1=3Dauto (default))");
> +module_param(enable_preemption, int, 0600);
> +
>  extern const struct adreno_gpulist a2xx_gpulist;
>  extern const struct adreno_gpulist a3xx_gpulist;
>  extern const struct adreno_gpulist a4xx_gpulist;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 87098567483b69c21025b80f356e0a68f0e7f172..d1cd53f05de68b3873f355206=
55e09e82fc40449 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -56,6 +56,7 @@ enum adreno_family {
>  #define ADRENO_QUIRK_LMLOADKILL_DISABLE                BIT(2)
>  #define ADRENO_QUIRK_HAS_HW_APRIV              BIT(3)
>  #define ADRENO_QUIRK_HAS_CACHED_COHERENT       BIT(4)
> +#define ADRENO_QUIRK_PREEMPTION                        BIT(5)
>
>  /* Helper for formating the chip_id in the way that userspace tools like
>   * crashdec expect.
>
> --
> 2.46.1
>

