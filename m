Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAD96D04F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 14:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjC3Miv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 08:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjC3Mia (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 08:38:30 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0417576A6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:38:29 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id z42so19405944ljq.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680179907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=akRZyjqJclMdbp3N5bLTzvOQ/s247q8kDmVY+hohIX4=;
        b=LHhr/8GHEec7cDYXglHq9/Rv6mNTRGf7cNzyfxbrM1tVojyNSEcehJt9P0rkt+iRsZ
         BVb+fjEwQGkK8F7QkU1LyJGExkLYEFldRrBH0ulgD825ezPT3BexDGNUuoZJ9pRktQZr
         FdrEKRVG+1Ir1ae6QV1HzWn+qhyeMiyxdoXLlJSZ3UVyHrqh7YWY3vMMFK2ehkPeYbUt
         Jq5b5GDvctB1yeRdckp+u2N5fcg41Mg802C1k8QyewxbzZlVaYOqL818UAT/VAzOqkR5
         xMvq4ZvwCHlnjmtPVGNEine0GjfvZal1JeP7TXhRwwvwyxHeaCIjVkg6f4WFdehS+TUn
         AJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680179907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=akRZyjqJclMdbp3N5bLTzvOQ/s247q8kDmVY+hohIX4=;
        b=4TGnsqUb//QEHsUzTxafdV6FoIxkwJQNPyBrmGl2ZS3FDuX4l8UHt8Z+vD9qs4zahE
         Hl5Vm5WvJ0vtfaCiLTrLK1aK/nVzoJbr8f3uX2/wUNQ7Y5ficaNDYadWLPhxe5vVPVbI
         fWPTU6oHO9AvTEcTt0g3SeBvqn/N+/vi9jKgni52rqfN+4U9lr32CNqgjjCg2VJYeZs8
         QEfScWtaURWK2E9PPY7Sjb4pzP5/aX+NyarH9CpmIAt8EeMMXc4OYRnWYUJ/b6eY40fw
         K1mFfhZwzNFuZrClk57iMLWP09EOfCKzB6mB2yhE9iSviC7FyLUOuTIV5IX/FlJpAfvL
         EDgA==
X-Gm-Message-State: AAQBX9fKHCFThzil7bWWhB+G/mntQNRvJt0dYO3WWVbHf4y/LysZEF0M
        SQC8TK4vgJlcg4G5PHtLrDfnxg==
X-Google-Smtp-Source: AKy350adA9ofQs86+ZGD0KxYL7LKIJfAhKSGxCfZ02uApda+TJqtVuHVJhj1AQGPK6HsEpi0hfmhGQ==
X-Received: by 2002:a05:651c:1028:b0:2a2:c618:1f51 with SMTP id w8-20020a05651c102800b002a2c6181f51mr6869251ljm.24.1680179907244;
        Thu, 30 Mar 2023 05:38:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id h13-20020a2e900d000000b00290b375a068sm5873914ljg.39.2023.03.30.05.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 05:38:26 -0700 (PDT)
Message-ID: <60073c65-1df3-69f8-4755-798fe26a0905@linaro.org>
Date:   Thu, 30 Mar 2023 15:38:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,38/50] drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
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
References: <20230211231259.1308718-39-dmitry.baryshkov@linaro.org>
 <c7961d64-dc15-11d3-6269-74555c1c1b70@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c7961d64-dc15-11d3-6269-74555c1c1b70@linaro.org>
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

On 30/03/2023 15:33, Konrad Dybcio wrote:
> 
> 
> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>> Mark DSPP_2 and DSPP_3 as used for LM_2 and LM_3
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Could you point me to where it's specified downstream? I can't find it.

https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/77276ed6a0055a4a0f41d7b0395a8b0bbcafd091/msm/sde/sde_hw_catalog.c#L2341

Which says assign DSPP to LMs for as long as we have a spare DSPP

> 
> Also, deserves a Fixes.

This is a tough question. We have been using sm8150_lm for sm8[2345]50. 
So before "drm/msm/dpu: duplicate sm8150 catalog entries" there is no 
way to fix that.

> 
> Konrad
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> index a3faaab2226c..3d95f2472e7a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> @@ -107,9 +107,9 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
>>   	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
>>   		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
>>   	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
>> -		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
>> +		&sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
>>   	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
>> -		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
>> +		&sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
>>   	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
>>   		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
>>   	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,

-- 
With best wishes
Dmitry

