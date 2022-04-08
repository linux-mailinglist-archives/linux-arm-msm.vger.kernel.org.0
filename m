Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00C0F4F9486
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 13:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232876AbiDHLyn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 07:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231684AbiDHLym (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 07:54:42 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F045A3888
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 04:52:38 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id v13so4544123qkv.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Apr 2022 04:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jx6/Lgbitqz5l2vaW1Kah0wGVIvKoz5skxFr6Jlav/w=;
        b=S++XNMlvf3Vbg3Rih1bTFb/lLZQdn7EPa8DKSd1j6649HfU0cdQo29mEKO/CM1UKZm
         PASfkvYlTmczerTPeFCsnWQhsCz17nJ06x4kVN6JCl6sCIEOfC2CUg0hiZPc/AQ4Ln4t
         7W2rglnBywYnttvathHjgcJhn0UzVdsnGI1vr/VO9rZUsvLXxK+1hPIkGbS8BR+IWSn+
         IggrY86KAq9S9cEWy5t8J4iTDfPtYX/1+TilDScxqfwi886SS9VDp8q3ITUyiUTUC2Ah
         CRtJb2ekFG8s6seSnbe3BfEhhW7KuH35uo1ioN1V8UdWV0NKkZ9MpIxqsfW4X+F1vdHv
         h8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jx6/Lgbitqz5l2vaW1Kah0wGVIvKoz5skxFr6Jlav/w=;
        b=5d3px2CPhWWS7w9AKJ6nPoIRClw79JytEGWdKCU+tS/JtHB3HPfGAVtWq1Qe19qg/y
         Z5Hn3hJQU8JsbI1I1VZOti6i2b5kOG4fYB2QfoNE/S86x1gJB3v3cwt5KPG7OvGZCtVS
         5DhYZRYNtyYmK5QiHpG24kzCrf7Rt4R0wmS+umPotcuQGgLnnpRr4kMdYeT53INCIbIA
         AMjmAZQnT+sQDUAiS2SySGJ1XyZYOxObHfLXJObmuRRp6wlbbOm7GGv1H5tN5lhPfsO4
         La8mQB3+ew/6yIIliSDqTIfV/qpMFXAsl4vZ9CX1niaZVrZ0Trdv3WFjL1Y0+KnuoJlX
         5hFA==
X-Gm-Message-State: AOAM530hPXEVZrGrZ4t644wV1Vy/j1iYTMBHGjmPnyNFPtst7p/wFq+X
        ct/DpCO6Qey3UkQeWyXuDCrnmCT7XdsLYtN9oU2W0w==
X-Google-Smtp-Source: ABdhPJzUx8+jelie1GKF76E3MKGQcEpF3pUQ1g+FajnC79YKu7g3Y5icMIcl67VWS851AmyeK0Edv1CTDuLA810H2Ic=
X-Received: by 2002:a05:620a:2449:b0:69a:4ae:85e5 with SMTP id
 h9-20020a05620a244900b0069a04ae85e5mr4876649qkn.30.1649418758129; Fri, 08 Apr
 2022 04:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <1649350286-11504-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1649350286-11504-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 8 Apr 2022 14:52:27 +0300
Message-ID: <CAA8EJpo7UGvhH0WYFm6gdOdX22++9kErudA7_ce-mbPBY3KEpw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: add fail safe mode outside of event_mutex context
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org,
        quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 Apr 2022 at 19:51, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> There is possible circular locking dependency detected on event_mutex.
> To break this possible circular locking, this patch move setting fail
> safe mode out of event_mutex scope.

Please provide the lockdep trace here, it might help other people
trying to fix the issue or working on backports to stable kernels.

>
> Fixes: d4aca422539c ("drm/msm/dp:  always add fail-safe mode into connector mode list")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  6 ++++++
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 20 ++++++++++----------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>  3 files changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 178b774..a42732b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -580,6 +580,12 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>                         dp->dp_display.connector_type, state);
>         mutex_unlock(&dp->event_mutex);
>
> +       /*
> +        * add fail safe mode outside event_mutex scope
> +        * to avoid potiential circular lock with drm thread
> +        */
> +       dp_panel_add_fail_safe_mode(dp->dp_display.connector);
> +
>         /* uevent will complete connection part */
>         return 0;
>  };
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index f141872..26c3653 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -151,6 +151,15 @@ static int dp_panel_update_modes(struct drm_connector *connector,
>         return rc;
>  }
>
> +void dp_panel_add_fail_safe_mode(struct drm_connector *connector)
> +{
> +       /* fail safe edid */
> +       mutex_lock(&connector->dev->mode_config.mutex);
> +       if (drm_add_modes_noedid(connector, 640, 480))
> +               drm_set_preferred_mode(connector, 640, 480);
> +       mutex_unlock(&connector->dev->mode_config.mutex);
> +}
> +
>  int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>         struct drm_connector *connector)
>  {
> @@ -207,16 +216,7 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>                         goto end;
>                 }
>
> -               /* fail safe edid */
> -               mutex_lock(&connector->dev->mode_config.mutex);
> -               if (drm_add_modes_noedid(connector, 640, 480))
> -                       drm_set_preferred_mode(connector, 640, 480);
> -               mutex_unlock(&connector->dev->mode_config.mutex);
> -       } else {
> -               /* always add fail-safe mode as backup mode */
> -               mutex_lock(&connector->dev->mode_config.mutex);
> -               drm_add_modes_noedid(connector, 640, 480);
> -               mutex_unlock(&connector->dev->mode_config.mutex);
> +               dp_panel_add_fail_safe_mode(connector);
>         }
>
>         if (panel->aux_cfg_update_done) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 9023e5b..99739ea 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -59,6 +59,7 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel);
>  int dp_panel_deinit(struct dp_panel *dp_panel);
>  int dp_panel_timing_cfg(struct dp_panel *dp_panel);
>  void dp_panel_dump_regs(struct dp_panel *dp_panel);
> +void dp_panel_add_fail_safe_mode(struct drm_connector *connector);
>  int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>                 struct drm_connector *connector);
>  u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel, u32 mode_max_bpp,
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
