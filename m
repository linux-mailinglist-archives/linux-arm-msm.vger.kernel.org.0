Return-Path: <linux-arm-msm+bounces-79102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 57208C131CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 07:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1EDA84E7135
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 06:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81981E9915;
	Tue, 28 Oct 2025 06:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERkCIuSS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEDE25F998
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761632513; cv=none; b=KKUuRxntXY2lbLFe3FI28F+5CtkI85vj9QNNox2IJ3XcnfnY8Cz73Fvj++GDObAoMusE9kqSaB+miJWhE9saRScaV6tpHD/zXhPiCDWPkO1Rrs01m8qtKOSb/5yXIkyCEFvwupMWa0MDXGiQSrLRq1ZpXkX06nU98N24wqWNkUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761632513; c=relaxed/simple;
	bh=dZ9+EA17n8ngDQPMAJCALPSSyhvm6svExbrafHM/pWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PZwRKqynCD9+/cC++/TG1rSeDXWkxlX8rmN78+Ku/HmLp7XItVt7zF1xiqDKI0MYSyZ5fVmz8YZFsvlMQLsJCbwqnTAmfgB2UK8usEIs6vjLd91srxp1rrWkvRsJoAJvAxYgbWpf4sEvv8pdHHBf3fi7/DWlD76FMYu+/Invq6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERkCIuSS; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-79af647cef2so4732887b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 23:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761632511; x=1762237311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NgHMpwlHuOnBpxm0zPc6SCzN8kyKP0e1eTZTOVapBjY=;
        b=ERkCIuSSzSlVr7myQA4INmklPGvqcbwV/4SCluhFmNBpU4hDZy6R332VwbUpSGJjcA
         2O6tRfE3Lx3myIPawvqCJKjnIIRtT0AOVzwRhiv2kK5WijHAOl6Wywq6HvQRqDUzEkSE
         jva7veDLvgJb7KmPwBFW+XnSiwuJHEYC67+y4JtBgVX0IerIHJn5MwBF+fQzGfVTlOwD
         tVPpYKQnwdX8O9L999OPKDVx1+HB/Isx6xKFgS+fJA2SAoU+wwJ1yveOyjy2VmAd2VHd
         +EDrQ2IRqSHkZJHZrvRidF+YEPV8dkVP3eM434WUbDbctzymlo7KAbbNIUp7pY+GfK5t
         e2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632511; x=1762237311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NgHMpwlHuOnBpxm0zPc6SCzN8kyKP0e1eTZTOVapBjY=;
        b=iqfaqbubX7DwOcY1P7rtAuy0h95b57UbAgkR1oW6by4ziDKkETe+nPrXEBCOTVv1n9
         OzMOas0lx+dvaIoblUKOyfeSIqOpU/9lzNtLep4RMCjygVWpLU2A28JawCLJqLmZCx57
         bdHpMQfgNEE0JdgomQZk/vryXM0mHu6xbi4xSMXSZfwSOCW8nrVoUyon6bLm3fzHDKJ4
         RdgSbBYVhvlyp81YYv+J+P1qJCAFPXJxUnwrKvqGdyxZx+YDTk9ioZpEH2ghGWHDti0L
         nYGRTzeMJyeK0fCTEepwPyccxpAbOX7DZov3dpRSBLikKEegCEonb+IzvT8RNsiW2RiK
         MWEA==
X-Forwarded-Encrypted: i=1; AJvYcCXC4RFFdHAWntPqq7ljRzp/WIIRRwae6HK6rRuxpNpt2RezgFijC13xPnzpsQScd6IyIxiF/eSp7UCQJyic@vger.kernel.org
X-Gm-Message-State: AOJu0YxcXCyVw5mJZrS/5uk5pQIhmDL2RgJcMwpRWrF6YN+Nyzx3oK0j
	hUx4HGXz629Y1qx00bHNuz0FDUu3Rk7HoUnTm3RcgA3gOtwSqYNd6RjW
