Return-Path: <linux-arm-msm+bounces-54693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 529C0A92F11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 03:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B4867B448B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 01:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615A22B2DA;
	Fri, 18 Apr 2025 01:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UoeJN1FQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF452A1C9;
	Fri, 18 Apr 2025 01:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744938651; cv=none; b=M/bY2pU8g43aFKfs5M91ULeKfIOecChuW2VOegrzTCRkF+0CBt6Vq4bsSGzTB6piRxI3exKNf/fdoTfXt1lY9ZygiQ69rMYU9CiG8i6BTcJQULTj2DHHo+ooBXaYJ803WM1SYFIpZIjfKqGEfJubnuK27m4CM1I7Fc2y/3+Yud0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744938651; c=relaxed/simple;
	bh=9SoST78xSCqZeDlCgJbHa+csYN6vvNIm2HWoXvj0CvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nHPl31/aWyZtorEDnXnLA851TxO/RPDYVKddfbdNHFmqIshGELkuObAQSuGgRZlt2JhDLAjNRcISFhZNPrNPJzSfatB/AmHmbFQ4UXVnqJYSKdj5kDAPXQRAdy5Zb6/GyAJ1dXtXWfdiuHxWsb63psFp8WkL0WNXVttvoDqasOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UoeJN1FQ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b0459668101so217125a12.2;
        Thu, 17 Apr 2025 18:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744938649; x=1745543449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kat+yfTKYwZ6k+JAfYuf2ANUkCsrf1mfMFdkVb9Kwho=;
        b=UoeJN1FQIOccYtV4WeiTZiofkwB+ak6J01JOWZ2eYDCo23W/LgrGUi8wrntpeoKq3E
         8tfZMQXgYQZqq6y+EshzOf86/ia2e7hVImS16HWmkF3lXPh8+KXuIEHAX5tjHAViKPY0
         JQ8b5Z7ThRqEL7E+1mKpoJkDuj1L1QjdUuvgfYj++vuDf0MJx+EVAFl8lU3o7cTmqSNe
         nXbRdrOlANSNCoqUndjiYxFJjyrZm7bz0lWENzb84jWIarldxV67itVQD0nZPwcgk4a6
         WK1KIURAYbB8T1oKkT6dV296JfqJuIajgkOYGpUQ0VCriHsH20r6VaACILtoUIko+bU7
         Mzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744938649; x=1745543449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kat+yfTKYwZ6k+JAfYuf2ANUkCsrf1mfMFdkVb9Kwho=;
        b=pI8eAEthFC6UH8O+185rZMf7dDMjXqplzsRLn505U5WEFP10X8G6FkFy8SeY77ITa6
         ju70gQi9q3FktrnaIXLbF6hZL1wnwVzSAUYxERPTR7ED8kypXFVhhypHKPpcphDhq+kZ
         vIUFsAS3q05FpuIuDx1uB43et/B3VvV1s1q3augTV2jPExV2VkIC0ZS6ea/L75ZdTlLg
         J1kuKC9zJQ2zT0/VLUFS9QkmWZ8SwXoy4e1jkHH+7GpJYU4w0HJ/3MBq7YF4k7SDisOq
         HnjswFNvO4R9d+92Ud7Frs5n4GgTqpvmHl4g7yvpQCptUsgaBU3wDYMpgW6FRZl45Ns3
         qD5w==
X-Forwarded-Encrypted: i=1; AJvYcCU+fYRg/PtUa/s6y3PCzlcTd30Cz6Z2ZVMJw/364oUraIYObDhuUMFemelmg5TQokjokP9NOJu7CU2HAwYj@vger.kernel.org, AJvYcCULb3KQsaU3soOc64iSPIuJB8fsRlBbEB5ZA3nhiiMendbOGqZSTM2GBcCjmzhdwFsTY39uS4Xf64+G0na4@vger.kernel.org, AJvYcCWO58Axs9DBbWwa4yPFofPUzz/zTzmnWLD6DxB4ZHnopIz20UPoAnEBSF/Hwy+XV1qlnI4+w5TXdjfduiLtexDg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+tZPofvqXcl6mC3pQUhQn6jf8mc1BH7Q+2zGh/bgSDOLbCtgh
	4z+u0/PlyvhJCFxIGfUOPgcQfjyTUEl8R7Ls45T2PqhLcaFt/Qo2I7yk8v7HvcoGh0MNJnrUjVd
	Prx98pHdJwbOzZEh1KpgglRLUmAI=
X-Gm-Gg: ASbGnctw8/gDUAFu9qu7ime7A1KkMwnkBR2MH9ZDsGZqhlmG5hP0atn6b+mkk6dsaXt
	yAxAmYKoFmdfUvJ5Oj12JiNAhlu0jMoXj0n+2EdkeT47YrUWT2SgCwH7Y0++7WO8ZlQHNZ/62Xe
	3gYv0oqBgbNbA8mXJaM7FIiA==
X-Google-Smtp-Source: AGHT+IGVHe0CCUPFVQsJ0aWOZEwqj7UP7h6CJNGT/eTYTOOCB4kGqLoEA94LehtUfpsVsP2AsVFwTQjFQjgmIYvl7i0=
X-Received: by 2002:aa7:8895:0:b0:737:6589:81e5 with SMTP id
 d2e1a72fcca58-73dc1448873mr446887b3a.2.1744938648737; Thu, 17 Apr 2025
 18:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com> <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
