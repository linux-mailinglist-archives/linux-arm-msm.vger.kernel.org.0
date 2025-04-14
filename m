Return-Path: <linux-arm-msm+bounces-54257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25692A887E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 17:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 572B51893094
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 15:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8F827465F;
	Mon, 14 Apr 2025 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+VsmH+U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEA025229C;
	Mon, 14 Apr 2025 15:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744646339; cv=none; b=aiuBX3y/SyFWXJXV2BtG/V7YW+n0tk9Y1VmDbXsoTUFEfwzr53tRP/i8Xy41MJ4G94cbAr0p1Jzktkz8CfuegiKhbFxTCOgpL/DHz9NQWyYpf2JNc6LiQQJcwoK3suefaSQo/M19Wl2HurCOzUPEhLNgm9BPWysN9OMiF740+AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744646339; c=relaxed/simple;
	bh=ivd0+p84N8NAANoYcIt4fG5+kUnvyy7w9SUAiMC8N0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VgFgnxAw3CKsEa54V8B/a4CmWJTy7qVosIge/TXj8D3L508lGhLHXz+aocB36e0I1iK8N3RfwvtveDsHnWHT575Rd6GylWoSAShuMrSgDmI432XOiNJ6Q/Uh+4wK5v++RD/i4fJ6uzdIgIA/Z9TCLJafGNfqmLMU1sRx+0UsTrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+VsmH+U; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d5e68418b5so35875105ab.2;
        Mon, 14 Apr 2025 08:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744646336; x=1745251136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6P8ayfjreTaAdbrwfIK/U4coYDih17t3SKgQH6xJW0=;
        b=a+VsmH+UdLMC4sT/W3rZbS8NQTRCmtmRj1+rvC2L4EG3XPbLO5QTB5cFB1meReh/6i
         Ec0UI935AWmGr1GJX7zESqywRUCQUkmuxN5WTiCgnn5J7jAwrbG7V/QosmuaJfJAM+5T
         KnXPYoLPEWCLisiWIYXID8LCakyyTbluBKPbGPQ/PUZWWTJs+bt+w/176VPkEjS04y3C
         sLF7xR1+yF+2MOU1XUV/g7+aXxVVmtIR0pUaw0zCpLPZDeGPuj9Q0cd0T5d/H00/6Su4
         KJ8OCG0V4Ru1FCwh0CEuu0TFE65iX77fzFboMp+Le0UPGOHPeysRRAcxB/abrYVOoAt9
         tePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744646336; x=1745251136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6P8ayfjreTaAdbrwfIK/U4coYDih17t3SKgQH6xJW0=;
        b=Yn1zIF4ZgiOl4aqXjxDHGeVSBf/wOeq8cLeFxnAa63TZ1rzrMPe6dJeYaO3Dl62bo+
         antTdvwNRZ1FiGZzkKc5LtDqkwXbeFk24n7c8fUqPM/otyzAeNgEJ9RquMgyCuhFX+9/
         VZH81PdZvBzBzbSEaN/6HAF+41CHYh0SKHgHMCqGJJTyHlbK2bz3FIqtHql63EQBg1qb
         v4YwFlU3awi/NkX9WLlXGYCTaMT7ZgzOplCzDfb17Zch1EysRTTNlZvmYPDvgIJ5v1mZ
         2yIS787lTJzyAw7oayW02paYRwfzuEhzSZLLFtoTnWZXu/Vi+x0z4/h1Lt9aQN/WdLAM
         2sNg==
X-Forwarded-Encrypted: i=1; AJvYcCUqq8ENnt/vo0PhM1Jj781AKEUKUqd2TEhGNM1orRJ3jTTgk8ldIpib5AC6gedNzGgFL6EQTsaMimi81VC7@vger.kernel.org, AJvYcCXkdDaTFgdrGtaKALv2IiZL1bShpOuKLRPxDfVngPOxyBqFBPXK98dxu9hOQ5fp+EQFP+MOV2L6BNu8fWTo@vger.kernel.org
X-Gm-Message-State: AOJu0YwmAVDnu1buFhwdevyAmzNzyTU6chEbQrs102hfgX4mPjWfWAQ7
	uqX8R527kM8m4MQ6oGxhHCItGdp2VhmMgd8iGaWG7kyJVIS1sgDYsouayxi66nQTQ6JrdE4dYrU
	z4Mabohkcxl0Uk3u8dc+JamGAyy0=
X-Gm-Gg: ASbGncsVOqtabBYAcYg7nZLyxTlbeBii79Dv/MdN8miBPA1GndADT9Nx9LLoBR+LwV2
	fizsBgGRiUIklcYcrnAXzsjrVBQnDkLLJicj6HXIF8ZxWsOYhODdkkr8O7HpYXFiTmy78wM9WYY
	CAQjA+z5C0FuWKI8QxQr/LtLPRhnOcN5a/pHu/TxagFx/4B8+t0BhF
X-Google-Smtp-Source: AGHT+IGTJOrEPEiVQW2cxlaQzIiNbiSJmAaMsZZjfT3INWUuQzyEmCLMu7tBGSiCluIYiS0KpLJkhLx4jPL1HbwRKKM=
X-Received: by 2002:a05:6e02:1f86:b0:3d3:f6ee:cc4c with SMTP id
 e9e14a558f8ab-3d7ec0e1287mr131512955ab.0.1744646336149; Mon, 14 Apr 2025
 08:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com> <20250413-msm-gpu-split-v1-1-1132f4b616c7@oss.qualcomm.com>
