Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B18CA54EA86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 22:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235107AbiFPUHl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 16:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233682AbiFPUHk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 16:07:40 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3579A15727
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 13:07:39 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id k24so3131901oij.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 13:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=s6YjNqeFkBeitJEod+ywoglNF76LvxWXetZQio3hBl0=;
        b=NTaM09TANSQ9YjApBo2joU0KGvGfREh02jr9HfmBLye/nzoowGhLj1X/iQkqjlvc6W
         VuuHlG1lvdT5J1EdLIYD37uTEbPK5nsoc2SWQvuLrHU5gfzSH6o/adshSSIN7UzkjUyx
         1mT6ppunDhl3A5Vjkg/i3GHnqfSEZkb6yeJEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=s6YjNqeFkBeitJEod+ywoglNF76LvxWXetZQio3hBl0=;
        b=lFUnDSbjfDnXW+bqolitPxrT7KqDkcdoITAs1N/bQuQziZ/pbLC1sBwxqPjXnI/90w
         Xs1YyFT+HsZNRdA/bpg2fFpBAohHrrjoAdXLNQDQTY5MbLCNRX//DUe5ulJU1FBKKE0H
         ThG4v6lXXfULpTKc/boCOROEh/Wtt8FYzsv5rsrTPvpFhdss+kuaEJLqBpajyvvp3g7S
         hbvw6tNGrSCbAmIZFcdRSsNhVm2dLVOxrJLoyqw6VoG8dh0UDFL0IJz2s6BvK6gCqz/R
         m3M2Mej7ojZDZdA4vTMHXup/ohlFfIA9r75aGZ6wbCJfiuGB+/M952Kd9KEdfiewq5EC
         Q7kQ==
X-Gm-Message-State: AJIora+RBJVzlvAD04zG0o2ZuNEq57z3c2ptfo1mR6cqWLiGujeNEJa1
        5InPdFUzHJCNbNgqrPe0uH/TS6chdv5aDesPNI8mRA==
X-Google-Smtp-Source: AGRyM1vE/OzRxo9t3OzpbmbBYVrPabfJBVXad89oOXTWAGuEN5A0P8WKfJlZlPkQDZQqBd6CO7j07+NCgeWUyhjdZR0=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr3494471oib.63.1655410058546; Thu, 16
 Jun 2022 13:07:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jun 2022 13:07:38 -0700
MIME-Version: 1.0
In-Reply-To: <1655399361-10842-3-git-send-email-quic_khsieh@quicinc.com>
References: <1655399361-10842-1-git-send-email-quic_khsieh@quicinc.com> <1655399361-10842-3-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 16 Jun 2022 13:07:38 -0700
Message-ID: <CAE-0n50cteV=uYRR=7LmcUB00kjHwDRoutq+sz5FoGmZqLso4Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] drm/msm/dp: clean up pixel_rate from dp_ctrl.c
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-06-16 10:09:21)
> dp_ctrl keep an local cache of pixel_rate which increase confusing
> in regrading how pixel_rate being used. This patch refer pixel_rate
> directly from dp_panel to eliminate unnecessary pixel_rate variable
> from struct dp_ctrl.
>
> Changes in v8:
> -- add this patch to remove pixel_rate from dp_ctrl
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

I can send a proper patch for this myself later.

> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 158 +++++++++++++++++++--------------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h |   2 -
>  2 files changed, 79 insertions(+), 81 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 01028b5..6fddddd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1528,36 +1526,6 @@ static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
>         return ret;
>  }
>
> -static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
> -{
> -       int ret = 0;
> -
> -       if (!ctrl->link->phy_params.phy_test_pattern_sel) {
> -               drm_dbg_dp(ctrl->drm_dev,
> -                       "no test pattern selected by sink\n");
> -               return ret;
> -       }
> -
> -       /*
> -        * The global reset will need DP link related clocks to be
> -        * running. Add the global reset just before disabling the
> -        * link clocks and core clocks.
> -        */
> -       ret = dp_ctrl_off(&ctrl->dp_ctrl);
> -       if (ret) {
> -               DRM_ERROR("failed to disable DP controller\n");
> -               return ret;
> -       }
> -
> -       ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
> -       if (!ret)
> -               ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
> -       else
> -               DRM_ERROR("failed to enable DP link controller\n");
> -
> -       return ret;
> -}
> -
>  static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
>  {
>         bool success = false;
> @@ -1610,6 +1578,56 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
>         return success;
>  }
>
> +int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
> +{
> +       int ret = 0;
> +       struct dp_ctrl_private *ctrl;
> +       unsigned long pixel_rate;
> +
> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +       pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
> +       ret = dp_ctrl_enable_stream_clocks(ctrl, pixel_rate);
> +       if (ret) {
> +               DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> +               return ret;
> +       }
> +
> +       dp_ctrl_send_phy_test_pattern(ctrl);
> +
> +       return 0;
> +}
> +
> +static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
> +{
> +       int ret = 0;
> +
> +       if (!ctrl->link->phy_params.phy_test_pattern_sel) {
> +               drm_dbg_dp(ctrl->drm_dev,
> +                       "no test pattern selected by sink\n");
> +               return ret;
> +       }
> +
> +       /*
> +        * The global reset will need DP link related clocks to be
> +        * running. Add the global reset just before disabling the
> +        * link clocks and core clocks.
> +        */
> +       ret = dp_ctrl_off(&ctrl->dp_ctrl);
> +       if (ret) {
> +               DRM_ERROR("failed to disable DP controller\n");
> +               return ret;
> +       }
> +
> +       ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
> +       if (!ret)
> +               ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
> +       else
> +               DRM_ERROR("failed to enable DP link controller\n");
> +
> +       return ret;
> +}
> +
>  void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
>  {
>         struct dp_ctrl_private *ctrl;

I'd prefer these hunks to be part of a different patch. Either squashed
into the previous patch, or after the previous patch to show that a
forward declaration isn't necessary, but helped minimize the diff of
that patch.

> @@ -1685,6 +1703,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>         u32 const phy_cts_pixel_clk_khz = 148500;
>         u8 link_status[DP_LINK_STATUS_SIZE];
>         unsigned int training_step;
> +       unsigned long pixel_rate;
>
>         if (!dp_ctrl)
>                 return -EINVAL;
