Return-Path: <linux-arm-msm+bounces-66147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D19B0E290
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 19:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A5281C85503
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 17:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A859F27FB26;
	Tue, 22 Jul 2025 17:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CsofTea7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA3A27E04F
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 17:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753205234; cv=none; b=eLFdwfFbQzvSaceqWb05K2yQnRCVxESTn1WLTL+JwbZ85TRispXEJOkMDAzcFDkmeR4lzcIEKJMo++DrvTfaojn3BdKonJHJ7e5kwB/LtpU+9JTwCzO5StAw7RcFgR+ND/pDn1zuw3Eh9BE3lIFjIgMIAJg+bwGF+xeLwaOS10A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753205234; c=relaxed/simple;
	bh=GHQF8tWZuWKKjpmquWpNXwOZJcUgZsbrtI8gxt6iiUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6RqkTBoTB2HB5t7c+xUrq9eG++IWkVSM72Ihpxy8HtUiNcp65A8BVCmOejedO7FtL1qJLBEHtVQ0ietkXZ8UU35oA1ooyd5VW0VcFQKGIxwOCwScWadBVZcWisnFNGd3H6JCZ1jOVrKiwZvGAvlqiw+QUPxRWQK0guvXJvvtpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CsofTea7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MFwrZv010552
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 17:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=YrjoZd7QCC3rgO1NgwMgFJMp5C62tulHsO96Xx3lRDo=; b=Cs
	ofTea7bG1QFvcknnfaPBsuxWjCB0UwTjj5Zxci9asGpuq3hMstWoQjWAYWaQDz6B
	SKzUwUS2+OFrMyBfT67QLCCUXA8ajpRXPRsbKJYuCbS1NF/tV2sAGDF3o0x8iBLe
	fx1o+KOJyRfQSaPRPXzgZTqFM0cyKn8FJmuAtn+/+bSoL8bYkJQ+MpfwEnAjsNPu
	RD15BGgWVFRAu4Lx6rdPekOfXW+j2+oamlWVWByfQ6cb+s15qRWrFmL8VCPOPk3z
	PkIj7pRqYREenC2JWlrfUZjc5xmGvWImFdfYSdSRTdusmESyXLdbaUEt4xMrkmRY
	c2r7LhemJkovIgAzdbyA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t19q31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 17:27:10 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-41d2ce923a6so4982109b6e.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 10:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753205229; x=1753810029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YrjoZd7QCC3rgO1NgwMgFJMp5C62tulHsO96Xx3lRDo=;
        b=d8iriSdFfGKRuUKL0QuWfPJd207gFlgIXhLz0cfd3ae1HBYWO1ggRrWp+Zax5iln91
         mUXF15lPrtSJiBoggClhu9N5i9POMQkXZ19aSX/YiXvkMNUWgDGWkrQZpRi+2vZ+rCXv
         O6/pSH9JPc7XeQBoQV7hAWjNtqX9K7hUNeBvyyE+2Zu3kkVXDliLy9GsOrN4jg73A3er
         2jTV4QjdOD37QHYEyvNYmXGUm5sc68cjmfuGv1MUeZD7zX3NXFESguuV4hYvnYRxDgH7
         lbBcPE2r4ACGH+4p1FNYzaJQIwHJ5ba1ksg1ZCJiGmDmaRfytUONn7AXpGwuor01GCZj
         zmEg==
X-Forwarded-Encrypted: i=1; AJvYcCVlWL/1qmlIJZn5XrQJvcluL+C5EM1tkQuVqlolUx0uvfys5a8mglbYJko2L3VT+ckOY4hWKKJ167fWSj2i@vger.kernel.org
X-Gm-Message-State: AOJu0YwLeFjxMJfLQZ+DX7WoJuMVUJOd2AzZOHnJnqTn3AQjUiBOoJHV
	LGuZCJgECg/ItLKWdGXK2bavLcc37yvrLM+LThjCsl1vxOJ1Stqj0HIS69Mo6zPTh/T627+bKeh
	UXGsQi99XVTIIAUZnnbJjwe7p/7QCMtwYvatvxLR0XaPkeLV+0B3agDV/PjhevC7X+wWJ/Srv9/
	uyVCcQeZl2mFsWGN1xnWFZSyOAqBqdrrbC1m6bzVFQVRs=
