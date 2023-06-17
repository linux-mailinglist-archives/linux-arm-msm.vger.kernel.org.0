Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF8A2733D4F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 02:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjFQAqM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 20:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbjFQAqL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 20:46:11 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C5463A9D
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 17:46:08 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b466073e19so3491231fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 17:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686962766; x=1689554766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bxjPlH7ewWCbvxYkJoS5xuxQI+o0feICQyJMaLbHsa8=;
        b=Ylocz5wE6NIs7xkim7qGrM4+4XzKpQu6OzI+AQe+kMfbwKTpvx9bfRXjJMpXVVAcnd
         lYgPedUVrTcb+ObkG+oSOgPoIFRwo/2xtngBZQCncN3L7A1YasNtO4saGvcwI4qbJ1iC
         ygBrtIgBa5AzcnOnKDFo9yeoYVR8QRspWqcBl3NRmIpE9ArQLWiP/KIiFTkPwgU3+LGE
         8QU5c/DEM0tz1LZg6EtVyL/AxZgBind6eRfpH/hMe2dzval8je2g7yD9qCBqTq/izH9i
         GZi5Ahw5AZ6QyceSTOogigMOVfaJvi/q2U2OWb2Bnc+UYYDHOW1OGoYQvpti5Xh0lUOq
         Bt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686962766; x=1689554766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxjPlH7ewWCbvxYkJoS5xuxQI+o0feICQyJMaLbHsa8=;
        b=c9PjWR9JsYqeQ4pYhjDILf8MROQFwFJdDK6laa02l2HH2vk0L54RaDDF3YeYsItp57
         w0vJQicMbJtD2NpdAdTrbg9A9fus1k0byuzGQU7GK1pNZNF2drPvW5YN5Jh3QCxCS/Ky
         nftrh8bzn5CcEdJ2nloR+iN3W6Zj9T8NyturODhzZ5ERbQ7imI/y9KVhwPXuDG8ORY1G
         yCbFyTBz+OYWJ3h2E0FqitG7rFrmeI9Pj2mejP4WqId11kpU/60jYlOcO4P3lPv2D0bX
         X+oXCii9OFgQjalVg98tU68JyLA7iSmZon3ojqvb5mjsuIBJOfgQfVsYpXDcMpMVJPI9
         ukfw==
X-Gm-Message-State: AC+VfDyEk7Y7Y9pT0B3WzWLYp5FOshOnvbuJG3HZPcpsxPNj5ZRow7gF
        QU1fhaHzNkeAqfyScjBVvmMnwQ==
X-Google-Smtp-Source: ACHHUZ76DFLz2RC3MdwIyIgru+KjisXmP2jh3OJ9xKyAC/aAFFo8Tp2EFC/K4omU+pZZC6wThmEeZw==
X-Received: by 2002:a2e:a601:0:b0:2b4:4bb7:2618 with SMTP id v1-20020a2ea601000000b002b44bb72618mr2779336ljp.19.1686962766497;
        Fri, 16 Jun 2023 17:46:06 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m9-20020a2e9109000000b002ad8fc8dda6sm3885815ljg.17.2023.06.16.17.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 17:46:05 -0700 (PDT)
Message-ID: <59f626df-a318-146d-983c-4115294061d1@linaro.org>
Date:   Sat, 17 Jun 2023 03:46:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 13/19] drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2
 macros
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-14-dmitry.baryshkov@linaro.org>
 <hqeaevuzndrls2ypnmpcxtvnitzcyh4lmse5c2hbu3kotjupzf@245vvhk74pes>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <hqeaevuzndrls2ypnmpcxtvnitzcyh4lmse5c2hbu3kotjupzf@245vvhk74pes>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/06/2023 01:59, Marijn Suijten wrote:
