Return-Path: <linux-arm-msm+bounces-31145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A6296F9A6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 18:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6D3CB21792
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 16:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85D31D4611;
	Fri,  6 Sep 2024 16:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KgTpVP7V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BC71D47D9;
	Fri,  6 Sep 2024 16:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725641629; cv=none; b=Ne9cQeahJct2/tmOlVcSsNiFJR31OlLsOLOMo6m7DWeThbBJB8Y3bfzf9VH3h5lCHPfXejlslJKKACJn2Uk7WDP0e7wl4/xu6zNFfldWcLImRayhD8nNWNUm1fWzhbWPzhvK5P7oH45bAqGZyJLwsH8gVo+H+XWZdKaDxghRHVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725641629; c=relaxed/simple;
	bh=nhEVNGbacLPLBlqIBqf1naYSFGGM99NT5JLRhaXThdY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=r6on/n90DBr0aqq4cWiCRsg4jmtg3vFp8ii49oIdvCm8bVlykLq3KGHksZWTybNteOtWDkMudxE5yQ3qwqxZthLb3lLMUeAaGFcPO4FMTYKnYAkGU37VZdJApQlS6iN9vvS9inAF988E8uws16fjJ0pApsb0wxZB21oWKPCBDn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KgTpVP7V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4869FvF5024652;
	Fri, 6 Sep 2024 16:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LQZIsTMcIZYlRIfIXwB/56IGDRZ1/2+NkCdoONYJ7KU=; b=KgTpVP7V9pr8ndsF
	yxp/az/oiWDejvvaf903Y8y70L7DPc2oLIRZOjFpkS8TB8EVQexeuRcnJYjqqHn9
	4k7dJtU+jbvViCAPzAWeadRIHXcKEwG27/SrzAPisfuKJtNPGR4DT0FOo1lXXy0k
	ARFms/b9Wbc9A5bhqU7yZx5uT1pQGIivPBLeNOMwACpLw2Xae6agZ0xVENAbTv26
	00u+xe3h/4mmwDM5887VcJ7r9KIIyHaFUkkkg4e1QVOMIyzOGhsH2TEZmrBBFujf
	upySTDK1UNY6PW/5W/ExI8XcTj8MfyawxYkNkBODSViN76L98tSzAhdrK/ZhY/Q7
	cwYKcw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fj03av58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 16:53:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486GrWv1031606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 16:53:32 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 09:53:26 -0700
Message-ID: <3c9a6196-ad51-4ed5-b242-cc1e0eec42fc@quicinc.com>
Date: Fri, 6 Sep 2024 09:53:13 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 11/21] drm/msm/dpu: Add RM support for allocating CWB
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
 <20240829-concurrent-wb-v1-11-502b16ae2ebb@quicinc.com>
 <pf6xgu7yjanzjigfpupons4ud6jbcmbr5icnd7yur6qhh3n5sf@plj4bi3beguw>
 <665da6e9-d9f3-4a28-a53b-0f467967fc78@quicinc.com>
 <CAA8EJpo0X7yRaqYV-tTco9+9WyexiPN_ey8hKivFrE3jTojUpg@mail.gmail.com>
 <0e5dc874-0b50-4a6b-ba98-83cb01f7cce6@quicinc.com>
 <7ya6xrvbhdqddkglzzj6mtdxn735j56quguhohd5oid7vqut2w@wygb7ryzkj4r>
Content-Language: en-US
In-Reply-To: <7ya6xrvbhdqddkglzzj6mtdxn735j56quguhohd5oid7vqut2w@wygb7ryzkj4r>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qqJpHwI-Rw8NHQg8io6pHKJwtKz4o_TK
X-Proofpoint-ORIG-GUID: qqJpHwI-Rw8NHQg8io6pHKJwtKz4o_TK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_03,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409060123



