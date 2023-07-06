Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8F374A78B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 01:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjGFX0T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 19:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbjGFX0S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 19:26:18 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0F01BC3
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 16:26:17 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f122ff663eso1938191e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 16:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688685976; x=1691277976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pG4QUNw/1VF1olIkAIG6YVjaLZEGzevFOo4Q/EoszHY=;
        b=SbViTNpiDnn1/SVFjlm4q7uEQ0PDGSLkSl+jjOd8wsH9QCH00ozbLsUFLWhTghUYWS
         /Oel0EybjDJnKhPvkYZ5MxPz1AOLXr8rMwplqqHz2Rs2QBNc1uUdso0g9Xxiye0QcsgC
         bJGqD8ICio6AyzSTyjSrOFdOYW77HwCXuNaAOLHFpEeMtH1lOlVMVP5TO81JkSurusB1
         y6yyD4wYO6w+eeOWFCNKsJ7pMbckwG2hBRCfMEE2jS9uuW1noVOGTrNCZfvzGUJyP1dm
         6tglL6vAEFYQWUXjCtmRYAnSY+x8p6Y6+VpL8HE0uqSDWUVl4VgaFH0bW+TST0i6OzRp
         CggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688685976; x=1691277976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pG4QUNw/1VF1olIkAIG6YVjaLZEGzevFOo4Q/EoszHY=;
        b=c2ruZQaxoiqCAOagBrsPvtfjpzqN9KNIh+nuTDvDSZfiWAHMk+aGhSBAzDzFmWvjne
         y/iUwpN6dGIooQNK7Ly6dYD6sofbDbeuRfNX6o767Xck9rY6KtjCG++ZdfSa473o+3bI
         aA6fwQ9fJWlU8ULsow9/VCSUKtgfB0VONvnZ0ME0c32bynxucCYwSo3wIbxh5MbJlSx+
         2GXgw+7DiCKsxooJl0ZncxRnQjErYbQjtifOQR7U3dqiJeHS/RWY9pYNEIFsSRy7kWIO
         Ow5A3fCzy0ZPDl7BOSKpbiUwjCCM5EDOpHwa+/gR4Z4Cuo7DC0kWNQDuOETs8VhI2qxC
         mAQA==
X-Gm-Message-State: ABy/qLbRp76bcDTNuRdGTwAGhTvdlxJnXoobu7vCBP1+3wZpz+dq1TT3
        XMaSWrlHrS06+GAad6aELu0cgRXBT4/ILJM8vR8taw==
X-Google-Smtp-Source: APBJJlGo06Jx2plcZiTY2QU9Nba6Qqa47IHnccfsTTJbavzf+dxOw1rk0SJT3T/OnI0zsTaOgiGLdQ==
X-Received: by 2002:a05:6512:3049:b0:4f9:586b:dba1 with SMTP id b9-20020a056512304900b004f9586bdba1mr2902032lfb.4.1688685975641;
        Thu, 06 Jul 2023 16:26:15 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id 16-20020ac24830000000b004faeedbb29dsm438524lft.64.2023.07.06.16.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 16:26:15 -0700 (PDT)
Message-ID: <536f38a8-5e83-4ed5-24c0-70fbdd788cc2@linaro.org>
Date:   Fri, 7 Jul 2023 01:26:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/12] drm/msm/adreno: Remove redundant revn param
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-4-robdclark@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230706211045.204925-4-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 6.07.2023 23:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This just duplicates what is in adreno_info, and can cause confusion if
> used before it is set.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
[...]

> -	return gpu->revn == revn;
> +	if (WARN_ON_ONCE(!gpu->info))
> +		return false;
I'm unsure about changing this behavior. Especially in a6xx code,
where these calls may guard things like SMMU behavior (the LLCC-SMMU
programming dance is unconditional if adreno_is_a7xx)

Though if gpu->info is missing, it's a lost cause anwyways..

So I guess this is really the least bad thing to do

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +	return gpu->info->revn == revn;
>  }
>  
>  static inline bool adreno_has_gmu_wrapper(const struct adreno_gpu *gpu)
> @@ -160,18 +158,16 @@ static inline bool adreno_has_gmu_wrapper(const struct adreno_gpu *gpu)
>  
>  static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
>  {
> -	/* revn can be zero, but if not is set at same time as info */
> -	WARN_ON_ONCE(!gpu->info);
> -
> -	return (gpu->revn < 300);
> +	if (WARN_ON_ONCE(!gpu->info))
> +		return false;
> +	return (gpu->info->revn < 300);
>  }
>  
>  static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
>  {
> -	/* revn can be zero, but if not is set at same time as info */
> -	WARN_ON_ONCE(!gpu->info);
> -
> -	return (gpu->revn < 210);
> +	if (WARN_ON_ONCE(!gpu->info))
> +		return false;
> +	return (gpu->info->revn < 210);
>  }
>  
>  static inline bool adreno_is_a225(const struct adreno_gpu *gpu)
