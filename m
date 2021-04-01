Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A4B3518C6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 19:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236853AbhDARrg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 13:47:36 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:34637 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236436AbhDARoz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 13:44:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617299095; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wCPgq/rWBZKxNRVmc4+Zhf0ncrnJ6kSP5QtLUZ6kcfs=;
 b=GXjGLi1rpoXJZsYuMFhEpF5mcZo4dM1g/fuOcL5A5KsPqzKuMGh7uGMpavqQ+cknr1u5kHvt
 HHUtYZ+3Vnkfa0SwCHMcIN1FevkDvpg3WCj2a9Hscxr/ytpBGhsznepNOZpMnRygn5Ziw3rN
 ksGbW+n0ckEw5SH9p9VJnYiMNlo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6065c8458807bcde1df4490c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Apr 2021 13:19:01
 GMT
Sender: kalyan_t=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 30522C43466; Thu,  1 Apr 2021 13:19:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kalyan_t)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 850A9C433CA;
        Thu,  1 Apr 2021 13:18:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 01 Apr 2021 18:48:59 +0530
From:   kalyan_t@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Daniel Hung-yu Wu <hywu@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Douglas Anderson <dianders@chromium.org>, mka@google.com,
        Michelle Dean <midean@google.com>,
        Steev Klimaszewski <steev@kali.org>,
        freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Subject: Re: [Freedreno] [v1] drm/msm/disp/dpu1: fix warn stack reported
 during dpu resume
In-Reply-To: <d104a40f-65c3-2700-e829-bfe8f5712ac5@linaro.org>
References: <1617190020-7931-1-git-send-email-kalyan_t@codeaurora.org>
 <84fdbdc7-7890-965a-bc6b-a19bd0ca4937@linaro.org>
 <CAF6AEGt_aAq4dF9QkS9uJ7vwvGeR42oToCQKpsWCrfuhy_j+pw@mail.gmail.com>
 <d104a40f-65c3-2700-e829-bfe8f5712ac5@linaro.org>
Message-ID: <96eb927abe1a22711709900cec7f8d11@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-01 07:37, Dmitry Baryshkov wrote:
> On 01/04/2021 01:47, Rob Clark wrote:
>> On Wed, Mar 31, 2021 at 9:03 AM Dmitry Baryshkov
>> <dmitry.baryshkov@linaro.org> wrote:
>>> 
>>> On 31/03/2021 14:27, Kalyan Thota wrote:
>>>> WARN_ON was introduced by the below commit to catch runtime resumes
>>>> that are getting triggered before icc path was set.
>>>> 
>>>> "drm/msm/disp/dpu1: icc path needs to be set before dpu runtime 
>>>> resume"
>>>> 
>>>> For the targets where the bw scaling is not enabled, this WARN_ON is
>>>> a false alarm. Fix the WARN condition appropriately.
>>> 
>>> Should we change all DPU targets to use bw scaling to the mdp from 
>>> the
>>> mdss nodes? The limitation to sc7180 looks artificial.
>> 
>> yes, we should, this keeps biting us on 845
> 
> Done,
> https://lore.kernel.org/linux-arm-msm/20210401020533.3956787-2-dmitry.baryshkov@linaro.org/

Hi Dmitry,

https://lore.kernel.org/linux-arm-msm/20210401020533.3956787-2-dmitry.baryshkov@linaro.org/

you need to add clk_inefficiency_factor, bw_inefficiency_factor in the 
catalogue for the new
targets where bw scaling is being enabled. please reuse sc7180 values.

secondly, the AXI clock needs to be moved from mdss to mdp device like 
as in sc7180 dt if its not done already.

lastly, if you are planning to remove the static votes from dpu_mdss, do 
you also want to move the
interconnect paths from mdss device to mdp device in the dt ?


Thanks,
Kalyan

> 
>> 
>>>> 
>>>> Reported-by: Steev Klimaszewski <steev@kali.org>
>> 
>> Please add Fixes: tag as well
Adding Fixes tag above my sign-off, should i push another version or can 
it be picked from here ?

