Return-Path: <linux-arm-msm+bounces-66288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC02B0F20A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 14:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEB8B7A63C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F9B28C2BC;
	Wed, 23 Jul 2025 12:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGl1tZdb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D68283C9E
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753272956; cv=none; b=eqTOt557O26Ll3y6e+5xBCbewvKAPEXgXIMPi17rI9tJyY6Rzybya0SYq6aWpY57RfB3TeeStxwOCE/7y6CxQguUK7leW7W0o9XWowz1r4h9g/YsrkDi5s8leEgi3kNDSXY+dHJVcI8COf9epkhauxH2m4yUmCu9rIJ/75AVwnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753272956; c=relaxed/simple;
	bh=4yf87upMWwhGsF9DAmAfKfFZbJLVqqANDgrKL/+BAbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9QYGAMoqksK+XJ1dvCtC0ZTFljSmY6nuMefVnx2kX2hkqJJM1yV7nGZc0KCBDSpRl8128klf3xX4a2aL3eM6PzJSgXwPM+MInTCK6UfJrcpZ3r+q8Q1Iyt9Gvnsqxe9C1z/0MOawYtayFHGQ1d4gNb0YHZcQ3JT/YFVfw79pGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGl1tZdb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9c0c8024778
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=ktRoF5Kfb5cPS6qeC6LMCiTAb0WRcSIgGMsrYXoDOhs=; b=PG
	l1tZdbV8MVqulIE6u6qV1K75QvmND5uvQ7j+pGzdSxgwfTBpimtl4IHlLk9MGXZ/
	9ZKZwpx8jfq+gjGiF5kI1Ajm10mLZw6VEE1uT7weesW1KekQ9RJqs2t4OLFMP0JP
	+3AELmWW19xwevCsCp/Q68ND40klEQ0G2bQsZbimOaZpGG4RV69nzFuzNSPeqXv9
	rqEbYG0FaNacR00SuGg0ITBlOXKgS6muTBYwLs5I0dSaFYyraO/P70d0Ah1+zIzr
	n3FDEuH1G4GwTu5bVL7Wp8wPgMAnUgafKsE/UPXEErlE3qRU5RzL7IAx+vgm8Iwt
	VvPWwUytqnDLvpgsZg9g==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dmwcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:15:53 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-73c874ac31dso7916744a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 05:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753272952; x=1753877752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ktRoF5Kfb5cPS6qeC6LMCiTAb0WRcSIgGMsrYXoDOhs=;
        b=upQ1g5o+IMX8pXnA6+eiIoYF2RfsU+SFCqItpvRjlFlNGsjTduQIpeWR73tpcgPVqt
         ihsG/817CTEy40dacP/S7phTTkBKkC0TL/bertMWaN/Uo7i51jDy7wCF5w25G6ATlOsJ
         FUjFjIHTm+H6L+UWL+4k6JRGNvRZMrmh0QfCJzmrvkXz/FUuFMS4mUIDxMOxKsWEnoMb
         aP5NZ5HaYhNaFtsPf6b0cJ36A6o4E5DvAudo0MVyT+KctjEW63YA8TbzSvtuqa7QNEO3
         VVQ7LryaiAJWPBT6f6oORQCt+61gamY08Uc5AF4mXOz2rWCQJa7A+1tyxxhx6kO7a7DL
         VQdg==
X-Forwarded-Encrypted: i=1; AJvYcCVSQy5y6Q4nF9s48kKLgD1IqtxK9HlkA5ZuxRexq57GU3qxQIXOhR3b9NUA3gjryM39rVn93jzwHNSACDIO@vger.kernel.org
X-Gm-Message-State: AOJu0YzeNzdfY4DWGu42ufa8WWbD+bjZ9+hk5WscgL6cBhu5zwUJitpg
	K1qItkj6lUkf0sPKGdzVqwqHCAM6zV+6/y4Yks+bJwpR7C/p5HV98EBh9Q3orZylf9ab1ea6E2W
	yKoAgyqLXdiCNNm+OvJBIGZy3WjfNt8F1w7/KMcn8wNbljvk4GcaFaLUcyA9sokRAB9me0IpNGT
	Hu3ilrObE88Se+v+cZyRoywegMYK2esAr7jQbxF+FlMqs=
X-Gm-Gg: ASbGncv1/kPlYVyXmbvtH2yxFBHDY24Q2eEQJ3r/adPMzjybe9eN7QveFWlxfa9ck6z
	tc8qv2rz7XqMbId14WOcNPi8V6qd2VQjM6Ywf6AYqKljN/PSEBJ2oRif4WG9o0H5bO9i+nBHZb1
	1niP+fc4Otow8PGUl0+XbKho1PxP3p3pi1nJeikeSdM6Hv+iYaPbbC
