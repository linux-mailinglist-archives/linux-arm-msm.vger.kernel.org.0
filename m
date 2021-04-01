Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31BDD3517C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 19:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234894AbhDARmo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 13:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234902AbhDARlN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 13:41:13 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA24BC08EA7F
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 06:31:26 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id o19so1005770qvu.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 06:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M7URrjH3tF91DISeDksOmCw5FleOK4Jt+3qfSQ0iFrk=;
        b=IetzjnnEEnrKVPOI7329Ipnch2bwPIbTtieTYatya9T4FGCuyLVG9yd96W2E/saio4
         oHxwhsOmKTOftU4HQBBKaohi0d/LTaK5Z+KHpsbbZi+2NoPBznsZdAMLpsDRZ20vWiWz
         qJiHz3Gh6vDCcQKxVVLcJdhlRKU/kYWbYs3SKUZkGptk4LEKHfNLKMiZ57ikRHEE1Ozn
         tBE6oSsyGPQBlBWb6YWqoPbx8NX34qh1+G6RXQxOaya8foV+OU0d7ZJ0lbftgNj/uW1F
         8BrhJ50NztOj0eTptkfAVtoUdJFeKHYUmruTTOcUZ2lVSLteKpSqtt/H7b9RZ/aa92K+
         3P2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M7URrjH3tF91DISeDksOmCw5FleOK4Jt+3qfSQ0iFrk=;
        b=U83SsxViP9IHKS5sOdYC7zVRX2ZrxbwiaSXw0BgU4eqYM8AjzPkjup6sYHYl46voJV
         58mhUvNl6flwQ63fBs27gSh3yh/PWfNgoDs19qhupgvYVU8A/wYUNb3zJhmR5N7yGt1s
         rWU7srRjXtQb0nYthEEJZ81so1S+cKhsGdpSpHF9BqyySC4RUF1L6vFy1Q2D4vks52MX
         2IoW0zp59N694xDNt9YGrZb58S6FKuqpiEegLbsYYru9yqCGIcMzW2GAhTHLlGlUjs8Y
         HpaOkfljC3vPyMiIzEuadWM5BVJVmiLCNpv6ZBSXWX93hZX9E3hVRV0VO496zbRF87no
         MvSw==
X-Gm-Message-State: AOAM532fyg2wdw2ymQUwM0z6m7+tMhnnoaF9ELOKGJoFPvVHXZoM/uID
        f6GzyMLXyP9y1wgJSnK/c6umKHiA6373dHXZwx2QnQ==
X-Google-Smtp-Source: ABdhPJyT6XQnSSLZ4RVAMOiJfUESRdDAvqkGit4/yqxtj7VeHvsLQtGr6UTr3EFqfbTrOykoWr2jbFcAAaIeUX+1A1w=
X-Received: by 2002:a0c:a425:: with SMTP id w34mr8013579qvw.2.1617283885963;
 Thu, 01 Apr 2021 06:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <1617190020-7931-1-git-send-email-kalyan_t@codeaurora.org>
 <84fdbdc7-7890-965a-bc6b-a19bd0ca4937@linaro.org> <CAF6AEGt_aAq4dF9QkS9uJ7vwvGeR42oToCQKpsWCrfuhy_j+pw@mail.gmail.com>
 <d104a40f-65c3-2700-e829-bfe8f5712ac5@linaro.org> <96eb927abe1a22711709900cec7f8d11@codeaurora.org>
In-Reply-To: <96eb927abe1a22711709900cec7f8d11@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 1 Apr 2021 16:31:14 +0300
Message-ID: <CAA8EJpouKeor8J2QG3nUtLqyNTwd1J44BXDjk4fHCYhykeJ7Hw@mail.gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/disp/dpu1: fix warn stack reported
 during dpu resume
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Daniel Hung-yu Wu <hywu@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@google.com>,
        Michelle Dean <midean@google.com>,
        Steev Klimaszewski <steev@kali.org>,
        freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 1 Apr 2021 at 16:19, <kalyan_t@codeaurora.org> wrote:
>
> On 2021-04-01 07:37, Dmitry Baryshkov wrote:
> > On 01/04/2021 01:47, Rob Clark wrote:
> >> On Wed, Mar 31, 2021 at 9:03 AM Dmitry Baryshkov
> >> <dmitry.baryshkov@linaro.org> wrote:
> >>>
> >>> On 31/03/2021 14:27, Kalyan Thota wrote:
> >>>> WARN_ON was introduced by the below commit to catch runtime resumes
> >>>> that are getting triggered before icc path was set.
> >>>>
> >>>> "drm/msm/disp/dpu1: icc path needs to be set before dpu runtime
> >>>> resume"
> >>>>
> >>>> For the targets where the bw scaling is not enabled, this WARN_ON is
> >>>> a false alarm. Fix the WARN condition appropriately.
> >>>
> >>> Should we change all DPU targets to use bw scaling to the mdp from
> >>> the
> >>> mdss nodes? The limitation to sc7180 looks artificial.
> >>
> >> yes, we should, this keeps biting us on 845
> >
> > Done,
> > https://lore.kernel.org/linux-arm-msm/20210401020533.3956787-2-dmitry.baryshkov@linaro.org/
>
> Hi Dmitry,
>
> https://lore.kernel.org/linux-arm-msm/20210401020533.3956787-2-dmitry.baryshkov@linaro.org/
>
> you need to add clk_inefficiency_factor, bw_inefficiency_factor in the
> catalogue for the new
> targets where bw scaling is being enabled. please reuse sc7180 values.

