Return-Path: <linux-arm-msm+bounces-24740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED1B91D0D9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2024 11:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC59A1C2099A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2024 09:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A9012D752;
	Sun, 30 Jun 2024 09:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z36tpFhd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD74282ED;
	Sun, 30 Jun 2024 09:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719740151; cv=none; b=BcFQ+8b4LZcCEKY5K/3ZDSbIMVTQUOQ5UdZ2B+kyFKHyg91d8gYkO+B9MM6JKdVB1hprDDiD1eQGfQqywKGZvqobEEd33iPFQrt4HZDqR9AlG3o8FSjJIl4Jezq6/kjiclybqi8HCxJv2yodqdcSDzyAM/mFPzg+R7dgil2MZkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719740151; c=relaxed/simple;
	bh=mggnU2m/HyxNLvJ6qPq4P6ZJXZroENZLj14BgKfkDP0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuoJk3Z0gKH69RWHD++PxggF9TpG9ZEqIeoDsdD/rcNV0uUDWqcC7TMgaGUCW9CPCwWOjGR7LNoo29NQ9hyDhiWfNgiT7uclgU0L8tbBH8jnj6mvmzXB/GZPm84mjf3AREXgBpq4rKBGOAGmrgEuRduKbugCW9nsCXqS3DknSTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z36tpFhd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45U9J3k4002838;
	Sun, 30 Jun 2024 09:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4q8UNhiWgZ7Cc1A+okTFAmm4vbLeRCpN3RPDisIrE5k=; b=Z36tpFhdeEMJYvGH
	5fgO+yr8mVz1VhPGGo60w7Vn3x0kCMgEtKkYqP+TXKlN4X3rZna8EEoCt8ltbTqd
	BQTke5VbMRjszyhxIxHb+TA+ugpanQV41wkNk5FsJfEr/1LLcvfPI19ApriIlr6G
	KfACnIy1g/dcJ5FAeN+H9NTA8E8JVdoaAm1MMIXWnK5CSfYIspc+0yQ4QJPSqcAp
	V+uLoMdP+BWYglpOYozWlLco0U2qM48doolGZg1QjXGIIRHClaG+d/CRivyCzepu
	JcQQI+6bMukQtV6fyfcmKq1p5T78zJWVQ/qsCsu8gdIIb/+gwwu3lTfolk51sZ2Z
	o0utaw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402ag29th3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Jun 2024 09:35:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45U9ZWLG027408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Jun 2024 09:35:32 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 30 Jun 2024 02:35:28 -0700
Date: Sun, 30 Jun 2024 15:05:24 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@chromium.org>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        open list
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] drm/msm/adreno: Split up giant device table
Message-ID: <20240630093524.3zmzxrgmngfh7giv@hu-akhilpo-hyd.qualcomm.com>
References: <20240618164303.66615-1-robdclark@gmail.com>
 <20240618164303.66615-2-robdclark@gmail.com>
 <20240629015831.sglaflboanhrarmn@hu-akhilpo-hyd.qualcomm.com>
 <CAF6AEGtHyGZhBaqNXtujNMg7Cv_cLkUQoCiAckKAWUihzO1i4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGtHyGZhBaqNXtujNMg7Cv_cLkUQoCiAckKAWUihzO1i4Q@mail.gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kbeiAbv5rnUbGGObmQ5GO6XGcd4s_4sK
X-Proofpoint-GUID: kbeiAbv5rnUbGGObmQ5GO6XGcd4s_4sK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-30_08,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 malwarescore=0 phishscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406300075

