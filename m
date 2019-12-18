Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2BD123E2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 05:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbfLREBe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 23:01:34 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34071 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfLREBd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 23:01:33 -0500
Received: by mail-ed1-f65.google.com with SMTP id l8so502868edw.1;
        Tue, 17 Dec 2019 20:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7K9fR3T2CjXTNX5C0iKVLp4+bTfW+5mmChHE8m8tcG0=;
        b=Ei0RVZCO1/qfsvpXPtJf7m0xq3E/RfnlDNnT6U174dsoMdvNZpeRURpvbwRumUwWR7
         oSezxVGy37dAVyt3YDIVELLP/eh7LrwMVKJ9qThBRqgY5Rt4JW6bTAfs5VRVGXKVGFfS
         hzh9Ed5Cp6TyPYTR2IXENHwzD6B9wJBTG4EC8UIi+eHbXaIPlC8pK5WnD/wVJzLcfSYj
         TLGMyYfnLA25YSqNGdGR+IfaA7zt+a/afn0BncN6nDwgC1RNM+Gk463lTmAIAmxuuaGM
         r7MgOSBuBHYpaSgvb6Et3syE+aHePQD7ZgVtaCmVm4DweZnVhFOPdhzqNChqfh6kIQ3p
         Xx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7K9fR3T2CjXTNX5C0iKVLp4+bTfW+5mmChHE8m8tcG0=;
        b=XG0KBvJd7Ej9xIzAjG1FKl3c7tnFTU3/q5JwAmnchBerw2yywWMyvz42qUi+xyOW/C
         js4aC+VTCTAQyO2esZ5/YdfbQ9btoDj4DO3S5Aq0hqyhK+onAeo2mogKNbZ9cIepcjaw
         xYrJuP+QOacCMM4uLupOdwoH11vkEX8dcbnGvFzyWD8vme8gCxkLzggIqEq26+NYF9AE
         hDB4Jf9MZnqyvTdHxevb7XQWnQHG04vwURmSIe4f9Yro+dgEJf8+H1ivHBrjiQQLB1eu
         u7UYrpF/++HDxkX3S0s/WpEy8iSOSwryg6YEgBE6J/SBlPE2zdP8NdV0SQxZ0JvyuCZO
         IBZQ==
X-Gm-Message-State: APjAAAXxqIngTZ2jsA/xFuhNgV0WYWhh7DJI9Y2KwJzB2a5IvVd3nzMW
        fKom5Nd5QH5byryo797iHmkl0+MyofGtboDAht4=
X-Google-Smtp-Source: APXvYqwrk7Cu5fSW87YoFn5BgAhH5qZom2ZJM9xmu67U8udCHsB4l6lGHevljZuOKRtMXEQDrgZGI/TnUKIcB9zezUA=
X-Received: by 2002:aa7:d415:: with SMTP id z21mr1255088edq.264.1576641691587;
 Tue, 17 Dec 2019 20:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20191218004741.102067-1-dianders@chromium.org> <20191217164702.v2.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid>
