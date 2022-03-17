Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13D664DD049
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Mar 2022 22:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbiCQVjJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 17:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbiCQVjI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 17:39:08 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 195DC1B2C46
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 14:37:50 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id j83so7025644oih.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 14:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=mYahFg1u8AWNshIkG0ACNOEuY23IE74jTRUAFlXlZgs=;
        b=LzAlpuAIvhSFB57UMk4TIVaAFjG+yZiFO7gvk21cjYrKKivdM394ahnLTPM1TB1S8x
         V4Rek+owRzgElF1h34+BD/zJItn/bmK9nvLvYkifZusOqMQOwrDCfSKepPe+k4Wgq1sf
         6FamhJegmjo6xbuGqtZsF4IhIuI+2CtxU1p1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=mYahFg1u8AWNshIkG0ACNOEuY23IE74jTRUAFlXlZgs=;
        b=yQoiaWnad4dGgvEekxcilun5+HlpVV2PbWPPE31wqR966PiMYzp3FPGeC5W1MUuU7P
         a784jEgs0Vh5dnrkE/EMxBbC/cXivVYhb/IXL1X54yLEy1XzHPwFVWNFTUpeVlCqzHwr
         gVYXNNbDOXEGsJhS9obInAWjnZvKcN9z1OoyaPW7dogCRFG2K+ZRwyTWd1JwMFZg7lKY
         uWQ9Ow7qgypg68StcEBaz0kjPSwSKIDrnStSXiXJ/4PMTWuqp0BoYRMl0cA8Ij7BHsd2
         kzSb0lbqrOdxFQLjGwzn/EUJnbvSVzxJQXb67er5Wo2uDMsL69FA8UNPjEPAlMSqmvcA
         IMUw==
X-Gm-Message-State: AOAM531jGAf0LQY74zryP9CYS7a4AVsvpP3sSJst61+qHrDpUj2BDEBt
        vB97FXX8gPMTC+UHNPAcT4pNzuEo4RUuMCRSnKCxVw==
X-Google-Smtp-Source: ABdhPJyGHg7pzS0hejsylQTRq/KbshJeBY747RjvdABUqcwVlbZBxy0liBFxJXm6e5w3U9vj0KJv+6WpvTei0kthD/8=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr2860328oie.193.1647553069283; Thu, 17
 Mar 2022 14:37:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Mar 2022 17:37:48 -0400
MIME-Version: 1.0
In-Reply-To: <1647452154-16361-6-git-send-email-quic_sbillaka@quicinc.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com> <1647452154-16361-6-git-send-email-quic_sbillaka@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 17 Mar 2022 17:37:48 -0400
Message-ID: <CAE-0n50dmA0ETgNvaBGs+XmGu+r=6RbfbmnHqXAFqUBGjVGDvg@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] drm/msm/dp: Add eDP support via aux_bus
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     robdclark@gmail.com, seanpaul@chromium.org,
        quic_kalyant@quicinc.com, quic_abhinavk@quicinc.com,
        dianders@chromium.org, quic_khsieh@quicinc.com, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        thierry.reding@gmail.com, sam@ravnborg.org,
        dmitry.baryshkov@linaro.org, quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sankeerth Billakanti (2022-03-16 10:35:50)
>         This patch adds support for generic eDP sink through aux_bus.

Please unindent commit text paragraphs. This isn't a book.

> The eDP/DP controller driver should support aux transactions originating
> from the panel-edp driver and hence should be initialized and ready.
>
>         The panel bridge supporting the panel should be ready before
> the bridge connector is initialized. The generic panel probe needs the
> controller resources to be enabled to support aux tractions originating

s/tractions/transactions/

> from it. So, the host_init and phy_init are moved to execute before the
> panel probe.
>
>         The host_init has to return early if the core is already
> initialized so that the regulator and clock votes for the controller
> resources are balanced.
>
>         EV_HPD_INIT_SETUP needs to execute immediately to enable the
> interrupts for the aux transactions from panel-edp to get the modes
> supported.

There are a lot of things going on in this patch. Can it be split up?