In-Reply-To: <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 17 Apr 2025 21:10:37 -0400
X-Gm-Features: ATxdqUGYdy5x4IIY0W9fkNUkfoD5MMd7bZ37IvqDV_dB3fjGQ5gkqQcuScdMKCc
Message-ID: <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-hardening@vger.kernel.org, 
	dri-devel <dri-devel@lists.freedesktop.org>, freedreno@lists.freedesktop.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025, 1:50=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicinc.=
com> wrote:
>
> On 4/17/2025 9:02 PM, Connor Abbott wrote:
> > On Thu, Apr 17, 2025 at 3:45=E2=80=AFAM Akhil P Oommen <quic_akhilpo@qu=
icinc.com> wrote:
> >>
> >> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
> >>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>
> >>> The Highest Bank address Bit value can change based on memory type us=
ed.
> >>>
> >>> Attempt to retrieve it dynamically, and fall back to a reasonable
> >>> default (the one used prior to this change) on error.
> >>>
> >>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>> ---
> >>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
> >>>  1 file changed, 14 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.c
> >>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae=
5f8f5e57f38ecc62d9f 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> @@ -13,6 +13,7 @@
> >>>  #include <linux/firmware/qcom/qcom_scm.h>
> >>>  #include <linux/pm_domain.h>
> >>>  #include <linux/soc/qcom/llcc-qcom.h>
> >>> +#include <linux/soc/qcom/smem.h>
> >>>
> >>>  #define GPU_PAS_ID 13
> >>>
> >>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *g=
pu)
> >>>
> >>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>>  {
> >>> +     int hbb;
> >>> +
> >>>       gpu->ubwc_config.rgb565_predicator =3D 0;
> >>>       gpu->ubwc_config.uavflagprd_inv =3D 0;
> >>>       gpu->ubwc_config.min_acc_len =3D 0;
> >>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_g=
pu *gpu)
> >>>           adreno_is_a690(gpu) ||
> >>>           adreno_is_a730(gpu) ||
> >>>           adreno_is_a740_family(gpu)) {
> >>> -             /* TODO: get ddr type from bootloader and use 2 for LPD=
DR4 */
> >>>               gpu->ubwc_config.highest_bank_bit =3D 16;
> >>>               gpu->ubwc_config.amsbc =3D 1;
> >>>               gpu->ubwc_config.rgb565_predicator =3D 1;
> >>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_=
gpu *gpu)
> >>>               gpu->ubwc_config.highest_bank_bit =3D 14;
> >>>               gpu->ubwc_config.min_acc_len =3D 1;
> >>>       }
> >>> +
> >>> +     /* Attempt to retrieve the data from SMEM, keep the above defau=
lts in case of error */
> >>> +     hbb =3D qcom_smem_dram_get_hbb();
> >>> +     if (hbb < 0)
> >>> +             return;
> >>> +
> >>> +     gpu->ubwc_config.highest_bank_bit =3D hbb;
> >>
> >> I am worried about blindly relying on SMEM data directly for HBB for
> >> legacy chipsets. There is no guarantee it is accurate on every chipset
> >> and every version of firmware. Also, until recently, this value was
> >> hardcoded in Mesa which matched the value in KMD.
> >
> > To be clear about this, from the moment we introduced host image
> > copies in Mesa we added support for querying the HBB from the kernel,
> > explicitly so that we could do what this series does without Mesa ever
> > breaking. Mesa will never assume the HBB unless the kernel is too old
> > to support querying it. So don't let Mesa be the thing that stops us
> > here.
>
> Thanks for clarifying about Mesa. I still don't trust a data source that
> is unused in production.

Fair enough, I'm not going to argue with that part. Just wanted to
clear up any confusion about Mesa.

Although, IIRC kgsl did set different values for a650 depending on
memory type... do you know what source that used?

>
> I have a related question about HBB. Blob driver doesn't support
> host_image_copy, but it still use HBB configuration. I was under the
> impression this was required for UMD for compression related
> configurations. Is that not true for turnip/freedreno?
>
> -Akhil.

AFAIK the HBB (as well as other UBWC config parameters) doesn't have
any impact on layout configuration, so the UMD can ignore it except
when it's doing CPU texture uploads/downloads. We certainly do in
freedreno/turnip. You'd have to ask that team what they use HBB for,
but my best guess is that the GLES driver uses it for CPU texture
uploads sometimes. That is, the GLES driver might be using
functionality similar to host_image_copy "under the hood". It's
something we'd probably want for freedreno too.

Connor

>
> >
> > Connor
> >
> >> So it is better to
> >> make this opt in, for newer chipsets or those which somebody can verif=
y.
> >> We can invert this logic to something like this:
> >>
> >> if (!gpu->ubwc_config.highest_bank_bit)
> >>     gpu->ubwc_config.highest_bank_bit =3D qcom_smem_dram_get_hbb();
> >>
> >>>  }
> >>>
> >>>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
> >>> @@ -2467,6 +2476,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_devic=
e *dev)
> >>>       bool is_a7xx;
> >>>       int ret;
> >>>
> >>> +     /* We need data from SMEM to retrieve HBB in calc_ubwc_config()=
 */
> >>> +     if (!qcom_smem_is_available())
> >>> +             return ERR_PTR(-EPROBE_DEFER);
> >>> +
> >>
> >> We should add "depends on QCOM_SMEM" to Kconfig. Is SMEM device presen=
t
> >> in all Qcom SoC devicetrees? I wonder if there is a scenario where the=
re
> >> might be an infinite EPROBE_DEFER here.
> >>
> >> -Akhil.
> >>
> >>>       a6xx_gpu =3D kzalloc(sizeof(*a6xx_gpu), GFP_KERNEL);
> >>>       if (!a6xx_gpu)
> >>>               return ERR_PTR(-ENOMEM);
> >>>
> >>
>

