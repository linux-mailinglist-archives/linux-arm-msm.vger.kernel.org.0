Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE12F1D5BBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 23:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgEOVnb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 17:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726266AbgEOVnb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 17:43:31 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B287C061A0C;
        Fri, 15 May 2020 14:43:31 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id s21so3461914ejd.2;
        Fri, 15 May 2020 14:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I9ahSfeyShLOrWsmfKHouJCqywa7cbIcbln/4DdMMCU=;
        b=Wn54dpHMi3XoICHM8rVqShWSCb2wOpkY5urudPAHJpFFfcELHrHdAttUP1YAR3w/6e
         HdGtyDoz3jz+g6I32ZZIw9B5StLgFYW+e8Fz/iVCRTJyKb0SpQg/js7Iz4b6+LDTph6B
         z+wmhFY/btS+s1BdhMd78yaCaN55Vw1Wg1fTn41/36BqOm1LWNg+a7lRU1nu/PHW+3xj
         c6Z8R0aFKnr68+evwuUdKtZKx2IsrMSOSwsBM475ee5LPu/khr9lA6xA5oRJp9+o4plL
         0HjaEjty8rY6DvlxlL0GeqdAfG9ySBYDrsE7lfGDsJPm3lrMPEXJoXZA9zmVCloHI/S/
         o3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I9ahSfeyShLOrWsmfKHouJCqywa7cbIcbln/4DdMMCU=;
        b=OdGvtJ9hiW47BphfP6IUHDmMC+453bgFCDsjHtNTP4nVWLiJL503EIyWXICJl2q15V
         dT5BC+JRbgZREdXscUIlYpGf2tQs4Ijf86RLF7WmudXlWarhNiRnICHcB7wYBi4/0Jrj
         bHCnL3CTtMyZOpKkMxQWLHV8QXYr7LwPKzOHjvoVl6j0lDC/7OLct8MwNbDAR6VXDilV
         1sbtil7JJdBRX9yRr/hifG7yqyz+Dfj6whpUGSpDSTBRPTEPlmmAGf/42HTo0Be7VFRx
         G/3HqIABEtZakuqhBA8Th71IlIxi77Fc8C2nTBLdnz1lD8dFfEwSXylA+DscOSxnCs2H
         zWOA==
X-Gm-Message-State: AOAM532bLajpTTKqtlKqBQ95BORwt784C0A2KzbDZQt1Pcrvrq+0pOva
        U7v9LmeZeY1PT11zN2bFXZpd+3sFn5TKul88q8A=
X-Google-Smtp-Source: ABdhPJwnvn7N+iI77U+bO5uCLHA4ErVqBCG9iPTIw+yMIYf+68B5/Jxm7UW5cr1MDUQguyXPg0L56r3T7udQCzXaASU=
X-Received: by 2002:a17:906:2503:: with SMTP id i3mr4539530ejb.293.1589579009383;
 Fri, 15 May 2020 14:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200506140208.v2.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
