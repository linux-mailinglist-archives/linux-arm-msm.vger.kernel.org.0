Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 583B07AC751
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Sep 2023 11:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjIXJeG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Sep 2023 05:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIXJeG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Sep 2023 05:34:06 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9730D3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 02:33:59 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d8181087dc9so5050738276.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 02:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695548039; x=1696152839; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kHH2nT1UzZYRScO9kjwwzj9/M7QjVis56Gg6U4ewg1s=;
        b=vYvOfq35YIYKM8QYQnXq/0E+2yCPat2jnqL1MoZytf20v+l7CuI3BAgkMTplUYQZOD
         /UQsa4lIKACCknpylzTLV5bUV7EeB8FC40DePulNUNa1knRYkwfGDVFQcDikFISRogYk
         hpmPJzB/X3R8qEf4eQ6p300pycAIBRpBkE+b+ttQKhdbFUkZGU6qVuEr2FiwU+QAn3++
         6sZSn4oyctbIboGOxYvSjkD2AxCoeUBlyPOuKURh5TKl5O74gX7nvSYRIpJz/hKp+KGM
         +eW4PZFBKVXBimfqQBtcl7yA/aDKALzernjPqI6I2D75az9nh2TF8tW/XvmV6y6opYGS
         viGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695548039; x=1696152839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHH2nT1UzZYRScO9kjwwzj9/M7QjVis56Gg6U4ewg1s=;
        b=aaYSaViBqojH9lMDcr9/5U6nEVIlWpNzK1YS79vO7t7TY0A6kFXptpMpKvw/HRoNlR
         Ia88UYODdeel58Va1IWpmBGg79uPGXttxkzOa/ZJiyn1SVGmG9pu6UjQlqRXXWKbcwSH
         rFaUlpNFK4ZTFCaQAh0xi8qZ5ng1tSDFjgFC8sOy7GAsf9pmqXzCRYTaxDjTl9y1kc9w
         caP1kBloRPTyfCjAAEf7CmcePg5G6ca5ijd0yi6xORPl3eVtAGSP76tiMirsmJCQrV+Z
         9106A19pKTWNbS+Ozcc6lwW40GMjVp+4EqaFavDQE4/8KufbjiimZhf5HYnQpGsuHqWQ
         2YNg==
X-Gm-Message-State: AOJu0Yxj93mSPWH2nnR8AGOp+/9E3aVMkScSi0QcZNyr4bpG/LkOHdRP
        un1ZwDqSp2dVkBDBXRgoaI+JnDrkRcTvRppfPdF2Pg==
X-Google-Smtp-Source: AGHT+IF1KO4KdnzBFi/BrVM3qc6nlsiamtIrO+y+KCxeRFCJb7bBZ4Nw8TZsXNuFdCCaFm3/UJiHt462fMrm2ydqK/o=
X-Received: by 2002:a0d:d103:0:b0:577:51cd:1b4a with SMTP id
 t3-20020a0dd103000000b0057751cd1b4amr4024641ywd.41.1695548038873; Sun, 24 Sep
 2023 02:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230924064159.14739-1-liuhaoran14@163.com>
In-Reply-To: <20230924064159.14739-1-liuhaoran14@163.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 24 Sep 2023 12:33:46 +0300
Message-ID: <CAA8EJpq9x5RY05cKzq7MoMzdKRBkj3y_Hy3gpmKfZVMqK123ow@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp4: Add error handling in mdp4_lvds_connector_init()
To:     liuhaoran <liuhaoran14@163.com>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, airlied@gmail.com,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 24 Sept 2023 at 09:42, liuhaoran <liuhaoran14@163.com> wrote:
>
> This patch adds error-handling for the drm_connector_init() and
> drm_connector_attach_encoder inside the mdp4_lvds_connector_init().
>
> Signed-off-by: liuhaoran <liuhaoran14@163.com>

As pointed out by the kernel robot, this was not even compile tested.
So NAK. Please use proper casts for error returns.

> ---
>  .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> index 7444b75c4215..62eb363ba90f 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> @@ -96,6 +96,7 @@ struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
>  {
>         struct drm_connector *connector = NULL;
>         struct mdp4_lvds_connector *mdp4_lvds_connector;
> +       int ret;
>
>         mdp4_lvds_connector = kzalloc(sizeof(*mdp4_lvds_connector), GFP_KERNEL);
>         if (!mdp4_lvds_connector)
> @@ -106,8 +107,12 @@ struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
>
>         connector = &mdp4_lvds_connector->base;
>
> -       drm_connector_init(dev, connector, &mdp4_lvds_connector_funcs,
> -                       DRM_MODE_CONNECTOR_LVDS);
> +       ret = drm_connector_init(dev, connector, &mdp4_lvds_connector_funcs,
> +                                DRM_MODE_CONNECTOR_LVDS);
> +
> +       if (ret)
> +               return ret;
> +
>         drm_connector_helper_add(connector, &mdp4_lvds_connector_helper_funcs);
>
>         connector->polled = 0;
> @@ -115,7 +120,10 @@ struct drm_connector *mdp4_lvds_connector_init(struct drm_device *dev,
>         connector->interlace_allowed = 0;
>         connector->doublescan_allowed = 0;
>
> -       drm_connector_attach_encoder(connector, encoder);
> +       ret = drm_connector_attach_encoder(connector, encoder);
> +
> +       if (ret)
> +               return ret;
>
>         return connector;
>  }
> --
> 2.17.1
>


-- 
With best wishes
Dmitry
