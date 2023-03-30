Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13E426D06AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 15:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbjC3N17 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 09:27:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjC3N16 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 09:27:58 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE041AF18
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 06:27:40 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y20so24543460lfj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 06:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680182859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H9CQm/4MQRYssz1OkX8mlyZhiA0pOtxLWpuES+tcUz4=;
        b=A7CLzVQ47sSXgw4musuKt5TyZyoBHnjJZ+lEgegPjed9M+IOqvq2RQYpibZutfTFNT
         +9ox0k1QqXX+kniEQ6CY1dyM5CFrE6m9zBZdMxy0gwA8Y1v2loW/QDGvP7Fe0DnUCp9p
         xbinL63Gc+lGrFKEZVbbALWCxuqMy703tM09jxqKy2+N9EeQyrWAVrXtDpOftwfMfeNU
         xo1+spYS7BvwIO5STccF9Pzpnu5YAdL50/N0TLl8JTtDC6nohCvgJcJ2cWL6kjfHoki/
         YPwmGuY0GFwJrkPwtqkW7MiIJJVdx7Wv9msBE1SeHB3A+2YsSEjF5fXfdz4L2ZBCIFDo
         yN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680182859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H9CQm/4MQRYssz1OkX8mlyZhiA0pOtxLWpuES+tcUz4=;
        b=OqN76qQ+8FkdqHsWdGXBazORX9KACZ8FObNQGnfsMPs5AnBuX0kvp3eosGigFvBH+B
         OEHhREw+qbPjOe3cRZCrhzxTNt1qf6M98Wgus1dT9YyUBK4ECjFukzL+Fuu6RhwuXfuP
         SgvkGcatOLSzYCsNUrtUXGgYSijJ+xtR0q/Ll5neLFlxasrecfTh/WH5XfuWWvch1Hku
         UJanbej13nv3rwZ3YVT0/KXDkf6c+6OZV5eJRBC7VgGuMwX8WCZzShe8+8mV3eLs0mgV
         lAzohUQyf35ELUZGFzpC/FiqPCE0na4F5BfkLaVAJc1qKJlfY4RZZzdSsifqBTM2U5+S
         W7fQ==
X-Gm-Message-State: AAQBX9dMi8st9sAwADNSwDEStuFf7DS1jO7jB0PEIxjCwU7e1WYDjg5T
        HbEQWh686Wb8XjS3wdqoklSCug==
X-Google-Smtp-Source: AKy350beu5OMs9D0KiVr0EOV6zSRyqV1SlEs5bh0+6BhwS8NOh7Qg3ddtTtWX9CWp+IJY5AJXugR8Q==
X-Received: by 2002:a05:6512:92a:b0:4e9:8994:49bd with SMTP id f10-20020a056512092a00b004e9899449bdmr6094481lft.3.1680182858952;
        Thu, 30 Mar 2023 06:27:38 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id r10-20020a19ac4a000000b004b5979f9ba8sm5889881lfc.210.2023.03.30.06.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 06:27:38 -0700 (PDT)
Message-ID: <a016f235-0b1b-3452-d621-4c2323cd38b2@linaro.org>
Date:   Thu, 30 Mar 2023 15:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,47/50] drm/msm/dpu: rename CTL_foo_MASK to contain major DPU
 version
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230211231259.1308718-48-dmitry.baryshkov@linaro.org>
 <045895cf-7866-1c0c-51c3-34ea3a7f0cab@linaro.org>
 <a699774e-d403-46e8-921e-6a4a048cab79@linaro.org>
 <CAA8EJpppVBKFo9-8m3uyqKYNTC39gjzQoOXaiwUrvkchZGG5vQ@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpppVBKFo9-8m3uyqKYNTC39gjzQoOXaiwUrvkchZGG5vQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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



