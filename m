Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFE2D4E7009
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Mar 2022 10:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357422AbiCYJgY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 05:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344774AbiCYJgX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 05:36:23 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B320694A3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 02:34:49 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id t25so12365739lfg.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3XqQVa7Xf+Mh5WS5zci1tUo0VzoceV5erDl2gShhJ3A=;
        b=lJqOOM3gFzNyYQTALRMFjYo8qlotvRftKjQvSP8YFhV3r8wjOmkoDDB1NNajO7MKNT
         6kUivfiwEiJA8yxj4J98txHseLl+xQtKwo2l9dSsgib9voDr16+/PPnEwwUg15GUchKA
         vM69cj4ZhVDqZMBxfm5jgzRIP3ZaC6Pu9DvWmAuUpfusLE0C0ucNPKjOdfIF8UHvX9Xv
         0+g8zpQDV8dNguMW+oAA8Z8o52W1Xg00u9lL38Ct6blbqfkdLXAdxsLxhq3ZgonME1uW
         bKKfLLLfLlo+/uYXrXZ0cJO4TwjBwQT0D0u6JcL0JwG7dg4hW0KjlSJYMAtbuU5NzxAU
         JOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3XqQVa7Xf+Mh5WS5zci1tUo0VzoceV5erDl2gShhJ3A=;
        b=C2ogARUDgoE1RAwGTldfh7CNFHGSL6+m2O9jIZh8/e9OIdlM5aQKdw6J/7owMi6wti
         MDk/BuwRrKNJsnPe2lJCojRAxYRpLKQsFca2AkH5orrtQXRZbEE98zEqA2qRK1r8LkSK
         PbcocGoftaWRU+jLC1aU3suTIqA//COZbXqw5gnyT8YDNYByZ/9HM9zkE8hCvCG3/DKb
         +x4NwLMhknNocPuqrfjak5ntqyaTEfflNDLm/VfXbf+T7RQrbR3x8sLMrE6zPJwqc83y
         CMALb1zkuAN/r9NvJ7GuhpfPxgUQavhgM8rZNh5gNQmsg4pHC5At82md3XhQhaa8yfew
         upKg==
X-Gm-Message-State: AOAM533tH1MR+fatAMTbl7WojCrjw/tTzxB8AMyXxHVUHoIoUJHEslpV
        zMElpR9/+RsOPeuXZV+IkXsWQw==
X-Google-Smtp-Source: ABdhPJyIBmtG4IiWkb5WcsIhShr/3qwzMAB998rTzdDGHOrlCtlPiY5bmNBPcaPkaFH1TTwXzyf5Ew==
X-Received: by 2002:ac2:5485:0:b0:448:bc39:8d30 with SMTP id t5-20020ac25485000000b00448bc398d30mr7386290lfk.462.1648200887342;
        Fri, 25 Mar 2022 02:34:47 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c20-20020a196554000000b0044a1181c527sm638069lfj.9.2022.03.25.02.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Mar 2022 02:34:46 -0700 (PDT)
Message-ID: <a02d0a60-e5f5-1b1d-b3d4-31233ca40bad@linaro.org>
Date:   Fri, 25 Mar 2022 12:34:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 6/6] drm/msm: make mdp5/dpu devices master components
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220323092538.1757880-1-dmitry.baryshkov@linaro.org>
 <20220323092538.1757880-7-dmitry.baryshkov@linaro.org>
 <CAE-0n51VvGu5w9dSUKUt4GywYbSpOaqxfWypB7ObJZg1pM5BAQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n51VvGu5w9dSUKUt4GywYbSpOaqxfWypB7ObJZg1pM5BAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/03/2022 00:37, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-03-23 02:25:38)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 38627ccf3068..ab8a35e09bc9 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -381,8 +381,8 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>>          struct icc_path *path1;
>>          struct drm_device *dev = dpu_kms->dev;
>>
>> -       path0 = of_icc_get(dev->dev, "mdp0-mem");
>> -       path1 = of_icc_get(dev->dev, "mdp1-mem");
>> +       path0 = of_icc_get(dev->dev->parent, "mdp0-mem");
> 
> dev->dev->parent is long
> 
>> +       path1 = of_icc_get(dev->dev->parent, "mdp1-mem");
>>
>>          if (IS_ERR_OR_NULL(path0))
>>                  return PTR_ERR_OR_ZERO(path0);
>> @@ -837,6 +837,9 @@ static void dpu_kms_destroy(struct msm_kms *kms)
>>          _dpu_kms_hw_destroy(dpu_kms);
>>
>>          msm_kms_destroy(&dpu_kms->base);
>> +
>> +       if (dpu_kms->rpm_enabled)
>> +               pm_runtime_disable(&dpu_kms->pdev->dev);
>>   }
>>
>>   static irqreturn_t dpu_irq(struct msm_kms *kms)
>> @@ -978,7 +981,7 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
>>          if (!domain)
>>                  return 0;
>>
>> -       mmu = msm_iommu_new(dpu_kms->dev->dev, domain);
>> +       mmu = msm_iommu_new(dpu_kms->dev->dev->parent, domain);
> 
> And dpu_kms->dev->dev->parent is longer. Can we get some local variable
> or something that is more descriptive? I guess it is an 'mdss_dev'?

Yes, I'll fix these two usages.

