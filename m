Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1AF2767939
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 01:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233581AbjG1X7i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 19:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjG1X7h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 19:59:37 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C76E60
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 16:59:36 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9936b3d0286so377316566b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 16:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690588774; x=1691193574;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9kqDR+gYxI0WrHXLyeEIAHFRT0r1ybmEtGMOrfNZ584=;
        b=Tc0wphbbxfm9O2B0ehlGXg4Xw4QqX4IOSagQYjNoN38Dowjt5CGj6XENdjXc2NBYM0
         pCo6O1I0+web9tC3/vquiqUAKICYZLIhz+18P9jGVd4/tSp3v2LMjilFSpo8M5e2Db59
         LZTCjgh4lPbuOsl/nTWwSn7PpnI2TFCZD9GtFYm/GzOIXhFoebTPCJ03y1vcKM7/ATBV
         1O+FTo2G0Pbl0aFe+juAjfN+IUrnTnYS609cF4ouzkDJYw974ZOXMhYaArKKETZAF6NB
         guQiELXSLn71F4DOGdwEEyZ581FzYQAznkVDeojK3D9lPl9n8Mr/TcmKciUGKoTeAiDy
         a2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690588774; x=1691193574;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9kqDR+gYxI0WrHXLyeEIAHFRT0r1ybmEtGMOrfNZ584=;
        b=invyIwF+TSl/lyuBgNanOkH3oMW3SsXX6P6pviCwWMYDrddCjHGmilMzVL4qZEWKfA
         wWn0RFIvZqPgIhEH+/xCH1Aa5R21Qg3WVOb+uIMGlQuPVsQmiqVpopANKUnJ/BwZHy3E
         ahLUb/hGCsOKcEcU21o7VX9krBhERCUoytO1uGOuSPk6WTQMKar+7NkNxsXaAUbPgz8q
         9xfsNb4Aw4PxuKBn4NEeaaI0WBFfWjrbHm6rCseEFCtbpTQqtiaK8CpBrfaA9iRYpG5o
         6VUu8fbzI205s5/GPKBJV4cpChpFc+01Y2eg78RyDACalyfQLP8y9F0AQtMtqDchbcFO
         LtgQ==
X-Gm-Message-State: ABy/qLaPZsFwFl3ES64ZQNg0/gHFLCjZmv5lwJeN+F1OF6yNL/LOrb7P
        bTgFgH68qgcvctH8y0HWbhSr1g==
X-Google-Smtp-Source: APBJJlEIy2d3ZrA7+NcNoTs2/vz7hH8S6b+sy/peh9Yw91p+0JyXTHFn6ajEj8qf14VFxR+vX13AzQ==
X-Received: by 2002:a17:906:18:b0:99b:504d:d9c7 with SMTP id 24-20020a170906001800b0099b504dd9c7mr669088eja.67.1690588774689;
        Fri, 28 Jul 2023 16:59:34 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u7-20020a170906408700b0098de7d28c34sm2585366ejj.193.2023.07.28.16.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 16:59:34 -0700 (PDT)
Message-ID: <c9d7994d-5781-41b0-6af0-cc45d4ebf6fb@linaro.org>
Date:   Sat, 29 Jul 2023 02:59:32 +0300
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
 <byxscievxgqwcdu56mebkoy4jpgogzy3euddz73u2qryh3itwb@to3pyltcqqxg>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <byxscievxgqwcdu56mebkoy4jpgogzy3euddz73u2qryh3itwb@to3pyltcqqxg>
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

On 27/07/2023 23:03, Marijn Suijten wrote:
> On 2023-07-27 19:20:58, Dmitry Baryshkov wrote:
>> The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
>> Rather than checking for the flag, check for the presense of the
>> corresponding interrupt line.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> That's a smart use of the interrupt field.  I both like it, and I do
> not.  While we didn't do any validation for consistency previously, this
> means we now have multiple ways of controlling available "features":
> 
> - Feature flags on hardware blocks;
> - Presence of certain IRQs;
> - DPU core revision.

I hesitated here too. For INTF it is clear that there is no other good 
way to check for the TE feature. For PP we can just check for the DPU 
revision.

> 
> Maybe that is more confusing to follow?  Regardless of that I'm
> convinced that this patch does what it's supposed to and gets rid of
> some ambiguity.  Maybe a comment above the IF explaining the "PP TE"
> feature could alleviate the above concerns thoo.  Hence:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
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

