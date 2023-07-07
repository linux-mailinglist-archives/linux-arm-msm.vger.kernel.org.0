Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B060F74A92A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 04:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbjGGCya (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 22:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjGGCy3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 22:54:29 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F68E19B7
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 19:54:28 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b6ef9ed2fdso21486051fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 19:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688698466; x=1691290466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BshhhQJqIsAHeX3pfDZU1Y6/saVTrDYYJ1jx8K4CJvk=;
        b=VAKZeceR51k6lGUnID51VBm2wNPfhEUnayBwD3mDy2P9J5Bn1dQbsTcavEtaCobfpz
         w5jxdsnOiYUV+fhWkOVOrfXoDdPb/kGJB8fNK//h7lpIs1sQ+Gm3KH+8bB6CMfuE0FFq
         yF71y/l5cUIyipnmETIMEB5i/hLLaQ7nK4scVsGqNrMPf4ToG5++d2jBB8ZSDfxOM3ob
         52idXcuxxmhXwjQbfwKOJe4+ZdlKYup6O03GFh/7rq6S/dGyfKk6x4Hw9LqAt1NstvMr
         dyLRVVtyDIKSP/Kv2DcBIUJaizUJ67Fzxtdgy6NPPGfuO1As0lVXZL/bsLPGDYIvUDms
         7eQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688698466; x=1691290466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BshhhQJqIsAHeX3pfDZU1Y6/saVTrDYYJ1jx8K4CJvk=;
        b=IOxEv/f99UzVCgDUhPJk4b/5eLoKHHK3drq8Pi8yrTt1gUykno5QnxTPlXE5/A4g3z
         UGlsOwQD7fVOMMi+Tpow57U2Xn3gqYHUr3JSiXXQfDLLOJGuhuCoNAyKmNu0nt0ndBvl
         Q82lLrNV839Txe2nieLZ/3cyRyWWfzr3kmbkeNioALdVITYpKP31fYTgJdaNAKJstKvk
         EraO19nC9XV2NfWWccQq9UGpt+jBDeSkiqxXCwP+YsL1WFVWRkhGRALE3fvTbN9/CRdM
         sNyHpl6Zo+YxNm/+tR7TuLaA6q1vu3zGO6SBj/J2dsQPkd/BArsmqPJDnhygnFUgO6rT
         AY7A==
X-Gm-Message-State: ABy/qLb/XgXjh1FmtrTOigZqSvdbYZrjAmjb9E7CBSr0V6jKvSPTf5Cb
        svLmioJO9k2HI27/7JNk0sUmfw==
X-Google-Smtp-Source: APBJJlHE9dYDz/MGiLwUpu1uwr7H2NMzt9Ce9ojtDAH7oIff0b4Syt5fwSS723G9EAV9/Yd+4/Rcug==
X-Received: by 2002:a2e:3c0a:0:b0:2b6:d77b:92b8 with SMTP id j10-20020a2e3c0a000000b002b6d77b92b8mr2603943lja.16.1688698466471;
        Thu, 06 Jul 2023 19:54:26 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id h19-20020a2eb0f3000000b002b6a85a7292sm575076ljl.19.2023.07.06.19.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 19:54:26 -0700 (PDT)
Message-ID: <fa8f72dd-8d74-e941-1b4e-2464a9034424@linaro.org>
Date:   Fri, 7 Jul 2023 05:54:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH 07/12] drm/msm/adreno: Move speedbin mapping
 to device table
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-8-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706211045.204925-8-robdclark@gmail.com>
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

On 07/07/2023 00:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This simplifies the code.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 171 ++-------------------
>   drivers/gpu/drm/msm/adreno/adreno_device.c |  51 ++++++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  25 +++
>   3 files changed, 92 insertions(+), 155 deletions(-)


Interesting hack, I'd say.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below.

> 

> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index d5335b99c64c..994ac26ce731 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -72,8 +72,33 @@ struct adreno_info {
>   	u32 inactive_period;
>   	const struct adreno_reglist *hwcg;
>   	u64 address_space_size;
> +	/**
> +	 * @speedbins: Optional table of fuse to speedbin mappings
> +	 *
> +	 * Consists of pairs of fuse, index mappings, terminated with
> +	 * UINT_MAX sentinal.
> +	 */
> +	uint32_t *speedbins;

Would it be better to explicitly list this as pairs of uint32_t? And 
then use braces in ADRENO_SPEEDBIN initialisation.

>   };
>   
> +/*
> + * Helper to build a speedbin table, ie. the table:
> + *      fuse | speedbin
> + *      -----+---------
> + *        0  |   0
> + *       169 |   1
> + *       174 |   2
> + *
> + * would be declared as:
> + *
> + *     .speedbins = ADRENO_SPEEDBINS(
> + *                      0,   0,
> + *                      169, 1,
> + *                      174, 2
> + *                  ),
> + */
> +#define ADRENO_SPEEDBINS(tbl...) (uint32_t[]) { tbl, UINT_MAX }
> +
>   const struct adreno_info *adreno_info(struct adreno_rev rev);
>   
>   struct adreno_gpu {

-- 
With best wishes
Dmitry