On 30.03.2023 15:26, Dmitry Baryshkov wrote:
> On Thu, 30 Mar 2023 at 16:16, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 30.03.2023 15:15, Konrad Dybcio wrote:
>>>
>>>
>>> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>>>> To ease review and reuse rename CTL feature masks to contain base DPU
>>>> version since which this mask is used.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 10 +++++-----
>>>>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 10 +++++-----
>>>>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h    | 12 ++++++------
>>>>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 12 ++++++------
>>>>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  6 +++---
>>>>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h    |  2 +-
>>>>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 12 ++++++------
>>>>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  8 ++++----
>>>>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h    | 12 ++++++------
>>>>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
>>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 12 ++++++++----
>>>>  11 files changed, 56 insertions(+), 52 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>> index 5e8200d929e4..d42c380275bd 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>>> @@ -49,31 +49,31 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
>>>>      {
>>>>      .name = "ctl_0", .id = CTL_0,
>>>>      .base = 0x1000, .len = 0x94,
>>>> -    .features = BIT(DPU_CTL_SPLIT_DISPLAY),
>>>> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
>>> Again, I'd vote for DPU_3
>> Though thinking about it again, the 8996-and-earlier setup was
>> probably the same and that's what you had in mind. Please confirm
> 
> Yes, the idea was to have DPU_0_MASK defined to (0) if that's
> applicable to early generations.
OK let's keep it zero then. I think I'm done with the review!

Konrad
> 
>>
>> Konrad
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>
>>> Konrad
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>>>      },
>>>>      {
>>>>      .name = "ctl_1", .id = CTL_1,
>>>>      .base = 0x1200, .len = 0x94,
>>>> -    .features = 0,
>>>> +    .features = CTL_DPU_0_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>>>      },
>>>>      {
>>>>      .name = "ctl_2", .id = CTL_2,
>>>>      .base = 0x1400, .len = 0x94,
>>>> -    .features = BIT(DPU_CTL_SPLIT_DISPLAY),
>>>> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>>>      },
>>>>      {
>>>>      .name = "ctl_3", .id = CTL_3,
>>>>      .base = 0x1600, .len = 0x94,
>>>> -    .features = 0,
>>>> +    .features = CTL_DPU_0_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>>>>      },
>>>>      {
>>>>      .name = "ctl_4", .id = CTL_4,
>>>>      .base = 0x1800, .len = 0x94,
>>>> -    .features = 0,
>>>> +    .features = CTL_DPU_0_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>>>>      },
>>>>  };
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>>> index daef5e48e7ee..281556416322 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>>> @@ -47,31 +47,31 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
>>>>      {
>>>>      .name = "ctl_0", .id = CTL_0,
>>>>      .base = 0x1000, .len = 0xe4,
>>>> -    .features = BIT(DPU_CTL_SPLIT_DISPLAY),
>>>> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>>>      },
>>>>      {
>>>>      .name = "ctl_1", .id = CTL_1,
>>>>      .base = 0x1200, .len = 0xe4,
>>>> -    .features = BIT(DPU_CTL_SPLIT_DISPLAY),
>>>> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>>>      },
>>>>      {
>>>>      .name = "ctl_2", .id = CTL_2,
>>>>      .base = 0x1400, .len = 0xe4,
>>>> -    .features = 0,
>>>> +    .features = CTL_DPU_0_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>>>      },
>>>>      {
>>>>      .name = "ctl_3", .id = CTL_3,
>>>>      .base = 0x1600, .len = 0xe4,
>>>> -    .features = 0,
>>>> +    .features = CTL_DPU_0_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>>>>      },
>>>>      {
>>>>      .name = "ctl_4", .id = CTL_4,
>>>>      .base = 0x1800, .len = 0xe4,
>>>> -    .features = 0,
>>>> +    .features = CTL_DPU_0_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>>>>      },
>>>>  };
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
>>>> index 294702531ce2..7c051c142e06 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
>>>> @@ -42,37 +42,37 @@ static const struct dpu_ctl_cfg dpu_5_lm6_ctl[] = {
>>>>      {
>>>>      .name = "ctl_0", .id = CTL_0,
>>>>      .base = 0x1000, .len = 0x1e0,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
>>>> +    .features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>>>      },
>>>>      {
>>>>      .name = "ctl_1", .id = CTL_1,
>>>>      .base = 0x1200, .len = 0x1e0,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
>>>> +    .features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>>>      },
>>>>      {
>>>>      .name = "ctl_2", .id = CTL_2,
>>>>      .base = 0x1400, .len = 0x1e0,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
>>>> +    .features = CTL_DPU_5_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>>>      },
>>>>      {
>>>>      .name = "ctl_3", .id = CTL_3,
>>>>      .base = 0x1600, .len = 0x1e0,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
>>>> +    .features = CTL_DPU_5_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>>>>      },
>>>>      {
>>>>      .name = "ctl_4", .id = CTL_4,
>>>>      .base = 0x1800, .len = 0x1e0,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
>>>> +    .features = CTL_DPU_5_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>>>>      },
>>>>      {
>>>>      .name = "ctl_5", .id = CTL_5,
>>>>      .base = 0x1a00, .len = 0x1e0,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
>>>> +    .features = CTL_DPU_5_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>>>>      },
>>>>  };
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>>> index fd5df2bdec0e..cffbb6bcc535 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>>> @@ -48,37 +48,37 @@ static const struct dpu_ctl_cfg sm8250_ctl[] = {
>>>>      {
>>>>      .name = "ctl_0", .id = CTL_0,
>>>>      .base = 0x1000, .len = 0x1e0,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
>>>> +    .features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>>>      },
>>>>      {
>>>>      .name = "ctl_1", .id = CTL_1,
>>>>      .base = 0x1200, .len = 0x1e0,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
>>>> +    .features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>>>      },
>>>>      {
>>>>      .name = "ctl_2", .id = CTL_2,
>>>>      .base = 0x1400, .len = 0x1e0,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
>>>> +    .features = CTL_DPU_5_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>>>      },
>>>>      {
>>>>      .name = "ctl_3", .id = CTL_3,
>>>>      .base = 0x1600, .len = 0x1e0,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
>>>> +    .features = CTL_DPU_5_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>>>>      },
>>>>      {
>>>>      .name = "ctl_4", .id = CTL_4,
>>>>      .base = 0x1800, .len = 0x1e0,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
>>>> +    .features = CTL_DPU_5_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>>>>      },
>>>>      {
>>>>      .name = "ctl_5", .id = CTL_5,
>>>>      .base = 0x1a00, .len = 0x1e0,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
>>>> +    .features = CTL_DPU_5_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>>>>      },
>>>>  };
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>>> index 66762a0706de..78f8b2506675 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>>> @@ -40,19 +40,19 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
>>>>      {
>>>>      .name = "ctl_0", .id = CTL_0,
>>>>      .base = 0x1000, .len = 0x1dc,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
>>>> +    .features = CTL_DPU_5_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>>>      },
>>>>      {
>>>>      .name = "ctl_1", .id = CTL_1,
>>>>      .base = 0x1200, .len = 0x1dc,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
>>>> +    .features = CTL_DPU_5_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>>>      },
>>>>      {
>>>>      .name = "ctl_2", .id = CTL_2,
>>>>      .base = 0x1400, .len = 0x1dc,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
>>>> +    .features = CTL_DPU_5_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>>>      },
>>>>  };
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
>>>> index 2849c017ddf2..4f42105d3755 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
>>>> @@ -21,7 +21,7 @@ static const struct dpu_ctl_cfg dpu_6_lm1_ctl[] = {
>>>>      {
>>>>      .name = "ctl_0", .id = CTL_0,
>>>>      .base = 0x1000, .len = 0x1dc,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG),
>>>> +    .features = CTL_DPU_5_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>>>      },
>>>>  };
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>>> index 60ad844cfa25..6826758fa202 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>>> @@ -46,37 +46,37 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
>>>>      {
>>>>      .name = "ctl_0", .id = CTL_0,
>>>>      .base = 0x15000, .len = 0x1e8,
>>>> -    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>>>> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>>>      },
>>>>      {
>>>>      .name = "ctl_1", .id = CTL_1,
>>>>      .base = 0x16000, .len = 0x1e8,
>>>> -    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>>>> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>>>      },
>>>>      {
>>>>      .name = "ctl_2", .id = CTL_2,
>>>>      .base = 0x17000, .len = 0x1e8,
>>>> -    .features = CTL_SC7280_MASK,
>>>> +    .features = CTL_DPU_7_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>>>      },
>>>>      {
>>>>      .name = "ctl_3", .id = CTL_3,
>>>>      .base = 0x18000, .len = 0x1e8,
>>>> -    .features = CTL_SC7280_MASK,
>>>> +    .features = CTL_DPU_7_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>>>>      },
>>>>      {
>>>>      .name = "ctl_4", .id = CTL_4,
>>>>      .base = 0x19000, .len = 0x1e8,
>>>> -    .features = CTL_SC7280_MASK,
>>>> +    .features = CTL_DPU_7_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>>>>      },
>>>>      {
>>>>      .name = "ctl_5", .id = CTL_5,
>>>>      .base = 0x1a000, .len = 0x1e8,
>>>> -    .features = CTL_SC7280_MASK,
>>>> +    .features = CTL_DPU_7_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>>>>      },
>>>>  };
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>>> index 387f2b6c5b56..c5981ea3ec7c 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>>> @@ -39,25 +39,25 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
>>>>      {
>>>>      .name = "ctl_0", .id = CTL_0,
>>>>      .base = 0x15000, .len = 0x1e8,
>>>> -    .features = CTL_SC7280_MASK,
>>>> +    .features = CTL_DPU_7_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>>>      },
>>>>      {
>>>>      .name = "ctl_1", .id = CTL_1,
>>>>      .base = 0x16000, .len = 0x1e8,
>>>> -    .features = CTL_SC7280_MASK,
>>>> +    .features = CTL_DPU_7_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>>>      },
>>>>      {
>>>>      .name = "ctl_2", .id = CTL_2,
>>>>      .base = 0x17000, .len = 0x1e8,
>>>> -    .features = CTL_SC7280_MASK,
>>>> +    .features = CTL_DPU_7_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>>>      },
>>>>      {
>>>>      .name = "ctl_3", .id = CTL_3,
>>>>      .base = 0x18000, .len = 0x1e8,
>>>> -    .features = CTL_SC7280_MASK,
>>>> +    .features = CTL_DPU_7_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>>>>      },
>>>>  };
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
>>>> index 80a7b0670467..5c87e919ea22 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
>>>> @@ -41,37 +41,37 @@ static const struct dpu_ctl_cfg dpu_8_lm6_ctl[] = {
>>>>      {
>>>>      .name = "ctl_0", .id = CTL_0,
>>>>      .base = 0x15000, .len = 0x204,
>>>> -    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>>>> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>>>      },
>>>>      {
>>>>      .name = "ctl_1", .id = CTL_1,
>>>>      .base = 0x16000, .len = 0x204,
>>>> -    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>>>> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>>>      },
>>>>      {
>>>>      .name = "ctl_2", .id = CTL_2,
>>>>      .base = 0x17000, .len = 0x204,
>>>> -    .features = CTL_SC7280_MASK,
>>>> +    .features = CTL_DPU_7_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>>>      },
>>>>      {
>>>>      .name = "ctl_3", .id = CTL_3,
>>>>      .base = 0x18000, .len = 0x204,
>>>> -    .features = CTL_SC7280_MASK,
>>>> +    .features = CTL_DPU_7_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>>>>      },
>>>>      {
>>>>      .name = "ctl_4", .id = CTL_4,
>>>>      .base = 0x19000, .len = 0x204,
>>>> -    .features = CTL_SC7280_MASK,
>>>> +    .features = CTL_DPU_7_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>>>>      },
>>>>      {
>>>>      .name = "ctl_5", .id = CTL_5,
>>>>      .base = 0x1a000, .len = 0x204,
>>>> -    .features = CTL_SC7280_MASK,
>>>> +    .features = CTL_DPU_7_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>>>>      },
>>>>  };
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>>> index 53db0049eecc..334946c8d4e8 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>>> @@ -48,37 +48,37 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
>>>>      {
>>>>      .name = "ctl_0", .id = CTL_0,
>>>>      .base = 0x15000, .len = 0x290,
>>>> -    .features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>>>> +    .features = CTL_DPU_9_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>>>      },
>>>>      {
>>>>      .name = "ctl_1", .id = CTL_1,
>>>>      .base = 0x16000, .len = 0x290,
>>>> -    .features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>>>> +    .features = CTL_DPU_9_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>>>      },
>>>>      {
>>>>      .name = "ctl_2", .id = CTL_2,
>>>>      .base = 0x17000, .len = 0x290,
>>>> -    .features = CTL_SM8550_MASK,
>>>> +    .features = CTL_DPU_9_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>>>      },
>>>>      {
>>>>      .name = "ctl_3", .id = CTL_3,
>>>>      .base = 0x18000, .len = 0x290,
>>>> -    .features = CTL_SM8550_MASK,
>>>> +    .features = CTL_DPU_9_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>>>>      },
>>>>      {
>>>>      .name = "ctl_4", .id = CTL_4,
>>>>      .base = 0x19000, .len = 0x290,
>>>> -    .features = CTL_SM8550_MASK,
>>>> +    .features = CTL_DPU_9_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>>>>      },
>>>>      {
>>>>      .name = "ctl_5", .id = CTL_5,
>>>>      .base = 0x1a000, .len = 0x290,
>>>> -    .features = CTL_SM8550_MASK,
>>>> +    .features = CTL_DPU_9_MASK,
>>>>      .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>>>>      },
>>>>  };
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> index 6b78554df30c..3c604f7b88aa 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> @@ -65,11 +65,15 @@
>>>>  #define PINGPONG_SDM845_SPLIT_MASK \
>>>>      (PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>>>>
>>>> -#define CTL_SC7280_MASK \
>>>> -    (BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
>>>> +#define CTL_DPU_0_MASK  (0)
>>>>
>>>> -#define CTL_SM8550_MASK \
>>>> -    (CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
>>>> +#define CTL_DPU_5_MASK (CTL_DPU_0_MASK | BIT(DPU_CTL_ACTIVE_CFG))
>>>> +
>>>> +#define CTL_DPU_7_MASK \
>>>> +    (CTL_DPU_5_MASK | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
>>>> +
>>>> +#define CTL_DPU_9_MASK \
>>>> +    (CTL_DPU_7_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
>>>>
>>>>  #define MERGE_3D_SM8150_MASK (0)
>>>>
> 
> 
> 
