Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A404A5582
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 04:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232655AbiBADQQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 22:16:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiBADQP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 22:16:15 -0500
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCE7C061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 19:16:15 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id k4so14809451qvt.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 19:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iJaV23eJ3F2xXjDzke76oTvQtiDzAPIqJIaZIOVfRVs=;
        b=RDQCMD4he9+ralgV5f8ai4Xmn8AtMWJakxDnoALtWLUfkZP+kVSlUBqfCcrI+a0YRy
         5cihKD2XmE508uB6d8BnN3T9To+NrTYV/exifxHmVVrkVlvyQ7klqRuQBNf7GFBt3hBY
         KxcB+Mlm02BxbGIl6VR+d08f+YomIYMqSysDUdsQXpiM4ThwLrjKu1kQWrMeHA8ENDE8
         7rTf8Nd0D8YeaREHwAXyemHzxSIdbynHxeczIkGOVApx8K3B5isRQ9e7ntZwS4RGygNu
         WVOSt9qr1/MkKCvmwpyNdBYOrEhxkQeEvnCIYM+d28oZZqdJO2X38LXXR8Uf54bDopoo
         YTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iJaV23eJ3F2xXjDzke76oTvQtiDzAPIqJIaZIOVfRVs=;
        b=KgRQCQSBRP9/hvRhvlSznydj9teBUpkzH0O/vMO2HxqfyvtUdXyyAQbNvRD7Owhr45
         XpuIgVpduP4In47VOp2DtS3dR6/eOmGRKvBizllvuQ97q6ZfLhX79Nxp8xqV3nqdty9L
         HL1llWtv+N5Y80aJD4+864oruL0l/JLU4gMTht9CSqq9o13ZDNG2YtYztqnBx1g/26nQ
         APjy2NJoihUSnEemey8T3msMg7zzWli7r/ZW4vFEnjXopTow8Ymew1yNPVE0NMxcjnGs
         wbNxvFz68lphrIAPHxb0SxbUFVeUUzUXEuDyzN8lcuUDPliqxqEXC69Xbut0udMl1Qhw
         SicQ==
X-Gm-Message-State: AOAM531c7xVlHMtnDxDffTBKeISxj4Rp5DKeC6b97yNwtezuN+tFLIVZ
        JNoRgkzb6GVpl/98bR1vlFvTx1aAeP86vjWba7c5Og==
X-Google-Smtp-Source: ABdhPJzJ2fqnbHOEKoLryqxR250cfI3fMgetiLUrqZrc+kQBI/Y4yZkgFF9W2CqhPCyB4RJ4CKWRjRPWxAEKGlnoZIQ=
X-Received: by 2002:ad4:4eea:: with SMTP id dv10mr20497806qvb.73.1643685374224;
 Mon, 31 Jan 2022 19:16:14 -0800 (PST)
MIME-Version: 1.0
References: <1643390945-10813-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqVAB31uzav-qMsBEBk0j2dk-qy1cRRRccCRLgJRqCS2g@mail.gmail.com> <0ccbaf15-5981-c6e5-f333-8dc200327037@quicinc.com>
In-Reply-To: <0ccbaf15-5981-c6e5-f333-8dc200327037@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 1 Feb 2022 06:16:03 +0300
Message-ID: <CAA8EJpoXN_tk7Oc9rRqg_ZT6u=7t01ZGhvUm2fYVkbQgQKJx7w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: add wide bus support
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org,
        quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 1 Feb 2022 at 01:24, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 1/28/2022 8:59 PM, Dmitry Baryshkov wrote:
> > Hi,
> >
> > Thank you for your patch.
> >
> > On Fri, 28 Jan 2022 at 20:29, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> Normally, mdp will push one pixel of data per pixel clock to
> >> interface to display. Wide bus feature will increase bus
> >> width from 32 bits to 64 bits so that it can push two
> >> pixel of data per pixel clock to interface to display.
> >> This feature is pre requirement to support 4k resolution.
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  16 ++-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   2 +
> >>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  14 +++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 108 +++++++++++++++------
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   5 +
> >>   drivers/gpu/drm/msm/dp/dp_catalog.c                |  11 ++-
> >>   drivers/gpu/drm/msm/dp/dp_catalog.h                |   1 +
> >>   drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   9 +-
> >>   drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   1 +
> >>   drivers/gpu/drm/msm/dp/dp_display.c                |  17 ++++
> >>   drivers/gpu/drm/msm/dp/dp_display.h                |   3 +
> >>   drivers/gpu/drm/msm/dp/dp_parser.c                 |  26 +++++
> >>   drivers/gpu/drm/msm/dp/dp_parser.h                 |   2 +
> >>   drivers/gpu/drm/msm/msm_drv.h                      |   9 ++
> > Can we get this split into logical chunks please?
> >
> >>   14 files changed, 190 insertions(+), 34 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 1e648db..e2fb5bc 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -199,6 +199,8 @@ struct dpu_encoder_virt {
> >>
> >>          struct msm_display_info disp_info;
> >>
> >> +       struct msm_op_info op_info;
> >> +
> >>          bool idle_pc_supported;
> >>          struct mutex rc_lock;
> >>          enum dpu_enc_rc_states rc_state;
> >> @@ -217,6 +219,13 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
> >>          15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
> >>   };
> >>
> >> +bool dpu_encoder_is_widebus_enabled(struct drm_encoder *drm_enc)
> >> +{
> >> +       struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> >> +
> >> +       return dpu_enc->op_info.wide_bus_en;
> >> +}
> >> +
> >>   static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
> >>   {
> >>          struct dpu_hw_dither_cfg dither_cfg = { 0 };
> >> @@ -2112,6 +2121,7 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
> >>          struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> >>          struct drm_encoder *drm_enc = NULL;
> >>          struct dpu_encoder_virt *dpu_enc = NULL;
> >> +       struct msm_op_info *op_info;
> >>          int ret = 0;
> >>
> >>          dpu_enc = to_dpu_encoder_virt(enc);
> >> @@ -2128,8 +2138,12 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
> >>                  timer_setup(&dpu_enc->vsync_event_timer,
> >>                                  dpu_encoder_vsync_event_handler,
> >>                                  0);
> >> -       else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
> >> +       else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS) {
> >>                  dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
> >> +               op_info = &priv->op_info[disp_info->h_tile_instance[0]];
> > op_info should be defined per INTF rather than per h_tile. This way
> > you won't have to check for intf_type here.
>
> The more i am thinking,  the more i think op_info should be along with
> controller.
>
> widebus belongs to mdp fetching process and intf only care of raw bit
> stream. it has nothing to do with intf.

Technically yes. However having it per INTF (or per encoder) might
simplify things (as you won't have to check for the encoder type in
the code afterwards).
I'd say, you can define it inside msm_dp somewhere and then query it
from dpu_encoder_setup() using the new function. Afterwards you don't
have to worry about the INTF type at all. You have the correct value
for DP and for the DSI it's false.

>
> The other problem is we can not access inside of prov->dp here.

You can always add msm_dp_has_widebus_enabled() function.

>
>
>
> >
> >> +               dpu_enc->op_info = *op_info;
> > So... we set this data in msm_drm_private only to copy it to
> > dpu_encoder_virt? Please don't do this.
> > Allow one to query the data from the DP rather than blindly copying it
> > over and over again.
>
> Is this only copy one time? maybe change to pointer work better?

This is the only time we copy op_info, this is true. The wide_bus_en
is copied 5 times, if I'm not mistaken.

>
> >> +
> >> +       }
> >>
> >>          INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
> >>                          dpu_encoder_off_work);
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> index e241914..0d73550 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> @@ -168,4 +168,6 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
> >>    */
> >>   int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
> >>
> >> +bool dpu_encoder_is_widebus_enabled(struct drm_encoder *drm_enc);
> >> +
> >>   #endif /* __DPU_ENCODER_H__ */
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> index ddd9d89..04ac2dc 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> @@ -110,6 +110,20 @@ static void drm_mode_to_intf_timing_params(
> >>                  timing->v_back_porch += timing->v_front_porch;
> >>                  timing->v_front_porch = 0;
> >>          }
> >> +
> >> +       timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
> >> +
> >> +       /*
> >> +        * for DP, divide the horizonal parameters by 2 when
> >> +        * widebus is enabled
> >> +        */
> >> +       if (phys_enc->hw_intf->cap->type == INTF_DP && timing->wide_bus_en) {
> > What about INTF_eDP?
> > I suspect that intf type check is unnecessary here.
> >
> >> +               timing->width = timing->width >> 1;
> >> +               timing->xres = timing->xres >> 1;
> >> +               timing->h_back_porch = timing->h_back_porch >> 1;
> >> +               timing->h_front_porch = timing->h_front_porch >> 1;
> >> +               timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
> >> +       }
> >>   }
> >>
> >>   static u32 get_horizontal_total(const struct intf_timing_params *timing)
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> index 116e2b5..f072bd5 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> @@ -33,6 +33,7 @@
> >>   #define INTF_TP_COLOR1                  0x05C
> >>   #define INTF_CONFIG2                    0x060
> >>   #define INTF_DISPLAY_DATA_HCTL          0x064
> >> +#define INTF_ACTIVE_DATA_HCTL           0x068
> >>   #define INTF_FRAME_LINE_COUNT_EN        0x0A8
> >>   #define INTF_FRAME_COUNT                0x0AC
> >>   #define   INTF_LINE_COUNT               0x0B0
> >> @@ -90,67 +91,109 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
> >>          u32 hsync_period, vsync_period;
> >>          u32 display_v_start, display_v_end;
> >>          u32 hsync_start_x, hsync_end_x;
> >> +       u32 hsync_data_start_x, hsync_data_end_x;
> >>          u32 active_h_start, active_h_end;
> >>          u32 active_v_start, active_v_end;
> >>          u32 active_hctl, display_hctl, hsync_ctl;
> >>          u32 polarity_ctl, den_polarity, hsync_polarity, vsync_polarity;
> >>          u32 panel_format;
> >> -       u32 intf_cfg, intf_cfg2 = 0, display_data_hctl = 0;
> >> +       u32 intf_cfg, intf_cfg2 = 0;
> >> +       u32 display_data_hctl = 0, active_data_hctl = 0;
> >> +       u32 data_width;
> >> +       bool dp_intf = false;
> >>
> >>          /* read interface_cfg */
> >>          intf_cfg = DPU_REG_READ(c, INTF_CONFIG);
> >> +
> >> +       if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP)
> >> +               dp_intf = true;
> >> +
> >>          hsync_period = p->hsync_pulse_width + p->h_back_porch + p->width +
> >>          p->h_front_porch;
> >>          vsync_period = p->vsync_pulse_width + p->v_back_porch + p->height +
> >>          p->v_front_porch;
> >>
> >>          display_v_start = ((p->vsync_pulse_width + p->v_back_porch) *
> >> -       hsync_period) + p->hsync_skew;
> >> +                       hsync_period) + p->hsync_skew;
> > Unnecessary whitespace changes complicate reviewing. I'll try groking
> > this piece of code later.
> >
> >>          display_v_end = ((vsync_period - p->v_front_porch) * hsync_period) +
> >> -       p->hsync_skew - 1;
> >> +                       p->hsync_skew - 1;
> >> +
> >> +       hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
> >>
> >>          hsync_start_x = p->h_back_porch + p->hsync_pulse_width;
> >>          hsync_end_x = hsync_period - p->h_front_porch - 1;
> >>
> >> -       if (p->width != p->xres) {
> >> -               active_h_start = hsync_start_x;
> >> -               active_h_end = active_h_start + p->xres - 1;
> >> -       } else {
> >> -               active_h_start = 0;
> >> -               active_h_end = 0;
> >> -       }
> >> +       /*
> >> +        * DATA_HCTL_EN controls data timing which can be different from
> >> +        * video timing. It is recommended to enable it for all cases, except
> >> +        * if compression is enabled in 1 pixel per clock mode
> >> +        */
> >> +       if (!p->compression_en || p->wide_bus_en)
> >> +               intf_cfg2 |= BIT(4);
> >>
> >> -       if (p->height != p->yres) {
> >> -               active_v_start = display_v_start;
> >> -               active_v_end = active_v_start + (p->yres * hsync_period) - 1;
> >> -       } else {
> >> -               active_v_start = 0;
> >> -               active_v_end = 0;
> >> -       }
> >> +       if (p->wide_bus_en)
> >> +               intf_cfg2 |= BIT(0);
> >> +
> >> +       /*
> >> +        * If widebus is disabled:
> >> +        * For uncompressed stream, the data is valid for the entire active
> >> +        * window period.
> >> +        * For compressed stream, data is valid for a shorter time period
> >> +        * inside the active window depending on the compression ratio.
> >> +        *
> >> +        * If widebus is enabled:
> >> +        * For uncompressed stream, data is valid for only half the active
> >> +        * window, since the data rate is doubled in this mode.
> >> +        * p->width holds the adjusted width for DP but unadjusted width for DSI
> >> +        * For compressed stream, data validity window needs to be adjusted for
> >> +        * compression ratio and then further halved.
> >> +        */
> >> +       data_width = p->width;
> >> +
> >> +       if (p->compression_en) {
> >> +               data_width = DIV_ROUND_UP(p->dce_bytes_per_line, 3);
> >>
> >> -       if (active_h_end) {
> >> -               active_hctl = (active_h_end << 16) | active_h_start;
> >> -               intf_cfg |= BIT(29);    /* ACTIVE_H_ENABLE */
> >> +               if (p->wide_bus_en)
> >> +                       data_width >>= 1;
> >> +       } else if (!dp_intf && p->wide_bus_en) {
> >> +               data_width = p->width >> 1;
> >>          } else {
> >> -               active_hctl = 0;
> >> +               data_width = p->width;
> >>          }
> >>
> >> -       if (active_v_end)
> >> -               intf_cfg |= BIT(30); /* ACTIVE_V_ENABLE */
> >> +       hsync_data_start_x = hsync_start_x;
> >> +       hsync_data_end_x =  hsync_start_x + data_width - 1;
> >>
> >> -       hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
> >>          display_hctl = (hsync_end_x << 16) | hsync_start_x;
> >> +       display_data_hctl = (hsync_data_end_x << 16) | hsync_data_start_x;
> >>
> >> -       if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP) {
> >> -               active_h_start = hsync_start_x;
> >> -               active_h_end = active_h_start + p->xres - 1;
> >> -               active_v_start = display_v_start;
> >> -               active_v_end = active_v_start + (p->yres * hsync_period) - 1;
> >> -
> >> +       if (dp_intf) {
> >> +               // DP timing adjustment
> >>                  display_v_start += p->hsync_pulse_width + p->h_back_porch;
> >> +               display_v_end   -= p->h_front_porch;
> >> +       }
> >>
> >> -               active_hctl = (active_h_end << 16) | active_h_start;
> >> +
> >> +       active_h_start = hsync_start_x;
> >> +       active_h_end = active_h_start + p->xres - 1;
> >> +
> >> +       active_v_start = display_v_start;
> >> +       active_v_end = active_v_start + (p->yres * hsync_period) - 1;
> >> +
> >> +       intf_cfg |= BIT(29);    /* ACTIVE_H_ENABLE */
> >> +       intf_cfg |= BIT(30);    /* ACTIVE_V_ENABLE */
> >> +
> >> +       active_hctl = (active_h_end << 16) | active_h_start;
> >> +
> >> +       if (dp_intf) {
> >>                  display_hctl = active_hctl;
> >> +               if (p->compression_en) {
> > I assume that compression_en is a part of DSC support for the DP, isn't it?
> > If so, it should definitely come as a separate patch.
> >
> >> +                       active_data_hctl = (hsync_start_x +
> >> +                                       p->extra_dto_cycles) << 16;
> >> +                       active_data_hctl += hsync_start_x;
> >> +
> >> +                       display_data_hctl = active_data_hctl;
> >> +               }
> >>          }
> >>
> >>          den_polarity = 0;
> >> @@ -204,6 +247,9 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
> >>          DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
> >>          DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
> >>          DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
> >> +       DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
> >> +       DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
> >> +       DPU_REG_WRITE(c, INTF_ACTIVE_DATA_HCTL, active_data_hctl);
> > Are these registers present on all supported hardware (like sdm845)?
> > Does msm8998 support them? msm8996?
> >
> >>   }
> >>
> >>   static void dpu_hw_intf_enable_timing_engine(
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> index 3568be8..8fc71ce 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> @@ -30,6 +30,11 @@ struct intf_timing_params {
> >>          u32 border_clr;
> >>          u32 underflow_clr;
> >>          u32 hsync_skew;
> >> +
> >> +       bool wide_bus_en;
> >> +       bool compression_en;
> >> +       u32 extra_dto_cycles;   /* for DP only */
> >> +       u32 dce_bytes_per_line;
> > All compression-related items should come in a separate patch.
> >
> >>   };
> >>
> >>   struct intf_prog_fetch {
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> index 6d6850e..d738e2e 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> @@ -745,6 +745,7 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
> >>   {
> >>          struct dp_catalog_private *catalog = container_of(dp_catalog,
> >>                                  struct dp_catalog_private, dp_catalog);
> >> +       u32 reg;
> >>
> >>          dp_write_link(catalog, REG_DP_TOTAL_HOR_VER,
> >>                                  dp_catalog->total);
> >> @@ -753,7 +754,15 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
> >>          dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY,
> >>                                  dp_catalog->width_blanking);
> >>          dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, dp_catalog->dp_active);
> >> -       dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, 0);
> >> +
> >> +        reg = dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
> >> +
> >> +        if (dp_catalog->wide_bus_en)
> >> +                reg |= BIT(4);
> >> +        else
> >> +                reg &= ~BIT(4);
> >> +
> >> +        dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
> >>          return 0;
> >>   }
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> >> index 7dea101..6ca563f 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> >> @@ -70,6 +70,7 @@ struct dp_catalog {
> >>          enum dp_catalog_audio_sdp_type sdp_type;
> >>          enum dp_catalog_audio_header_type sdp_header;
> >>          u32 audio_data;
> >> +       bool wide_bus_en;
> >>   };
> >>
> >>   /* Debug module */
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> index 53ad3af..401ae57 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> @@ -1812,6 +1812,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
> >>          int ret = 0;
> >>          bool mainlink_ready = false;
> >>          struct dp_ctrl_private *ctrl;
> >> +       u32 pixel_rate_orig;
> >>
> >>          if (!dp_ctrl)
> >>                  return -EINVAL;
> >> @@ -1820,6 +1821,10 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
> >>
> >>          ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
> >>
> >> +       pixel_rate_orig = ctrl->dp_ctrl.pixel_rate;
> >> +       if (dp_ctrl->wide_bus_en)
> >> +               ctrl->dp_ctrl.pixel_rate >>= 1;
> >> +
> >>          drm_dbg_dp((struct drm_device *)NULL, "rate=%d, num_lanes=%d, pixel_rate=%d\n",
> >>                  ctrl->link->link_params.rate,
> >>                  ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
> >> @@ -1855,11 +1860,13 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
> >>           */
> >>          reinit_completion(&ctrl->video_comp);
> >>
> >> +       ctrl->catalog->wide_bus_en = dp_ctrl->wide_bus_en;
> > Can you limit the DP's knowledge of wide_bus_en to a single place
> > (e.g. only in dp_catalog or in dp_ctrl)? Just copying the data bit
> > means that we have two places which must be kept in sync.
> >
> >> +
> >>          dp_ctrl_configure_source_params(ctrl);
> >>
> >>          dp_catalog_ctrl_config_msa(ctrl->catalog,
> >>                  ctrl->link->link_params.rate,
> >> -               ctrl->dp_ctrl.pixel_rate, dp_ctrl_use_fixed_nvid(ctrl));
> >> +               pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl));
> >>
> >>          dp_ctrl_setup_tr_unit(ctrl);
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> >> index 2433edb..4dff44d 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> >> @@ -17,6 +17,7 @@ struct dp_ctrl {
> >>          bool orientation;
> >>          atomic_t aborted;
> >>          u32 pixel_rate;
> >> +       bool wide_bus_en;
> >>   };
> >>
> >>   int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index f89f3ed..924c9e2 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -873,6 +873,8 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
> >>                  return 0;
> >>          }
> >>
> >> +       dp->ctrl->wide_bus_en = dp_display->wide_bus_en;
> > Ugh. This adds a third place. dp_display, dp_ctrl and dp_catalog. Too
> > much for a single bit.
> >
> >> +
> >>          rc = dp_ctrl_on_stream(dp->ctrl);
> >>          if (!rc)
> >>                  dp_display->power_on = true;
> >> @@ -1004,6 +1006,8 @@ int dp_display_get_modes(struct msm_dp *dp,
> >>                  dp->connector, dp_mode);
> >>          if (dp_mode->drm_mode.clock)
> >>                  dp->max_pclk_khz = dp_mode->drm_mode.clock;
> >> +
> >> +       DRM_DEBUG_DP("wide_bus_en=%d\n", dp->wide_bus_en);
> >>          return ret;
> >>   }
> >>
> >> @@ -1503,6 +1507,8 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> >>   {
> >>          struct msm_drm_private *priv;
> >>          struct dp_display_private *dp_priv;
> >> +       struct msm_op_info *op;
> >> +       struct dp_display_private *dp;
> >>          int ret;
> >>
> >>          if (WARN_ON(!encoder) || WARN_ON(!dp_display) || WARN_ON(!dev))
> >> @@ -1545,6 +1551,17 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> >>
> >>          priv->bridges[priv->num_bridges++] = dp_display->bridge;
> >>
> >> +       dp = container_of(dp_display, struct dp_display_private, dp_display);
> >> +
> >> +       dp_display->wide_bus_en = dp->parser->has_widebus;
> >> +       dp_display->compression_en = dp->parser->has_compression;
> >> +
> >> +       op = &priv->op_info[dp->id];
> >> +       op->wide_bus_en = dp_display->wide_bus_en;
> >> +       op->compression_en = dp_display->compression_en;
> >> +
> >> +       drm_dbg_dp(dp->drm_dev, "id=%d widebus=%d compression=%d\n",
> >> +                       dp->id, op->wide_bus_en, op->compression_en);
> >>          return 0;
> >>   }
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> >> index e3adcd5..b1057cb 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> >> @@ -24,6 +24,9 @@ struct msm_dp {
> >>
> >>          hdmi_codec_plugged_cb plugged_cb;
> >>
> >> +       bool wide_bus_en;
> >> +       bool compression_en;
> >> +
> >>          u32 max_pclk_khz;
> >>
> >>          u32 max_dp_lanes;
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> >> index e74012d..fd48eb8 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> >> @@ -286,6 +286,28 @@ static int dp_parser_find_panel(struct dp_parser *parser)
> >>          return 0;
> >>   }
> >>
> >> +static void dp_parser_compression(struct dp_parser *parser)
> >> +{
> >> +       struct device *dev = &parser->pdev->dev;
> >> +
> >> +       parser->has_compression = of_property_read_bool(dev->of_node,
> >> +                               "qcom,compression-enable");
> >> +
> >> +       DRM_DEBUG_DP("compression parsing successful. compression:%d\n",
> >> +                       parser->has_compression);
> >> +}
> >> +
> >> +static void dp_parser_widebus(struct dp_parser *parser)
> >> +{
> >> +       struct device *dev = &parser->pdev->dev;
> >> +
> >> +       parser->has_widebus = of_property_read_bool(dev->of_node,
> >> +                               "qcom,widebus-enable");
> >> +
> >> +       DRM_DEBUG_DP("widebus parsing successful. widebus:%d\n",
> >> +                       parser->has_widebus);
> >> +}
> > All new properties should be described in the dt-bindings document.
> >
> > However I have a bigger question here. Who and how decides whether
> > compression or widebus should be enabled?
> >
> > Should we enable widebus for all generations that support it? If so,
> > this should be a part of msm_dp_config rather than the DTS property.
> > And I'm completely puzzled about the compression-enable here.
> >
> >
> >> +
> >>   static int dp_parser_parse(struct dp_parser *parser, int connector_type)
> >>   {
> >>          int rc = 0;
> >> @@ -319,6 +341,10 @@ static int dp_parser_parse(struct dp_parser *parser, int connector_type)
> >>           */
> >>          parser->regulator_cfg = &sdm845_dp_reg_cfg;
> >>
> >> +        dp_parser_widebus(parser);
> >> +
> >> +        dp_parser_compression(parser);
> >> +
> >>          return 0;
> >>   }
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> >> index 3172da0..7531fe2 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> >> @@ -123,6 +123,8 @@ struct dp_parser {
> >>          struct dp_display_data disp_data;
> >>          const struct dp_regulator_cfg *regulator_cfg;
> >>          u32 max_dp_lanes;
> >> +       bool has_widebus;
> >> +       bool has_compression;
> >>          struct drm_bridge *panel_bridge;
> >>
> >>          int (*parse)(struct dp_parser *parser, int connector_type);
> >> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> >> index d7574e6..1a5f3e9 100644
> >> --- a/drivers/gpu/drm/msm/msm_drv.h
> >> +++ b/drivers/gpu/drm/msm/msm_drv.h
> >> @@ -127,6 +127,11 @@ struct msm_display_info {
> >>          bool is_te_using_watchdog_timer;
> >>   };
> >>
> >> +struct msm_op_info {
> >> +       bool wide_bus_en;
> >> +       bool compression_en;
> >> +};
> >> +
> >>   /* Commit/Event thread specific structure */
> >>   struct msm_drm_thread {
> >>          struct drm_device *dev;
> >> @@ -156,6 +161,8 @@ struct msm_drm_private {
> >>
> >>          struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
> >>
> >> +       struct msm_op_info op_info[MSM_DP_CONTROLLER_COUNT];
> >> +
> > As I said before, it should be INTF_MAX. Or you can retrieve it from
> > priv->dp as needed instead.
> >
> >>          /* when we have more than one 'msm_gpu' these need to be an array: */
> >>          struct msm_gpu *gpu;
> >>
> >> @@ -338,6 +345,8 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi, struct drm_device *dev,
> >>   void __init msm_hdmi_register(void);
> >>   void __exit msm_hdmi_unregister(void);
> >>
> >> +struct msm_dp;
> >> +
> >>   struct msm_dsi;
> >>   #ifdef CONFIG_DRM_MSM_DSI
> >>   int dsi_dev_attach(struct platform_device *pdev);
> >> --
> >> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> >> a Linux Foundation Collaborative Project
> >>
> >



-- 
With best wishes
Dmitry
