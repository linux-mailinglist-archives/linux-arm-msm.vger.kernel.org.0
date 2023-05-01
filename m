Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3B16F3A60
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 00:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjEAWU3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 18:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjEAWU2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 18:20:28 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F3AEC
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 15:20:26 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4ec8148f73eso3634817e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 15:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682979625; x=1685571625;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2gdNweICcIcd6LA8fyCmb9oSxh/3nexy4N7eRxWxvCo=;
        b=q10bCBPfFfglixMg6jhybaJmY4v/F1zoR3nAfLgEFNN+xmwnzAMgJ4RnvjZmmFI3vO
         T6lbPuvSfY3yEW6RPtQjUTsK2i4at/X1IadaDf+dcYMF0zGAIZSk1LH7+5g3D4JWbfMW
         cxIp7YPjBu0G6BLVYRsBmCvDTER+6Wk4ZvgGWs9UDLJMr1SPi9BlxEbRkdrb4Qqw36dy
         N4U25xVlUDE9DgPElAIRspdPXWL/xiOAheZZscsHdEm6+8LXca+0DoZMsLmtaI9cq2XZ
         8GHT5wSweURY3qEwYKAMjpEKqmtTzTPxcvQ12nzQOABMv911WORqH9XQ3c73lmsbV8sY
         pNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682979625; x=1685571625;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2gdNweICcIcd6LA8fyCmb9oSxh/3nexy4N7eRxWxvCo=;
        b=TYvd/JmJLe/bTk4+OfU+T2/lIAFEqfmHYPgPXF10w3bb+GhdIIRdBc+QflMQ7VtW3K
         +il7+KFcpVpKEaL5BjxG6VnCmk7HNBKpxajru0I1278stTy2b6PPGiaY2fjGKyeKOTyz
         CaOq0Rt6f89bmBV3IPb4JyHi+IHWaJBRSePVporVb75ySbBRzyJHszHB6ziMsxignAO+
         gdptbfxXY/VJ6509ja6WAJq+TWqnCLlNKWtpu5udqGErF8gYtT63yMSX6yO+Rw7bEGU2
         1JkF91zvXJ96u2XMZOGvV2KXNh5DbBB3ZP6WzkSoovVtoxNNODQaT/6qV2ywUyRDJXPp
         dEMg==
X-Gm-Message-State: AC+VfDwt8vGqCJHNl07WzHUGGdMIGBfGcpOvaQ5PFINhGNijJap6irwY
        k7xqKzNGCnIff0SIV9CbZ9Oj4fHFfIi9Vmo5fNA=
X-Google-Smtp-Source: ACHHUZ5IE1LwBNBw554PWeeruy31Kz9pc3hCYOQ5wT9CrGyg+/pJZUxZYa69soJer6HDM9sb8d//QA==
X-Received: by 2002:ac2:5a0e:0:b0:4ef:d5dd:8bba with SMTP id q14-20020ac25a0e000000b004efd5dd8bbamr3631020lfn.53.1682979624863;
        Mon, 01 May 2023 15:20:24 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b7-20020a056512024700b004e7fa99f3f4sm4938514lfo.265.2023.05.01.15.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 15:20:24 -0700 (PDT)
Message-ID: <ba4f3c08-37a8-5b0b-22cd-241b0e465509@linaro.org>
Date:   Tue, 2 May 2023 01:20:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/4] drm/msm/dpu: use PINGPONG_NONE for LMs with no PP
 attached
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
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
 <20230430203556.3184252-4-dmitry.baryshkov@linaro.org>
 <alkcwa7qrqtwjxis4eish5aiqcp5o5uanlpo26gjhk76fx7spj@pcv7ibcnrdvo>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <alkcwa7qrqtwjxis4eish5aiqcp5o5uanlpo26gjhk76fx7spj@pcv7ibcnrdvo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/05/2023 01:17, Marijn Suijten wrote:
> On 2023-04-30 23:35:55, Dmitry Baryshkov wrote:
>> On msm8998/sdm845 some LM blocks do not have corresponding PINGPONG
>> block. Currently the driver uses PINGPONG_MAX for such cases. Switch
>> that to use PINGPONG_NONE instead, which is more logical.
> 
> dpu_lm_cfg::pingpong still has a doc-comment stating that PINGPONG_MAX
> is to be used if this is unsupported, that should be updated to read
> PINGPONG_NONE as well.


Ack, missed that. Thanks for the note.

> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Good cleanup otherwise:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h             | 3 ++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                  | 2 +-
>>   4 files changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> index bdcd554fc8a8..6ae30f806ebc 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> @@ -104,9 +104,9 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
>>   	LM_BLK("lm_2", LM_2, 0x46000, MIXER_MSM8998_MASK,
>>   		&msm8998_lm_sblk, PINGPONG_2, LM_5, 0),
>>   	LM_BLK("lm_3", LM_3, 0x47000, MIXER_MSM8998_MASK,
>> -		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
>> +		&msm8998_lm_sblk, PINGPONG_NONE, 0, 0),
>>   	LM_BLK("lm_4", LM_4, 0x48000, MIXER_MSM8998_MASK,
>> -		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
>> +		&msm8998_lm_sblk, PINGPONG_NONE, 0, 0),
>>   	LM_BLK("lm_5", LM_5, 0x49000, MIXER_MSM8998_MASK,
>>   		&msm8998_lm_sblk, PINGPONG_3, LM_2, 0),
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> index ceca741e93c9..4a94fd9b64a9 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> @@ -102,9 +102,9 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
>>   	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
>>   		&sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
>>   	LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
>> -		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
>> +		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
>>   	LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
>> -		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
>> +		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
>>   	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
>>   		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> index 2d9192a6ce00..56826a92c155 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> @@ -191,7 +191,8 @@ enum dpu_dsc {
>>   };
>>   
>>   enum dpu_pingpong {
>> -	PINGPONG_0 = 1,
>> +	PINGPONG_NONE,
>> +	PINGPONG_0,
>>   	PINGPONG_1,
>>   	PINGPONG_2,
>>   	PINGPONG_3,
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index d5a06628885e..bf7b8e7c45b1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -117,7 +117,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>>   		struct dpu_hw_mixer *hw;
>>   		const struct dpu_lm_cfg *lm = &cat->mixer[i];
>>   
>> -		if (lm->pingpong == PINGPONG_MAX) {
>> +		if (lm->pingpong == PINGPONG_NONE) {
>>   			DPU_DEBUG("skip mixer %d without pingpong\n", lm->id);
>>   			continue;
>>   		}
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

