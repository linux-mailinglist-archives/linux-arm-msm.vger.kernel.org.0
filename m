Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D3C1C4DB7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 07:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgEEFoU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 01:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgEEFoU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 01:44:20 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17EB4C061A10
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2020 22:44:20 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id fu13so536031pjb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2020 22:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=OFyVgPW92xjeHjZOe3d3BTj75xEysQbpF9I3kxPup5I=;
        b=fqcQe4nTEPPqqUKFm8/irKkoCtCZhv5uz7tbiq6X/lrL0rbErtDlV6Z9fIJnnyHTbb
         WXKN028/CTSLOnK0pv+DU+ZH1xDdlXzRTO0xHKOYyaPVcyLAmhwH7TLcqE+vzRbU65K9
         /vOyhR7ZIDYOv8AzmWW2hfJjjb5ukdnp6PLbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=OFyVgPW92xjeHjZOe3d3BTj75xEysQbpF9I3kxPup5I=;
        b=S/lm1VNhwBHqe7i3sk44ml1jJQT4d72Fb81epJ02q0//3xRSVBKH8b4DtUEpM2KMxy
         LH9JdL18z82dbHwiB2obCSPxL4QZcBZtbaOEUhtJ0g1wvYukzr+hWB2Tfk8HJdhkmTsD
         VbE68/ZlCoDtmT7qk18oitjlaeDqCMLJbLQgkopVzLdzuVFLWfySBm0TjkFdJpzEEnX4
         N/eQxx/IXT3xp5EQwgMCam+Y3ytOZO26o7e6VkhD0CV+CJsh79hJWb5qVhjQyP/w3G9Z
         h2s2gnDZ2Ze8rfL8geqMpw92QSED9eFob/is1ZkEvu1FHMIAJqeTiwOR6XurcJL0zQWC
         B+Qw==
X-Gm-Message-State: AGi0PuYzUjr6Walkhi8hm+gTj64Y1ReTyW8Ei20lC2zxye2f0erkD38Q
        pBteGGva4FkRpPaoHItErfOxVQ==
X-Google-Smtp-Source: APiQypKOZu4YMMmeSCWuV0yt1TPUe1gyOAOvbQ/KrM0zsU6tN1ZsiYm3L3tqll+HXgbuCJ3zsKE3YA==
X-Received: by 2002:a17:902:8641:: with SMTP id y1mr1649408plt.14.1588657459376;
        Mon, 04 May 2020 22:44:19 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b29sm862082pfp.68.2020.05.04.22.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 22:44:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200504213624.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
References: <20200504213624.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement lane reordering + polarity
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     robdclark@chromium.org, seanpaul@chromium.org,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Date:   Mon, 04 May 2020 22:44:17 -0700
Message-ID: <158865745768.11125.12003632060774071567@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-05-04 21:36:31)
> The ti-sn65dsi86 MIPI DSI to eDP bridge chip supports arbitrary
> remapping of eDP lanes and also polarity inversion.  Both of these
> features have been described in the device tree bindings for the
> device since the beginning but were never implemented in the driver.
> Implement both of them.
>=20
> Part of this change also allows you to (via the same device tree
> bindings) specify to use fewer than the max number of DP lanes that
> the panel reports.  This could be useful if your display supports more
> lanes but only a few are hooked up on your board.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Except for one thing below:

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 1a125423eb07..52cca54b525f 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -707,26 +716,20 @@ static void ti_sn_bridge_enable(struct drm_bridge *=
bridge)
>         int dp_rate_idx;
>         unsigned int val;
>         int ret =3D -EINVAL;
> +       int max_dp_lanes;
> =20
> -       /*
> -        * Run with the maximum number of lanes that the DP sink supports.
> -        *
> -        * Depending use cases, we might want to revisit this later becau=
se:
> -        * - It's plausible that someone may have run fewer lines to the
> -        *   sink than the sink actually supports, assuming that the lines
> -        *   will just be driven at a higher rate.
> -        * - The DP spec seems to indicate that it's more important to mi=
nimize
> -        *   the number of lanes than the link rate.
> -        *
> -        * If we do revisit, it would be important to measure the power i=
mpact.
> -        */
> -       pdata->dp_lanes =3D ti_sn_get_max_lanes(pdata);
> +       max_dp_lanes =3D ti_sn_get_max_lanes(pdata);
> +       pdata->dp_lanes =3D min(pdata->dp_lanes, max_dp_lanes);
> =20
>         /* DSI_A lane config */
>         val =3D CHA_DSI_LANES(4 - pdata->dsi->lanes);

Not a problem in this patch, but maybe this can be SN_MAX_DP_LANES -
pdata->dsi->lanes now.

>         regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
>                            CHA_DSI_LANES_MASK, val);
> =20
> +       regmap_write(pdata->regmap, SN_LN_ASSIGN_REG, pdata->ln_assign);
> +       regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, LN_POLRS_MASK,
> +                          pdata->ln_polrs << LN_POLRS_OFFSET);
> +
>         /* set dsi clk frequency value */
>         ti_sn_bridge_set_dsi_rate(pdata);
> =20
> @@ -1063,6 +1066,50 @@ static int ti_sn_setup_gpio_controller(struct ti_s=
n_bridge *pdata)
>         return ret;
>  }
> =20
> +static void ti_sn_bridge_parse_lanes(struct ti_sn_bridge *pdata,
> +                                    struct device_node *np)
> +{
> +       u32 lane_assignments[SN_MAX_DP_LANES] =3D { 0, 1, 2, 3 };
> +       u32 lane_polarities[SN_MAX_DP_LANES] =3D { };
> +       struct device_node *endpoint;
> +       u8 ln_assign =3D 0;
> +       u8 ln_polrs =3D 0;

Do we need to assign to 0 to start? Seems like no?

> +       int dp_lanes;
> +       int i;
> +
> +       /*
> +        * Read config from the device tree about lane remapping and lane
> +        * polarities.  These are optional and we assume identity map and
> +        * normal polarity if nothing is specified.  It's OK to specify j=
ust
> +        * data-lanes but not lane-polarities but not vice versa.
> +        */
> +       endpoint =3D of_graph_get_endpoint_by_regs(np, 1, -1);
> +       dp_lanes =3D of_property_count_u32_elems(endpoint, "data-lanes");
> +       if (dp_lanes > 0) {
> +               of_property_read_u32_array(endpoint, "data-lanes",
> +                                          lane_assignments, dp_lanes);
> +               of_property_read_u32_array(endpoint, "lane-polarities",
> +                                          lane_polarities, dp_lanes);
> +       } else {
> +               dp_lanes =3D SN_MAX_DP_LANES;
> +       }

Needs an of_node_put(endpoint) here for the
of_graph_get_endpoint_by_regs() above.

> +
> +       /*
> +        * Convert into register format.  Loop over all lanes even if
> +        * data-lanes had fewer elements so that we nicely initialize
> +        * the LN_ASSIGN register.
> +        */
> +       for (i =3D SN_MAX_DP_LANES - 1; i >=3D 0; i--) {
> +               ln_assign =3D ln_assign << LN_ASSIGN_WIDTH | lane_assignm=
ents[i];
> +               ln_polrs =3D ln_polrs << 1 | lane_polarities[i];
> +       }
> +
> +       /* Stash in our struct for when we power on */
> +       pdata->dp_lanes =3D dp_lanes;
> +       pdata->ln_assign =3D ln_assign;
> +       pdata->ln_polrs =3D ln_polrs;
> +}
