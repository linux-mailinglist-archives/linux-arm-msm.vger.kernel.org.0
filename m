Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4005E53C22C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jun 2022 04:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240715AbiFCBBe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 21:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241564AbiFCBAZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 21:00:25 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 361AC11140
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 18:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654218018; x=1685754018;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eCzB7Q/ciBQ+YCXeN0lc1bIfYfHhjyLrKt5wsXrO7H0=;
  b=jdTKWfDtGAfFSh1KiaAUOCIRdoK8r7vqkW0NMuCsWejfigk3D1jI8A1Q
   jMGro+JP6urXrhT+v19wMuQnqAAIXgQUZqNzgaCqNEKb1zd9KVyefsInG
   SnECVqA2iKN9ACRkyK/O1oyz2K8Mt43bwvrmJKhM0JuZEWTMimaUDQlmx
   E=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 02 Jun 2022 18:00:17 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 18:00:17 -0700
Received: from [10.110.104.21] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 2 Jun 2022
 18:00:16 -0700
Message-ID: <d1026de5-ada8-a33d-3ff7-9804dcf4b6ee@quicinc.com>
Date:   Thu, 2 Jun 2022 18:00:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/3] drm/msm/dpu: Add MISR register support for interface
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <freedreno@lists.freedesktop.org>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_aravindh@quicinc.com>,
        <quic_abhinavk@quicinc.com>
References: <20220527185407.162-1-quic_jesszhan@quicinc.com>
 <20220527185407.162-3-quic_jesszhan@quicinc.com>
 <d72845af-f444-af2e-b834-6e4c754a1094@linaro.org>
 <f81a64fc-c80c-2bc9-a9e3-8eb4a1eccf03@quicinc.com>
 <0b3574a3-1dfb-842f-e147-c6522fa30f11@linaro.org>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <0b3574a3-1dfb-842f-e147-c6522fa30f11@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/2/2022 3:31 PM, Dmitry Baryshkov wrote:
> On 27/05/2022 23:11, Jessica Zhang wrote:
>>
>>
>> On 5/27/2022 12:38 PM, Dmitry Baryshkov wrote:
>>> On 27/05/2022 21:54, Jessica Zhang wrote:
>>>> Add support for setting MISR registers within the interface
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 55 
>>>> ++++++++++++++++++++-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  8 ++-
>>>>   2 files changed, 61 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>> index 3f4d2c6e1b45..29aaeff9eacd 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>> @@ -1,5 +1,7 @@
>>>>   // SPDX-License-Identifier: GPL-2.0-only
>>>> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>>> +/*
>>>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>>> reserved.
>>>> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>>>    */
>>>>   #include "dpu_hwio.h"
>>>> @@ -67,6 +69,14 @@
>>>>   #define INTF_CFG2_DATABUS_WIDEN    BIT(0)
>>>>   #define INTF_CFG2_DATA_HCTL_EN    BIT(4)
>>>> +#define INTF_MISR_CTRL            0x180
>>>> +#define INTF_MISR_SIGNATURE        0x184
>>>> +#define INTF_MISR_FRAME_COUNT_MASK    0xFF
>>>> +#define INTF_MISR_CTRL_ENABLE        BIT(8)
>>>> +#define INTF_MISR_CTRL_STATUS        BIT(9)
>>>> +#define INTF_MISR_CTRL_STATUS_CLEAR    BIT(10)
>>>> +#define INTF_MISR_CTRL_FREE_RUN_MASK    BIT(31)
>>>
>>> I'm tempted to ask to move these bits to some common header. Is there 
>>> any other hardware block which uses the same bitfields to control MISR?
>>
>> dpu_hw_lm.c has similar macros here [1] for _ENABLE, _STATUS, 
>> _STATUS_CLEAR, and _FREE_RUN_MASK
>>
>> [1] 
>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c#L31 
> 
> 
> Please move bit definitions to dpu_hw_util.h. According to what I 
> observe, this might be useful.

Noted.

