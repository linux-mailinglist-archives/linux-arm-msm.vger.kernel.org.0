Return-Path: <linux-arm-msm+bounces-30814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D840E96CA22
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 00:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57D1F1F22D85
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 22:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B861547F3;
	Wed,  4 Sep 2024 22:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ihmxw3ia"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7488B1474BF;
	Wed,  4 Sep 2024 22:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725488181; cv=none; b=DXDVInmnEA9czJLHa8YEdLTc/qAf3JnMifYuJhJAgFdOffy1LYus1cqgfAZ432inI9yet4ym6SrbQKh4n3gsmsHZ45CJKQD3/azyYkG4PfHvVYr1N0od42CmfGTsO6ANvUtfxQIIFMqXZfkCgxWRAtUoMWts0DN0eGkL4Oc2L7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725488181; c=relaxed/simple;
	bh=ftAkyDEt/MMPjMylW/avlTGRO/DeQ1Lhu5d8hA4qfrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qDVTSpkTI9Blu1onQ6l5pWnCRh2xkmmPwJUXT3J4xr7DEve8o3h8yEPxd/BbrkPSyMR3Wu1pTVTveMxlHlyp7aacILidad25Loy81EX0pFfjtIywyOYNF0h0UG0bHsh9V/XFuIyiTWSv+JMcE9tY86zom2DVo7Y35vg9xJBb4rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ihmxw3ia; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484Knbrf009594;
	Wed, 4 Sep 2024 22:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h59VR1wPI3LrDYIAK4aFbXVtoBrSuEIUi90scl2kh+Q=; b=ihmxw3iaIFyfz5VI
	fnwva9tOuNjULEbGSGPnvlcnXCgC93iv4siyqJGOmVq0P5GUCd6BVfySYPb08RV/
	yo+nlsfI1VmnMgBA2nvGX9Iqxv3fuJd27lDMh1A32wx7NP1AWwKyc0ofkQz70fO1
	39sUMapMHsKRoCp71SmmmTR9PoPRZvadscJFkghFqXFb3AYaWkgICoZ5ge/JYucz
	FMBEDSM8abTr0tNar9lj8hun1URdtlX6Fuj1iJnKd/pwZsm3t5ipJYo22OqcOvis
	vpYIyRlnLv06Zy9JaXpiofVo1lOYJ69WS70S9wP16UiZXO1lwMfBoJynr7KuTZSY
	PfgbOg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt67480k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 22:16:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484MFxls003956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 22:15:59 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 15:15:59 -0700
Message-ID: <46ed2f2d-d748-42dd-b370-7e2be8d316ce@quicinc.com>
Date: Wed, 4 Sep 2024 15:15:58 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/21] drm/msm/dpu: Reserve resources for CWB
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, <quic_ebharadw@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-14-502b16ae2ebb@quicinc.com>
 <yohtzxysheoybac24hxil6zzzsqi4inx6oh6x7vaoj5lvtdf3u@vd5nax37ilqd>
 <a73def5c-46f6-4467-958d-20f28ce8ad2c@quicinc.com>
 <CAA8EJppTqdCvaxBwretFVM6wV-NOLpxNGJCyxO8EXvvqZXF=sw@mail.gmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAA8EJppTqdCvaxBwretFVM6wV-NOLpxNGJCyxO8EXvvqZXF=sw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TqcBw4hgj1QBNnKQa0sn-4KJX8vaXzzI
X-Proofpoint-GUID: TqcBw4hgj1QBNnKQa0sn-4KJX8vaXzzI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_20,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040169



