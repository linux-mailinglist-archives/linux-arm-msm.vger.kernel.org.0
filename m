Return-Path: <linux-arm-msm+bounces-41366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1839EBEA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 23:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4E1C162A09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 22:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CC81F191E;
	Tue, 10 Dec 2024 22:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnDfHuVo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234E21EE7BC;
	Tue, 10 Dec 2024 22:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733871160; cv=none; b=ZSlmEBAPrN5ftYnKYzsDqs2zwcmNv6yH70e7Q7wD1Y3JElFlIn+kQpFcGh/fYvH2FzLoeKnKjrGP7E7fbyLMeHxeLa7saUeHcpZer7twsKoatmBUhyH+xrwd80y/MlLERK8N2l19Z0/iZM5LRj7FCkfssJxuFvtx4xPGL36wK9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733871160; c=relaxed/simple;
	bh=phDlDhtTcIZghBDBIXFUh3tD26YMeP7V4GNqsFRiR8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/qE1xvlScmOxvwwOzT+RWGwU4IdUAv4u20pIaDUaosaiqsUnkeYwhMTwe1OBiaQ5qnEDByzMs3/i1vFAjncb7fFDq4lkXIoDU5q3sj75iVJp32aavaWOrCAK8ess3IQqa9MCu/1uEg1Tb7omxu8tCOjT1dzk5Xm8LA4Nbqcwnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnDfHuVo; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ef79243680so795104a91.2;
        Tue, 10 Dec 2024 14:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733871158; x=1734475958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9y1I2I1Lv//kUkxugZdreKtdIGZcLmNy7KGul5oUZkU=;
        b=jnDfHuVo8vVabttf36uJFnckYtMlKRCM2C9+Acs5Et3ZWrfvl8zViYXGM7S4CGeccy
         TeP+qQOWA+5HDkn5w9RgsYZCd6Gr6LR+yTAwVCC7OK9i7ROKAXjcQPjPkgYtk9tWIg5O
         7rDz0r4zpBnsXks28TKzbVw6NfOX3vL9/bxvW0H97Jlr7YzC9d9fwnEY+7H7SDPLKRev
         3cBGC+gPLg7cWv17/EjFwetQFEGGIv4OyOKuCR1bj9FKUjasj8//OL5o2IwW9qrATveh
         T+j7MgvSE/LAlnt5ZGcGbd8NzEIlscdTm82k7CRPWQ8yye3zk8qcoetBv9S3ERc2oRHV
         0bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733871158; x=1734475958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9y1I2I1Lv//kUkxugZdreKtdIGZcLmNy7KGul5oUZkU=;
        b=iitTrUl12eniKBnff2xXNGHY0Obzg5wWgHnq7LZ2rkpRYNBfQ+5aRPR538HNeW4lEk
         OJDVktVawUqA8LtKz54wiQ89zywa2Fw1Zo7T3gq57fIfxEUWUXfJDhZ9feMOD04wxnd5
         Cmb4dA18JWuT3nwoOdvsd+szR17BnRWG7GFxBLxDHg1g44ArsiisME9YNkGp+XDYdOE/
         c7y0/I9GYbf1FefYc2KbYCz6o7oX6McBMEIjxdiudF6ceflkS3QLbPemXCPhdURowjiN
         RHGzWNUogYyzrIRIhaarVS0/LOiaAmcY5QXWeO5cuaBocLW3ltT2/RlE+qADbZTDrvVV
         7G5w==
X-Forwarded-Encrypted: i=1; AJvYcCWbNumW0aqDVoMqXUFZmESQ2pst4YIX6w419WaYHyFzENOCWUKNn7CnYrMe4xQ9XJ0jhcGN01x7e4HsKUBT@vger.kernel.org, AJvYcCWs3GSjeGE1NhFDEMmvdpoDzyXDXc6IWXx6sPeOIeWG7dpHdeJcmnuDpLfSfs+9Fb/3p+YvxiSqotLkLS4F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5U2xbVT4IGzBQozkNHt4NmbMiZZYq/OlbOYG9RjOE3/h11y6r
	iYcGK4SB4hhcZ5k9M/nfRoc1tHwyoct//7+LAvbGT5HjIdmvJBeOC0t2yxq5PBCKrAw2o1p/MTZ
	GJF816Gu/DBW2QBzNKiRi/31+mmg=
X-Gm-Gg: ASbGncsFH+pJfrCU7KP2gcAEPK5w7z3ZLzXB95Ca2T1ODEngBsyC5WshRSfLonZdXzM
	mV9dSNUcOlWNM1dKxL/i/o1IxT136817Nu14=
X-Google-Smtp-Source: AGHT+IHEJTNOho7BUDDopkeda9yA5Z701i8CutzK0zfqoByGzrIBsEAW6Mu56ec7j9m/mz9A92VEqVBhwSBZplche6I=
X-Received: by 2002:a17:90b:1a92:b0:2ee:35a1:c291 with SMTP id
 98e67ed59e1d1-2f127fbeba0mr408351a91.3.1733871158318; Tue, 10 Dec 2024
 14:52:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
In-Reply-To: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 10 Dec 2024 17:52:27 -0500
Message-ID: <CACu1E7H0-zzEPv8ytmx_9XRe1t-RCc7enshgwk2r9-0gWK44hw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Elliot Berman <quic_eberman@quicinc.com>, 
	Pavan Kondeti <quic_pkondeti@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 3:20=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicinc=
