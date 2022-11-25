Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 774946385FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Nov 2022 10:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiKYJVy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Nov 2022 04:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbiKYJVx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Nov 2022 04:21:53 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9628B1F2CB
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 01:21:51 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id j4so6019481lfk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 01:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p9awIt23C9B0mgiGT4mepq/ybmPHDMmBXg58fCcUBAk=;
        b=flU6n6WSEyJW5eoXkO3kIYZghKbQwfAnCadDgeowHgDl13k9m3u61q5HfRa7MYCXYW
         ieeqw6ujaHROkuu0Ln6xrScS5SmsZPyNen7qgf3lM6+HNME7cCCiazjYdkwN25uVX17y
         lzLPtFPCOo7PmsjkE8Y3jVYq5IiLBmfCeEDnAy01Cu8yTEkIGnhzktlbqvqHLZWmNxvK
         bnwIugwA3a+AQ1r4RY5Dn/26c/19ClMMsOQjccBXja1GLA6fdcx3++b8nZtNKN9DKPko
         nGWu2yMKA01XKeHvfXrEXP0SvkrM917MYz1moyuXxtEyx8J+QaiO1TUpNDH/71Zd8Bvd
         LxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p9awIt23C9B0mgiGT4mepq/ybmPHDMmBXg58fCcUBAk=;
        b=Ls0+7da7MYTPh/TFYPLVhnV4j+P7PM4p5v+cw+hcqJd/XzEG2VGBcvHKWwcJANo8Ah
         hGzyPuo97yRrXZxdkLDi4Z+E5f53VP1SpsW6GQOB6pj1gS3Wgk9kcDrPkAI/JmxSAcdU
         02B7hPGLcqUAu41vxrw8jCvwH24Q23eC4Y1aj9NYhyK4w44O91Gf2mysQd4x752etHLO
         nj4dhvHgdNl2UTR6tL7Ae/tjJFN5yuFKY+wgsDCAZfo3yndpmJ5LNd9o2AjW1sEwgRTn
         lRh3mgR4T5Su25uHxj05IlJ/GVo/rePHv1JR+j8l+aKOMYq8qSFgELaUn8OrzoORBREX
         Acwg==
X-Gm-Message-State: ANoB5plxruMvw1ZcEX7BmcK/repXXzjRffGOcui6KzyxmKR8Soiam2nG
        ksebCNWXwIJsvYCWuhC1lwEGxA==
X-Google-Smtp-Source: AA0mqf4pnL6+AvAmN0vSQPk/HSIR0Bc4L7qzyYUY8jBGojT9p3SC2+2ZZUdYisaxVtOjKVPBBqzgDQ==
X-Received: by 2002:a05:6512:203a:b0:4b4:9124:8aad with SMTP id s26-20020a056512203a00b004b491248aadmr11582973lfs.285.1669368109940;
        Fri, 25 Nov 2022 01:21:49 -0800 (PST)
Received: from ?IPV6:2001:14ba:a301:5de4::1? (dzpy175yyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a301:5de4::1])
        by smtp.gmail.com with ESMTPSA id e13-20020a05651c038d00b0027975b5d3c2sm298559ljp.6.2022.11.25.01.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 01:21:49 -0800 (PST)
Message-ID: <3c9330f2-a75f-47ea-160c-848c583d9306@linaro.org>
Date:   Fri, 25 Nov 2022 11:21:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/msm/mdp5: fix reading hw revision on db410c platform
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20221125000213.252115-1-dmitry.baryshkov@linaro.org>
 <dc44d8f1-c782-452b-5928-57538250dade@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <dc44d8f1-c782-452b-5928-57538250dade@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/11/2022 07:45, Abhinav Kumar wrote:
> On 11/24/2022 4:02 PM, Dmitry Baryshkov wrote:
>> Since the commit commit c6122688f265 ("drm/msm/mdp5: stop overriding
>> drvdata") reading the MDP5 hw revision on db410c will crash the board
>> as the MDSS_GDSC is not enabled. Revert a part of the offending commit
>> (moving rpm enablement) and set priv->kms earlier. This make it possible
>> to use pm_runtime_get_sync() during read_mdp_hw_revision(), which will
>> power up both the MDP5 and MDSS devices.
>>
> 
> This is the exact concern I had even when c6122688f265 was pushed.
> 
> https://patchwork.freedesktop.org/patch/508334/#comment_917689
> 
> Was the response given that time not correct then?

Not fully correct. I did not notice, that non-rpm-enabled mdp5 node 
doesn't force mdss to be in the on state. (Which is strange. Maybe we 
are leaking pm_runtime_enable() for it somewhere.)

> 
> https://patchwork.freedesktop.org/patch/508334/#comment_917713
>> Fixes: c6122688f265 ("drm/msm/mdp5: stop overriding drvdata")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 17 ++++++++---------
>>   1 file changed, 8 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c 
>> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> index b46f983f2b46..29ae5c9613f3 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> @@ -519,10 +519,9 @@ static void read_mdp_hw_revision(struct mdp5_kms 
>> *mdp5_kms,
>>       struct device *dev = &mdp5_kms->pdev->dev;
>>       u32 version;
>> -    /* Manually enable the MDP5, as pm runtime isn't usable yet. */
>> -    mdp5_enable(mdp5_kms);
>> +    pm_runtime_get_sync(dev);
>>       version = mdp5_read(mdp5_kms, REG_MDP5_HW_VERSION);
>> -    mdp5_disable(mdp5_kms);
>> +    pm_runtime_put_sync(dev);
>>       *major = FIELD(version, MDP5_HW_VERSION_MAJOR);
>>       *minor = FIELD(version, MDP5_HW_VERSION_MINOR);
>> @@ -839,6 +838,12 @@ static int mdp5_init(struct platform_device 
>> *pdev, struct drm_device *dev)
>>        */
>>       clk_set_rate(mdp5_kms->core_clk, 200000000);
>> +    /* set uninit-ed kms */
>> +    priv->kms = &mdp5_kms->base.base;
>> +
>> +    pm_runtime_enable(&pdev->dev);
>> +    mdp5_kms->rpm_enabled = true;
>> +
>>       read_mdp_hw_revision(mdp5_kms, &major, &minor);
>>       mdp5_kms->cfg = mdp5_cfg_init(mdp5_kms, major, minor);
>> @@ -887,12 +892,6 @@ static int mdp5_init(struct platform_device 
>> *pdev, struct drm_device *dev)
>>       if (ret)
>>           goto fail;
>> -    /* set uninit-ed kms */
>> -    priv->kms = &mdp5_kms->base.base;
>> -
>> -    pm_runtime_enable(&pdev->dev);
>> -    mdp5_kms->rpm_enabled = true;
>> -
>>       return 0;
>>   fail:
>>       if (mdp5_kms)

-- 
With best wishes
Dmitry