> 
>>>> +
>>>>   static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
>>>>           const struct dpu_mdss_cfg *m,
>>>>           void __iomem *addr,
>>>> @@ -319,6 +329,47 @@ static u32 dpu_hw_intf_get_line_count(struct 
>>>> dpu_hw_intf *intf)
>>>>       return DPU_REG_READ(c, INTF_LINE_COUNT);
>>>>   }
>>>> +static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool 
>>>> enable, u32 frame_count)
>>>> +{
>>>> +    struct dpu_hw_blk_reg_map *c = &intf->hw;
>>>> +    u32 config = 0;
>>>> +
>>>> +    DPU_REG_WRITE(c, INTF_MISR_CTRL, INTF_MISR_CTRL_STATUS_CLEAR);
>>>> +
>>>> +    /* Clear old MISR value (in case it's read before a new value 
>>>> is calculated)*/
>>>> +    wmb();
>>>> +
>>>> +    if (enable) {
>>>> +        config = (frame_count & INTF_MISR_FRAME_COUNT_MASK) |
>>>> +                INTF_MISR_CTRL_ENABLE | INTF_MISR_CTRL_FREE_RUN_MASK;
>>>> +
>>>> +        DPU_REG_WRITE(c, INTF_MISR_CTRL, config);
>>>> +    } else {
>>>> +        DPU_REG_WRITE(c, INTF_MISR_CTRL, 0);
>>>> +    }
> 
> This should also be abstracted. Please merge these functions with LM's 
> and add corresponding helpers to dpu_hw_util.c

Good idea.

> 
>>>> +}
>>>> +
>>>> +static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 
>>>> *misr_value)
>>>> +{
>>>> +    struct dpu_hw_blk_reg_map *c = &intf->hw;
>>>> +    u32 ctrl = 0;
>>>> +
>>>> +    if (!misr_value)
>>>> +        return -EINVAL;
>>>> +
>>>> +    ctrl = DPU_REG_READ(c, INTF_MISR_CTRL);
>>>> +
>>>> +    if (!(ctrl & INTF_MISR_CTRL_ENABLE))
>>>> +        return -ENODATA;
> 
> As the users of collect_misr() are going to ignore the -ENODATA, I think 
> it would be worth changing this to set *misr_value to 0 and return 0 
> here. It would reduce the amount of boilerplate code.

0 might be a valid misr_value so it might be better to not write it to 
the debugfs. IMO we should also avoid writing to the debugfs if the misr 
is disabled -- that way we won't be spamming the debugfs with 
meaningless entries.

Thanks,

Jessica Zhang

> 
>>>> +
>>>> +    if (!(ctrl & INTF_MISR_CTRL_STATUS))
>>>> +        return -EINVAL;
>>>> +
>>>> +    *misr_value = DPU_REG_READ(c, INTF_MISR_SIGNATURE);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>   static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>>>>           unsigned long cap)
>>>>   {
>>>> @@ -329,6 +380,8 @@ static void _setup_intf_ops(struct 
>>>> dpu_hw_intf_ops *ops,
>>>>       ops->get_line_count = dpu_hw_intf_get_line_count;
>>>>       if (cap & BIT(DPU_INTF_INPUT_CTRL))
>>>>           ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
>>>> +    ops->setup_misr = dpu_hw_intf_setup_misr;
>>>> +    ops->collect_misr = dpu_hw_intf_collect_misr;
>>>>   }
>>>>   struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>>> index 7b2d96ac61e8..8d0e7b509260 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>>> @@ -1,5 +1,7 @@
>>>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>>> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>>> +/*
>>>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>>> reserved.
>>>> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>>>    */
>>>>   #ifndef _DPU_HW_INTF_H
>>>> @@ -57,6 +59,8 @@ struct intf_status {
>>>>    * @ get_line_count: reads current vertical line counter
>>>>    * @bind_pingpong_blk: enable/disable the connection with pingpong 
>>>> which will
>>>>    *                     feed pixels to this interface
>>>> + * @setup_misr: enable/disable MISR
>>>> + * @collect_misr: read MISR signature
>>>>    */
>>>>   struct dpu_hw_intf_ops {
>>>>       void (*setup_timing_gen)(struct dpu_hw_intf *intf,
>>>> @@ -77,6 +81,8 @@ struct dpu_hw_intf_ops {
>>>>       void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
>>>>               bool enable,
>>>>               const enum dpu_pingpong pp);
>>>> +    void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 
>>>> frame_count);
>>>> +    int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
>>>>   };
>>>>   struct dpu_hw_intf {
>>>
>>>
>>> -- 
>>> With best wishes
>>> Dmitry
> 
> 
> -- 
> With best wishes
> Dmitry
