Return-Path: <linux-arm-msm+bounces-15577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C83588902AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 16:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E56901C22AE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 15:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70EF128394;
	Thu, 28 Mar 2024 15:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KgvHtZgw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5F27F7C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 15:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711638627; cv=none; b=uhPFuj6TOk2h1NR9Dha5tZfIJk/7O5UyJ/UrrLg9l5aKtvZPAdZHd4+ILWPNLF7cnyNbXZO691R6f2V74kNVyCThwdVfQTiIxhphQ+sxosLm75mdJhRMAYGwo+A+mSPaEm2EwUXHCWmpqn4VCDXKdGPYWRGOtfOjBN+oCJ+qJ6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711638627; c=relaxed/simple;
	bh=szjqTbMU/Rig7mtQ5FSVmYRfe3YGhHM8LFctQiR2YhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VutuAwV3EH4rZwaaiVjEOeN8aL65QHC57b+TaWKvKDD262COnaOBPD3m9xKGSte2rqqyMHxcSRKPzq1vFnIBzaDCyfmGhJzX0MOzDXqwAM0nM2gsaWLbJ+5gI3LoNccIfVRduCzdiW3bQwopmDY9kJpKAWahVZ6NfVVNmqWRoGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KgvHtZgw; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-60a0a1bd04eso11806847b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 08:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711638625; x=1712243425; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=99Mo/V68HXd+sz5mhFpevV6sd2JzgGnAsHv1MLNMKAI=;
        b=KgvHtZgwu25Qljt5yd2+CqakkyGrS0pxF2qG64VYglSWNzXYrsa5MuUXA+DKiMz6BV
         MPnosoPhMe2xteB/b9Z1KMsXW4eGIItvQEzQbNl4si7aNYygSBzXuZ9s+kZb03Uw8QgJ
         hxR2DC3cN4OsuYMEcAhsMTWPJj0H0mpBscm49/I+Y8V4kzH5CCj3MGAdHDRzuB1FNT5A
         OVODFxvxz2PSt6B3S4VkGD+KlKZ6FaFq9DLOqjDkpRx2r0Yt8a9YRWQRoBqrNtOD/Uox
         Xywi+qpAAYlIalQnsq4OJe0UqseOszlR5uW9aGn2CYlbFUM5FCCCy+/BruUNeEbyJHFq
         /dMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638625; x=1712243425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99Mo/V68HXd+sz5mhFpevV6sd2JzgGnAsHv1MLNMKAI=;
        b=RK8L1/FoU3pzKBQeAnwlt4p0Y3E36sbS7Mtxo36uzDfHtYegZ2dWChMRkKzdPjqMpQ
         eTAamxF5tiR+wDUtpfA6fnOfbVg7Te4hrDg5YbkFakH28Vh+IA0YLnsDbt0nUxbpsroM
         cgXeJZnstGUOLgx4o3d/C479/DDvEPLTBIcNhXuPmsRnFVvWb6YvLUjK58ec40v0SU4W
         naAP6i7zsyDbEywa+DUiYmQ1oaPZiwszeDCcZPsIjU1/H5IEw4WdIsf0zfZ6Oi97yz2X
         7UTRtpHpawc+N0d99lXmcLKOFXPxRPMJC7I1uo5I1/Son3w3c0p06kT1upyo6j0AKdu3
         LpMA==
X-Forwarded-Encrypted: i=1; AJvYcCWEqkrLsuOX6t4mYE3JUmfeDnhwnmpA23tynkOHQWpw/v/Jc4CAnVgNCrHx5RA21mZXWTG+yqDdWkKGK9ogImxIiTikNZojE/8WoIz8Dw==
X-Gm-Message-State: AOJu0YyoXptVPw9f+xmqTIbwqEp9Jnc30KzdMKns/n6Oi/7HLoDnDjsh
	OeO4p/vrE0Dtaw+K4w515HdLqlcxHHyNAUiZ0NCvtu8bL+2xfWkskSBkDqnBTNtwwlfqa5uwNyE
	qH7xkIZLhvGFTZ0Nb4Iq20RIu1MVH99mXbLfZag==
X-Google-Smtp-Source: AGHT+IGuA+4cx73FJucI79bJNmTxWLp9SJ6WHwW9pxoOqq2SDliWPzccRf/ZrY5es961w3mun8AqdWA4kSgWxOoQM+0=
X-Received: by 2002:a25:aae6:0:b0:dcc:2f94:591a with SMTP id
 t93-20020a25aae6000000b00dcc2f94591amr2639484ybi.12.1711638624863; Thu, 28
 Mar 2024 08:10:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328111158.2074351-1-jun.nie@linaro.org> <20240328111158.2074351-3-jun.nie@linaro.org>
