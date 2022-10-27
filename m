Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F55F61021D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 21:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236754AbiJ0T4e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 15:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236752AbiJ0T42 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 15:56:28 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C8287693
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 12:56:23 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id x21so3960297ljg.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 12:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IGiiSlUFK+nTOzcVd/qT3yAJgY21hW1dQfiQfftLUhA=;
        b=kS5PVCNDS/mR41DH1BMVN4lsRJsVtiE0YO/uBnlnhoL6SMuHlJ203KuC/EXSV/n1/f
         q2vTSmt5uEVJuoqJpZAM0nHAPCc2CVFjGT9ZxxnzAG5i2IHrbrouCJfCjOkrTBHEKYkX
         tqO394JrRkkhMV1vEl3FkOi/cfxHvZr2WzYchnnS01T+Az6gNrSxhiLxzWxyNTlQUeKy
         X/DjQQdZpypgxGTSIxnyAMK86G65P06znxjhora1YuDHJxJ3ES8K95rm2m37Zozh818Z
         bx50iOCzGOzG5LarEgx7/twsPAqNmbZiJ8sTLuDXfOUNgGdVFLVdUaJkVgs18GRBpTpo
         e6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGiiSlUFK+nTOzcVd/qT3yAJgY21hW1dQfiQfftLUhA=;
        b=v6Qzw+46YMhKnBrurZwyFjZw5+aixY9s3icOR2rj5QvYlNAkxIPfmPk38hf891I0ts
         +xUa74/GAmT4sAdKdvVZLFaW19dv71guzK7o6Mroa/afEdx9PaGvOg3pGFO0izKh7XcC
         4RdTAJjHjD6+moQesH+KRpE2Epn7d75MWyhDl/4y3sdmRkWoC3w1f2/cqaCQ/Q8OQYsM
         zFPmZwC/ssOF6/vSmMCGuC01LJD3k6lv+KOlz5TNfxcaETNcdFHJwVFtTTtpeFkaqOPo
         +lPCTan4vqdiw+PAl5yFvDbtFYhiU+PV1Y1tDBxNgt7F+zvvMK0KlvFtL8c1A7ZjBnoA
         bo0Q==
X-Gm-Message-State: ACrzQf0f60F8UiihCPyHZECPkZVQHn4GwcNMs5cSy658HD6IBTX5NWV0
        dHv8Pzfbcru+Zh6TaD0zmcFV+A==
X-Google-Smtp-Source: AMsMyM5u63W/uf2UAuGW/lztt9Ok9qQq1ry008FGV6JtgF3IRYNJxnbZ7D1D5DmX5TBkQZH/WywcMA==
X-Received: by 2002:a05:651c:507:b0:26f:e1c9:bb38 with SMTP id o7-20020a05651c050700b0026fe1c9bb38mr20208357ljp.195.1666900582123;
        Thu, 27 Oct 2022 12:56:22 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id d3-20020a056512368300b00492ce573726sm294189lfs.47.2022.10.27.12.56.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 12:56:21 -0700 (PDT)
Message-ID: <b6dcd614-1bf8-3b2d-cc7e-ee3a59564fc6@linaro.org>
Date:   Thu, 27 Oct 2022 22:56:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Freedreno] [PATCH v3] drm/msm/mdp5: stop overriding drvdata
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20221024152642.3213488-1-dmitry.baryshkov@linaro.org>
 <481b99e7-9e97-0109-d922-0bba39d952a3@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <481b99e7-9e97-0109-d922-0bba39d952a3@quicinc.com>
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

