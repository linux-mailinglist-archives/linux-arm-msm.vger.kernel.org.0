Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8B9D6F3A66
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 00:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232654AbjEAWZo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 18:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232653AbjEAWZn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 18:25:43 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 981D82D70
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 15:25:42 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4ec8133c59eso3660629e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 15:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682979941; x=1685571941;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oAJEOm2eifjcgdP9OPqfMMNdpFPDXakE6ptALBvr0FQ=;
        b=Am26uoHegRus/zLYoGd7WF2yRrZOU/9G2hl0GArXKx1AV+B0PSnOdcEEANW/I2l0X7
         vDl5vULcNyDmPXsz3iR5YIaPo+D/0Htd9M0RrISu4caDCTvma7AbspUUjPdrqggClfCP
         J2kWn+Dr+DPUKaU9/itkQIx8D943H08n79OLiUHdg+iZO996f2h4CXFtus2TGe2A2s0Y
         nWuZcKBNkgkYx58JurmAdjTnT13BgBNzHkOu45PMXa1W4XpsmPhp9DuNp1Ext4+a1m8S
         8v3HEf5YWTuccY9JwJhOaEvM+C05D+AUL6RF9v2DwMMHXliZzZmKyfcaLXcrfx/ET6Sk
         fpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682979941; x=1685571941;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAJEOm2eifjcgdP9OPqfMMNdpFPDXakE6ptALBvr0FQ=;
        b=OpYJN5q6vmPWaURwQKz6aNqtmmipenjkzyEvaVH5wDwMQCZU8jCgw4lba+cduqLgCc
         lrUj4re8DB8Ugqj1Fyzmr2DyVIND1VUwucgKU2SeH7ImlUgCQlBZsHaWNagj5FloGCFY
         kjq4+zZ1rV0LVf6ywM/OMo0ifBkxicZIfn+b4e7UUPR6smMcMx2SOFGFvY1cDwak/qSS
         aVozCw6IaG6zQFt5KGTTgMlLvSDs1pw2A31e0jYZOyWSyPTBKcxymITmYNrU+oUxUzj/
         ZiFyVZDA6b6BQRCFpdUgtEEOirPxtfu5R7RO5HlIyAx3bLdFQAyM3z7DeUpGM+HHWhA9
         27bQ==
X-Gm-Message-State: AC+VfDxh209pCxfdCj01vRZ7FDm2dG0/rc10bScPWadiFkkrf1aiBvrV
        qK/WwyHkj32PdHtBSal3oEd/gg==
X-Google-Smtp-Source: ACHHUZ7NhlhZxSnZcnpAUm2jh5zID/mvv3M45+MFV/GBMQYVzBIUhr5voUAlg2XHUcf7JdpDio4Rag==
X-Received: by 2002:ac2:52b7:0:b0:4d8:6c17:8a65 with SMTP id r23-20020ac252b7000000b004d86c178a65mr4694708lfm.58.1682979940881;
        Mon, 01 May 2023 15:25:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id o14-20020ac2494e000000b004efae490c51sm4612151lfi.240.2023.05.01.15.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 15:25:40 -0700 (PDT)
Message-ID: <ac05dbb8-5327-ec83-d8f3-9680dc450d88@linaro.org>
Date:   Tue, 2 May 2023 01:25:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/4] drm/msm/dpu: move PINGPONG_NONE check to
 dpu_lm_init()
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
 <20230430203556.3184252-5-dmitry.baryshkov@linaro.org>
 <ncdyjjt72to7mop6kgd46kmhvcqdzqyftdklm37dn3j5ycufx4@uvg74dm2x2zp>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ncdyjjt72to7mop6kgd46kmhvcqdzqyftdklm37dn3j5ycufx4@uvg74dm2x2zp>
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

On 02/05/2023 01:23, Marijn Suijten wrote:
> On 2023-04-30 23:35:56, Dmitry Baryshkov wrote:
>> Move the check for lm->pingpong being not NONE from dpu_rm_init() to
>> dpu_lm_init(), following the change to dpu_hw_intf_init().
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> In some way I also suggested this change in [1], but did not receive a
> (N)ACK.

It seems we went on arguing on other topics and didn't respond to that 
phrase. Please excuse me.

> 
> [1]: https://lore.kernel.org/linux-arm-msm/ecopixnagol7yd5znvmjanknqbv7vi4ayy36vchaeyyhuavu4w@rkdfllrd4uzb/
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 5 +++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    | 5 -----
>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> index 214f207ddf8a..d1c3bd8379ea 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> @@ -161,6 +161,11 @@ struct dpu_hw_mixer *dpu_hw_lm_init(const struct dpu_lm_cfg *cfg,
>>   {
>>   	struct dpu_hw_mixer *c;
>>   
>> +	if (cfg->pingpong == PINGPONG_NONE) {
>> +		DPU_DEBUG("skip mixer %d without pingpong\n", cfg->id);
>> +		return NULL;
>> +	}
>> +
>>   	c = kzalloc(sizeof(*c), GFP_KERNEL);
>>   	if (!c)
>>   		return ERR_PTR(-ENOMEM);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index bf7b8e7c45b1..2ca3c666e22f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -117,11 +117,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>>   		struct dpu_hw_mixer *hw;
>>   		const struct dpu_lm_cfg *lm = &cat->mixer[i];
>>   
>> -		if (lm->pingpong == PINGPONG_NONE) {
>> -			DPU_DEBUG("skip mixer %d without pingpong\n", lm->id);
>> -			continue;
>> -		}
>> -
>>   		hw = dpu_hw_lm_init(lm, mmio);
>>   		if (IS_ERR(hw)) {
>>   			rc = PTR_ERR(hw);
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