Done in patch 1 in that series.

>
> secondly, the AXI clock needs to be moved from mdss to mdp device like
> as in sc7180 dt if its not done already.

Is this enough:
sm8250 has <&gcc GCC_DISP_HF_AXI_CLK> both in mdss and mdp nodes
sdm845 has <&gcc GCC_DISP_AXI_CLK> in mdss node and <&dispcc
DISP_CC_MDSS_AXI_CLK> in the mdp node.


>
> lastly, if you are planning to remove the static votes from dpu_mdss, do
> you also want to move the
> interconnect paths from mdss device to mdp device in the dt ?

I have no strong opinion on this. So far I did not change dt to be
compatible with the current device trees.

>
>
> Thanks,
> Kalyan
>
> >
> >>
> >>>>
> >>>> Reported-by: Steev Klimaszewski <steev@kali.org>
> >>
> >> Please add Fixes: tag as well
> Adding Fixes tag above my sign-off, should i push another version or can
> it be picked from here ?
>
> Fixes: Id252b9c2887 ("drm/msm/disp/dpu1: icc path needs to be set before
> dpu runtime resume")
> >>
> >>>> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  8 +++++---
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  |  9 +++++++++
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 11 ++++++-----
> >>>>    3 files changed, 20 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>> index cab387f..0071a4d 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>> @@ -294,6 +294,9 @@ static int
> >>>> dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
> >>>>        struct icc_path *path1;
> >>>>        struct drm_device *dev = dpu_kms->dev;
> >>>>
> >>>> +     if (!dpu_supports_bw_scaling(dev))
> >>>> +             return 0;
> >>>> +
> >>>>        path0 = of_icc_get(dev->dev, "mdp0-mem");
> >>>>        path1 = of_icc_get(dev->dev, "mdp1-mem");
> >>>>
> >>>> @@ -934,8 +937,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
> >>>>                DPU_DEBUG("REG_DMA is not defined");
> >>>>        }
> >>>>
> >>>> -     if (of_device_is_compatible(dev->dev->of_node,
> >>>> "qcom,sc7180-mdss"))
> >>>> -             dpu_kms_parse_data_bus_icc_path(dpu_kms);
> >>>> +     dpu_kms_parse_data_bus_icc_path(dpu_kms);
> >>>>
> >>>>        pm_runtime_get_sync(&dpu_kms->pdev->dev);
> >>>>
> >>>> @@ -1198,7 +1200,7 @@ static int __maybe_unused
> >>>> dpu_runtime_resume(struct device *dev)
> >>>>
> >>>>        ddev = dpu_kms->dev;
> >>>>
> >>>> -     WARN_ON(!(dpu_kms->num_paths));
> >>>> +     WARN_ON((dpu_supports_bw_scaling(ddev) &&
> >>>> !dpu_kms->num_paths));
> >>>>        /* Min vote of BW is required before turning on AXI clk */
> >>>>        for (i = 0; i < dpu_kms->num_paths; i++)
> >>>>                icc_set_bw(dpu_kms->path[i], 0,
> >>>> Bps_to_icc(MIN_IB_BW));
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> >>>> index d6717d6..f7bcc0a 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> >>>> @@ -154,6 +154,15 @@ struct vsync_info {
> >>>>
> >>>>    #define to_dpu_global_state(x) container_of(x, struct
> >>>> dpu_global_state, base)
> >>>>
> >>>> +/**
> >>>> + * dpu_supports_bw_scaling: returns true for drivers that support
> >>>> bw scaling.
> >>>> + * @dev: Pointer to drm_device structure
> >>>> + */
> >>>> +static inline int dpu_supports_bw_scaling(struct drm_device *dev)
> >>>> +{
> >>>> +     return of_device_is_compatible(dev->dev->of_node,
> >>>> "qcom,sc7180-mdss");
> >>>> +}
> >>>> +
> >>>>    /* Global private object state for tracking resources that are
> >>>> shared across
> >>>>     * multiple kms objects (planes/crtcs/etc).
> >>>>     */
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> >>>> index cd40788..8cd712c 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> >>>> @@ -41,6 +41,9 @@ static int dpu_mdss_parse_data_bus_icc_path(struct
> >>>> drm_device *dev,
> >>>>        struct icc_path *path0 = of_icc_get(dev->dev, "mdp0-mem");
> >>>>        struct icc_path *path1 = of_icc_get(dev->dev, "mdp1-mem");
> >>>>
> >>>> +     if (dpu_supports_bw_scaling(dev))
> >>>> +             return 0;
> >>>> +
> >>>>        if (IS_ERR_OR_NULL(path0))
> >>>>                return PTR_ERR_OR_ZERO(path0);
> >>>>
> >>>> @@ -276,11 +279,9 @@ int dpu_mdss_init(struct drm_device *dev)
> >>>>
> >>>>        DRM_DEBUG("mapped mdss address space @%pK\n",
> >>>> dpu_mdss->mmio);
> >>>>
> >>>> -     if (!of_device_is_compatible(dev->dev->of_node,
> >>>> "qcom,sc7180-mdss")) {
> >>>> -             ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
> >>>> -             if (ret)
> >>>> -                     return ret;
> >>>> -     }
> >>>> +     ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
> >>>> +     if (ret)
> >>>> +             return ret;
> >>>>
> >>>>        mp = &dpu_mdss->mp;
> >>>>        ret = msm_dss_parse_clock(pdev, mp);
> >>>>
> >>>
> >>>
> >>> --
> >>> With best wishes
> >>> Dmitry



-- 
With best wishes
Dmitry
