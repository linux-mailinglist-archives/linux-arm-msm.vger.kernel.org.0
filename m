Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBE54B5D67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 23:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbiBNWFK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 17:05:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbiBNWFK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 17:05:10 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B391B4473
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 14:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644876301; x=1676412301;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iXGIQRD4wQ669mkVtxQLxaSeIJcDdK/Y6BmQZIuo1yo=;
  b=KlBzl0T4+Dffh+1LDKKy2J/YmYIKi7gkj+KERODv5IN7cqw0fDFP9wZW
   LWvzjuQR/pQgH1n5NGb+CGxK2rJgmPMftJRSraMRvSe3WjApUM5Pe9PfP
   XMmoqtAky2GcFtObkmADyMxuSM7VOzR4YZVqkOnz7pGDcxgb7/jMsBzBt
   4=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Feb 2022 14:05:00 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 14:04:59 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 14 Feb 2022 14:04:59 -0800
Received: from [10.111.168.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 14 Feb
 2022 14:04:57 -0800
Message-ID: <afd7e0dd-7da8-0e72-2f53-5e80626765a8@quicinc.com>
Date:   Mon, 14 Feb 2022 14:04:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [Freedreno] [PATCH v5 6/6] drm/msm/dpu: move VBIF blocks handling
 to dpu_rm
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     David Airlie <airlied@linux.ie>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        <freedreno@lists.freedesktop.org>
References: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
 <20220121210618.3482550-7-dmitry.baryshkov@linaro.org>
 <e38947b6-461b-ac26-a3f2-d72b439330d4@quicinc.com>
 <a2c001ee-c257-5d25-e0a9-dda7d1dcdead@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <a2c001ee-c257-5d25-e0a9-dda7d1dcdead@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/14/2022 12:56 PM, Dmitry Baryshkov wrote:
> On 14/02/2022 22:53, Abhinav Kumar wrote:
>>
>>
>> On 1/21/2022 1:06 PM, Dmitry Baryshkov wrote:
>>> Move handling of VBIF blocks into dpu_rm. This serves the purpose of
>>> unification of handling of all hardware blocks inside the DPU driver.
>>> This removes hand-coded loops in dpu_vbif (which look for necessary VBIF
>>> instance by looping through the dpu_kms->hw_vbif and comparing
>>> vbif_idx).
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> I have a slightly different idea about this. Let me know what you think.
>>
>> VBIF is a bus interface for the dpu to fetch from. I am not sure if 
>> pulling it in the RM is right because its not a dedicated HW block like
>> the others in the RM.
> 
> It's not a hardware block, but a it's still a hardware resource 
> (hardware instance). It is described in the hw catalog. Thus I suggested 
> moving it to dpu_rm.
> 
> As you have seen, from my previous iterations of this patchset, I tried 
>   to move things out of dpu_rm. After some hacking, I saw that having 
> alloc/free loops in several places seems like a worse idea. So I moved 
> dpu_hw_intf back to dpu_rm and then moved dpu_hw_vbif to dpu_rm too.
>
Actually for some reason, I only see two revs here:

https://patchwork.freedesktop.org/series/99175/#rev1

Hence, I didnt check the previous patchsets from patchwork to see the 
evolution.

>>
>> But, I agree with your problem statement of hand-coded loops.
>>
>> So instead, why dont you just have a helper in the dpu_vbif.c to get
>> you the vbif hw for the passed index like, maybe something like this?
>>
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
>> @@ -11,6 +11,19 @@
>>   #include "dpu_hw_vbif.h"
>>   #include "dpu_trace.h"
>>
>> +static dpu_hw_vbif *dpu_vbif_get_hw(struct dpu_kms *dpu_kms, u32 
>> vbif_idx)
>> +{
>> +       int i;
>> +
>> +       for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
>> +               if (dpu_kms->hw_vbif[i] &&
>> +                               dpu_kms->hw_vbif[i]->idx == vbif_idx)
>> +                       vbif = dpu_kms->hw_vbif[i];
>> +       }
>> +
>> +       return vbif;
>> +}
>> +
> 
> You see, this code still bears an idea of looping through hw_vbif 
> entries looking for the correct one (we can directly access hw_vbif[idx 
> - VBIF_0] instead).
> 
> And also the alloc/destroy loops are very similar to rm ones, but are 
> working against the array in dpu_kms.
> 
> One of the previous iterations had neearly the same idea as yours patch 
> proposes, but I later abandoned this idea.
> 
> I'm trying to place common code nearby, so that there is a less chance 
> of an error.

