Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 596D26D68F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 18:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbjDDQeq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 12:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbjDDQep (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 12:34:45 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD57040CD
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 09:34:43 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id c29so43111850lfv.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 09:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680626082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nITyBTNOJIWRuIKiYEciol1MR0ETXizCKOJZaZE6IDQ=;
        b=WH+zhNv/4gDJq4k2ejdVejyfYSwlHuklBdvMVFWR+CkBZ5TtdmJ4SVWUQ5MPg2sstP
         oZDjrKkJDrG1kdSmvOJrsVUtKKF8brBEdsOlL6Fj14RtPdnMuzStWorp1v7ZQelhtETQ
         MHayuhn+2iNlr6wkooMxD0PkNU7nOwdTV8HHo9u/y4bglgeqB0lDVeTtat/j0xQmYSdI
         7BGosOnuqoklrPlYQ34FtHVqe/JUjiNLRKVNNg9oBwfw62YG/FqkgC9/dk4uX7jAv6L9
         wJp2Zqb8NmSsKnpBlihVowVvilQYyih/CjvQLHjrC1vQz3RVE1pA8qGtyz5fRnrQJFuV
         FUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680626082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nITyBTNOJIWRuIKiYEciol1MR0ETXizCKOJZaZE6IDQ=;
        b=aI0VcjCSO4p75xI4m8rtBa3HHMBVYYEdbJI8J+91JTBHhF1B9zHY6o2LVMdI6vuHVq
         97ajfFI7dSZIQEHFxQIva2yJUjyNKshgxz198/6QzPzoULL1GiJFpNcWp/rcy9dWA8A0
         2/4PoXDmMURclvUGCHK4rLq39/EgHR57FdgiNv6oNPbOuY16t6LSrmAte+lrue4JqMqm
         S+WAC+d64qcVchGFaxErmhr65uqQX3Cm3IuO+BfWq+4lfmEaXDslRyk9E7LUZeNYRxhn
         CTozvYvPyRGiV8RDd1MrWuAjTad8fiYCIkY98OVoA14OhqHmSMDKjmQdK4p6whCuP4NW
         6uHw==
X-Gm-Message-State: AAQBX9dJiMwz86fLTFN9zx6nELcLzgKpSvMQTQ6rxw2oc8E9TM66WJnj
        b59C+Ex4H/AUJgyzv24GQ+6y32HM32kTFESwE5M=
X-Google-Smtp-Source: AKy350ZFyLXMkangNgT5gW+VlY3TWkEy1mI6YChEzPyE9wCDdCYRL9M4Hk8VD8fqVR/cJuxT/rRN4w==
X-Received: by 2002:ac2:4e6a:0:b0:4b6:fddc:1fcd with SMTP id y10-20020ac24e6a000000b004b6fddc1fcdmr858563lfs.23.1680626082010;
        Tue, 04 Apr 2023 09:34:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::227? (dzccz6yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::227])
        by smtp.gmail.com with ESMTPSA id r16-20020ac25a50000000b004e848782e2esm2378296lfn.57.2023.04.04.09.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 09:34:41 -0700 (PDT)
Message-ID: <c0193dc7-1e74-e826-856b-7be14c6993ad@linaro.org>
Date:   Tue, 4 Apr 2023 19:34:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC v2 2/6] drm/msm: Add MSM-specific DSC helper methods
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v2-2-3c13ced536b2@quicinc.com>
 <5b4a3305-1e26-220d-a770-1f6945fbac7a@linaro.org>
 <acdd6ae0-a6e8-3338-5e68-44a93f94de77@quicinc.com>
 <2591482a-a259-5406-83b8-4afeee9e3a43@linaro.org>
 <3e2c8780-5074-062e-567e-6e75467e50c7@quicinc.com>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3e2c8780-5074-062e-567e-6e75467e50c7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/04/2023 19:29, Jessica Zhang wrote:
> 
> 
> On 4/3/2023 5:33 PM, Dmitry Baryshkov wrote:
>> On 04/04/2023 00:38, Jessica Zhang wrote:
>>>
>>>
>>> On 4/2/2023 4:21 AM, Dmitry Baryshkov wrote:
>>>> On 31/03/2023 21:49, Jessica Zhang wrote:
>>>>> Introduce MSM-specific DSC helper methods, as some calculations are
>>>>> common between DP and DSC.
>>>>>
>>>>> Changes in v2:
>>>>> - Moved files up to msm/ directory
>>>>> - Dropped get_comp_ratio() helper
>>>>> - Used drm_int2fixp() to convert to integers to fp
>>>>> - Style changes to improve readability
>>>>> - Dropped unused bpp variable in msm_dsc_get_dce_bytes_per_line()
>>>>> - Changed msm_dsc_get_slice_per_intf() to a static inline method
>>>>> - Dropped last division step of msm_dsc_get_pclk_per_line() and 
>>>>> changed
>>>>>    method name accordingly
>>>>> - Changed DSC_BPP macro to drm_dsc_get_bpp_int() helper method
>>>>> - Fixed some math issues caused by passing in incorrect types to
>>>>>    drm_fixed methods in get_bytes_per_soft_slice()
>>>>>
>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/Makefile         |  1 +
>>>>>   drivers/gpu/drm/msm/msm_dsc_helper.c | 53 
>>>>> ++++++++++++++++++++++++++++++++++++
>>>>>   drivers/gpu/drm/msm/msm_dsc_helper.h | 42 
>>>>> ++++++++++++++++++++++++++++
>>>>>   3 files changed, 96 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/Makefile 
>>>>> b/drivers/gpu/drm/msm/Makefile
>>>>> index 7274c41228ed..b814fc80e2d5 100644
>>>>> --- a/drivers/gpu/drm/msm/Makefile
>>>>> +++ b/drivers/gpu/drm/msm/Makefile
>>>>> @@ -94,6 +94,7 @@ msm-y += \
>>>>>       msm_atomic_tracepoints.o \
>>>>>       msm_debugfs.o \
>>>>>       msm_drv.o \
>>>>> +    msm_dsc_helper.o \
>>>>>       msm_fb.o \
>>>>>       msm_fence.o \
>>>>>       msm_gem.o \
>>>>> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.c 
>>>>> b/drivers/gpu/drm/msm/msm_dsc_helper.c
>>>>> new file mode 100644
>>>>> index 000000000000..60b73e17e6eb
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
>>>>> @@ -0,0 +1,53 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>> +/*
>>>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>>>> reserved
>>>>> + */
>>>>> +
>>>>> +#include <linux/kernel.h>
>>>>> +#include <linux/errno.h>
>>>>> +#include <drm/drm_fixed.h>
>>>>> +
>>>>> +#include "msm_drv.h"
>>>>> +#include "msm_dsc_helper.h"
>>>>> +
>>>>> +static s64 get_bytes_per_soft_slice(struct drm_dsc_config *dsc, 
>>>>> int intf_width, u32 src_bpp)
>>>>
>>>> intf_width is unused
>>>
>>> Hi Dmitry,
>>>
>>> Acked.
>>>
>>>>
>>>>> +{
>>>>> +    int bpp = msm_dsc_get_bpp_int(dsc);
>>>>> +    s64 numerator_fp, denominator_fp;
>>>>> +    s64 comp_ratio_fp = drm_fixp_from_fraction(src_bpp, bpp);
>>>>> +
>>>>> +    numerator_fp = drm_int2fixp(dsc->slice_width * 3);
>>>>
>>>> You have lost dsc->bits_per_component here.
>>>
>>> This was moved to the denominator calculation, but I'll move it back 
>>> to this line to avoid confusion.
>>
>> Maybe you occasionally mixed bpp and bpc, because there is no 
>> bits_per_component usage in denominator. Could you please recheck the 
>> calculations.
>>
>>>
>>>>
>>>>> +    denominator_fp = drm_fixp_from_fraction(comp_ratio_fp * 8, 
>>>>> drm_int2fixp(bpp));
>>>>
>>>> denominator_fp = drm_fixp_from_fraction(src_bpp * 8, bpp);
>>>
>>> Acked.
>>>
>>>>
>>>>> +
>>>>> +    return drm_fixp_div(numerator_fp, denominator_fp);
>>>>> +}
>>>>> +
>>>>> +u32 msm_dsc_get_eol_byte_num(struct drm_dsc_config *dsc, int 
>>>>> intf_width, u32 src_bpp)
>>>>> +{
>>>>> +    u32 bytes_per_soft_slice, extra_eol_bytes, bytes_per_intf;
>>>>> +    s64 bytes_per_soft_slice_fp;
>>>>> +    int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
>>>>> +
>>>>> +    bytes_per_soft_slice_fp = get_bytes_per_soft_slice(dsc, 
>>>>> intf_width, src_bpp);
>>>>> +    bytes_per_soft_slice = 
>>>>> drm_fixp2int_ceil(bytes_per_soft_slice_fp);
>>>>> +
>>>>> +    bytes_per_intf = bytes_per_soft_slice * slice_per_intf;
>>>>> +    extra_eol_bytes = bytes_per_intf % 3;
>>>>> +    if (extra_eol_bytes != 0)
>>>>> +        extra_eol_bytes = 3 - extra_eol_bytes;
>>>>
>>>> I become confused here when I checked eol_bytes in the display 
>>>> techpack.
>>>>
>>>> I see that for DP the dp_panel_dsc_pclk_param_calc() calculates 
>>>> dsc->eol_bytes_num in this way, the size to pad dsc_byte_count * 
>>>> slice_per_intf to 3 bytes.
>>>>
>>>> However, for DSI this is a simple as total_bytes_per_intf % 3 , so 
>>>> it is not a padding, but a length of the last chunk.
>>>>
>>>> Could you please clarify? If the techpack code is correct, I'd 
>>>> prefer if we return last chunk size here and calculate the padding 
>>>> length in the DP driver.
>>>
>>> I've double checked the calculations between DP and DSI, and I think 
>>> you're right. Will move the `if (extra_eol_bytes != 0)` block out to 
>>> DP code.
>>
>> Ack. Could you please check with HW team that our understanding is 
>> correct?
> 
> Hey Dmitry,
> 
> I've checked with the HW team and looks like the math for eol_byte_nums 
> differs between DP and DSI.
> 
> For DSI, eol_byte_num = bytes_per_intf % 3
> 
> But for DP, eol_byte_num = (bytes_per_intf % 3 == 0) ? 0 : 3 - 
> bytes_per_intf % 3 *only* for non-widebus.
> 
> For DP && widebus enabled, eol_byte_num = (bytes_per_intf % 6 == 0) ? 0 
> : 6 - bytes_per_intf % 6
> 
> In that case, we should move even the bytes_per_intf % 3 out and change 
> this method to msm_dsc_get_bytes_per_intf() instead.

Thanks for the note. I'm looking forward to seeing the v3 then.

> 
> Thanks,
> 
> Jessica Zhang

-- 
With best wishes
Dmitry

