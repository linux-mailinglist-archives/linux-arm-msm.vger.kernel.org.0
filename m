Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB9A7548C7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jul 2023 15:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjGONi7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Jul 2023 09:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjGONi6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Jul 2023 09:38:58 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40732733
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Jul 2023 06:38:54 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b69e6d324aso44031391fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Jul 2023 06:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689428333; x=1692020333;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7iB5/lpO1JuU19PICV3atLqXB4y67HnlijWrnqa84c=;
        b=HUP8DL4kOv/M4AYGzejB0C5FePTHR/UvMh6RWDYl0OfeHGzTTyjDovqKrBAgw0OIJt
         sy2ShgFqFToqppcsIomHkKakUKJeKZx0kb/SC8LuSio5xA/994uER2P8wQs6XrY3Hg23
         RwW9yWMkjWhutcnezy4aZOGQAox3gNjHYbktyBPiY+l3Y79Sd2iWmdFlHM4p547E28vW
         18e2x0oXeNdftsDCH3D6VF3MsUNjqy80tb5QGLTSG90XqQ2F0F1mlJsV41X9vDU7qLex
         U+7J1U4KINYvvmo63Bv8GgO4cot8m5FNngGNvyGkoKJCHIOy+VOcPqiYSx8ccd2Uohyz
         E5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689428333; x=1692020333;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7iB5/lpO1JuU19PICV3atLqXB4y67HnlijWrnqa84c=;
        b=GIYdeuFTwNMxWEeyC2bZznH245FCb2cXr3xjewrGtjoBYg2nu8L4YIO4MdB9xfEjIW
         9JQKSD/pgQauogmg/a/gpwt2O7OfBvZ+t7cLbux7fPXOy99Bq6AgceAR5CbGjoEsSsp/
         z88PG1DcK7Z2H2DQhDDIaUo83Gp0A3pro71yVkcRDtkEcRQm7ziqoHvcnd+4yHZtC5ab
         m45HyX7t7CaMkBcjtzHV4QWwfni4AsfRDYqf1GtACo0t9PuBdfAY3Yy/cr9sf3TD9O5s
         0QTqb33my9w5JzeBORBLPfQcF/dgTOSf/QUlfNo5yjiSh65LkjEMjHPzIInRIs1rc2Fd
         P3RA==
X-Gm-Message-State: ABy/qLbuwv5ZaDxOtEuSRws7lUwty3zGHfpyFGEdFZmrgIKsXaXyopWS
        rwVwM7yTafMMdt+8FsXZdZFELg==
X-Google-Smtp-Source: APBJJlEXILyVEP7YpScm3p7DEsiQ1SWV26NgOjJSRxdfBd5MGi5EuoIcP+uhLEXDtEBpWRI2e2Wztw==
X-Received: by 2002:a05:6512:3087:b0:4fb:8435:3efc with SMTP id z7-20020a056512308700b004fb84353efcmr5908202lfd.16.1689428333197;
        Sat, 15 Jul 2023 06:38:53 -0700 (PDT)
Received: from [192.168.1.101] (abxi167.neoplus.adsl.tpnet.pl. [83.9.2.167])
        by smtp.gmail.com with ESMTPSA id m7-20020a195207000000b004fb504b0f32sm1894166lfb.69.2023.07.15.06.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 06:38:52 -0700 (PDT)
Message-ID: <0e805cae-d311-2b8c-cead-62621288a34f@linaro.org>
Date:   Sat, 15 Jul 2023 15:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-13-robdclark@gmail.com>
 <4cdceddb-033a-6301-163e-89d27152e242@linaro.org>
 <CAF6AEGvtMRnWBQz_KOi5b1p40HjvAAHYdd64kiR3KsKWPBO+bg@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 12/12] drm/msm/adreno: Switch to chip-id for identifying
 GPU
