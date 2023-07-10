Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78BC874DFD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 22:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjGJUyd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 16:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232107AbjGJUyX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 16:54:23 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B781510DF
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 13:54:05 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fafe87c6fbso7758627e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689022444; x=1691614444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G13MU++Hl725dEif28QmMqrP2IERpf/MG7YmFR/Xwy4=;
        b=NLH+BfyIWjRPR682uKLEiGgUxBJuXKiXe08BGf4hxnCLHlIGx87daghOtT9KJ/ktDM
         iL55X76cT2x1pJub77gKLDir3k5/fi7vJuu5BvHtVkwYmDou+f6z3SEWxGFwXGhD+48Y
         HzIw5D3XaD88iSI3+oAtg5TVbYSDF4gA4LVTkMhOSUhu+QtnSBmu38uNzZ4vzDVLF5xp
         PkFZtFSt/NEoA07WdIXD2NECUIS/wGNdohoXtEg7wosH5FXetRsgv1+qCATRkbBXY3fX
         EdtLwMq13hMDsLsTuHlNeExPdw0m8k65/HAxrX0ukHuuO52Kn+Nj91Ur9M2c6Tbwo4aj
         ibgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689022444; x=1691614444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G13MU++Hl725dEif28QmMqrP2IERpf/MG7YmFR/Xwy4=;
        b=JKEpwTm3RxQwVO/PSZMeJ3JjjCVZoT5GoMNEj0JvpkYuTepup68PMGAkKBap16FWCv
         0TKT5odPQKCfxDD2x4eQKxRmoM0GkeMrXwF2xuzpy1LHlb6NXAZRu90QbLu220zoHo2h
         14xj5NAo6WPTNoKQMSxjuVGmXP4vkUIXju0EuK+ibvOuL4wcAEfMjmvVog0VCiZalYy0
         uPq8Ktg/oRB3TvnGBpb9K+4GRfohmEmDOkSbhQlhiS2RCUrMBEJvsk9X5GiwcgMcVmbp
         ZdforxTdCAQr4X+yigHEuaHSP+Rw+QgT2Hk/jQQDOali5ytQMSZdSUXJAUi+zaEaR35P
         g6fg==
X-Gm-Message-State: ABy/qLaDT6Vu1x11LLhCQzNHrzZ1lf7rRxnt2i+rfBB+9pOtGZqyk2ds
        5acyai3FzbigvFdYZhcWXDiOUg==
X-Google-Smtp-Source: APBJJlG84vjZD6EToeATX/q3/IrlfPeCZqyrgGIbuplyOgjCIDQQpFiAwqLDp/c7LCPj4C7FK5jvHw==
X-Received: by 2002:a05:6512:ba1:b0:4f3:80a3:b40a with SMTP id b33-20020a0565120ba100b004f380a3b40amr13107838lfv.69.1689022443890;
        Mon, 10 Jul 2023 13:54:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id p16-20020a05651211f000b004fbab80ecefsm44941lfs.145.2023.07.10.13.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 13:54:03 -0700 (PDT)
Message-ID: <d3f5cf11-e481-2c50-b712-f8832265e897@linaro.org>
Date:   Mon, 10 Jul 2023 23:54:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH 07/12] drm/msm/adreno: Move speedbin mapping
 to device table
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-8-robdclark@gmail.com>
 <fa8f72dd-8d74-e941-1b4e-2464a9034424@linaro.org>
 <CAF6AEGv2K9Ar8=96H2_=BJc=hqFNnh2M5fvbG5p5gjoAEfR=-A@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGv2K9Ar8=96H2_=BJc=hqFNnh2M5fvbG5p5gjoAEfR=-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/07/2023 22:56, Rob Clark wrote:
> On Thu, Jul 6, 2023 at 7:54 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 07/07/2023 00:10, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> This simplifies the code.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 171 ++-------------------
>>>    drivers/gpu/drm/msm/adreno/adreno_device.c |  51 ++++++
>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  25 +++
>>>    3 files changed, 92 insertions(+), 155 deletions(-)
>>
>>
>> Interesting hack, I'd say.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Minor nit below.
>>
>>>
>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> index d5335b99c64c..994ac26ce731 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> @@ -72,8 +72,33 @@ struct adreno_info {
>>>        u32 inactive_period;
>>>        const struct adreno_reglist *hwcg;
>>>        u64 address_space_size;
>>> +     /**
>>> +      * @speedbins: Optional table of fuse to speedbin mappings
>>> +      *
>>> +      * Consists of pairs of fuse, index mappings, terminated with
>>> +      * UINT_MAX sentinal.
>>> +      */
>>> +     uint32_t *speedbins;
>>
>> Would it be better to explicitly list this as pairs of uint32_t? And
>> then use braces in ADRENO_SPEEDBIN initialisation.
> 
> It would mean the sentinel would take 8 bytes instead of 4.. maybe
> that is over-thinking it, but it was the reason I just stuck with a
> flat table

Guessed so. But we are wasting so much memory already... I think that 
the paired structure would better reflect the data - it's not a flat 
list, but a list of nvmem <-> speedbin pairs.

> 
> BR,
> -R
> 
>>>    };
>>>
>>> +/*
>>> + * Helper to build a speedbin table, ie. the table:
>>> + *      fuse | speedbin
>>> + *      -----+---------
>>> + *        0  |   0
>>> + *       169 |   1
>>> + *       174 |   2
>>> + *
>>> + * would be declared as:
>>> + *
>>> + *     .speedbins = ADRENO_SPEEDBINS(
>>> + *                      0,   0,
>>> + *                      169, 1,
>>> + *                      174, 2
>>> + *                  ),
>>> + */
>>> +#define ADRENO_SPEEDBINS(tbl...) (uint32_t[]) { tbl, UINT_MAX }
>>> +
>>>    const struct adreno_info *adreno_info(struct adreno_rev rev);
>>>
>>>    struct adreno_gpu {
>>
>> --
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

