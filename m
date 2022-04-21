Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8841150A3F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 17:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390022AbiDUP0N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 11:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390021AbiDUP0M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 11:26:12 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5F040A1A
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 08:23:22 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id g13so10792694ejb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e2qYFYu6NyJpi225C8WnZCw8hzgNqZ3b2idUeLWDl6E=;
        b=T72udbyPW1VL0ZRokeN2lVKk3WmrP25bUUbwuR1yQnvwLB9IKLveCQxYQaPiAtb23v
         G2F4yUKDMn/rihEoo3k0eVGpN3867P45pzCTx9T+LCW/SnfTrsvNyCiSIgzbqaZb+xHW
         my2utY+f/CJ/ShNW34MbXTj9YkokSsMPlgEo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e2qYFYu6NyJpi225C8WnZCw8hzgNqZ3b2idUeLWDl6E=;
        b=JmTdfJMVU69prso9vlYqEqqP5bzrC1t6hWkh0VParwlwDQdwVMKMuUYh9gFXTIxtut
         7VT8R5zhwFKuXmUsn2nvJy/L09Qf+1Rc1xoaQsWLG4G+DtSGEpeK4MpzBHkOuHKs/20L
         fV/0IiCWee4g/F5jEBXzAlNyeOOkWJye3YBl4u/WNBOpAWIdLc85zgrlWm5CW9NdBegg
         MoRCJIdwEW7irVFSTGz0Y2OyryZi9borQWZIuBtbxQXPAcmjnc57Z2sn/EalpLHoQSCI
         I3BboUolDahUB6sR+96BlF3jxu5inHplJtrs2YzCCKXpGUfyipYG/EyGpjykLfITRFjo
         SUAA==
X-Gm-Message-State: AOAM531S4f3QkRbtYWX3XJ4W/T6olWhjoh0BPsmIjnUOTWhzH+Re9JhG
        vq/xErBXG1l12+yAXnbzXnEeKP8vjgdaw9m0
X-Google-Smtp-Source: ABdhPJxx1dne7HxPSMFuVnvtsN0j0KSxpWlUq/vrCuFBVF25H7i70rh3VbKYbaKWWx6b9Gh4347kbg==
X-Received: by 2002:a17:907:980d:b0:6d6:f910:513a with SMTP id ji13-20020a170907980d00b006d6f910513amr11569ejc.643.1650554600492;
        Thu, 21 Apr 2022 08:23:20 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id ec40-20020a0564020d6800b00420916b32c9sm11914333edb.59.2022.04.21.08.23.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 08:23:19 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id bv16so7157513wrb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 08:23:19 -0700 (PDT)
X-Received: by 2002:adf:dbc3:0:b0:20a:88bf:6d83 with SMTP id
 e3-20020adfdbc3000000b0020a88bf6d83mr187757wrj.301.1650554598823; Thu, 21 Apr
 2022 08:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <1650551811-24319-1-git-send-email-quic_sbillaka@quicinc.com> <1650551811-24319-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1650551811-24319-2-git-send-email-quic_sbillaka@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 21 Apr 2022 08:23:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ug-ZRiMrVyVH+OT1fMhyUnAixP2FfWKTQpLZXka0U_=g@mail.gmail.com>
Message-ID: <CAD=FV=Ug-ZRiMrVyVH+OT1fMhyUnAixP2FfWKTQpLZXka0U_=g@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] drm/msm/dp: Add eDP support via aux_bus
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 21, 2022 at 7:37 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> @@ -1530,6 +1532,61 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>         }
>  }
>
> +static int dp_display_get_next_bridge(struct msm_dp *dp)
> +{
> +       int rc;
> +       struct dp_display_private *dp_priv;
> +       struct device_node *aux_bus;
> +       struct device *dev;
> +
> +       dp_priv = container_of(dp, struct dp_display_private, dp_display);
> +       dev = &dp_priv->pdev->dev;
> +       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> +
> +       if (aux_bus && dp->is_edp) {
> +               dp_display_host_init(dp_priv);
> +               dp_catalog_ctrl_hpd_config(dp_priv->catalog);
> +               dp_display_host_phy_init(dp_priv);
> +               enable_irq(dp_priv->irq);
> +
> +               rc = devm_of_dp_aux_populate_ep_devices(dp_priv->aux);

I think a comment was requested above that line saying something like:

/*
 * The code below assumes that the panel will finish probing
 * by the time devm_of_dp_aux_populate_ep_devices() returns.
 * This isn't a great assumption since it will fail if the
 * panel driver is probed asynchronously but is the best we
 * can do without a bigger driver reorganization.
 */


> +               of_node_put(aux_bus);
> +               if (rc)
> +                       goto edp_error;
> +       } else if (dp->is_edp) {
> +               DRM_ERROR("eDP aux_bus not found\n");
> +               rc = -ENODEV;
> +               goto error;

This goto doesn't add much. Just leave the above like it was in v7.
return -ENODEV w/ no goto.


> +       }
> +
> +       /*
> +        * External bridges are mandatory for eDP interfaces: one has to
> +        * provide at least an eDP panel (which gets wrapped into panel-bridge).
> +        *
> +        * For DisplayPort interfaces external bridges are optional, so
> +        * silently ignore an error if one is not present (-ENODEV).
> +        */
> +       rc = dp_parser_find_next_bridge(dp_priv->parser);
> +       if (rc && dp->is_edp) {
> +               DRM_ERROR("eDP: cannot find the next bridge, rc = %d\n", rc);
> +               goto edp_error;
> +       } else if (rc && rc != -ENODEV) {
> +               DRM_ERROR("DP: cannot find the next bridge, rc = %d\n", rc);
> +               goto error;
> +       }

The above wouldn't be my favorite way of doing this. Instead, I would
have written:

  if (rc) {
    DRM_ERROR("Cannot find the next bridge, rc = %d\n", rc);
    goto err;
  }
  ...

err:
  if (dp->is_edp) {
    disable_irq(...);
    dp_display_host_phy_exit(...);
    dp_display_host_deinit(...);
  }
  return rc;

> +
> +       dp->next_bridge = dp_priv->parser->next_bridge;
> +
> +       return 0;
> +
> +edp_error:
> +       disable_irq(dp_priv->irq);
> +       dp_display_host_phy_exit(dp_priv);
> +       dp_display_host_deinit(dp_priv);
> +error:
> +       return rc;
> +}
> +
>  int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>                         struct drm_encoder *encoder)
>  {

With the above fixes, I'd be happy enough for my Reviewed-by tag with
the expectation that continued work will happen to continue cleaning
this up.


-Doug
