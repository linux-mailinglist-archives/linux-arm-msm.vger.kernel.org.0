Return-Path: <linux-arm-msm+bounces-116226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hVPuIW52R2p/YgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:44:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 747E37003AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:44:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=mHvS5EzC;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116226-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116226-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D87F3008CAC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363CC33DEDD;
	Fri,  3 Jul 2026 08:22:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3451233D4E1
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:22:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066948; cv=none; b=ujuwzAEckq5iuV7c1T5yY9gn/xHU1ceeqvZKZ2fo+fVZcZk0ervOpQceuLnyli7+mZuQfBaY7NX5b0qAtoB+/FduKnGgyoljWM6rGlr2rJmneLAhWKoZAzt3epNrp2JISson7qnQi9Ir5I14Bw3YWJE3OuB36GESI/0YMbKPZXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066948; c=relaxed/simple;
	bh=TodYI3mPXCkLR7rN1qZlBYQmXexKsWqNtp11B5eRXJk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GQc7LFXT/kwIO5JgmpBx3gHoI8b5GfxVB5MpBlOW67yBfx8UapU1jTZfc4EvNrt8HjKpAgjIdGQtoK8lSZzGju1D/esoRm6WD39Z8ynPPEgKEq8EwQJGLBmQ3j4iRokzMkfD9eFXlLXtE+xRgBV3BmSw47ntYvKy1jtc48FChn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mHvS5EzC; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-475417f010dso170927f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783066944; x=1783671744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HnNDHaQU1untpiLIdS4oJ31QJwq0Fvs7OKNbLO0HB9Q=;
        b=mHvS5EzCiDVyx49ty/cAEo4rYbXExExN+ezqS92HZ+oHDjuPXOq0Ta4Gxhmi8+VjyN
         bUxxRSuwgkxFKGx5tKZ1s4WC4bTPs97k9iZnRxHIrfBvsJihmuSWO3UjES+pHybup1rn
         jhB62D45foto+CT2PNXN+IyE3FK/+kNpTW7c45z2zfH4Y96fZP4ng8WuEP94+4yL1roY
         +bFh65Zql9lnhf6fejZIz9kv+MiHdCGMleOQre72/FqWtDZnRZXgaF52rNdJFJGjmn8B
         7OJ6U1nXMmt3FGngDfLDCHLyXBwTV1eiEr4tsEPGBFpwoaEewTGPNYXKZkdjV29vHWEY
         vv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783066944; x=1783671744;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HnNDHaQU1untpiLIdS4oJ31QJwq0Fvs7OKNbLO0HB9Q=;
        b=C8uogTu5d10TzeUDbcXrvhHCs1B9W3FO6lpBd50nPnkY9A6pkAIZhaF3N3WEwuDKcC
         h/qGln2lUOU0V/fcRbQU7z4PCm8BfADjPzblOjtSONeWqeSkBvwHEKVppV+Mt4oevkUR
         0ZvT7GLh/uI7uI89b2Q8coJpdi2DfSGPCtX74B5ndNdlPLp+FMFJ+gD4zVaoHEzHgVPf
         wILSAVebwuqMVLNeADVX2LSPXI1lvoPwy7w6iE+UmviQDryF4arsJCekXJfFsKlLOR7E
         eLTuT1lT4d1jLWHuvR2JyrgRo4+7uDRRxi5dAzo60QZsEH0ShHEbnJqS9hm16FDAhTC0
         hdEw==
X-Gm-Message-State: AOJu0YxZrSVUCaLfDXoqvAMfElCUMKUeYDddoV+JSv3Juk8eqWpbS2Fx
	ym1RnvjW6dkbpT94FB+13IjhLliVBjLVnM+sg48KVcwBSvpP6qEgm0vm/rVDY4K1yqk=
X-Gm-Gg: AfdE7ckrB+Vd9qceRnwiDV6jVt90YYITe5sAyIUTv/tVHFhCtl9OHGWbM3LeIf7Tsmr
	8Yfl5BXgipXLePsN0rSXtf3v/FSea3MVvjE7ZJ9D0gD5lhR2j7Q0YhzNA7ZUpORoCCTxds3jJy+
	tjWB11J6Lb9Eeyjw5uj5U811uEkSnXzC6OQtcxMs3Teh7KcvZP8o+8BcR9chxpTKLW/XOvSeZP8
	MOblf0z3XepHKWtcmwvhxA51aQ3RInuwM7Ebvii1Z6sazPhEoljvGyECr+Q/ucC0WIk2YLdwtfH
	tBq0MR5p2QKo9mDdDrI2z+x9IPXXTtUUkSReSLgyUi0H49MOCvHDCCDQUt8FkmVVBjIo4WK8hLU
	e+PZVieeEfWVrP8PEeiV738BEWso39t6ZvRnimnsr41tp6CZs8xgE1HeWMA391X8IsT6O1Nlhom
	+eG6rLPGZiLMmWH7hx9Ahh8Z+nmtmVvZ6sOLoX3fsXRlvH4/9OjP8FOgw7FdQt/C3qNL/j
