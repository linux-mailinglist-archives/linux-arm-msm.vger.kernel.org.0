Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9846D76690B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 11:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235552AbjG1Jhb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 05:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235541AbjG1Jha (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 05:37:30 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51E310EC
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 02:37:28 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d1c988afebfso1792047276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 02:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690537048; x=1691141848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JlZf2RL3i6UDORQb9mZw6fYIEm2cS2iGuc+pwaym0fI=;
        b=uUz/3R3iJOplNYB1AkkHSjLhoozRziAFHJjM631Jfbue8Cm+UFJjT0tGZCToZB1gcU
         4IyPWiViAfuq6WdsCO23qHimmlsX0XzNNE7K9OxEU99kmjk/fxyA37ByIf5gDDICcBuZ
         Q3G++K7KkaqCZkMCXAnPkDuDlyX1mjsAf8wyXiPqrLxA/AW9GcLzl6ul3rk4iSreEC2Y
         BUcIoCMXwphAz8I2/h1BC0TWhRmmjf/MaixUsxb72SuMSdj5ejdQ5q5s7usOup9rK+Zk
         XZtxodYYQYsWVhwofTSMzWCoUFFIWxU99JPF7pIOkpCn1Gi67VBlsruBKj9D7FR3Sfiq
         DRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690537048; x=1691141848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlZf2RL3i6UDORQb9mZw6fYIEm2cS2iGuc+pwaym0fI=;
        b=jU/AATLuPJsqQYN+RcGETQiqzkFB6NQwXnXynpQ6BPLMMozu3ab1p2xu5nV/VttR+6
         1SbH+5mDFbyT1V4LqJP4ONP1Sz08RiEsVVc5nMpZQf74XM0AHH62v3meSl7QF+l1e5hI
         MjL4F9Bv0dJjkFgFmOfY/YMJwvoBCF0WCfCKlu1G/YqQumbbtfNCNcAoJlatdn9X7vy9
         PIqWvMiH2JHcrDTfo2VEQY8x5OzegAKARU6P7vcQP7JZdlPtZ+A/Hzc1QHQXCGbwEGfL
         wR8ZAooN6X1jhYcar5wY7cVZEyRIKY0YTocQ45xLRbyOer4WVbhiuUt96f24WFxaC14R
         wLsQ==
X-Gm-Message-State: ABy/qLaCj/Tw1zxtL+/jc3Eu+c9OSocbYxBuHByK71Wdo/Ovv4kQgAAx
        uu9UCAss4Kw/w44ttffNhdZVjDlxB1Mq/qAiD0Macw==
X-Google-Smtp-Source: APBJJlHP+0vhBr5pqqSindcVAEKtPZL7T+Mqdb+FcAqoZgG9TNDCetnFMDUrGRwkofjLPfASs0KY9UC1k96BrCfnA5Q=
X-Received: by 2002:a5b:88c:0:b0:bca:7cd:7f32 with SMTP id e12-20020a5b088c000000b00bca07cd7f32mr1208001ybq.48.1690537048006;
 Fri, 28 Jul 2023 02:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230728012623.22991-1-quic_parellan@quicinc.com>
In-Reply-To: <20230728012623.22991-1-quic_parellan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 28 Jul 2023 12:37:17 +0300
Message-ID: <CAA8EJpqPgzd4ZSP948MQW=f4EVBHxajj4nwYq5s-OConBP7Vvg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: Enable DSC and CMD mode for Visionox
 VTDR6130 panel
To:     Paloma Arellano <quic_parellan@quicinc.com>
Cc:     neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
        daniel@ffwll.ch, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
        marijn.suijten@somainline.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 28 Jul 2023 at 04:26, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Enable display compression (DSC v1.2) and CMD mode for 1080x2400 Visionox
> VTDR6130 AMOLED DSI panel. In addition, this patch will set the default
> to command mode with DSC enabled.
>
> Note: This patch has only been validated DSC over command mode as DSC over
> video mode has never been validated for the MSM driver before.
>
> Depends on: "Add prepare_prev_first flag to Visionox VTDR6130" [1]
>
> Changes since v1:
>  - Changed from email address
>
> [1] https://patchwork.freedesktop.org/series/121337/
>
> Suggested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  .../gpu/drm/panel/panel-visionox-vtdr6130.c   | 77 ++++++++++++++++++-
>  1 file changed, 73 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> index e1363e128e7e..5658d39a3a6b 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> @@ -9,6 +9,7 @@
>  #include <linux/of.h>
>
>  #include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_modes.h>
>  #include <drm/drm_panel.h>
> @@ -20,7 +21,8 @@ struct visionox_vtdr6130 {
>         struct mipi_dsi_device *dsi;
>         struct gpio_desc *reset_gpio;
>         struct regulator_bulk_data supplies[3];
> -       bool prepared;
> +       bool prepared, enabled;
> +       bool video_mode;
>  };
>
>  static inline struct visionox_vtdr6130 *to_visionox_vtdr6130(struct drm_panel *panel)
> @@ -50,12 +52,18 @@ static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
>         if (ret)
>                 return ret;
>
> +       mipi_dsi_dcs_write_seq(dsi, 0x03, 0x01);
>         mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
>         mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0x00, 0x00);
>         mipi_dsi_dcs_write_seq(dsi, 0x59, 0x09);
>         mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x01);
>         mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
> +
> +       if (ctx->video_mode)
> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
> +       else
> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x02);
> +
>         mipi_dsi_dcs_write_seq(dsi, 0x70,
>                                0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 0x09, 0x60, 0x04,
>                                0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 0x1c, 0x02, 0x00,
> @@ -214,6 +222,42 @@ static const struct drm_display_mode visionox_vtdr6130_mode = {
>         .height_mm = 157,
>  };
>
> +static int visionox_vtdr6130_enable(struct drm_panel *panel)
> +{
> +       struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
> +       struct mipi_dsi_device *dsi = ctx->dsi;
> +       struct drm_dsc_picture_parameter_set pps;
> +       int ret;
> +
> +       if (ctx->enabled)
> +               return 0;
> +
> +       if (!dsi->dsc) {
> +               dev_err(&dsi->dev, "DSC not attached to DSI\n");
> +               return -ENODEV;
> +       }

The error message is misleading. Also, if you don't want to enable DSC
for the video mode, this will break.

> +
> +       drm_dsc_pps_payload_pack(&pps, dsi->dsc);
> +       ret = mipi_dsi_picture_parameter_set(dsi, &pps);
> +       if (ret) {
> +               dev_err(&dsi->dev, "Failed to set PPS\n");
> +               return ret;
> +       }
> +
> +       ctx->enabled = true;

Do we need this refcount just for PPS upload? What will happen if PPS
is uploaded several times?

> +
> +       return 0;
> +}
> +
> +static int visionox_vtdr6130_disable(struct drm_panel *panel)
> +{
> +       struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
> +
> +       ctx->enabled = false;
> +
> +       return 0;
> +}
> +
>  static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
>                                        struct drm_connector *connector)
>  {
> @@ -237,6 +281,8 @@ static const struct drm_panel_funcs visionox_vtdr6130_panel_funcs = {
>         .prepare = visionox_vtdr6130_prepare,
>         .unprepare = visionox_vtdr6130_unprepare,
>         .get_modes = visionox_vtdr6130_get_modes,
> +       .enable = visionox_vtdr6130_enable,
> +       .disable = visionox_vtdr6130_disable,
>  };
>
>  static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
> @@ -269,11 +315,31 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>  {
>         struct device *dev = &dsi->dev;
>         struct visionox_vtdr6130 *ctx;
> +       struct drm_dsc_config *dsc;
>         int ret;
>
>         ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>         if (!ctx)
>                 return -ENOMEM;
> +
> +       ctx->video_mode = of_property_read_bool(dev->of_node, "enforce-video-mode");

Please also add a DT bindings patch.

> +
> +       dsc = devm_kzalloc(dev, sizeof(*dsc), GFP_KERNEL);
> +       if (!dsc)
> +               return -ENOMEM;

You can add struct drm_dsc_config to struct visionox_vtdr6130 instead
of allocating it.

> +
> +       /* Set DSC params */
> +       dsc->dsc_version_major = 0x1;
> +       dsc->dsc_version_minor = 0x2;
> +
> +       dsc->slice_height = 40;
> +       dsc->slice_width = 540;
> +       dsc->slice_count = 2;
> +       dsc->bits_per_component = 8;
> +       dsc->bits_per_pixel = 8 << 4;
> +       dsc->block_pred_enable = true;
> +
> +       dsi->dsc = dsc;

Only in command mode?

>
>         ctx->supplies[0].supply = "vddio";
>         ctx->supplies[1].supply = "vci";
> @@ -294,8 +360,11 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>
>         dsi->lanes = 4;
>         dsi->format = MIPI_DSI_FMT_RGB888;
> -       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
> -                         MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +       dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_CLOCK_NON_CONTINUOUS;

Keep the line split please.

> +       if (ctx->video_mode)
> +               dsi->mode_flags |= MIPI_DSI_MODE_VIDEO;
> +
>         ctx->panel.prepare_prev_first = true;
>
>         drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
