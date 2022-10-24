Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76E5660B4D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 20:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbiJXSFQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 14:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbiJXSEd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 14:04:33 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58D49C217
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 09:45:18 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id z24so3534545ljn.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 09:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9cUcRgvDuS2FdlkngSV1eV1M4pSbO1RgL3WVenrZEqM=;
        b=lTjcO7aWNNwFI5Q/DRWunBH2OudfKaTdQb1plUG+yx3Y/4IHh0tTXP0iHPjaYsWlA8
         o2XJngE/k1dCnpMLMTTGwJl7cny9/K893Q1AmPzfHwzmXrjJEiDq9M03SyEfawS4GPVj
         xtQNKG0dULX9/f6dLom7f4G90qMKGoIVNpu+D24EtmVRRFnWZ/gIrv8JnBbhFuUQ/e1a
         gdGokhk5CwirNwqeJXPzjtOXnqSohjpIWn/d2jahOY+HYNc3LQgHcTXozcr1+vre85Af
         PSUgfZc0Bpp7yG6YPJFZUn2Dk5tJ5ok5JLXvsrXmd7GefEj9h3ZRWQ/YRpeAGOGGa1Vb
         SZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9cUcRgvDuS2FdlkngSV1eV1M4pSbO1RgL3WVenrZEqM=;
        b=3p0wRZmcFlzpnrCtpyIbVgKs3R2jfeacwEflZfj0G3mq30YFvfWmBzeKfd7VmOA7aG
         ej8YXrJ24o/lpqJz6V0qK8EPaolpeNni8L+I4MJOsBXRjMl0jzjKRAkHafRHBbdZGPjD
         AdZa3q4nIMBQtSgTZb24mg8Jkw9Ue51I2zFnpeEAC011IzXNN2vDbHMsBSCDOa+HmnLA
         EMn7rjB/gCPW0pXTRQIn52nlbLpnhvPn3vkTT79NLwBD1dn7FWj64hkTe7rSOMNFhiCb
         jwypVpkQMWqxdndUxk4BdIAXimpFlvn2WZ3/gUupK4axTaCoZpAPObBVA6FGevZ6vgW3
         2ELg==
X-Gm-Message-State: ACrzQf2mgt26xMwLSkTcn7lAcrED+x2yy2LJb6xNLzs13h81wqZMwwOO
        udL1FhDgCMaQz+VgBwwM1HjpV6r6N73Su1uh
X-Google-Smtp-Source: AMsMyM6DOHX/aHxyM9UrOCKOSnbpOyhgqoUF8asmnF2FkGDn6FpJmXDsuHVFnaaCG64YZKQ3aPR/AA==
X-Received: by 2002:a05:651c:1503:b0:277:9d8:d5a8 with SMTP id e3-20020a05651c150300b0027709d8d5a8mr2459679ljf.389.1666629822249;
        Mon, 24 Oct 2022 09:43:42 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f19-20020a05651232d300b00498f77cfa63sm4589440lfg.280.2022.10.24.09.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 09:43:41 -0700 (PDT)
Message-ID: <4797d41a-146b-4862-1b93-4fa8736221d4@linaro.org>
Date:   Mon, 24 Oct 2022 19:43:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 1/2] drm/msm: remove duplicated code from
 a6xx_create_address_space
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20221024151444.3208225-1-dmitry.baryshkov@linaro.org>
 <CAF6AEGviTTOKcTH5YAQJAgzY9kbDD8fX+FrY5R8igamN22T-bg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGviTTOKcTH5YAQJAgzY9kbDD8fX+FrY5R8igamN22T-bg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2022 19:12, Rob Clark wrote:
