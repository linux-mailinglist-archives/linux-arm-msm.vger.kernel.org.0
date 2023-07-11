Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0648D74E449
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 04:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjGKCeP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 22:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjGKCeP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 22:34:15 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEEAD1A2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 19:34:13 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b6ff1a637bso81612141fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 19:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689042852; x=1691634852;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIxtCFBPEeOEWz1SJom8ZygG3Y0AOhRCbY7bAJ+qiuQ=;
        b=xgdVhhvdX/yyxvlj3Bos9cHJuzXF0kdw6Mqur096mSEEqyTPx0jE0i8ENIM2pJjRo4
         S5ux6foxwzMn8GFLGv5DHs5zHezuFwTjk/v8mUHiaFHLO+/nIHk1pOXpBXkJPA653nsu
         z1Au2FMPE1Y/Y6cjfMOz0D6JKOgUahBHcVUAkZ0N6aqHHCjB5PYuQYbeA6Y1tCq2TlV5
         LZAtq1G6W3nh5V4fr/dwIai4qtfI9W3YdhRJydyheDu4Dnqn1AyaeDtfR6YEM6IzKPFu
         owMKVeBdRijOs9eMyS0dxo0RUzi+RR7XKPmtvwAhAj1shTXj6ULiFkkcqqVGvcsL8sng
         QwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689042852; x=1691634852;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIxtCFBPEeOEWz1SJom8ZygG3Y0AOhRCbY7bAJ+qiuQ=;
        b=TgbqfHOsOlrFZAPBHLTcIPZQnZHmbRiW2nCbHC3DCUWNZFNvrKK61pdvfBqaDBlil+
         Q9TAiQUPrBCVxCu8erwdJbAxzg+8Zkh5ldQ1MAm3PkOXNA2UIlE7/OHEmteJbd+RmOFH
         lGI4Mnek/aN08YT04XvBhjWBESqmVHASyJbezUpWZEQZasfJgrff/6PSfg3RV/ukq7/k
         hsJcJOz3Erk6giDlmCABDxWj9dJjddrupopDcsM749p8li2g69lZh/ltiEuydotton1D
         AHg7aB1rFomx/7SbXBRYDe/3NGp4lUK+1me3PYCkmDqJfXfwiEOCwy53/76B0CiL/6+9
         4vQQ==
X-Gm-Message-State: ABy/qLYKIxbhGSiOamX/hKXm+YNEvDYRlrNmsopoFfP6E84HUN1KJyvN
        1lGgz2r5qe0cHdclOP/SeKGijg==
X-Google-Smtp-Source: APBJJlEptrQrqyHjC6cqmVnpsJGqLlJMEYX1DkC5u6EJbqyQ3k0GlRsXAivEGq9K8CZ/3eC6lMUxrg==
X-Received: by 2002:ac2:5b9a:0:b0:4fb:78a0:dd32 with SMTP id o26-20020ac25b9a000000b004fb78a0dd32mr11363966lfn.60.1689042851984;
        Mon, 10 Jul 2023 19:34:11 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v9-20020a197409000000b004fbae67c51fsm121275lfe.294.2023.07.10.19.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 19:34:11 -0700 (PDT)
Message-ID: <a25b58b4-9b94-928b-cdde-eccd56f1e444@linaro.org>
Date:   Tue, 11 Jul 2023 05:34:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 04/11] drm/msm/dpu: drop separate dpu_core_perf_tune
 overrides
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
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
 <20230707193942.3806526-5-dmitry.baryshkov@linaro.org>
 <729de13d-6fb7-ff1c-8660-4710d914258b@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <729de13d-6fb7-ff1c-8660-4710d914258b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 11/07/2023 05:31, Abhinav Kumar wrote:
> 
> 
> On 7/7/2023 12:39 PM, Dmitry Baryshkov wrote:
>> The values in struct dpu_core_perf_tune are fixed per the core perf
>> mode. Drop the 'tune' values and substitute them with known values when
>> performing perf management.
>>
>> Note: min_bus_vote was not used at all, so it is just silently dropped.
>>
> 
> Interesting ..... should bring this back properly. Will take it up.

Ack, thanks.

> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 29 ++++++++-----------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  4 ---
>>   2 files changed, 12 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> index 05d340aa18c5..348550ac7e51 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> @@ -235,7 +235,7 @@ static int _dpu_core_perf_crtc_update_bus(struct 
>> dpu_kms *kms,
>>   {
>>       struct dpu_core_perf_params perf = { 0 };
>>       int i, ret = 0;
>> -    u64 avg_bw;
>> +    u32 avg_bw;
> 
> avg_bw seems unused in this patch, so unrelated change?
> 
>>       if (!kms->num_paths)
>>           return 0;
>> @@ -291,10 +291,16 @@ void dpu_core_perf_crtc_release_bw(struct 
>> drm_crtc *crtc)
>>   static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
>>   {
>> -    u64 clk_rate = kms->perf.perf_tune.min_core_clk;
>> +    u64 clk_rate;
>>       struct drm_crtc *crtc;
>>       struct dpu_crtc_state *dpu_cstate;
>> +    if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
>> +        return kms->perf.fix_core_clk_rate;
>> +
>> +    if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
>> +        return kms->perf.max_core_clk_rate;
>> +
>>       drm_for_each_crtc(crtc, kms->dev) {
>>           if (crtc->enabled) {
>>               dpu_cstate = to_dpu_crtc_state(crtc->state);
>> @@ -305,11 +311,6 @@ static u64 
>> _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
>>           }
>>       }
>> -    if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
>> -        clk_rate = kms->perf.fix_core_clk_rate;
>> -
>> -    DRM_DEBUG_ATOMIC("clk:%llu\n", clk_rate);
>> -
> 
> Why dont you move both FIXED and MINIMUM handling below instead of above.
> 
> So that they will just override the clk_rate and you can keep this 
> useful log here and it matches where the function is.

I can keep the log in the next version. The logic was quite simple: 
there is no need to loop over CRTCs if we know that we are overriding 
the value.

> 
> This chunk looks better that way.
> 
> <skipping the rest as it LGTM>

-- 
With best wishes
Dmitry

