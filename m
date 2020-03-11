Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35E841823B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 22:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729067AbgCKVLQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 17:11:16 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40612 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726684AbgCKVLQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 17:11:16 -0400
Received: by mail-pf1-f195.google.com with SMTP id l184so2034684pfl.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 14:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NSfkleXDa5UPJsZWkmUSl1QpNzKwRs0wnvQ0H8hAcuc=;
        b=UgFFS3MautlLOAeYiAPLohAO7UDp9cITkh8tKbVU+R8+PzZ84LCRDmE4r6j88TS8VF
         TtV7+eFJOw1U6dwNTENpSlCfGxrz1XIuw061O6GtubW6D+lbVb/ki1tQmUyJ5Zi9Iubu
         l2GjAnAp2tk5nFCUnGm49gG98L4bLmg0KOAnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NSfkleXDa5UPJsZWkmUSl1QpNzKwRs0wnvQ0H8hAcuc=;
        b=jVZFkEzL+INNcpKl4e4mnMEEcFcovUvrrffsHYCPTc2G1q9MdfSVvSJwvyqoNSd3P8
         ynRy/Q9hyFowhFG71LbMGYK9H4WOuJNUgrzte6Yl5boGtG16ph5BnVGuXlpmsfCpoyHx
         loBeEqjJ+j1CIKdePhMsnEIK/rfRz/vNOQmUKD8EXNLCnU5+hgUevP4ZdZtP1Ah6amAo
         a8KvDG3snNDL/8Lbo8x/qzXThxpYosIge2EcL5n5i4Yyqn92TYwi3YctZLGwZU2w30xq
         SLzlIFmcMAHNlLFx6623+ekFbPcRpj+P18JikditSXnuwPUsIkgCbBMFdqn8eUzy1DCX
         uWXw==
X-Gm-Message-State: ANhLgQ07Q6kU7wI6pviaZUoQMnh0DSvBT9Do8lRF0FyZfajfDK2URlmA
        yy5xEDrL0acgoRcPQQO1Y2HpJA==
X-Google-Smtp-Source: ADFU+vvdn/plQdKp95zl7wL0YroSpLRU6DvjOwBhsyyoJR3bH/TAf4i7y2lkFOcgEOXSJin55tABKg==
X-Received: by 2002:a63:9d04:: with SMTP id i4mr4553990pgd.294.1583961075013;
        Wed, 11 Mar 2020 14:11:15 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id u12sm51075103pfm.165.2020.03.11.14.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 14:11:14 -0700 (PDT)
Date:   Wed, 11 Mar 2020 14:11:13 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, sean@poorly.run
Subject: Re: [PATCH v6 2/2] drm/panel: add support for rm69299 visionox panel
 driver
Message-ID: <20200311211113.GC144492@google.com>
References: <20200311085807.21984-1-harigovi@codeaurora.org>
 <20200311085807.21984-3-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200311085807.21984-3-harigovi@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

thanks for re-spinning!

One more comment inline.

On Wed, Mar 11, 2020 at 02:28:07PM +0530, Harigovindan P wrote:

> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> new file mode 100644
> index 000000000000..b226723a7543
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
>
> ...
>
> +static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct visionox_rm69299 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	ctx->supplies[0].supply = "vdda";
> +	ctx->supplies[1].supply = "vdd3p3";
> +
> +	ret = devm_regulator_bulk_get(ctx->panel.dev, ARRAY_SIZE(ctx->supplies),
> +				      ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(ctx->panel.dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		DRM_DEV_ERROR(dev, "cannot get reset gpio %ld\n",
> +			PTR_ERR(ctx->reset_gpio));
> +		return PTR_ERR(ctx->reset_gpio);
> +	}
> +
> +	drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.dev = dev;
> +	ctx->panel.funcs = &visionox_rm69299_drm_funcs;
> +	drm_panel_add(&ctx->panel);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
> +		MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "dsi attach failed ret = %d\n", ret);
> +		goto err_dsi_attach;
> +	}
> +
> +	ret = regulator_set_load(ctx->supplies[0].consumer, 32000);
> +	if (ret) {
> +		mipi_dsi_detach(dsi);
> +		goto err_dsi_attach;
> +	}

the common way to do this kind of unwinding in the kernel would be to add
something like this before 'err_dsi_attach':

err_set_load:
	mipi_dsi_detach(dsi);


and then just do 'goto err_set_load' in the error paths.

> +
> +	ret = regulator_set_load(ctx->supplies[1].consumer, 13200);
> +	if (ret) {
> +		mipi_dsi_detach(dsi);
> +		goto err_dsi_attach;
> +	}
> +
> +	return 0;
> +
> +err_dsi_attach:
> +	drm_panel_remove(&ctx->panel);
> +	return ret;
> +}

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