On 8/30/2024 3:27 PM, Dmitry Baryshkov wrote:
> On Fri, 30 Aug 2024 at 23:28, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>> On 8/30/2024 10:25 AM, Dmitry Baryshkov wrote:
>>> On Thu, Aug 29, 2024 at 01:48:35PM GMT, Jessica Zhang wrote:
>>>> Reserve dedicated pingpong blocks for CWB
>>>
>>> Please explain design ideas. Having just a single phrase is usually not
>>> enough.
>>>
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 ++++++--
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 65 +++++++++++++++++++++++++++++
>>>>    3 files changed, 79 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> index 36b677cf9c7a..f1bd14d1f89e 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> @@ -2,7 +2,7 @@
>>>>    /*
>>>>     * Copyright (C) 2013 Red Hat
>>>>     * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
>>>> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>     *
>>>>     * Author: Rob Clark <robdclark@gmail.com>
>>>>     */
>>>> @@ -1054,6 +1054,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>>       struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>>>>       struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
>>>>       int num_pp, num_dsc;
>>>> +    bool is_cwb_encoder;
>>>>       unsigned int dsc_mask = 0;
>>>>       int i;
>>>>
>>>> @@ -1067,6 +1068,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>>
>>>>       priv = drm_enc->dev->dev_private;
>>>>       dpu_kms = to_dpu_kms(priv->kms);
>>>> +    is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
>>>> +            dpu_enc->disp_info.intf_type == INTF_WB;
>>>>
>>>>       global_state = dpu_kms_get_existing_global_state(dpu_kms);
>>>>       if (IS_ERR_OR_NULL(global_state)) {
>>>> @@ -1077,9 +1080,15 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>>       trace_dpu_enc_mode_set(DRMID(drm_enc));
>>>>
>>>>       /* Query resource that have been reserved in atomic check step. */
>>>> -    num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>>> -            drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
>>>> -            ARRAY_SIZE(hw_pp));
>>>> +    if (is_cwb_encoder)
>>>> +            num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>>> +                    drm_enc->crtc, DPU_HW_BLK_DCWB_PINGPONG, hw_pp,
>>>> +                    ARRAY_SIZE(hw_pp));
>>>> +    else
>>>> +            num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>>> +                    drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
>>>> +                    ARRAY_SIZE(hw_pp));
>>>
>>> Why is this necessary? Can we still use DPU_HW_BLK_PINGPONG?
>>
>> Hi Dmitry,
>>
>> Since both regular non-cwb pingpongs and pingpongs dedicated for cwb
>> both share the same pingpong_to_crtc_id map, I need a way to distinguish
>> between the real-time and dedicated cwb pingpongs.
>>
>> If I don't do that, get_assigned_resources would populate the hw_pp
>> array for both the real-time and WB encoders with *only* the real-time
>> display pingpongs.
> 
> I see. It looks like PINGPONG blocks should be allocated / filled
> per-encoder, not per-CRTC. Likewise CDM is encoder-specific, not
> CRTC-specific.
> Does that solve the issue?

As discussed offline, let's keep all resources allocated per-CRTC

