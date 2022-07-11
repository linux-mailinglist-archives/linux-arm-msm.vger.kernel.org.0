Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F052756D6DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 09:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbiGKHbe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 03:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiGKHbd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 03:31:33 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C2A9165B6
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 00:31:32 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id cf13so4589557qtb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 00:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/7sLUT5xG/gk839oUa0EEDIiTWXp5BX3JAGYljElZfg=;
        b=uXGyRAuv2KAbOv0g4YRopN6v2Vg+zgg/0rtizfGZdXZQ9nkwTGdonA2tsG4G24P6zC
         A8VZynVvJCD3wT5Y5s8HF/zCqXwve7PssBs8Jx8S1j1021eeve00nxNWv1X40erQHr0z
         QeQBDBj8RMCr9iMV3lfqEVue8TLWRaZFoE0uLaUrfpGMUgkIaqJtLaVgn2ogXRUhGwgq
         jN78Fv07/KO3K8z50PJvXAkxyerqtP/L1jWg4OnHIr2OopNC3GIIiB7NFKHWdoytghUl
         sn9d8id+6gV+X1IvD23Ud+ybZntvuadZ/jFE8ZiZzm65rid3s1IVKGXhY+4ypWs3EBEe
         NY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/7sLUT5xG/gk839oUa0EEDIiTWXp5BX3JAGYljElZfg=;
        b=s4+y/JxvXtp6lMAUegc/Bfk5iMAeOdn59FWj+h3tkTU75+/+HMZwKIj4wnaNKYjghC
         9poO1vIhv6z383T+hLYUjMQXCseppkJ1yTNnCSKdisf3M5WZq9D++MlKIoayD85KirtR
         vS0PlF7TX3w2U9zvRWmRwms6HS5TBSjvtPgwg0xWQXi927a6KIRmJhTBXbDQ1mu4nvlk
         CfcCCoFuOy0Z8uYiH1/XBodB5/z025WOeOSuz+/az+e1cW15Ta+giEZ2/AhVGkPEEdcE
         2UKSQ9a13VoD8hKekts2P0hPFkvuFzjSsEKvKB7xKublSz1R77yz8/YW7YfVAOdTtUz2
         dUig==
X-Gm-Message-State: AJIora8gjV0UZPW0mM7pwV3o+d1bF+Yw46i+XphDWY435SfWe/dBw/s4
        pNs0f4H9o2q4PrclvHXjYCRVqR6hh0ufCkP/QgpRrQ==
X-Google-Smtp-Source: AGRyM1v4yopWgDJUivdQtj6Q2uqWUtOVQrX2vVikIwEPyJGIulLhl5A6m1ds9Go6J6iadfWUrWzJd53qFX6mmUUJau4=
X-Received: by 2002:ac8:4e56:0:b0:31d:38c0:b749 with SMTP id
 e22-20020ac84e56000000b0031d38c0b749mr12415313qtw.682.1657524691329; Mon, 11
 Jul 2022 00:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
 <20220710184536.172705-3-dmitry.baryshkov@linaro.org> <YsskUiGP8HCQeUUR@ravnborg.org>
In-Reply-To: <YsskUiGP8HCQeUUR@ravnborg.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 11 Jul 2022 10:31:20 +0300
Message-ID: <CAA8EJpobTKkyMkFd2zgFVzR21BgqA+Rdrgszc2JYFZqU9Zvp9Q@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 10 Jul 2022 at 22:11, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Dmitry,
>
> On Sun, Jul 10, 2022 at 09:45:35PM +0300, Dmitry Baryshkov wrote:
> > Rather than reading the pdata->connector directly, fetch the connector
> > using drm_atomic_state. This allows us to make pdata->connector optional
> > (and thus supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR).
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++++------
> >  1 file changed, 14 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 01171547f638..df08207d6223 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -779,9 +779,9 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
> >       regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
> >  }
> >
> > -static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
> > +static unsigned int ti_sn_bridge_get_bpp(struct drm_connector *connector)
> >  {
> > -     if (pdata->connector->display_info.bpc <= 6)
> > +     if (connector->display_info.bpc <= 6)
> >               return 18;
> >       else
> >               return 24;
> > @@ -796,7 +796,7 @@ static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
> >       0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
> >  };
> >
> > -static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
> > +static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata, unsigned int bpp)
> >  {
> >       unsigned int bit_rate_khz, dp_rate_mhz;
> >       unsigned int i;
> > @@ -804,7 +804,7 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata)
> >               &pdata->bridge.encoder->crtc->state->adjusted_mode;
> >
> >       /* Calculate minimum bit rate based on our pixel clock. */
> > -     bit_rate_khz = mode->clock * ti_sn_bridge_get_bpp(pdata);
> > +     bit_rate_khz = mode->clock * bpp;
> >
> >       /* Calculate minimum DP data rate, taking 80% as per DP spec */
> >       dp_rate_mhz = DIV_ROUND_UP(bit_rate_khz * DP_CLK_FUDGE_NUM,
> > @@ -1016,12 +1016,19 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
> >                                      struct drm_bridge_state *old_bridge_state)
> >  {
> >       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> > +     struct drm_connector *connector;
> >       const char *last_err_str = "No supported DP rate";
> >       unsigned int valid_rates;
> >       int dp_rate_idx;
> >       unsigned int val;
> >       int ret = -EINVAL;
> >       int max_dp_lanes;
> > +     unsigned int bpp;
> > +
> > +     connector = drm_atomic_get_new_connector_for_encoder(old_bridge_state->base.state,
> > +                                                          bridge->encoder);
> > +     if (!connector)
> > +             return;
> It would be prudent with a dev_err() logging here as we do not expect to
> fail.
> I looked into something similar, but with a less elegant solution, and
> could not convince myself that the display driver would create the
> connector before ti_sn_bridge_atomic_enable() was called.

If I understand your concern, the connectors (as does the rest of
CRTC/encoder/etc objects) are not dynamic, so they must be created
before being able to use the DRM device or any part of thereof is
being actually used (enable/disable/modeset).

>
> This is another reason why a dev_err would be nice - so tester could see
> if this fails or not.

Will fix this in v2.

>
> With the dev_err added:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>
> >
> >       max_dp_lanes = ti_sn_get_max_lanes(pdata);
> >       pdata->dp_lanes = min(pdata->dp_lanes, max_dp_lanes);
> > @@ -1047,8 +1054,9 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
> >       drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
> >                          DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
> >
> > +     bpp = ti_sn_bridge_get_bpp(connector);
> >       /* Set the DP output format (18 bpp or 24 bpp) */
> > -     val = (ti_sn_bridge_get_bpp(pdata) == 18) ? BPP_18_RGB : 0;
> > +     val = (bpp == 18) ? BPP_18_RGB : 0;
> >       regmap_update_bits(pdata->regmap, SN_DATA_FORMAT_REG, BPP_18_RGB, val);
> >
> >       /* DP lane config */
> > @@ -1059,7 +1067,7 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
> >       valid_rates = ti_sn_bridge_read_valid_rates(pdata);
> >
> >       /* Train until we run out of rates */
> > -     for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
> > +     for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, bpp);
> >            dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
> >            dp_rate_idx++) {
> >               if (!(valid_rates & BIT(dp_rate_idx)))
> > --
> > 2.35.1



-- 
With best wishes
Dmitry