In-Reply-To: <20191217164702.v2.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 17 Dec 2019 20:01:24 -0800
Message-ID: <CAF6AEGs5CKNhKh_ZLUqWh8_2GxiDiuaTC2P-yzHqz+Dvhbp-VQ@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] drm/bridge: ti-sn65dsi86: Avoid invalid rates
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <seanpaul@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 17, 2019 at 4:48 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> Based on work by Bjorn Andersson <bjorn.andersson@linaro.org>,
> Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, and
> Rob Clark <robdclark@chromium.org>.
>
> Let's read the SUPPORTED_LINK_RATES and/or MAX_LINK_RATE (depending on
> the eDP version of the sink) to figure out what eDP rates are
> supported and pick the ideal one.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - Patch ("Avoid invalid rates") replaces ("Skip non-standard DP rates")
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 118 ++++++++++++++++++++------
>  1 file changed, 93 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index e1b817ccd9c7..da5ddf6be92b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -475,39 +475,103 @@ static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn_bridge *pdata)
>         return i;
>  }
>
> -static int ti_sn_bridge_get_max_dp_rate_idx(struct ti_sn_bridge *pdata)
> +static void ti_sn_bridge_read_valid_rates(struct ti_sn_bridge *pdata,
> +                                         bool rate_valid[])
>  {
> -       u8 data;
> +       u8 dpcd_val;
> +       int rate_times_200khz;
>         int ret;
> +       int i;
>
> -       ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LINK_RATE, &data);
> +       ret = drm_dp_dpcd_readb(&pdata->aux, DP_EDP_DPCD_REV, &dpcd_val);
> +       if (ret != 1) {
> +               DRM_DEV_ERROR(pdata->dev,
> +                             "Can't read eDP rev (%d), assuming 1.1\n", ret);
> +               dpcd_val = DP_EDP_11;
> +       }
> +
> +       if (dpcd_val >= DP_EDP_14) {
> +               /* eDP 1.4 devices must provide a custom table */
> +               __le16 sink_rates[DP_MAX_SUPPORTED_RATES];
> +
> +               ret = drm_dp_dpcd_read(&pdata->aux, DP_SUPPORTED_LINK_RATES,
> +                                      sink_rates, sizeof(sink_rates));
> +
> +               if (ret != sizeof(sink_rates)) {
> +                       DRM_DEV_ERROR(pdata->dev,
> +                               "Can't read supported rate table (%d)\n", ret);
> +
> +                       /* By zeroing we'll fall back to DP_MAX_LINK_RATE. */
> +                       memset(sink_rates, 0, sizeof(sink_rates));
> +               }
> +
> +               for (i = 0; i < ARRAY_SIZE(sink_rates); i++) {
> +                       rate_times_200khz = le16_to_cpu(sink_rates[i]);
> +
> +                       if (!rate_times_200khz)
> +                               break;
> +
> +                       switch (rate_times_200khz) {
> +                       case 27000:

maybe a bit bike-sheddy, but I kinda prefer to use traditional normal
units, ie. just multiply the returned value by 200 and adjust the
switch case values.  At least then they match the values in the lut
(other than khz vs mhz), which makes this whole logic a bit more
obvious... and at that point, maybe just loop over the lut table?

BR,
-R

> +                               rate_valid[7] = 1;
> +                               break;
> +                       case 21600:
> +                               rate_valid[6] = 1;
> +                               break;
> +                       case 16200:
> +                               rate_valid[5] = 1;
> +                               break;
> +                       case 13500:
> +                               rate_valid[4] = 1;
> +                               break;
> +                       case 12150:
> +                               rate_valid[3] = 1;
> +                               break;
> +                       case 10800:
> +                               rate_valid[2] = 1;
> +                               break;
> +                       case 8100:
> +                               rate_valid[1] = 1;
> +                               break;
> +                       default:
> +                               /* unsupported */
> +                               break;
> +                       }
> +               }
> +
> +               for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut); i++) {
> +                       if (rate_valid[i])
> +                               return;
> +               }
> +               DRM_DEV_ERROR(pdata->dev,
> +                             "No matching eDP rates in table; falling back\n");
> +       }
> +
> +       /* On older versions best we can do is use DP_MAX_LINK_RATE */
> +       ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LINK_RATE, &dpcd_val);
>         if (ret != 1) {
>                 DRM_DEV_ERROR(pdata->dev,
>                               "Can't read max rate (%d); assuming 5.4 GHz\n",
>                               ret);
> -               return ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1;
> +               dpcd_val = DP_LINK_BW_5_4;
>         }
>
> -       /*
> -        * Return an index into ti_sn_bridge_dp_rate_lut.  Just hardcode
> -        * these indicies since it's not like the register spec is ever going
> -        * to change and a loop would just be more complicated.  Apparently
> -        * the DP sink can only return these few rates as supported even
> -        * though the bridge allows some rates in between.
> -        */
> -       switch (data) {
> -       case DP_LINK_BW_1_62:
> -               return 1;
> -       case DP_LINK_BW_2_7:
> -               return 4;
> +       switch (dpcd_val) {
> +       default:
> +               DRM_DEV_ERROR(pdata->dev,
> +                             "Unexpected max rate (%#x); assuming 5.4 GHz\n",
> +                             (int)dpcd_val);
> +               /* fall through */
>         case DP_LINK_BW_5_4:
> -               return 7;
> +               rate_valid[7] = 1;
> +               /* fall through */
> +       case DP_LINK_BW_2_7:
> +               rate_valid[4] = 1;
> +               /* fall through */
> +       case DP_LINK_BW_1_62:
> +               rate_valid[1] = 1;
> +               break;
>         }
> -
> -       DRM_DEV_ERROR(pdata->dev,
> -                     "Unexpected max data rate (%#x); assuming 5.4 GHz\n",
> -                     (int)data);
> -       return ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1;
>  }
>
>  static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
> @@ -609,9 +673,9 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
>  static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  {
>         struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +       bool rate_valid[ARRAY_SIZE(ti_sn_bridge_dp_rate_lut)];
>         const char *last_err_str = "No supported DP rate";
>         int dp_rate_idx;
> -       int max_dp_rate_idx;
>         unsigned int val;
>         int ret = -EINVAL;
>
> @@ -655,11 +719,15 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>         regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
>                            val);
>
> +       ti_sn_bridge_read_valid_rates(pdata, rate_valid);
> +
>         /* Train until we run out of rates */
> -       max_dp_rate_idx = ti_sn_bridge_get_max_dp_rate_idx(pdata);
>         for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata);
> -            dp_rate_idx <= max_dp_rate_idx;
> +            dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
>              dp_rate_idx++) {
> +               if (!rate_valid[dp_rate_idx])
> +                       continue;
> +
>                 ret = ti_sn_link_training(pdata, dp_rate_idx, &last_err_str);
>                 if (!ret)
>                         break;
> --
> 2.24.1.735.g03f4e72817-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
