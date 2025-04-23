Return-Path: <linux-arm-msm+bounces-55158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E989A98EA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 16:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23A1C447AB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 14:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DA5280A52;
	Wed, 23 Apr 2025 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbuU2huI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3998527FD60;
	Wed, 23 Apr 2025 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420185; cv=none; b=ozt1lhT+T02iwXD5c7OSsTLYNqSWDoZVJ9nuuh1bD66mnVzjyYd6+2xHPh0e+/5zzR2f1DyjKIIhQ0i9Y15TsDqgnnkqFgroOLaVDlrAE85SXtngrwKJTmztswjaD0JcjEsP2cLyO7sq0UT9+MDpfL4vxQE3N5QAhvwT05TZtZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420185; c=relaxed/simple;
	bh=MzbKaPlhZbqHnB+7LjPlQI7Y9Y1kxehTFw+ZDShTL24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jb0RCKU3CflE8z23+Rm0e0BZoKqLRRLGrR47nOGuM8k0mEyMeFe271WYS0WZDqnKkSvrvjbjBgXXNJ3TGK9XCkrxbTK8kSyD1MOJlapSPhWxcwESo2ZeENMEX8dd6mS7EkVdSxzo1cDukBXWAafnYngEv3Ln1luXM+u40Q863a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbuU2huI; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d90208e922so19481395ab.3;
        Wed, 23 Apr 2025 07:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745420183; x=1746024983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7zBCraNGsRSp4m7Jui0F2NODzd+uSeWD334fKfvLPk=;
        b=kbuU2huIutquQq8j0oN/7DVSEB1tMa6GvdUH2hHrGgSO7aSZwfXOq7petH6TjCJIpK
         y5uLUMHF5hQgPKXoiozsTaumm6mk9UHzRAD2Hncy1PmvZ7L7Xp1lDIRY2/J7HqzD93EL
         M/Mqoe5+odNChFjBNgXmsiPPonf6OEEpuyHrmwHCoX73JbgNAac8iGcox1ljB5+QNdSC
         LdIBI91OMr7VNHnVuUzmMN3XXB4+zefb8CW1J1KFeFDF1S/6EDD6csqNVSbEylC0+r6S
         ZPSgpjOgdxtFJFATre0lX1VvDkiexJvgD0agFpGNZT4T/4rgh7AvhGgR5VpI9e81xPto
         bHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745420183; x=1746024983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7zBCraNGsRSp4m7Jui0F2NODzd+uSeWD334fKfvLPk=;
        b=sdDT2N3G23xZbDOiXQ6M2BoBMsHBiGRMDcWwIcwJNcphP2viZp+09/mYvVONF1+0BA
         zj66GiSp5L5dO7ApkTJgeA4Ay0FHmjlDF/9IuneRnpHjy/bktRKG45g5HJVWjuGy6t7K
         ibAGo6DEQR5skDTcTh3rG3f4s3D9HxSbFfbanUsYi5msHbbVghATEoHQ3N6z/wjvTpGb
         n1lNVeKa6s861qZzXnMnnckqxd2IMJb0ALdXIoXRxe6aTaUObH+DP4B3Dg2h6FpKQLdA
         Xw8nagRTBiYdNruG3kAn2pi7GVHtagc4BJukihaQXz4HHp33mzLLpjlt0frDFeA5Nx4s
         ZMdA==
X-Forwarded-Encrypted: i=1; AJvYcCUQSA1jbaSMOVFVLYsNAQporWrXPmeLVTqFt2Ff74ZeXtAckVF2JGv0E8SX/0Z2mlJF54OaF3a3y7zhjh+a@vger.kernel.org, AJvYcCWLkRGTce2MObtT8PDBbRcruEw3JSElbAZmiGdrl07EESyi1kpl10v0EvAYPq7YeJbRyL5wVoi4XQAtxsdZaCcg@vger.kernel.org, AJvYcCWvzexdATCcJcwuTTSvr77nJPqEaD2bicwIwqwABhnodwU/FgJwLH0env7JbbIJxctVV8TIhXEkTe0kB3Iy@vger.kernel.org
X-Gm-Message-State: AOJu0YwKlIAS2lzKtPYd91oY1HHGHE3xY5Z4jUW+/Up85hmam48Ubg+z
	ck3Na/3KNbgcd+dTlOPmsdy7YPvWP9oHYHW/+MVoV7HQR0bJKDRAiUC2rloMa4t77bquxSrX4ES
	2/3taGWBSQmGGuwTU5NxXJUvPo2s=