X-Gm-Gg: ASbGnctvcNltDQS6qYkfYQ4rjGdSds0a/4h282+WmT1yGKSIQQOQnKFvzx+EFTNQgnz
	14gmXv0xaGVdp83mIp5RkuLSzZyDtRhhIO+E4h3Qv3erfakod00vuwqtHscX+0fxstcD+lwKaL+
	o+/8SwN4yZXPoPTYPWqg3790tJ3u9oSSYtDYm5SEYlNhsCGlaolLM3
X-Received: by 2002:a05:6808:1b2c:b0:41c:1727:8b4d with SMTP id 5614622812f47-426c4bdfe8amr134362b6e.11.1753205229214;
        Tue, 22 Jul 2025 10:27:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt351bm791NHr11RGdS2kzc1apQfD8udpp73fwAAszYsw6GEV5yDdNjEt0nwD6ENSLExfzwwg6Dsyx6tcyQ74=
X-Received: by 2002:a05:6808:1b2c:b0:41c:1727:8b4d with SMTP id
 5614622812f47-426c4bdfe8amr134333b6e.11.1753205228734; Tue, 22 Jul 2025
 10:27:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-5-9347aa5bcbd6@oss.qualcomm.com> <avni4utnzdmmafc2mf7aqgva3osbhuiqtia7gdngqswk5cmtn6@zo65ir7gyj6y>
In-Reply-To: <avni4utnzdmmafc2mf7aqgva3osbhuiqtia7gdngqswk5cmtn6@zo65ir7gyj6y>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 10:26:58 -0700
X-Gm-Features: Ac12FXz7GgAd4CQ5r6mtT-fkFUIs76swU0cXdPQmfmKvXuiUlkOuIL_tdrwpuow
Message-ID: <CACSVV0346j2y-1Jkj=wasekYy5syax_E495AQZv0bvrrqwCSRw@mail.gmail.com>
Subject: Re: [PATCH 05/17] drm/msm/a6xx: Fix PDC sleep sequence
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: FeK47me2T1U0GAuR5501ALTmsZww8m1p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE0NiBTYWx0ZWRfX+3nI97ZXRQPy
 mjLRUJ/XUJPMRGTpdm31Ryzv9YbWroM4o/0rSmQgj/IPFcipw8XjkzxuCSkV3Sk8BqnOLwWCkpf
 dXlnnkRKEaS6YMQzdxWlrMC96MvIa9bKnrscLkZWQzY5cmZ7nbI2NH3PFVVme+fpVgThnd5eSqF
 8bk6mP0+h3rFylSurOqD/kKkui7w+9h/b4wRdQHBHxyTHVS//2D8bOq1hOQ4JGZsIM6oiFHNKNV
 ZCF4ANirIybKbCzHLcUexZpOHPAtB4+hsqVh8nOH/IuX/lv6KTyMuXYINOKJZcDRsXP1ZY1Es0Q
 ZR75oGVxQgBm0VF7kjH0jyEjMOByRAjKhURFcP2acj0t6NmLOsyTdDVYhsjVM87UFNkCbtQs0ob
 WXch4TD7Ko9nJ+TB4PPYf44U9tQfalGxPuKcOSLe98aD6KAhpIDl4cLqpX6jCKs/A1UbiYJU
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=687fc9ee cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=5FltqUUlFAtdD00mdp8A:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: FeK47me2T1U0GAuR5501ALTmsZww8m1p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220146

On Tue, Jul 22, 2025 at 6:33=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Jul 20, 2025 at 05:46:06PM +0530, Akhil P Oommen wrote:
> > Since the PDC resides out of the GPU subsystem and cannot be reset in
> > case it enters bad state, utmost care must be taken to trigger the PDC
> > wake/sleep routines in the correct order.
> >
> > The PDC wake sequence can be exercised only after a PDC sleep sequence.
> > Additionally, GMU firmware should initialize a few registers before the
> > KMD can trigger a PDC sleep sequence. So PDC sleep can't be done if the
>
> s/KMD/the driver/

IMHO for gpu things "KMD" makes sense, to differentiate between kernel
and user mode (UMD).. this is perhaps different from other areas where
there isn't a userspace component to the driver stack