This loop is being used to find the vbif matching the index only in two 
places today dpu_vbif_set_ot_limit and dpu_vbif_set_qos_remap.

Today and from whatever I see even in downstream (which has support for 
more newer chipsets), there is only one VBIF
instance in the catalog and always with the index 0.

So to be honest, even that loop is an overkill today because the index 
seems to be always 0 and there is only one instance so the loop seems to 
break out at the first occurrence.

Thats why I was wondering whether moving VBIF to RM is an overkill for 
this and just the simple cleanup i was suggesting was enough as that 
loop itself is an overkill today for one instance of vbif.

> 
>>   /**
>>    * _dpu_vbif_wait_for_xin_halt - wait for the xin to halt
>>    * @vbif:      Pointer to hardware vbif driver
>> @@ -156,11 +169,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
>>
>>          mdp = dpu_kms->hw_mdp;
>>
>> -       for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
>> -               if (dpu_kms->hw_vbif[i] &&
>> -                               dpu_kms->hw_vbif[i]->idx == 
>> params->vbif_idx)
>> -                       vbif = dpu_kms->hw_vbif[i];
>> -       }
>> +       vbif = dpu_vbif_get_hw(dpu_kms, params->vbif_idx);
>>
>>          if (!vbif || !mdp) {
>>                  DRM_DEBUG_ATOMIC("invalid arguments vbif %d mdp %d\n",
>> @@ -216,13 +225,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
>>          }
>>          mdp = dpu_kms->hw_mdp;
>>
>> -       for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
>> -               if (dpu_kms->hw_vbif[i] &&
>> -                               dpu_kms->hw_vbif[i]->idx == 
>> params->vbif_idx) {
>> -                       vbif = dpu_kms->hw_vbif[i];
>> -                       break;
>> -               }
>> -       }
>> +       vbif = dpu_vbif_get_hw(params->vbif_idx);
>>
>>
>>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h |  1 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 28 +--------------------
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 -
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 19 ++++++++++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      | 12 +++++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c    | 26 ++++++-------------
>>>   6 files changed, 40 insertions(+), 47 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
>>> index 6417aa28d32c..895e86dabcb6 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
>>> @@ -8,6 +8,7 @@
>>>   #include "dpu_hw_catalog.h"
>>>   #include "dpu_hw_mdss.h"
>>>   #include "dpu_hw_util.h"
>>> +#include "dpu_hw_blk.h"
>>>   struct dpu_hw_vbif;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 47fe11a84a77..4a1983d8561b 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -782,8 +782,6 @@ static long dpu_kms_round_pixclk(struct msm_kms 
>>> *kms, unsigned long rate,
>>>   static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
>>>   {
>>> -    int i;
>>> -
>>>       if (dpu_kms->hw_intr)
>>>           dpu_hw_intr_destroy(dpu_kms->hw_intr);
>>>       dpu_kms->hw_intr = NULL;
>>> @@ -791,15 +789,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms 
>>> *dpu_kms)
>>>       /* safe to call these more than once during shutdown */
>>>       _dpu_kms_mmu_destroy(dpu_kms);
>>> -    if (dpu_kms->catalog) {
>>> -        for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
>>> -            u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
>>> -
>>> -            if ((vbif_idx < VBIF_MAX) && dpu_kms->hw_vbif[vbif_idx])
>>> -                dpu_hw_vbif_destroy(dpu_kms->hw_vbif[vbif_idx]);
>>> -        }
>>> -    }
>>> -
>>>       if (dpu_kms->rm_init)
>>>           dpu_rm_destroy(&dpu_kms->rm);
>>>       dpu_kms->rm_init = false;
>>> @@ -1027,7 +1016,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>   {
>>>       struct dpu_kms *dpu_kms;
>>>       struct drm_device *dev;
>>> -    int i, rc = -EINVAL;
>>> +    int rc = -EINVAL;
>>>       if (!kms) {
>>>           DPU_ERROR("invalid kms\n");
>>> @@ -1116,21 +1105,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>           goto power_error;
>>>       }
>>> -    for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
>>> -        u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
>>> -
>>> -        dpu_kms->hw_vbif[i] = dpu_hw_vbif_init(vbif_idx,
>>> -                dpu_kms->vbif[vbif_idx], dpu_kms->catalog);
>>> -        if (IS_ERR_OR_NULL(dpu_kms->hw_vbif[vbif_idx])) {
>>> -            rc = PTR_ERR(dpu_kms->hw_vbif[vbif_idx]);
>>> -            if (!dpu_kms->hw_vbif[vbif_idx])
>>> -                rc = -EINVAL;
>>> -            DPU_ERROR("failed to init vbif %d: %d\n", vbif_idx, rc);
>>> -            dpu_kms->hw_vbif[vbif_idx] = NULL;
>>> -            goto power_error;
>>> -        }
>>> -    }
>>> -
>>>       rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog,
>>>               _dpu_kms_get_clk(dpu_kms, "core"));
>>>       if (rc) {
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>> index 3f518c809e33..b96c901483ae 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>> @@ -105,7 +105,6 @@ struct dpu_kms {
>>>       struct dpu_rm rm;
>>>       bool rm_init;
>>> -    struct dpu_hw_vbif *hw_vbif[VBIF_MAX];
>>>       struct dpu_hw_mdp *hw_mdp;
>>>       bool has_danger_ctrl;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> index 7497538adae1..6d49666c4e77 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> @@ -76,6 +76,8 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>>>       }
>>>       for (i = 0; i < ARRAY_SIZE(rm->hw_intf); i++)
>>>           dpu_hw_intf_destroy(rm->hw_intf[i]);
>>> +    for (i = 0; i < ARRAY_SIZE(rm->hw_vbif); i++)
>>> +        dpu_hw_vbif_destroy(rm->hw_vbif[i]);
>>>       return 0;
>>>   }
>>> @@ -210,6 +212,23 @@ int dpu_rm_init(struct dpu_rm *rm,
>>>           rm->dspp_blks[dspp->id - DSPP_0] = &hw->base;
>>>       }
>>> +    for (i = 0; i < cat->vbif_count; i++) {
>>> +        struct dpu_hw_vbif *hw;
>>> +        const struct dpu_vbif_cfg *vbif = &cat->vbif[i];
>>> +
>>> +        if (vbif->id < VBIF_0 || vbif->id >= VBIF_MAX) {
>>> +            DPU_ERROR("skip vbif %d with invalid id\n", vbif->id);
>>> +            continue;
>>> +        }
>>> +        hw = dpu_hw_vbif_init(vbif->id, mmio, cat);
>>> +        if (IS_ERR(hw)) {
>>> +            rc = PTR_ERR(hw);
>>> +            DPU_ERROR("failed vbif object creation: err %d\n", rc);
>>> +            goto fail;
>>> +        }
>>> +        rm->hw_vbif[vbif->id - VBIF_0] = hw;
>>> +    }
>>> +
>>>       return 0;
>>>   fail:
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> index 9b13200a050a..a15977bdceeb 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> @@ -20,6 +20,7 @@ struct dpu_global_state;
>>>    * @ctl_blks: array of ctl hardware resources
>>>    * @hw_intf: array of intf hardware resources
>>>    * @dspp_blks: array of dspp hardware resources
>>> + * @hw_vbif: array of vbif hardware resources
>>>    */
>>>   struct dpu_rm {
>>>       struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
>>> @@ -28,6 +29,7 @@ struct dpu_rm {
>>>       struct dpu_hw_intf *hw_intf[INTF_MAX - INTF_0];
>>>       struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
>>>       struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
>>> +    struct dpu_hw_vbif *hw_vbif[VBIF_MAX - VBIF_0];
>>>   };
>>>   /**
>>> @@ -95,5 +97,15 @@ static inline struct dpu_hw_intf 
>>> *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_in
>>>       return rm->hw_intf[intf_idx - INTF_0];
>>>   }
>>> +/**
>>> + * dpu_rm_get_vbif - Return a struct dpu_hw_vbif instance given it's 
>>> index.
>>> + * @rm: DPU Resource Manager handle
>>> + * @vbif_idx: VBIF's index
>>> + */
>>> +static inline struct dpu_hw_vbif *dpu_rm_get_vbif(struct dpu_rm *rm, 
>>> enum dpu_vbif vbif_idx)
>>> +{
>>> +    return rm->hw_vbif[vbif_idx - VBIF_0];
>>> +}
>>> +
>>>   #endif /* __DPU_RM_H__ */
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
>>> index 21d20373eb8b..00ac2aa81651 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
>>> @@ -152,15 +152,10 @@ void dpu_vbif_set_ot_limit(struct dpu_kms 
>>> *dpu_kms,
>>>       struct dpu_hw_mdp *mdp;
>>>       bool forced_on = false;
>>>       u32 ot_lim;
>>> -    int ret, i;
>>> +    int ret;
>>>       mdp = dpu_kms->hw_mdp;
>>> -
>>> -    for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
>>> -        if (dpu_kms->hw_vbif[i] &&
>>> -                dpu_kms->hw_vbif[i]->idx == params->vbif_idx)
>>> -            vbif = dpu_kms->hw_vbif[i];
>>> -    }
>>> +    vbif = dpu_rm_get_vbif(&dpu_kms->rm, params->vbif_idx);
>>>       if (!vbif || !mdp) {
>>>           DRM_DEBUG_ATOMIC("invalid arguments vbif %d mdp %d\n",
>>> @@ -216,14 +211,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms 
>>> *dpu_kms,
>>>       }
>>>       mdp = dpu_kms->hw_mdp;
>>> -    for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
>>> -        if (dpu_kms->hw_vbif[i] &&
>>> -                dpu_kms->hw_vbif[i]->idx == params->vbif_idx) {
>>> -            vbif = dpu_kms->hw_vbif[i];
>>> -            break;
>>> -        }
>>> -    }
>>> -
>>> +    vbif = dpu_rm_get_vbif(&dpu_kms->rm, params->vbif_idx);
>>>       if (!vbif || !vbif->cap) {
>>>           DPU_ERROR("invalid vbif %d\n", params->vbif_idx);
>>>           return;
>>> @@ -261,8 +249,8 @@ void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
>>>       struct dpu_hw_vbif *vbif;
>>>       u32 i, pnd, src;
>>> -    for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
>>> -        vbif = dpu_kms->hw_vbif[i];
>>> +    for (i = VBIF_0; i < VBIF_MAX; i++) {
>>> +        vbif = dpu_rm_get_vbif(&dpu_kms->rm, i);
>>>           if (vbif && vbif->ops.clear_errors) {
>>>               vbif->ops.clear_errors(vbif, &pnd, &src);
>>>               if (pnd || src) {
>>> @@ -278,8 +266,8 @@ void dpu_vbif_init_memtypes(struct dpu_kms *dpu_kms)
>>>       struct dpu_hw_vbif *vbif;
>>>       int i, j;
>>> -    for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
>>> -        vbif = dpu_kms->hw_vbif[i];
>>> +    for (i = VBIF_0; i < VBIF_MAX; i++) {
>>> +        vbif = dpu_rm_get_vbif(&dpu_kms->rm, i);
>>>           if (vbif && vbif->cap && vbif->ops.set_mem_type) {
>>>               for (j = 0; j < vbif->cap->memtype_count; j++)
>>>                   vbif->ops.set_mem_type(
> 
> 
