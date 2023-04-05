Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7586D6D8B1E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 01:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjDEXey (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 19:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbjDEXeu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 19:34:50 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9062A30DF
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 16:34:42 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 335K5jjB012114;
        Wed, 5 Apr 2023 23:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fFHXMKsRvtEiiWz8rpnDkePmOJZ/Ld4AQSOVjOh9NKQ=;
 b=TGYMslcgsC45aseK3JWzLPTZoih5bbMOw9zzfaLweYD4lo3d8Hx2UmuhlZ72qtY0qCxQ
 e+SWWMMk/woR3kyw3UWIO7IAAtgq/u8n2ZVzpG9a4n3WmNV/9CTlPlIgv9g9UOOCeuk9
 m6HN/mbyCyi5FgBoM2ayUPAxZZ976LiVmV+3lnFIvrGFtTrkr4fyqLAlWU2tKxs85iRV
 umvxnAIU5m0P8VvpGARgTCNLPrX26ZBVH3Xtc0Ty1wwZV+7YyIdtBDxp3NYAnqqlfgVb
 tzAFwcBTaxvKS+lxWyJP/wB1eKst0yjMQox1OPzmjlXA6lSv/U6yMcLbI+m8fpJbNgHS 2Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prgvevwut-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Apr 2023 23:34:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 335NYDEN020092
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 5 Apr 2023 23:34:13 GMT
Received: from [10.110.59.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 5 Apr 2023
 16:34:12 -0700
Message-ID: <c49756fb-75d3-45b4-f78c-2e2e18f71821@quicinc.com>
Date:   Wed, 5 Apr 2023 16:34:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 1/6] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        <freedreno@lists.freedesktop.org>
CC:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
References: <20230329-rfc-msm-dsc-helper-v4-0-1b79c78b30d7@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v4-1-1b79c78b30d7@quicinc.com>
 <dd8dcaf7-acc0-69cc-9c7e-bcbd270fb845@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <dd8dcaf7-acc0-69cc-9c7e-bcbd270fb845@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 02XLYTLm8CqVKAtdgRVZNi_Zfh_ZVb8Z
X-Proofpoint-GUID: 02XLYTLm8CqVKAtdgRVZNi_Zfh_ZVb8Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=840
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304050211
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/5/2023 12:26 PM, Dmitry Baryshkov wrote:
> On 05/04/2023 03:41, Jessica Zhang wrote:
>> Introduce MSM-specific DSC helper methods, as some calculations are
>> common between DP and DSC.
>>
>> Changes in v2:
>> - Moved files up to msm/ directory
>> - Dropped get_comp_ratio() helper
>> - Used drm_int2fixp() to convert to integers to fp
>> - Style changes to improve readability
>> - Dropped unused bpp variable in msm_dsc_get_dce_bytes_per_line()
>> - Changed msm_dsc_get_slice_per_intf() to a static inline method
>> - Dropped last division step of msm_dsc_get_pclk_per_line() and changed
>>    method name accordingly
>> - Changed DSC_BPP macro to drm_dsc_get_bpp_int() helper method
>> - Fixed some math issues caused by passing in incorrect types to
>>    drm_fixed methods in get_bytes_per_soft_slice()
>>
>> Changes in v3:
>> - Dropped src_bpp parameter from all methods -- src_bpp can be
>>    calculated as dsc->bits_per_component * 3
>> - Dropped intf_width parameter from get_bytes_per_soft_slice()
>> - Moved dsc->bits_per_component to numerator calculation in
>>    get_bytes_per_soft_slice()
>> - Renamed msm_dsc_get_uncompressed_pclk_per_line to
>>    *_get_uncompressed_pclk_per_intf()
>> - Removed dsc->slice_width check from
>>    msm_dsc_get_uncompressed_pclk_per_intf()
>> - Made get_bytes_per_soft_slice() a public method (this will be called
>>    later to help calculate DP pclk params)
>> - Added documentation in comments
>> - Moved extra_eol_bytes math out of msm_dsc_get_eol_byte_num() and
>>    renamed msm_dsc_get_eol_byte_num to *_get_bytes_per_intf.
>>
>> Changes in v4:
>> - Changed msm_dsc_get_uncompressed_pclk_per_intf to
>>    msm_dsc_get_pclk_per_intf
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/Makefile         |  1 +
>>   drivers/gpu/drm/msm/msm_dsc_helper.c | 47 ++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/msm_dsc_helper.h | 70 
>> ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 118 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>> index 7274c41228ed..b814fc80e2d5 100644
>> --- a/drivers/gpu/drm/msm/Makefile
>> +++ b/drivers/gpu/drm/msm/Makefile
>> @@ -94,6 +94,7 @@ msm-y += \
>>       msm_atomic_tracepoints.o \
>>       msm_debugfs.o \
>>       msm_drv.o \
>> +    msm_dsc_helper.o \
>>       msm_fb.o \
>>       msm_fence.o \
>>       msm_gem.o \
>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.c 
>> b/drivers/gpu/drm/msm/msm_dsc_helper.c
>> new file mode 100644
>> index 000000000000..0539221eb09d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
>> @@ -0,0 +1,47 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>> reserved
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/errno.h>
>> +#include <drm/drm_fixed.h>
>> +
>> +#include "msm_drv.h"
>> +#include "msm_dsc_helper.h"
>> +
>> +s64 get_bytes_per_soft_slice(struct drm_dsc_config *dsc)
>> +{
>> +    int bpp = msm_dsc_get_bpp_int(dsc);
>> +    s64 numerator_fp, denominator_fp;
>> +    s64 comp_ratio_fp = 
>> drm_fixp_from_fraction(dsc->bits_per_component * 3, bpp);
>> +
>> +    numerator_fp = drm_int2fixp(dsc->slice_width * 3 * 
>> dsc->bits_per_component);
>> +    denominator_fp = drm_fixp_mul(comp_ratio_fp, drm_int2fixp(8));
>> +
>> +    return drm_fixp_div(numerator_fp, denominator_fp);
> 
> If we remove 3 * dsc->bits_per_components from both numerator and 
> denominator, this whole function seems to be as simple as 
> DIV_ROUND_UP(dsc->slice_width * bpp, 8)
> 
> Or, if you prefer FP math, drm_fixp_from_fraction(dsc->slice_width * 
> bpp, 8).
> 

True and thats not really surprising because bytes_per_soft_slice is 
eventually (dsc->slice_width * bpp, 8)

I also thought about it after you mentioned that they will cancel out 
then why was downstream code and our programming guide doing this way.

So i thought a bit more and the reason from what I can see is that its 
showing that compression ratio was factored into the math while 
calculating it. If we just go with (dsc->slice_width * bpp, 8), it does 
not really show that this was actually compressed bytes per slice 
leading to the earlier confusion that it was uncompressed pclk while it 
actually was.

>> +}
>> +
>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int 
>> intf_width)
>> +{
>> +    u32 bytes_per_soft_slice, bytes_per_intf;
>> +    s64 bytes_per_soft_slice_fp;
>> +    int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
>> +
>> +    bytes_per_soft_slice_fp = get_bytes_per_soft_slice(dsc);
>> +    bytes_per_soft_slice = drm_fixp2int_ceil(bytes_per_soft_slice_fp);
>> +
>> +    bytes_per_intf = bytes_per_soft_slice * slice_per_intf;
>> +
>> +    return bytes_per_intf;
>> +}
>> +
>> +int msm_dsc_get_pclk_per_intf(struct drm_dsc_config *dsc)
>> +{
>> +    s64 data_width;
>> +
>> +    data_width = drm_fixp_mul(drm_int2fixp(dsc->slice_count),
>> +            get_bytes_per_soft_slice(dsc));
> 
> And this is then DIV_ROUND_UP(dsc->slice_width * dsc->slice_count * bpp, 8)
> 
>> +
>> +    return drm_fixp2int_ceil(data_width);
>> +}
>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h 
>> b/drivers/gpu/drm/msm/msm_dsc_helper.h
>> new file mode 100644
>> index 000000000000..31116a31090f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
>> @@ -0,0 +1,70 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>> reserved
>> + */
>> +
>> +#ifndef MSM_DSC_HELPER_H_
>> +#define MSM_DSC_HELPER_H_
>> +
>> +#include <drm/display/drm_dsc_helper.h>
>> +#include <drm/drm_modes.h>
>> +
>> +/*
>> + * Helper methods for MSM specific DSC calculations that are common 
>> between timing engine,
>> + * DSI, and DP.
>> + */
>> +
>> +/**
>> + * msm_dsc_get_bpp_int - get bits per pixel integer value
>> + * @dsc: Pointer to drm dsc config struct
>> + */
>> +static inline int msm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
>> +{
>> +    WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
>> +    return dsc->bits_per_pixel >> 4;
>> +}
>> +
>> +/**
>> + * msm_dsc_get_slice_per_intf - get number of slices per interface
>> + * @dsc: Pointer to drm dsc config struct
>> + * @intf_width: interface width
>> + */
>> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config 
>> *dsc, int intf_width)
>> +{
>> +    return DIV_ROUND_UP(intf_width, dsc->slice_width);
>> +}
>> +
>> +/**
>> + * msm_dsc_get_dce_bytes_per_line - get bytes per line to help 
>> calculate data width
>> + *    when configuring the timing engine
>> + * @dsc: Pointer to drm dsc config struct
>> + * @intf_width: interface width
>> + */
>> +static inline u32 msm_dsc_get_dce_bytes_per_line(struct 
>> drm_dsc_config *dsc, int intf_width)
>> +{
>> +    return DIV_ROUND_UP(msm_dsc_get_bpp_int(dsc) * intf_width, 8);
>> +}
>> +
>> +/**
>> + * get_bytes_per_soft_slice - get size of each soft slice for dsc
>> + * @dsc: Pointer to drm dsc config struct
>> + */
>> +s64 get_bytes_per_soft_slice(struct drm_dsc_config *dsc);
>> +
>> +/**
>> + * msm_dsc_get_bytes_per_intf - get total bytes per interface
>> + * @dsc: Pointer to drm dsc config struct
>> + * @intf_width: interface width
>> + */
>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int 
>> intf_width);
>> +
>> +/**
>> + * msm_dsc_get_pclk_per_intf - Calculate pclk per interface.
>> + * @dsc: Pointer to drm dsc config struct
>> + *
>> + * Note: This value will then be passed along to DSI and DP for some 
>> more
>> + * calculations. This is because DSI and DP divide the pclk_per_intf 
>> value
>> + * by different values depending on if widebus is enabled.
>> + */
>> +int msm_dsc_get_pclk_per_intf(struct drm_dsc_config *dsc);
> 
> empty line, please
> 
>> +#endif /* MSM_DSC_HELPER_H_ */
>>
> 
