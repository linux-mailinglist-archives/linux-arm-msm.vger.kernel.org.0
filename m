Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAC0C608B7A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Oct 2022 12:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbiJVKVo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Oct 2022 06:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbiJVKVU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Oct 2022 06:21:20 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F310C2B3208
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Oct 2022 02:38:04 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id r14so14247414edc.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Oct 2022 02:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1kfDym2w0EElbmcx/BQsQ1yL8gt2nPkuv3T3pwbFJXM=;
        b=AmJhrDspddvLWhmS4pMWph+wgnz0kCDTGG9e6m9KejeBzZnmCn8RbMwMdUY8Om0zSY
         esqdVjSeZYTlyqF40HTOQ0uPpUCUbTLkVU7U6TKI/CTzkTwaEBoLVWz/x7QyvxiScijF
         SJavKFtjZvdmgNtsbnuDH4yppWfSZ6yg9w21TrK72j2o7GgW7eNrGgvGZAjqVTwNdkQX
         4lSNPJafEEq6liwUhw8vzVGrKULPlITvKT1ZdTZgAtiI64aJh3qn1mITHNU4uSMNP2Yz
         RODCSzYRcKtG9JhlHxFHgvuKqtoi9Rf73cajMk2MROpQl5MZu+iUt6JzFZvXHoK4ntnh
         JmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1kfDym2w0EElbmcx/BQsQ1yL8gt2nPkuv3T3pwbFJXM=;
        b=RxV7GJIJdPZmj8mmulGKJDPrgbhIO/ou585wlKEUmZ1vUXOmK5rnMmSck83AeV0v/s
         qh27kHLBdxxi1TdK8Te/echv70GH18q2M42TSocZ9yqJ6AF/1ajVbCay1r4tibVV81pQ
         oTNMOSyd9MzAsO0K71Qx4kyEPLv9huaUFdVEoubs3uNin1IruAbwAAyEmk4hxQscSJct
         lW6BQjl0+FYnQ5kl9mIeG7Ic9L+9MSM2kPN5SO9raVnKeqYBlNHH6Ux9WEwhWIDOTBzQ
         vwMxVcGbKO1Odh2tSDDys2GOfEsIKEAOLbV2BRZbkF0gSk12dAovD3jqeX07oJwkGUyH
         Jr5g==
X-Gm-Message-State: ACrzQf2rL7jrpZE8JEiTPz8jsIz9OpbI1AE3jVLrwCLioQKHV3Kmpt4L
        qadr8Wj0TvnZJhTdidTtzoJHmGlNY0PELvKy
X-Google-Smtp-Source: AMsMyM7dYOLwfD3xuUFQ4hZaTYV/X1nIweNJwQA3r2rbLyyBTwJl35wFPsRQKl3boAFc3N3EcBShoQ==
X-Received: by 2002:ac2:50cf:0:b0:4a2:a581:6411 with SMTP id h15-20020ac250cf000000b004a2a5816411mr7718493lfm.124.1666430815240;
        Sat, 22 Oct 2022 02:26:55 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id o4-20020ac25e24000000b0049fe6f36880sm3498101lfg.51.2022.10.22.02.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 02:26:54 -0700 (PDT)
Message-ID: <80f060fc-142f-7876-0eb9-cbd2b3e46789@linaro.org>
Date:   Sat, 22 Oct 2022 12:26:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] drm/msm/mdp5: stop overriding drvdata
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20221021192641.2423237-1-dmitry.baryshkov@linaro.org>
 <778ae711-50a4-ae37-db18-8faa26f4c0ae@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <778ae711-50a4-ae37-db18-8faa26f4c0ae@quicinc.com>
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

On 22/10/2022 00:58, Abhinav Kumar wrote:
> Hi Dmitry
> 
> A couple of comments below.
> 
> On 10/21/2022 12:26 PM, Dmitry Baryshkov wrote:
>> The rest of the code expects that master's device drvdata is the
>> struct msm_drm_private instance. Do not override the mdp5's drvdata.
>>
>> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>> Abhinav, Rob, please pick this for -fixes.
>>
>> This is an updated version of [1]. Fixed the read_mdp_hw_revision()
>> function. PM runtime isn't available at the moment, as priv->kms is not
>> set.
> 
> Can you split them into two changes?

I can, but this would look a bit artificial.

Before the patch [1] there is no need to fix read_hw_revision, as 
pm_runtime_resume works correctly. And after [1] read_hw_revision can 
fail because pm_runtime_resume() wouldn't work before priv->kms being set

