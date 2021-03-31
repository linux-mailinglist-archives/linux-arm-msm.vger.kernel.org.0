Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFCA350A62
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 00:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbhCaWoR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 18:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232868AbhCaWnr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 18:43:47 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05521C061574;
        Wed, 31 Mar 2021 15:43:47 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id k8so21182330wrc.3;
        Wed, 31 Mar 2021 15:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mEZzzkJc52bG3RWe3yD2qAOPMXEbiKHKbOAwOoqIB3E=;
        b=XEs8+yVHLoLth3a/hAtGVstLGxK5LOhkW2Wf9cbmTJz8thn3pZtkd0xaCLKM3uOTX6
         SHxlWrsQHZDE/TC+E+DE9rPiKz9wgmqZOqEDoQMcBHsTretX+EfmPdgWSq+ge8kvt1P5
         knQmlZnwzpTT1LBXmadXMAOniy99GTETd0AfBM/XDhRHX/J9J+IlEMyaO69kMszVc9sb
         AqStLvblGV2/VaaZZzPmdBrdnQQdtCbA1zxeClgrQ6XfczxlKW+4YNIdLe9XDwDEbw06
         O4ZOg7mtyUTUyh8II5SmUuCteHNljooOCmrSVsD9T+QPonr3PPjF0GNN9Rz/BG1PeX2I
         gmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mEZzzkJc52bG3RWe3yD2qAOPMXEbiKHKbOAwOoqIB3E=;
        b=X+jlNzuAcVS60XC/5XFtVxNhIEBRWXc8COvvcWFBAJJs0q9nLHxsGFOGU6LtK9R3Ul
         G13KXiGGiHxme0G32gWxM9HBBG+n7GB58Jk8pbbeb33AZdGh5OTmoU894pv4F/GbYd4k
         n/RCqyPq/XujFrywBubXCTU51HICZKVNL30sbRSQQrN8qIwh2v3c+ZUQCAUdI8G80cTR
         FWSq8d+ehP4F32DBhNRXRGc7UrsIDGQAlbgLPpxJENfZP2SEThIPi+rqZ3X7+ESEZxtu
         WIMvB/TSdHiMAonBXzKIFZiWv8ur+HLk9m1xT3esnz1EPodxCzZnYqK+zKoINDB1LcB2
         uJXw==
X-Gm-Message-State: AOAM532LX4m9Hr6Nkc4pX7KMJe8iKlN3zlRFSapCmu/R7Rc8InYPfsBv
        dO4+kT7VT+fJssyi3RNpjRmGb5FT24He6NDN6eP4SY1b18I=
X-Google-Smtp-Source: ABdhPJz7dLmzkNovn1IdOJQCSsWjdEUdiomB8sNs5nZtsUcaJQA0plE5CN/qW4PzkOcapuznG3H6RXT+ZrbKGWtAXZQ=
X-Received: by 2002:a5d:640b:: with SMTP id z11mr5892370wru.327.1617230625768;
 Wed, 31 Mar 2021 15:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <1617190020-7931-1-git-send-email-kalyan_t@codeaurora.org> <84fdbdc7-7890-965a-bc6b-a19bd0ca4937@linaro.org>
In-Reply-To: <84fdbdc7-7890-965a-bc6b-a19bd0ca4937@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 31 Mar 2021 15:47:10 -0700
Message-ID: <CAF6AEGt_aAq4dF9QkS9uJ7vwvGeR42oToCQKpsWCrfuhy_j+pw@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: fix warn stack reported during dpu resume
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     y@qualcomm.com, dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Daniel Hung-yu Wu <hywu@google.com>, mka@google.com,
        Michelle Dean <midean@google.com>,
        Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 31, 2021 at 9:03 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 31/03/2021 14:27, Kalyan Thota wrote:
> > WARN_ON was introduced by the below commit to catch runtime resumes
> > that are getting triggered before icc path was set.
> >
> > "drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume"
> >
> > For the targets where the bw scaling is not enabled, this WARN_ON is
> > a false alarm. Fix the WARN condition appropriately.
>
> Should we change all DPU targets to use bw scaling to the mdp from the
> mdss nodes? The limitation to sc7180 looks artificial.

yes, we should, this keeps biting us on 845

> >
> > Reported-by: Steev Klimaszewski <steev@kali.org>

Please add Fixes: tag as well

> > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  8 +++++---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  |  9 +++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 11 ++++++-----
> >   3 files changed, 20 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index cab387f..0071a4d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -294,6 +294,9 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
> >       struct icc_path *path1;
> >       struct drm_device *dev = dpu_kms->dev;
> >
> > +     if (!dpu_supports_bw_scaling(dev))
> > +             return 0;
> > +
> >       path0 = of_icc_get(dev->dev, "mdp0-mem");
> >       path1 = of_icc_get(dev->dev, "mdp1-mem");
> >
> > @@ -934,8 +937,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
> >               DPU_DEBUG("REG_DMA is not defined");
> >       }
> >
> > -     if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
> > -             dpu_kms_parse_data_bus_icc_path(dpu_kms);
> > +     dpu_kms_parse_data_bus_icc_path(dpu_kms);
> >
> >       pm_runtime_get_sync(&dpu_kms->pdev->dev);
> >
> > @@ -1198,7 +1200,7 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
> >
> >       ddev = dpu_kms->dev;
> >
> > -     WARN_ON(!(dpu_kms->num_paths));
> > +     WARN_ON((dpu_supports_bw_scaling(ddev) && !dpu_kms->num_paths));
> >       /* Min vote of BW is required before turning on AXI clk */
> >       for (i = 0; i < dpu_kms->num_paths; i++)
> >               icc_set_bw(dpu_kms->path[i], 0, Bps_to_icc(MIN_IB_BW));
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > index d6717d6..f7bcc0a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > @@ -154,6 +154,15 @@ struct vsync_info {
> >
> >   #define to_dpu_global_state(x) container_of(x, struct dpu_global_state, base)
> >
> > +/**
> > + * dpu_supports_bw_scaling: returns true for drivers that support bw scaling.
> > + * @dev: Pointer to drm_device structure
> > + */
> > +static inline int dpu_supports_bw_scaling(struct drm_device *dev)
> > +{
> > +     return of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss");
> > +}
> > +
> >   /* Global private object state for tracking resources that are shared across
> >    * multiple kms objects (planes/crtcs/etc).
> >    */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> > index cd40788..8cd712c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> > @@ -41,6 +41,9 @@ static int dpu_mdss_parse_data_bus_icc_path(struct drm_device *dev,
> >       struct icc_path *path0 = of_icc_get(dev->dev, "mdp0-mem");
> >       struct icc_path *path1 = of_icc_get(dev->dev, "mdp1-mem");
> >
> > +     if (dpu_supports_bw_scaling(dev))
> > +             return 0;
> > +
> >       if (IS_ERR_OR_NULL(path0))
> >               return PTR_ERR_OR_ZERO(path0);
> >
> > @@ -276,11 +279,9 @@ int dpu_mdss_init(struct drm_device *dev)
> >
> >       DRM_DEBUG("mapped mdss address space @%pK\n", dpu_mdss->mmio);
> >
> > -     if (!of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss")) {
> > -             ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
> > -             if (ret)
> > -                     return ret;
> > -     }
> > +     ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
> > +     if (ret)
> > +             return ret;
> >
> >       mp = &dpu_mdss->mp;
> >       ret = msm_dss_parse_clock(pdev, mp);
> >
>
>
> --
> With best wishes
> Dmitry
