Return-Path: <linux-arm-msm+bounces-53671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E69A82B15
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 17:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 855DC19E49C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 15:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3B7267B65;
	Wed,  9 Apr 2025 15:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xt8aGD8H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8579E25D556;
	Wed,  9 Apr 2025 15:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213465; cv=none; b=XR6+2VQ9TtEhiGybRaFh8PjvdGNEgvgd2hq95Mbq6okhj+Ogo6oaIe2Lm7piP70n101YO9ypDSj+RTRUJEXu16zNvaeVvVhvWBjWcZCnLaDeK7vLcQzxIHZLqu13EUkxszLoWJwAjWMcY9BMrKTJt55TuRFAX0IivqE41he2Xwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213465; c=relaxed/simple;
	bh=D04YxEOHigVIOe7nGGXiC5qB0SuQhddrL8+XeL9TRHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9WA4IAM4NWM48dgPKnSCzkUavFgj4hcDMpDv/fteLSmBx4cJ4/UnW65ZfxpDVq7grZKbCn9IsmqadFWugoy3CJ30vQneWt4Lj+vc4ixSwoTIKX0s9jUcC+34+AruTtCx8ygL6jMh5Q5gG7SVAKLzEI81zwYm6pcly1mwtQJpa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xt8aGD8H; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-739ab4447c7so839283b3a.0;
        Wed, 09 Apr 2025 08:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213463; x=1744818263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzRTGH1ny0vv7Ey4MKuvYlccmkZb3G5nEDPJcfHDxZg=;
        b=Xt8aGD8HD1y5OoZkwRymrCybLLDzrEMuc4PPhH97/rVm8sJkzzz2+PhvIb5h2j9GpT
         kpfTAwUV0CYZDVdY9RKE3CUVq3amUUT7SIwEjp7EOMAn7L2TUw7jWqLTSnWgL1Xysv4b
         qLjlJhnMEttHm35AXTQLGS4Y7zB1ioNNZYddFR4s/gaHG3ZjaRslZPAS/NvGXSQjTE+Y
         I9lr5jiEtz3xXJXWpzy4GCPRof1Edwi1/rAAaW23mm7df2HGv6+7X+9RIMwzcert4oOF
         CoJr+upyxvKGTH1yjyCvmJZB285y7Ey1/SGkdzQeNanWBBl6FZbdpZx00ajm3shTlcIw
         oRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213463; x=1744818263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzRTGH1ny0vv7Ey4MKuvYlccmkZb3G5nEDPJcfHDxZg=;
        b=VUooChqZ1nilBxnNOCrN1jhH2RKpmDyI88yQgG/gn8ckT06np3WDqEAsoc959XseXq
         vvYSBl9Oz3WgHnouoQL0NXjSBrmqbuSSwMKM6P/T5J/6x0oAxdVkXseEUyPeivbrW+ZK
         iQrH3RaXdBLmZLWTe9lvkHXgo+IEtUlMR6f7B7xpnaZfbvU5t1KOzmnxPHGI9SYVkJpP
         Uj1SDLhq49y8xl7MyGRW1PNodykP7cMrcixh2WrPftTzL20PDRjM/PIZhBJ15unMqJ3b
         Dt8OgJjxVl9UriLtuCRfyRVJo2BDrqVkoJQhRTrCKbnaG8MhQyLmPlf2VVqXdqc8P2vF
         c3sg==
X-Forwarded-Encrypted: i=1; AJvYcCUwq44oleMUOo5aBmQpYRUPPLnw96c4P4E8++4QEMLzM1Rp8njmRxIF+B17vWX97CK63Fbd8Y5Sqq2MpeIu@vger.kernel.org, AJvYcCVvoU7UiENEs3XI1i0W/2CRDp4kwetkO7FzPOuIF0xugw+SgeXIKuZ23XRHmoxR3+yh5ksR6rbuZvkP70+H@vger.kernel.org, AJvYcCXuDa5HJK7RK2R7ov4mUbeB2C043Uy9ImqkpGZfSUKXmlhzCSYOqNIP/GT1Ym7ieznjAjPZerLT4GPJmchtxaSW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7s/aTX3roqSC+rHuiAIoalsvm7FCgK/LhjR5nBdR1Fm2gUphV
	rDhTLhrade6fvHa7aAaBQhs2qLOZ0eNh7JXkFQfsHOeh7lmUmjJPy11J7npCpbwBDfI1KD5eK+t
	k0Za1DvHRDxH/pXiPfnRnqukWgRU=
X-Gm-Gg: ASbGncv7Bg1BPf50PWbEtWRhfNbLVyn52YWY2VrxKijykIM1JAT0g7ds5b5qz/Ho2bj
	IrsmCYRL9Ls8AbV0/zzAF6hkVShp7nwC1NkkBvucLpGGxcQVu+LoK18v4aS1eAecoSiRJbOAjHP
	yzWybt6R0YoKnoW7r7zv/DlQ==