> On Mon, Oct 24, 2022 at 8:14 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> The function a6xx_create_address_space() is mostly a copy of
>> adreno_iommu_create_address_space() with added quirk setting. Reuse the
>> original function to do the work, while introducing the wrapper to set
>> the quirk.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 31 ++++---------------------
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++--
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +-
>>   drivers/gpu/drm/msm/msm_iommu.c         |  7 ++++++
>>   drivers/gpu/drm/msm/msm_mmu.h           |  1 +
>>   5 files changed, 15 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index fdc578016e0b..7640f5b960d6 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1786,41 +1786,18 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>>   {
>>          struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>          struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> -       struct iommu_domain *iommu;
>> -       struct msm_mmu *mmu;
>>          struct msm_gem_address_space *aspace;
>> -       u64 start, size;
>>
>> -       iommu = iommu_domain_alloc(&platform_bus_type);
>> -       if (!iommu)
>> -               return NULL;
>> +       aspace = adreno_iommu_create_address_space(gpu, pdev);
>> +       if (IS_ERR_OR_NULL(aspace))
>> +               return ERR_CAST(aspace);
>>
>>          /*
>>           * This allows GPU to set the bus attributes required to use system
>>           * cache on behalf of the iommu page table walker.
>>           */
>>          if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
>> -               adreno_set_llc_attributes(iommu);
>> -
>> -       mmu = msm_iommu_new(&pdev->dev, iommu);
>> -       if (IS_ERR(mmu)) {
>> -               iommu_domain_free(iommu);
>> -               return ERR_CAST(mmu);
>> -       }
>> -
>> -       /*
>> -        * Use the aperture start or SZ_16M, whichever is greater. This will
>> -        * ensure that we align with the allocated pagetable range while still
>> -        * allowing room in the lower 32 bits for GMEM and whatnot
>> -        */
>> -       start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
>> -       size = iommu->geometry.aperture_end - start + 1;
>> -
>> -       aspace = msm_gem_address_space_create(mmu, "gpu",
>> -               start & GENMASK_ULL(48, 0), size);
>> -
>> -       if (IS_ERR(aspace) && !IS_ERR(mmu))
>> -               mmu->funcs->destroy(mmu);
>> +               adreno_set_llc_attributes(aspace->mmu);
>>
>>          return aspace;
>>   }
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index 382fb7f9e497..ed26b8dfc789 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -191,9 +191,9 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>>          return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>>   }
>>
>> -void adreno_set_llc_attributes(struct iommu_domain *iommu)
>> +void adreno_set_llc_attributes(struct msm_mmu *mmu)
>>   {
>> -       iommu_set_pgtable_quirks(iommu, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
>> +       msm_iommu_set_pgtable_quirks(mmu, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
>>   }
> 
> This won't actually work.. looking at the arm-smmu code, the quirks
> need to be set before attaching the device.  But there is an even
> simpler way, just pass the quirks bitmask to msm_iommu_new() and get
> rid of adreno_set_llc_attributes(), and msm_iommu_set_pgtable_quirks()

Ack, thanks for the idea!

> 
> BR,
> -R
> 
>>
>>   struct msm_gem_address_space *
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index e7adc5c632d0..723729e463e8 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -338,7 +338,7 @@ struct msm_gem_address_space *
>>   adreno_iommu_create_address_space(struct msm_gpu *gpu,
>>                  struct platform_device *pdev);
>>
>> -void adreno_set_llc_attributes(struct iommu_domain *iommu);
>> +void adreno_set_llc_attributes(struct msm_mmu *mmu);
>>
>>   int adreno_read_speedbin(struct device *dev, u32 *speedbin);
>>
>> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
>> index 5577cea7c009..768ab71cc43e 100644
>> --- a/drivers/gpu/drm/msm/msm_iommu.c
>> +++ b/drivers/gpu/drm/msm/msm_iommu.c
>> @@ -186,6 +186,13 @@ int msm_iommu_pagetable_params(struct msm_mmu *mmu,
>>          return 0;
>>   }
>>
>> +int msm_iommu_set_pgtable_quirks(struct msm_mmu *mmu, unsigned long quirk)
>> +{
>> +       struct msm_iommu *iommu = to_msm_iommu(mmu);
>> +
>> +       return iommu_set_pgtable_quirks(iommu->domain, quirk);
>> +}
>> +
>>   static const struct msm_mmu_funcs pagetable_funcs = {
>>                  .map = msm_iommu_pagetable_map,
>>                  .unmap = msm_iommu_pagetable_unmap,
>> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
>> index de158e1bf765..d968d9f8e19c 100644
>> --- a/drivers/gpu/drm/msm/msm_mmu.h
>> +++ b/drivers/gpu/drm/msm/msm_mmu.h
>> @@ -58,5 +58,6 @@ void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
>>
>>   int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
>>                  int *asid);
>> +int msm_iommu_set_pgtable_quirks(struct msm_mmu *mmu, unsigned long quirk);
>>
>>   #endif /* __MSM_MMU_H__ */
>> --
>> 2.35.1
>>

-- 
With best wishes
Dmitry

