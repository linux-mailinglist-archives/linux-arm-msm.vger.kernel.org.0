Return-Path: <linux-arm-msm+bounces-41149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCBC9E9FE8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 20:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 113C216536B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 19:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151FD1991AA;
	Mon,  9 Dec 2024 19:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZycKOZm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF701552E4;
	Mon,  9 Dec 2024 19:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733774105; cv=none; b=XguhKiV7Zh2JZQOVE4h74b70Rpu10PvTW/YnPJUt41eiDtB95R+v8fNlB90fZ5PvpvKx2Oiq2Sqf6A9mAL+5m0WA4c55f+887QiBnDtOGg34aL6hDRrkBA+/awzZaDYbqVx1uyzNrT1V24KYMup8Bq8aQmdzcBVHuj+vITQ7Fr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733774105; c=relaxed/simple;
	bh=6G4F+MGo8PAjVyuTVX+ME3a9SvAM7DDDYuaO/dWj1zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oy2OamQF+fX750ecZ/oRwQg47j6GCc+1FtzPlhGe28uh0VqWdgGCoKEBqk41zegFXp6NELhMvfiIBoye64Ukr+OekgZP74heeB9UJ7z76lG5IrtU80nE2bMRNcDsTCQTRiNjq27Erdq90x9x6lpr9+LxGBXBCxEBssqh62SGM3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZycKOZm; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a813899384so13551425ab.1;
        Mon, 09 Dec 2024 11:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733774102; x=1734378902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFjXl1XiaruT75EaeRKmg8rjvdRqedIGSRaEJR+tE8Q=;
        b=jZycKOZmajbZrl/YHf+sYvBYOPSsGXtKbKzQcZM1m8wzyJPhkdFBDeI3VwWgZrb+9X
         8cYcubmcPfBnMvdKv+XitGybDUVkFKZFbTny+bHftB22Sx/KPcS9TF3N0/MGawhA6zyi
         AbOm+nJ4evDuR3qIGQfWBiEShLzRjRa5l/53iSN0XSqmQpODs8E/GThJkGq+/ucQshkE
         lEwl3t9zpOaT41nyS7SUH6BottwGSpsadLQ+YphBAirtqF+J557nS3B/AFk4gj8sPF5x
         qdNyCSS1gQCwS5YK5tnL+It2UnE5IOdKIAeQiuUBw4ESXi+CS/m5oyc9SRowH/AsipwQ
         NZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733774102; x=1734378902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFjXl1XiaruT75EaeRKmg8rjvdRqedIGSRaEJR+tE8Q=;
        b=g5SKw0iXY3r+BTEJ+MU8Fd72Z1mbbfxPIMFpsd7tng1mhQkWT9rYOBTNfcN6OaOp04
         Cei5jOzAGwHeqIqVMmPGovgZpm9DaEpdL75H1lkWWdKuNyLYayPmhJi+gw8UGbeYqnwZ
         +/fsojn/IIO1mWYwdq7M/PMCVCp8hxspqb4kTJIFG6aWXYqa/EpvMbbkiqbrb6yl6nH+
         eI6Mp5pfKCnze5IFQozrHp2ajyoiaH3lXP8aD0tY+1xd4GA/3FD1++6tcOTcz4rmqOL/
         Wclp4P4UiX6LgFeFHdeC9cWceKnuupkewGcxjaPF52hTLdJFPJSSS4WEuegD34qpK2CY
         88Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUVjgPl4Y+vPhSIdi7+UXcbzTdH4Ne6lGGMprft6ec8VPAs4ZeIWG6gwlc9Ty3caoW6x5pVTdPcZxzeHiU+@vger.kernel.org, AJvYcCVL7pvLV3PL1GNIa8B83gmUImLBFXtIOrv7QxDHpfIfN0BXUht90AmqZhtwxrVzyDEx8/1nykjaVIxV38LO@vger.kernel.org
X-Gm-Message-State: AOJu0YziIMSNvrax7zTxO+KPzmeGiwvqL7OCgP86PU4Fz7AsBtMD/tP8
	hZU8LPql6xAzlKW/jBKu6SvS6Lg3cCa9N/Es21TKtkpnZHXbIwYWusn0r0o+ufmKtKG+mtBC+lY
	y+TYrObG3SNLR1I5801qWnX5DiKA=
X-Gm-Gg: ASbGncv/yf40hJAFt6f6RGoaa9Zc1gy70x6iwmUb8zXIKhfCF/x5jtn8ECmg6ajdjvh
	REqXOKHitgS8qxHbNC3RV1NkaC6bu/bviPRPGPMoDPXtZG129iveAU8Im6wpEMA==
X-Google-Smtp-Source: AGHT+IF7/HFOaU7S7x2Uzem9wGp/+d/CGemDqVj17q17h9PETabVi9yFbXlT1iEBPQSdt5F4c+sIpjJZM+ndKUOMHVQ=
X-Received: by 2002:a05:6e02:12ec:b0:3a7:d84c:f2a0 with SMTP id
 e9e14a558f8ab-3a9dbabfdb8mr16291535ab.7.1733774102376; Mon, 09 Dec 2024
 11:55:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
In-Reply-To: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Dec 2024 11:54:50 -0800
Message-ID: <CAF6AEGtKfWOGpd1gMfJ96BjCqwERZzBVmj5GzmjKxw8_vmSrJg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Elliot Berman <quic_eberman@quicinc.com>, 
	Pavan Kondeti <quic_pkondeti@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 12:20=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> When kernel is booted in EL2, SECVID registers are accessible to the
> KMD. So we can use that to switch GPU's secure mode to avoid dependency
> on Zap firmware. Also, we can't load a secure firmware without a
> hypervisor that supports it.

Shouldn't we do this based on whether zap node is in dtb (and not disabled)=
?

slbounce applies some dtb overlays to disable the zap node when
booting in EL2 (and make some other changes due to kernel being in
control of the pci smmuv3, or something along those lines).

BR,
-R

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