In-Reply-To: <CAF6AEGvtMRnWBQz_KOi5b1p40HjvAAHYdd64kiR3KsKWPBO+bg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7.07.2023 18:08, Rob Clark wrote:
> On Thu, Jul 6, 2023 at 5:25 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 6.07.2023 23:10, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Since the revision becomes an opaque identifier with future GPUs, move
>>> away from treating different ranges of bits as having a given meaning.
>>> This means that we need to explicitly list different patch revisions in
>>> the device table.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
[...]

>>>  static inline int adreno_is_7c3(const struct adreno_gpu *gpu)
>>>  {
>>> -     /* The order of args is important here to handle ANY_ID correctly */
>>> -     return adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), gpu->rev);
>>> +     return gpu->info->chip_ids[0] == 0x06030500;
>>>  }
>> I'm sorry, but this screams trouble.. and doesn't sound very maintainable :/
>>
> 
> why? It is intentionally checking the first chip-id so that nothing
> breaks if later chip-ids are added
checking for magic numbers and magic array indices at the same time is
very prone to breaking, as breaking this check would not at all be easy
to spot in code review.

> 
>> Apart from all these comments, I don't really see the point of this patch,
>> other than trying to tie together Qualcomm's almost-meaningless chipids on
>> a7xx into the picture..
>>
>> Since they can't even be read back from the hardware, I don't think trying
>> to force them into the upstream kernel makes any sense.
> 
> Sure, we _could_ pick our own arbitrary identifiers, we don't have to
> align with kgsl.  But that would be a super huge PITA for mesa, which
> has support for both kernels.
Perhaps I'm biased towards keeping this kind of stuff out of the kernel,
but I'd say that Linux should decide on one logical path.

In between us starting this discussion, Qualcomm managed to introduce
yet another way of deciding what GPU is present on the system in their
downstream driver[1]. We're at like 5 now. Do we wanna keep up each time?
New ID rework for A8xx when that comes out one day?

> 
>> On a different note, I think we could try to blockify Adreno definitions a
>> bit by splitting things into:
>>
>> - Core GPU propeties (revision, fw name, GMEM size)
>>
>> - G(P)MU properties
>>
>> - Family data (quirks, reg presets in some config struct which could be a
>>   union of config structs per generation, hwcg, maybe protected regs ptr
>>   should also be moved there)
> 
> We do something like this on the mesa side.  But we also get to use
> python tricks to generate code as part of the build process which
> makes things a bit more elegant.
> 
> Fwiw, I was already thinking about splitting the gpu "hw catalog" from
> a flat table, to probably something more like a table of tables, so
> that we can split a2xx/a3xx/a4xx/a5xx/a6xx tables into separate files.
> And then we could move hwcg/protect/etc tables into the same file.
> But I thought that might be a bit too conflicty for the a7xx series so
> was thinking to wait until after that landed.. unless you don't think
> it will be a problem.
Yeah I'd like to get a7xx landed this season..

Konrad

[1] they now read parts of socinfo from smem and decide the CHIPID and
    speedbin based on that, but it's not available on most existing SoCs,
    that was thrown in with SOCID v17
> 
> BR,
> -R
> 
>> - Generation data (init function, a2xx and a6xx specifics)
>>
>> - Speedbin LUTs matched against socid
>>
>>
>> or something like that.. there's a whole lot of duplicated data atm
>>
>> Konrad
>>>
>>>  static inline int adreno_is_a660(const struct adreno_gpu *gpu)
>>> @@ -358,8 +364,7 @@ static inline int adreno_is_a680(const struct adreno_gpu *gpu)
>>>
>>>  static inline int adreno_is_a690(const struct adreno_gpu *gpu)
>>>  {
>>> -     /* The order of args is important here to handle ANY_ID correctly */
>>> -     return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu->rev);
>>> +     return gpu->info->chip_ids[0] == 0x06090000;
>>>  };
>>>  /* check for a615, a616, a618, a619 or any a630 derivatives */
>>>  static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