> 
>>
>>>
>>>> +
>>>>       dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>>>                       drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>> index c43cb55fe1d2..c87790a1b940 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>> @@ -77,6 +77,7 @@ enum dpu_hw_blk_type {
>>>>       DPU_HW_BLK_LM,
>>>>       DPU_HW_BLK_CTL,
>>>>       DPU_HW_BLK_PINGPONG,
>>>> +    DPU_HW_BLK_DCWB_PINGPONG,
>>>>       DPU_HW_BLK_INTF,
>>>>       DPU_HW_BLK_WB,
>>>>       DPU_HW_BLK_DSPP,
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>> index 13f84375e15d..afad26556cd5 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>> @@ -236,6 +236,48 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
>>>>       return -EINVAL;
>>>>    }
>>>>
>>>> +static int _dpu_rm_reserve_cwb_pingpong(struct dpu_rm *rm,
>>>> +            struct dpu_global_state *global_state, uint32_t crtc_id,
>>>> +            struct msm_display_topology *topology)
>>>> +{
>>>> +    int num_cwb_pp = topology->num_lm, cwb_pp_count = 0;
>>>> +    int cwb_pp_idx[MAX_BLOCKS];
>>>> +
>>>> +    /*
>>>> +     * Reserve additional dedicated CWB pingpong blocks for each mixer
>>>> +     *
>>>> +     * TODO: add support for reserving non-dedicated CWB pingpong blocks
>>>> +     */
>>>> +    for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
>>>> +                    cwb_pp_count < num_cwb_pp; i++) {
>>>> +            for (int j = PINGPONG_CWB_0 - PINGPONG_0;
>>>> +                            j < ARRAY_SIZE(rm->pingpong_blks); j++) {
>>>
>>> Alignment...
>>
>> Ack -- for future reference, should I always align the second line with
>> the bracket of the previous line?
>>
>> I thought the general guideline was 2 tabs, but I might be misremembering.
> 
> I can't find the textual reference, however .clang-format in the root
> dir has 'AlignAfterOpenBracket: Align'. I'm more or less ignorant for
> the function argument alignment (especially if an old function is
> being modified), but aligning the conditions and loops makes it easier
> to read the code.

Ah, got it. I'll configure my editor to keep to these guidelines then.

Thanks,

Jessica Zhang

> 
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>>
>>>> +                    /*
>>>> +                     * Odd LMs must be assigned to odd pingpongs and even
>>>> +                     * LMs with even pingpongs
>>>> +                     */
>>>> +                    if (reserved_by_other(global_state->pingpong_to_crtc_id,
>>>> +                                            j, crtc_id) ||
>>>> +                                    i % 2 != j % 2)
>>>> +                            continue;
>>>> +
>>>> +                    cwb_pp_idx[cwb_pp_count] = j;
>>>> +                    cwb_pp_count++;
>>>> +                    break;
>>>> +            }
>>>> +    }
>>>> +
>>>> +    if (cwb_pp_count != num_cwb_pp) {
>>>> +            DPU_ERROR("Unable to reserve all cwb pingpongs\n");
>>>> +            return -ENAVAIL;
>>>> +    }
>>>> +
>>>> +    for (int i = 0; i < cwb_pp_count; i++)
>>>> +            global_state->pingpong_to_crtc_id[cwb_pp_idx[i]] = crtc_id;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    /**
>>>>     * _dpu_rm_check_lm_and_get_connected_blks - check if proposed layer mixer meets
>>>>     * proposed use case requirements, incl. hardwired dependent blocks like
>>>> @@ -617,6 +659,14 @@ static int _dpu_rm_make_reservation(
>>>>               return ret;
>>>>       }
>>>>
>>>> +    if (topology->cwb_enabled) {
>>>> +            ret = _dpu_rm_reserve_cwb_pingpong(rm, global_state,
>>>> +                            crtc_id, topology);
>>>> +            if (ret) {
>>>> +                    DPU_ERROR("unable to find appropriate dcwb pingpongs\n");
>>>> +                    return ret;
>>>> +            }
>>>> +    }
>>>>
>>>>       ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
>>>>                       topology);
>>>> @@ -706,6 +756,7 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>>>>
>>>>       switch (type) {
>>>>       case DPU_HW_BLK_PINGPONG:
>>>> +    case DPU_HW_BLK_DCWB_PINGPONG:
>>>>               hw_blks = rm->pingpong_blks;
>>>>               hw_to_crtc_id = global_state->pingpong_to_crtc_id;
>>>>               max_blks = ARRAY_SIZE(rm->pingpong_blks);
>>>> @@ -745,6 +796,20 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>>>>               if (hw_to_crtc_id[i] != crtc_id)
>>>>                       continue;
>>>>
>>>> +            if (type == DPU_HW_BLK_PINGPONG) {
>>>> +                    struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
>>>> +
>>>> +                    if (pp->idx >= PINGPONG_CWB_0)
>>>> +                            continue;
>>>> +            }
>>>> +
>>>> +            if (type == DPU_HW_BLK_DCWB_PINGPONG) {
>>>> +                    struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
>>>> +
>>>> +                    if (pp->idx < PINGPONG_CWB_0)
>>>> +                            continue;
>>>> +            }
>>>> +
>>>>               if (num_blks == blks_size) {
>>>>                       DPU_ERROR("More than %d resources assigned to crtc %d\n",
>>>>                                 blks_size, crtc_id);
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>>> --
>>> With best wishes
>>> Dmitry
> 
> 
> 
> -- 
> With best wishes
> Dmitry
> 
> On Fri, 30 Aug 2024 at 23:28, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>>
>>
>> On 8/30/2024 10:25 AM, Dmitry Baryshkov wrote:
>>> On Thu, Aug 29, 2024 at 01:48:35PM GMT, Jessica Zhang wrote:
>>>> Reserve dedicated pingpong blocks for CWB
>>>
>>> Please explain design ideas. Having just a single phrase is usually not
>>> enough.
>>>
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 ++++++--
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 65 +++++++++++++++++++++++++++++
>>>>    3 files changed, 79 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> index 36b677cf9c7a..f1bd14d1f89e 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> @@ -2,7 +2,7 @@
>>>>    /*
>>>>     * Copyright (C) 2013 Red Hat
>>>>     * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
>>>> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>     *
>>>>     * Author: Rob Clark <robdclark@gmail.com>
>>>>     */
>>>> @@ -1054,6 +1054,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>>       struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>>>>       struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
>>>>       int num_pp, num_dsc;
>>>> +    bool is_cwb_encoder;
>>>>       unsigned int dsc_mask = 0;
>>>>       int i;
>>>>
>>>> @@ -1067,6 +1068,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>>
>>>>       priv = drm_enc->dev->dev_private;
>>>>       dpu_kms = to_dpu_kms(priv->kms);
>>>> +    is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
>>>> +            dpu_enc->disp_info.intf_type == INTF_WB;
>>>>
>>>>       global_state = dpu_kms_get_existing_global_state(dpu_kms);
>>>>       if (IS_ERR_OR_NULL(global_state)) {
>>>> @@ -1077,9 +1080,15 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>>       trace_dpu_enc_mode_set(DRMID(drm_enc));
>>>>
>>>>       /* Query resource that have been reserved in atomic check step. */
>>>> -    num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>>> -            drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
>>>> -            ARRAY_SIZE(hw_pp));
>>>> +    if (is_cwb_encoder)
>>>> +            num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>>> +                    drm_enc->crtc, DPU_HW_BLK_DCWB_PINGPONG, hw_pp,
>>>> +                    ARRAY_SIZE(hw_pp));
>>>> +    else
>>>> +            num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>>> +                    drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
>>>> +                    ARRAY_SIZE(hw_pp));
>>>
>>> Why is this necessary? Can we still use DPU_HW_BLK_PINGPONG?
>>
>> Hi Dmitry,
>>
>> Since both regular non-cwb pingpongs and pingpongs dedicated for cwb
>> both share the same pingpong_to_crtc_id map, I need a way to distinguish
>> between the real-time and dedicated cwb pingpongs.
>>
>> If I don't do that, get_assigned_resources would populate the hw_pp
>> array for both the real-time and WB encoders with *only* the real-time
>> display pingpongs.
>>
>>>
>>>> +
>>>>       dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>>>                       drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>> index c43cb55fe1d2..c87790a1b940 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>> @@ -77,6 +77,7 @@ enum dpu_hw_blk_type {
>>>>       DPU_HW_BLK_LM,
>>>>       DPU_HW_BLK_CTL,
>>>>       DPU_HW_BLK_PINGPONG,
>>>> +    DPU_HW_BLK_DCWB_PINGPONG,
>>>>       DPU_HW_BLK_INTF,
>>>>       DPU_HW_BLK_WB,
>>>>       DPU_HW_BLK_DSPP,
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>> index 13f84375e15d..afad26556cd5 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>> @@ -236,6 +236,48 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
>>>>       return -EINVAL;
>>>>    }
>>>>
>>>> +static int _dpu_rm_reserve_cwb_pingpong(struct dpu_rm *rm,
>>>> +            struct dpu_global_state *global_state, uint32_t crtc_id,
>>>> +            struct msm_display_topology *topology)
>>>> +{
>>>> +    int num_cwb_pp = topology->num_lm, cwb_pp_count = 0;
>>>> +    int cwb_pp_idx[MAX_BLOCKS];
>>>> +
>>>> +    /*
>>>> +     * Reserve additional dedicated CWB pingpong blocks for each mixer
>>>> +     *
>>>> +     * TODO: add support for reserving non-dedicated CWB pingpong blocks
>>>> +     */
>>>> +    for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
>>>> +                    cwb_pp_count < num_cwb_pp; i++) {
>>>> +            for (int j = PINGPONG_CWB_0 - PINGPONG_0;
>>>> +                            j < ARRAY_SIZE(rm->pingpong_blks); j++) {
>>>
>>> Alignment...
>>
>> Ack -- for future reference, should I always align the second line with
>> the bracket of the previous line?
>>
>> I thought the general guideline was 2 tabs, but I might be misremembering.
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>>
>>>> +                    /*
>>>> +                     * Odd LMs must be assigned to odd pingpongs and even
>>>> +                     * LMs with even pingpongs
>>>> +                     */
>>>> +                    if (reserved_by_other(global_state->pingpong_to_crtc_id,
>>>> +                                            j, crtc_id) ||
>>>> +                                    i % 2 != j % 2)
>>>> +                            continue;
>>>> +
>>>> +                    cwb_pp_idx[cwb_pp_count] = j;
>>>> +                    cwb_pp_count++;
>>>> +                    break;
>>>> +            }
>>>> +    }
>>>> +
>>>> +    if (cwb_pp_count != num_cwb_pp) {
>>>> +            DPU_ERROR("Unable to reserve all cwb pingpongs\n");
>>>> +            return -ENAVAIL;
>>>> +    }
>>>> +
>>>> +    for (int i = 0; i < cwb_pp_count; i++)
>>>> +            global_state->pingpong_to_crtc_id[cwb_pp_idx[i]] = crtc_id;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    /**
>>>>     * _dpu_rm_check_lm_and_get_connected_blks - check if proposed layer mixer meets
>>>>     * proposed use case requirements, incl. hardwired dependent blocks like
>>>> @@ -617,6 +659,14 @@ static int _dpu_rm_make_reservation(
>>>>               return ret;
>>>>       }
>>>>
>>>> +    if (topology->cwb_enabled) {
>>>> +            ret = _dpu_rm_reserve_cwb_pingpong(rm, global_state,
>>>> +                            crtc_id, topology);
>>>> +            if (ret) {
>>>> +                    DPU_ERROR("unable to find appropriate dcwb pingpongs\n");
>>>> +                    return ret;
>>>> +            }
>>>> +    }
>>>>
>>>>       ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
>>>>                       topology);
>>>> @@ -706,6 +756,7 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>>>>
>>>>       switch (type) {
>>>>       case DPU_HW_BLK_PINGPONG:
>>>> +    case DPU_HW_BLK_DCWB_PINGPONG:
>>>>               hw_blks = rm->pingpong_blks;
>>>>               hw_to_crtc_id = global_state->pingpong_to_crtc_id;
>>>>               max_blks = ARRAY_SIZE(rm->pingpong_blks);
>>>> @@ -745,6 +796,20 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>>>>               if (hw_to_crtc_id[i] != crtc_id)
>>>>                       continue;
>>>>
>>>> +            if (type == DPU_HW_BLK_PINGPONG) {
>>>> +                    struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
>>>> +
>>>> +                    if (pp->idx >= PINGPONG_CWB_0)
>>>> +                            continue;
>>>> +            }
>>>> +
>>>> +            if (type == DPU_HW_BLK_DCWB_PINGPONG) {
>>>> +                    struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
>>>> +
>>>> +                    if (pp->idx < PINGPONG_CWB_0)
>>>> +                            continue;
>>>> +            }
>>>> +
>>>>               if (num_blks == blks_size) {
>>>>                       DPU_ERROR("More than %d resources assigned to crtc %d\n",
>>>>                                 blks_size, crtc_id);
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>>> --
>>> With best wishes
>>> Dmitry
> 
> 
> 
> -- 
> With best wishes
> Dmitry

