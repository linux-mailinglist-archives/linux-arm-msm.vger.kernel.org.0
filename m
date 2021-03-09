Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409933329F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 16:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbhCIPPH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 10:15:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbhCIPO5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 10:14:57 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1847AC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Mar 2021 07:14:57 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id l4so13340025qkl.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Mar 2021 07:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7MrPV8J5TBwRP2XTDenNEVDLqEA1C2gDo3lt+AylHJg=;
        b=kzpPHQlBIF4+6LV5REOgk4hd860I5fwmqU2hco2bMJsl2jvOVyhLCi3cxyUg+gYSnI
         S/3f0zavZsXfo583h+EDFc5NEFVxC/Bo6PIR/GQqOI9hawIfiNAeh9I53XsHUkUnPhtH
         ccqY6z9XUAB4/cGr2/ut5puxovjwn+g7GjjtqIulLitEP6myj0ItoWZEd1yrGczd4nWm
         /FJsGw3wXtNGtq75Xl2otJgxhFs3twc1MfwsBYHmBOru8ykOTRJxtPTdaNvx1Htaw3Yr
         fTTWMpyUv8LdTN641FtKq8sjmNGXYWiAREFq0QVHWlSZvbgj8uNNZMVJOw3z+am6bxiH
         xIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7MrPV8J5TBwRP2XTDenNEVDLqEA1C2gDo3lt+AylHJg=;
        b=WXZeHHQ71lWXnW4EBv+iZUq6EKfXt/oMuXW9iIbdn2jv8+nD+3fcp7aFUIkYPN4Wnh
         fvRxLrHsPxBArXx/wM00oE/DG40VyFdabAj33cNpiqV0KjXzBEnCk3kLlN9esDJRAmEj
         I3W6+kyIDa5+T2u4sMT2lP+Bsaw6Vo0U6Ak+wiBP2mjA5AVjHu6dPnX40RZod0FU7t96
         JDu7vOyySsP1DFFkgycs5IZgSrPxm3y6T8L5QdNKPBxfoi+YKhisuttC5mGWqiM01ULx
         vGDms8ayLFHlp3LO0S2TGSpqNQ3u9BzhlplzfaSu9SuVX/MAIh8csfgOMYeQluv5aBQm
         a3Hg==
X-Gm-Message-State: AOAM530dokbBvQN5xnn3jD/UNg06VJl3kAwih5xXGudSo0KigIFLHG+1
        o6BhpnnjnVMSPVKGH2rOOw/MAc9xbUMvdWvOqiXRhQ==
X-Google-Smtp-Source: ABdhPJzVlEwNEHQWahsLhzstfMLZXkIj/+jRZQzIdcrvUeWVyWtSBn6T9++RBPWw8oTT696f0ki1+UBA3Fas0/UT2Jc=
X-Received: by 2002:a37:8cd:: with SMTP id 196mr24729622qki.434.1615302896316;
 Tue, 09 Mar 2021 07:14:56 -0800 (PST)
MIME-Version: 1.0
References: <20210224224751.1215018-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210224224751.1215018-1-dmitry.baryshkov@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 9 Mar 2021 18:14:45 +0300
Message-ID: <CAA8EJppWYvE6=TeQVExZB33-yUx+3YCQh4sde=xywyfKucRkEw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: fix check-before-set in the 7nm dsi_pll code
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rob,

Any feedback on this? The patches were sent about two weeks ago.

On Thu, 25 Feb 2021 at 01:47, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Fix setting min/max DSI PLL rate for the V4.1 7nm DSI PLL (used on
> sm8250). Current code checks for pll->type before it is set (as it is
> set in the msm_dsi_pll_init() after calling device-specific functions.
>
> Cc: Jonathan Marek <jonathan@marek.ca>
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll.c     | 2 +-
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll.h     | 6 ++++--
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 5 +++--
>  3 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
> index a45fe95aff49..3dc65877fa10 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
> @@ -163,7 +163,7 @@ struct msm_dsi_pll *msm_dsi_pll_init(struct platform_device *pdev,
>                 break;
>         case MSM_DSI_PHY_7NM:
>         case MSM_DSI_PHY_7NM_V4_1:
> -               pll = msm_dsi_pll_7nm_init(pdev, id);
> +               pll = msm_dsi_pll_7nm_init(pdev, type, id);
>                 break;
>         default:
>                 pll = ERR_PTR(-ENXIO);
> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
> index 3405982a092c..bbecb1de5678 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
> @@ -117,10 +117,12 @@ msm_dsi_pll_10nm_init(struct platform_device *pdev, int id)
>  }
>  #endif
>  #ifdef CONFIG_DRM_MSM_DSI_7NM_PHY
> -struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id);
> +struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev,
> +                                       enum msm_dsi_phy_type type, int id);
>  #else
>  static inline struct msm_dsi_pll *
> -msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
> +msm_dsi_pll_7nm_init(struct platform_device *pdev,
> +                                       enum msm_dsi_phy_type type, int id)
>  {
>         return ERR_PTR(-ENODEV);
>  }
> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> index 93bf142e4a4e..c1f6708367ae 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> @@ -852,7 +852,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
>         return ret;
>  }
>
> -struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
> +struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev,
> +                                       enum msm_dsi_phy_type type, int id)
>  {
>         struct dsi_pll_7nm *pll_7nm;
>         struct msm_dsi_pll *pll;
> @@ -885,7 +886,7 @@ struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
>         pll = &pll_7nm->base;
>         pll->min_rate = 1000000000UL;
>         pll->max_rate = 3500000000UL;
> -       if (pll->type == MSM_DSI_PHY_7NM_V4_1) {
> +       if (type == MSM_DSI_PHY_7NM_V4_1) {
>                 pll->min_rate = 600000000UL;
>                 pll->max_rate = (unsigned long)5000000000ULL;
>                 /* workaround for max rate overflowing on 32-bit builds: */
> --
> 2.30.0
>


-- 
With best wishes
Dmitry
