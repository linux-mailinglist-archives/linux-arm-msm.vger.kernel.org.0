Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1878E732269
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 00:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237077AbjFOWGb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 18:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232710AbjFOWGa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 18:06:30 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092A5EC
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 15:06:29 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f764e9295dso4003879e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 15:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686866787; x=1689458787;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7do2+l6iIUXfCR6RYBIpsowK7XtIMm6v3NKEVizuFw=;
        b=iJiRT+rDGwgilDc5rm3UslkZ04T+SvWiacTsyW6Kwqts/7Y+wV33TlA6HYgHWezeri
         oVRvp+BxyntXFgytoQ0DS1pWuEAPDoPCIMRW5RLbh4ncqJd1JirF3nXnsEy1K+1XoWYN
         uqhI8LUTH0+DxWCr5MsO+r94g/xsFzIHvG+bc7zBO/oDa0u/HHcvT61KTeNVBhUoshRU
         U5XMSTX3eibJ0TZYs1BjHXnqb8au17PucbRnddBO+cvMa53/5/V7cKgJyDBlLZ9h+P60
         VF4ELofV0+s/VDFW3ybm96I8yCUZG3U83qg3BhSNHipwrbrCsB5pR9jN143GBIxTHeMO
         /1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686866787; x=1689458787;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7do2+l6iIUXfCR6RYBIpsowK7XtIMm6v3NKEVizuFw=;
        b=QztD7VmTB6zaEtmcLrxtkpkP+90OSZZWu2oosxC9+MnzxyXgaJ+xB1d6o+MhoJ3pnD
         6HU1xQkvRY7MGnOtGru58UAkb4JlVnh0wBPJyX6Llpnt5AOnTMXp0H6W5Mgrw5PxoDeC
         tr+U3XDTZQUklbIPOXai/H7haX48J5vlimD3YHZ3Ch2WoT+3FkfXNUsYAE79D/o8yZfT
         Ul97YgIdXtCpM4KWplsHc/BPs9QENazuGx7AGRn+lda56e55bfHi8FRPvjmogcJssTsb
         V4L1a8S9X9sL6zaw0B21idc1qGJGexiX31S+HwIlR7H/dxMQ9yy+Pgxemizv0dTGY0sl
         hjMg==
X-Gm-Message-State: AC+VfDxxaMLaheRFn5mDmGu/L7e72D8JY/ptnJGge73l9Dlc5s609FDh
        O8r0fgoK/DrSj2AYzvElD3JCMw==
X-Google-Smtp-Source: ACHHUZ4Sz1qbRe/i0uuwojkrwXL/c3/tGk5IrTkwh2q+JrvhJyOreV2EJaj7ybr6x/tIKJ1StRvnTg==
X-Received: by 2002:a19:8c5a:0:b0:4f6:1969:e4a7 with SMTP id i26-20020a198c5a000000b004f61969e4a7mr29156lfj.24.1686866787077;
        Thu, 15 Jun 2023 15:06:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id h22-20020ac25976000000b004f5e681eec1sm2764724lfp.92.2023.06.15.15.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 15:06:26 -0700 (PDT)
Message-ID: <81ef194c-9b15-b741-1bf8-c154d874c203@linaro.org>
Date:   Fri, 16 Jun 2023 01:06:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 16/21] drm/msm/dpu: inline DSC_BLK macros
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
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
 <20230613001004.3426676-18-dmitry.baryshkov@linaro.org>
 <73pqnayg6fuqjbrmc7yw3n5sdbthedumgluvjonc5vzl2mhf75@ab3poosthmcd>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <73pqnayg6fuqjbrmc7yw3n5sdbthedumgluvjonc5vzl2mhf75@ab3poosthmcd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/06/2023 01:05, Marijn Suijten wrote:
> On 2023-06-13 03:09:56, Dmitry Baryshkov wrote:
>> To simplify making changes to the hardware block definitions, expand
>> corresponding macros. This way making all the changes are more obvious
>> and visible in the source files.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 11 +++++--
>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 17 +++++++---
>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 21 ++++++++++---
>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 31 +++++++++++++++----
>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 21 ++++++++++---
>>   .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  6 +++-
>>   .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  6 +++-
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 10 ------
>>   8 files changed, 91 insertions(+), 32 deletions(-)
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
>> +		.features = 0,
>> +	}, {
>> +		.name = "dsc_1", .id = DSC_1,
>> +		.base = 0x80400, .len = 0x1800,
>> +		.features = 0,
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
>> index bf1c0024a55a..20262eb56b48 100644
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
>> index bf50ae6c525d..b9984ae6e7ed 100644
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
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index eb046079bb37..f563e513cbd0 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -482,16 +482,6 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>>   	.sblk = NULL \
>>   	}
>>   
>> -/*************************************************************
>> - * DSC sub blocks config
>> - *************************************************************/
>> -#define DSC_BLK(_name, _id, _base, _features) \
>> -	{\
>> -	.name = _name, .id = _id, \
>> -	.base = _base, .len = 0x140, \
>> -	.features = _features, \
>> -	}
>> -
> 
> This doesn't apply.
> 
> What happened here?  This is patch 16/21, however the patch before it is
> 16/22 and that already deleted DSC_BLK and DSC_BLK_1_2... Did an old and
> new format-patch -v2 series end up in the same local folder by accident?

It seems so. Please ignore this patch 16.

> 
> - Marijn
> 
>>   /*************************************************************
>>    * INTF sub blocks config
>>    *************************************************************/
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