X-Gm-Gg: ASbGncvm1l9Uz4DPEDDkUVg7KT1IHs1YWgsSpcPl5N4jGqfyErT7dq9Z7bE+mfudV4K
	FyuFiwnJflIfrYHbPLJQZXa+J7rpUCfdUiW4ecz99efV144vErCqgblC1YKgI0CPYpdS1uhTi1W
	XqNUFEYVR4UZY5PGffFvLZY3cSorp+nUUCUOzNw9ChOGXzvfvCA/epCPlNZy6WYkxN8V/OkBWe3
	SKwrb3K9MWFfrMaiX+orGH6awP6m6tGtlsHr2MqyBT/bB9Xg8f1pAbRpwzg/m1jqwXiEoJQvI26
	aH54kdrMuJO/x50VfdKOGzokJi/HrAYZ9k0zdrldYoZjFjaFM0/6Wd7grXL/DiTc0YKqfgLQ2dP
	pek41HzAbGyNpBf6hWm+rpCZJDUGDjtOHQOmHsGpurtv7ll8jg/Ru/8Fn9Alz7h/nm3MLqyTq/9
	EYwOkgYSUzNKEJAd2hpuZBkYmDpB8I9Mw9/8s4ee0xf6tzjE8uKv8kRQ==
X-Google-Smtp-Source: AGHT+IGBe3e5+Mtkfl/Q5HRfo/InytwOscDVZQTNvh7VoFAM12l0xIciWr8qOhdytoE0iNFahacqjw==
X-Received: by 2002:a05:6a00:1907:b0:7a2:83f2:4989 with SMTP id d2e1a72fcca58-7a441bc89c9mr3091499b3a.5.1761632510687;
        Mon, 27 Oct 2025 23:21:50 -0700 (PDT)
