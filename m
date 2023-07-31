Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0E2B769621
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 14:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbjGaMXO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 08:23:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232688AbjGaMWp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 08:22:45 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8742E2102
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 05:22:17 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbea147034so41084855e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 05:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690806128; x=1691410928;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A4mgsWIblbleGBgZVE8mWDeP/VSm/Wrg5gNu6XuDsk8=;
        b=mwqpL+fowHFu3QuTmqTSjyE9Fi2R3A1QOOoxFb4T/iUBlBnYzwNXiVvRyylPs+lPWZ
         eoMfVtqbM6heWPDVJjTO6zzENSYsZ40jXTyvufnuU8X6FmjvphEtiRSrCLrpzXfJ6BwO
         YB97kBguqbEpH5yhQYWk1K6RSFMDuZHYff1cKyXsSr1RFhG7rWUIMsVO655JQJ7ixPzZ
         I88huzZVwQD05XNLLBe7FKoQa6yyMahing0V2nL+F9oHo4BBajSCRkzTktwLpDR6ZkIM
         wVt7JFfY4/h/xKLZMxXhfF06BFtyyFIw0+AWeVaJxsiM0nylSEPMhPe55A8+0oRY4a7K
         F/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690806128; x=1691410928;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4mgsWIblbleGBgZVE8mWDeP/VSm/Wrg5gNu6XuDsk8=;
        b=GDN6U49fR6NL+Vri/y5eqZ7SJdsoIBf8betTzZ00dBAefY+UWMYAMFF9wp0Kqgj4Ns
         etCF+gB1/lEOeUkNnAe4DK2+i/OeWeXRESWl79rEQfaQu852aBXCKzEHYuwwjpdsl7gT
         82kskpF4K6p+fn+zuGXkeqR+MhANpYYR4VxkNXksZsUyWwbvrNhzkwWoHt1HwnSDMEbU
         b8zFzEXT6MOIXRn0DSuNu5WZDYtBL+XCArAYn8tlMCLs7LCDXwAAi6akLGQiwFhnaOqA
         kdGXdHe5Z9h/sV8MxjDXdrAQaYBe16dpPFpzVXC/Y9KUKkbXxCozt4QYUNv/PVfLdftK
         oucg==
X-Gm-Message-State: ABy/qLaiWdvbpinfY4q/GrNLa4vLK8KZ5hSaumf0mwfq86Pa3X7GVOTT
        7LRiKK9Evq0hF07orD3D+PEb+g==
X-Google-Smtp-Source: APBJJlFmp3FCugsBi3ORgXdIQH09ClZ2ur7LmT6VOBu0l3eAanlyXQSMpH7kRAK1vERaZslxZqRkOw==
X-Received: by 2002:a05:600c:2053:b0:3fe:1dad:5403 with SMTP id p19-20020a05600c205300b003fe1dad5403mr2353449wmg.23.1690806127898;
        Mon, 31 Jul 2023 05:22:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f723:b60b:92cd:4df4? ([2a01:e0a:982:cbb0:f723:b60b:92cd:4df4])
        by smtp.gmail.com with ESMTPSA id x1-20020a5d54c1000000b003176f2d9ce5sm13030166wrv.71.2023.07.31.05.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 05:22:07 -0700 (PDT)
Message-ID: <bbf20a36-3c78-7488-f5c9-82ad62f6fc2b@linaro.org>
Date:   Mon, 31 Jul 2023 14:22:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/panel: Enable DSC and CMD mode for Visionox
 VTDR6130 panel
Content-Language: en-US
To:     Paloma Arellano <quic_parellan@quicinc.com>, sam@ravnborg.org,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        dmitry.baryshkov@linaro.org, quic_abhinavk@quicinc.com,
        quic_jesszhan@quicinc.com, marijn.suijten@somainline.org
References: <20230728012623.22991-1-quic_parellan@quicinc.com>
Organization: Linaro Developer Services
In-Reply-To: <20230728012623.22991-1-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 28/07/2023 03:26, Paloma Arellano wrote:
> Enable display compression (DSC v1.2) and CMD mode for 1080x2400 Visionox
> VTDR6130 AMOLED DSI panel. In addition, this patch will set the default
> to command mode with DSC enabled.
> 
> Note: This patch has only been validated DSC over command mode as DSC over
> video mode has never been validated for the MSM driver before.
> 
> Depends on: "Add prepare_prev_first flag to Visionox VTDR6130" [1]

I'll run a test on my SM8550 platform,

Thanks,
Neil

