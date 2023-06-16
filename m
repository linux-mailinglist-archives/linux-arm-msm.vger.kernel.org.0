Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2220E732C6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 11:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbjFPJqc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 05:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbjFPJqA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 05:46:00 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181892962
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 02:45:59 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b203891b2cso5800241fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 02:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686908757; x=1689500757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kXLM4NFaLwOKoRpyf+vOO8vBgPE/jR4bTbtGmnUq/5c=;
        b=En91242UsGlQP0bme45MubDUSzku9MUCw40vuwNsik+T6e79QMxSkB4l/nwuWmm1RV
         aI227qqMhYRWKdMi6fUnUYody8QKUo6jTuFWBTW6SAPhfB6t5VsB1S5TdyTgYD5YSu0m
         vz7TzvK4WPmZw3i+1KlUq0iLQ7ejidVKTrQvfoQ9ymbRIYCiAOGze4zxqONJc4Ycvjb1
         l99AxYqJucrK2NEbU+0pkWAB6tmdHXGXbvf2D4kuDib9SKwSHbHXfykxyC+4Si7Gqs1r
         8dtilI1mWouWnofeCLNk9GrDHuNmkfNpwBaiHbERo0uCExmtsW3WBXx16JGTv91v6ZH5
         +EKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686908757; x=1689500757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kXLM4NFaLwOKoRpyf+vOO8vBgPE/jR4bTbtGmnUq/5c=;
        b=WzAbewUY3Bo1Dnl91i1RwRBYWhZdql0AQ1Y2A2xjclQDAOT9AIdY/bPG5BvwVVLhPs
         KXfxw7Fry+pfPKqAeHPLhLLxoH/v0sgVWfiCXNqM5xXpd0IDzZ0tWT8y4V3vUoEjSgmx
         eIAqdD5u1U08iR5/VhJ/WzVx1H354DqHxsv9Bxb5Olm6ClVcHK7PrtBWU1OOHtF7IRaj
         c9Yj8RPomjK6/Gr/cmm+P4WaTSKBwE5mPuhKjtqy5R0YclYC0NECOGdyrNDoAJz+d7iM
         FnjIohXeg2h6rGPb4FIp7QOgv8fOW5QUjMl2NrM0oEWvvdQD0/3r5o+ONpCmg9w9emPc
         duCw==
X-Gm-Message-State: AC+VfDwnT2I0w4nmMHJBHT6HfpEEHf0k3bmyunMm8GSqVYWAdQGkLx7l
        vA7scXb1ISrmx1KlJMf3hFMUNA==
X-Google-Smtp-Source: ACHHUZ6AJTxuGkVYzvPH0ELAab9b7fXx+ccjFNbrYYWva7GJsrsI7CMAvuq1Y7mmMyl2AgDfFEHfgg==
X-Received: by 2002:a2e:95c2:0:b0:2ae:db65:2d01 with SMTP id y2-20020a2e95c2000000b002aedb652d01mr1371945ljh.23.1686908757350;
        Fri, 16 Jun 2023 02:45:57 -0700 (PDT)
Received: from [192.168.1.151] (85-76-68-127-nat.elisa-mobile.fi. [85.76.68.127])
        by smtp.gmail.com with ESMTPSA id l5-20020a2ea305000000b002b1a7823548sm3562992lje.98.2023.06.16.02.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 02:45:56 -0700 (PDT)
Message-ID: <dcd7e7bf-ce9f-2862-c246-32b57f53afff@linaro.org>
Date:   Fri, 16 Jun 2023 12:45:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 02/22] drm/msm/dpu: correct MERGE_3D length
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
 <20230613001004.3426676-3-dmitry.baryshkov@linaro.org>
 <qjaeua65pboforhlqusbmiwgvhm5j5c7quijjm2n55ivki5wjv@cgip4znnt2sl>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <qjaeua65pboforhlqusbmiwgvhm5j5c7quijjm2n55ivki5wjv@cgip4znnt2sl>
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

On 16/06/2023 01:22, Marijn Suijten wrote:
> On 2023-06-13 03:09:41, Dmitry Baryshkov wrote:
>> Each MERGE_3D block has just two registers. Correct the block length
>> accordingly.
>>
>> Fixes: 4369c93cf36b ("drm/msm/dpu: initial support for merge3D hardware block")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Indeed, and that patch wasn't even introducing the register writes -
> this only happened in commit 9ffd0e8569937 ("drm/msm/dpu: setup merge
> modes in merge_3d block").

Yep. Vendor dts declares merge 3d block length to be 0x100, which I 
blindly copied.

> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 36ba3f58dcdf..0de507d4d7b7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -508,7 +508,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>>   #define MERGE_3D_BLK(_name, _id, _base) \
>>   	{\
>>   	.name = _name, .id = _id, \
>> -	.base = _base, .len = 0x100, \
>> +	.base = _base, .len = 0x8, \
>>   	.features = MERGE_3D_SM8150_MASK, \
>>   	.sblk = NULL \
>>   	}
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