In-Reply-To: <20250413-msm-gpu-split-v1-1-1132f4b616c7@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 14 Apr 2025 08:58:44 -0700
X-Gm-Features: ATxdqUE_40sjegeHYa17G5HPUwszlpBReEliqxXQxbBNutISCiHgfrvT9EcVIts
Message-ID: <CAF6AEGtG2K79zAd9tyNAG7JSVhS2sPdC-VjqubpmhD9AvoVoAA@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm: move wq handling to KMS code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 13, 2025 at 9:33=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The global workqueue is only used for vblanks inside KMS code. Move
> allocation / flushing / deallcation of it to msm_kms.c

Maybe we should also just move the wq into struct msm_kms?

BR,
-R

>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 21 ++-------------------
>  drivers/gpu/drm/msm/msm_kms.c | 16 +++++++++++++++-
>  2 files changed, 17 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.=
c
> index c3588dc9e53764a27efda1901b094724cec8928a..02beb40eb9146941aa43862d0=
7a6d82ae21c965e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -82,13 +82,6 @@ static int msm_drm_uninit(struct device *dev)
>                         drm_atomic_helper_shutdown(ddev);
>         }
>
> -       /* We must cancel and cleanup any pending vblank enable/disable
> -        * work before msm_irq_uninstall() to avoid work re-enabling an
> -        * irq after uninstall has disabled it.
> -        */
> -
> -       flush_workqueue(priv->wq);
> -
>         msm_gem_shrinker_cleanup(ddev);
>
>         msm_perf_debugfs_cleanup(priv);
> @@ -104,8 +97,6 @@ static int msm_drm_uninit(struct device *dev)
>         ddev->dev_private =3D NULL;
>         drm_dev_put(ddev);
>
> -       destroy_workqueue(priv->wq);
> -
>         return 0;
>  }
>
> @@ -227,12 +218,6 @@ static int msm_drm_init(struct device *dev, const st=
ruct drm_driver *drv)
>         ddev->dev_private =3D priv;
>         priv->dev =3D ddev;
>
> -       priv->wq =3D alloc_ordered_workqueue("msm", 0);
> -       if (!priv->wq) {
> -               ret =3D -ENOMEM;
> -               goto err_put_dev;
> -       }
> -
>         INIT_LIST_HEAD(&priv->objects);
>         mutex_init(&priv->obj_lock);
>
> @@ -253,12 +238,12 @@ static int msm_drm_init(struct device *dev, const s=
truct drm_driver *drv)
>         if (priv->kms_init) {
>                 ret =3D drmm_mode_config_init(ddev);
>                 if (ret)
> -                       goto err_destroy_wq;
> +                       goto err_put_dev;
>         }
>
>         ret =3D msm_init_vram(ddev);
>         if (ret)
> -               goto err_destroy_wq;
> +               goto err_put_dev;
>
>         dma_set_max_seg_size(dev, UINT_MAX);
>
> @@ -304,8 +289,6 @@ static int msm_drm_init(struct device *dev, const str=
uct drm_driver *drv)
>
>  err_deinit_vram:
>         msm_deinit_vram(ddev);
> -err_destroy_wq:
> -       destroy_workqueue(priv->wq);
>  err_put_dev:
>         drm_dev_put(ddev);
>
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.=
c
> index 35d5397e73b4c5cb90b1770e8570277e782be7ec..821f0b9f968fc3d448e612bfa=
e04639ceb770353 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -227,6 +227,13 @@ void msm_drm_kms_uninit(struct device *dev)
>
>         BUG_ON(!kms);
>
> +       /* We must cancel and cleanup any pending vblank enable/disable
> +        * work before msm_irq_uninstall() to avoid work re-enabling an
> +        * irq after uninstall has disabled it.
> +        */
> +
> +       flush_workqueue(priv->wq);
> +
>         /* clean up event worker threads */
>         for (i =3D 0; i < priv->num_crtcs; i++) {
>                 if (priv->event_thread[i].worker)
> @@ -243,6 +250,8 @@ void msm_drm_kms_uninit(struct device *dev)
>
>         if (kms && kms->funcs)
>                 kms->funcs->destroy(kms);
> +
> +       destroy_workqueue(priv->wq);
>  }
>
>  int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
> @@ -258,10 +267,14 @@ int msm_drm_kms_init(struct device *dev, const stru=
ct drm_driver *drv)
>         if (ret)
>                 return ret;
>
> +       priv->wq =3D alloc_ordered_workqueue("msm", 0);
> +       if (!priv->wq)
> +               return -ENOMEM;
> +
>         ret =3D priv->kms_init(ddev);
>         if (ret) {
>                 DRM_DEV_ERROR(dev, "failed to load kms\n");
> -               return ret;
> +               goto err_msm_uninit;
>         }
>
>         /* Enable normalization of plane zpos */
> @@ -319,6 +332,7 @@ int msm_drm_kms_init(struct device *dev, const struct=
 drm_driver *drv)
>         return 0;
>
>  err_msm_uninit:
> +       destroy_workqueue(priv->wq);
>         return ret;
>  }
>
>
> --
> 2.39.5
>

