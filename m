Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9BD6D049B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 14:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbjC3MYP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 08:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjC3MYO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 08:24:14 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7564AFB
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:24:13 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id q14so19381268ljm.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680179051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1452CrR74MLGlpKnROQc0oL00+8IeTrr7peIVEjnGYs=;
        b=w/O9wzcIaDqph9naSiDyJVk5wfhV1HgAnsrS+l3IZ9i3KrI0MUHWcXbg+Dz0V1uF8d
         lFodObENP15TNLr+ObbO8/DR9+dr4TJ57LV4si+dhTEikSIbyr6fjupZYPhrIWH/bNp3
         +G5kQGcPDD5aurCgDEZuzFHMC8LmTG/mN9MRiSgYVL5UwTy3qIN8gENVYzjufPDX+9pZ
         fXiTInRHJ0rYa780WP0OGYyljkWGbfumzPv+3i/AZie1BdJI03vlOD0iqnJ0Jz2fuAVQ
         ip8au7FDcldbpayhAfuL34uLsY/N9YntfE4qDNFx6HBqGZWUzWCld7JtFQ2LJ7dtwZjv
         KmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680179051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1452CrR74MLGlpKnROQc0oL00+8IeTrr7peIVEjnGYs=;
        b=1Mhowvfy6AUxVB+S+uVczps1JCpNcGx50Np6rB5BrZOz5tuvUmGXQMUOyDvM/pvGVN
         xsePI03WHlRFjEDzFt8isPxq3BxZLdtZGhR8xW28KDzDEbqnJBUtkhllEaeyrBP5F7A7
         cEgwsLTFi2+cM/WDhsLlA0skT3+Z/VU4aeYYiP2tC1QssFSoHqbY3GPc7rj5SQ448cF7
         Fp7s8M0xPLhGwIFEw6pBNWzhE2f4X9ZAEWtyVyVkLqjPRSW7IflhThOVHHvRVsM5zoAO
         zQj4T6pbylXu3e/h6sIPOtnpI0ILXjQ8kQFBXY6PtK5QKm9vrjzG74OtvkV6wSrSC+zq
         gNMw==
X-Gm-Message-State: AAQBX9fAgu75kWzOnoj+gojerJUEBFY/txpg+cjCLHquVl8Qyc6ycg//
        e6wmfRMRuV/U3EqgZszxbc2mBQ==
X-Google-Smtp-Source: AKy350YoASw6lgVw9JSXYoBj2ZnkqZYuzNm6BsEt8qJOp+l3+rANzSxX2/xYYDqHzsJ7Iv2oU4NBJw==
X-Received: by 2002:a2e:908f:0:b0:2a6:1681:81e0 with SMTP id l15-20020a2e908f000000b002a6168181e0mr825763ljg.2.1680179051702;
        Thu, 30 Mar 2023 05:24:11 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id g5-20020a2e9385000000b002959d2cc975sm5842595ljh.37.2023.03.30.05.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 05:24:11 -0700 (PDT)
Message-ID: <7953ad89-eb30-a7e0-1ba0-7032f2646948@linaro.org>
Date:   Thu, 30 Mar 2023 15:24:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,32/50] drm/msm/dpu: duplicate sc7180 catalog entries
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
References: <20230211231259.1308718-33-dmitry.baryshkov@linaro.org>
 <8b3ce350-3cd0-2712-3de5-a29a2592e440@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8b3ce350-3cd0-2712-3de5-a29a2592e440@linaro.org>
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

On 30/03/2023 15:22, Konrad Dybcio wrote:
> 
> 
> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>> Duplicate some of sc7180 catalog entries to remove dependencies between
>> DPU major generations.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> index 8977878890f1..3117bb358117 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> @@ -82,6 +82,11 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
>>   		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
>>   };
>>   
>> +static const struct dpu_dspp_cfg sc7280_dspp[] = {
>> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>> +		 &sc7180_dspp_sblk),
> If I'm following correctly, the sc7180_dspp_sblk is still defined
> in the common hw_catalog.c and things won't explode.

Yes, I left sblk definitions in place (for now). We can consider 
splitting/moving them afterwards, as we get the overall picture.

> 
> In that case:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad
>> +};
>> +
>>   static const struct dpu_pingpong_cfg sc7280_pp[] = {
>>   	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
>>   	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
>> @@ -132,8 +137,8 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
>>   	.ctl = sc7280_ctl,
>>   	.sspp_count = ARRAY_SIZE(sc7280_sspp),
>>   	.sspp = sc7280_sspp,
>> -	.dspp_count = ARRAY_SIZE(sc7180_dspp),
>> -	.dspp = sc7180_dspp,
>> +	.dspp_count = ARRAY_SIZE(sc7280_dspp),
>> +	.dspp = sc7280_dspp,
>>   	.mixer_count = ARRAY_SIZE(sc7280_lm),
>>   	.mixer = sc7280_lm,
>>   	.pingpong_count = ARRAY_SIZE(sc7280_pp),

-- 
With best wishes
Dmitry

