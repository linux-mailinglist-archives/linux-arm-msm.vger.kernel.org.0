Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE6506D8B21
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 01:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233463AbjDEXhO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 19:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbjDEXhN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 19:37:13 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5662A1BD7
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 16:37:11 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id g17so48773063lfv.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 16:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680737829;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yuypIuG8/lmEucB5dN/uKCTxOXd+soyTwWq+Ps5E170=;
        b=yx/6QuSOnpE/XQouY5Sx9dNKd0iPrp75FQolPO3Tdhmil2hGftwOkZaxLZLrDTw7qe
         tm5oATEn9swXCLSmZ27aWAaJvDqiRzo2tU/UA5ZV5Q8GZsb+NHBzA413Sp0oNRlVL8wV
         iP6KgiPUkPS9gg+Vk0JlW4lS8leB1td/OwyYq81tC6mvseZQu0uSfKlvFpic9hTgQDxH
         8zDTKXWo/CwcHufl3EsrUufJOaLdhS+1HXdlLUK6fp4t/EL0PT+13Q8DkXdddlvUdpXQ
         JClARsUbsdgNWP0oWRLnlnJVp47AGJKa9ZMTzPvXka4MHnO47JBQa2W/nPWSd4T8RCAX
         HsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680737829;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yuypIuG8/lmEucB5dN/uKCTxOXd+soyTwWq+Ps5E170=;
        b=nEnbx0Ys5Zv+PC03YAgtmEKHoC+MDiffTaBWZVJZGjmkmA20qVk6pbgeVaiIIBO6oe
         JCz9AnQ/y3uO3GtKXaipHVNPPAvcOauoyJPmI3TjU0/BlX7jjF1mcu3qHAkAooJl0MhL
         5kYx/shu0F8Whf9Lr4U/dYN3onDQivymABsQ1rhqXKAX5CAPdfv9hDBHfIiy3gGZ0iG1
         hJoOEaQYLoqW1w0ZZAs9YD4c1p0VKZuBMq0ebiiZoatzL5iXX9Ksj/vzYoSTGXtxu6Yl
         PNZcHJkb/05ihiOFS3E/kohzVblWhxd0bTkb8Q235wQqr3UWmNX1Zv3kXs7UeAXF9RDX
         RaHw==
X-Gm-Message-State: AAQBX9cv17Y7dbMa1BWedeY5shrmM3tFJn5hfrHVtN9Ep4d4cHN3A05O
        r3mVfYACwrCCCLTOxCEIOSGufIX2D4YUzii8zfI=
X-Google-Smtp-Source: AKy350YZoLfBhTmi3P68MwFOB0SamVMQoVezSuoPTCXURGrEhS0rh0dM5gZwZY+Imns4CssfPBepVg==
X-Received: by 2002:ac2:5989:0:b0:4eb:680:3920 with SMTP id w9-20020ac25989000000b004eb06803920mr1996682lfn.40.1680737829549;
        Wed, 05 Apr 2023 16:37:09 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a17-20020ac25211000000b004dc83d04840sm24116lfl.79.2023.04.05.16.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 16:37:09 -0700 (PDT)
Message-ID: <814b5b65-0572-11bd-9ad2-00f9b795bf2f@linaro.org>
Date:   Thu, 6 Apr 2023 02:37:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/6] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v4-0-1b79c78b30d7@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v4-1-1b79c78b30d7@quicinc.com>
 <dd8dcaf7-acc0-69cc-9c7e-bcbd270fb845@linaro.org>
 <c49756fb-75d3-45b4-f78c-2e2e18f71821@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c49756fb-75d3-45b4-f78c-2e2e18f71821@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/04/2023 02:34, Abhinav Kumar wrote:
> 
> 
> On 4/5/2023 12:26 PM, Dmitry Baryshkov wrote:
>> On 05/04/2023 03:41, Jessica Zhang wrote:
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
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/Makefile         |  1 +
>>>   drivers/gpu/drm/msm/msm_dsc_helper.c | 47 ++++++++++++++++++++++++
>>>   drivers/gpu/drm/msm/msm_dsc_helper.h | 70 
>>> ++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 118 insertions(+)
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
>>> index 000000000000..0539221eb09d
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
>>> @@ -0,0 +1,47 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>> reserved
>>> + */
>>> +
>>> +#include <linux/kernel.h>
>>> +#include <linux/errno.h>
>>> +#include <drm/drm_fixed.h>
>>> +
>>> +#include "msm_drv.h"
>>> +#include "msm_dsc_helper.h"
>>> +
>>> +s64 get_bytes_per_soft_slice(struct drm_dsc_config *dsc)
>>> +{
>>> +    int bpp = msm_dsc_get_bpp_int(dsc);
>>> +    s64 numerator_fp, denominator_fp;
>>> +    s64 comp_ratio_fp = 
>>> drm_fixp_from_fraction(dsc->bits_per_component * 3, bpp);
>>> +
>>> +    numerator_fp = drm_int2fixp(dsc->slice_width * 3 * 
>>> dsc->bits_per_component);
>>> +    denominator_fp = drm_fixp_mul(comp_ratio_fp, drm_int2fixp(8));
>>> +
>>> +    return drm_fixp_div(numerator_fp, denominator_fp);
>>
>> If we remove 3 * dsc->bits_per_components from both numerator and 
>> denominator, this whole function seems to be as simple as 
>> DIV_ROUND_UP(dsc->slice_width * bpp, 8)
>>
>> Or, if you prefer FP math, drm_fixp_from_fraction(dsc->slice_width * 
>> bpp, 8).
>>
> 
> True and thats not really surprising because bytes_per_soft_slice is 
> eventually (dsc->slice_width * bpp, 8)
> 
> I also thought about it after you mentioned that they will cancel out 
> then why was downstream code and our programming guide doing this way.
> 
> So i thought a bit more and the reason from what I can see is that its 
> showing that compression ratio was factored into the math while 
> calculating it. If we just go with (dsc->slice_width * bpp, 8), it does 
> not really show that this was actually compressed bytes per slice 
> leading to the earlier confusion that it was uncompressed pclk while it 
> actually was.

I'd say, name we can name that dsc_bpp or compressed_bpp instead of just 
bpp, this way showing that it is a compressed pclk. But please don't 
complicate the math.

> 
>>> +}
>>> +
>>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int 
>>> intf_width)
>>> +{
>>> +    u32 bytes_per_soft_slice, bytes_per_intf;
>>> +    s64 bytes_per_soft_slice_fp;
>>> +    int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
>>> +
>>> +    bytes_per_soft_slice_fp = get_bytes_per_soft_slice(dsc);
>>> +    bytes_per_soft_slice = drm_fixp2int_ceil(bytes_per_soft_slice_fp);
>>> +
>>> +    bytes_per_intf = bytes_per_soft_slice * slice_per_intf;
>>> +
>>> +    return bytes_per_intf;
>>> +}
>>> +
>>> +int msm_dsc_get_pclk_per_intf(struct drm_dsc_config *dsc)
>>> +{
>>> +    s64 data_width;
>>> +
>>> +    data_width = drm_fixp_mul(drm_int2fixp(dsc->slice_count),
>>> +            get_bytes_per_soft_slice(dsc));
>>
>> And this is then DIV_ROUND_UP(dsc->slice_width * dsc->slice_count * 
>> bpp, 8)
>>
>>> +
>>> +    return drm_fixp2int_ceil(data_width);
>>> +}
>>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h 
>>> b/drivers/gpu/drm/msm/msm_dsc_helper.h
>>> new file mode 100644
>>> index 000000000000..31116a31090f
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
>>> @@ -0,0 +1,70 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>> reserved
>>> + */
>>> +
>>> +#ifndef MSM_DSC_HELPER_H_
>>> +#define MSM_DSC_HELPER_H_
>>> +
>>> +#include <drm/display/drm_dsc_helper.h>
>>> +#include <drm/drm_modes.h>
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
>>> + * get_bytes_per_soft_slice - get size of each soft slice for dsc
>>> + * @dsc: Pointer to drm dsc config struct
>>> + */
>>> +s64 get_bytes_per_soft_slice(struct drm_dsc_config *dsc);
>>> +
>>> +/**
>>> + * msm_dsc_get_bytes_per_intf - get total bytes per interface
>>> + * @dsc: Pointer to drm dsc config struct
>>> + * @intf_width: interface width
>>> + */
>>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int 
>>> intf_width);
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
>>> +int msm_dsc_get_pclk_per_intf(struct drm_dsc_config *dsc);
>>
>> empty line, please
>>
>>> +#endif /* MSM_DSC_HELPER_H_ */
>>>
>>

-- 
With best wishes
Dmitry