Fixes: Id252b9c2887 ("drm/msm/disp/dpu1: icc path needs to be set before 
dpu runtime resume")
>> 
>>>> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  8 +++++---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  |  9 +++++++++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 11 ++++++-----
>>>>    3 files changed, 20 insertions(+), 8 deletions(-)
>>>> 
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> index cab387f..0071a4d 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> @@ -294,6 +294,9 @@ static int 
>>>> dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>>>>        struct icc_path *path1;
>>>>        struct drm_device *dev = dpu_kms->dev;
>>>> 
>>>> +     if (!dpu_supports_bw_scaling(dev))
>>>> +             return 0;
>>>> +
>>>>        path0 = of_icc_get(dev->dev, "mdp0-mem");
>>>>        path1 = of_icc_get(dev->dev, "mdp1-mem");
>>>> 
>>>> @@ -934,8 +937,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>>                DPU_DEBUG("REG_DMA is not defined");
>>>>        }
>>>> 
>>>> -     if (of_device_is_compatible(dev->dev->of_node, 
>>>> "qcom,sc7180-mdss"))
>>>> -             dpu_kms_parse_data_bus_icc_path(dpu_kms);
>>>> +     dpu_kms_parse_data_bus_icc_path(dpu_kms);
>>>> 
>>>>        pm_runtime_get_sync(&dpu_kms->pdev->dev);
>>>> 
>>>> @@ -1198,7 +1200,7 @@ static int __maybe_unused 
>>>> dpu_runtime_resume(struct device *dev)
>>>> 
>>>>        ddev = dpu_kms->dev;
>>>> 
>>>> -     WARN_ON(!(dpu_kms->num_paths));
>>>> +     WARN_ON((dpu_supports_bw_scaling(ddev) && 
>>>> !dpu_kms->num_paths));
>>>>        /* Min vote of BW is required before turning on AXI clk */
>>>>        for (i = 0; i < dpu_kms->num_paths; i++)
>>>>                icc_set_bw(dpu_kms->path[i], 0, 
>>>> Bps_to_icc(MIN_IB_BW));
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>> index d6717d6..f7bcc0a 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>> @@ -154,6 +154,15 @@ struct vsync_info {
>>>> 
>>>>    #define to_dpu_global_state(x) container_of(x, struct 
>>>> dpu_global_state, base)
>>>> 
>>>> +/**
>>>> + * dpu_supports_bw_scaling: returns true for drivers that support 
>>>> bw scaling.
>>>> + * @dev: Pointer to drm_device structure
>>>> + */
>>>> +static inline int dpu_supports_bw_scaling(struct drm_device *dev)
>>>> +{
>>>> +     return of_device_is_compatible(dev->dev->of_node, 
>>>> "qcom,sc7180-mdss");
>>>> +}
>>>> +
>>>>    /* Global private object state for tracking resources that are 
>>>> shared across
>>>>     * multiple kms objects (planes/crtcs/etc).
>>>>     */
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>>>> index cd40788..8cd712c 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>>>> @@ -41,6 +41,9 @@ static int dpu_mdss_parse_data_bus_icc_path(struct 
>>>> drm_device *dev,
>>>>        struct icc_path *path0 = of_icc_get(dev->dev, "mdp0-mem");
>>>>        struct icc_path *path1 = of_icc_get(dev->dev, "mdp1-mem");
>>>> 
>>>> +     if (dpu_supports_bw_scaling(dev))
>>>> +             return 0;
>>>> +
>>>>        if (IS_ERR_OR_NULL(path0))
>>>>                return PTR_ERR_OR_ZERO(path0);
>>>> 
>>>> @@ -276,11 +279,9 @@ int dpu_mdss_init(struct drm_device *dev)
>>>> 
>>>>        DRM_DEBUG("mapped mdss address space @%pK\n", 
>>>> dpu_mdss->mmio);
>>>> 
>>>> -     if (!of_device_is_compatible(dev->dev->of_node, 
>>>> "qcom,sc7180-mdss")) {
>>>> -             ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
>>>> -             if (ret)
>>>> -                     return ret;
>>>> -     }
>>>> +     ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
>>>> +     if (ret)
>>>> +             return ret;
>>>> 
>>>>        mp = &dpu_mdss->mp;
>>>>        ret = msm_dss_parse_clock(pdev, mp);
>>>> 
>>> 
>>> 
>>> --
>>> With best wishes
>>> Dmitry
