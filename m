Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9830D7B0E69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Sep 2023 23:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjI0V6r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Sep 2023 17:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjI0V6q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Sep 2023 17:58:46 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E23FB
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 14:58:44 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-59b5484fbe6so151050557b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 14:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695851924; x=1696456724; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dvF9W1ErITaOMys+IDecl96mfOAXYvT0MYR7ZC5tRE4=;
        b=ZFUkytFg0doafqRvdWYsGuDVt5GDlsC5xjT4KY5WkY2UjYrnfClQDI/EMLOJGTMgOh
         Mrpc27q4fXVL/kNAdddp61/jzs+lfna4shquLIM+VZQSFL6QeBNMWB/k7HdH9pqUNGVW
         OnWjBurQzdzI5sDEGYMW82TOVI2KidvvO3J/BrLUmFgJlVTlv+2pQu7KyE9hkwvxO5oU
         GvDrBgiwiJd2gkhI4CuxcLLckPQLoonatURRntQ1AqfUJR2PT4mJuZ5hYraz+4uSPmGM
         IlF0hLfwZ8mkQAQNGXK+W86Ico2i2F80w8r/QMr3+L5Krj57KQRpuyrD5t51wvcSrL7Z
         W/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695851924; x=1696456724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvF9W1ErITaOMys+IDecl96mfOAXYvT0MYR7ZC5tRE4=;
        b=B3Q36P/DIcocuT21aOZvzdoek2+vCvtexKqKa5k1F2uMPOvyNjY9w3BPgjX5tBwgkJ
         giqFee2opXOaZwYMlu2A728yxZ23U6wpgEYjEHgKfWcMXQIEOw5CAsQ6eBHJmxzgoh7J
         KYapgDnMe+pxNuY6EuZkoNBJ3g0YPAZBFP0QYZLnmaGZZ1p5BNyQF8lYrXxKjmc3V3H1
         z1wVTJa5CQNscb/To46wUwy/pQiknhKDcVF9xV3Ot9op4dOlwOvPRz2m69n9TqCdD2eH
         aYQsmsifmRQSTODE7oa7esLqjvQEDyjbwQ+tuKaSUXIUY4KfZUyPTKhzlbO3HKihYqIT
         k3Dw==
X-Gm-Message-State: AOJu0YwDv8SV7zwpgawebxJ0tvUXVmFKJHQbrLkVOznAz7exNUiDWv1i
        MWvZtjW04+V1XzP1HG2m/+YsKhOqFvEyKNkpfWTUSg==
X-Google-Smtp-Source: AGHT+IFKnOWnEIM2K/W/OiA1WgTqcehbFbA3ere2WHmhLtVm3B9r+lEpABptb633TsklLxK0BqjED1hqU5cIcgB2yMQ=
X-Received: by 2002:a0d:d903:0:b0:59b:eab8:7ac6 with SMTP id
 b3-20020a0dd903000000b0059beab87ac6mr3791817ywe.42.1695851923986; Wed, 27 Sep
 2023 14:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com> <1695848028-18023-9-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1695848028-18023-9-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 28 Sep 2023 00:57:33 +0300
Message-ID: <CAA8EJprfjt7w+3YJAieBabuMso=-obRXss7-9Jrif23WmOJw5w@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org, quic_abhinavk@quicinc.com,
        quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
        marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 27 Sept 2023 at 23:54, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Currently eDP population is done at msm_dp_modeset_init() which happen
> at binding time. Move eDP population to be done at display probe time
> so that probe deferral cases can be handled effectively.
> wait_for_hpd_asserted callback is added during drm_dp_aux_init()
> to ensure eDP's HPD is up before proceeding eDP population.
>
> Changes in v4:
> -- delete duplicate initialize code to dp_aux before drm_dp_aux_register()
> -- delete of_get_child_by_name(dev->of_node, "aux-bus") and inline the function
> -- not initialize rc = 0
>
> Changes in v3:
> -- add done_probing callback into devm_of_dp_aux_populate_bus()
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 34 ++++++++++++++----
>  drivers/gpu/drm/msm/dp/dp_display.c | 69 ++++++++++++++++++-------------------
>  2 files changed, 60 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 22eb774..425b5c5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -480,7 +480,6 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux)
>
>  int dp_aux_register(struct drm_dp_aux *dp_aux)
>  {
> -       struct dp_aux_private *aux;
>         int ret;
>
>         if (!dp_aux) {
> @@ -488,12 +487,7 @@ int dp_aux_register(struct drm_dp_aux *dp_aux)
>                 return -EINVAL;
>         }
>
> -       aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> -
> -       aux->dp_aux.name = "dpu_dp_aux";
> -       aux->dp_aux.dev = aux->dev;
> -       aux->dp_aux.transfer = dp_aux_transfer;
> -       ret = drm_dp_aux_register(&aux->dp_aux);
> +       ret = drm_dp_aux_register(dp_aux);
>         if (ret) {
>                 DRM_ERROR("%s: failed to register drm aux: %d\n", __func__,
>                                 ret);
> @@ -508,6 +502,21 @@ void dp_aux_unregister(struct drm_dp_aux *dp_aux)
>         drm_dp_aux_unregister(dp_aux);
>  }
>
> +static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
> +                                unsigned long wait_us)
> +{
> +       int ret;
> +       struct dp_aux_private *aux;
> +
> +       aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> +
> +       pm_runtime_get_sync(aux->dev);
> +       ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
> +       pm_runtime_put_sync(aux->dev);

Ok, so here you have used put_sync instead of autosuspend. Can we have
some uniformity? (I'd prefer to see put_sync or just put everywhere)

> +
> +       return ret;
> +}
> +
>  struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
>                               bool is_edp)
>  {
> @@ -531,6 +540,17 @@ struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
>         aux->catalog = catalog;
>         aux->retry_cnt = 0;
>
> +       /*
> +        * Use the drm_dp_aux_init() to use the aux adapter
> +        * before registering aux with the DRM device so that
> +        * msm edp panel can be detected by generic_dep_panel_probe().

eDP, AUX, generic_edp_panel_probe().

> +        */
> +       aux->dp_aux.name = "dpu_dp_aux";
> +       aux->dp_aux.dev = dev;
> +       aux->dp_aux.transfer = dp_aux_transfer;
> +       aux->dp_aux.wait_hpd_asserted = dp_wait_hpd_asserted;
> +       drm_dp_aux_init(&aux->dp_aux);
> +
>         return &aux->dp_aux;
>  }
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 711d262..9a2b403 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1203,6 +1203,28 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
>         return NULL;
>  }
>
> +static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
> +{
> +       int rc;
> +
> +       rc = component_add(aux->dev, &dp_display_comp_ops);
> +       if (rc)
> +               DRM_ERROR("eDP component add failed, rc=%d\n", rc);

drop.

> +
> +       return rc;
> +}
> +
> +static inline int dp_display_auxbus_population(struct dp_display_private *dp)