In-Reply-To: <20200506140208.v2.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 15 May 2020 14:43:48 -0700
Message-ID: <CAF6AEGvXkeOrHGMHo=C1zXhDc9rquQJc8oGDB4VDfhTfdtqyTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: ti-sn65dsi86: Implement lane
 reordering + polarity
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 6, 2020 at 2:03 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The ti-sn65dsi86 MIPI DSI to eDP bridge chip supports arbitrary
> remapping of eDP lanes and also polarity inversion.  Both of these
> features have been described in the device tree bindings for the
> device since the beginning but were never implemented in the driver.
> Implement both of them.
>
> Part of this change also allows you to (via the same device tree
> bindings) specify to use fewer than the max number of DP lanes that
> the panel reports.  This could be useful if your display supports more
> lanes but only a few are hooked up on your board.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
> This patch is based upon my my outstanding series[1] not because there
> is any real requirement but simply to avoid merge conflicts.  I
> believe that my previous series is ready to land.  If, however, you'd
> prefer that I rebase this patch somewhere atop something else then
> please shout.
>
> [1] https://lore.kernel.org/r/20200430194617.197510-1-dianders@chromium.org
>
> Changes in v2:
> - Use SN_MAX_DP_LANES instead of 4 in one place.
> - Comment that we aren't doing full validation of dts params.
> - Check dp_lanes <= SN_MAX_DP_LANES to avoid buffer overrun.
> - Add missing of_node_put()
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 82 ++++++++++++++++++++++-----
>  1 file changed, 68 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 1a125423eb07..534b712dccf8 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -50,8 +50,12 @@
>  #define SN_CHA_VERTICAL_BACK_PORCH_REG         0x36
>  #define SN_CHA_HORIZONTAL_FRONT_PORCH_REG      0x38
>  #define SN_CHA_VERTICAL_FRONT_PORCH_REG                0x3A
> +#define SN_LN_ASSIGN_REG                       0x59
> +#define  LN_ASSIGN_WIDTH                       2
>  #define SN_ENH_FRAME_REG                       0x5A
>  #define  VSTREAM_ENABLE                                BIT(3)
> +#define  LN_POLRS_OFFSET                       4
> +#define  LN_POLRS_MASK                         0xf0
>  #define SN_DATA_FORMAT_REG                     0x5B
>  #define  BPP_18_RGB                            BIT(0)
>  #define SN_HPD_DISABLE_REG                     0x5C
> @@ -98,6 +102,7 @@
>
>  #define SN_REGULATOR_SUPPLY_NUM                4
>
> +#define SN_MAX_DP_LANES                        4
>  #define SN_NUM_GPIOS                   4
>
>  /**
> @@ -115,6 +120,8 @@
>   * @enable_gpio:  The GPIO we toggle to enable the bridge.
>   * @supplies:     Data for bulk enabling/disabling our regulators.
>   * @dp_lanes:     Count of dp_lanes we're using.
> + * @ln_assign:    Value to program to the LN_ASSIGN register.
> + * @ln_polr:      Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
>   *
>   * @gchip:        If we expose our GPIOs, this is used.
>   * @gchip_output: A cache of whether we've set GPIOs to output.  This
> @@ -140,6 +147,8 @@ struct ti_sn_bridge {
>         struct gpio_desc                *enable_gpio;
>         struct regulator_bulk_data      supplies[SN_REGULATOR_SUPPLY_NUM];
>         int                             dp_lanes;
> +       u8                              ln_assign;
> +       u8                              ln_polrs;
>
>         struct gpio_chip                gchip;
>         DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
> @@ -707,26 +716,20 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>         int dp_rate_idx;
>         unsigned int val;
>         int ret = -EINVAL;
> +       int max_dp_lanes;
>
> -       /*
> -        * Run with the maximum number of lanes that the DP sink supports.
> -        *
> -        * Depending use cases, we might want to revisit this later because:
> -        * - It's plausible that someone may have run fewer lines to the
> -        *   sink than the sink actually supports, assuming that the lines
> -        *   will just be driven at a higher rate.
> -        * - The DP spec seems to indicate that it's more important to minimize
> -        *   the number of lanes than the link rate.
> -        *
> -        * If we do revisit, it would be important to measure the power impact.
> -        */
> -       pdata->dp_lanes = ti_sn_get_max_lanes(pdata);
> +       max_dp_lanes = ti_sn_get_max_lanes(pdata);
> +       pdata->dp_lanes = min(pdata->dp_lanes, max_dp_lanes);
>
>         /* DSI_A lane config */
> -       val = CHA_DSI_LANES(4 - pdata->dsi->lanes);
> +       val = CHA_DSI_LANES(SN_MAX_DP_LANES - pdata->dsi->lanes);
>         regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
>                            CHA_DSI_LANES_MASK, val);
>
> +       regmap_write(pdata->regmap, SN_LN_ASSIGN_REG, pdata->ln_assign);
> +       regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, LN_POLRS_MASK,
> +                          pdata->ln_polrs << LN_POLRS_OFFSET);
> +
>         /* set dsi clk frequency value */
>         ti_sn_bridge_set_dsi_rate(pdata);
>
> @@ -1063,6 +1066,55 @@ static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
>         return ret;
>  }
>
> +static void ti_sn_bridge_parse_lanes(struct ti_sn_bridge *pdata,
> +                                    struct device_node *np)
> +{
> +       u32 lane_assignments[SN_MAX_DP_LANES] = { 0, 1, 2, 3 };
> +       u32 lane_polarities[SN_MAX_DP_LANES] = { };
> +       struct device_node *endpoint;
> +       u8 ln_assign = 0;
> +       u8 ln_polrs = 0;
> +       int dp_lanes;
> +       int i;
> +
> +       /*
> +        * Read config from the device tree about lane remapping and lane
> +        * polarities.  These are optional and we assume identity map and
> +        * normal polarity if nothing is specified.  It's OK to specify just
> +        * data-lanes but not lane-polarities but not vice versa.
> +        *
> +        * Error checking is light (we just make sure we don't crash or
> +        * buffer overrun) and we assume dts is well formed and specifying
> +        * mappings that the hardware supports.
> +        */
> +       endpoint = of_graph_get_endpoint_by_regs(np, 1, -1);
> +       dp_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
> +       if (dp_lanes > 0 && dp_lanes <= SN_MAX_DP_LANES) {
> +               of_property_read_u32_array(endpoint, "data-lanes",
> +                                          lane_assignments, dp_lanes);
> +               of_property_read_u32_array(endpoint, "lane-polarities",
> +                                          lane_polarities, dp_lanes);
> +       } else {
> +               dp_lanes = SN_MAX_DP_LANES;
> +       }
> +       of_node_put(endpoint);
> +
> +       /*
> +        * Convert into register format.  Loop over all lanes even if
> +        * data-lanes had fewer elements so that we nicely initialize
> +        * the LN_ASSIGN register.
> +        */
> +       for (i = SN_MAX_DP_LANES - 1; i >= 0; i--) {
> +               ln_assign = ln_assign << LN_ASSIGN_WIDTH | lane_assignments[i];
> +               ln_polrs = ln_polrs << 1 | lane_polarities[i];
> +       }
> +
> +       /* Stash in our struct for when we power on */
> +       pdata->dp_lanes = dp_lanes;
> +       pdata->ln_assign = ln_assign;
> +       pdata->ln_polrs = ln_polrs;
> +}
> +
>  static int ti_sn_bridge_probe(struct i2c_client *client,
>                               const struct i2c_device_id *id)
>  {
> @@ -1105,6 +1157,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>                 return ret;
>         }
>
> +       ti_sn_bridge_parse_lanes(pdata, client->dev.of_node);
> +
>         ret = ti_sn_bridge_parse_regulators(pdata);
>         if (ret) {
>                 DRM_ERROR("failed to parse regulators\n");
> --
> 2.26.2.645.ge9eca65c58-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
