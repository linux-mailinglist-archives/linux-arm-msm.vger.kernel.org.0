Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73F2949C829
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 11:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240382AbiAZK7J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 05:59:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240351AbiAZK7I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 05:59:08 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2CBC06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 02:59:08 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id q5so9354955qkc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 02:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NPx10yE8yULTQ2I1GWpvbI+9jFGXWf+l/TyyfhdSi2s=;
        b=DcKJgjZo5MjwZhR1BP8rm+BYvknvqznCY9tfc++zczXRYrENWh/CmheKNnm7njeYxQ
         JtG06XqoPV3iDFbEj5xILlHIeXxrwXEmgmLtRmH4lyQ0LTkBY+z9+ycGOcCkNXzS7tDq
         uBxZzyCUzDg34fMSX7vFq+Yxm/iOXaPup4rqvxMubW4hSJrTbneNZwu1l4Ne7YGW/xMp
         MkZaz/rCe004RJEK7y8FN0PGeMa9vrGWzv+gz/GfsE6Gwz9e1196sTOMVDoy/4vkaHq6
         DX2mZ7rdR8sBeaIQBI0yK4oP//EL4ekOwCV2uPzYg+FOX9FvD80PUiKX6eCFYqQltRMC
         /ZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NPx10yE8yULTQ2I1GWpvbI+9jFGXWf+l/TyyfhdSi2s=;
        b=nHUuZrOODxcAPVoGeGZIpKp7YEwbU2jjZVisM4AXpvVTk5UaMddSq/h2c42FBSgSkQ
         6kXR/nJzKrUcMtQpD5t3VCvc+3dUfdRB12WdH6lpvchS3GNYnw08QFaaJFCXn//N8p5n
         +1A/Mq1CWCtOZOUJflCN0fuQ+Dtrf2SBzVwmyVFdDfvmY6YNvQwlegZN14YtXoZMfzDA
         RYsj9kE4B/mcuMwiGOS79bdmX3S4TZ8mRmXQSTo60V/uq12Ufkt4y7mnD36ciiGlzr5l
         6cfqJKskFW6GUusJs8qaw1JZ4NSoJF4abh2LUU/DdBnZA8EkWD/8T9Dx1BZkK/jkpir+
         YQ/A==
X-Gm-Message-State: AOAM533RWXRRgZwoDCduLIg3xPn6EiF/TloogILJqLDuyXpNM5wQ/Cw4
        jtHnvr0O3UiEdGSBJk8zgnkdKBHwWmng4gHfzja+Ww==
X-Google-Smtp-Source: ABdhPJxjvuXkYK5Oyx78s5S22uQf0bXFzDeEdF5A3RuUkZEEMGL+lFFyurB31lgTk9CuURIUfP+K9DbMGn+uVKEvtjo=
X-Received: by 2002:a37:ac08:: with SMTP id e8mr1636406qkm.30.1643194747895;
 Wed, 26 Jan 2022 02:59:07 -0800 (PST)
MIME-Version: 1.0
References: <1643064292-6965-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n505fYR1zpgZnC=J7WSxp_gpn6mnda9TuVjmJD8vMRn2Rg@mail.gmail.com> <7155e3ab-daf1-4104-6712-1c4e3a328b56@quicinc.com>
In-Reply-To: <7155e3ab-daf1-4104-6712-1c4e3a328b56@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 26 Jan 2022 13:58:56 +0300
Message-ID: <CAA8EJpp-DB9+zWZnszkyxNGd+kO5Bko+mw7T_KoeFVTQPmxvDw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: add connector type to enhance debug messages
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org,
        quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 25 Jan 2022 at 21:26, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 1/24/2022 5:50 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-01-24 14:44:52)
> >> DP driver is a generic driver which supports both eDP and DP.
> >> For debugging purpose it is required to have capabilities to
> >> differentiate message are generated from eDP or DP. This patch
> >> add connector type into debug messages for this purpose.
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 20 +++++------
> >>   drivers/gpu/drm/msm/dp/dp_display.c | 71 ++++++++++++++++++++++++++-----------
> >>   2 files changed, 60 insertions(+), 31 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> index 245e1b9..dcd0126 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> @@ -1396,6 +1396,8 @@ void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
> >>
> >>          dp_catalog_ctrl_phy_reset(ctrl->catalog);
> >>          phy_init(phy);
> >> +       DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
> >> +                       phy, phy->init_count, phy->power_count);
> >>   }
> >>
> >>   void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
> >> @@ -1410,6 +1412,8 @@ void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
> >>
> >>          dp_catalog_ctrl_phy_reset(ctrl->catalog);
> >>          phy_exit(phy);
> >> +       DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
> >> +                       phy, phy->init_count, phy->power_count);
> >>   }
> >>
> >>   static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
> >> @@ -1484,6 +1488,8 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
> >>          phy_exit(phy);
> >>          phy_init(phy);
> >>
> >> +       DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
> >> +                       phy, phy->init_count, phy->power_count);
> >>          return 0;
> >>   }
> >>
> > These are entirely new messages. Adding messages isn't mentioned in the
> > commit text. Please either split this out or indicate in the commit text
> > what's going on here.
> >
> >> @@ -1895,14 +1901,12 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
> >>
> >>          phy_power_off(phy);
> >>
> >> -       DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
> >> -               (u32)(uintptr_t)phy, phy->init_count, phy->power_count);
> >> -
> >>          /* aux channel down, reinit phy */
> >>          phy_exit(phy);
> >>          phy_init(phy);
> >>
> >> -       DRM_DEBUG_DP("DP off link/stream done\n");
> >> +       DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
> > The DRM_DEBUG_DP macro says it's deprecated now and we should use
> > drm_dbg_dp() instead. Can you use that macro instead? Then it looks like
> > drm->dev can actually be any old struct device, so I guess we're allowed
> > to pass in the particular instance of dp device this is for. Allowing us
> > to figure out which DP device is actually printing messages.
> where it say "deprecated"?

Quoting drm_print.h:

/* NOTE: this is deprecated in favor of drm_dbg_dp(NULL, ...). */
#define DRM_DEBUG_DP(fmt, ...)                                          \
        __drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)


> >> +                       phy, phy->init_count, phy->power_count);
> >>          return ret;
> >>   }
> >>



-- 
With best wishes
Dmitry