On 27/10/2022 21:30, Abhinav Kumar wrote:
> 
> 
> On 10/24/2022 8:26 AM, Dmitry Baryshkov wrote:
>> The rest of the code expects that master's device drvdata is the
>> struct msm_drm_private instance. Do not override the mdp5's drvdata.
>>
>> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>> Abhinav, Rob, please pick this for -fixes.
>>
>> This is an updated version of [1]. Fixed the read_mdp_hw_revision()
>> function. PM runtime isn't available at the moment, as priv->kms is not
>> set.
>>
>> [1] https://patchwork.freedesktop.org/patch/490326/?series=105392&rev=1
>>
>> Changes since v2:
>> - Removed the clause checking whether mdp5_enable() has failed (it can
>>    not fail, noted by Abhinav)
>>
>> Changes since v1:
>> - Expanded the patch to also handle the read_mdp_hw_revision() and also
>>    to move pm enablement to the place where the pm_runtime can actually
>>    be used.
>>
>> ---
>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 32 +++++++++++++-----------
>>   1 file changed, 17 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c 
>> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> index b0d21838a134..b46f983f2b46 100644
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
>> @@ -519,9 +519,10 @@ static void read_mdp_hw_revision(struct mdp5_kms 
>> *mdp5_kms,
>>       struct device *dev = &mdp5_kms->pdev->dev;
>>       u32 version;
>> -    pm_runtime_get_sync(dev);
>> +    /* Manually enable the MDP5, as pm runtime isn't usable yet. */
>> +    mdp5_enable(mdp5_kms);
>>       version = mdp5_read(mdp5_kms, REG_MDP5_HW_VERSION);
>> -    pm_runtime_put_sync(dev);
>> +    mdp5_disable(mdp5_kms);
> 
> Please correct me if wrong here, if we bypass the pm to enable the 
> clocks explicitly here, are we still guaranteed about GDSC to be ON?

The gdsc is tied to the mdss device, not to mdp5. So the gdsc will be 
enabled, because for mdp5 to probe the mdss device also should be powered.

> 
> 
>>       *major = FIELD(version, MDP5_HW_VERSION_MAJOR);
>>       *minor = FIELD(version, MDP5_HW_VERSION_MINOR);
>> @@ -559,6 +560,8 @@ static int mdp5_kms_init(struct drm_device *dev)
>>       int irq, i, ret;
>>       ret = mdp5_init(to_platform_device(dev->dev), dev);
>> +    if (ret)
>> +        return ret;
>>       /* priv->kms would have been populated by the MDP5 driver */
>>       kms = priv->kms;
>> @@ -632,9 +635,8 @@ static int mdp5_kms_init(struct drm_device *dev)
>>       return ret;
>>   }
>> -static void mdp5_destroy(struct platform_device *pdev)
>> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
>>   {
>> -    struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>>       int i;
>>       if (mdp5_kms->ctlm)
>> @@ -648,7 +650,7 @@ static void mdp5_destroy(struct platform_device 
>> *pdev)
>>           kfree(mdp5_kms->intfs[i]);
>>       if (mdp5_kms->rpm_enabled)
>> -        pm_runtime_disable(&pdev->dev);
>> +        pm_runtime_disable(&mdp5_kms->pdev->dev);
>>       drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
>>       drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
>> @@ -797,8 +799,6 @@ static int mdp5_init(struct platform_device *pdev, 
>> struct drm_device *dev)
>>           goto fail;
>>       }
>> -    platform_set_drvdata(pdev, mdp5_kms);
>> -
>>       spin_lock_init(&mdp5_kms->resource_lock);
>>       mdp5_kms->dev = dev;
>> @@ -839,9 +839,6 @@ static int mdp5_init(struct platform_device *pdev, 
>> struct drm_device *dev)
>>        */
>>       clk_set_rate(mdp5_kms->core_clk, 200000000);
>> -    pm_runtime_enable(&pdev->dev);
>> -    mdp5_kms->rpm_enabled = true;
>> -
>>       read_mdp_hw_revision(mdp5_kms, &major, &minor);
>>       mdp5_kms->cfg = mdp5_cfg_init(mdp5_kms, major, minor);
>> @@ -893,10 +890,13 @@ static int mdp5_init(struct platform_device 
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
>> @@ -953,7 +953,8 @@ static int mdp5_dev_remove(struct platform_device 
>> *pdev)
>>   static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
>>   {
>>       struct platform_device *pdev = to_platform_device(dev);
>> -    struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>> +    struct msm_drm_private *priv = platform_get_drvdata(pdev);
>> +    struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>>       DBG("");
>> @@ -963,7 +964,8 @@ static __maybe_unused int 
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