X-Received: by 2002:a05:6000:5c5:b0:474:530:9d with SMTP id ffacd0b85a97d-47757797bf8mr14818562f8f.13.1783066943846;
        Fri, 03 Jul 2026 01:22:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e9e1:7bf9:472f:c4d8? ([2a01:e0a:106d:1080:e9e1:7bf9:472f:c4d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4a09sm16344895f8f.13.2026.07.03.01.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:22:23 -0700 (PDT)
Message-ID: <e56e65fb-d9b4-45eb-90d9-7c4c19aef0c1@linaro.org>
Date: Fri, 3 Jul 2026 10:22:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] drm/panel: add Ilitek ILI7807S panel driver
To: Arpit Saini <arpit.saini@oss.qualcomm.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ayushi.makhija@oss.qualcomm.com, rajeevny@qti.qualcomm.com
References: <20260701-ili7807s-v4-0-c7d76d4780a5@oss.qualcomm.com>
 <20260701-ili7807s-v4-2-c7d76d4780a5@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260701-ili7807s-v4-2-c7d76d4780a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116226-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:arpit.saini@oss.qualcomm.com,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ayushi.makhija@oss.qualcomm.com,m:rajeevny@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:replyto,linaro.org:mid,linaro.org:from_mime,linaro.org:email,linaro.org:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 747E37003AE

On 7/1/26 13:12, Arpit Saini wrote:
> Add a DRM panel driver for the DLC DLC0697 1080x1920@60Hz MIPI DSI
> panel based on the Ilitek ILI7807S display controller.
> 
> The panel operates in video burst mode with four data lanes using
> RGB888 pixel format.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |  12 ++
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-ilitek-ili7807s.c | 285 ++++++++++++++++++++++++++
>   3 files changed, 298 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 7450b27622a2..1cbaac1bf545 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -264,6 +264,18 @@ config DRM_PANEL_HYDIS_HV101HD1
>   
>   	  If M is selected the module will be called panel-hydis-hv101hd1
>   
> +config DRM_PANEL_ILITEK_ILI7807S
> +	tristate "Ilitek ILI7807S-based panels"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y if you want to enable support for panels based on the
> +	  Ilitek ILI7807S display controller, such as the DLC DLC0697
> +	  1080x1920 MIPI DSI panel.
> +
> +	  If M is selected the module will be called panel-ilitek-ili7807s.
> +
>   config DRM_PANEL_ILITEK_IL9322
>   	tristate "Ilitek ILI9322 320x240 QVGA panels"
>   	depends on OF && SPI
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index c2c5cf817116..c3002b351cb8 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -26,6 +26,7 @@ obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112B) += panel-himax-hx83112b.o
>   obj-$(CONFIG_DRM_PANEL_HIMAX_HX83121A) += panel-himax-hx83121a.o
>   obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
>   obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) += panel-hydis-hv101hd1.o
> +obj-$(CONFIG_DRM_PANEL_ILITEK_ILI7807S) += panel-ilitek-ili7807s.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c b/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
> new file mode 100644
> index 000000000000..12b491b0bca4
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
> @@ -0,0 +1,285 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +struct panel_desc {
> +	const struct drm_display_mode *mode;
> +	unsigned int lanes;
> +	enum mipi_dsi_pixel_format format;
> +	unsigned long mode_flags;
> +	void (*init)(struct mipi_dsi_multi_context *dsi_ctx);
> +};
> +
> +struct ili7807s {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	const struct panel_desc *desc;
> +
> +	struct regulator_bulk_data *supplies;
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static const struct regulator_bulk_data ili7807s_supplies[] = {
> +	{ .supply = "vddi" },
> +	{ .supply = "avdd" },
> +	{ .supply = "avee" },
> +};
> +
> +static inline struct ili7807s *to_ili7807s(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct ili7807s, panel);
> +}
> +
> +static void ili7807s_reset(struct ili7807s *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}
> +
> +static void dlc0697_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
> +{
> +	mipi_dsi_dcs_soft_reset_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x78, 0x07, 0x00);
> +	mipi_dsi_dcs_set_tear_on_multi(dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x09, 0x99);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x01);
> +	mipi_dsi_dcs_set_display_brightness_multi(dsi_ctx, 0x1fff);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 20);
> +}
> +
> +static int ili7807s_on(struct ili7807s *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	ctx->desc->init(&dsi_ctx);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int ili7807s_off(struct ili7807s *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int ili7807s_prepare(struct drm_panel *panel)
> +{
> +	struct ili7807s *ctx = to_ili7807s(panel);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ili7807s_supplies), ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(ctx->panel.dev, "failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	msleep(20);
> +
> +	ili7807s_reset(ctx);
> +
> +	ret = ili7807s_on(ctx);
> +	if (ret < 0) {
> +		dev_err(ctx->panel.dev, "failed to initialise panel: %d\n", ret);
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(ili7807s_supplies), ctx->supplies);
> +	return ret;
> +}
> +
> +static int ili7807s_unprepare(struct drm_panel *panel)
> +{
> +	struct ili7807s *ctx = to_ili7807s(panel);
> +	int ret;
> +
> +	ret = ili7807s_off(ctx);
> +	if (ret < 0)
> +		dev_err(ctx->panel.dev, "failed to disable panel: %d\n", ret);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(ili7807s_supplies), ctx->supplies);
> +
> +	return 0;
> +}
> +
> +static int ili7807s_get_modes(struct drm_panel *panel,
> +			      struct drm_connector *connector)
> +{
> +	struct ili7807s *ctx = to_ili7807s(panel);
> +
> +	return drm_connector_helper_get_modes_fixed(connector, ctx->desc->mode);
> +}
> +
> +static const struct drm_panel_funcs ili7807s_panel_funcs = {
> +	.prepare = ili7807s_prepare,
> +	.unprepare = ili7807s_unprepare,
> +	.get_modes = ili7807s_get_modes,
> +};
> +
> +static int ili7807s_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return ret;
> +}
> +
> +static const struct backlight_ops ili7807s_bl_ops = {
> +	.update_status = ili7807s_bl_update_status,
> +};
> +
> +static struct backlight_device *ili7807s_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type           = BACKLIGHT_RAW,
> +		.brightness     = 0x3fff,
> +		.max_brightness = 0x3fff,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &ili7807s_bl_ops, &props);
> +}
> +
> +static const struct drm_display_mode dlc0697_mode = {
> +	.clock = (1080 + 18 + 2 + 16) * (1920 + 26 + 4 + 20) * 60 / 1000,
> +
> +	.hdisplay    = 1080,
> +	.hsync_start = 1080 + 18,
> +	.hsync_end   = 1080 + 18 + 2,
> +	.htotal      = 1080 + 18 + 2 + 16,
> +
> +	.vdisplay    = 1920,
> +	.vsync_start = 1920 + 26,
> +	.vsync_end   = 1920 + 26 + 4,
> +	.vtotal      = 1920 + 26 + 4 + 20,
> +
> +	.width_mm  = 87,
> +	.height_mm = 154,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct panel_desc dlc0697_desc = {
> +	.mode       = &dlc0697_mode,
> +	.lanes      = 4,
> +	.format     = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST,
> +	.init       = dlc0697_init_sequence,
> +};
> +
> +static int ili7807s_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct panel_desc *desc;
> +	struct ili7807s *ctx;
> +	int ret;
> +
> +	ctx = devm_drm_panel_alloc(dev, struct ili7807s, panel,
> +				   &ili7807s_panel_funcs,
> +				   DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
> +
> +	desc = of_device_get_match_data(dev);
> +	ctx->desc = desc;
> +
> +	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(ili7807s_supplies),
> +					    ili7807s_supplies, &ctx->supplies);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "failed to get reset gpio\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes      = desc->lanes;
> +	dsi->format     = desc->format;
> +	dsi->mode_flags = desc->mode_flags | MIPI_DSI_MODE_LPM;
> +
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return ret;
> +
> +	if (!ctx->panel.backlight) {
> +		ctx->panel.backlight = ili7807s_create_backlight(dsi);
> +		if (IS_ERR(ctx->panel.backlight))
> +			return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +					     "failed to create backlight\n");
> +	}
> +
> +	ret = devm_drm_panel_add(dev, &ctx->panel);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to add panel\n");
> +
> +	return devm_mipi_dsi_attach(dev, dsi);
> +}
> +
> +static const struct of_device_id ili7807s_of_match[] = {
> +	{ .compatible = "dlc,dlc0697", .data = &dlc0697_desc },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ili7807s_of_match);
> +
> +static struct mipi_dsi_driver ili7807s_dsi_driver = {
> +	.probe  = ili7807s_probe,
> +	.driver = {
> +		.name           = "panel-ilitek-ili7807s",
> +		.of_match_table = ili7807s_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(ili7807s_dsi_driver);
> +
> +MODULE_AUTHOR("Arpit Saini <arpit.saini@oss.qualcomm.com>");
> +MODULE_DESCRIPTION("Panel driver for Ilitek ILI7807S LCD DSI panel");
> +MODULE_LICENSE("GPL");
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

