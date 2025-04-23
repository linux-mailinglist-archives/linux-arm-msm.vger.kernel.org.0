Return-Path: <linux-arm-msm+bounces-55157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE21A98EC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 16:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F2A71B8204B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 14:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2794727D76E;
	Wed, 23 Apr 2025 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+tZeBBe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68288143736;
	Wed, 23 Apr 2025 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420156; cv=none; b=JXxePK92pjtlfUIhL36ZtF+wqBDBSs7Ld53UMInX0aIKBzppzgYhtc773kIJhF56YEGqOpKk+c/UF8KI8dBvYmeLdTpW52w7vFyH/xEAZLfA++qNZH4zBmlrGmeASWCKhS97CaDCB1WpeL85anT11IPo61g8wcV1TvcfgGSnAtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420156; c=relaxed/simple;
	bh=oy2rWzpZW0dwz08a8V5Sf9Lmno1gccMy0jYnU3T9mcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CxF5q2RHuEZPm9d1+nFHf/dCHZbIGYx+GEhNJNGos1bSlg54Kalo6GkSSmatabmil4RBpDm5x1hcXtsKtnI+QErreyw05ioT1bEl5qFqALsoS6reBMhcmMVCJ2vdKCKvfY5pUkrWoG8R7Wd423v6wITDh5juaa+msluTYz1MFB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+tZeBBe; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-861d7a09c88so126399639f.2;
        Wed, 23 Apr 2025 07:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745420152; x=1746024952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7m0UzjQSlAnchYu9ifeHwkg6qMlyGsq9HZFdL9+SCys=;
        b=O+tZeBBeJK48Bo5maE7I1JB8l/o5SEWChRWtrTuTS/kyFSNwxEngQ1V04wGiwXnnBI
         6R73xnRBTYA7jScCh2To8OpbdInx0jTaMEDvpmhdm3Qt5BNPbLZaatRzuCGerJJEIZD4
         zFymSNCVuCkfR/U4NyEc+yEhfQA8hgj+dTyd5kIEouFvsGeofJvLKRX1hGjfqkLMfP14
         F6c/T/RS2Bz5akTcCc927iEbBjaM7+A0PFuFq0JRKOWvUyOmNeEV+dTvhMZLYfrd+0Fi
         EOZNhAjL7gGaAXmIG6rQkj8xcAt4nAqBU9IDBIJJ6vm/q0jQ0Xi5hiqaTldk+AM11dI7
         4Upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745420152; x=1746024952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7m0UzjQSlAnchYu9ifeHwkg6qMlyGsq9HZFdL9+SCys=;
        b=TSF1gTqkCtHXgcvMFHueg5WBWecH1AAGl8WoB/G/ByOZ5imNZ8estHxtLzKP8QRkhr
         Wq/IBq4Ui7hnmPsYtuIvPU7OAxXOSFEQ+na3SOLh7MzLpIEA75agce4Q1/Y5EZfzkb8D
         69m4sNUNQfpdkgIfC7cWPYKFa3yKMMi8mq1lZyi5ngkk0+RQXpurkwueoWzFOZWtHLcg
         qP3+Bqqr8v2VThgkcd5L1TJ7a7XgDJ/O7rlkIKBVfaWf9j4+KKWjG4f6vRV28lVBMrLC
         /rvosND3wpvQS9N7qKcqfxKzpEKEYzxNqXtyQyAOhH1rhivNI5WR5EvB0Ic4WNBKPYmr
         z9ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6MB2bT6puhNdZx2foclg37eY9rxKzMhtkFTPaSguuyscv/6etPz6Zn43SlpWgMMXyUHRWr5sO49KP7NdQ@vger.kernel.org, AJvYcCVVBr8aNT94Q5xfMDxRY054FKZF35tSuhGwoZgew5yjMfsu+jTvCZnI/0K+DIqa4SWjqcugcESvyryQbtJY@vger.kernel.org, AJvYcCX8AA52YlUeevOEkwCbl8TTnSj7Bb5PCKn5hXJ/pJIU5VPQ7lh0kaMXHcZbDuXqqN/bwmbgvMUYM9nZKTJGgZgA@vger.kernel.org
X-Gm-Message-State: AOJu0YwIpjCeYEtmgJe88ZOcO3RoEjRWy/Ce5h5K6hflbqOZXcxWzXh7
	WEvDHg8LcJg0e+ZXz9sUlUBHLaoDoWLnAcFvghe1E2X3CT8IuBrmcmAB32sWIsr+5ZVkyPBGyJD
	2ACtCJtKmV1RCSdLDQ+XRKi5lxhw=
X-Gm-Gg: ASbGnctekuBmFaRCaVYEmBXgMky146fxV5Q1oiTBqWuk5wvEj0XGzEdj6tsTsILTDo2
	9+zsrzsb+B8lJ27XXmn+tYmwL96TZD8k60jv2Ps2ZpoM/PfD72EjS4dVgr1iwvG3J4pP/PAHSv3
	dvvtz/XcsqGRVnQ8R7zYayIOLuafIEhHJy/k/J7wWtncq4ORi9jkF5
X-Google-Smtp-Source: AGHT+IH/HosXjxOmwFPtGeWQfhxekC8P6qoxTmos7b0mOc58p0+QS9G2JnlqUawjIQiGiopnQR3O+V/TuYdD8NWDOvo=
X-Received: by 2002:a92:ca48:0:b0:3d0:47cf:869c with SMTP id
 e9e14a558f8ab-3d8942886e8mr197937005ab.19.1745420152327; Wed, 23 Apr 2025
 07:55:52 -0700 (PDT)
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
 <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com>
