Return-Path: <linux-arm-msm+bounces-41166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7C69EA187
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 22:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2007A28297C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 21:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747AE19D8BE;
	Mon,  9 Dec 2024 21:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kkvb/7z1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A9A176228;
	Mon,  9 Dec 2024 21:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733781418; cv=none; b=EbdJHZ6T8u7ms4mLqYnOzO/iyojhRgIzmjwq7Ef+HtndEfj261dnGv3phhy42G06XxtPZ5+jPIhldfTahNgaO+LKLkhcVhiVPp6ykcF9XHT+HLLg2TZgbmWSFlpUXKR6W+X0wl6YAF8CaaeDQgQRQaNdQopKxOb7jjR7a056kCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733781418; c=relaxed/simple;
	bh=Ga3Sm0Aqt4BYmPijR5A9JqKcgUxk84pN28ErPlFOazU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C0VQFiQl62l/CmMEQjrnCx3lJoPw2UG3aCndOAEphD8HzLGUfzyYnSFC2ZHQCVjBFAH0n62XZATV+0PEUhjmRk5h37uMpf1TF534TSbROGm7tkuH9nJtqJkhJCXeR4sOsPWRLBCKPPEI8tMtJXmn+wt+Y3HlMDx0jxL5mLDoioI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kkvb/7z1; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a9cee9d741so12392095ab.3;
        Mon, 09 Dec 2024 13:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733781416; x=1734386216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUNHDJ6ILFxdRFiTOkLTRDjyDsyOaooQYqwkxtWBOZs=;
        b=Kkvb/7z1wrAY+E75VG6VotBvIPFG/PO6oJnvpCkvf8XKNKgBGTNqrG5T63bwN6JoFM
         gtvnXCpkeVV2PXLuC+rlAIqLmMnaQBwiV2d+yDgUULPbJenCftjTsEZpUu3hmR4UhAi/
         24kc7+dGQTyJfKWpeYwGS75dTKDTdeK0Eopczbj03LUAXoUj7wy02dJxLSRS6s7Z/Gwx
         bSTA0erArkn1+CRZMhMIR9pn/vOcKvayvqncQ77Rf27q7AZL83hoslBqYD+mbnVNS63H
         FJTnBIqs/zSWnagyN50k1pP5f+OgL3hfkvIDQFOhrQthPIFhZyXWJQAfFX+6qL1EyRZy
         djIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733781416; x=1734386216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUNHDJ6ILFxdRFiTOkLTRDjyDsyOaooQYqwkxtWBOZs=;
        b=NSbY5bwOb/GaOyMIIiVT5hkAMuwe5KImvy9xrDdqYX/jcPIWzPUNM6i6D23X1MBupp
         wgBtak8X6U+gw3uL0zuXap48F/B0S51W/F/3vjELpKTUBhyBrSsCeM3S95emB3pAZ7Yj
         f8D1EzqaTaWhYRAcwKSnfLfwa5ksvpa7B5uJXtwcOt+B9dxa0OoFYYgyNk4N8/Akujh+
         o/FK1ilQyWmEFo8gMFpolseqBRJREgNG7W4TEdhZnL6JnPUwbkxxlCNlZAQn0kqgwmLB
         eXJ6njEWWnBqC/BPoRYbMq32aUSUjJj/cOqZ7NyncRByA6Kxw1rQ3zCtvY+PTgewUUGm
         AXNw==
X-Forwarded-Encrypted: i=1; AJvYcCWpIl7M5s/nlEkefMmKLwrgClojGzC3+yynAVW6jfrFOM2R8lJcO9EwU41HAf8bNSZTrtII+rGIu32VJ4Nj@vger.kernel.org, AJvYcCXEhK8piybgl+0KhCu9GubxaMYMCCfUFb9RgaDH2RgW5rQJ8BWNV/YWcb0fTKfegfd3MnlH6ttilVkbkW3v@vger.kernel.org
X-Gm-Message-State: AOJu0YyMvLqba/cx/cMnIxanBIdsC5+yojrhJHG8PdgIuGQ3cLVZ9+JT
	KQy9hf9BoEVOnjK1orHemA2BpehQOuMD/CvI002WZWLazkfBry2a2nP9LkdcjBO82bEvI+ZLctP
	cdYI2DQ2C7PY75pp4SeHP9hIPYXA=
