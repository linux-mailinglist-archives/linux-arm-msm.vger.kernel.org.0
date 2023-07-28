Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECB08767921
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 01:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbjG1Xqx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 19:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjG1Xqw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 19:46:52 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06E5422C
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 16:46:51 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5221f3affe4so3353211a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 16:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690588010; x=1691192810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lz9kYtiZPQWUEvSrRUt8Bwnt8DSLq3LSMib0FexMztk=;
        b=gQNsMagMwNTXP/3B3tpD6enIE8S7Ne55yezjQMlh/M03QcEBct+qczveZpKnN40TGG
         MyPZo2CfisrrsjUmMIbuX+p4qGptYK3jS29Oh8Ga4P+CebI4xCh5S1olPtpJT1ZKJrc3
         WNrCuFU0Z1tP4m2frzGViw/LJuxB7PCeV58YOr6X1xO3zHKoPNljVS/62rET8qYZSo/i
         XvLr1Tr+FsDGdmKImv2kjNsB4mE0cWm8p5elJy6d7zY+sn+oWHANtSJkOvxIo95nacEN
         TRINLeO6OiIb8D5jl9uNzCLniE5Em9f66c+qvxkZex00OwSPfRov8FxKRipB3Z1qA8uI
         lifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690588010; x=1691192810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lz9kYtiZPQWUEvSrRUt8Bwnt8DSLq3LSMib0FexMztk=;
        b=AMktdLJook+dzYnGBooMP3mQ+1+0XAjIqRqLHSMwa2kheH8N1eXkhwVN3g83Tahr1w
         tAtpibi/Cnz1T/rOGGThfLbN5P3hrOXV5E8WfqYyXS8Au0fWTyq7E97fxCIT9bZzWANU
         ylrS+PSekq61WTh1tc/m9YmzAoqy4ROKw5z2mLav3Mgi8gJ3MBOOi56ZRIo26tPo4Oj+
         atsEq584b+R6nTySe5AKr8SDJdI8NsW2rUHwc9v5oyIf11G53K5iq8ZFUTE+tW4MvOGP
         /9ruAnj7MTfr65Y02cPOQoCFlV++4qHQgJ07lxuo87lBxaUIfbTeEPYB99Y7o8Zpfle3
         Xluw==
X-Gm-Message-State: ABy/qLYQXKf/j8Q/oVt6tga6Q9N3hCPDNix9FJvtdTPL+13eLk+z9Pxd
        UX7Mm6cytAx8lrSGJ1o1zCGZJg==
X-Google-Smtp-Source: APBJJlHdWbCNHoB6EB/GbRVQSPH3ZKb+71koAxi7jZd03gfnzduMFPFV7MKHYkFwsxKOIWuyd+5y+Q==
X-Received: by 2002:aa7:c152:0:b0:522:3a37:a45f with SMTP id r18-20020aa7c152000000b005223a37a45fmr2669462edp.21.1690588010267;
        Fri, 28 Jul 2023 16:46:50 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n21-20020aa7d055000000b0051e26c7a154sm2280500edo.18.2023.07.28.16.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 16:46:49 -0700 (PDT)
Message-ID: <84a16e2c-0f82-fb5f-56e3-09902487ee33@linaro.org>
Date:   Sat, 29 Jul 2023 02:46:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/7] drm/msm/dpu: enable PINGPONG TE operations only when
 supported by HW
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
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-2-dmitry.baryshkov@linaro.org>
 <hfbtvuvsha4gwlkxz4slcj6zyshuzcrq2sa3j24ymoqwo6wmib@46idblfyif7m>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <hfbtvuvsha4gwlkxz4slcj6zyshuzcrq2sa3j24ymoqwo6wmib@46idblfyif7m>
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

On 27/07/2023 23:05, Marijn Suijten wrote:
> On 2023-07-27 19:20:58, Dmitry Baryshkov wrote:
>> The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
>> Rather than checking for the flag, check for the presense of the
>> corresponding interrupt line.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> index 9298c166b213..912a3bdf8ad4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> @@ -296,7 +296,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
>>   	c->idx = cfg->id;
>>   	c->caps = cfg;
> 
> In hindsight, maybe there's one patch missing from this series.  You
> inlined _setup_intf_ops() later, but there's no patch inlining
> _setup_pingpong_ops() which looks to be required for applying this
> patch.

Yes, I missed it somehow.

> 
> - Marijn
> 
>>   
>> -	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
>> +	if (cfg->intr_rdptr) {
>>   		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
>>   		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
>>   		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

