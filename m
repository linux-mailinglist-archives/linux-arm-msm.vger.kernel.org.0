Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA79B51869D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 16:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237030AbiECOaR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 10:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236275AbiECOaQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 10:30:16 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E587B31226
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 07:26:43 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8BDF12FC;
        Tue,  3 May 2022 07:26:43 -0700 (PDT)
Received: from [10.57.80.111] (unknown [10.57.80.111])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F06EB3F774;
        Tue,  3 May 2022 07:26:41 -0700 (PDT)
Message-ID: <84b3cf94-7948-546f-3a7c-3d7b4f621a3f@arm.com>
Date:   Tue, 3 May 2022 15:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] drm/msm/mdp5: move iommu_domain_alloc() call close to
 its usage
Content-Language: en-GB
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220501101022.3931295-1-dmitry.baryshkov@linaro.org>
 <20220501101022.3931295-3-dmitry.baryshkov@linaro.org>
 <20803530-822d-86fa-d418-b4b7756aac0c@arm.com>
 <CAA8EJpo2cdP-FmbhhWO-cUDQf_jKXLuoqP=UgLnzCymeHNV+qA@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CAA8EJpo2cdP-FmbhhWO-cUDQf_jKXLuoqP=UgLnzCymeHNV+qA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-03 14:30, Dmitry Baryshkov wrote:
> On Tue, 3 May 2022 at 13:57, Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 2022-05-01 11:10, Dmitry Baryshkov wrote:
>>> Move iommu_domain_alloc() in front of adress space/IOMMU initialization.
>>> This allows us to drop final bits of struct mdp5_cfg_platform which
>>> remained from the pre-DT days.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 16 ----------------
>>>    drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h |  6 ------
>>>    drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  6 ++++--
>>>    3 files changed, 4 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
>>> index 1bf9ff5dbabc..714effb967ff 100644
>>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
>>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
>>> @@ -1248,8 +1248,6 @@ static const struct mdp5_cfg_handler cfg_handlers_v3[] = {
>>>        { .revision = 3, .config = { .hw = &sdm630_config } },
>>>    };
>>>
>>> -static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev);
>>> -
>>>    const struct mdp5_cfg_hw *mdp5_cfg_get_hw_config(struct mdp5_cfg_handler *cfg_handler)
>>>    {
>>>        return cfg_handler->config.hw;
>>> @@ -1274,10 +1272,8 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
>>>                uint32_t major, uint32_t minor)
>>>    {
>>>        struct drm_device *dev = mdp5_kms->dev;
>>> -     struct platform_device *pdev = to_platform_device(dev->dev);
>>>        struct mdp5_cfg_handler *cfg_handler;
>>>        const struct mdp5_cfg_handler *cfg_handlers;
>>> -     struct mdp5_cfg_platform *pconfig;
>>>        int i, ret = 0, num_handlers;
>>>
>>>        cfg_handler = kzalloc(sizeof(*cfg_handler), GFP_KERNEL);
>>> @@ -1320,9 +1316,6 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
>>>        cfg_handler->revision = minor;
>>>        cfg_handler->config.hw = mdp5_cfg;
>>>
>>> -     pconfig = mdp5_get_config(pdev);
>>> -     memcpy(&cfg_handler->config.platform, pconfig, sizeof(*pconfig));
>>> -
>>>        DBG("MDP5: %s hw config selected", mdp5_cfg->name);
>>>
>>>        return cfg_handler;
>>> @@ -1333,12 +1326,3 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
>>>
>>>        return ERR_PTR(ret);
>>>    }
>>> -
>>> -static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev)
>>> -{
>>> -     static struct mdp5_cfg_platform config = {};
>>> -
>>> -     config.iommu = iommu_domain_alloc(&platform_bus_type);
>>> -
>>> -     return &config;
>>> -}
>>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
>>> index 6b03d7899309..c2502cc33864 100644
>>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
>>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
>>> @@ -104,14 +104,8 @@ struct mdp5_cfg_hw {
>>>        uint32_t max_clk;
>>>    };
>>>
>>> -/* platform config data (ie. from DT, or pdata) */
>>> -struct mdp5_cfg_platform {
>>> -     struct iommu_domain *iommu;
>>> -};
>>> -
>>>    struct mdp5_cfg {
>>>        const struct mdp5_cfg_hw *hw;
>>> -     struct mdp5_cfg_platform platform;
>>>    };
>>>
>>>    struct mdp5_kms;
>>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>> index 9b7bbc3adb97..1c67c2c828cd 100644
>>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>> @@ -558,6 +558,7 @@ static int mdp5_kms_init(struct drm_device *dev)
>>>        struct msm_gem_address_space *aspace;
>>>        int irq, i, ret;
>>>        struct device *iommu_dev;
>>> +     struct iommu_domain *iommu;
>>>
>>>        ret = mdp5_init(to_platform_device(dev->dev), dev);
>>>
>>> @@ -601,14 +602,15 @@ static int mdp5_kms_init(struct drm_device *dev)
>>>        }
>>>        mdelay(16);
>>>
>>> -     if (config->platform.iommu) {
>>> +     iommu = iommu_domain_alloc(&platform_bus_type);
>>
>> To preempt the next change down the line as well, could this be
>> rearranged to work as iommu_domain_alloc(iommu_dev->bus)?
> 
> I'd prefer to split this into the separate change, if you don't mind.

Oh, for sure, divide the patches however you see fit - I'm just hoping 
to save your time overall by getting all the IOMMU-related refactoring 
done now as a single series rather than risk me coming back and breaking 
things again in a few months :)

Cheers,
Robin.

> 
>>
>>> +     if (iommu) {
>>>                struct msm_mmu *mmu;
>>>
>>>                iommu_dev = &pdev->dev;
>>>                if (!dev_iommu_fwspec_get(iommu_dev))
>>
>> The fwspec helpers are more of an internal thing between the IOMMU
>> drivers and the respective firmware code - I'd rather that external API
>> users stuck consistently to using device_iommu_mapped() (it should give
>> the same result).
> 
> Let me check that it works correctly and spin a v2 afterwards.
> 
>>
>> Otherwise, thanks for sorting this out!
>>
>> Robin.
>>
>>>                        iommu_dev = iommu_dev->parent;
>>>
>>> -             mmu = msm_iommu_new(iommu_dev, config->platform.iommu);
>>> +             mmu = msm_iommu_new(iommu_dev, iommu);
>>>
>>>                aspace = msm_gem_address_space_create(mmu, "mdp5",
>>>                        0x1000, 0x100000000 - 0x1000);
> 
> 
> 
