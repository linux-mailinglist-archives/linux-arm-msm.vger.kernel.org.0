Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE7C421B88
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 03:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbhJEBP2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 21:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbhJEBP1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 21:15:27 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B945C061749
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 18:13:38 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id z11-20020a4ad1ab000000b0029f085f5f64so5939992oor.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 18:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FhjJcl5G08f1Lwd0tiKxFVrUfQIhp84hVF46bA3Hyt0=;
        b=eXtRfDd/uRe04F7H2s/WLRp6HjPItczeLz25u0o5/iLUwkOKlcSQ2KOsXyPjImrvap
         fOteC7wUutj7TnTZcmRl/4uyHPmtsw+FNqk5LC0xqpcq2WOkjUzDxFw/seQTAgaZEq0u
         Z064tyCeIctDwkVWTg4gyr3Id/tmo7LBLJw9LcmkFtOOyLMc9hmUl+ZIjf10BuD9DRJG
         r0dHyrI1e6Ary/AtEVDCmTJYmb450d/2e0+HkevTEz12RXRLHDccCQoVwDzyUdaL25J1
         rTbSP1IxwteK0V92PC9Cu6V6ZM00vQ5ItzJpWj7PP+AMyxEt4XrcyA6XOn8BL85vUY61
         KQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FhjJcl5G08f1Lwd0tiKxFVrUfQIhp84hVF46bA3Hyt0=;
        b=bILfV+pmLI6WUVrrgUdpi/8dfDzSZT1LjyqMswAfYs39VrPogw2NnBDVhSby81cKSe
         GIOmeeGaCeyvsLTwOij7VyaJR5exEt2wgW3GVVQzqdzho9+cEa+i24bKwhKn5JAfZ3EU
         9rvzjUL3bE9RKpBFxDadJMnI10C7AjAKmPITAN5ype/FzpeBrNH6P/GkVKGqT2HkLhzb
         BVKWWBz0+/lyXDWDLhYU450/FQwTX+XtQPfswDD7bgParCHoNzxqGkYRg36dTFYZVLeQ
         BA+18NQw5uE6LsZIyjbeYO8IorcOtM6ZHIWiRth6sg+L8nuInIWmG275m76LFLE0pOer
         vebQ==
X-Gm-Message-State: AOAM5333pT+CmeuIubN2x4HTORv46jz5iUcROeCAgPiLMcRF1871cVH3
        KxsHxHxEtUSEDWSUSTfnmpGVMw==
X-Google-Smtp-Source: ABdhPJwscAu3XElmUS4NzdpIXUSeVwlzXO/gNzH94JgHtRT4nX8WBTBx10/B6U/hLsgRKreF0K15LA==
X-Received: by 2002:a4a:eb12:: with SMTP id f18mr11394452ooj.98.1633396417336;
        Mon, 04 Oct 2021 18:13:37 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id l1sm2246068oop.28.2021.10.04.18.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 18:13:36 -0700 (PDT)
Date:   Mon, 4 Oct 2021 18:15:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] drm/msm/dp: Support up to 3 DP controllers
Message-ID: <YVunKNXj+fxH/e1L@ripper>
References: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
 <20211001180058.1021913-4-bjorn.andersson@linaro.org>
 <CAE-0n50=EWg1GKuTnRi=zA0ufO1Xg4mucYaqNUZ+wgYNDRcWLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50=EWg1GKuTnRi=zA0ufO1Xg4mucYaqNUZ+wgYNDRcWLA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 04 Oct 17:58 PDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-10-01 11:00:56)
> > Based on the removal of the g_dp_display and the movement of the
> > priv->dp lookup into the DP code it's now possible to have multiple
> > DP instances.
> >
> > In line with the other controllers in the MSM driver, introduce a
> > per-compatible list of base addresses which is used to resolve the
> > "instance id" for the given DP controller. This instance id is used as
> > index in the priv->dp[] array.
> >
> > Then extend the initialization code to initialize struct drm_encoder for
> > each of the registered priv->dp[] and update the logic for associating
> > each struct msm_dp with the struct dpu_encoder_virt.
> >
> > Lastly, bump the number of struct msm_dp instances carries by priv->dp
> > to 3, the currently known maximum number of controllers found in a
> > Qualcomm SoC.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> Some nits below.
> 
> >
> > Changes since v2:
> > - Added MSM_DRM_DP_COUNT to link the two 3s
> > - Moved NULL check for msm_dp_debugfs_init() to the call site
> > - Made struct dp_display_private->id unsigned
> >
> > I also implemented added connector_type to each of the DP instances and
> > propagated this to dp_drm_connector_init() but later dropped this again per
> > Doug's suggestion that we'll base this on the presence/absence of a associated
> > drm bridge or panel.
> 
> Sad but OK. We can take up that topic in another patch.
> 

So you don't agree with the solution from sn65dsi86?

The only reason I haven't yet send this other patch is the of_graph
thing Doug an I are discussing on the RFC. But if we agree to base this
on compatible we could decide to look only for panels for the edp
instances and avoid that problem...

We would however never be able to describe the USB-less DP instance with
a panel explicitly described in DT going that route.

> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index f655adbc2421..875b07e7183d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -203,8 +204,10 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
> >         dpu_debugfs_vbif_init(dpu_kms, entry);
> >         dpu_debugfs_core_irq_init(dpu_kms, entry);
> >
> > -       if (priv->dp)
> > -               msm_dp_debugfs_init(priv->dp, minor);
> > +       for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
> > +               if (priv->dp[i])
> > +                       msm_dp_debugfs_init(priv->dp[i], minor);
> 
> This seems to cause a bunch of debugfs warnings when there are multiple
> nodes created with the same name.
> 

Yes, that's true. I have a half-baked follow up that attempts to create
instance-specific debugfs directories. Can we take that in a follow up?

> > +       }
> >
> >         return dpu_core_perf_debugfs_init(dpu_kms, entry);
> >  }
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 5d3ee5ef07c2..ff3477474c5d 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -1180,10 +1192,31 @@ int dp_display_request_irq(struct msm_dp *dp_display)
> >         return 0;
> >  }
> >
> > +static int dp_display_find_id(struct platform_device *pdev)
> > +{
> > +       const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
> > +       struct resource *res;
> > +       int i;
> > +
> > +
> 
> Nitpick: Remove a newline here.
> 
> > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       if (!res)
> > +               return -EINVAL;
> > +
> > +       for (i = 0; i < cfg->num_descs; i++) {
> > +               if (cfg->io_start[i] == res->start)
> > +                       return i;
> > +       }
> 
> Nitpick: Drop braces on single line if inside for loop.
> 

Not when the loop spans multiple lines?

> > +
> > +       dev_err(&pdev->dev, "unknown displayport instance\n");
> > +       return -EINVAL;
> > +}
> > +
