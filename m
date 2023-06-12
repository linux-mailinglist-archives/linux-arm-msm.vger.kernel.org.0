Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9774672CFB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 21:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbjFLTjM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 15:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235664AbjFLTjK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 15:39:10 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F32E3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 12:39:09 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f655293a38so5294942e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 12:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686598748; x=1689190748;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xni50qNF8j9Eua6R6sKzGMbM9MeR+ReQ/6lKFoGcV90=;
        b=q44oJtEgVgeSW/LyC+0ze6qF5PY9VSLKBOy9fBqMSoPMaYb58wGm157KiUOX1FGi88
         LZ9Mft2m8x6NNTEmBTzWPravQQKvYw4j6iJfVkSS4Ng1q97nGv6PWEaVU+EiPtzjeMfJ
         pGVF2antZXJ6LJXSEkl1wpauYQWUT5/05WDExcO01Fr5RDDFcHUAyTh1u7gbM391FiLV
         Y4dtdgtvLiSKRE9NfkT4VgYr/tXHRrHK+5xWZPqG4FJlIcvXDaVl0ZmHXQobrNjvgKbF
         GVZeU+Mbgf313Abw7eEb2/jFnlp+MOEcldBwHZ1SnvPTjtigdzBhFUWeWul8fmKCNhPO
         A5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686598748; x=1689190748;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xni50qNF8j9Eua6R6sKzGMbM9MeR+ReQ/6lKFoGcV90=;
        b=WbSt0GBxgbGjkPujCwroCJjNCtHru4tdwOIdE5AnP2dNSELx6erO+6h1r1gV/cwLW8
         8yFYe1iqU7gd8NkGW8oXkn1g0hLRrjmORKo6/plbhCRq0VAsj8gbe3lGEnn5pgpDkuVZ
         Ou3uEl4V1S/1cgfh+KBEAuCYF2VzF3G7ZDVWJWp0fdI/6hBakX2zb4peJALNsXQv7Qn9
         ZTNmcchj7D5kf9ltK9JGtCR6BKurKApAZw0rrcHAIXnhvjw4KSPVeeWFwO9baJEuQ+Tr
         cCxatV5JT5kAKRyVnCy9ReWztRwccR8NJrSrY+wl73XgaLHL1TncntR/UNwOZ47Q8pxZ
         gECQ==
X-Gm-Message-State: AC+VfDwGINwPml1cY2vbEMlBKP2C34LF+O7PSWupL4SiBiHsXPgxMJ/q
        0ohBGT9q8cC25y5RF59iRoOj3Q==
X-Google-Smtp-Source: ACHHUZ7VWCpkkNmWJvOEFw7a5jIGRH0sbzbd+6R7KQ8DmqMlta+CRO4VSgCdixAKd4JvQXo9SZBFSA==
X-Received: by 2002:a05:6512:551:b0:4ee:e0c7:434d with SMTP id h17-20020a056512055100b004eee0c7434dmr4340908lfl.51.1686598747598;
        Mon, 12 Jun 2023 12:39:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a16-20020ac25210000000b004eb3b675d43sm1523818lfl.302.2023.06.12.12.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 12:39:07 -0700 (PDT)
Message-ID: <81236696-d348-e564-6b5b-60549bc09b95@linaro.org>
Date:   Mon, 12 Jun 2023 22:39:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/msm/dpu/catalog: define DSPP blocks found on
 sdm845
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
 <20230612182534.3345805-2-dmitry.baryshkov@linaro.org>
 <b2ab681d-5f22-2ea2-a8af-7e06839967a1@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b2ab681d-5f22-2ea2-a8af-7e06839967a1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/06/2023 22:35, Abhinav Kumar wrote:
> 
> 
> On 6/12/2023 11:25 AM, Dmitry Baryshkov wrote:
>> Add definitions of DSPP blocks present on the sdm845 platform. This
>> should enable color-management on sdm845-bassed devices.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 21 +++++++++++++++----
>>   1 file changed, 17 insertions(+), 4 deletions(-)
>>
> 
> This change itself is fine, hence
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> one note below for a future cleanup:
> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> index 36ea1af10894..b6098141bb9b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> @@ -96,19 +96,30 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
>>   static const struct dpu_lm_cfg sdm845_lm[] = {
>>       LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
>> -        &sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
>> +        &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
>>       LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
>> -        &sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
>> +        &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
>>       LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
>> -        &sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
>> +        &sdm845_lm_sblk, PINGPONG_2, LM_5, DSPP_2),
>>       LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
>> -        &sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
>> +        &sdm845_lm_sblk, PINGPONG_NONE, 0, DSPP_3),
>>       LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
>>           &sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
>>       LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
>>           &sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
>>   };
>> +static const struct dpu_dspp_cfg sdm845_dspp[] = {
>> +    DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>> +         &sm8150_dspp_sblk),
>> +    DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
>> +         &sm8150_dspp_sblk),
>> +    DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
>> +         &sm8150_dspp_sblk),
>> +    DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
>> +         &sm8150_dspp_sblk),
>> +};
>> +
> 
> I see the len of pcc blocks should be 0x88 not 0x90 as sm8150_dspp_sblk 
> explains.
> 
> Also, I need to do some digging on the PCC version here. Can you pls 
> provide me the link to downstream source which mentions PCC version is 
> 4.0 for sdm845?

Sure, 
https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.8.3.c25-08000-sdm845.0/arch/arm64/boot/dts/qcom/sdm845-sde.dtsi#L233

> 
>>   static const struct dpu_pingpong_cfg sdm845_pp[] = {
>>       PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 
>> PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>> @@ -193,6 +204,8 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
>>       .sspp = sdm845_sspp,
>>       .mixer_count = ARRAY_SIZE(sdm845_lm),
>>       .mixer = sdm845_lm,
>> +    .dspp_count = ARRAY_SIZE(sdm845_dspp),
>> +    .dspp = sdm845_dspp,
>>       .pingpong_count = ARRAY_SIZE(sdm845_pp),
>>       .pingpong = sdm845_pp,
>>       .dsc_count = ARRAY_SIZE(sdm845_dsc),

-- 
With best wishes
Dmitry