X-Gm-Gg: ASbGncvc9bH7huz3ViLQBO/y9z6k0W+je7tGQ/iGTdpUQ2xSs1UEYPAjSGAtIAp5HQm
	ne+iRwmy1d712BsebY/XRsclTROCpkVGhsD+UHuCA3yg75hZ/VAVCd0wt5xheF8HPCm2w5xZsbZ
	zWtjTt0KTo6IuI0BDybxZxXkfqmjwxr5cAWvnjjuD2VtsCwGvPrp5V
X-Google-Smtp-Source: AGHT+IHVtOE5o2jTuVEfP1EDVgM3Pw23s7PRPYvqZ9RtCyTfc3rrtSEEXbHZkyX+T4R2CI6KEFvwq9b1mqXwzRCU5wk=
X-Received: by 2002:a05:6e02:1988:b0:3d5:890b:d9df with SMTP id
 e9e14a558f8ab-3d89417dd41mr187745595ab.15.1745420183191; Wed, 23 Apr 2025
 07:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com> <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com> <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
 <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com> <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
 <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com> <d67b8fe7-ab92-4756-b549-827210240593@quicinc.com>
In-Reply-To: <d67b8fe7-ab92-4756-b549-827210240593@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 23 Apr 2025 07:56:11 -0700
X-Gm-Features: ATxdqUF5EpOyk1FsQ_Ne2f-BgPILC8QqU9tKHvMBEAdfKBfuUFdju_-qVLgeolI
Message-ID: <CAF6AEGut3VQpj=v1euA+re55cLYot+BpjWVBs7orHURQ=Xdhdg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Connor Abbott <cwabbott0@gmail.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-hardening@vger.kernel.org, 
	dri-devel <dri-devel@lists.freedesktop.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 11:55=E2=80=AFPM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
