Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1204BC397
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 01:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240437AbiBSApR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 19:45:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239618AbiBSApQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 19:45:16 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA7C222E2B5
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 16:44:58 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id p9so18622696ejd.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 16:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MGHwoQoxInpR0HuivERFqQnJ/YDdnM3tfc/vI2kgqZ0=;
        b=L+32DakSO8c8K7dQaYC2mtIW9t6DJ7J7BcXCm5xHqMTTEj6M8Cimt10zk9POL68FNO
         3aoz7cOkrOtyIke8YwmdlQhiVzqZGXGgtb4l6LUYLXsVYSlXCNKXLnTIvzEWBa6N2DWV
         iUpQ2/xuPrntHC/2N9lgLUM820GNGSeYE8wsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MGHwoQoxInpR0HuivERFqQnJ/YDdnM3tfc/vI2kgqZ0=;
        b=AQIrcYKmEXyyw6nc/U4znahNYR5BGpyzd5ebAZO0hhmhVcdu8cNWcGZ+hdyCTJ3o1D
         RhMXp0c1iE52e4dx8cE/wP0uv4OfuT8MKYaZE0zDgTocS7EW2Oq8YhY2lGhvEP0V2dO8
         NqfZLlRVQrhnxYje3bXcybN7321hkfsGM2Uj3LeKAdIj2mFYC1vMOZdU8IFYRpLevh17
         /S+gisoDkUycLFhz4/Su+GGPMXyTfjSWAswPvEDW9PzSIdzBk/ut13CVslQRh06lHFLu
         RnYWLqMSmtbhaZzx+3dhx36VKiRxVvkP/JoBR8USZyZN7X11X5i0PjEqRUi4sDikdUXJ
         zJRA==
X-Gm-Message-State: AOAM532LhoYX3kS9RtCjYGIujLr+JTYGTH2qFTmcZf6RHXEDsujFxfQv
        X2Gag+EC3d/opKetc2GP2ZlLPM+BGPDQWwU4RiI=
X-Google-Smtp-Source: ABdhPJxNw/ztuu3WUIKOlLFtIDLur6/2Zf6dzQXH0B1Z15zUZKqW/tqT01XN5Z+9fsVXYGCyEL3a6w==
X-Received: by 2002:a17:907:8a04:b0:6b7:ebf1:efbe with SMTP id sc4-20020a1709078a0400b006b7ebf1efbemr8022532ejc.488.1645231496910;
        Fri, 18 Feb 2022 16:44:56 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id r5sm2696292ejy.51.2022.02.18.16.44.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 16:44:55 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id v12so17161631wrv.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 16:44:54 -0800 (PST)
X-Received: by 2002:a5d:64ef:0:b0:1e3:1e05:d042 with SMTP id
 g15-20020a5d64ef000000b001e31e05d042mr7524925wri.679.1645231494092; Fri, 18
 Feb 2022 16:44:54 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com> <1644494255-6632-6-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1644494255-6632-6-git-send-email-quic_sbillaka@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 18 Feb 2022 16:44:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WkjZr2vwo42rP7Ou_UP_CSoC=sGY08+pFHY_aVfN_Vhg@mail.gmail.com>
Message-ID: <CAD=FV=WkjZr2vwo42rP7Ou_UP_CSoC=sGY08+pFHY_aVfN_Vhg@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] drm/msm/dp: Add driver support to utilize drm panel
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, quic_kalyant@quicinc.com,
        quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
        quic_mkrishn@quicinc.com, quic_vproddut@quicinc.com,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Feb 10, 2022 at 3:58 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Add support in the DP driver to utilize the custom eDP panels
> from drm/panels.
>
> An eDP panel is always connected to the platform. So, the eDP
> connector can be reported as always connected. The display mode
> will be sourced from the panel. The panel mode will be set after
> the link training is completed.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>
> Changes in v4:
>   - Remove obvious comments
>   - Define separate connector_ops for eDP
>   - Remove unnecessary checks
>
> Changes in v3:
>   None
>
>  drivers/gpu/drm/msm/dp/dp_display.c |  6 ++++
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 62 +++++++++++++++++++++++++++++++------
>  drivers/gpu/drm/msm/dp/dp_parser.h  |  3 ++
>  3 files changed, 61 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7cc4d21..5d314e6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1513,6 +1513,9 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>                 return -EINVAL;
>         }
>
> +       if (dp->connector_type == DRM_MODE_CONNECTOR_eDP)
> +               dp_hpd_plug_handle(dp_display, 0);