It's not `population`. It is just `populate`.

Also please inline this function.


> +{
> +       int ret;
> +
> +       ret = devm_of_dp_aux_populate_bus(dp->aux, dp_auxbus_done_probe);
> +       if (ret == -ENODEV)
> +               DRM_ERROR("aux-bus not found\n");
> +
> +       return ret;
> +}
> +
>  static int dp_display_probe(struct platform_device *pdev)
>  {
>         int rc = 0;
> @@ -1271,10 +1293,16 @@ static int dp_display_probe(struct platform_device *pdev)
>         if (rc)
>                 return rc;
>
> -       rc = component_add(&pdev->dev, &dp_display_comp_ops);
> -       if (rc) {
> -               DRM_ERROR("component add failed, rc=%d\n", rc);
> -               dp_display_deinit_sub_modules(dp);
> +       if (dp->dp_display.is_edp) {
> +               rc = dp_display_auxbus_population(dp);
> +               if (rc)
> +                       DRM_ERROR("eDP auxbus population failed, rc=%d\n", rc);
> +       } else {
> +               rc = component_add(&pdev->dev, &dp_display_comp_ops);
> +               if (rc) {
> +                       DRM_ERROR("component add failed, rc=%d\n", rc);
> +                       dp_display_deinit_sub_modules(dp);
> +               }
>         }
>
>         return rc;
> @@ -1285,8 +1313,6 @@ static int dp_display_remove(struct platform_device *pdev)
>         struct dp_display_private *dp = dev_get_dp_display_private(&pdev->dev);
>
>         component_del(&pdev->dev, &dp_display_comp_ops);
> -       dp_display_deinit_sub_modules(dp);
> -
>         platform_set_drvdata(pdev, NULL);
>
>         dp_display_deinit_sub_modules(dp);
> @@ -1385,29 +1411,8 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>  {
>         int rc;
>         struct dp_display_private *dp_priv;
> -       struct device_node *aux_bus;
> -       struct device *dev;
>
>         dp_priv = container_of(dp, struct dp_display_private, dp_display);
> -       dev = &dp_priv->pdev->dev;
> -       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> -
> -       if (aux_bus && dp->is_edp) {
> -               /*
> -                * The code below assumes that the panel will finish probing
> -                * by the time devm_of_dp_aux_populate_ep_devices() returns.
> -                * This isn't a great assumption since it will fail if the
> -                * panel driver is probed asynchronously but is the best we
> -                * can do without a bigger driver reorganization.
> -                */
> -               rc = of_dp_aux_populate_bus(dp_priv->aux, NULL);
> -               of_node_put(aux_bus);
> -               if (rc)
> -                       goto error;
> -       } else if (dp->is_edp) {
> -               DRM_ERROR("eDP aux_bus not found\n");
> -               return -ENODEV;
> -       }
>
>         /*
>          * External bridges are mandatory for eDP interfaces: one has to
> @@ -1420,17 +1425,9 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>         if (!dp->is_edp && rc == -ENODEV)
>                 return 0;
>
> -       if (!rc) {
> +       if (!rc)
>                 dp->next_bridge = dp_priv->parser->next_bridge;
> -               return 0;
> -       }
>
> -error:
> -       if (dp->is_edp) {
> -               of_dp_aux_depopulate_bus(dp_priv->aux);
> -               dp_display_host_phy_exit(dp_priv);
> -               dp_display_host_deinit(dp_priv);
> -       }
>         return rc;
>  }
>
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
