Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 075E44369EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 20:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232326AbhJUSEk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 14:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232262AbhJUSEk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 14:04:40 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E9D9C061764
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 11:02:24 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id s18-20020a0568301e1200b0054e77a16651so1404557otr.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 11:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Cm50m8z6CYr/VmhG+kR+5QTJjWplQ0LeVI88QEFCusg=;
        b=AfuWmWwlkUxxnOEKSe2pZzBy5ZZbbog8kjdNi9w5d6DaWe+ypYjt98ogWhrSy6mnfp
         kX7rZbz9IVN6K48919K9o8AYVXxYQGAkMFa5yGoOQODxTTMwNHyjCB6FzSibmICjvZT7
         yykJrRahtY2H0/2WkssEyN36p9xUf1aKHtvgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Cm50m8z6CYr/VmhG+kR+5QTJjWplQ0LeVI88QEFCusg=;
        b=yt2S1p5IaZ8+JCMQL8WJdtwM/u2Zb3eqFCRaLezIoTEDw3j45LjLQVZKF1RtNDdnWV
         tD6xX7lFj2xD3IAdsgmQjKEvNEyyQZXNlBvrGsnZyvG6f5WACfAqJwq1lOwR+xmMaiwJ
         EpnjBB/cGW/k8XfZgChP38uFewEft3A8f7uS2N0xv8CYCl7HiEDV5LYF/VNSXjqq/YQi
         ywaHETdBSCN6QWQkcBNlAb9RIJR6yGb31IPDui14s0Y2pwfV86uKF5fOb2gvLjrLAW03
         gx6yRPonyXK+WGVyPoMZDn2j0czTKDlUnLIdy6GTiiGQJ7tJjKSyecod8nSzzFWIHKzk
         HSKA==
X-Gm-Message-State: AOAM531LBwWn83oSNFktvHkMpa9lsRq86rF8L3siZQ2OiFztNRsukvG4
        DN80cvWPxbH+QCCR+r8ZXEw8VqWy6LO/X3U3j90W2A==
X-Google-Smtp-Source: ABdhPJwGyQyLIYs5glLFBTJb4OJFUrX7EFm+vIUK4XYkbEDs20exbNwLWLTPgYr1QE+O4bxcm6HbdfD+S9dmGr6vVlY=
X-Received: by 2002:a05:6830:4187:: with SMTP id r7mr6060720otu.126.1634839343553;
 Thu, 21 Oct 2021 11:02:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Oct 2021 11:02:22 -0700
MIME-Version: 1.0
In-Reply-To: <1634732051-31282-2-git-send-email-quic_sbillaka@quicinc.com>
References: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com> <1634732051-31282-2-git-send-email-quic_sbillaka@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 21 Oct 2021 11:02:22 -0700
Message-ID: <CAE-0n52SjFOWNNFAciOOpKRSnPLqq3zs+qib9jukPkxf0frQTQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/dp: Add support for SC7280 eDP
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sankeerth Billakanti <sbillaka@codeaurora.org>,
        robdclark@gmail.com, seanpaul@chromium.org,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        dianders@chromium.org, khsieh@codeaurora.org,
        mkrishn@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sankeerth Billakanti (2021-10-20 05:14:10)
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 62e75dc..9fea49c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1238,9 +1240,21 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>         link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
>
>         dp_aux_link_configure(ctrl->aux, &link_info);
> +
> +       if (dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5) {

Please add a static inline macro in include/drm/drm_dp_helper.h that
makes this more readable. Something similar to drm_dp_is_branch() but
with a human readable replacement for "is_branch". Maybe drm_dp_ssc()?

> +               ssc = DP_SPREAD_AMP_0_5;
> +               drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, &ssc, 1);
> +       }
> +
>         drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
>                                 &encoding, 1);
>
> +       if (dpcd[DP_EDP_CONFIGURATION_CAP] & DP_ALTERNATE_SCRAMBLER_RESET_CAP) {

And this one already has a helper,
drm_dp_alternate_scrambler_reset_cap().

> +               assr = DP_ALTERNATE_SCRAMBLER_RESET_ENABLE;
> +               drm_dp_dpcd_write(ctrl->aux, DP_EDP_CONFIGURATION_SET,
> +                               &assr, 1);
> +       }
> +
>         ret = dp_ctrl_link_train_1(ctrl, training_step);
>         if (ret) {
>                 DRM_ERROR("link training #1 failed. ret=%d\n", ret);
> @@ -1312,9 +1326,11 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
>         struct dp_io *dp_io = &ctrl->parser->io;
>         struct phy *phy = dp_io->phy;
>         struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
> +       const u8 *dpcd = ctrl->panel->dpcd;
>
>         opts_dp->lanes = ctrl->link->link_params.num_lanes;
>         opts_dp->link_rate = ctrl->link->link_params.rate / 100;
> +       opts_dp->ssc = dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5;
>         dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
>                                         ctrl->link->link_params.rate * 1000);
>
> @@ -1406,7 +1422,7 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
>
>  static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
>  {
> -       u8 *dpcd = ctrl->panel->dpcd;
> +       const u8 *dpcd = ctrl->panel->dpcd;
>
>         /*
>          * For better interop experience, used a fixed NVID=0x8000
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c867745..c16311b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -144,8 +144,16 @@ static const struct msm_dp_config sc8180x_dp_cfg = {
>         .num_descs = 3,
>  };
>
> +static const struct msm_dp_config sc7280_dp_cfg = {
> +       .descs = (struct msm_dp_desc[]) {

const

> +               { .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP },
> +       },
> +       .num_descs = 1,
> +};
> +
>  static const struct of_device_id dp_dt_match[] = {
>         { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
> +       { .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
>         { .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
>         { .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_cfg },
>         {}
> @@ -1440,7 +1448,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>
>         dp_hpd_event_setup(dp);
>
> -       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
> +       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1);

This has no explanation. What is it?