> 
> Any reason fixing the read_mdp_hw_revision() needs to be in this?
>>
>> [1] https://patchwork.freedesktop.org/patch/490326/?series=105392&rev=1
>>
>> ---
>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 37 ++++++++++++++----------
>>   1 file changed, 22 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c 
>> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> index b0d21838a134..506c64940972 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> @@ -203,7 +203,7 @@ static int mdp5_set_split_display(struct msm_kms 
>> *kms,
>>                                 slave_encoder);
>>   }
>> -static void mdp5_destroy(struct platform_device *pdev);
>> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
>>   static void mdp5_kms_destroy(struct msm_kms *kms)
>>   {
>> @@ -223,7 +223,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
>>       }
>>       mdp_kms_destroy(&mdp5_kms->base);
>> -    mdp5_destroy(mdp5_kms->pdev);
>> +    mdp5_destroy(mdp5_kms);
>>   }
>>   #ifdef CONFIG_DEBUG_FS
>> @@ -519,9 +519,15 @@ static void read_mdp_hw_revision(struct mdp5_kms 
>> *mdp5_kms,
>>       struct device *dev = &mdp5_kms->pdev->dev;
>>       u32 version;
>> -    pm_runtime_get_sync(dev);
>> +    /* Manually enable the MDP5, as pm runtime isn't usable yet */
>> +    if (mdp5_enable(mdp5_kms)) {
> 
> mdp5_enable() always seems to return 0 so do we need this if block?

No.

> 
>> +        *major = 0;
>> +        *minor = 0;
>> +        return;
>> +    }
>> +
>>       version = mdp5_read(mdp5_kms, REG_MDP5_HW_VERSION);
>> -    pm_runtime_put_sync(dev);
>> +    mdp5_disable(mdp5_kms);
>>       *major = FIELD(version, MDP5_HW_VERSION_MAJOR);
>>       *minor = FIELD(version, MDP5_HW_VERSION_MINOR);
>> @@ -559,6 +565,8 @@ static int mdp5_kms_init(struct drm_device *dev)
>>       int irq, i, ret;
>>       ret = mdp5_init(to_platform_device(dev->dev), dev);
>> +    if (ret)
>> +        return ret;
>>       /* priv->kms would have been populated by the MDP5 driver */
>>       kms = priv->kms;
>> @@ -632,9 +640,8 @@ static int mdp5_kms_init(struct drm_device *dev)
>>       return ret;
>>   }
>> -static void mdp5_destroy(struct platform_device *pdev)
>> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
>>   {
>> -    struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>>       int i;
>>       if (mdp5_kms->ctlm)
>> @@ -648,7 +655,7 @@ static void mdp5_destroy(struct platform_device 
>> *pdev)
>>           kfree(mdp5_kms->intfs[i]);
>>       if (mdp5_kms->rpm_enabled)
>> -        pm_runtime_disable(&pdev->dev);
>> +        pm_runtime_disable(&mdp5_kms->pdev->dev);
>>       drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
>>       drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
>> @@ -797,8 +804,6 @@ static int mdp5_init(struct platform_device *pdev, 
>> struct drm_device *dev)
>>           goto fail;
>>       }
>> -    platform_set_drvdata(pdev, mdp5_kms);
>> -
>>       spin_lock_init(&mdp5_kms->resource_lock);
>>       mdp5_kms->dev = dev;
>> @@ -839,9 +844,6 @@ static int mdp5_init(struct platform_device *pdev, 
>> struct drm_device *dev)
>>        */
>>       clk_set_rate(mdp5_kms->core_clk, 200000000);
>> -    pm_runtime_enable(&pdev->dev);
>> -    mdp5_kms->rpm_enabled = true;
>> -
>>       read_mdp_hw_revision(mdp5_kms, &major, &minor);
>>       mdp5_kms->cfg = mdp5_cfg_init(mdp5_kms, major, minor);
>> @@ -893,10 +895,13 @@ static int mdp5_init(struct platform_device 
>> *pdev, struct drm_device *dev)
>>       /* set uninit-ed kms */
>>       priv->kms = &mdp5_kms->base.base;
>> +    pm_runtime_enable(&pdev->dev);
>> +    mdp5_kms->rpm_enabled = true;
>> +
>>       return 0;
>>   fail:
>>       if (mdp5_kms)
>> -        mdp5_destroy(pdev);
>> +        mdp5_destroy(mdp5_kms);
>>       return ret;
>>   }
>> @@ -953,7 +958,8 @@ static int mdp5_dev_remove(struct platform_device 
>> *pdev)
>>   static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
>>   {
>>       struct platform_device *pdev = to_platform_device(dev);
>> -    struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>> +    struct msm_drm_private *priv = platform_get_drvdata(pdev);
>> +    struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>>       DBG("");
>> @@ -963,7 +969,8 @@ static __maybe_unused int 
>> mdp5_runtime_suspend(struct device *dev)
>>   static __maybe_unused int mdp5_runtime_resume(struct device *dev)
>>   {
>>       struct platform_device *pdev = to_platform_device(dev);
>> -    struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>> +    struct msm_drm_private *priv = platform_get_drvdata(pdev);
>> +    struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>>       DBG("");

-- 
With best wishes
Dmitry

