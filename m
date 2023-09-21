Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF96C7AA4D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Sep 2023 00:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbjIUWVd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Sep 2023 18:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233171AbjIUWUz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Sep 2023 18:20:55 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83C32A3AD0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Sep 2023 10:58:00 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9adca291f99so145347366b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Sep 2023 10:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695319079; x=1695923879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vwmvG5vLsSx5qVJpIDAQauKd5SFkomPYwP2Gxr7JRg4=;
        b=otQz7S0nQtBkcUIU9o4bPpbwlHMUAsIBRH91JFujt8uGk2gBv4KJvAOJj8Lzv++aqx
         pq8pRESRTQoVmcg1n3ywd2Xv041opfnm8unO4Ugy/utBZcrLnsFaz2q2P1XfJEw6udJZ
         QbUIUp3V84uakpCHIuixkA+5mh/xOBwZa0rL2Md1vVYtI+gm4YRsLVRShLBxVuEyBMMX
         M/tX5Z0qB8m2Q2I1t5ZV4zlGjL/y5FH1yjoGX3oYYcltmnyGWec8WGGNLPT9n33Z3Qkn
         pNVJ01s+K6JR+NUlLCOlUt7ZkwwIvxaZawDm8N2HqLoTU/QQK60APLZNUG/s+xRI34CS
         rUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695319079; x=1695923879;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwmvG5vLsSx5qVJpIDAQauKd5SFkomPYwP2Gxr7JRg4=;
        b=tJn/oUvRYe9q4SkUgiTGssvqijxgCSv2LaMh6Nu9l5CAozMlT8X+DOa2zjq4MCV0qf
         JHyLRPAqK/KAg5sIHFsphBFO/xsZ2jI798/Usi7V410ZrMRuxfUztXit1W5F+u9qd/8k
         s8+RGnX5t8UTwdoMY/hPdqOJRUVCR7gQNIwD5DiWsXjVq6fVxXwhzpJy58YhFmv7zL+7
         7BUS9m0dIsd3x0lTVK0VAKTb+hnbHYvGBPrrhUjrH+eUw/kM7vIV2GE/ylT3fwf6DmwX
         8T85h7HFbnPzuf8xzR3nZUW2xAUf63HTsicabjSiQ6KJVQO8BVn/pPnS3Apzl/n1s81y
         +lIw==
X-Gm-Message-State: AOJu0Yypux1DWhFYmAiDi7I9fkaNfNv1hRP52K3vL1T4maPiqExFyPpK
        o4ZyG2It2cJbiiAYUi5816KXeiFJsyfrxbUTKwiizg==
X-Google-Smtp-Source: AGHT+IFhVm19T+LegUcKx3F6tIXfI3FFKdbMKTy0n/7EXfRWUf6QpqiIp9wLl2V2H4TrPU4Mt8A7rQ==
X-Received: by 2002:a2e:b608:0:b0:2bc:b54b:c03f with SMTP id r8-20020a2eb608000000b002bcb54bc03fmr4204197ljn.5.1695279878602;
        Thu, 21 Sep 2023 00:04:38 -0700 (PDT)
Received: from [172.20.15.189] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id b18-20020a170906039200b009ae5674825asm590222eja.47.2023.09.21.00.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 00:04:38 -0700 (PDT)
Message-ID: <ce67c10d-a589-dc2e-76cf-fb5cfaa48c66@linaro.org>
Date:   Thu, 21 Sep 2023 09:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/3] drm/msm/dpu: Add missing DPU_DSC_OUTPUT_CTRL to
 SC7280
Content-Language: en-US
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230921-topic-7280_dpu-v1-0-6912a97183d5@linaro.org>
 <20230921-topic-7280_dpu-v1-2-6912a97183d5@linaro.org>
 <444d125c-2a87-3bae-6ea0-b76dffeb63ef@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <444d125c-2a87-3bae-6ea0-b76dffeb63ef@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/21/23 02:01, Abhinav Kumar wrote:
> 
> 
> On 9/20/2023 3:46 PM, Konrad Dybcio wrote:
>> DPU_DSC_OUTPUT_CTRL should be enabled for all platforms with a CTL
>> CFG 1.0.0. SC7280 is one of them. Add it.
>>
> 
> sc7280 and all other chipsets using DSC 1.2 use dpu_hw_dsc_init_1_2 and 
> not dpu_hw_dsc_init.
> 
> dpu_hw_dsc_init_1_2 assigns the dsc_bind_pingpong_blk op by default.
> 
> So this change is not needed.
Gah, I don't like that we do it behind the scenes but I agree it's a NOP..

Konrad