>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 65 +++++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 10 +++---
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 21 +-----------
>  drivers/gpu/drm/msm/dp/dp_parser.h  |  1 +
>  4 files changed, 70 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 382b3aa..688bbed 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -10,6 +10,7 @@
>  #include <linux/component.h>
>  #include <linux/of_irq.h>
>  #include <linux/delay.h>
> +#include <drm/drm_dp_aux_bus.h>
>
>  #include "msm_drv.h"
>  #include "msm_kms.h"
> @@ -265,8 +266,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
>                 goto end;
>         }
>
> -       dp->dp_display.next_bridge = dp->parser->next_bridge;
> -
>         dp->aux->drm_dev = drm;
>         rc = dp_aux_register(dp->aux);
>         if (rc) {
> @@ -421,6 +420,11 @@ static void dp_display_host_init(struct dp_display_private *dp)
>                 dp->dp_display.connector_type, dp->core_initialized,
>                 dp->phy_initialized);
>
> +       if (dp->core_initialized) {
> +               DRM_DEBUG_DP("DP core already initialized\n");
> +               return;
> +       }
> +
>         dp_power_init(dp->power, false);
>         dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>         dp_aux_init(dp->aux);
> @@ -433,6 +437,11 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>                 dp->dp_display.connector_type, dp->core_initialized,
>                 dp->phy_initialized);
>
> +       if (!dp->core_initialized) {
> +               DRM_DEBUG_DP("DP core not initialized\n");
> +               return;
> +       }
> +
>         dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
>         dp_aux_deinit(dp->aux);
>         dp_power_deinit(dp->power);
> @@ -1502,7 +1511,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>
>         dp_hpd_event_setup(dp);
>
> -       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
> +       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
>  }
>
>  void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
> @@ -1524,6 +1533,52 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>         }
>  }
>
> +static int dp_display_get_next_bridge(struct msm_dp *dp)
> +{
> +       int rc = 0;

Drop initialization.

> +       struct dp_display_private *dp_priv;
> +       struct device_node *aux_bus;
> +       struct device *dev;
> +
> +       dp_priv = container_of(dp, struct dp_display_private, dp_display);
> +       dev = &dp_priv->pdev->dev;
> +       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> +
> +       if (aux_bus) {
> +               dp_display_host_init(dp_priv);
> +               dp_catalog_ctrl_hpd_config(dp_priv->catalog);
> +               enable_irq(dp_priv->irq);
> +               dp_display_host_phy_init(dp_priv);
> +
> +               devm_of_dp_aux_populate_ep_devices(dp_priv->aux);
> +
> +               disable_irq(dp_priv->irq);

Why do we disable irq?

> +       }

The aux_bus node leaked.

> +
> +       /*
> +        * External bridges are mandatory for eDP interfaces: one has to
> +        * provide at least an eDP panel (which gets wrapped into panel-bridge).
> +        *
> +        * For DisplayPort interfaces external bridges are optional, so
> +        * silently ignore an error if one is not present (-ENODEV).
> +        */
> +       rc = dp_parser_find_next_bridge(dp_priv->parser);
> +       if (rc == -ENODEV) {
> +               if (dp->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +                       DRM_ERROR("eDP: next bridge is not present\n");
> +                       return rc;
> +               }
> +       } else if (rc) {
> +               if (rc != -EPROBE_DEFER)
> +                       DRM_ERROR("DP: error parsing next bridge: %d\n", rc);
> +               return rc;
> +       }
> +
> +       dp->next_bridge = dp_priv->parser->next_bridge;
> +
> +       return 0;
> +}
> +
>  int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>                         struct drm_encoder *encoder)
>  {
> @@ -1547,6 +1602,10 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>
>         dp_display->encoder = encoder;
>
> +       ret = dp_display_get_next_bridge(dp_display);

Didn't we just move bridge attachment out of modeset? Why is it being
done here?

> +       if (ret)
> +               return ret;
> +
>         dp_display->bridge = dp_bridge_init(dp_display, dev, encoder);
>         if (IS_ERR(dp_display->bridge)) {
>                 ret = PTR_ERR(dp_display->bridge);
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 7ce1aca..5254bd6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -114,10 +114,12 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
>         bridge->funcs = &dp_bridge_ops;
>         bridge->type = dp_display->connector_type;
>
> -       bridge->ops =
> -               DRM_BRIDGE_OP_DETECT |
> -               DRM_BRIDGE_OP_HPD |
> -               DRM_BRIDGE_OP_MODES;
> +       if (bridge->type == DRM_MODE_CONNECTOR_DisplayPort) {

Why can't eDP have bridge ops that are the same?

> +               bridge->ops =
> +                       DRM_BRIDGE_OP_DETECT |
> +                       DRM_BRIDGE_OP_HPD |
> +                       DRM_BRIDGE_OP_MODES;
> +       }
>
>         rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>         if (rc) {
