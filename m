Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7682526E8F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 09:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbiENGqg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 02:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbiENGqf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 02:46:35 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73CFF108
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 23:46:33 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id a23so4476009ljd.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 23:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XfZN8rK++Ccy0yCwneEOkb/2gbSG/TLS0b0ZXuJHIss=;
        b=PBuJoQ5EbTlTvdus3xkVpWfOqBmdAHsioY1/rBSCsFJR+0pe4OazR3fpPjZtnr75tM
         oEc5y58n8oZoLg9kn4IMvaivqhScBYdtkzJ9hYKuqHvKw36ph1tsV+UxPILjCFu7bjKM
         FebuBZ9i9xjhcN3QJ3Vp9/1iopGQWJmmL15pV4RyBds21JHNFFlLa+WGuuycvi+5aIJI
         lZYO/yGs63kDWjDW2lX9Vi36h9nmxnBWSUQQARdV21Qi16kcKK+75YkLjLhboShukFVU
         6SVmjAYM5KYT8KfB99BndXcQod4Wf4952mfTO0vogMi8Ct8UVxO6GY8+8etWPSk/3f6m
         O7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XfZN8rK++Ccy0yCwneEOkb/2gbSG/TLS0b0ZXuJHIss=;
        b=MF3yQDfs0I5qI1EXO7bpKz76Ohgcwz8SMzIdmXQwQ2XITmt63qURnq9dudCUImOfii
         Y5yV4Tiord2dmb3bztMSRx+R9sV5dTsciolzDXHxuovbDraUWjaBXhyQ5obovhpls+sN
         9SOPKzMGJ3eimNANezQY+xOw4Fyit9ZS40mVHxt8qKad5xNoPmav8sXGb3AgHWIQNtKl
         zEgB8mB5PFXOezhxurcaMcModadlUSofnDnWjRKsDV1j5/B56nA1w6xC4RuxCaZ2swSM
         jUYfx6ZMrcV3XOTBs7JdkNPVAaiC9uRDd8GJUlCZ6GKzg9Gi1LYka2DaMbmZNuPE7exu
         cjcg==
X-Gm-Message-State: AOAM532CheOz+cPHVtsW34bGEKHw/biWYPtYqraxjHeBugkVaOT6u0a+
        N1CMepUmGPsrOMseA8UCP2ONWg==
X-Google-Smtp-Source: ABdhPJwRNvDzyhvbPxcocJDBIFpixkQYTPD0B9lOGx862sHRKO1dEVBbMSAe9Y4b3Q8CwtyWBCCGww==
X-Received: by 2002:a2e:2c12:0:b0:250:8969:ced0 with SMTP id s18-20020a2e2c12000000b002508969ced0mr4870070ljs.244.1652510791741;
        Fri, 13 May 2022 23:46:31 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n6-20020a195506000000b0047255d211e0sm611898lfe.271.2022.05.13.23.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 23:46:31 -0700 (PDT)
Message-ID: <05e51a26-0fe9-dd2f-2d3f-3c6c467a40df@linaro.org>
Date:   Sat, 14 May 2022 09:46:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 13/25] drm/msm/dpu: pass dpu_format to
 _dpu_hw_sspp_setup_scaler3()
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-14-dmitry.baryshkov@linaro.org>
 <0fa56e8f-a169-e342-a670-89dc48ac3cdc@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <0fa56e8f-a169-e342-a670-89dc48ac3cdc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/05/2022 01:30, Abhinav Kumar wrote:
> 
> 
> On 2/9/2022 9:25 AM, Dmitry Baryshkov wrote:
>> There is no need to pass full dpu_hw_pipe_cfg instance to
>> _dpu_hw_sspp_setup_scaler3, pass just struct dpu_format pointer.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 9 ++++-----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 7 +++----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 4 ++--
>>   3 files changed, 9 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> index d8120168f974..7194c14f87bc 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> @@ -415,19 +415,18 @@ static void dpu_hw_sspp_setup_pe_config(struct 
>> dpu_hw_pipe *ctx,
>>   }
>>   static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
>> -        struct dpu_hw_pipe_cfg *sspp,
>> -        void *scaler_cfg)
> 
> This change does two things:
> 
> 1) pass fmt and stop passing dpu_hw_pipe_cfg
> 2) change the scaler_cfg from void to struct dpu_hw_scaler3_cfg
> 
> So it seems like we had this void casting to allow different versions of 
> the scaler to be passed and based on catalog bits the appropriate 
> structs can be used (scaler2/scaler3)
> 
> In the current DPU we have only scaler3. For that reason this is fine.
> 
> I do not know what versions of scaler we will support in DPU.
> 
> Do you think we can retain the void casting in this change and just 
> change passing the format?

Generally passing a void pointer for the known structure is a bad 
practice. You loose type safety for no added benefit.

I can take a look on the QSEED2 requirements.

>> +        struct dpu_hw_scaler3_cfg *scaler3_cfg,
>> +        const struct dpu_format *format)
>>   {
>>       u32 idx;
>> -    struct dpu_hw_scaler3_cfg *scaler3_cfg = scaler_cfg;
>> -    if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || !sspp
>> +    if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx)
>>           || !scaler3_cfg)
>>           return;
>>       dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg, idx,
>>               ctx->cap->sblk->scaler_blk.version,
>> -            sspp->layout.format);
>> +            format);
>>   }
>>   static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_pipe *ctx)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> index 74171fb4e585..eee8501ea80d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> @@ -334,13 +334,12 @@ struct dpu_hw_sspp_ops {
>>       /**
>>        * setup_scaler - setup scaler
>> -     * @ctx: Pointer to pipe context
>> -     * @pipe_cfg: Pointer to pipe configuration
>>        * @scaler_cfg: Pointer to scaler configuration
>> +     * @format: pixel format parameters
>>        */
>>       void (*setup_scaler)(struct dpu_hw_pipe *ctx,
>> -        struct dpu_hw_pipe_cfg *pipe_cfg,
>> -        void *scaler_cfg);
>> +        struct dpu_hw_scaler3_cfg *scaler3_cfg,
>> +        const struct dpu_format *format);
>>       /**
>>        * get_scaler_ver - get scaler h/w version
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 3ce7dcc285e2..e9421fa2fb2e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -646,8 +646,8 @@ static void _dpu_plane_setup_scaler(struct 
>> dpu_sw_pipe *pipe,
>>       if (pipe_hw->ops.setup_scaler &&
>>               pipe->multirect_index != DPU_SSPP_RECT_1)
>>           pipe_hw->ops.setup_scaler(pipe_hw,
>> -                pipe_cfg,
>> -                &scaler3_cfg);
>> +                &scaler3_cfg,
>> +                fmt);
>>   }
>>   /**


-- 
With best wishes
Dmitry
