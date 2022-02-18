Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0483F4BC316
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 00:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239837AbiBRX5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 18:57:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235407AbiBRX5O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 18:57:14 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198E25B3E2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 15:56:55 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id y7so4812229oih.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 15:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=haJuFFTFpK8hEVGyrQHNZT48/0gIUU8knpfQcqZph0U=;
        b=doa6V5p8QeWkqR4Q5ZT2DQZYInLatLb4EV+ktRjUzUFW/Niipkg0hJz3nSMMhAEvwd
         feyZ4nSc/Z91e6nxX6Hk+V+Zn5qvO6h05AKrOeD3FD8d+2ce4yJ4tojYpOxYwa+Yg9Pl
         3tEUFCcZtYSB2hl1ciNo+OLvSasKPesX+0NlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=haJuFFTFpK8hEVGyrQHNZT48/0gIUU8knpfQcqZph0U=;
        b=eQn/glIQVR77+KmKeq4i2IJpGf0oHJ3Z5RpHd1fTVFU0f9y/TaCiNLQ9BpYkuTJmrL
         awgUUHr5VZBZmFOzwPSuvWOJSvAkhW5QsqYGKWCzJcVyZ5u61GN9wJbZee8D7GrA6lKj
         G9YxK+MFXkd/Ik07/EGMqgxHudsBPgUk85Lxfum4UgXPwb6oujAYCM1P92OtAYwKrllz
         itEXvxNxTVyBUN1JAtRsVNuyQoT+QQWliqziIQoFBUWdit3rYPULV4AhdCwztnp8CBna
         lYFlXz8MMJYTOknTxDkSJgfYt+OdW2YVrbnErGlxoSqPKbodQ3s+iNG9OkNgcolP6572
         +ApQ==
X-Gm-Message-State: AOAM530hga5E+NtnpRfXj8m2c6OPUD4gTAr9Vb2k26qT2MoyAZH3dX5i
        CW8y4bmfBNSv/BhdpO/H83pYRKMSusfbDIX6IHaIbg==
X-Google-Smtp-Source: ABdhPJycjVhIt7LaJC6nw+2gP/RssZ5zR7b6sFNM/Q/O18LuQGxLRPdyc01dAmOYShVxdMIldPKkbH4O0zTKx4U/UuA=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr6100266oig.40.1645228614405; Fri, 18
 Feb 2022 15:56:54 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 15:56:53 -0800
MIME-Version: 1.0
In-Reply-To: <20220211224006.1797846-2-dmitry.baryshkov@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org> <20220211224006.1797846-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 18 Feb 2022 15:56:53 -0800
Message-ID: <CAE-0n52iHFtHppZj-g0V1UP5oWzXjbNDjpOd-hgR+F=TqFzjVg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/5] drm/msm/dp: fix panel bridge attachment
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-11 14:40:02)
> In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
> enable and disable") the DP driver received a drm_bridge instance, which
> is always attached to the encoder as a root bridge. However it conflicts
> with the panel_bridge support for eDP panels. The panel bridge attaches
> to the encoder before the "dp" bridge has a chace to do so. Change

s/chace/chance/

> panel_bridge attachment to come after dp_bridge attachment.

s/panel_bridge/panel bridge/ possibly? And maybe clarify that dp_bridge
is the "DP driver's drm_bridge instance created in
msm_dp_bridge_init()"?

My understanding is that we want to pass the bridge created in
msm_dp_bridge_init() as the 'previous' bridge so that it attaches the
panel bridge to the output of the DP bridge that's attached to the
encoder.

>
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  drivers/gpu/drm/msm/dp/dp_drm.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index d4d360d19eba..26ef41a4c1b6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -169,16 +169,6 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>
>         drm_connector_attach_encoder(connector, dp_display->encoder);
>
> -       if (dp_display->panel_bridge) {
> -               ret = drm_bridge_attach(dp_display->encoder,
> -                                       dp_display->panel_bridge, NULL,
> -                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> -               if (ret < 0) {
> -                       DRM_ERROR("failed to attach panel bridge: %d\n", ret);
> -                       return ERR_PTR(ret);
> -               }
> -       }
> -
>         return connector;
>  }
>
> @@ -246,5 +236,16 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
>                 return ERR_PTR(rc);
>         }
>
> +       if (dp_display->panel_bridge) {
> +               rc = drm_bridge_attach(dp_display->encoder,
> +                                       dp_display->panel_bridge, bridge,
> +                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +               if (rc < 0) {
> +                       DRM_ERROR("failed to attach panel bridge: %d\n", rc);
> +                       drm_bridge_remove(bridge);
> +                       return ERR_PTR(rc);
> +               }
> +       }
> +
>         return bridge;

Not a problem with this patch, but what is this pointer used for? I see
it's assigned to priv->bridges and num_bridges is incremented but nobody
seems to look at that.
