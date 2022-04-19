Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39E47507BB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 23:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352132AbiDSVLW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 17:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345084AbiDSVLW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 17:11:22 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECAA432041
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 14:08:36 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id w1so8200573lfa.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WJAJjDTuqRMsp4ILN/gTytLXZvo3JzEkwnROtzWKBNM=;
        b=eQZMw9MRRcUBzvoQxFWDyu7psoVfC0ZgeiWMOgdL12nXufJzu5nKXZCojPu9wQ9WW/
         SyQaax9Yu2OByWGaNg1gicLm+qqd8EMaHNa+q0ZuNLfYKWf9PXnqWsTShHOmbvFGtwGs
         D6LriPe1ILJxVGXuXOEQleeJ42N6D1oIaDNnvFxhCukmUocwjTd0E3TabUxrEEsFtcXX
         CjiT8rmPWg72uglpJD6pORcwBPaATdzzMrHzavdHyFB8owhXIZvdMr/5INoHJrAnqKN/
         jvaeGHG0gNZ1hhWwA7upLNhWm8iT/F6YxPPlfert4Yh7b84iHvtJJosAJ+DFXKuvzKqG
         5xEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WJAJjDTuqRMsp4ILN/gTytLXZvo3JzEkwnROtzWKBNM=;
        b=nniMtAHpcsGCxgEDBHeA/UuQzD2wW3eqoTSibwqcUiOWRr9fEVe1kBkllZyrCPc8n8
         G3GtQ6nH6lT961i6DzPoKKfICvy06xt7cNFwwt5GsssuaN8MzAdXZH54rvRK2v4x1aBB
         iSssWain6MoHAv2mtA0QCHt/D2Zt4fFl97HQIBeif9gim7x5F561OOCV7m6dLnUZRCZ7
         B++wwlO8O7EAMOGEVXlNStIPB1V5ksnbb/wAC0EEQ31+Hk6LjGLQhnx+ytWkh9WHltjb
         PEFpRvSU5rTLWshPDCZ+8G4dAkxS97WueJNd2FnR2gbK82pyHrPaCKtxCSs4i7I/t010
         F80A==
X-Gm-Message-State: AOAM532WvPxsy+X7GzRBrlUBF3y3NEduz7hKeZPv7GOtbfUQWq6I5nGq
        cz46Ay1Yj6kefvye7cm9y7ad6Q==
X-Google-Smtp-Source: ABdhPJwci6T6mtReWYvhLT/4rTUboMPnkjsDY2j2Xk8fkU3s3mKdB1q05cWgDjMTEIQFLGa0Bhthkw==
X-Received: by 2002:a05:6512:1389:b0:471:a7fa:d5d3 with SMTP id p9-20020a056512138900b00471a7fad5d3mr3437411lfa.667.1650402515239;
        Tue, 19 Apr 2022 14:08:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o7-20020a05651c050700b0024c7ebff04bsm1527757ljp.79.2022.04.19.14.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 14:08:34 -0700 (PDT)
Message-ID: <cc1a68e3-894a-b2eb-f813-9c0c2993936c@linaro.org>
Date:   Wed, 20 Apr 2022 00:08:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/msm: Revert "drm/msm: Stop using iommu_present()"
Content-Language: en-GB
To:     Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20220419130422.1033699-1-dmitry.baryshkov@linaro.org>
 <6f3e772f-73aa-17b1-8cca-082039a905f1@arm.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6f3e772f-73aa-17b1-8cca-082039a905f1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/04/2022 00:04, Robin Murphy wrote:
> On 2022-04-19 14:04, Dmitry Baryshkov wrote:
>> This reverts commit e2a88eabb02410267519b838fb9b79f5206769be. The commit
>> in question makes msm_use_mmu() check whether the DRM 'component master'
>> device is translated by the IOMMU. At this moment it is the 'mdss'
>> device.
>> However on platforms using the MDP5 driver (e.g. MSM8916/APQ8016,
>> MSM8996/APQ8096) it's the mdp5 device, which has the iommus property
>> (and thus is "translated by the IOMMU"). This results in these devices
>> being broken with the following lines in the dmesg.
>>
>> [drm] Initialized msm 1.9.0 20130625 for 1a00000.mdss on minor 0
>> msm 1a00000.mdss: [drm:adreno_request_fw] loaded qcom/a300_pm4.fw from 
>> new location
>> msm 1a00000.mdss: [drm:adreno_request_fw] loaded qcom/a300_pfp.fw from 
>> new location
>> msm 1a00000.mdss: [drm:get_pages] *ERROR* could not get pages: -28
>> msm 1a00000.mdss: could not allocate stolen bo
>> msm 1a00000.mdss: [drm:get_pages] *ERROR* could not get pages: -28
>> msm 1a00000.mdss: [drm:msm_alloc_stolen_fb] *ERROR* failed to allocate 
>> buffer object
>> msm 1a00000.mdss: [drm:msm_fbdev_create] *ERROR* failed to allocate fb
>>
>> Getting the mdp5 device pointer from this function is not that easy at
>> this moment. Thus this patch is reverted till the MDSS rework [1] lands.
>> It will make the mdp5/dpu1 device component master and the check will be
>> legit.
>>
>> [1] https://patchwork.freedesktop.org/series/98525/
> 
> Oh, DRM...
> 
> If that series is going to land got 5.19, could you please implement the 
> correct equivalent of this patch within it?

Yes, that's the plan. I'm sending a reworked version of your patch 
shortly (but it still depends on [1]).

> 
> I'm fine with the revert for now if this patch doesn't work properly in 
> all cases, but I have very little sympathy left for DRM drivers riding 
> roughshod over all the standard driver model abstractions because 
> they're "special". iommu_present() *needs* to go away, so if it's left 
> to me to have a second go at fixing this driver next cycle, you're 
> liable to get some abomination based on of_find_compatible_node() or 
> similar, and I'll probably be demanding an ack to take it through the 
> IOMMU tree ;)

No need for such measures :-)

> 
> Thanks,
> Robin.
> 
>> Fixes: e2a88eabb024 ("drm/msm: Stop using iommu_present()")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/msm_drv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
>> b/drivers/gpu/drm/msm/msm_drv.c
>> index b6702b0fafcb..e2b5307b2360 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -263,7 +263,7 @@ bool msm_use_mmu(struct drm_device *dev)
>>       struct msm_drm_private *priv = dev->dev_private;
>>       /* a2xx comes with its own MMU */
>> -    return priv->is_a2xx || device_iommu_mapped(dev->dev);
>> +    return priv->is_a2xx || iommu_present(&platform_bus_type);
>>   }
>>   static int msm_init_vram(struct drm_device *dev)


-- 
With best wishes
Dmitry
