Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 677976D0400
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 13:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbjC3LxZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 07:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231372AbjC3LxW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 07:53:22 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C102D4F
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 04:52:56 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y20so24187427lfj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 04:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680177166;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jtu3FkLFmcLnbaFtYSIDnYVNyyAEmoII/wg78Y34KpI=;
        b=iCCH9qa0oouMDSenbJBAIMGMZf3aCf4i5BFlcuak3Y/khczgnqb2YLYcqXbOScU8C1
         frifsEsBTsV81cNfhc6C/MSx76yARZQoIjWK+vUI7dzGwQCkc0vQ5pTS1Qx0paSNYMuC
         qCjDiHvYT4U/u9bpNIHH9QZFrdMeiy8IpA5xctpq0nAeZHoIERq9/dn00XOpRlKdgThO
         DK1DxyWOjygfpWjXQgU/4OoMl2+N39SKL5f+6CyrRwP5A9ULiGkyaHxvvs9iClkDVNtw
         URRGKDULxWQ/WXjVSMge+56V/0JhiUxyus7PFe+fGQv5qgF2Nd6Pl2J3akvbVtX11EhM
         Vwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680177166;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jtu3FkLFmcLnbaFtYSIDnYVNyyAEmoII/wg78Y34KpI=;
        b=jr+Qr+xujAhRtSU+W/3q9Tqe4hiyuJ2D26aRDUXF4Lk//QNB2fhOTk0HkAGm6IYt+b
         i7vFM+D7MxVb+sgyg4gvDrPOv+Xj6ECTsDFXFGPGnV5R1fxNHF5TS/XztP/wmXq5bgH+
         iy7utafR4PgTWURMVzteU14mESyoiA3YOqgrDbXx5P090C2xxyXZc/ZzuLO/16cNqQj5
         GvVZJDHzuqcjKgkho2k6E/3btUXm+M8LUcXZt53wItIkseyACwRtqAvmJqAZTstjmkyp
         j6YZkXfuANczQTNk4X6R/M1yAJ95VP+QevRfwH/5+Ndq4fp7MzbQgbeZjTNcOiC+3FNq
         jWdg==
X-Gm-Message-State: AAQBX9ei4jHsLjpOjQZpqLelLMcrfqtoPp8CQrzVrhowv8UNI2vw8iVm
        UblZ4LI+7GnYHjHOhcukjgZ07Q==
X-Google-Smtp-Source: AKy350aGP6kLYjjIqP7EOtDRK9vBYCR08CJ0cEzTg/+9gOtng8/9hR9FlwmT0xL4BgCC47GRw6NdMg==
X-Received: by 2002:ac2:519c:0:b0:4b5:9e70:ca6e with SMTP id u28-20020ac2519c000000b004b59e70ca6emr1836184lfi.17.1680177166077;
        Thu, 30 Mar 2023 04:52:46 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b28-20020a056512025c00b004cb0dd2367fsm5843292lfo.308.2023.03.30.04.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 04:52:45 -0700 (PDT)
Message-ID: <09573c91-9cb4-f6eb-aa68-ee89d5ba2aac@linaro.org>
Date:   Thu, 30 Mar 2023 14:52:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,24/50] drm/msm/dpu: split QCM2290 catalog entry to the
 separate file
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
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
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a282b382-2e75-7f13-03ca-6e85169817d2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/03/2023 14:50, Konrad Dybcio wrote:
> 
> 
> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   | 116 ++++++++++++++++++
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 108 +---------------
>>   2 files changed, 117 insertions(+), 107 deletions(-)
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>> new file mode 100644
>> index 000000000000..48e7d4c641cd
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>> @@ -0,0 +1,116 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef _DPU_6_5_QCM2290_H
>> +#define _DPU_6_5_QCM2290_H
>> +
>> +static const struct dpu_caps qcm2290_dpu_caps = {
>> +	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
>> +	.max_mixer_blendstages = 0x4,
>> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
> Rebase

Yes, I will rebase before sending next iteration

> 
>> +	.has_dim_layer = true,
>> +	.has_idle_pc = true,
>> +	.max_linewidth = 2160,
>> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>> +};
>> +
> 
> [...]
> 
>> +#include "catalog/dpu_6_5_qcm2290.h"
>>   #include "catalog/dpu_6_3_sm6115.h"
> I will not ask you to do redo it now, as it will mess with 50 patches
> (unless you fix that in the following ones that I didn't get to yet),
> but please rename qcm2290 things to sm6115 or whatever the case may be
> so that we can keep the dpu_x_y_abcd sorted.

This is fixed in patch 42. The intention here was only to move date 
without changing it.

> 
> With that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad
>>   
>>   #include "catalog/dpu_7_0_sm8350.h"

-- 
With best wishes
Dmitry

