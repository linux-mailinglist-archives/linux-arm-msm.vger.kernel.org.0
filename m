Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0576434CB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 15:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhJTNyk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 09:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbhJTNyj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 09:54:39 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48811C06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 06:52:25 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id p4so3153693qki.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 06:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mfs+4NyWkfTaj421oSEwudMTkuDSAys8V4yDoL8Jpzs=;
        b=lh2SLw9LG7sjy/U5kaBXhoagcHJOXKhY3BfguE1ZtvSL3rbyAGc63Xd8vOPv6XWZwB
         ZLzOtt2+4fB4e+VDmPuxLDfD++zXTfcRdLrgGi0gl9yUbbaiUqj3R2ipqjXtSU3CEB7x
         5n7a+mRMGCSKB95yKttmnTdv//O5NoEcS8OAE+QCBo4yIXZ4C2GYjNvqTyHFc2JVLYXm
         eR0WdEQjoMJMhD/09XXisBimbOmSdbqyHevnCKjyboOLym86hTeiyUko1vUN/iUqmUjp
         gkgtEwe+VA7CWLLSRZhV1fyC8Yh1yu9W8zKDOE4k+pHEi0IIxvSPVXT8MBniYiIFBpxi
         Jg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mfs+4NyWkfTaj421oSEwudMTkuDSAys8V4yDoL8Jpzs=;
        b=0NavKbb6/jsBNYrjuvURSqeezgsTkTIsaSFvBVHg6G1emQKH0DeXcPogf3hMH8dQW8
         Daual7TzEZf0sNycfzdutVhEIZ4zF553pZK6ad4vqXj2rIxq9Tky57Kogzft20PV7XOu
         F8jRp8V30IhxHJKg8MnaPOx6V0siTrZlPC8TY85gi7tNNHsrkhWJ4oF8ig3tk+huMO3G
         7x7HgSF8/CeD1fw8UAufi4yKaONDfV4hidtCChF/pKEX2FfclRZF1nPWIp+HjMhJxn2/
         KJFEUmhEybFo59eVSdWrdNzSHLvq/hrf/f2T/G+BbkwoRq3sPDAkGK3dV7BBJ7JLJiYe
         vaNg==
X-Gm-Message-State: AOAM530U4huUhw57hvE/V/PfzdBaIqkEfiwDFur/H8WxKbxePrngeamj
        hKqVyaNM16aDVBv20yLeYubWR49RvTVUOMo9wkEYyw==
X-Google-Smtp-Source: ABdhPJz8v3Z+3bmo6S7PjIrVebau93Wu/0dTLaQ2xsXOA/kgqokYi7hSyOxWoGwRwCU4FMbg4eigPgPMvA88MXHzIAY=
X-Received: by 2002:a05:620a:1a05:: with SMTP id bk5mr101729qkb.195.1634737944348;
 Wed, 20 Oct 2021 06:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com> <1634732051-31282-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1634732051-31282-2-git-send-email-quic_sbillaka@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 20 Oct 2021 16:52:13 +0300
Message-ID: <CAA8EJpp60hdSaizFgHD3jzutgxvJ9XoueBuggoWXfTaCLenUpw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/dp: Add support for SC7280 eDP
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        Sankeerth Billakanti <sbillaka@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 20 Oct 2021 at 15:14, Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> From: Sankeerth Billakanti <sbillaka@codeaurora.org>
>
> The eDP controller on SC7280 is similar to the eDP/DP controllers
> supported by the current driver implementation.
>
> SC7280 supports one EDP and one DP controller which can operate
> concurrently.
>
> The following are some required changes to support eDP on sc7280:
> 1. SC7280 eDP support in the dp_display driver.
> 2. ASSR support programming for the sink device.
> 3. SSC support programming for the sink device.

Please split your patch according to these changes. Each item should
go in a separate patch.

>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++--
>  drivers/gpu/drm/msm/dp/dp_ctrl.c               | 20 ++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_display.c            | 10 +++++++++-
>  3 files changed, 29 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index ce6f32a..516cc19 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -856,9 +856,9 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
>  };
>
>  static const struct dpu_intf_cfg sc7280_intf[] = {
> -       INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +       INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>         INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -       INTF_BLK("intf_5", INTF_5, 0x39000, INTF_EDP, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +       INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),

Why does intf_0 receive index 1? I think you have a mistake in the
dp_descs below.
Also note that the latest patch started using MSM_DP_CONTROLLER_n
symbols instead of using raw numbers.

>  };
>
>  /*************************************************************
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 62e75dc..9fea49c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -119,7 +119,7 @@ void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl)
>  static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
>  {
>         u32 config = 0, tbd;
> -       u8 *dpcd = ctrl->panel->dpcd;
> +       const u8 *dpcd = ctrl->panel->dpcd;
>
>         /* Default-> LSCLK DIV: 1/4 LCLK  */
>         config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
> @@ -1228,7 +1228,9 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>                         int *training_step)
>  {
>         int ret = 0;
> +       const u8 *dpcd = ctrl->panel->dpcd;
>         u8 encoding = DP_SET_ANSI_8B10B;
> +       u8 ssc, assr;
>         struct dp_link_info link_info = {0};
>
>         dp_ctrl_config_ctrl(ctrl);
> @@ -1238,9 +1240,21 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>         link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
>
>         dp_aux_link_configure(ctrl->aux, &link_info);
> +
> +       if (dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5) {
> +               ssc = DP_SPREAD_AMP_0_5;
> +               drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, &ssc, 1);
> +       }
> +
>         drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
>                                 &encoding, 1);
>
> +       if (dpcd[DP_EDP_CONFIGURATION_CAP] & DP_ALTERNATE_SCRAMBLER_RESET_CAP) {
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
> +               { .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP },

I think you'd want to have sc7280-dp using DP_CONTROLLER_0 and
sc7280-edp using DP_CONTROLLER_1. See latest Bjorn's patches.

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
>  }
>
>  void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
> --
> The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