> On 2023-06-16 13:03:11, Dmitry Baryshkov wrote:
>> To simplify making changes to the hardware block definitions, expand
>> corresponding macros. This way making all the changes are more obvious
>> and visible in the source files.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 11 +++++-
>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 17 +++++++--
>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 21 +++++++++--
>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 31 +++++++++++++---
>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 21 +++++++++--
>>   .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  6 ++-
>>   .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  6 ++-
>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 25 +++++++++++--
>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 +++-
>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 37 ++++++++++++++++---
>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 25 +++++++++++--
>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 25 +++++++++++--
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 15 --------
>>   13 files changed, 191 insertions(+), 56 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> index a07c68744b29..7c3da4033c46 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> @@ -200,8 +200,15 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
>>   };
>>   
>>   static const struct dpu_dsc_cfg msm8998_dsc[] = {
>> -	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
>> -	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
>> +	{
>> +		.name = "dsc_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x1800,
> 
> This length (here and for all other DSC v1.1 blocks) was 0x140, why is
> it 0x1800 now?

Thanks for noticiing this, it seems it creeped from the regexp. I'll 
recheck this.

> 
>> +		.features = 0,
>> +	}, {
>> +		.name = "dsc_1", .id = DSC_1,
>> +		.base = 0x80400, .len = 0x1800,
>> +		.features = 0,
> 
> Seems you forgot to drop the zero features from MSM8998 :)
> 
> - Marijn
> 
>> +	},
>>   };
>>   
>>   static const struct dpu_dspp_cfg msm8998_dspp[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> index 786263ed1ef2..ca3bb6a1a93a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> @@ -224,10 +224,19 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
>>   };
>>   
>>   static const struct dpu_dsc_cfg sdm845_dsc[] = {
>> -	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
>> -	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
>> -	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
>> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
>> +	{
>> +		.name = "dsc_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x1800,
>> +	}, {
>> +		.name = "dsc_1", .id = DSC_1,
>> +		.base = 0x80400, .len = 0x1800,
>> +	}, {
>> +		.name = "dsc_2", .id = DSC_2,
>> +		.base = 0x80800, .len = 0x1800,
>> +	}, {
>> +		.name = "dsc_3", .id = DSC_3,
>> +		.base = 0x80c00, .len = 0x1800,
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sdm845_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>> index 6b9bfeac6e0a..5b068521de13 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>> @@ -245,10 +245,23 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
>>   };
>>   
>>   static const struct dpu_dsc_cfg sm8150_dsc[] = {
>> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +	{
>> +		.name = "dsc_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x1800,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_1", .id = DSC_1,
>> +		.base = 0x80400, .len = 0x1800,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_2", .id = DSC_2,
>> +		.base = 0x80800, .len = 0x1800,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_3", .id = DSC_3,
>> +		.base = 0x80c00, .len = 0x1800,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sm8150_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> index 414f0db3306c..ba5420f334ec 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> @@ -244,12 +244,31 @@ static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
>>   };
>>   
>>   static const struct dpu_dsc_cfg sc8180x_dsc[] = {
>> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_4", DSC_4, 0x81000, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_5", DSC_5, 0x81400, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +	{
>> +		.name = "dsc_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x1800,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_1", .id = DSC_1,
>> +		.base = 0x80400, .len = 0x1800,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_2", .id = DSC_2,
>> +		.base = 0x80800, .len = 0x1800,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_3", .id = DSC_3,
>> +		.base = 0x80c00, .len = 0x1800,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_4", .id = DSC_4,
>> +		.base = 0x81000, .len = 0x1800,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_5", .id = DSC_5,
>> +		.base = 0x81400, .len = 0x1800,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sc8180x_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> index db3a65b011ca..01b61467a700 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> @@ -245,10 +245,23 @@ static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
>>   };
>>   
>>   static const struct dpu_dsc_cfg sm8250_dsc[] = {
>> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +	{
>> +		.name = "dsc_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x1800,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_1", .id = DSC_1,
>> +		.base = 0x80400, .len = 0x1800,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_2", .id = DSC_2,
>> +		.base = 0x80800, .len = 0x1800,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_3", .id = DSC_3,
>> +		.base = 0x80c00, .len = 0x1800,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sm8250_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>> index a996c39b7b1f..a9907010a4a2 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>> @@ -136,7 +136,11 @@ static struct dpu_pingpong_cfg sm6350_pp[] = {
>>   };
>>   
>>   static const struct dpu_dsc_cfg sm6350_dsc[] = {
>> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +	{
>> +		.name = "dsc_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x1800,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sm6350_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
>> index 0cdb77599583..e42f0dc3b2ab 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
>> @@ -90,7 +90,11 @@ static const struct dpu_pingpong_cfg sm6375_pp[] = {
>>   };
>>   
>>   static const struct dpu_dsc_cfg sm6375_dsc[] = {
>> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +	{
>> +		.name = "dsc_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x1800,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sm6375_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> index e08b29e9e146..8a9bfc4af72a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> @@ -248,10 +248,27 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
>>    * its own different sub block address.
>>    */
>>   static const struct dpu_dsc_cfg sm8350_dsc[] = {
>> -	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
>> -	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>> +	{
>> +		.name = "dce_0_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_0_1", .id = DSC_1,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_1,
>> +	}, {
>> +		.name = "dce_1_0", .id = DSC_2,
>> +		.base = 0x81000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_1_1", .id = DSC_3,
>> +		.base = 0x81000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_1,
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sm8350_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> index d5faa1816cb3..9c0beccce282 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> @@ -146,7 +146,12 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>>   
>>   /* NOTE: sc7280 only has one DSC hard slice encoder */
>>   static const struct dpu_dsc_cfg sc7280_dsc[] = {
>> -	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> +	{
>> +		.name = "dce_0_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_0,
>> +	},
>>   };
>>   
>>   static const struct dpu_wb_cfg sc7280_wb[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> index 8e4299be2b1c..b676819db42c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> @@ -246,12 +246,37 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
>>    * its own different sub block address.
>>    */
>>   static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
>> -	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
>> -	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>> -	DSC_BLK_1_2("dce_2_0", DSC_4, 0x82000, 0x29c, 0, dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_2_1", DSC_5, 0x82000, 0x29c, 0, dsc_sblk_1),
>> +	{
>> +		.name = "dce_0_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_0_1", .id = DSC_1,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_1,
>> +	}, {
>> +		.name = "dce_1_0", .id = DSC_2,
>> +		.base = 0x81000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_1_1", .id = DSC_3,
>> +		.base = 0x81000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_1,
>> +	}, {
>> +		.name = "dce_2_0", .id = DSC_4,
>> +		.base = 0x82000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_2_1", .id = DSC_5,
>> +		.base = 0x82000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_1,
>> +	},
>>   };
>>   
>>   /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> index bbee3c621943..568523abc1d0 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> @@ -259,10 +259,27 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
>>    * its own different sub block address.
>>    */
>>   static const struct dpu_dsc_cfg sm8450_dsc[] = {
>> -	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
>> -	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>> +	{
>> +		.name = "dce_0_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_0_1", .id = DSC_1,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_1,
>> +	}, {
>> +		.name = "dce_1_0", .id = DSC_2,
>> +		.base = 0x81000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_1_1", .id = DSC_3,
>> +		.base = 0x81000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_1,
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sm8450_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> index ea7bffe252a5..419624948e83 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> @@ -273,10 +273,27 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
>>    * its own different sub block address.
>>    */
>>   static const struct dpu_dsc_cfg sm8550_dsc[] = {
>> -	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
>> -	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>> +	{
>> +		.name = "dce_0_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_0_1", .id = DSC_1,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_1,
>> +	}, {
>> +		.name = "dce_1_0", .id = DSC_2,
>> +		.base = 0x81000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_1_1", .id = DSC_3,
>> +		.base = 0x81000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_1,
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sm8550_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 6ef0dc2e1a5d..ee24402bf253 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -495,21 +495,6 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
>>   	.ctl = {.base = 0xF80, .len = 0x10},
>>   };
>>   
>> -#define DSC_BLK(_name, _id, _base, _features) \
>> -	{\
>> -	.name = _name, .id = _id, \
>> -	.base = _base, .len = 0x140, \
>> -	.features = _features, \
>> -	}
>> -
>> -#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
>> -	{\
>> -	.name = _name, .id = _id, \
>> -	.base = _base, .len = _len, \
>> -	.features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
>> -	.sblk = &_sblk, \
>> -	}
>> -
>>   /*************************************************************
>>    * INTF sub blocks config
>>    *************************************************************/
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

