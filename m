Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 202D731D338
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 01:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhBQAGr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 19:06:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbhBQAGp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 19:06:45 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE22C061574;
        Tue, 16 Feb 2021 16:06:05 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id w4so339100wmi.4;
        Tue, 16 Feb 2021 16:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XQqpqg6jSzHG83op6n6dlIe74aKdQKtD9br7jGebjUw=;
        b=UNKYNkYO0LfnOS/TsdDDmSB9Njy/d4xhqsOEFDi91kfNRXvsy9i6E8+4Xs92EgAxrN
         A1mTLusx49wda93oKOT4RMx3bTUrvcfaxgEIVSl4XHMpTCil4glWs2iSvfVr6iyHKXLY
         Cs3dzbnSF0QEr0+Yfb3rpnUKydrhYi0froutx0YA6PhN7nufa3O/d8GEkwyJi14OZyoY
         LPqCtTMhSX0iuggc8z3bs+/YFWNh0wleqLw4d/WPK9zt3+dzWJ/ZK15W/jP72Vlc58zy
         flMdpeoSr2Yy4bBq1kNlxT1f0Tp+kyHAq0D70zPfgamSvqXRq7+hwONx4HJFfZQJ/5tq
         jrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XQqpqg6jSzHG83op6n6dlIe74aKdQKtD9br7jGebjUw=;
        b=TSCiZKKWFFUa+qA69ErJOujMRW54ULQG10b0DGPtbud6NqWgFHM2cDI0XBvsDtqapf
         EiCGVk6DBWEevMOG6UKIIWq9XRP5r8oG57KNhwiJnuWUlJqKXo2poBcbucHfefKUX81G
         JpebInSIGqa4QRvJ4N0COmkTDm0/y+rz70+5XLpQxwCyJMmEmuqAix32sI7gmaI6ys+m
         Sn4nMxKgmzdLr4HHG6OMR284MB36BSyUG0ZaKkVd+84lwjYNcjljnLa5YJwPVpeY+oSW
         vcT2q+J9JYGx05nH0fDp5Rsh4ddk53a8Eo3N+b/f1cpOUHCaJGt+wrTz7mKAg1SGMv7g
         1ymA==
X-Gm-Message-State: AOAM530FSlnHqXTgEW6Jc6wZw3/Th6XKWaUgJ22RNMub0IjWXg6LU4PD
        MIlnUaoXBFml5F6hJO7y/gPdjiLto8rgTo/5Qo8=
X-Google-Smtp-Source: ABdhPJx/2suxGtJCRIigMjkQD6gjPWjzXEgtH7zFIY7Pf5+83ly/26LyReNhpwl+41tqGRJB5Zunt+GbkMx4vOPFL70=
X-Received: by 2002:a7b:c149:: with SMTP id z9mr4975291wmi.164.1613520364006;
 Tue, 16 Feb 2021 16:06:04 -0800 (PST)
MIME-Version: 1.0
References: <20210215161537.14696-1-jonathan@marek.ca> <20210215161537.14696-2-jonathan@marek.ca>
 <CAA8EJpo_Fs8Wj6zjH6BQqm=mG=qcGt3_JMj4nK-vsKCzr8tn1g@mail.gmail.com> <29231c68-0cc4-9d8a-8cb1-791511780bcd@marek.ca>
