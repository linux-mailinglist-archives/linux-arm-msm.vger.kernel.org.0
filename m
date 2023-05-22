Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1FFB70CD62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 00:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbjEVWB4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 18:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjEVWBz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 18:01:55 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 542A5F1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 15:01:53 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f4b384c09fso1420224e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 15:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684792911; x=1687384911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+/G3isEebYVnQkpEDufiHIw20Q2PmgO1gt5TFlpDZGY=;
        b=C+POny1/V1DgCdh9d3ZMGcGX7cVDodwUdyDpo5mfCIo0jdlAIQvHiXt/KRa2AXqhu0
         9C+ANafrzRNLsOdio4N0dVCDE7jnckawUGK0gWHveoP5Q4n5qA7sSC3TTn6QXv/F7hDH
         aAT+IrvkgLHLoXF4hJLqEkrzs/Agie9rxAKO73vCYzxLt6EiRxfMDc8a0f0lG0GNIpWz
         IjLI1gJIbPDSb0siTrxsTsDVRqf9vI3/RPVqAdtvZZaNWJHBfjphstyCZdjjFuKOzyNn
         pnI+uPTfeSm87EpdUOsYgOwdZuey8l2PLmrV+euWXxffNV/84YU70J/URmrI1llm45XI
         8akQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684792911; x=1687384911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/G3isEebYVnQkpEDufiHIw20Q2PmgO1gt5TFlpDZGY=;
        b=cu7msqXET5A0rlRFbC+rlrQGQ7U6VvDRWFPz2rFoxE4OhbJvdDJ3n/GMQWoqFZmAk6
         bq8VoCBB1RQZiPhLumPN64QyemIcNy36m4Ic1oqGZlZNIVQB0uUvg8G2Pwbokvpv4JRX
         GM1DKmU0kieyXVuFG+FK/atY9iA/ERYDEgFBcXEbgp9Y6408gCsHHo70pTVlbz9FH11C
         HT0cRId8pl+DDzn4LBfW251PqVESMjXPT3iIM6b5GjY3hsZwosMSycRHobwXypxdCyJ3
         XGC2kQnNqro6sFWbVLVLRjqOdztTnl26QlMbUrZk7Od6oXBd19wY49pEqZ/NefoYIBNG
         zWXA==
X-Gm-Message-State: AC+VfDzmzJCnnp88WpG/iohiQiTtU+SmsKPWzuJn3HH5dsnVpmn0bVbs
        fSL3qo90d4CDsMP2ZVDs9fYm0g==
X-Google-Smtp-Source: ACHHUZ6NVKtNJSr1fVOh3Z62x9RbB7heViKNkHG2IK9C9LUgBU0WK6MQkBF+5IVt8DnxBxQDJ65XHA==
X-Received: by 2002:ac2:4315:0:b0:4f3:8196:80cb with SMTP id l21-20020ac24315000000b004f3819680cbmr3702795lfh.41.1684792911492;
        Mon, 22 May 2023 15:01:51 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id i7-20020a056512006700b004cc9042c9cfsm1106472lfo.158.2023.05.22.15.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 15:01:51 -0700 (PDT)
Message-ID: <bf4f2183-dba2-d8c6-2ad5-2c0dcee7810e@linaro.org>
Date:   Tue, 23 May 2023 01:01:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/6] drm/msm/dpu: don't set DPU_INTF_TE globally
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
 <20230522214527.190054-2-dmitry.baryshkov@linaro.org>
 <tc35qb4qkzoanna5mqiibdfv5ascdm2wtcalbspr4u64nwkc3v@itowzdap5vjq>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <tc35qb4qkzoanna5mqiibdfv5ascdm2wtcalbspr4u64nwkc3v@itowzdap5vjq>
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

On 23/05/2023 00:56, Marijn Suijten wrote:
> Title suggestion: s/globally/on non-TE/DSI (INTF) blocks
> 
> On 2023-05-23 00:45:22, Dmitry Baryshkov wrote:
>> Using BIT(DPU_INTF_TE) in INTF_SC7180_MASK (and by extension in
>> INTF_SC7280_MASK) results in this bit (and corrsponding operations)
>> being enabled for all interfaces, even the ones which do not have TE
>> block. Move this bit setting to INTF_DSI_TE(), so that it is only
>> enabled for those INTF blocks which have TE support.
>>
>> Fixes: 152c1d430992 ("drm/msm/dpu: Add TEAR-READ-pointer interrupt to INTF block")
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> We've always been setting flags globally but I guess it makes sense to
> not only restrict this flag to DPU >= 5.0.0 but also just the few
> hardware blocks that actually have these in their *enlarged* register
> space (and have the interrupt).
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 1dee5ba2b312..162141cb5c83 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -101,7 +101,6 @@
>>   
>>   #define INTF_SC7180_MASK \
>>   	(BIT(DPU_INTF_INPUT_CTRL) | \
>> -	 BIT(DPU_INTF_TE) | \
>>   	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
>>   	 BIT(DPU_DATA_HCTL_EN))
>>   
>> @@ -544,7 +543,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>>   	{\
>>   	.name = _name, .id = _id, \
>>   	.base = _base, .len = _len, \
>> -	.features = _features, \
>> +	.features = _features | BIT(DPU_INTF_TE), \
> 
> Now that we're more broadly switching to this pattern, should we do the
> same for PP_BLK() with and without TE block?  That way we can also
> forcefully initialize intr_rdptr=-1 similar to what I did for
> intr_tear_rd_ptr in INTF_BLK() (vs INTF_BLK_DSI_TE) here, instead of
> having the -1's floating around the catalog when I added them in commit
> 7952f5180eb3e ("drm/msm/dpu: Remove intr_rdptr from DPU >= 5.0.0
> pingpong config").

If we are going to expand the macros, then hiding -1 probably doesn't 
make sense as it will reappear soon.

Probably it makes sense to do another thing (which would play better 
with the expanded macros): increase IRQ indices by 1, making 'NO IRQ' 
equal to 0 instead of -1. This way all non-existing interrupts can be 
omitted during macros expansion. WDYT?

> 
> - Marijn
> 
>>   	.type = _type, \
>>   	.controller_id = _ctrl_id, \
>>   	.prog_fetch_lines_worst_case = _progfetch, \
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

