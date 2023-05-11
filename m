Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D535A6FEBC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 May 2023 08:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236462AbjEKG2a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 02:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjEKG22 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 02:28:28 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F7D10C2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 May 2023 23:28:22 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2ac82b07eb3so82192831fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 May 2023 23:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683786500; x=1686378500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VkKw6ZJBdEv1VTWUTJzAPl6i/3wgR4mhq3aqwGsAmdA=;
        b=K2hymQ87e1u+8I9WMgX/eLRbWKyt+C50E3VVcTu2KszPWB4w/uRXgCNXT7NIy2UC4L
         bhuKTbAKzC/DqCzOlzIYh7uHkku1MTnLPmhZqvDQxu0e9INtPEIXPhE25pgF9wsmwg/d
         8IsSbD0xP5DfjNZzQORKGpbIcUfqK78RX00v+zmslW6wcbVVgBmkRW4RqB9COpmZ0q2u
         gdMEZUPJHZ9Gx3OghSkvMfwZcxUWe7TPRUfNXmcEvXYQP97ueiQeGr8UN8exJhaZw4kn
         voHaDcV2zb/XplucKY6PPhqxPa++LO+hStJrlGQhR5KQ38iocc7IlS9wZ2euM/paqRQE
         6cww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683786500; x=1686378500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkKw6ZJBdEv1VTWUTJzAPl6i/3wgR4mhq3aqwGsAmdA=;
        b=lmTEr+N3Fj7KLGVU46Ms41/41JuuQj3gjDT4MZx05RYHb/xqRsJxSmcWp2ZREQZ/ee
         j77mNQzssDcJAjniiEAMuTxfLhytdjqtzJpElATLxi0Z2hu5czU2B4I+7RDSu1cf30yg
         i0vxYzwTZeCJgdgyVWBk1ZimZzQTKi1dpNTCaj1W81yu2Ljuv6P6BKt5GVSr8M0BvH/M
         LgmVF+nbEHxNsU3ZGzB+nSfOGEdGnTA4tkvnGUPYgSG5ZYNR0rWsCFx9WHl5punkUWjN
         LS+GfkpgI05U3EgCSdS7ELJ6DWgW0J7lRzPyEY2tmVnDGPzJvjMkATKe850xPsXrZe8W
         HkQA==
X-Gm-Message-State: AC+VfDxFxsK2k/ycgnxq+A1JVWpdoQhrqupLi/ktGLb1NkwWNipFla6U
        aEOWJkSwVtT33tHgSqPMm0hE0fUsH9KgGrbTH2o=
X-Google-Smtp-Source: ACHHUZ7047nQKa2OkrfRPPMeF3vprp0FemWK+Zik3moRd+4v+8oXqjo/B5MHCt6M39YWpy53E/pb0w==
X-Received: by 2002:a2e:9907:0:b0:2ad:8a4b:6a9e with SMTP id v7-20020a2e9907000000b002ad8a4b6a9emr2646101lji.26.1683786500410;
        Wed, 10 May 2023 23:28:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id f25-20020a2e9199000000b002a8bb52d994sm2274326ljg.25.2023.05.10.23.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 23:28:19 -0700 (PDT)
Message-ID: <8c883eb6-26f7-8f82-04a4-d3a556d90138@linaro.org>
Date:   Thu, 11 May 2023 09:28:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 4/8] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-4-df48a2c54421@quicinc.com>
 <4jjgeylpyofynlybonwuveumwvyjphtnbtctu6pwdrigckropw@dmkahbb3au3d>
 <489fb0ea-3b37-f7ed-0183-f4cb1b003326@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <489fb0ea-3b37-f7ed-0183-f4cb1b003326@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/05/2023 00:03, Jessica Zhang wrote:
> 
> 
> On 5/9/2023 11:33 PM, Marijn Suijten wrote:
>> On 2023-05-09 15:06:50, Jessica Zhang wrote:
>>> Introduce MSM-specific DSC helper methods, as some calculations are
>>> common between DP and DSC.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/Makefile         |  1 +
>>>   drivers/gpu/drm/msm/msm_dsc_helper.c | 26 ++++++++++++++
>>>   drivers/gpu/drm/msm/msm_dsc_helper.h | 69 
>>> ++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 96 insertions(+)
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
>>> index 000000000000..29feb3e3b5a4
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
>>> @@ -0,0 +1,26 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>> reserved
>>> + */
>>> +
>>> +#include <linux/kernel.h>
>>> +#include <drm/drm_fixed.h>
>>> +
>>> +#include "msm_dsc_helper.h"
>>> +
>>> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc)
>>> +{
>>> +    return drm_fixp_from_fraction(dsc->slice_width * 
>>> msm_dsc_get_bpp_int(dsc), 8);
>>
>> How about using dsc->slice_chunk_size?
> 
> Hi Marijn,
> 
> Thanks for pointing this out. However, I would prefer to keep this fixed 
> point version of the slice_chunk_size math as the downstream DP math 
> also uses fixed point [1].

This is pretty weak argument. Especially since this particular piece of 
code does lots of wrong or inefficient things.

> 
> If we are able to confirm that integer math also works for DP, we will 
> make the change to use slice_chunk_size within the DP DSC series.

This is why we usually do not accept API-only series. It is next to 
imposible to judge if the API is good enough without the actual users.

> 
> I also want to note that this math has stayed the same throughout all 7 
> revisions. In the interest of making review more efficient, I think it 
> would be helpful to point out important details like this early on in 
> the process. That way we can address major concerns early on and keep 
> the number of revisions per series low.

This is not always possible. We grasp the details of the patchset as we 
review and dive into the patchset under the review and other close 
enough patches/commits. So it is infrequent but still valid when at some 
point a reviewer (or the author) would come up with the comments 
demanding significant changes to the patch.

> 
> [1] 
> https://github.com/ianmacd/gts6lwifi/blob/master/drivers/gpu/drm/msm/dp/dp_panel.c#L335
> 
>>
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
>>> index 000000000000..38f3651d0b79
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
>>> @@ -0,0 +1,69 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>> reserved
>>> + */
>>> +
>>> +#ifndef MSM_DSC_HELPER_H_
>>> +#define MSM_DSC_HELPER_H_
>>> +
>>> +#include <linux/bug.h>
>>> +#include <linux/math.h>
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
>>
>> For all function docs, don't forget the trailing parenthesis after the
>> function name: msm_dsc_get_bpp_int()
>>
>> https://www.kernel.org/doc/html/next/doc-guide/kernel-doc.html#function-documentation
> 
> Acked.
> 
>>
>>> + * @dsc: Pointer to drm dsc config struct
>>> + * Returns: BPP integer value
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
>>> + * Returns: Integer representing the slice per interface
>>> + */
>>> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config 
>>> *dsc, int intf_width)
>>> +{
>>> +    return DIV_ROUND_UP(intf_width, dsc->slice_width);
>>
>> Looks good.
>>
>>> +}
>>> +
>>> +/**
>>> + * msm_dsc_get_bytes_per_line - Calculate bytes per line
>>> + * @dsc: Pointer to drm dsc config struct
>>> + * Returns: Integer value representing pclk per interface
>>> + *
>>> + * Note: This value will then be passed along to DSI and DP for some 
>>> more
>>> + * calculations. This is because DSI and DP divide the pclk_per_intf 
>>> value
>>> + * by different values depending on if widebus is enabled.
>>> + */
>>> +static inline int msm_dsc_get_bytes_per_line(struct drm_dsc_config 
>>> *dsc)
>>> +{
>>> +    return DIV_ROUND_UP(dsc->slice_width * dsc->slice_count * 
>>> msm_dsc_get_bpp_int(dsc), 8);
>>
>> dsc->slice_chunk_size * dsc->slice_count?
> 
> Acked.
> 
>>
>>> +}
>>> +
>>> +/**
>>> + * msm_dsc_get_bytes_per_soft_slice - get size of each soft slice 
>>> for dsc
>>
>> Explain to the reader what a "soft" slice is?
> 
> A soft slice is a slice defined in software as opposed to "hard slices" 
> that are defined by hardware.
> 
> Since the slice-related variables in drm_dsc_config hold information 
> related to soft slices and there is no separate variable for hard 
> slices, I'll change this name to *_get_bytes_per_slice instead.
> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>> - Marijn
>>
>>> + * @dsc: Pointer to drm dsc config struct
>>> + * Returns: s31.32 fixed point value representing bytes per soft slice
>>> + */
>>> +s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc);
>>> +
>>> +/**
>>> + * msm_dsc_get_bytes_per_intf - get total bytes per interface
>>> + * @dsc: Pointer to drm dsc config struct
>>> + * @intf_width: interface width
>>> + * Returns: u32 value representing bytes per interface
>>> + */
>>> +u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int 
>>> intf_width);
>>> +
>>> +#endif /* MSM_DSC_HELPER_H_ */
>>>
>>> -- 
>>> 2.40.1
>>>

-- 
With best wishes
Dmitry