In-Reply-To: <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 23 Apr 2025 07:55:39 -0700
X-Gm-Features: ATxdqUHj4F4rmzIJwqK9WlP6_xORQ21GMzISXDUuQYh93b8M4VTvVt2-yaAaxlY
Message-ID: <CAF6AEGts5rWvgyZy8RtAaUOsad362AG-uNjxF9vyj4szg=b5Bw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Connor Abbott <cwabbott0@gmail.com>, 
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

On Tue, Apr 22, 2025 at 4:57=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/21/25 10:13 PM, Rob Clark wrote:
> > On Fri, Apr 18, 2025 at 9:00=E2=80=AFAM Akhil P Oommen <quic_akhilpo@qu=
icinc.com> wrote:
> >>
> >> On 4/18/2025 6:40 AM, Connor Abbott wrote:
> >>> On Thu, Apr 17, 2025, 1:50=E2=80=AFPM Akhil P Oommen <quic_akhilpo@qu=
icinc.com> wrote:
> >>>>
> >>>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
> >>>>> On Thu, Apr 17, 2025 at 3:45=E2=80=AFAM Akhil P Oommen <quic_akhilp=
o@quicinc.com> wrote:
> >>>>>>
> >>>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
> >>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>
> >>>>>>> The Highest Bank address Bit value can change based on memory typ=
e used.
> >>>>>>>
> >>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
> >>>>>>> default (the one used prior to this change) on error.
> >>>>>>>
> >>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>> ---
> >>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
> >>>>>>>  1 file changed, 14 insertions(+), 1 deletion(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/=
drm/msm/adreno/a6xx_gpu.c
> >>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f=
20ae5f8f5e57f38ecc62d9f 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>>> @@ -13,6 +13,7 @@
> >>>>>>>  #include <linux/firmware/qcom/qcom_scm.h>
> >>>>>>>  #include <linux/pm_domain.h>
> >>>>>>>  #include <linux/soc/qcom/llcc-qcom.h>
> >>>>>>> +#include <linux/soc/qcom/smem.h>
> >>>>>>>
> >>>>>>>  #define GPU_PAS_ID 13
> >>>>>>>
> >>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gp=
u *gpu)
> >>>>>>>
> >>>>>>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>>>>>>  {
> >>>>>>> +     int hbb;
> >>>>>>> +
> >>>>>>>       gpu->ubwc_config.rgb565_predicator =3D 0;
> >>>>>>>       gpu->ubwc_config.uavflagprd_inv =3D 0;
> >>>>>>>       gpu->ubwc_config.min_acc_len =3D 0;
> >>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adre=
no_gpu *gpu)
> >>>>>>>           adreno_is_a690(gpu) ||
> >>>>>>>           adreno_is_a730(gpu) ||
> >>>>>>>           adreno_is_a740_family(gpu)) {
> >>>>>>> -             /* TODO: get ddr type from bootloader and use 2 for=
 LPDDR4 */
> >>>>>>>               gpu->ubwc_config.highest_bank_bit =3D 16;
> >>>>>>>               gpu->ubwc_config.amsbc =3D 1;
> >>>>>>>               gpu->ubwc_config.rgb565_predicator =3D 1;
> >>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adr=
eno_gpu *gpu)
> >>>>>>>               gpu->ubwc_config.highest_bank_bit =3D 14;
> >>>>>>>               gpu->ubwc_config.min_acc_len =3D 1;
> >>>>>>>       }
> >>>>>>> +
> >>>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above d=
efaults in case of error */
> >>>>>>> +     hbb =3D qcom_smem_dram_get_hbb();
> >>>>>>> +     if (hbb < 0)
> >>>>>>> +             return;
> >>>>>>> +
> >>>>>>> +     gpu->ubwc_config.highest_bank_bit =3D hbb;
> >>>>>>
> >>>>>> I am worried about blindly relying on SMEM data directly for HBB f=
or
> >>>>>> legacy chipsets. There is no guarantee it is accurate on every chi=
pset
> >>>>>> and every version of firmware. Also, until recently, this value wa=
s
> >>>>>> hardcoded in Mesa which matched the value in KMD.
> >>>>>
> >>>>> To be clear about this, from the moment we introduced host image
> >>>>> copies in Mesa we added support for querying the HBB from the kerne=
l,
> >>>>> explicitly so that we could do what this series does without Mesa e=
ver
> >>>>> breaking. Mesa will never assume the HBB unless the kernel is too o=
ld
> >>>>> to support querying it. So don't let Mesa be the thing that stops u=
s
> >>>>> here.
> >>>>
> >>>> Thanks for clarifying about Mesa. I still don't trust a data source =
that
> >>>> is unused in production.
> >>>
> >>> Fair enough, I'm not going to argue with that part. Just wanted to
> >>> clear up any confusion about Mesa.
> >>>
> >>> Although, IIRC kgsl did set different values for a650 depending on
> >>> memory type... do you know what source that used?
> >>
> >> KGSL relies on an undocumented devicetree node populated by bootloader
> >> to detect ddrtype and calculates the HBB value based on that.
> >
> > Would it be reasonable to use the smem value, but if we find the
> > undocumented dt property, WARN_ON() if it's value disagrees with smem?
> >
> > That would at least give some confidence, or justified un-confidence
> > about the smem values
>
> The aforementioned value is populated based on the data that this
> driver reads out, and only on the same range of platforms that this
> driver happens to cater to

Did I understand that correctly to mean that the dt property is based
on the same smem value that you are using?  In that case, there should
be no argument against using the smem value as the source of truth.

BR,
-R

