Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB84C433805
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 16:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235958AbhJSOJU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 10:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231460AbhJSOJT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 10:09:19 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D9CC061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 07:07:05 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id p16so7789338lfa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 07:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dix03PG56sUwbrrj2SOdFSmJzhLlGGJDPLIQylST6ik=;
        b=Z6VUwRkMd06lqXnl6oOYC0POPUxO1qkX9saCZyO1m8gMgj91P7m/9TCxYeDCBlfIDV
         kl6vzcTT0c+Ygub2cwUKe5MP7dGBRjZ2lXC5Cbz7/f13amDhlSkSmf7mSqWeztovN1iu
         0ZhV1WF/rsNNGhGSUM3xmxFGtg3dWRYJDlm2PNXuQFOvS+ZM74QirsQiXoRHxEcBJ+wP
         7Sq00cuRIRjopEH4lhgZB+epSGaQk7HNl6Ey+f2eQMeGPYc/3lA4Gk2lG9ebhb9KFb1l
         Oui2O6mbxUog4Cvhb2qLjCiKHG3PDfZoQc6DXLd6Fz8Mo62ZAJH5w7ho8Puw8bLmNr79
         g6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dix03PG56sUwbrrj2SOdFSmJzhLlGGJDPLIQylST6ik=;
        b=YXFk7R2bjLq4aLVZtpVoHtooALLowNjvP30+plLHDKG+W59+0Qiy8L7jBEikcrJizv
         sgNqLSmFJtbA5niJQN/BtHJ6El3L9VDVQMPF47JIOBBh2HYMSiYMdqgFJBP3PFSOc7rg
         CMUWVd58SDFmC3T65J7WPtk3X+WRxyXfSxzphxUGWYg89KMbWmLxeFy5t2TpIODW3BN6
         Zv50g13iVVeelZw1k61L3hFj0k7ZhIKN5la2StMVfYZvY7gXu9yvvDL3Bnn8dbVFBo4B
         94YiPO8IwXtqjmBM8PILyYPh27x8XESvm48MDNpx8t6G8Spe3b9ze2KAi8YIDJmRHUL8
         AtUw==
X-Gm-Message-State: AOAM5329H0GoNtfafUBfEkQi+xDfZjX8ry9SBvP5/6Gbts8NYEg4nza/
        mE7jq0gAVjzXUQANMRxdHV1SmKpYOVx+rz8noz/g+g==
X-Google-Smtp-Source: ABdhPJyNJla5T7dESOtpHTpxrs0UZdsFyHjq+50VDt9UlPLCFgAnsVq7jrI0OuJ/qlTtyDZzWV554p6SCVlbu+AOfhU=
X-Received: by 2002:a05:6512:3084:: with SMTP id z4mr5948363lfd.167.1634652423098;
 Tue, 19 Oct 2021 07:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211005033732.2284447-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211005033732.2284447-1-bjorn.andersson@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 19 Oct 2021 16:06:27 +0200
Message-ID: <CAPDyKFpEkeyOubaJ4j9f1+w98M-eqA9EC1VM=2404DweTjfq1Q@mail.gmail.com>
Subject: Re: [PATCH v3] soc: qcom: rpmhpd: Make power_on actually enable the domain
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 5 Oct 2021 at 05:35, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> The general expectation is that powering on a power-domain should make
> the power domain deliver some power, and if a specific performance state
> is needed further requests has to be made.
>
> But in contrast with other power-domain implementations (e.g. rpmpd) the
> RPMh does not have an interface to enable the power, so the driver has
> to vote for a particular corner (performance level) in rpmh_power_on().
>
> But the corner is never initialized, so a typical request to simply
> enable the power domain would not actually turn on the hardware. Further
> more, when no more clients vote for a performance state (i.e. the
> aggregated vote is 0) the power domain would be turned off.
>
> Fix both of these issues by always voting for a corner with non-zero
> value, when the power domain is enabled.
>
> The tracking of the lowest non-zero corner is performed to handle the
> corner case if there's ever a domain with a non-zero lowest corner, in
> which case both rpmh_power_on() and rpmh_rpmhpd_set_performance_state()
> would be allowed to use this lowest corner.
>
> Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Looks reasonable to me!

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>
> Changes since v2:
> - Fixed two spelling mistakes in the commit message
> - Changed the last hunk to search for first non-zero level, rather than the
>   first non-zero index (i.e. 1)
>
>  drivers/soc/qcom/rpmhpd.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index e280a8194725..0ca77ed22c6c 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -30,6 +30,7 @@
>   * @active_only:       True if it represents an Active only peer
>   * @corner:            current corner
>   * @active_corner:     current active corner
> + * @enable_corner:     lowest non-zero corner
>   * @level:             An array of level (vlvl) to corner (hlvl) mappings
>   *                     derived from cmd-db
>   * @level_count:       Number of levels supported by the power domain. max
> @@ -47,6 +48,7 @@ struct rpmhpd {
>         const bool      active_only;
>         unsigned int    corner;
>         unsigned int    active_corner;
> +       unsigned int    enable_corner;
>         u32             level[RPMH_ARC_MAX_LEVELS];
>         size_t          level_count;
>         bool            enabled;
> @@ -401,13 +403,13 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *pd, unsigned int corner)
>  static int rpmhpd_power_on(struct generic_pm_domain *domain)
>  {
>         struct rpmhpd *pd = domain_to_rpmhpd(domain);
> -       int ret = 0;
> +       unsigned int corner;
> +       int ret;
>
>         mutex_lock(&rpmhpd_lock);
>
> -       if (pd->corner)
> -               ret = rpmhpd_aggregate_corner(pd, pd->corner);
> -
> +       corner = max(pd->corner, pd->enable_corner);
> +       ret = rpmhpd_aggregate_corner(pd, corner);
>         if (!ret)
>                 pd->enabled = true;
>
> @@ -452,6 +454,10 @@ static int rpmhpd_set_performance_state(struct generic_pm_domain *domain,
>                 i--;
>
>         if (pd->enabled) {
> +               /* Ensure that the domain isn't turn off */
> +               if (i < pd->enable_corner)
> +                       i = pd->enable_corner;
> +
>                 ret = rpmhpd_aggregate_corner(pd, i);
>                 if (ret)
>                         goto out;
> @@ -488,6 +494,10 @@ static int rpmhpd_update_level_mapping(struct rpmhpd *rpmhpd)
>         for (i = 0; i < rpmhpd->level_count; i++) {
>                 rpmhpd->level[i] = buf[i];
>
> +               /* Remember the first corner with non-zero level */
> +               if (!rpmhpd->level[rpmhpd->enable_corner] && rpmhpd->level[i])
> +                       rpmhpd->enable_corner = i;
> +
>                 /*
>                  * The AUX data may be zero padded.  These 0 valued entries at
>                  * the end of the map must be ignored.
> --
> 2.29.2
>
