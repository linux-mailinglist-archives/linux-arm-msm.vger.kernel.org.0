Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B920E7BF527
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 10:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442638AbjJJIAh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 04:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442561AbjJJIAg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 04:00:36 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF93A9
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 01:00:33 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-405361bb94eso54645955e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 01:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696924832; x=1697529632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/jaDSg0h2/4Ol0qLjrsxRCrbIypE21zhgm82wEWYc8=;
        b=PWD4/L9aKAx7niuHflkuOOtmMSmB/DbkZ3yF6UKCo0u4YZOb0kifyARvHQ3G8Vsn/q
         UyHw8KklrnnuPCweu95SmfeU/Hq1bdiauI0pglwAZupA6YIL/g3EVN247jA7pB7aiS5m
         tk0Yiss3vutKZBQXJEr/77GrKg42/kjboqPOGUiLU/Q3SedxyKqtHp5ndqy2e5TejOh+
         Smyl5g4KB7fjf6tU5Gnm4lh7HNAOOP8N+aDi6wyykeU33wf2IAVSicaCjQ0ZIURQtTyx
         Bs5XwYaEBQtGNON/8TPTQ4qV9WoL6QUOZ0T1uR9ahQ6PqoXTSQ19paHvYH8pCMFk8JxI
         s//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696924832; x=1697529632;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E/jaDSg0h2/4Ol0qLjrsxRCrbIypE21zhgm82wEWYc8=;
        b=WzJURHPdUXn/yE53XZa75Q7em8ZnPTDNbUWqucHu1zzfrTSH5Z+zaUpInPFQ/aXf8I
         KlPgMPwijMr03ddoMGbTNGkpKRsigsRKp2ITyayDTz4u+9cVgFuWYH0wbXCqTl53ME3I
         2qy6XrivFNs4aUYLnvcuxugPWTVuUmro+uihy7CiRbXvLB5DG+mtsjOFzy6yWVXkFFsN
         VzfHIfSF/A94BO5Bv2pS+hhQFZ28OH2YS3KON4ihNfTlAcZevOYBcrl+C66A58RL40n2
         839Gn3A/vl9hyGb7uPhjERCMX983/RM/aJgD94+HM3JGjK4BAySDXJ3Avu+uQWcuFMSV
         WbjA==
X-Gm-Message-State: AOJu0Yw3FK66U3bojdVQoqsyAam/BAGyArkSKjKy+zEPkM54cbJVVaT5
        FbkuFDc58tfSVf3flXzyiuFCmQ==
X-Google-Smtp-Source: AGHT+IGcAr508rP9+dsaanjr3QBcaQhwx3fzN42TuNZvxPJX593aRXRJzKo3GlE55wFgZuFWw7m/lw==
X-Received: by 2002:a1c:4c03:0:b0:405:770b:e90a with SMTP id z3-20020a1c4c03000000b00405770be90amr15985758wmf.34.1696924831929;
        Tue, 10 Oct 2023 01:00:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:2eac:5b51:e0a4:4807? ([2a01:e0a:982:cbb0:2eac:5b51:e0a4:4807])
        by smtp.gmail.com with ESMTPSA id n24-20020a1c7218000000b004065e235417sm15483645wmc.21.2023.10.10.01.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 01:00:31 -0700 (PDT)
Message-ID: <cd6c14ad-dd86-4fe3-8264-5ec70cffdd1e@linaro.org>
Date:   Tue, 10 Oct 2023 10:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC 5/5] drm/msm: dpu1: sm8550: move split clock controls
 to sspp entries
Content-Language: en-US, fr
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20231009-topic-sm8550-graphics-sspp-split-clk-v1-0-806c0dee4e43@linaro.org>
 <20231009-topic-sm8550-graphics-sspp-split-clk-v1-5-806c0dee4e43@linaro.org>
 <7eecc9af-3d4f-43ba-8262-e58858bbe417@linaro.org>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <7eecc9af-3d4f-43ba-8262-e58858bbe417@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/10/2023 19:10, Dmitry Baryshkov wrote:
> On 09/10/2023 19:36, Neil Armstrong wrote:
>> The SM8550 has the SSPP clk_ctrl in the SSPP registers, move them
>> out of the MDP top.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 35 ++++++++++------------
>>   1 file changed, 15 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> index 7bed819dfc39..527ec020fba4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> @@ -24,16 +24,6 @@ static const struct dpu_mdp_cfg sm8550_mdp = {
>>       .base = 0, .len = 0x494,
>>       .features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>>       .clk_ctrls = {
>> -        [DPU_CLK_CTRL_VIG0] = { .reg_off = 0x4330, .bit_off = 0 },
>> -        [DPU_CLK_CTRL_VIG1] = { .reg_off = 0x6330, .bit_off = 0 },
>> -        [DPU_CLK_CTRL_VIG2] = { .reg_off = 0x8330, .bit_off = 0 },
>> -        [DPU_CLK_CTRL_VIG3] = { .reg_off = 0xa330, .bit_off = 0 },
>> -        [DPU_CLK_CTRL_DMA0] = { .reg_off = 0x24330, .bit_off = 0 },
>> -        [DPU_CLK_CTRL_DMA1] = { .reg_off = 0x26330, .bit_off = 0 },
>> -        [DPU_CLK_CTRL_DMA2] = { .reg_off = 0x28330, .bit_off = 0 },
>> -        [DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2a330, .bit_off = 0 },
>> -        [DPU_CLK_CTRL_DMA4] = { .reg_off = 0x2c330, .bit_off = 0 },
>> -        [DPU_CLK_CTRL_DMA5] = { .reg_off = 0x2e330, .bit_off = 0 },
>>           [DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
> 
> Hmm, interesting. I even double-checked this. SSPP and WB have their own clock registers now. But the REG_DMA uses the main area (0x2bc).

yeah

> 
>>       },
>>   };
>> @@ -73,6 +63,11 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
>>       },
>>   };
>> +static const struct dpu_clk_ctrl_reg sm8550_sspp_clk_ctrl = {
>> +    .reg_off = 0x330,
>> +    .bit_off = 0
>> +};
> 
> I don't think we even need this outside of dpu_hw_sspp. You can use core_major_rev to check whether the driver should use global clocks or per-SSPP / per-WB clocks register instead.

