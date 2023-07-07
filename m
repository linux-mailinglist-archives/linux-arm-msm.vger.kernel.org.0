Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3D6C74A948
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 05:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbjGGDQ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 23:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbjGGDQ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 23:16:26 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC301FD7
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 20:16:20 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb8574a3a1so2055117e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 20:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688699778; x=1691291778;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LYvfYQvpyitM184jUG8h8ucWTKN5nD7nPSLEXi7uWuw=;
        b=c0F2XSXBPoNonEk7KHLUnVGO3gSfUynkvOX4iiPFeHs+vGit+il79LRgGM5h+Gkfhy
         IVn3HUoGwJbl33ou/7lzS5x8Eq6aD/U1ti3hNp3eMXxT3/9u1lp2NWSf23YfLZuI1gGm
         2yDdC63UEYS4Guu4y9sll98t0sfVsjXLn7ZGHRpsCyRFeil6TB6N3x9nUzZgaNcmhwJk
         vG0znIFusDYW/HHaR3Mq9YVsY3rniSfvsJ70rle0FCUGALUjAt+DvggaaGJaouW2OB1T
         cafXFNpZkqePmkmVqObcjRF9Zbj3pT2qW44OxtW8tIskMrm29Ttyeh3j9g/l0f3xpT9A
         QldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688699778; x=1691291778;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LYvfYQvpyitM184jUG8h8ucWTKN5nD7nPSLEXi7uWuw=;
        b=K52Vo6wXQLyX0hiYzlUSgQs5HaQ5WTrZeWjto/di3U49EKmMr4pUOiD+io/63saRkD
         NO7NET+xtdsuOe+4jXanFyVj3PXijbc6CGba59EdSBsFDLD2V8X3cx26kuPsbIiTLsuS
         FzkwKqx6Ivtu5htMVlPIPeOGFohComB1zyejU+IVnVc4HYJIV54IBbm2+9puwwHCqhes
         ABoK6BzkSUmsMPD5y6mSv9AwVe0npmdpBCPVQmzbEsAPyFgT4wGgV8JqaHn/0duO5B2e
         nXOLhEA6900WUjASqUkdd4CcEx2BeXtfbYZJZrF3+hHRvmTAinF6oRLkjEjejXb8yWzi
         LzTg==
X-Gm-Message-State: ABy/qLY7WQD/JYDSBVwknKfmjfHUdrAkLWdTJ3T2TcGqmbHZLF+g9/nX
        rrjyjxkrcDFrnt32XuTnUXt1fWFcZe82bPkGKME=
X-Google-Smtp-Source: APBJJlEJ92UWR9IteNTbP8QdzPZ0Yme6ICqIARdO1EC4k6sf2EH6fKlKevNZhDf4QnFHV2sRYBHY/w==
X-Received: by 2002:a19:ca14:0:b0:4f7:4098:9905 with SMTP id a20-20020a19ca14000000b004f740989905mr2351574lfg.65.1688699778634;
        Thu, 06 Jul 2023 20:16:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c20-20020a197614000000b004fba0a9abf1sm490783lff.190.2023.07.06.20.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 20:16:18 -0700 (PDT)
Message-ID: <688c5dc3-ad46-2dfe-e418-c1b1cba767b8@linaro.org>
Date:   Fri, 7 Jul 2023 06:16:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 09/12] drm/msm/adreno: Add adreno family
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-10-robdclark@gmail.com>
 <c41b8ce0-8149-911b-0c6e-f963c830ac92@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c41b8ce0-8149-911b-0c6e-f963c830ac92@linaro.org>
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

