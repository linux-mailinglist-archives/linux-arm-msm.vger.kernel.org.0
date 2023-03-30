Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0C86D040B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 13:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbjC3LyO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 07:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbjC3LyJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 07:54:09 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F9AAF23
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 04:53:42 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g19so11039465lfr.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 04:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680177200;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0VcsUugWXvWORsNkEbnHv9IdzEJ+PY780Uk4W/Srgto=;
        b=iYzzha0Z1dDcA7SWO9r6yHP+VwnwT+k1NK2sEesta17+KIEC2rvDEkLu46wffcyVp8
         93ArtckF9aqN9vrAgKuh+vrjHkrDZMjCjhTTqAoh5Fqz6jRopPtwMznTm+B6OgPe/00/
         blnqsQ5eUTszDEM9896oawkIkCQKzMcgmOwuPfpJVhYCR34HGCoA6LJppKyGg5DLBn6q
         TW0X6cusSq0iiT8peYoCXwHw6xkhpEp/YoX+HvooZXJnRmqd7BPJKpGrzr3KrOec38SV
         4pAfYaigcHklqIpSYO7CF2oCt3O4UohzfCwXu6EWCIP4bRsk2IqUxicozU6+TPJmDXOc
         gzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680177200;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0VcsUugWXvWORsNkEbnHv9IdzEJ+PY780Uk4W/Srgto=;
        b=PpfyQ7rZgGATwJDPrUFbT1LEIVY9kMmW6BZFpijtksOpKavjNIcHvN58YwyD5V8HJx
         8XK7q763jb0sWGhMjlkcgF+x0jBubPfrzh18iupUIfwlG/x5gcBmq1u0grSMAeLCayTH
         xYa+DfPHX8+Ea7ZDl2GgmaEwfIrr8GFPXvZNrSpD9YnWKDh88t6SH/h/B8ppThOVbTK5
         TLueSZ41CXunKQc7rYCQs+VWDIfIlgx6yGIor3mA3OC8YHQkI5r/1cmn0aW1nsaObuyC
         MhrlE9qCpH0OesCMAqy5M/FQNfBKWDWqng2B1zuv/be0n0QIfLgicDRHOOamWi54UibJ
         IFWA==
X-Gm-Message-State: AAQBX9fGJWpt0CuTb9E/U3VWtJABPXWJAPuAvlQ+SR1SgL3urrnyw0jq
        Qk4PS09iaA2BPhHHToKrjbr6Iw==
X-Google-Smtp-Source: AKy350ZYcyfK6TwRw3aRpQFYDKrAblJGNV/rfF03O1bhh3w0IFvVvRHOOzCwRwCfLmaS8Y9kuqRYmw==
X-Received: by 2002:ac2:5192:0:b0:4eb:f6d:653 with SMTP id u18-20020ac25192000000b004eb0f6d0653mr4055452lfi.50.1680177200555;
        Thu, 30 Mar 2023 04:53:20 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id 21-20020ac24855000000b004d5a720e689sm5883877lfy.126.2023.03.30.04.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 04:53:20 -0700 (PDT)
Message-ID: <c4f6975f-3048-5814-9c8f-f3c3ed183ffb@linaro.org>
Date:   Thu, 30 Mar 2023 13:53:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,24/50] drm/msm/dpu: split QCM2290 catalog entry to the
 separate file
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230211231259.1308718-25-dmitry.baryshkov@linaro.org>
 <a282b382-2e75-7f13-03ca-6e85169817d2@linaro.org>
 <09573c91-9cb4-f6eb-aa68-ee89d5ba2aac@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <09573c91-9cb4-f6eb-aa68-ee89d5ba2aac@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30.03.2023 13:52, Dmitry Baryshkov wrote:
> On 30/03/2023 14:50, Konrad Dybcio wrote:
>>
>>
>> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   | 116 ++++++++++++++++++
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 108 +---------------
>>>   2 files changed, 117 insertions(+), 107 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>> new file mode 100644
>>> index 000000000000..48e7d4c641cd
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>> @@ -0,0 +1,116 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
>>> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
>>> + */
>>> +
>>> +#ifndef _DPU_6_5_QCM2290_H
>>> +#define _DPU_6_5_QCM2290_H
>>> +
>>> +static const struct dpu_caps qcm2290_dpu_caps = {
>>> +    .max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
>>> +    .max_mixer_blendstages = 0x4,
>>> +    .smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
>> Rebase
> 
> Yes, I will rebase before sending next iteration
> 
>>
>>> +    .has_dim_layer = true,
>>> +    .has_idle_pc = true,
>>> +    .max_linewidth = 2160,
>>> +    .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>> +};
>>> +
>>
>> [...]
>>
>>> +#include "catalog/dpu_6_5_qcm2290.h"
>>>   #include "catalog/dpu_6_3_sm6115.h"
>> I will not ask you to do redo it now, as it will mess with 50 patches
>> (unless you fix that in the following ones that I didn't get to yet),
>> but please rename qcm2290 things to sm6115 or whatever the case may be
>> so that we can keep the dpu_x_y_abcd sorted.
> 
> This is fixed in patch 42. The intention here was only to move date without changing it.
Great, thanks!

Konrad
> 
>>
>> With that:
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Konrad
>>>     #include "catalog/dpu_7_0_sm8350.h"
> 