Ack

> 
>> +
>>   static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>       {
>>           .name = "sspp_0", .id = SSPP_VIG0,
>> @@ -81,7 +76,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>           .sblk = &sm8550_vig_sblk_0,
>>           .xin_id = 0,
>>           .type = SSPP_TYPE_VIG,
>> -        .clk_ctrl = DPU_CLK_CTRL_VIG0,
>> +        .clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>>       }, {
>>           .name = "sspp_1", .id = SSPP_VIG1,
>>           .base = 0x6000, .len = 0x344,
>> @@ -89,7 +84,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>           .sblk = &sm8550_vig_sblk_1,
>>           .xin_id = 4,
>>           .type = SSPP_TYPE_VIG,
>> -        .clk_ctrl = DPU_CLK_CTRL_VIG1,
>> +        .clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>>       }, {
>>           .name = "sspp_2", .id = SSPP_VIG2,
>>           .base = 0x8000, .len = 0x344,
>> @@ -97,7 +92,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>           .sblk = &sm8550_vig_sblk_2,
>>           .xin_id = 8,
>>           .type = SSPP_TYPE_VIG,
>> -        .clk_ctrl = DPU_CLK_CTRL_VIG2,
>> +        .clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>>       }, {
>>           .name = "sspp_3", .id = SSPP_VIG3,
>>           .base = 0xa000, .len = 0x344,
>> @@ -105,7 +100,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>           .sblk = &sm8550_vig_sblk_3,
>>           .xin_id = 12,
>>           .type = SSPP_TYPE_VIG,
>> -        .clk_ctrl = DPU_CLK_CTRL_VIG3,
>> +        .clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>>       }, {
>>           .name = "sspp_8", .id = SSPP_DMA0,
>>           .base = 0x24000, .len = 0x344,
>> @@ -113,7 +108,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>           .sblk = &sdm845_dma_sblk_0,
>>           .xin_id = 1,
>>           .type = SSPP_TYPE_DMA,
>> -        .clk_ctrl = DPU_CLK_CTRL_DMA0,
>> +        .clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>>       }, {
>>           .name = "sspp_9", .id = SSPP_DMA1,
>>           .base = 0x26000, .len = 0x344,
>> @@ -121,7 +116,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>           .sblk = &sdm845_dma_sblk_1,
>>           .xin_id = 5,
>>           .type = SSPP_TYPE_DMA,
>> -        .clk_ctrl = DPU_CLK_CTRL_DMA1,
>> +        .clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>>       }, {
>>           .name = "sspp_10", .id = SSPP_DMA2,
>>           .base = 0x28000, .len = 0x344,
>> @@ -129,7 +124,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>           .sblk = &sdm845_dma_sblk_2,
>>           .xin_id = 9,
>>           .type = SSPP_TYPE_DMA,
>> -        .clk_ctrl = DPU_CLK_CTRL_DMA2,
>> +        .clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>>       }, {
>>           .name = "sspp_11", .id = SSPP_DMA3,
>>           .base = 0x2a000, .len = 0x344,
>> @@ -137,7 +132,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>           .sblk = &sdm845_dma_sblk_3,
>>           .xin_id = 13,
>>           .type = SSPP_TYPE_DMA,
>> -        .clk_ctrl = DPU_CLK_CTRL_DMA3,
>> +        .clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>>       }, {
>>           .name = "sspp_12", .id = SSPP_DMA4,
>>           .base = 0x2c000, .len = 0x344,
>> @@ -145,7 +140,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>           .sblk = &sm8550_dma_sblk_4,
>>           .xin_id = 14,
>>           .type = SSPP_TYPE_DMA,
>> -        .clk_ctrl = DPU_CLK_CTRL_DMA4,
>> +        .clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>>       }, {
>>           .name = "sspp_13", .id = SSPP_DMA5,
>>           .base = 0x2e000, .len = 0x344,
>> @@ -153,7 +148,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>           .sblk = &sm8550_dma_sblk_5,
>>           .xin_id = 15,
>>           .type = SSPP_TYPE_DMA,
>> -        .clk_ctrl = DPU_CLK_CTRL_DMA5,
>> +        .clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>>       },
>>   };
>>
> 