On 9/5/2024 6:30 AM, Dmitry Baryshkov wrote:
> On Tue, Sep 03, 2024 at 06:04:13PM GMT, Jessica Zhang wrote:
>>
>>
>> On 8/30/2024 3:16 PM, Dmitry Baryshkov wrote:
>>> On Fri, 30 Aug 2024 at 22:28, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 8/30/2024 10:18 AM, Dmitry Baryshkov wrote:
>>>>> On Thu, Aug 29, 2024 at 01:48:32PM GMT, Jessica Zhang wrote:
>>>>>> Add support for allocating the concurrent writeback mux as part of the
>>>>>> WB allocation
>>>>>>
>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  5 ++++-
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 30 +++++++++++++++++++++++++++--
>>>>>>     2 files changed, 32 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>>>> index c17d2d356f7a..c43cb55fe1d2 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>>>> @@ -1,5 +1,7 @@
>>>>>>     /* SPDX-License-Identifier: GPL-2.0-only */
>>>>>> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>>>>> +/*
>>>>>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>>>>>      */
>>>>>>
>>>>>>     #ifndef _DPU_HW_MDSS_H
>>>>>> @@ -352,6 +354,7 @@ struct dpu_mdss_color {
>>>>>>     #define DPU_DBG_MASK_DSPP     (1 << 10)
>>>>>>     #define DPU_DBG_MASK_DSC      (1 << 11)
>>>>>>     #define DPU_DBG_MASK_CDM      (1 << 12)
>>>>>> +#define DPU_DBG_MASK_CWB      (1 << 13)
>>>>>>
>>>>>>     /**
>>>>>>      * struct dpu_hw_tear_check - Struct contains parameters to configure
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>>> index bc99b04eae3a..738e9a081b10 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>>> @@ -1,9 +1,10 @@
>>>>>>     // SPDX-License-Identifier: GPL-2.0-only
>>>>>>     /*
>>>>>>      * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>>>>>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>>      */
>>>>>>
>>>>>> +#include <drm/drm_managed.h>
>>>>>>     #include "msm_drv.h"
>>>>>>     #define pr_fmt(fmt)        "[drm:%s] " fmt, __func__
>>>>>>     #include "dpu_kms.h"
>>>>>> @@ -34,6 +35,7 @@ int dpu_rm_init(struct drm_device *dev,
>>>>>>                void __iomem *mmio)
>>>>>>     {
>>>>>>        int rc, i;
>>>>>> +    struct dpu_hw_blk_reg_map *cwb_reg_map;
>>>>>>
>>>>>>        if (!rm || !cat || !mmio) {
>>>>>>                DPU_ERROR("invalid kms\n");
>>>>>> @@ -100,11 +102,35 @@ int dpu_rm_init(struct drm_device *dev,
>>>>>>                rm->hw_intf[intf->id - INTF_0] = hw;
>>>>>>        }
>>>>>>
>>>>>> +    if (cat->cwb_count > 0) {
>>>>>> +            cwb_reg_map = drmm_kzalloc(dev,
>>>>>> +                            sizeof(*cwb_reg_map) * cat->cwb_count,
>>>>>> +                            GFP_KERNEL);
>>>>>
>>>>> Please move CWB block pointers to dpu_rm. There is no need to allocate a
>>>>> separate array.
>>>>
>>>> Hi Dmitry,
>>>>
>>>> Sorry, I'm not sure what you mean here. Can you clarify your comment?
>>>>
>>>> This is just allocating an array of the CWB register addresses so that
>>>> the hw_wb block can use it to configure the CWB mux registers.
>>>
>>> Excuse me. I asked to make the cwb_reg_map array a part of the
>>> existing dpu_rm structure. This way other subblocks can access it
>>> through dpu_rm API.
>>
>> Got it, thanks for the clarification. Just wondering, is the intent here to
>> add CWB to rm's get_assigned_resourced?
>>
>> The CWB registers will be handled by hw_wb and isn't referenced anywhere
>> outside of hw_wb (aside from when it's being allocated and passed into
>> hw_wb_init) so I'm not sure what's the benefit of adding it to the dpu_rm
>> struct.
> 
> To have a single point where all the blocks are handled, pretty much
> like we have a single catalog where all blocks are allocated. Note how
> e.g. how MERGE_3D is handled. Or how we return harware instances for
> INTF or WB.

Got it, seems like you're leaning towards having CWB as a completely 
independent hardware block with its own dpu_hw_cwb file and struct.

FWIW, we did consider this approach at the very beginning, but decided 
to go with having the CWB registers configured by dpu_hw_wb under the 
hood because we thought it would be overkill to create a completely new 
struct just to program 2 registers via 1 function op.

We ended up adding the CWB mux programming to dpu_hw_wb because CWB is 
closely tied with WB and it mirrored how downstream code was programming 
CWB mux [1]

If you prefer to have CWB mux completely independent, I can switch to 
that instead.

[1] 
https://android.googlesource.com/kernel/msm-extra/display-drivers/+/e18d8e759a344ad4d86b31bbf8160cfe4c65b772/msm/sde/sde_hw_wb.c#265

> 
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>> Jessica Zhang
>>>>
>>>>>
>>>>>> +
>>>>>> +            if (!cwb_reg_map) {
>>>>>> +                    DPU_ERROR("failed cwb object creation\n");
>>>>>> +                    return -ENOMEM;
>>>>>> +            }
>>>>>> +    }
>>>>>> +
>>>>>> +
>>>>>> +    for (i = 0; i < cat->cwb_count; i++) {
>>>>>> +            struct dpu_hw_blk_reg_map *cwb = &cwb_reg_map[i];
>>>>>> +
>>>>>> +            cwb->blk_addr = mmio + cat->cwb[i].base;
>>>>>> +            cwb->log_mask = DPU_DBG_MASK_CWB;
>>>>>> +    }
>>>>>> +
>>>>>>        for (i = 0; i < cat->wb_count; i++) {
>>>>>>                struct dpu_hw_wb *hw;
>>>>>>                const struct dpu_wb_cfg *wb = &cat->wb[i];
>>>>>>
>>>>>> -            hw = dpu_hw_wb_init(dev, wb, mmio, cat->mdss_ver);
>>>>>> +            if (cat->cwb)
>>>>>> +                    hw = dpu_hw_wb_init_with_cwb(dev, wb, mmio,
>>>>>> +                                    cat->mdss_ver, cwb_reg_map);
>>>>>> +            else
>>>>>> +                    hw = dpu_hw_wb_init(dev, wb, mmio, cat->mdss_ver);
>>>>>> +
>>>>>>                if (IS_ERR(hw)) {
>>>>>>                        rc = PTR_ERR(hw);
>>>>>>                        DPU_ERROR("failed wb object creation: err %d\n", rc);
>>>>>>
>>>>>> --
>>>>>> 2.34.1
>>>>>>
>>>>>
>>>>> --
>>>>> With best wishes
>>>>> Dmitry
>>>
>>>
>>>
>>> -- 
>>> With best wishes
>>> Dmitry
> 
> -- 
> With best wishes
> Dmitry