> 
> Changes since v1:
>   - Changed from email address
> 
> [1] https://patchwork.freedesktop.org/series/121337/
> 
> Suggested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   .../gpu/drm/panel/panel-visionox-vtdr6130.c   | 77 ++++++++++++++++++-
>   1 file changed, 73 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> index e1363e128e7e..5658d39a3a6b 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> @@ -9,6 +9,7 @@
>   #include <linux/of.h>
>   
>   #include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
>   #include <drm/drm_mipi_dsi.h>
>   #include <drm/drm_modes.h>
>   #include <drm/drm_panel.h>
> @@ -20,7 +21,8 @@ struct visionox_vtdr6130 {
>   	struct mipi_dsi_device *dsi;
>   	struct gpio_desc *reset_gpio;
>   	struct regulator_bulk_data supplies[3];
> -	bool prepared;
> +	bool prepared, enabled;
> +	bool video_mode;
>   };
>   
>   static inline struct visionox_vtdr6130 *to_visionox_vtdr6130(struct drm_panel *panel)
> @@ -50,12 +52,18 @@ static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
>   	if (ret)
>   		return ret;
>   
> +	mipi_dsi_dcs_write_seq(dsi, 0x03, 0x01);
>   	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
>   	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0x00, 0x00);
>   	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x09);
>   	mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x01);
>   	mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
> +	
> +	if (ctx->video_mode)
> +		mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
> +	else
> +		mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x02);
> +
>   	mipi_dsi_dcs_write_seq(dsi, 0x70,
>   			       0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 0x09, 0x60, 0x04,
>   			       0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 0x1c, 0x02, 0x00,
> @@ -214,6 +222,42 @@ static const struct drm_display_mode visionox_vtdr6130_mode = {
>   	.height_mm = 157,
>   };
>   
> +static int visionox_vtdr6130_enable(struct drm_panel *panel)
> +{
> +	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct drm_dsc_picture_parameter_set pps;
> +	int ret;
> +
> +	if (ctx->enabled)
> +		return 0;
> +
> +	if (!dsi->dsc) {
> +		dev_err(&dsi->dev, "DSC not attached to DSI\n");
> +		return -ENODEV;
> +	}
> +
> +	drm_dsc_pps_payload_pack(&pps, dsi->dsc);
> +	ret = mipi_dsi_picture_parameter_set(dsi, &pps);
> +	if (ret) {
> +		dev_err(&dsi->dev, "Failed to set PPS\n");
> +		return ret;
> +	}
> +
> +	ctx->enabled = true;
> +
> +	return 0;
> +}
> +
> +static int visionox_vtdr6130_disable(struct drm_panel *panel)
> +{
> +	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
> +
> +	ctx->enabled = false;
> +
> +	return 0;
> +}
> +
>   static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
>   				       struct drm_connector *connector)
>   {
> @@ -237,6 +281,8 @@ static const struct drm_panel_funcs visionox_vtdr6130_panel_funcs = {
>   	.prepare = visionox_vtdr6130_prepare,
>   	.unprepare = visionox_vtdr6130_unprepare,
>   	.get_modes = visionox_vtdr6130_get_modes,
> +	.enable = visionox_vtdr6130_enable,
> +	.disable = visionox_vtdr6130_disable,
>   };
>   
>   static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
> @@ -269,11 +315,31 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>   {
>   	struct device *dev = &dsi->dev;
>   	struct visionox_vtdr6130 *ctx;
> +	struct drm_dsc_config *dsc;
>   	int ret;
>   
>   	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>   	if (!ctx)
>   		return -ENOMEM;
> +	
> +	ctx->video_mode = of_property_read_bool(dev->of_node, "enforce-video-mode");
> +
> +	dsc = devm_kzalloc(dev, sizeof(*dsc), GFP_KERNEL);
> +	if (!dsc)
> +		return -ENOMEM;
> +
> +	/* Set DSC params */
> +	dsc->dsc_version_major = 0x1;
> +	dsc->dsc_version_minor = 0x2;
> +
> +	dsc->slice_height = 40;
> +	dsc->slice_width = 540;
> +	dsc->slice_count = 2;
> +	dsc->bits_per_component = 8;
> +	dsc->bits_per_pixel = 8 << 4;
> +	dsc->block_pred_enable = true;
> +
> +	dsi->dsc = dsc;
>   
>   	ctx->supplies[0].supply = "vddio";
>   	ctx->supplies[1].supply = "vci";
> @@ -294,8 +360,11 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>   
>   	dsi->lanes = 4;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
> -			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	if (ctx->video_mode)
> +		dsi->mode_flags |= MIPI_DSI_MODE_VIDEO;
> +
>   	ctx->panel.prepare_prev_first = true;
>   
>   	drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,