>
> On 4/23/2025 5:27 AM, Konrad Dybcio wrote:
> > On 4/21/25 10:13 PM, Rob Clark wrote:
> >> On Fri, Apr 18, 2025 at 9:00=E2=80=AFAM Akhil P Oommen <quic_akhilpo@q=
uicinc.com> wrote:
> >>>
> >>> On 4/18/2025 6:40 AM, Connor Abbott wrote:
> >>>> On Thu, Apr 17, 2025, 1:50=E2=80=AFPM Akhil P Oommen <quic_akhilpo@q=
uicinc.com> wrote:
> >>>>>
> >>>>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
> >>>>>> On Thu, Apr 17, 2025 at 3:45=E2=80=AFAM Akhil P Oommen <quic_akhil=
po@quicinc.com> wrote:
> >>>>>>>
> >>>>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
> >>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>>
> >>>>>>>> The Highest Bank address Bit value can change based on memory ty=
pe used.
> >>>>>>>>
> >>>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonabl=
e
> >>>>>>>> default (the one used prior to this change) on error.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>> ---
> >>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
> >>>>>>>>  1 file changed, 14 insertions(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu=
/drm/msm/adreno/a6xx_gpu.c
> >>>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319=
f20ae5f8f5e57f38ecc62d9f 100644
> >>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>>>> @@ -13,6 +13,7 @@
> >>>>>>>>  #include <linux/firmware/qcom/qcom_scm.h>
> >>>>>>>>  #include <linux/pm_domain.h>
> >>>>>>>>  #include <linux/soc/qcom/llcc-qcom.h>
> >>>>>>>> +#include <linux/soc/qcom/smem.h>
> >>>>>>>>
> >>>>>>>>  #define GPU_PAS_ID 13
> >>>>>>>>
> >>>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_g=
pu *gpu)
> >>>>>>>>
> >>>>>>>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>>>>>>>  {
> >>>>>>>> +     int hbb;
> >>>>>>>> +
> >>>>>>>>       gpu->ubwc_config.rgb565_predicator =3D 0;
> >>>>>>>>       gpu->ubwc_config.uavflagprd_inv =3D 0;
> >>>>>>>>       gpu->ubwc_config.min_acc_len =3D 0;
> >>>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adr=
eno_gpu *gpu)
> >>>>>>>>           adreno_is_a690(gpu) ||
> >>>>>>>>           adreno_is_a730(gpu) ||
> >>>>>>>>           adreno_is_a740_family(gpu)) {
> >>>>>>>> -             /* TODO: get ddr type from bootloader and use 2 fo=
r LPDDR4 */
> >>>>>>>>               gpu->ubwc_config.highest_bank_bit =3D 16;
> >>>>>>>>               gpu->ubwc_config.amsbc =3D 1;
> >>>>>>>>               gpu->ubwc_config.rgb565_predicator =3D 1;
> >>>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct ad=
reno_gpu *gpu)
> >>>>>>>>               gpu->ubwc_config.highest_bank_bit =3D 14;
> >>>>>>>>               gpu->ubwc_config.min_acc_len =3D 1;
> >>>>>>>>       }
> >>>>>>>> +
> >>>>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above =
defaults in case of error */
> >>>>>>>> +     hbb =3D qcom_smem_dram_get_hbb();
> >>>>>>>> +     if (hbb < 0)
> >>>>>>>> +             return;
> >>>>>>>> +
> >>>>>>>> +     gpu->ubwc_config.highest_bank_bit =3D hbb;
> >>>>>>>
> >>>>>>> I am worried about blindly relying on SMEM data directly for HBB =
for
> >>>>>>> legacy chipsets. There is no guarantee it is accurate on every ch=
ipset
> >>>>>>> and every version of firmware. Also, until recently, this value w=
as
> >>>>>>> hardcoded in Mesa which matched the value in KMD.
> >>>>>>
> >>>>>> To be clear about this, from the moment we introduced host image
> >>>>>> copies in Mesa we added support for querying the HBB from the kern=
el,
> >>>>>> explicitly so that we could do what this series does without Mesa =
ever
> >>>>>> breaking. Mesa will never assume the HBB unless the kernel is too =
old
> >>>>>> to support querying it. So don't let Mesa be the thing that stops =
us
> >>>>>> here.
> >>>>>
> >>>>> Thanks for clarifying about Mesa. I still don't trust a data source=
 that
> >>>>> is unused in production.
> >>>>
> >>>> Fair enough, I'm not going to argue with that part. Just wanted to
> >>>> clear up any confusion about Mesa.
> >>>>
> >>>> Although, IIRC kgsl did set different values for a650 depending on
> >>>> memory type... do you know what source that used?
> >>>
> >>> KGSL relies on an undocumented devicetree node populated by bootloade=
r
> >>> to detect ddrtype and calculates the HBB value based on that.
> >>
> >> Would it be reasonable to use the smem value, but if we find the
> >> undocumented dt property, WARN_ON() if it's value disagrees with smem?
> >>
> >> That would at least give some confidence, or justified un-confidence
> >> about the smem values
> >
> > The aforementioned value is populated based on the data that this
> > driver reads out, and only on the same range of platforms that this
> > driver happens to cater to
>
> Like I suggested privately, can we centralize all ubwc configuration so
> that it is consistent across all drivers. With that, we will need to
> maintain a table of ubwc config for each chipset and HBB can be
> calculated based on the DDR configuration identified from SMEM. Once we
> migrate the downstream drivers to the new API, we can hopefully move to
> the HBB value from SMEM. This will ensure that the SMEM data for HBB is
> accurate in all future chipsets.
>

yes please

BR,
-R