BR,
-R

> > GMU firmware has not initialized. Track these dependencies using a new
> > status variable and trigger PDC sleep/wake sequences appropriately.
>
> Again, it looks like there should be a Fixes tag here.
>
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 30 +++++++++++++++++++--------=
---
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  6 ++++++
> >  2 files changed, 25 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gmu.c
> > index 3bebb6dd7059782ceca29f2efd2acee24d3fc930..4d6c70735e0892ed87d6a68=
d64f24bda844e5e16 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -279,6 +279,8 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
> >       if (ret)
> >               DRM_DEV_ERROR(gmu->dev, "GMU firmware initialization time=
d out\n");
> >
> > +     set_bit(GMU_STATUS_FW_START, &gmu->status);
> > +
> >       return ret;
> >  }
> >
> > @@ -528,6 +530,9 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
> >       int ret;
> >       u32 val;
> >
> > +     if (!test_and_clear_bit(GMU_STATUS_PDC_SLEEP, &gmu->status))
> > +             return 0;
> > +
> >       gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
> >
> >       ret =3D gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
> > @@ -555,6 +560,11 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
> >       int ret;
> >       u32 val;
> >
> > +     if (test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
> > +             return;
> > +
> > +     /* TODO: should we skip if IFPC is not enabled */
>
> Is this a question or a statement?
>
> > +
> >       gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1);
> >
> >       ret =3D gmu_poll_timeout_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_=
DRV0,
> > @@ -563,6 +573,8 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
> >               DRM_DEV_ERROR(gmu->dev, "Unable to power off the GPU RSC\=
n");
> >
> >       gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 0);
> > +
> > +     set_bit(GMU_STATUS_PDC_SLEEP, &gmu->status);
> >  }
> >
> >  static inline void pdc_write(void __iomem *ptr, u32 offset, u32 value)
> > @@ -691,8 +703,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu=
)
> >       /* ensure no writes happen before the uCode is fully written */
> >       wmb();
> >
> > -     a6xx_rpmh_stop(gmu);
> > -
> >  err:
> >       if (!IS_ERR_OR_NULL(pdcptr))
> >               iounmap(pdcptr);
> > @@ -852,19 +862,15 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu=
, unsigned int state)
> >       else
> >               gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
> >
> > -     if (state =3D=3D GMU_WARM_BOOT) {
> > -             ret =3D a6xx_rpmh_start(gmu);
> > -             if (ret)
> > -                     return ret;
> > -     } else {
> > +     ret =3D a6xx_rpmh_start(gmu);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (state =3D=3D GMU_COLD_BOOT) {
> >               if (WARN(!adreno_gpu->fw[ADRENO_FW_GMU],
> >                       "GMU firmware is not loaded\n"))
> >                       return -ENOENT;
> >
> > -             ret =3D a6xx_rpmh_start(gmu);
> > -             if (ret)
> > -                     return ret;
> > -
> >               ret =3D a6xx_gmu_fw_load(gmu);
> >               if (ret)
> >                       return ret;
> > @@ -1046,6 +1052,8 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *g=
mu)
> >
> >       /* Reset GPU core blocks */
> >       a6xx_gpu_sw_reset(gpu, true);
> > +
> > +     a6xx_rpmh_stop(gmu);
> >  }
> >
> >  static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx=
_gmu *gmu)
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/ms=
m/adreno/a6xx_gmu.h
> > index b2d4489b40249b1916ab4a42c89e3f4bdc5c4af9..034f1b4e5a3fb9cd601bfbe=
6d06d64e5ace3b6e7 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> > @@ -117,6 +117,12 @@ struct a6xx_gmu {
> >
> >       struct qmp *qmp;
> >       struct a6xx_hfi_msg_bw_table *bw_table;
> > +
> > +/* To check if we can trigger sleep seq at PDC. Cleared in a6xx_rpmh_s=
top() */
> > +#define GMU_STATUS_FW_START  0
> > +/* To track if PDC sleep seq was done */
> > +#define GMU_STATUS_PDC_SLEEP 1
> > +     unsigned long status;
> >  };
> >
> >  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
> >
> > --
> > 2.50.1
> >
>
> --
> With best wishes
> Dmitry