> 
>>          if (IS_ERR(mmu)) {
>>                  iommu_domain_free(domain);
>>                  return PTR_ERR(mmu);
>> @@ -1172,40 +1175,15 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>          return rc;
>>   }
>>
>> -static int dpu_kms_init(struct drm_device *dev)
>> -{
>> -       struct msm_drm_private *priv;
>> -       struct dpu_kms *dpu_kms;
>> -       int irq;
>> -
>> -       if (!dev) {
>> -               DPU_ERROR("drm device node invalid\n");
>> -               return -EINVAL;
>> -       }
>> -
>> -       priv = dev->dev_private;
>> -       dpu_kms = to_dpu_kms(priv->kms);
>> -
>> -       irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
>> -       if (irq < 0) {
>> -               DPU_ERROR("failed to get irq: %d\n", irq);
>> -               return irq;
>> -       }
>> -       dpu_kms->base.irq = irq;
>> -
>> -       return 0;
>> -}
>> -
>> -static int dpu_bind(struct device *dev, struct device *master, void *data)
>> +static int dpu_kms_init(struct drm_device *ddev)
>>   {
>> -       struct msm_drm_private *priv = dev_get_drvdata(master);
>> +       struct msm_drm_private *priv = ddev->dev_private;
>> +       struct device *dev = ddev->dev;
>>          struct platform_device *pdev = to_platform_device(dev);
>> -       struct drm_device *ddev = priv->dev;
>>          struct dpu_kms *dpu_kms;
>> +       int irq;
>>          int ret = 0;
>>
>> -       priv->kms_init = dpu_kms_init;
>> -
>>          dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
>>          if (!dpu_kms)
>>                  return -ENOMEM;
>> @@ -1227,8 +1205,6 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>>          }
>>          dpu_kms->num_clocks = ret;
>>
>> -       platform_set_drvdata(pdev, dpu_kms);
>> -
>>          ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
>>          if (ret) {
>>                  DPU_ERROR("failed to init kms, ret=%d\n", ret);
>> @@ -1242,31 +1218,25 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>>
>>          priv->kms = &dpu_kms->base;
>>
>> -       return ret;
>> -}
>> -
>> -static void dpu_unbind(struct device *dev, struct device *master, void *data)
>> -{
>> -       struct platform_device *pdev = to_platform_device(dev);
>> -       struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
>> +       irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
> 
> Why doesn't platform_get_irq() work? This is code movement but I'm
> trying to understand why OF APIs are required.

Good question, I'll take a look separately (in a followup patch).

> 
>> +       if (irq < 0) {
>> +               DPU_ERROR("failed to get irq: %d\n", irq);
>> +               return irq;
>> +       }
>> +       dpu_kms->base.irq = irq;
>>
>> -       if (dpu_kms->rpm_enabled)
>> -               pm_runtime_disable(&pdev->dev);
>> +       return 0;
>>   }
>>
>> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
>> index 1f571372e928..ab25fff271f9 100644
>> --- a/drivers/gpu/drm/msm/msm_kms.h
>> +++ b/drivers/gpu/drm/msm/msm_kms.h
>> @@ -194,9 +194,6 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
>>                  msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
>>   }
>>
>> -extern const struct of_device_id dpu_dt_match[];
>> -extern const struct of_device_id mdp5_dt_match[];
>> -
>>   #define for_each_crtc_mask(dev, crtc, crtc_mask) \
>>          drm_for_each_crtc(crtc, dev) \
>>                  for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>> index 7451105cbf01..9ecae833037d 100644
>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>> @@ -329,14 +310,7 @@ static int mdss_probe(struct platform_device *pdev)
>>          if (IS_ERR(mdss))
>>                  return PTR_ERR(mdss);
>>
>> -       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> -       if (!priv) {
>> -               ret = -ENOMEM;
>> -               goto fail;
>> -       }
>> -
>> -       priv->mdss = mdss;
>> -       platform_set_drvdata(pdev, priv);
>> +       platform_set_drvdata(pdev, mdss);
>>
>>          /*
>>           * MDP5/DPU based devices don't have a flat hierarchy. There is a top
>> @@ -350,39 +324,18 @@ static int mdss_probe(struct platform_device *pdev)
>>                  goto fail;
> 
> Can the goto fail be removed? And replaced with

Ack, I'll do this.

> 
> 	if (ret)
> 		msm_mdss_destroy(mdss)
> 
> 	return ret;
> 
>>          }
>>
>> -       mdp_dev = device_find_child(dev, NULL, find_mdp_node);
>> -       if (!mdp_dev) {
>> -               DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
>> -               of_platform_depopulate(dev);
>> -               ret = -ENODEV;
>> -               goto fail;
>> -       }
>> -
>> -       /*
>> -        * on MDP5 based platforms, the MDSS platform device is the component
>> -        * that adds MDP5 and other display interface components to
>> -        * itself.
>> -        */
>> -       ret = msm_drv_probe(dev, mdp_dev);
>> -       put_device(mdp_dev);
>> -       if (ret)
>> -               goto fail;
>> -
> 
> I see a lot of removal of 'goto fail'.
> 
>>          return 0;
>>
>>   fail:
>> -       of_platform_depopulate(dev);
>> -       msm_mdss_destroy(priv->mdss);
>> +       msm_mdss_destroy(mdss);
>>
>>          return ret;
>>   }
>>


-- 
With best wishes
Dmitry