I'm really not so sure here. You're just totally ignoring the HPD
signal here which isn't right at all. The HPD signal is important for
knowing if an edp panel is ready yet so you can't just ignore it. The
only way this could work is if something else turns the panel on w/
plenty of time before your code runs so it has had time to get
ready...

It feels like we just need to work to get this all plumbed up properly
with the right power sequencing. That'll also allow us to enable the
generic edp-panel stuff...


> +static int edp_connector_get_modes(struct drm_connector *connector)
> +{
> +       struct msm_dp *dp;
> +
> +       dp = to_dp_connector(connector)->dp_display;
> +
> +       return drm_bridge_get_modes(dp->panel_bridge, connector);
> +}
> +
> +static enum drm_mode_status edp_connector_mode_valid(
> +               struct drm_connector *connector,
> +               struct drm_display_mode *mode)
> +{
> +       if (mode->clock > EDP_MAX_PIXEL_CLK_KHZ)
> +               return MODE_CLOCK_HIGH;
> +
> +       return MODE_OK;
> +}
> +
>  static const struct drm_connector_funcs dp_connector_funcs = {
>         .detect = dp_connector_detect,
>         .fill_modes = drm_helper_probe_single_connector_modes,
> @@ -132,11 +151,24 @@ static const struct drm_connector_funcs dp_connector_funcs = {
>         .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>
> +static const struct drm_connector_funcs edp_connector_funcs = {
> +       .fill_modes = drm_helper_probe_single_connector_modes,
> +       .destroy = drm_connector_cleanup,
> +       .reset = drm_atomic_helper_connector_reset,
> +       .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
>  static const struct drm_connector_helper_funcs dp_connector_helper_funcs = {
>         .get_modes = dp_connector_get_modes,
>         .mode_valid = dp_connector_mode_valid,
>  };
>
> +static const struct drm_connector_helper_funcs edp_connector_helper_funcs = {
> +       .get_modes = edp_connector_get_modes,
> +       .mode_valid = edp_connector_mode_valid,
> +};
> +
>  /* connector initialization */
>  struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>  {
> @@ -154,18 +186,28 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>
>         connector = &dp_connector->base;
>
> -       ret = drm_connector_init(dp_display->drm_dev, connector,
> -                       &dp_connector_funcs,
> -                       dp_display->connector_type);
> -       if (ret)
> -               return ERR_PTR(ret);
> +       if (dp_display->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +               ret = drm_connector_init(dp_display->drm_dev, connector,
> +                               &edp_connector_funcs, DRM_MODE_CONNECTOR_eDP);
> +               if (ret)
> +                       return ERR_PTR(ret);
> +
> +               drm_connector_helper_add(connector,
> +                               &edp_connector_helper_funcs);
> +       } else {
> +               ret = drm_connector_init(dp_display->drm_dev, connector,
> +                               &dp_connector_funcs,
> +                               DRM_MODE_CONNECTOR_DisplayPort);
> +               if (ret)
> +                       return ERR_PTR(ret);
>
> -       drm_connector_helper_add(connector, &dp_connector_helper_funcs);
> +               drm_connector_helper_add(connector, &dp_connector_helper_funcs);

This is probably not the correct way to do this. Drivers like this
should really be moving _away_ from creating their own connectors. The
idea is that you should just be creating bridges and then someone
creates a "bridge connector" that implements the connector functions
atop the bridge.

This is what Dmitry is working on [1]. Speaking of which, he really
ought to be CCed on all your patches.


> -       /*
> -        * Enable HPD to let hpd event is handled when cable is connected.
> -        */
> -       connector->polled = DRM_CONNECTOR_POLL_HPD;
> +               /*
> +                * Enable HPD to let hpd event is handled when cable is connected.
> +                */
> +               connector->polled = DRM_CONNECTOR_POLL_HPD;
> +       }
>
>         drm_connector_attach_encoder(connector, dp_display->encoder);
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 3172da0..58c4f27 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -17,6 +17,9 @@
>  #define DP_MAX_PIXEL_CLK_KHZ   675000
>  #define DP_MAX_NUM_DP_LANES    4
>
> +/* Maximum validated clock */
> +#define EDP_MAX_PIXEL_CLK_KHZ  285550

As discussed out-of-band, this isn't my favorite define. The datasheet
for sc7280, which is what you're testing on / targeting, claims to
support higher rates. Other users of this driver also ought to support
higher rates. It might be OK short term, but it's definitely not a
good long term solution.

[1] https://lore.kernel.org/all/20220211224006.1797846-5-dmitry.baryshkov@linaro.org/
