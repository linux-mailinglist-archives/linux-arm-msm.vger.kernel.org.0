Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0256E012F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 23:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjDLVup (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 17:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjDLVup (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 17:50:45 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6DA469D
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 14:50:43 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id i26so16908700lfc.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 14:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681336241; x=1683928241;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5eOT9e4/C9MFvuVw0SQZQGY7fHUyfQCXLAIJ6rvBi7M=;
        b=zDL49vgl5DP9nszNI6PUZIsUeTh8Da8ZSaKi4A9hjlw4LTs2f/RdpylIifkAZck9Vn
         sgG+Wlfr3Vo4ain32iPawGt2LpjnUhLM3f3jtkAK6RZbl/yy5AoFvKpv6bMRu5VABvXy
         Td5LbVLJOzGZhNpD69G3zFjBrVinc9afPbjHwdhGKPmPFHR7d/3UJeK+al3rRbSrNzHD
         6t+tGsJ8i3fCm9J7CU9YgU440DNyOkOAl4DZXwXZYSXErSwpwZpZ64mNWXIxnskFCPkB
         oWUZ9yl8INhMCQtjqDUdY0QcYV+H713BHyuhsiyuhEYck8Ag+t+OhhhmkTtMl1ib7SNQ
         mzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681336241; x=1683928241;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5eOT9e4/C9MFvuVw0SQZQGY7fHUyfQCXLAIJ6rvBi7M=;
        b=bk4SkGoyPtHKx1lhO4GZQaYU76i6nbow7Xz5i2e9k33f/kKwHqvd9MKfGHJU/zUJtV
         /th5INYVXkuFvQ/6poNCspC09RWaQOVKz6oUxPU703ftJGF/zrQDv9jTKtFUVw3gejBh
         9hrhC0dmu38ofGnN0ekw/L0KRecVqdfS74/ntG/k7d1QobOJOOBQjZB/J7M+0q5xaEft
         2+gx7dDp0vGCTJg4vtbFWWBmdoIcsSQOKIBAY3eFIFWgEHa01krunaQmGwWZxdzf1bwT
         v1eBo/2JM7JZgu57lz5YokbBCKB3zji3YoSnY+KkaFqxzfEyYAWw3OWeOEqElz03D59J
         iE8w==
X-Gm-Message-State: AAQBX9ekwhbLIPwk9eH5CyIu03x7630roYQnsBf/A2MDrmZcZ14eNvlQ
        jWS52Ok9XsDrcdZMxyQx+FpmVQ==
X-Google-Smtp-Source: AKy350YKu8hcHn2DkrNBUcgb6sbYl1GgvVCX9RFOrPbw7HgZ2BJJZVYaZCkgWL3u0kM/oqEtZpXbUw==
X-Received: by 2002:ac2:4c25:0:b0:4eb:44da:e85d with SMTP id u5-20020ac24c25000000b004eb44dae85dmr60103lfq.57.1681336241533;
        Wed, 12 Apr 2023 14:50:41 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id l17-20020a19c211000000b004dc721ea6a1sm3149027lfc.273.2023.04.12.14.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 14:50:41 -0700 (PDT)
Message-ID: <ec203372-979e-b5d6-ddfa-1255f2895717@linaro.org>
Date:   Thu, 13 Apr 2023 00:50:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 2/8] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v5-2-0108401d7886@quicinc.com>
 <24f68708-dc1a-59eb-ffdc-288c72b91da6@linaro.org>
 <be12f528-c9e1-311a-2b2e-d7774ff9b266@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <be12f528-c9e1-311a-2b2e-d7774ff9b266@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/04/2023 00:49, Jessica Zhang wrote:
> 
> 
> On 4/12/2023 12:16 PM, Dmitry Baryshkov wrote:
>> On 12/04/2023 22:09, Jessica Zhang wrote:
>>> Introduce MSM-specific DSC helper methods, as some calculations are
>>> common between DP and DSC.
>>>
>>> Changes in v2:
>>> - Moved files up to msm/ directory
>>> - Dropped get_comp_ratio() helper
>>> - Used drm_int2fixp() to convert to integers to fp
>>> - Style changes to improve readability
>>> - Dropped unused bpp variable in msm_dsc_get_dce_bytes_per_line()
>>> - Changed msm_dsc_get_slice_per_intf() to a static inline method
>>> - Dropped last division step of msm_dsc_get_pclk_per_line() and changed
>>>    method name accordingly
>>> - Changed DSC_BPP macro to drm_dsc_get_bpp_int() helper method
>>> - Fixed some math issues caused by passing in incorrect types to
>>>    drm_fixed methods in get_bytes_per_soft_slice()
>>>
>>> Changes in v3:
>>> - Dropped src_bpp parameter from all methods -- src_bpp can be
>>>    calculated as dsc->bits_per_component * 3
>>> - Dropped intf_width parameter from get_bytes_per_soft_slice()
>>> - Moved dsc->bits_per_component to numerator calculation in
>>>    get_bytes_per_soft_slice()
>>> - Renamed msm_dsc_get_uncompressed_pclk_per_line to
>>>    *_get_uncompressed_pclk_per_intf()
>>> - Removed dsc->slice_width check from
>>>    msm_dsc_get_uncompressed_pclk_per_intf()
>>> - Made get_bytes_per_soft_slice() a public method (this will be called
>>>    later to help calculate DP pclk params)
>>> - Added documentation in comments
>>> - Moved extra_eol_bytes math out of msm_dsc_get_eol_byte_num() and
>>>    renamed msm_dsc_get_eol_byte_num to *_get_bytes_per_intf.
>>>
>>> Changes in v4:
>>> - Changed msm_dsc_get_uncompressed_pclk_per_intf to
>>>    msm_dsc_get_pclk_per_intf
>>>
>>> Changes in v5:
>>> - Added extra line at end of msm_dsc_helper.h
>>> - Simplified msm_dsc_get_bytes_per_soft_slice() math
>>> - Simplified and inlined msm_dsc_get_pclk_per_intf() math
>>> - Removed unused headers
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/Makefile         |  1 +
>>>   drivers/gpu/drm/msm/msm_dsc_helper.c | 25 ++++++++++++
>>>   drivers/gpu/drm/msm/msm_dsc_helper.h | 75 
>>> ++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 101 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>>> index 7274c41228ed..b814fc80e2d5 100644
>>> --- a/drivers/gpu/drm/msm/Makefile
>>> +++ b/drivers/gpu/drm/msm/Makefile
>>> @@ -94,6 +94,7 @@ msm-y += \
>>>       msm_atomic_tracepoints.o \
>>>       msm_debugfs.o \
>>>       msm_drv.o \
>>> +    msm_dsc_helper.o \
>>>       msm_fb.o \
>>>       msm_fence.o \
>>>       msm_gem.o \
>>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.c 
>>> b/drivers/gpu/drm/msm/msm_dsc_helper.c
>>> new file mode 100644
>>> index 000000000000..a34614b8e131
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
>>> @@ -0,0 +1,25 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>> reserved
>>> + */
>>> +
>>> +#include <drm/drm_fixed.h>
>>> +
>>> +#include "msm_dsc_helper.h"
>>> +
>>> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc)
>>> +{
>>> +    return drm_fixp_from_fraction(dsc->slice_width * 
>>> msm_dsc_get_bpp_int(dsc), 8);
>>> +}
>>> +
>>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int 
>>> intf_width)
>>> +{
>>> +    u32 bytes_per_soft_slice;
>>> +    s64 bytes_per_soft_slice_fp;
>>> +    int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
>>> +
>>> +    bytes_per_soft_slice_fp = msm_dsc_get_bytes_per_soft_slice(dsc);
>>> +    bytes_per_soft_slice = drm_fixp2int_ceil(bytes_per_soft_slice_fp);
>>> +
>>> +    return bytes_per_soft_slice * slice_per_intf;
>>> +}
>>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h 
>>> b/drivers/gpu/drm/msm/msm_dsc_helper.h
>>> new file mode 100644
>>> index 000000000000..34238153ffdf
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
>>> @@ -0,0 +1,75 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>> reserved
>>> + */
>>> +
>>> +#ifndef MSM_DSC_HELPER_H_
>>> +#define MSM_DSC_HELPER_H_
>>> +
>>> +#include <linux/kernel.h>
>>> +#include <linux/bug.h>
>>> +#include <drm/display/drm_dsc_helper.h>
>>> +
>>> +/*
>>> + * Helper methods for MSM specific DSC calculations that are common 
>>> between timing engine,
>>> + * DSI, and DP.
>>> + */
>>> +
>>> +/**
>>> + * msm_dsc_get_bpp_int - get bits per pixel integer value
>>> + * @dsc: Pointer to drm dsc config struct
>>> + */
>>> +static inline int msm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
>>> +{
>>> +    WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
>>> +    return dsc->bits_per_pixel >> 4;
>>> +}
>>> +
>>> +/**
>>> + * msm_dsc_get_slice_per_intf - get number of slices per interface
>>> + * @dsc: Pointer to drm dsc config struct
>>> + * @intf_width: interface width
>>> + */
>>> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config 
>>> *dsc, int intf_width)
>>> +{
>>> +    return DIV_ROUND_UP(intf_width, dsc->slice_width);
>>> +}
>>> +
>>> +/**
>>> + * msm_dsc_get_dce_bytes_per_line - get bytes per line to help 
>>> calculate data width
>>> + *    when configuring the timing engine
>>> + * @dsc: Pointer to drm dsc config struct
>>> + * @intf_width: interface width
>>> + */
>>> +static inline u32 msm_dsc_get_dce_bytes_per_line(struct 
>>> drm_dsc_config *dsc, int intf_width)
>>> +{
>>> +    return DIV_ROUND_UP(msm_dsc_get_bpp_int(dsc) * intf_width, 8);
>>> +}
>>> +
>>> +/**
>>> + * msm_dsc_get_pclk_per_intf - Calculate pclk per interface.
>>> + * @dsc: Pointer to drm dsc config struct
>>> + *
>>> + * Note: This value will then be passed along to DSI and DP for some 
>>> more
>>> + * calculations. This is because DSI and DP divide the pclk_per_intf 
>>> value
>>> + * by different values depending on if widebus is enabled.
>>> + */
>>> +static inline int msm_dsc_get_pclk_per_intf(struct drm_dsc_config *dsc)
>>> +{
>>> +    return DIV_ROUND_UP(dsc->slice_width * dsc->slice_count * 
>>> msm_dsc_get_bpp_int(dsc), 8);
>>> +}
>>> +
>>> +/**
>>> + * msm_dsc_get_bytes_per_soft_slice - get size of each soft slice 
>>> for dsc
>>> + * @dsc: Pointer to drm dsc config struct
>>
>> Nit:
>> Returns value in fixed point s31.32 format.
> 
> Hi Dmitry,
> 
> Acked, I'll add docs on the return value for all the helpers.
> 
>>
>> Even better would be to make this an internal-only static function. 
>> When DSI or DP driver requires it, we can make it public again.
> 
> I'd prefer to keep the method public since we're planning to submit DP 
> driver DSC v1.2 patches (after this series has been finalized) that will 
> make use of this method. Keeping this function public would mean that 
> the DP changes won't have to touch the msm_dsc_helper files at all.

Ack (though it is really not the usual way of adding API).

> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>>> + */
>>> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc);
>>> +
>>> +/**
>>> + * msm_dsc_get_bytes_per_intf - get total bytes per interface
>>> + * @dsc: Pointer to drm dsc config struct
>>> + * @intf_width: interface width
>>> + */
>>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int 
>>> intf_width);
>>> +
>>> +#endif /* MSM_DSC_HELPER_H_ */
>>>
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