On 07/07/2023 02:35, Konrad Dybcio wrote:
> On 6.07.2023 23:10, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> Sometimes it is useful to know the sub-generation (or "family").  And in
>> any case, this helps us get away from infering the generation from the
>> numerical chip-id.
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
> [...]
> 
>>   		.rev   = ADRENO_REV(5, 0, 8, ANY_ID),
>> +		.family = ADRENO_5XX,
>>   		.revn = 508,
> 508 is from 530 fam
> 
>>   		.fw = {
>>   			[ADRENO_FW_PM4] = "a530_pm4.fw",
>> @@ -156,6 +168,7 @@ static const struct adreno_info gpulist[] = {
>>   		.zapfw = "a508_zap.mdt",
>>   	}, {
>>   		.rev   = ADRENO_REV(5, 0, 9, ANY_ID),
>> +		.family = ADRENO_5XX,
>>   		.revn = 509,
> 509 and 512 are from 540 fam
> 
>>   		.fw = {
>>   			[ADRENO_FW_PM4] = "a530_pm4.fw",
>> @@ -173,6 +186,7 @@ static const struct adreno_info gpulist[] = {
>>   		.zapfw = "a512_zap.mdt",
>>   	}, {
>>   		.rev   = ADRENO_REV(5, 1, 0, ANY_ID),
>> +		.family = ADRENO_5XX,
>>   		.revn = 510,
> 510 is 530ish but I think it's closer to 505 or whatever the
> 8953 gpu was called

I'd say, there were following generations here:

- a505 / a506 / a508
- a509 / a512
- a510
- a530
- a540

Indeed a50x were close to a530 in some aspects and a509/512 being closer 
to a540, but I don't think they were the same family.

> 
> [...]
> 
>> -	priv->is_a2xx = config.rev.core == 2;
>> +	priv->is_a2xx = info->family < ADRENO_3XX;
> is this variable even needed now that there are explicit family values?
> 
> Konrad
>>   	priv->has_cached_coherent =
>>   		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
>>   
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index 2e62a7ce9f13..75ff7fb46099 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -1079,8 +1079,13 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>   	u32 speedbin;
>>   	int ret;
>>   
>> +	adreno_gpu->funcs = funcs;
>> +	adreno_gpu->info = adreno_info(config->rev);
>> +	adreno_gpu->rev = *rev;
>> +
>>   	/* Only handle the core clock when GMU is not in use (or is absent). */
>> -	if (adreno_has_gmu_wrapper(adreno_gpu) || config->rev.core < 6) {
>> +	if (adreno_has_gmu_wrapper(adreno_gpu) ||
>> +	    adreno_gpu->info->family < ADRENO_6XX_GEN1) {
>>   		/*
>>   		 * This can only be done before devm_pm_opp_of_add_table(), or
>>   		 * dev_pm_opp_set_config() will WARN_ON()
>> @@ -1096,10 +1101,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>   			devm_pm_opp_set_clkname(dev, "core");
>>   	}
>>   
>> -	adreno_gpu->funcs = funcs;
>> -	adreno_gpu->info = adreno_info(config->rev);
>> -	adreno_gpu->rev = *rev;
>> -
>>   	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
>>   		speedbin = 0xffff;
>>   	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 6066cfaaea52..2fa14dcd4e40 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -29,6 +29,25 @@ enum {
>>   	ADRENO_FW_MAX,
>>   };
>>   
>> +/**
>> + * @enum adreno_family: identify generation and possibly sub-generation
>> + *
>> + * In some cases there are distinct sub-generations within a major revision
>> + * so it helps to be able to group the GPU devices by generation and if
>> + * necessary sub-generation.
>> + */
>> +enum adreno_family {
>> +	ADRENO_2XX_GEN1,  /* a20x */
>> +	ADRENO_2XX_GEN2,  /* a22x */
>> +	ADRENO_3XX,
>> +	ADRENO_4XX,
>> +	ADRENO_5XX,
>> +	ADRENO_6XX_GEN1,  /* a630 family */
>> +	ADRENO_6XX_GEN2,  /* a640 family */
>> +	ADRENO_6XX_GEN3,  /* a650 family */
>> +	ADRENO_6XX_GEN4,  /* a660 family */
>> +};
>> +
>>   #define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
>>   #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
>>   #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
>> @@ -63,6 +82,7 @@ extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
>>   struct adreno_info {
>>   	const char *machine;
>>   	struct adreno_rev rev;
>> +	enum adreno_family family;
>>   	uint32_t revn;
>>   	const char *fw[ADRENO_FW_MAX];
>>   	uint32_t gmem;
>> @@ -188,14 +208,14 @@ static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
>>   {
>>   	if (WARN_ON_ONCE(!gpu->info))
>>   		return false;
>> -	return (gpu->info->revn < 300);
>> +	return gpu->info->family < ADRENO_2XX_GEN2;
>>   }
>>   
>>   static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
>>   {
>>   	if (WARN_ON_ONCE(!gpu->info))
>>   		return false;
>> -	return (gpu->info->revn < 210);
>> +	return gpu->info->family == ADRENO_2XX_GEN1;
>>   }
>>   
>>   static inline bool adreno_is_a225(const struct adreno_gpu *gpu)
>> @@ -338,29 +358,31 @@ static inline int adreno_is_a690(const struct adreno_gpu *gpu)
>>   /* check for a615, a616, a618, a619 or any a630 derivatives */
>>   static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
>>   {
>> -	return adreno_is_revn(gpu, 630) ||
>> -		adreno_is_revn(gpu, 615) ||
>> -		adreno_is_revn(gpu, 616) ||
>> -		adreno_is_revn(gpu, 618) ||
>> -		adreno_is_revn(gpu, 619);
>> +	if (WARN_ON_ONCE(!gpu->info))
>> +		return false;
>> +	return gpu->info->family == ADRENO_6XX_GEN1;
>>   }
>>   
>>   static inline int adreno_is_a660_family(const struct adreno_gpu *gpu)
>>   {
>> -	return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adreno_is_7c3(gpu);
>> +	if (WARN_ON_ONCE(!gpu->info))
>> +		return false;
>> +	return gpu->info->family == ADRENO_6XX_GEN4;
>>   }
>>   
>>   /* check for a650, a660, or any derivatives */
>>   static inline int adreno_is_a650_family(const struct adreno_gpu *gpu)
>>   {
>> -	return adreno_is_revn(gpu, 650) ||
>> -		adreno_is_revn(gpu, 620) ||
>> -		adreno_is_a660_family(gpu);
>> +	if (WARN_ON_ONCE(!gpu->info))
>> +		return false;
>> +	return gpu->info->family >= ADRENO_6XX_GEN3;
>>   }
>>   
>>   static inline int adreno_is_a640_family(const struct adreno_gpu *gpu)
>>   {
>> -	return adreno_is_a640(gpu) || adreno_is_a680(gpu);
>> +	if (WARN_ON_ONCE(!gpu->info))
>> +		return false;
>> +	return gpu->info->family == ADRENO_6XX_GEN2;
>>   }
>>   
>>   u64 adreno_private_address_space_size(struct msm_gpu *gpu);

-- 
With best wishes
Dmitry