X-Google-Smtp-Source: AGHT+IF5oThqq2ezhfnJ6WCfpy2FnPDcHZNg2MdPGxfC5acUPxiGFCloLJ76HFGANCkrc6gQf5RcO2ZdqDZ2EJeWKG4=
X-Received: by 2002:a05:6a00:2410:b0:730:87b2:e848 with SMTP id
 d2e1a72fcca58-73bae54d12amr1658559b3a.5.1744213462627; Wed, 09 Apr 2025
 08:44:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <20250409-topic-smem_dramc-v1-3-94d505cd5593@oss.qualcomm.com>
 <CACu1E7GMf0Mx2ZX_t76h+b1CPin49LGix7c5uvoWaJZC3dKyOw@mail.gmail.com>
 <c2dac38b-bbe5-4cd1-9d33-b4bba629d54b@oss.qualcomm.com> <CACu1E7F71M0Z5KUdArRYbLEMXoS3jQEtp=0-4LEYFRysOsYZfA@mail.gmail.com>
 <9a12e042-487b-4937-a583-709f0c37ab12@oss.qualcomm.com>
In-Reply-To: <9a12e042-487b-4937-a583-709f0c37ab12@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 9 Apr 2025 11:44:11 -0400
X-Gm-Features: ATxdqUESO1yUGm43W-4aJ0p1YKGgK-hvQNegRseX9b5IIsphXiy86aIo60d1HwI
Message-ID: <CACu1E7Hto_Ms3RxQjXXYB+RB+FC5n1VFtohKbe4EzKWgEk9uiQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 11:40=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/9/25 5:30 PM, Connor Abbott wrote:
> > On Wed, Apr 9, 2025 at 11:22=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/9/25 5:12 PM, Connor Abbott wrote:
> >>> On Wed, Apr 9, 2025 at 10:48=E2=80=AFAM Konrad Dybcio <konradybcio@ke=
rnel.org> wrote:
> >>>>
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> The Highest Bank address Bit value can change based on memory type u=
sed.
> >>>>
> >>>> Attempt to retrieve it dynamically, and fall back to a reasonable
> >>>> default (the one used prior to this change) on error.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 22 ++++++++++++++++------
> >>>>  1 file changed, 16 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm=
/msm/adreno/a6xx_gpu.c
> >>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..0cc397378c99db353152=
09d0265ad9223e8b55c7 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> @@ -13,6 +13,7 @@
> >>>>  #include <linux/firmware/qcom/qcom_scm.h>
> >>>>  #include <linux/pm_domain.h>
> >>>>  #include <linux/soc/qcom/llcc-qcom.h>
> >>>> +#include <linux/soc/qcom/smem.h>
> >>>>
> >>>>  #define GPU_PAS_ID 13
> >>>>
> >>>> @@ -669,17 +670,22 @@ static void a6xx_calc_ubwc_config(struct adren=
o_gpu *gpu)
> >>>>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
> >>>>  {
> >>>>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >>>> +       u32 hbb =3D qcom_smem_dram_get_hbb();
> >>>> +       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> >>>> +       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_=
swizzle & 2);
> >>>> +       u32 hbb_hi, hbb_lo;
> >>>> +
> >>>>         /*
> >>>>          * We subtract 13 from the highest bank bit (13 is the minim=
um value
> >>>>          * allowed by hw) and write the lowest two bits of the remai=
ning value
> >>>>          * as hbb_lo and the one above it as hbb_hi to the hardware.
> >>>>          */
> >>>> -       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
> >>>> -       u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit - 13;
> >>>> -       u32 hbb_hi =3D hbb >> 2;
> >>>> -       u32 hbb_lo =3D hbb & 3;
> >>>> -       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> >>>> -       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_=
swizzle & 2);
> >>>> +       if (hbb < 0)
> >>>> +               hbb =3D adreno_gpu->ubwc_config.highest_bank_bit;
> >>>
> >>> No. The value we expose to userspace must match what we program.
> >>> You'll break VK_EXT_host_image_copy otherwise.
> >>
> >> I didn't know that was exposed to userspace.
> >>
> >> The value must be altered either way - ultimately, the hardware must
> >> receive the correct information. ubwc_config doesn't seem to be const,
> >> so I can edit it there if you like it better.
> >>
> >> Konrad
> >
> > Yes, you should be calling qcom_smem_dram_get_hbb() in
> > a6xx_calc_ubwc_config(). You can already see there's a TODO there to
> > plug it in.
>
> Does this look good instead?
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 0cc397378c99..ae8dbc250e6a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -588,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>
>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  {
> +       u8 hbb;

You can't make it u8 and then test for a negative value on error.
Other than that, looks good.

Connor

> +
>         gpu->ubwc_config.rgb565_predicator =3D 0;
>         gpu->ubwc_config.uavflagprd_inv =3D 0;
>         gpu->ubwc_config.min_acc_len =3D 0;
> @@ -636,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *=
gpu)
>             adreno_is_a690(gpu) ||
>             adreno_is_a730(gpu) ||
>             adreno_is_a740_family(gpu)) {
> -               /* TODO: get ddr type from bootloader and use 2 for LPDDR=
4 */
>                 gpu->ubwc_config.highest_bank_bit =3D 16;
>                 gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
> @@ -665,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>                 gpu->ubwc_config.highest_bank_bit =3D 14;
>                 gpu->ubwc_config.min_acc_len =3D 1;
>         }
> +
> +       /* Attempt to retrieve HBB data from SMEM, keep the above default=
s in case of error */
> +       hbb =3D qcom_smem_dram_get_hbb();
> +       if (hbb < 0)
> +               return;
> +
> +       gpu->ubwc_config.highest_bank_bit =3D hbb;
>  }
>
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>
>
> Konrad