On Sat, Jun 29, 2024 at 06:32:05AM -0700, Rob Clark wrote:
> On Fri, Jun 28, 2024 at 6:58 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >
> > On Tue, Jun 18, 2024 at 09:42:47AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Split into a separate table per generation, in preparation to move each
> > > gen's device table to it's own file.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/adreno_device.c | 67 +++++++++++++++++-----
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 ++++
> > >  2 files changed, 63 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > index c3703a51287b..a57659eaddc2 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > @@ -20,7 +20,7 @@ bool allow_vram_carveout = false;
> > >  MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in place of IOMMU");
> > >  module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
> > >
> > > -static const struct adreno_info gpulist[] = {
> > > +static const struct adreno_info a2xx_gpus[] = {
> > >       {
> > >               .chip_ids = ADRENO_CHIP_IDS(0x02000000),
> > >               .family = ADRENO_2XX_GEN1,
> > > @@ -54,7 +54,12 @@ static const struct adreno_info gpulist[] = {
> > >               .gmem  = SZ_512K,
> > >               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> > >               .init  = a2xx_gpu_init,
> > > -     }, {
> > > +     }
> > > +};
> > > +DECLARE_ADRENO_GPULIST(a2xx);
> > > +
> > > +static const struct adreno_info a3xx_gpus[] = {
> > > +     {
> > >               .chip_ids = ADRENO_CHIP_IDS(0x03000512),
> > >               .family = ADRENO_3XX,
> > >               .fw = {
> > > @@ -116,7 +121,12 @@ static const struct adreno_info gpulist[] = {
> > >               .gmem  = SZ_1M,
> > >               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> > >               .init  = a3xx_gpu_init,
> > > -     }, {
> > > +     }
> > > +};
> > > +DECLARE_ADRENO_GPULIST(a3xx);
> > > +
> > > +static const struct adreno_info a4xx_gpus[] = {
> > > +     {
> > >               .chip_ids = ADRENO_CHIP_IDS(0x04000500),
> > >               .family = ADRENO_4XX,
> > >               .revn  = 405,
> > > @@ -149,7 +159,12 @@ static const struct adreno_info gpulist[] = {
> > >               .gmem  = (SZ_1M + SZ_512K),
> > >               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> > >               .init  = a4xx_gpu_init,
> > > -     }, {
> > > +     }
> > > +};
> > > +DECLARE_ADRENO_GPULIST(a4xx);
> > > +
> > > +static const struct adreno_info a5xx_gpus[] = {
> > > +     {
> > >               .chip_ids = ADRENO_CHIP_IDS(0x05000600),
> > >               .family = ADRENO_5XX,
> > >               .revn = 506,
> > > @@ -274,7 +289,12 @@ static const struct adreno_info gpulist[] = {
> > >               .quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
> > >               .init = a5xx_gpu_init,
> > >               .zapfw = "a540_zap.mdt",
> > > -     }, {
> > > +     }
> > > +};
> > > +DECLARE_ADRENO_GPULIST(a5xx);
> > > +
> > > +static const struct adreno_info a6xx_gpus[] = {
> > > +     {
> > >               .chip_ids = ADRENO_CHIP_IDS(0x06010000),
> > >               .family = ADRENO_6XX_GEN1,
> > >               .revn = 610,
> > > @@ -520,7 +540,12 @@ static const struct adreno_info gpulist[] = {
> > >               .zapfw = "a690_zap.mdt",
> > >               .hwcg = a690_hwcg,
> > >               .address_space_size = SZ_16G,
> > > -     }, {
> > > +     }
> > > +};
> > > +DECLARE_ADRENO_GPULIST(a6xx);
> > > +
> > > +static const struct adreno_info a7xx_gpus[] = {
> > > +     {
> > >               .chip_ids = ADRENO_CHIP_IDS(0x07000200),
> > >               .family = ADRENO_6XX_GEN1, /* NOT a mistake! */
> > >               .fw = {
> > > @@ -582,7 +607,17 @@ static const struct adreno_info gpulist[] = {
> > >               .init = a6xx_gpu_init,
> > >               .zapfw = "gen70900_zap.mbn",
> > >               .address_space_size = SZ_16G,
> > > -     },
> > > +     }
> > > +};
> > > +DECLARE_ADRENO_GPULIST(a7xx);
> > > +
> > > +static const struct adreno_gpulist *gpulists[] = {
> > > +     &a2xx_gpulist,
> > > +     &a3xx_gpulist,
> > > +     &a4xx_gpulist,
> > > +     &a5xx_gpulist,
> > > +     &a6xx_gpulist,
> > > +     &a6xx_gpulist,
> >
> > Typo. a6xx_gpulist -> a7xx_gpulist.
> 
> yup, already have a patch fixing that in msm-next-robclark

fwiw, Tested-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil
> 
> BR,
> -R
> 
> > -Akhil
> >
> > >  };
> > >
> > >  MODULE_FIRMWARE("qcom/a300_pm4.fw");
> > > @@ -617,13 +652,17 @@ MODULE_FIRMWARE("qcom/yamato_pm4.fw");
> > >  static const struct adreno_info *adreno_info(uint32_t chip_id)
> > >  {
> > >       /* identify gpu: */
> > > -     for (int i = 0; i < ARRAY_SIZE(gpulist); i++) {
> > > -             const struct adreno_info *info = &gpulist[i];
> > > -             if (info->machine && !of_machine_is_compatible(info->machine))
> > > -                     continue;
> > > -             for (int j = 0; info->chip_ids[j]; j++)
> > > -                     if (info->chip_ids[j] == chip_id)
> > > -                             return info;
> > > +     for (int i = 0; i < ARRAY_SIZE(gpulists); i++) {
> > > +             for (int j = 0; j < gpulists[i]->gpus_count; j++) {
> > > +                     const struct adreno_info *info = &gpulists[i]->gpus[j];
> > > +
> > > +                     if (info->machine && !of_machine_is_compatible(info->machine))
> > > +                             continue;
> > > +
> > > +                     for (int k = 0; info->chip_ids[k]; k++)
> > > +                             if (info->chip_ids[k] == chip_id)
> > > +                                     return info;
> > > +             }
> > >       }
> > >
> > >       return NULL;
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > index 77526892eb8c..17aba8c58f3d 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > @@ -114,6 +114,16 @@ struct adreno_info {
> > >
> > >  #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }
> > >
> > > +struct adreno_gpulist {
> > > +     const struct adreno_info *gpus;
> > > +     unsigned gpus_count;
> > > +};
> > > +
> > > +#define DECLARE_ADRENO_GPULIST(name)                  \
> > > +const struct adreno_gpulist name ## _gpulist = {      \
> > > +     name ## _gpus, ARRAY_SIZE(name ## _gpus)      \
> > > +}
> > > +
> > >  /*
> > >   * Helper to build a speedbin table, ie. the table:
> > >   *      fuse | speedbin
> > > --
> > > 2.45.2
> > >

