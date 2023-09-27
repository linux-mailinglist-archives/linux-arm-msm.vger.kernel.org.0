Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 097367B0DF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Sep 2023 23:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjI0VTD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Sep 2023 17:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbjI0VTA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Sep 2023 17:19:00 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCFE211F
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 14:18:57 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-59e77e4f707so148350037b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 14:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695849536; x=1696454336; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UiA24Vnoe9mDlXFXQmDQoe2D01RtP5rHlDPFXWiZnis=;
        b=ttM3Al7pUoQkeKdTct1F1IMNr2Ar5gNr0ttE6KExq7MQzOIjjLUSSiCW+GJrnQZ67O
         nXDk8tBDX4JHLiaiKyGOCq4582bTakP0IvT6mNCFAXy9QQr9Ya71bpeh9N4dm5MoNJdf
         lLBqkYvjaqjFhL2hHBUxYZ32Dp1GWzdMbPk6TSWjxYOf4YGQ3KoSssImO7SzvOb3t63e
         1BwsN4kya3jzJ2VbYZ880ysNutgNGeIS9JYOAILtcdzmxrf6PFEoQlrRzXfLLrwLsV3P
         ZR8hQsUBZy25yqEut61VEzLIxHXjcXwaivUCgS0DdSfwWsgXm1dKIpo6Uw0378QL9LMh
         eCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695849536; x=1696454336;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiA24Vnoe9mDlXFXQmDQoe2D01RtP5rHlDPFXWiZnis=;
        b=cbUGwLokbSrX6m7iabOdUhl3HwKQF/EtJO+lKsGZTWUY2e40qVPBIOiDnPKokbogGu
         D3XuyoTYl3V62HcvVN0kusIS/Jod/4i/JitTp2VBX/hiWqZM7ayZtPng5/kItgRpYlMH
         QmG2eEau23Hq3nzY9GQc1pdqXV87+97RgPZT/ExDvzhSLDArx3//KyIYZsvPZKBmyudk
         wr3YBpAxDktTmp/AYpsrhm0jwtAwJaUXBJSCpvCUtOPJqkYm6tojRWZrgVsyE1fKVIc4
         IxyoNjOgkAAG/nyM4Q2W+sCitciG5LJm4vGYhnegPeFb0MQsmmC4OeugX9AO5RyJrTJu
         CFOw==
X-Gm-Message-State: AOJu0Yz4h6JUJMdjyPzFYGM8JDZ6vfr/b+d/+0p9G+6uc95zjvO0BMJm
        7tZx5gKhHV7JoXiCq/CPiveBuvJhOEG2BLxXvhN2bw==
X-Google-Smtp-Source: AGHT+IG1QuRlqd5WUg5LSq9Sa+2WG3+pH9aEWm6KmPW4M8nLweQkVnYD51xD/qDJ9L+z4gIuMfCpNnkLCGu0v7Z3tZY=
X-Received: by 2002:a81:6f03:0:b0:59f:773a:b14c with SMTP id
 k3-20020a816f03000000b0059f773ab14cmr3251803ywc.37.1695849536678; Wed, 27 Sep
 2023 14:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com> <1695848028-18023-5-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1695848028-18023-5-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 28 Sep 2023 00:17:50 +0300
Message-ID: <CAA8EJpqwDOPD3dkWO1ap2pjMVnP1r2giUE0bAjTYzPBiz1aewA@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] drm/msm/dp: move parser->parse() and
 dp_power_client_init() to probe
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
> Move parser->parse() and dp_power_client_init() from dp_display_bind()
> to dp_display_probe() in preparation of adding pm_runtime framework
> at next patch.
>
> Changes in v4:
> -- split this patch out of "incorporate pm_runtime framework into DP driver" patch
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7ae3b8b..3ef141c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -276,11 +276,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
>         dp->dp_display.drm_dev = drm;
>         priv->dp[dp->id] = &dp->dp_display;
>
> -       rc = dp->parser->parse(dp->parser);
> -       if (rc) {
> -               DRM_ERROR("device tree parsing failed\n");
> -               goto end;
> -       }
>
>
>         dp->drm_dev = drm;
> @@ -291,11 +286,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
>                 goto end;
>         }
>
> -       rc = dp_power_client_init(dp->power);
> -       if (rc) {
> -               DRM_ERROR("Power client create failed\n");
> -               goto end;
> -       }
>
>         rc = dp_register_audio_driver(dev, dp->audio);
>         if (rc) {
> @@ -1249,6 +1239,18 @@ static int dp_display_probe(struct platform_device *pdev)
>                 return -EPROBE_DEFER;
>         }
>
> +       rc = dp->parser->parse(dp->parser);
> +       if (rc) {
> +               DRM_ERROR("device tree parsing failed\n");
> +               return -EPROBE_DEFER;
> +       }
> +
> +       rc = dp_power_client_init(dp->power);
> +       if (rc) {
> +               DRM_ERROR("Power client create failed\n");
> +               return -EPROBE_DEFER;
> +       }

Hit enter too soon. No submodules teardown, so NAK.

Also please propagate returned error codes instead of inventing
EPROBE_DEFER on your own.

> +
>         /* setup event q */
>         mutex_init(&dp->event_mutex);
>         init_waitqueue_head(&dp->event_q);
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
