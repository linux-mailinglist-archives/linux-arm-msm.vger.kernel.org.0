Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97EC560FC50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 17:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234947AbiJ0Ptg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 11:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235626AbiJ0Pte (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 11:49:34 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6200613F68
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 08:49:33 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id o4so3264352ljp.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 08:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WprwqfLl3Iivd950JkjtFAnJzh16n5EfJhXUamtdvGk=;
        b=s9rsDgGIhSLnoJ+ZtdB9NW8C+Ai94QFSWQtM4D1fcH4h1XqhgPdUBpeaKmGievQtuo
         ZKzasUpkZA70rskgweAjWvKoycL4UHgL2I5LqvaQAT2xIIS4GqD7VOcf6KIFDP3TJt7g
         QHbyfIiXrlGEC89cEj6w07bxb+4y26oGOkMA2eVXLxVhOOgWUYUZiQWTfMOtVB0y/ZhY
         m5rbPTLT/GF6nG+Ft9TJyn09UI0yzXuRcULwLY0XxfZcw+z/o8nHgl8JCCI/sLaoI/cV
         e0YVPaTs05xy1hrFif8WQ/l6Yg8t7icmn4wx9tTgcWH0gXFWxjqABuTC0zPxzJu3eQQQ
         TAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WprwqfLl3Iivd950JkjtFAnJzh16n5EfJhXUamtdvGk=;
        b=QgsMW2XE/oeXwMpiXPa65il3ETLXkdZpaqCk3LsXnKTpozTgOV3yoRIJB/43Rh0mM5
         m7dH+Yu92k6dZlhQ6ndMoqY1iyCOm6P/KrySHU+ebX7fYLKFxoCsLHgR13YqTB9p4SvS
         XhPIafw/3CGNV9CZZO6y5bWpeUrxixM3oR8PECm/F2V8KJ2RKfXQcAnHAK5wFh2ImPnW
         OSZFTy+NX+1lqBORP+0DGd6EG75yyMjP61fSsYilRZUdsfMm4O71RUocR1Zms/ruPo3r
         8ReCH7yS73hoX7fOhxxKaX7pQA5QDnuA+L4t28PaKs5P1KTbY1EeAkLKpuSlUnYXxEud
         J5cQ==
X-Gm-Message-State: ACrzQf2yhQqpszTh+83BBeNOC4IFme9nQciB256VPEznvD0FuqLdCPgb
        8PwLgz2dWum4YdWNvxNgUcEcwA==
X-Google-Smtp-Source: AMsMyM7Nmo34eZsrHJBFBvHH8HAtYk4C2XnKIK8GG8rrpGIy/J1cK9fezxUj/aJbbrXslARNuAtz1A==
X-Received: by 2002:a2e:9650:0:b0:277:10f4:5d85 with SMTP id z16-20020a2e9650000000b0027710f45d85mr7295240ljh.253.1666885771679;
        Thu, 27 Oct 2022 08:49:31 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id k7-20020a05651c10a700b002770c030dc0sm265525ljn.109.2022.10.27.08.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 08:49:31 -0700 (PDT)
Message-ID: <7fbde090-7c1a-48e6-13e0-73b673db847c@linaro.org>
Date:   Thu, 27 Oct 2022 18:49:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 1/2] drm/msm: move domain allocation into
 msm_iommu_new()
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
References: <20221025200357.3637161-1-dmitry.baryshkov@linaro.org>
 <20221025200357.3637161-2-dmitry.baryshkov@linaro.org>
 <CAF6AEGvhJzpX1sJ1+SE_FA0eL=XEyDKnvyLz_Q15-eJvvL65PQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGvhJzpX1sJ1+SE_FA0eL=XEyDKnvyLz_Q15-eJvvL65PQ@mail.gmail.com>
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

On 27/10/2022 18:48, Rob Clark wrote:
> On Tue, Oct 25, 2022 at 1:04 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> After the msm_iommu instance is created, the IOMMU domain is completely
>> handled inside the msm_iommu code. Move the iommu_domain_alloc() call
>> into the msm_iommu_new() to simplify callers code.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c    | 12 +++++-------
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 25 +++++++++---------------
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 25 +++++++++---------------
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  2 --
>>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 19 +++++++++---------
>>   drivers/gpu/drm/msm/msm_drv.c            | 18 ++++++++---------
>>   drivers/gpu/drm/msm/msm_iommu.c          | 20 ++++++++++++++++---
>>   drivers/gpu/drm/msm/msm_mmu.h            |  3 ++-
>>   8 files changed, 60 insertions(+), 64 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index e033d6a67a20..6484b97c5344 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -1213,19 +1213,17 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
>>
>>   static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
>>   {
>> -       struct iommu_domain *domain;
>>          struct msm_mmu *mmu;
>>
>> -       domain = iommu_domain_alloc(&platform_bus_type);
>> -       if (!domain)
>> +       mmu = msm_iommu_new(gmu->dev, 0);
>> +       if (!mmu)
>>                  return -ENODEV;
>> +       if (IS_ERR(mmu))
>> +               return PTR_ERR(mmu);
>>
>> -       mmu = msm_iommu_new(gmu->dev, domain);
>>          gmu->aspace = msm_gem_address_space_create(mmu, "gmu", 0x0, 0x80000000);
>> -       if (IS_ERR(gmu->aspace)) {
>> -               iommu_domain_free(domain);
>> +       if (IS_ERR(gmu->aspace))
>>                  return PTR_ERR(gmu->aspace);
>> -       }
>>
>>          return 0;
>>   }
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index fdc578016e0b..7a1b4397b842 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1784,37 +1784,30 @@ static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>>   static struct msm_gem_address_space *
>>   a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>>   {
>> -       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> -       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> -       struct iommu_domain *iommu;
>>          struct msm_mmu *mmu;
>>          struct msm_gem_address_space *aspace;
>> +       struct iommu_domain_geometry *geometry;
>>          u64 start, size;
>>
>> -       iommu = iommu_domain_alloc(&platform_bus_type);
>> -       if (!iommu)
>> -               return NULL;
>> -
>>          /*
>>           * This allows GPU to set the bus attributes required to use system
>>           * cache on behalf of the iommu page table walker.
>>           */
>> -       if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
>> -               adreno_set_llc_attributes(iommu);
>> -
>> -       mmu = msm_iommu_new(&pdev->dev, iommu);
>> -       if (IS_ERR(mmu)) {
>> -               iommu_domain_free(iommu);
>> +       mmu = msm_iommu_new(&pdev->dev, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
> 
> I think/assume the quirk still needs to be conditional on
> a6xx_gpu->htw_llc_slice.. or at least I'm not sure what happens if we
> set it but do not have an LLCC (or allocated slice)


Argh, I forgot the check while doing the refactoring. Will fix in v4.


-- 
With best wishes
Dmitry