X-Gm-Gg: ASbGncsbebsXGsUpB6WFpk5lT1+Iaj4UZRGQsRk+0ZeqqpQqmyyrhBHaqFi9+CdBrh+
	hbiD/cRsRDWQnJ41qiPgEflD5qQrTSbCl5gth4Bxw0mVngin86ABNWSnH39JC/cQkGA==
X-Google-Smtp-Source: AGHT+IH7i9zLT2/3HS5RsXkA25gYc8CnkPrXffiXodQojiAfgigEq875VdgnrRDYd+CYD90qZDMyy0maoJBm25wbQSE=
X-Received: by 2002:a05:6e02:3707:b0:3a7:9670:7abb with SMTP id
 e9e14a558f8ab-3a811e073a4mr155617215ab.15.1733781415758; Mon, 09 Dec 2024
 13:56:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <CAF6AEGtKfWOGpd1gMfJ96BjCqwERZzBVmj5GzmjKxw8_vmSrJg@mail.gmail.com> <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
In-Reply-To: <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Dec 2024 13:56:44 -0800
Message-ID: <CAF6AEGvBU8mB5HHNK4nP5h9ouKfLNhCMFgF+PhrC77ZMfSOTkQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Pavan Kondeti <quic_pkondeti@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Elliot Berman <quic_eberman@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 12:52=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 12/10/2024 1:24 AM, Rob Clark wrote:
> > On Mon, Dec 9, 2024 at 12:20=E2=80=AFAM Akhil P Oommen <quic_akhilpo@qu=
icinc.com> wrote:
> >>
> >> When kernel is booted in EL2, SECVID registers are accessible to the
> >> KMD. So we can use that to switch GPU's secure mode to avoid dependenc=
y
> >> on Zap firmware. Also, we can't load a secure firmware without a
> >> hypervisor that supports it.
> >
> > Shouldn't we do this based on whether zap node is in dtb (and not disab=
led)?
>
> This is better, isn't it? Otherwise, multiple overlays should be
> maintained for each soc/board since EL2 can be toggled from bootloader.
> And this feature is likely going to be more widely available.

I guess the first question is what the dt should look like.  I think
it makes sense to not have a zap node when booting in EL2 (or at least
disabling it) because that describes the hw+fw situation.  And in any
case, so far it seems like we often need unrelated changes[1].  But
maybe others have differing opinions.

And depending on how much cooperation we get from the bootloader, it
could be that our hand is forced.  I figured I should at least point
out how we currently handle this.

A further point, I suppose it is in theory possible that a device
could have no secure playback support, despite booting in EL1?  So
tying this to EL2 seems a bit contrived.

BR,
-R

[1] https://github.com/TravMurav/slbounce/blob/main/dtbo/x1e-el2.dtso