In-Reply-To: <20240328111158.2074351-3-jun.nie@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Mar 2024 17:10:13 +0200
Message-ID: <CAA8EJpphXsj6JCqT7k5NoeXvn7cgvW7otEXEq7h2rPyu1xP6gA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel: Enable DSC for Visionox VTDR6130 panel
To: Jun Nie <jun.nie@linaro.org>
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com, 
	daniel@ffwll.ch, quic_parellan@quicinc.com, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	marijn.suijten@somainline.org, sean@poorly.run
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2024 at 13:12, Jun Nie <jun.nie@linaro.org> wrote:
>
> Enable display compression (DSC v1.2) for 1080x2400 Visionox
> VTDR6130 AMOLED DSI panel. DTS property is needed to enable DSC.
> Default configuration is video mode + non-DSC for any back
> compatibility.

The changelog talks about the DSC only, while the changes also include
the CMD mode support. This should be split to a separate patch.

>
> Below modes works on SM8650. While cmd mode does not work yet.
> - video mode + DSC
> - video mode
> - cmd mode + DSC
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../gpu/drm/panel/panel-visionox-vtdr6130.c   | 58 ++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> index 540099253e1b..d6c44816cdd0 100644
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
> @@ -17,9 +18,12 @@
>
>  struct visionox_vtdr6130 {
>         struct drm_panel panel;
> +       struct drm_dsc_config dsc;
>         struct mipi_dsi_device *dsi;
>         struct gpio_desc *reset_gpio;
>         struct regulator_bulk_data supplies[3];
> +       bool cmd_mode;
> +       bool dsc_enable;
>  };
>
>  static inline struct visionox_vtdr6130 *to_visionox_vtdr6130(struct drm_panel *panel)
> @@ -49,12 +53,20 @@ static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
>         if (ret)
>                 return ret;
>
> +       if (ctx->dsc_enable)
> +               mipi_dsi_dcs_write_seq(dsi, 0x03, 0x01);

It it really MIPI_DCS_GET_COMPRESSION_MODE?
> +
>         mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
>         mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0x00, 0x00);
>         mipi_dsi_dcs_write_seq(dsi, 0x59, 0x09);
>         mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x01);
>         mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
> +
> +       if (ctx->cmd_mode)
> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x02);
> +       else
> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
> +
>         mipi_dsi_dcs_write_seq(dsi, 0x70,
>                                0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 0x09, 0x60, 0x04,
>                                0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 0x1c, 0x02, 0x00,
> @@ -205,6 +217,26 @@ static const struct drm_display_mode visionox_vtdr6130_mode = {
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
> +       if (!dsi->dsc)
> +               return 0;
> +
> +       drm_dsc_pps_payload_pack(&pps, dsi->dsc);
> +       ret = mipi_dsi_picture_parameter_set(dsi, &pps);
> +       if (ret) {
> +               dev_err(&dsi->dev, "Failed to set PPS\n");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
>                                        struct drm_connector *connector)
>  {
> @@ -228,6 +260,7 @@ static const struct drm_panel_funcs visionox_vtdr6130_panel_funcs = {
>         .prepare = visionox_vtdr6130_prepare,
>         .unprepare = visionox_vtdr6130_unprepare,
>         .get_modes = visionox_vtdr6130_get_modes,
> +       .enable = visionox_vtdr6130_enable,
>  };
>
>  static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
> @@ -260,12 +293,32 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>  {
>         struct device *dev = &dsi->dev;
>         struct visionox_vtdr6130 *ctx;
> +       struct drm_dsc_config *dsc;
>         int ret;
>
>         ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>         if (!ctx)
>                 return -ENOMEM;
>
> +       ctx->cmd_mode = of_property_read_bool(dev->of_node, "enforce-cmd-mode");
> +       ctx->dsc_enable = of_property_read_bool(dev->of_node, "enable-dsc");
> +
> +       /* Set DSC params */
> +       if (ctx->dsc_enable) {
> +               dsc = &ctx->dsc;
> +               dsc->dsc_version_major = 0x1;
> +               dsc->dsc_version_minor = 0x2;
> +               dsc->slice_height = 40;
> +               dsc->slice_width = 540;
> +               dsc->slice_count = 2;
> +               dsc->slice_per_pkt = 1;
> +               dsc->bits_per_component = 8;
> +               dsc->bits_per_pixel = 8 << 4;
> +               dsc->block_pred_enable = true;
> +
> +               dsi->dsc = dsc;
> +       }
> +
>         ctx->supplies[0].supply = "vddio";
>         ctx->supplies[1].supply = "vci";
>         ctx->supplies[2].supply = "vdd";
> @@ -306,6 +359,9 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>                 return ret;
>         }
>
> +       dev_err(&dsi->dev, "discovered with %s mode %s\n",
> +               ctx->cmd_mode ? "cmd" : "video",
> +               ctx->dsc_enable ? "and DSC enabled" : "");
>         return 0;
>  }
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