In-Reply-To: <29231c68-0cc4-9d8a-8cb1-791511780bcd@marek.ca>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 16 Feb 2021 16:08:56 -0800
Message-ID: <CAF6AEGtyiD6vtYrgkB4X+B00=ew09_7bZA3ketZsZ2+M7aFR+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm: add compatibles for sm8150/sm8250 display
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Drew Davenport <ddavenport@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        tongtiangen <tongtiangen@huawei.com>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 16, 2021 at 10:06 AM Jonathan Marek <jonathan@marek.ca> wrote:
>
> On 2/16/21 11:54 AM, Dmitry Baryshkov wrote:
> > On Mon, 15 Feb 2021 at 19:25, Jonathan Marek <jonathan@marek.ca> wrote:
> >>
> >> The driver already has support for sm8150/sm8250, but the compatibles were
> >> never added.
> >>
> >> Also inverse the non-mdp4 condition in add_display_components() to avoid
> >> having to check every new compatible in the condition.
> >>
> >> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> >> ---
> >>   Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c               | 2 ++
> >>   drivers/gpu/drm/msm/msm_drv.c                         | 6 +++---
> >>   3 files changed, 7 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> >> index 551ae26f60da..5763f43200a0 100644
> >> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> >> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> >> @@ -8,7 +8,7 @@ The DPU display controller is found in SDM845 SoC.
> >>
> >>   MDSS:
> >>   Required properties:
> >> -- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
> >> +- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss", "qcom,sm8150-mdss", "qcom,sm8250-mdss"
> >>   - reg: physical base address and length of contoller's registers.
> >>   - reg-names: register region names. The following region is required:
> >>     * "mdss"
> >> @@ -41,7 +41,7 @@ Optional properties:
> >>
> >>   MDP:
> >>   Required properties:
> >> -- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
> >> +- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu", "qcom,sm8150-dpu", "qcom,sm8250-dpu"
> >>   - reg: physical base address and length of controller's registers.
> >>   - reg-names : register region names. The following region is required:
> >>     * "mdp"
> >
> > These two chunks should probably go to the separate patch 'dt-bindings:...'.
> >
>
> In this case I think its better to have this change in the same patch,
> but maybe one of the Robs will disagree.

I *think* typically the reason to split dt bindings into their own
patch is that devicetree@ list isn't interested in reviewing driver
changes, just binding changes..

In this case since it is just adding a compatible I think it is ok..
(or at least ok by me, but maybe other-Rob disagrees ;-))

> > Also, could you please pinpoint the reason for adding more
> > compatibility strings, while they map to the same internal data?
> > I think we might want instead to use some generic name for the dpu
> > block, like "qcom,dpu" or "qcom,mdp-dpu" instead of specifying the
> > platform name.
> >
>
> sdm845 and sc7180 aren't using generic compatibles, this is just being
> consistent with that.

It is good to have a device specific compatible up front, even if we
fallback to the more generic one for matching.. just in case we find a
reason for needing it later

BR,
-R

> >
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> index 5a8e3e1fc48c..fff12a4c8bfc 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> @@ -1219,6 +1219,8 @@ static const struct dev_pm_ops dpu_pm_ops = {
> >>   static const struct of_device_id dpu_dt_match[] = {
> >>          { .compatible = "qcom,sdm845-dpu", },
> >>          { .compatible = "qcom,sc7180-dpu", },
> >> +       { .compatible = "qcom,sm8150-dpu", },
> >> +       { .compatible = "qcom,sm8250-dpu", },
> >>          {}
> >>   };
> >>   MODULE_DEVICE_TABLE(of, dpu_dt_match);
> >> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> >> index 94525ac76d4e..928f13d4bfbc 100644
> >> --- a/drivers/gpu/drm/msm/msm_drv.c
> >> +++ b/drivers/gpu/drm/msm/msm_drv.c
> >> @@ -1185,9 +1185,7 @@ static int add_display_components(struct device *dev,
> >>           * Populate the children devices, find the MDP5/DPU node, and then add
> >>           * the interfaces to our components list.
> >>           */
> >> -       if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
> >> -           of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
> >> -           of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
> >> +       if (!of_device_is_compatible(dev->of_node, "qcom,mdp4")) {
> >>                  ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> >>                  if (ret) {
> >>                          DRM_DEV_ERROR(dev, "failed to populate children devices\n");
> >> @@ -1320,6 +1318,8 @@ static const struct of_device_id dt_match[] = {
> >>          { .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> >>          { .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
> >>          { .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
> >> +       { .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
> >> +       { .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
> >>          {}
> >>   };
> >>   MODULE_DEVICE_TABLE(of, dt_match);
> >> --
> >> 2.26.1
> >>
> >
> >