> -Akhil.
>
> >
> > slbounce applies some dtb overlays to disable the zap node when
> > booting in EL2 (and make some other changes due to kernel being in
> > control of the pci smmuv3, or something along those lines).
> >
> > BR,
> > -R
> >
> >>
> >> Tested following configurations on sa8775p chipset (Adreno 663 gpu):
> >>
> >> 1. Gunyah (No KVM) - Loads zap shader based on DT
> >> 2. KVM in VHE - Skips zap shader load and programs SECVID register
> >> 3. KVM in nVHE - Loads zap shader based on DT
> >> 4. Kernel in EL2 with CONFIG_KVM=3Dn - Skips zap shader load and
> >>         programs SECVID register
> >>
> >> For (1) and (3) configuration, this patch doesn't have any impact.
> >> Driver loads secure firmware based on other existing hints.
> >>
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> ---
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 82 +++++++++++++++++++++++---=
---------
> >>  1 file changed, 54 insertions(+), 28 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gpu.c
> >> index 019610341df1..9dcaa8472430 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -14,6 +14,10 @@
> >>  #include <linux/pm_domain.h>
> >>  #include <linux/soc/qcom/llcc-qcom.h>
> >>
> >> +#ifdef CONFIG_ARM64
> >> +#include <asm/virt.h>
> >> +#endif
> >> +
> >>  #define GPU_PAS_ID 13
> >>
> >>  static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
> >> @@ -998,6 +1002,54 @@ static int a6xx_zap_shader_init(struct msm_gpu *=
gpu)
> >>         return ret;
> >>  }
> >>
> >> +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
> >> +{
> >> +       int ret;
> >> +
> >> +#ifdef CONFIG_ARM64
> >> +       /*
> >> +        * We can access SECVID_TRUST_CNTL register when kernel is boo=
ted in EL2 mode. So, use it
> >> +        * to switch the secure mode to avoid the dependency on zap sh=
ader.
> >> +        */
> >> +       if (is_kernel_in_hyp_mode())
> >> +               goto direct_switch;
> >> +#endif
> >> +
> >> +       /*
> >> +        * Try to load a zap shader into the secure world. If successf=
ul
> >> +        * we can use the CP to switch out of secure mode. If not then=
 we
> >> +        * have no resource but to try to switch ourselves out manuall=
y. If we
> >> +        * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL reg=
ister will
> >> +        * be blocked and a permissions violation will soon follow.
> >> +        */
> >> +       ret =3D a6xx_zap_shader_init(gpu);
> >> +       if (ret =3D=3D -ENODEV) {
> >> +               /*
> >> +                * This device does not use zap shader (but print a wa=
rning
> >> +                * just in case someone got their dt wrong.. hopefully=
 they
> >> +                * have a debug UART to realize the error of their way=
s...
> >> +                * if you mess this up you are about to crash horribly=
)
> >> +                */
> >> +               dev_warn_once(gpu->dev->dev,
> >> +                       "Zap shader not enabled - using SECVID_TRUST_C=
NTL instead\n");
> >> +               goto direct_switch;
> >> +       } else if (ret)
> >> +               return ret;
> >> +
> >> +       OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> >> +       OUT_RING(gpu->rb[0], 0x00000000);
> >> +
> >> +       a6xx_flush(gpu, gpu->rb[0]);
> >> +       if (!a6xx_idle(gpu, gpu->rb[0]))
> >> +               return -EINVAL;
> >> +
> >> +       return 0;
> >> +
> >> +direct_switch:
> >> +       gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> >> +       return 0;
> >> +}
> >> +
> >>  #define A6XX_INT_MASK (A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR | \
> >>                        A6XX_RBBM_INT_0_MASK_RBBM_ATB_ASYNCFIFO_OVERFLO=
W | \
> >>                        A6XX_RBBM_INT_0_MASK_CP_HW_ERROR | \
> >> @@ -1341,35 +1393,9 @@ static int hw_init(struct msm_gpu *gpu)
> >>         if (ret)
> >>                 goto out;
> >>
> >> -       /*
> >> -        * Try to load a zap shader into the secure world. If successf=
ul
> >> -        * we can use the CP to switch out of secure mode. If not then=
 we
> >> -        * have no resource but to try to switch ourselves out manuall=
y. If we
> >> -        * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL reg=
ister will
> >> -        * be blocked and a permissions violation will soon follow.
> >> -        */
> >> -       ret =3D a6xx_zap_shader_init(gpu);
> >> -       if (!ret) {
> >> -               OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> >> -               OUT_RING(gpu->rb[0], 0x00000000);
> >> -
> >> -               a6xx_flush(gpu, gpu->rb[0]);
> >> -               if (!a6xx_idle(gpu, gpu->rb[0]))
> >> -                       return -EINVAL;
> >> -       } else if (ret =3D=3D -ENODEV) {
> >> -               /*
> >> -                * This device does not use zap shader (but print a wa=
rning
> >> -                * just in case someone got their dt wrong.. hopefully=
 they
> >> -                * have a debug UART to realize the error of their way=
s...
> >> -                * if you mess this up you are about to crash horribly=
)
> >> -                */
> >> -               dev_warn_once(gpu->dev->dev,
> >> -                       "Zap shader not enabled - using SECVID_TRUST_C=
NTL instead\n");
> >> -               gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> >> -               ret =3D 0;
> >> -       } else {
> >> +       ret =3D a6xx_switch_secure_mode(gpu);
> >> +       if (!ret)
> >>                 return ret;
> >> -       }
> >>
> >>  out:
> >>         if (adreno_has_gmu_wrapper(adreno_gpu))
> >>
> >> ---
> >> base-commit: f4a867a46862c1743501bbe8c813238456ec8699
> >> change-id: 20241120-drm-msm-kvm-support-cd6e6744ced6
> >>
> >> Best regards,
> >> --
> >> Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>
>