Received: from ?IPV6:2600:8802:702:7400:1c69:7897:d90:375b? ([2600:8802:702:7400:1c69:7897:d90:375b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012bf4sm10509547b3a.1.2025.10.27.23.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 23:21:50 -0700 (PDT)
Message-ID: <04a39c10-6279-45f9-ad4c-26f959422035@gmail.com>
Date: Mon, 27 Oct 2025 23:21:48 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
 <20251023-s6e3fc2x01-v5-2-8f8852e67417@ixit.cz>
Content-Language: en-US
From: Jessica Zhang <jesszhan0024@gmail.com>
In-Reply-To: <20251023-s6e3fc2x01-v5-2-8f8852e67417@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/2025 1:24 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add panel driver used in the OnePlus 6T.
> 
> No datasheet, based mostly on EDK2 init sequence and the downstream driver.
> 
> Note: This driver doesn't use previously mentioned "samsung,s6e3fc2x01"
> by OnePlus 6T device-tree.
> The reason is because DDIC itself without knowing the panel type used
> with it will not give the driver enough information about the panel used,
> as the panel cannot be autodetected.
> While would be more practical to support the original compatible,
> I would like to avoid it, to prevent confusing devs upstreaming DDICs.
> 
> Based on work of:
>    Casey Connolly <casey@connolly.tech>
>    Joel Selvaraj <foss@joelselvaraj.com>
>    Nia Espera <a5b6@riseup.net>
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Jessica Zhang <jesszhan0024@gmail.com>

> ---
>   MAINTAINERS                                      |   1 +
>   drivers/gpu/drm/panel/Kconfig                    |  13 +
>   drivers/gpu/drm/panel/Makefile                   |   1 +
>   drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c | 385 +++++++++++++++++++++++
>   4 files changed, 400 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 42be36b42c29b..a3296756f5ca3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8065,6 +8065,7 @@ DRM DRIVER FOR SAMSUNG S6E3FC2X01 DDIC
>   M:	David Heidelberg <david@ixit.cz>
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
> +F:	drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
>   
>   DRM DRIVER FOR SAMSUNG S6E3HA8 PANELS
>   M:	Dzmitry Sankouski <dsankouski@gmail.com>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 045ffb2ccd0f0..fadb7f397837e 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -801,6 +801,19 @@ config DRM_PANEL_SAMSUNG_S6D7AA0
>   	select DRM_MIPI_DSI
>   	select VIDEOMODE_HELPERS
>   
> +config DRM_PANEL_SAMSUNG_S6E3FC2X01
> +	tristate "Samsung S6E3FC2X01 DSI panel controller"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select VIDEOMODE_HELPERS
> +	help
> +	  Say Y or M here if you want to enable support for the
> +	  Samsung S6E3FC2 DDIC and connected MIPI DSI panel.
> +	  Currently supported panels:
> +
> +	    Samsung AMS641RW (found in the OnePlus 6T smartphone)
> +
>   config DRM_PANEL_SAMSUNG_S6E3HA2
>   	tristate "Samsung S6E3HA2 DSI video mode panel"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 0356775a443ad..ae56f64982cfb 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -79,6 +79,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D27A1) += panel-samsung-s6d27a1.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D7AA0) += panel-samsung-s6d7aa0.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3FA7) += panel-samsung-s6e3fa7.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3FC2X01) += panel-samsung-s6e3fc2x01.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2) += panel-samsung-s6e3ha2.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA8) += panel-samsung-s6e3ha8.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03) += panel-samsung-s6e63j0x03.o
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c b/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
> new file mode 100644
> index 0000000000000..e63080204af77
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
> @@ -0,0 +1,385 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 Nia Espera <a5b6@riseup.net>
> + * Copyright (c) 2025 David Heidelberg <david@ixit.cz>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/swab.h>
> +#include <linux/backlight.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#define MCS_ELVSS_ON            0xb1
> +
> +struct samsung_s6e3fc2x01 {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct regulator_bulk_data *supplies;
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static const struct regulator_bulk_data s6e3fc2x01_supplies[] = {
> +	{ .supply = "vddio" },
> +	{ .supply = "vci" },
> +	{ .supply = "poc" },
> +};
> +
> +static inline
> +struct samsung_s6e3fc2x01 *to_samsung_s6e3fc2x01(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct samsung_s6e3fc2x01, panel);
> +}
> +
> +#define s6e3fc2x01_test_key_on_lvl1(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x9f, 0xa5, 0xa5)
> +#define s6e3fc2x01_test_key_off_lvl1(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x9f, 0x5a, 0x5a)
> +#define s6e3fc2x01_test_key_on_lvl2(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0x5a, 0x5a)
> +#define s6e3fc2x01_test_key_off_lvl2(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0xa5, 0xa5)
> +#define s6e3fc2x01_test_key_on_lvl3(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0x5a, 0x5a)
> +#define s6e3fc2x01_test_key_off_lvl3(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0xa5, 0xa5)
> +
> +static void s6e3fc2x01_reset(struct samsung_s6e3fc2x01 *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(5000, 6000);
> +}
> +
> +static int s6e3fc2x01_on(struct samsung_s6e3fc2x01 *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	s6e3fc2x01_test_key_on_lvl1(&dsi_ctx);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x0a);
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
> +
> +	s6e3fc2x01_test_key_off_lvl1(&dsi_ctx);
> +
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x01);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +
> +	mipi_dsi_usleep_range(&dsi_ctx, 15000, 16000);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x0f);
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
> +
> +	s6e3fc2x01_test_key_on_lvl1(&dsi_ctx);
> +	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	s6e3fc2x01_test_key_off_lvl1(&dsi_ctx);
> +
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xeb, 0x17,
> +					       0x41, 0x92,
> +					       0x0e, 0x10,
> +					       0x82, 0x5a);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +
> +	/* Column & Page Address Setting */
> +	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x0437);
> +	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x0923);
> +
> +	/* Horizontal & Vertical sync Setting */
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe8, 0x10, 0x30);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +
> +	s6e3fc2x01_test_key_on_lvl3(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0x88);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xed, 0x67);
> +	s6e3fc2x01_test_key_off_lvl3(&dsi_ctx);
> +
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7, 0x12);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> +	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
> +
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_ELVSS_ON, 0x00, 0x01);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x00, 0xc1);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x78);
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x90);
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
> +
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_ELVSS_ON, 0xc6, 0x00, 0x00,
> +				     0x21, 0xed, 0x02, 0x08, 0x06, 0xc1, 0x27,
> +				     0xfc, 0xdc, 0xe4, 0x00, 0xd9, 0xe6, 0xe7,
> +				     0x00, 0xfc, 0xff, 0xea);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_ELVSS_ON, 0x00, 0x00);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int s6e3fc2x01_enable(struct drm_panel *panel)
> +{
> +	struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	s6e3fc2x01_test_key_on_lvl1(&dsi_ctx);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	s6e3fc2x01_test_key_off_lvl1(&dsi_ctx);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int s6e3fc2x01_off(struct samsung_s6e3fc2x01 *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	s6e3fc2x01_test_key_on_lvl1(&dsi_ctx);
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
> +
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_usleep_range(&dsi_ctx, 16000, 17000);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x82);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +	mipi_dsi_usleep_range(&dsi_ctx, 16000, 17000);
> +
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +
> +	s6e3fc2x01_test_key_off_lvl1(&dsi_ctx);
> +
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x01);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 160);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int s6e3fc2x01_disable(struct drm_panel *panel)
> +{
> +	struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
> +
> +	s6e3fc2x01_off(ctx);
> +
> +	return 0;
> +}
> +
> +static int s6e3fc2x01_prepare(struct drm_panel *panel)
> +{
> +	struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(s6e3fc2x01_supplies), ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	s6e3fc2x01_reset(ctx);
> +
> +	ret = s6e3fc2x01_on(ctx);
> +	if (ret < 0) {
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		regulator_bulk_disable(ARRAY_SIZE(s6e3fc2x01_supplies), ctx->supplies);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int s6e3fc2x01_unprepare(struct drm_panel *panel)
> +{
> +	struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(s6e3fc2x01_supplies), ctx->supplies);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode ams641rw_mode = {
> +	.clock = (1080 + 72 + 16 + 36) * (2340 + 32 + 4 + 18) * 60 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 72,
> +	.hsync_end = 1080 + 72 + 16,
> +	.htotal = 1080 + 72 + 16 + 36,
> +	.vdisplay = 2340,
> +	.vsync_start = 2340 + 32,
> +	.vsync_end = 2340 + 32 + 4,
> +	.vtotal = 2340 + 32 + 4 + 18,
> +	.width_mm = 68,
> +	.height_mm = 145,
> +};
> +
> +static int s6e3fc2x01_get_modes(struct drm_panel *panel,
> +					struct drm_connector *connector)
> +{
> +	return drm_connector_helper_get_modes_fixed(connector, &ams641rw_mode);
> +}
> +
> +static const struct drm_panel_funcs samsung_s6e3fc2x01_panel_funcs = {
> +	.prepare = s6e3fc2x01_prepare,
> +	.enable = s6e3fc2x01_enable,
> +	.disable = s6e3fc2x01_disable,
> +	.unprepare = s6e3fc2x01_unprepare,
> +	.get_modes = s6e3fc2x01_get_modes,
> +};
> +
> +static int s6e3fc2x01_panel_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int err;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	err = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +	if (err < 0)
> +		return err;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops s6e3fc2x01_panel_bl_ops = {
> +	.update_status = s6e3fc2x01_panel_bl_update_status,
> +};
> +
> +static struct backlight_device *
> +s6e3fc2x01_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_PLATFORM,
> +		.brightness = 512,
> +		.max_brightness = 1023,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &s6e3fc2x01_panel_bl_ops, &props);
> +}
> +
> +static int s6e3fc2x01_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct samsung_s6e3fc2x01 *ctx;
> +	int ret;
> +
> +	ctx = devm_drm_panel_alloc(dev, struct samsung_s6e3fc2x01, panel,
> +				   &samsung_s6e3fc2x01_panel_funcs,
> +				   DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
> +
> +	ret = devm_regulator_bulk_get_const(dev,
> +					    ARRAY_SIZE(s6e3fc2x01_supplies),
> +					    s6e3fc2x01_supplies,
> +					    &ctx->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
> +
> +
> +	/* keep the display on for flicker-free experience */
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
> +
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ctx->panel.backlight = s6e3fc2x01_create_backlight(dsi);
> +	if (IS_ERR(ctx->panel.backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +				     "Failed to create backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> +		drm_panel_remove(&ctx->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void s6e3fc2x01_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct samsung_s6e3fc2x01 *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id s6e3fc2x01_of_match[] = {
> +	{ .compatible = "samsung,s6e3fc2x01-ams641rw", .data = &ams641rw_mode },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, s6e3fc2x01_of_match);
> +
> +static struct mipi_dsi_driver s6e3fc2x01_driver = {
> +	.probe = s6e3fc2x01_probe,
> +	.remove = s6e3fc2x01_remove,
> +	.driver = {
> +		.name = "panel-samsung-s6e3fc2x01",
> +		.of_match_table = s6e3fc2x01_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(s6e3fc2x01_driver);
> +
> +MODULE_AUTHOR("David Heidelberg <david@ixit.cz>");
> +MODULE_DESCRIPTION("DRM driver for Samsung S6E3FC2X01 DDIC");
> +MODULE_LICENSE("GPL");
> 