X-Received: by 2002:a05:6820:2981:b0:611:ffa0:3863 with SMTP id 006d021491bc7-6187d88903dmr2053790eaf.3.1753272952434;
        Wed, 23 Jul 2025 05:15:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeb2Xwhvp+2DKFatcw4dSTUfUVWmQm3U2bXlTN1qoo5uB13l7WiQFxbIahvNdDFYo6nkhPPzon4nKaKEBWyz8=
X-Received: by 2002:a05:6820:2981:b0:611:ffa0:3863 with SMTP id
 006d021491bc7-6187d88903dmr2053745eaf.3.1753272951969; Wed, 23 Jul 2025
 05:15:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-9-9347aa5bcbd6@oss.qualcomm.com> <0a2188e7-3919-48f7-b5c1-8f779f617f28@oss.qualcomm.com>
In-Reply-To: <0a2188e7-3919-48f7-b5c1-8f779f617f28@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 05:15:41 -0700
X-Gm-Features: Ac12FXwc8FFwXUKsmQ1l4f_2KQZK5PKdoGUYbUEsnP7UlhQh-lQcLU2tfqdZY8E
Message-ID: <CACSVV02x1s9oBSV8khgPhqPJdT1igOzRSOp5wYUZowKvXsb-Dw@mail.gmail.com>
Subject: Re: [PATCH 09/17] drm/msm/a6xx: Switch to GMU AO counter
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=6880d279 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=AnF7TAvy4Dos9zI8ue0A:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: M_8rS94vKDTHkMTe8HYjfUstt4hRAAk8
X-Proofpoint-ORIG-GUID: M_8rS94vKDTHkMTe8HYjfUstt4hRAAk8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDEwNCBTYWx0ZWRfX4kTEsut1GjqS
 OQchwUYbecBfP46r5nOR3HE+LjvJ3kwklF4R5gDnvWmOE66Kv9WVMWIpF6uDfZRN58bk7C/gc2U
 ibtZ5/K4M4dZedZd0tWNF0l/5N4yBauXHjkoUWtjB/R87Ue0kK2lgxtolTelfqYaZOm71bm0bzx
 Hl8GM6Ila+Kwa1K/aTOh2k8CzxqYPUI5uRd/qPLJscqy8stqz83p2P1D+SoqIwPETi2UTIgdmDf
 juolT47fsxoBI+3FEQki9G3n10OcL0+8p0YAv3UBDarRnip0GtY+05kiGR3ax305Yg9f2OlNFzQ
 JS8x+0JZbXp0inuj0Y3kqaMJX2D6O0UUtg1PN7BsVQCNFRtFJKPBynTO9ONZcTdpXGTFP0hK5n1
 x2ry4y5yg8ZMAGRZQbTgkfPF758P1Sw423slXmZFsW9/spdlIPc/xiMu/DtktoZnep9qe/L8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230104

On Wed, Jul 23, 2025 at 3:19=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> > CP_ALWAYS_ON counter falls under GX domain which is collapsed during
> > IFPC. So switch to GMU_ALWAYS_ON counter for any CPU reads since it is
> > not impacted by IFPC. Both counters are clocked by same xo clock source=
.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 30 ++++++++++++++++-----------=
---
> >  1 file changed, 16 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 6770f0363e7284e4596b1188637a4615d2c0779b..f000915a4c2698a85b45bd3=
c92e590f14999d10d 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -16,6 +16,19 @@
> >
> >  #define GPU_PAS_ID 13
> >
> > +static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
> > +{
> > +     u64 count_hi, count_lo, temp;
> > +
> > +     do {
> > +             count_hi =3D gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS=
_ON_COUNTER_H);
> > +             count_lo =3D gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS=
_ON_COUNTER_L);
> > +             temp =3D gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_=
COUNTER_H);
> > +     } while (count_hi !=3D temp);
>
> The original logic is as follows:
>
> static u64 gen7_read_alwayson(struct adreno_device *adreno_dev)
> {
>         struct kgsl_device *device =3D KGSL_DEVICE(adreno_dev);
>         u32 lo =3D 0, hi =3D 0, tmp =3D 0;
>
>         /* Always use the GMU AO counter when doing a AHB read */
>         gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_H, &hi);
>         gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_L, &lo);
>
>         /* Check for overflow */
>         gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_H, &tmp);
>
>         if (hi !=3D tmp) {
>                 gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_L,
>                                 &lo);
>                 hi =3D tmp;
>         }
>
>         return (((u64) hi) << 32) | lo;
> }
>
> Doing this in a while-loop almost looks like you want a lot of time to
> pass - REG_WIDTH(u32?)/19.2 MHz

would:

   } while (unlikely(count_hi !=3D temp));

make it more clear?

> Konrad