.com> wrote:
>
> When kernel is booted in EL2, SECVID registers are accessible to the
> KMD. So we can use that to switch GPU's secure mode to avoid dependency
> on Zap firmware. Also, we can't load a secure firmware without a
> hypervisor that supports it.
>
> Tested following configurations on sa8775p chipset (Adreno 663 gpu):
>
> 1. Gunyah (No KVM) - Loads zap shader based on DT
> 2. KVM in VHE - Skips zap shader load and programs SECVID register
> 3. KVM in nVHE - Loads zap shader based on DT
> 4. Kernel in EL2 with CONFIG_KVM=3Dn - Skips zap shader load and
>         programs SECVID register
>
> For (1) and (3) configuration, this patch doesn't have any impact.
> Driver loads secure firmware based on other existing hints.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

For initializing CX_MISC_SW_FUSE_VALUE in a7xx_cx_mem_init(), we used
!qcom_scm_is_available() to assume that the register is writable
instead - can you just do that?

Connor

> ---
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 82 +++++++++++++++++++++++------=
------
>  1 file changed, 54 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 019610341df1..9dcaa8472430 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -14,6 +14,10 @@
>  #include <linux/pm_domain.h>
>  #include <linux/soc/qcom/llcc-qcom.h>
>
> +#ifdef CONFIG_ARM64
> +#include <asm/virt.h>
> +#endif
> +
>  #define GPU_PAS_ID 13
>
>  static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
> @@ -998,6 +1002,54 @@ static int a6xx_zap_shader_init(struct msm_gpu *gpu=
)
>         return ret;
>  }
>
> +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
> +{
> +       int ret;
> +
> +#ifdef CONFIG_ARM64
> +       /*
> +        * We can access SECVID_TRUST_CNTL register when kernel is booted=
 in EL2 mode. So, use it
> +        * to switch the secure mode to avoid the dependency on zap shade=
r.
> +        */
> +       if (is_kernel_in_hyp_mode())
> +               goto direct_switch;
> +#endif
> +
> +       /*
> +        * Try to load a zap shader into the secure world. If successful
> +        * we can use the CP to switch out of secure mode. If not then we
> +        * have no resource but to try to switch ourselves out manually. =
If we
> +        * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL regist=
er will
> +        * be blocked and a permissions violation will soon follow.
> +        */
> +       ret =3D a6xx_zap_shader_init(gpu);
> +       if (ret =3D=3D -ENODEV) {
> +               /*
> +                * This device does not use zap shader (but print a warni=
ng
> +                * just in case someone got their dt wrong.. hopefully th=
ey
> +                * have a debug UART to realize the error of their ways..=
.
> +                * if you mess this up you are about to crash horribly)
> +                */
> +               dev_warn_once(gpu->dev->dev,
> +                       "Zap shader not enabled - using SECVID_TRUST_CNTL=
 instead\n");
> +               goto direct_switch;
> +       } else if (ret)
> +               return ret;
> +
> +       OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> +       OUT_RING(gpu->rb[0], 0x00000000);
> +
> +       a6xx_flush(gpu, gpu->rb[0]);
> +       if (!a6xx_idle(gpu, gpu->rb[0]))
> +               return -EINVAL;
> +
> +       return 0;
> +
> +direct_switch:
> +       gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> +       return 0;
> +}
> +
>  #define A6XX_INT_MASK (A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR | \
>                        A6XX_RBBM_INT_0_MASK_RBBM_ATB_ASYNCFIFO_OVERFLOW |=
 \
>                        A6XX_RBBM_INT_0_MASK_CP_HW_ERROR | \
> @@ -1341,35 +1393,9 @@ static int hw_init(struct msm_gpu *gpu)
>         if (ret)
>                 goto out;
>
> -       /*
> -        * Try to load a zap shader into the secure world. If successful
> -        * we can use the CP to switch out of secure mode. If not then we
> -        * have no resource but to try to switch ourselves out manually. =
If we
> -        * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL regist=
er will
> -        * be blocked and a permissions violation will soon follow.
> -        */
> -       ret =3D a6xx_zap_shader_init(gpu);
> -       if (!ret) {
> -               OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> -               OUT_RING(gpu->rb[0], 0x00000000);
> -
> -               a6xx_flush(gpu, gpu->rb[0]);
> -               if (!a6xx_idle(gpu, gpu->rb[0]))
> -                       return -EINVAL;
> -       } else if (ret =3D=3D -ENODEV) {
> -               /*
> -                * This device does not use zap shader (but print a warni=
ng
> -                * just in case someone got their dt wrong.. hopefully th=
ey
> -                * have a debug UART to realize the error of their ways..=
.
> -                * if you mess this up you are about to crash horribly)
> -                */
> -               dev_warn_once(gpu->dev->dev,
> -                       "Zap shader not enabled - using SECVID_TRUST_CNTL=
 instead\n");
> -               gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> -               ret =3D 0;
> -       } else {
> +       ret =3D a6xx_switch_secure_mode(gpu);
> +       if (!ret)
>                 return ret;
> -       }
>
>  out:
>         if (adreno_has_gmu_wrapper(adreno_gpu))
>
> ---
> base-commit: f4a867a46862c1743501bbe8c813238456ec8699
> change-id: 20241120-drm-msm-kvm-support-cd6e6744ced6
>
> Best regards,
> --
> Akhil P Oommen <quic_akhilpo@quicinc.com>
>

