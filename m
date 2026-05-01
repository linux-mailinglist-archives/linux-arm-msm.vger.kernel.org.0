Return-Path: <linux-arm-msm+bounces-105550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GsTGEru9GlKFwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 20:17:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF894AEC5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 20:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D65B3300DD7E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 18:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F89F40B6DF;
	Fri,  1 May 2026 18:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="UcKToqLR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A6240B6C3;
	Fri,  1 May 2026 18:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777659462; cv=none; b=OUJ936T5Ha7qX+LvK9FmANJqWgyL0viNPIRqKxDMkRElgVkyK8/53HWTLKhksN8zZte/QCORiemToUhqzRu5qSpNqO5r2qv6na6XNM9Y76jMetgvHp8Q0iOFgpECqDioJIO0AF4GJ4OE2/SiIGG8hdejP1zU6jgW06mS8cPLY4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777659462; c=relaxed/simple;
	bh=HWuT45Ax0/0DTD6UpiDuU1BmtPsA3vuSIAPabXXi7xY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QRLd4/NQygjCKjtpOGUn2QTGkjLSnT3SDAfZgFZOHingqxV2AXLiFYLEZ0KJvsV4qApMaFBjQ2vD2JMxelO4iaBfiYBK1HNzrJ/WMglkTmW+G7kk7H71pyHANAjIBH5tkOX2zDvq3/8/eUQiw4EcH5m1kKUgCKOoDpKrTXf006k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=UcKToqLR; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.0.200] (unknown [10.88.125.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 39EC65340AAF;
	Fri, 01 May 2026 20:17:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1777659455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QmTNTBxgvlk1DaN8qB/H7GZCld3B010jCjw8SXOL4oE=;
	b=UcKToqLRgOf6JxZfDJcgcSnbQWpppQS7gAnDlEgGW91KVsbsspcz5nd7lOgaLdxKTztQlV
	HVPrr+JIh2qBDlK+ZR0NhP+2cYbQwsP8hz7DdpExnva4ecK+Ja91cmn3+lLr0qGTGdFH+w
	oDhKdXerIl9d9kqtGE+6mC7Q+FkiLkA=
Message-ID: <3c1f93e2-1be4-4cd9-9396-1c0896d3657f@ixit.cz>
Date: Fri, 1 May 2026 20:17:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/panel: Add driver for Novatek NT37705 panel
To: Luca Weiss <luca.weiss@fairphone.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-2-e09cb05651cc@fairphone.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 xsFNBF5v1x4BEADS3EddwsNsvVAI1XF8uQKbdYPY/GhjaSLziwVnbwv5BGwqB1tfXoHnccoA
 9kTgKAbiXG/CiZFhD6l4WCIskQDKzyQN3JhCUIxh16Xyw0lECI7iqoW9LmMoN1dNKcUmCO9g
 lZxQaOl+1bY/7ttd7DapLh9rmBXJ2lKiMEaIpUwb/Nw0d7Enp4Jy2TpkhPywIpUn8CoJCv3/
 61qbvI9y5utB/UhfMAUXsaAgwEJyGPAqHlC0YZjaTwOu+YQUE3AFzhCbksq95CwDz4U4gdls
 dmv9tkATfu2OmzERZQ6vJTehK0Pu4l5KmCAzYg42I9Dy4E6b17x6NncKbcByQFOXMtG0qVUk
 F1yeeOQUHwu+8t3ZDMBUhCkRL/juuoqLmyDWKMc0hKNNeZ9BNXgB8fXkRLWEUfgDXsFyEkKp
 NxUy5bDRlivf6XfExnikk5kj9l2gGlNQwqROti/46bfbmlmc/a2GM4k8ZyalHNEAdwtXYSpP
 8JJmlbQ7hNTLkc3HQLRsIocN5th/ur7pPMz1Beyp0gbE9GcOceqmdZQB80vJ01XDyCAihf6l
 AMnzwpXZsjqIqH9r7T7tM6tVEVbPSwPt4eZYXSoJijEBC/43TBbmxDX+5+3txRaSCRQrG9dY
 k3mMGM3xJLCps2KnaqMcgUnvb1KdTgEFUZQaItw7HyRd6RppewARAQABzSBEYXZpZCBIZWlk
 ZWxiZXJnIDxkYXZpZEBpeGl0LmN6PsLBlAQTAQgAPgIbAwULCQgHAgYVCgkICwIEFgIDAQIe
 AQIXgBYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJl+KksBQkPDaAOAAoJEGACP8TTSSBy6IAQ
 AMqFqVi9LLxCEcUWBn82ssQGiVSDniKpFE/tp7lMXflwhjD5xoftoWOmMYkiWE86t5x5Fsp7
 afALx7SEDz599F1K1bLnaga+budu55JEAYGudD2WwpLJ0kPzRhqBwGFIx8k6F+goZJzxPDsf
 loAtXQE62UvEKa4KRRcZmF0GGoRsgA7vE7OnV8LMeocdD3eb2CuXLzauHAfdvqF50IfPH/sE
 jbzROiAZU+WgrwU946aOzrN8jVU+Cy8XAccGAZxsmPBfhTY5f2VN1IqvfaRdkKKlmWVJWGw+
 ycFpAEJKFRdfcc5PSjUJcALn5C+hxzL2hBpIZJdfdfStn+DWHXNgBeRDiZj1x6vvyaC43RAb
 VXvRzOQfG4EaMVMIOvBjBA/FtIpb1gtXA42ewhvPnd5RVCqD9YYUxsVpJ9d+XsAy7uib3BsV
 W2idAEsPtoqhVhq8bCUs/G4sC2DdyGZK8MRFDJqciJSUbqA+5z1ZCuE8UOPDpZKiW6H/OuOM
 zDcjh0lOzr4p+/1TSg1PbUh7fQ+nbMuiT044sC1lLtJK0+Zyn0GwhR82oNM4fldNsaHRW42w
 QGD35+eNo5Pvb3We5XRMlBdhFnj7Siggp4J8/PJ6MJvRyC+RIJPGtbdMB2/RxWunFLn87e5w
 UgwR9jPMHAstuTR1yR23c4SIYoQ2fzkrRzuazsFNBF5v1x4BEADnlrbta2WL87BlEOotZUh0
 zXANMrNV15WxexsirLetfqbs0AGCaTRNj+uWlTUDJRXOVIwzmF76Us3I2796+Od2ocNpLheZ
 7EIkq8budtLVd1c06qJ+GMraz51zfgSIazVInNMPk9T6fz0lembji5yEcNPNNBA4sHiFmXfo
 IhepHFOBApjS0CiOPqowYxSTPe/DLcJ/LDwWpTi37doKPhBwlHev1BwVCbrLEIFjY0MLM0aT
 jiBBlyLJaTqvE48gblonu2SGaNmGtkC3VoQUQFcVYDXtlL9CVbNo7BAt5gwPcNqEqkUL60Jh
 FtvVSKyQh6gn7HHsyMtgltjZ3NKjv8S3yQd7zxvCn79tCKwoeNevsvoMq/bzlKxc9QiKaRPO
 aDj3FtW7R/3XoKJBY8Hckyug6uc2qYWRpnuXc0as6S0wfek6gauExUttBKrtSbPPHiuTeNHt
 NsT4+dyvaJtQKPBTbPHkXpTO8e1+YAg7kPj3aKFToE/dakIh8iqUHLNxywDAamRVn8Ha67WO
 AEAA3iklJ49QQk2ZyS1RJ2Ul28ePFDZ3QSr9LoJiOBZv9XkbhXS164iRB7rBZk6ZRVgCz3V6
 hhhjkipYvpJ/fpjXNsVL8jvel1mYNf0a46T4QQDQx4KQj0zXJbC2fFikAtu1AULktF4iEXEI
 rSjFoqhd4euZ+QARAQABwsF8BBgBCAAmAhsMFiEE13oJz+7cK71TpwR0YAI/xNNJIHIFAmX4
 qVAFCQ8NoDIACgkQYAI/xNNJIHKN4A/+Ine2Ii7JiuGITjJkcV6pgKlfwYdEs4eFD1pTRb/K
 5dprUz3QSLP41u9OJQ23HnESMvn31UENk9ffebNoW7WxZ/8cTQY0JY/cgTTrlNXtyAlGbR3/
 3Q/VBJptf04Er7I6TaKAmqWzdVeKTw33LljpkHp02vrbOdylb4JQG/SginLV9purGAFptYRO
 8JNa2J4FAQtQTrfOUjulOWMxy7XRkqK3QqLcPW79/CFn7q1yxamPkpoXUJq9/fVjlhk7P+da
 NYQpe4WQQnktBY29SkFnvfIAwqIVU8ix5Oz8rghuCcAdR7lEJ7hCX9bR0EE05FOXdZy5FWL9
 GHvFa/Opkq3DPmFl/0nt4HJqq1Nwrr+WR6d0414oo1n2hPEllge/6iD3ZYwptTvOFKEw/v0A
 yqOoYSiKX9F7Ko7QO+VnYeVDsDDevKic2T/4GDpcSVd9ipiKxCQvUAzKUH7RUpqDTa+rYurm
 zRKcgRumz2Tc1ouHj6qINlzEe3a5ldctIn/dvR1l2Ko7GBTG+VGp9U5NOAEkGpxHG9yg6eeY
 fFYnMme51H/HKiyUlFiE3yd5LSmv8Dhbf+vsI4x6BOOOq4Iyop/Exavj1owGxW0hpdUGcCl1
 ovlwVPO/6l/XLAmSGwdnGqok5eGZQzSst0tj9RC9O0dXO1TZocOsf0tJ8dR2egX4kxM=
In-Reply-To: <20260501-fp6-panel-v1-2-e09cb05651cc@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: ADF894AEC5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ixit.cz,quarantine];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105550-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[fairphone.com,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@ixit.cz,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[ixit.cz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ixit.cz:dkim,ixit.cz:mid]

On 01/05/2026 15:52, Luca Weiss wrote:
> Add support for the 2484x1116 AMOLED panel from BOE (BJ631JHM-T71-D900)
> bundled with a NT37705 driver IC, as found on the Fairphone (Gen. 6)
> smartphone.
> 
> The panel can also be configured in 10-bit (RGB101010) mode, however
> currently it's configured in 8-bit (RGB888) since there's some issues in
> the Qualcomm DPU driver when driving this panel in 10-bit.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |  11 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-novatek-nt37705.c | 413 ++++++++++++++++++++++++++
>   3 files changed, 425 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 979109c27b9b..59ab3f29d8ef 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -624,6 +624,17 @@ config DRM_PANEL_NOVATEK_NT37700F
>   	  Say Y here if you want to enable support for Novatek NT37700F DSI
>   	  panel module. The panel has a resolution of 1080x2160.
>   
> +config DRM_PANEL_NOVATEK_NT37705
> +	tristate "Novatek NT37705-based DSI panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_KMS_HELPER
> +	help
> +	  Say Y here if you want to enable support for Novatek NT37705-based
> +	  display panels, such as the one found in the The Fairphone (Gen. 6)
> +	  smartphone.
> +
>   config DRM_PANEL_NOVATEK_NT37801
>   	tristate "Novatek NT37801/NT37810 AMOLED DSI panel"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 0d694acbfbb6..94639bc58ca8 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -61,6 +61,7 @@ obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) += panel-novatek-nt36523.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672E) += panel-novatek-nt36672e.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37700F) += panel-novatek-nt37700f.o
> +obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37705) += panel-novatek-nt37705.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37801) += panel-novatek-nt37801.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
>   obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37705.c b/drivers/gpu/drm/panel/panel-novatek-nt37705.c
> new file mode 100644
> index 000000000000..27bd8072ccd1
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt37705.c
> @@ -0,0 +1,413 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree.
> + * Copyright (c) 2026 Luca Weiss <luca.weiss@fairphone.com>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +struct nt37705_panel {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct drm_dsc_config dsc;
> +	struct regulator_bulk_data *supplies;
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static const struct regulator_bulk_data nt37705_supplies[] = {
> +	{ .supply = "vddio" },
> +	{ .supply = "dvdd" },
> +	{ .supply = "vci" },
> +};
> +
> +static inline struct nt37705_panel *to_nt37705_panel(struct drm_panel *panel)
> +{
> +	return container_of_const(panel, struct nt37705_panel, panel);
> +}
> +
> +static void nt37705_reset(struct nt37705_panel *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}
> +
> +static int nt37705_on(struct nt37705_panel *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
> +				     0x55, 0xaa, 0x52, 0x08, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba, 0x18);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
> +				     0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x2c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
> +				     0x00, 0x01, 0x01, 0x01, 0x00, 0x05, 0x05,
> +				     0x05, 0x00, 0x05, 0x05, 0x05, 0x00, 0x00,
> +				     0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x3c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
> +				     0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x0b,
> +				     0x0b, 0x00, 0x00, 0x0b, 0x0b, 0x00, 0x00,
> +				     0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x4c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
> +				     0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
> +				     0x1d, 0x00, 0x00, 0x00, 0x1d, 0x00, 0x00,
> +				     0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x5c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
> +				     0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> +				     0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> +				     0x01, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x6c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
> +				     0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x0b,
> +				     0x77, 0x77, 0x00, 0x00, 0x0b, 0x00, 0x1d,
> +				     0x00, 0x1d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x7c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
> +				     0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x0b,
> +				     0x77, 0x77, 0x00, 0x00, 0x0b, 0x00, 0x1d,
> +				     0x00, 0x1d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x8c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x9c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
> +				     0x11, 0x11, 0x20, 0x02, 0x00, 0x03, 0x00,
> +				     0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0xa4);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba, 0x00, 0xc0, 0x40, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0xa8);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
> +				     0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22,
> +				     0x22);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0xb0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
> +				     0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22,
> +				     0x22);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
> +				     0x55, 0xaa, 0x52, 0x08, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc5, 0x15, 0x15, 0x15, 0xdd);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
> +				     0x55, 0xaa, 0x52, 0x08, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x32);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
> +				     0x55, 0xaa, 0x52, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x19);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x55);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x11);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x01, 0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x2d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x01, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x81);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x3c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf9, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf5, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x83);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x12);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x41);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x13);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x21);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
> +				     0x20);
> +	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x045b);
> +	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x09b3);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x00);
> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0xbb0d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x04);
> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0xfe0f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x01, 0x19);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x90, 0x03, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x91,
> +				     0x89, 0x28, 0x00, 0x0c, 0xd2, 0x00, 0x02,
> +				     0x2f, 0x01, 0x18, 0x00, 0x07, 0x09, 0x75,
> +				     0x08, 0x34, 0x10, 0xf0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x00);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x00);
> +	mipi_dsi_msleep(&dsi_ctx, 22);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int nt37705_off(struct nt37705_panel *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x00);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x00);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int nt37705_prepare(struct drm_panel *panel)
> +{
> +	struct nt37705_panel *ctx = to_nt37705_panel(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	struct drm_dsc_picture_parameter_set pps;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(nt37705_supplies), ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	nt37705_reset(ctx);
> +
> +	ret = nt37705_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		regulator_bulk_disable(ARRAY_SIZE(nt37705_supplies), ctx->supplies);
> +		return ret;
> +	}
> +
> +	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
> +
> +	ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
> +	if (ret < 0) {
> +		dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_compression_mode(ctx->dsi, true);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable compression mode: %d\n", ret);
> +		return ret;
> +	}
> +
> +	msleep(28); /* TODO: Is this panel-dependent? */
> +
> +	return 0;
> +}
> +
> +static int nt37705_unprepare(struct drm_panel *panel)
> +{
> +	struct nt37705_panel *ctx = to_nt37705_panel(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	ret = nt37705_off(ctx);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(nt37705_supplies), ctx->supplies);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode nt37705_mode = {

this is definitely related to the panel, not the DDIC, thus naming should 
reflect that


> +	.clock = (1116 + 100 + 30 + 100) * (2484 + 70 + 48 + 70) * 120 / 1000,
> +	.hdisplay = 1116,
> +	.hsync_start = 1116 + 100,
> +	.hsync_end = 1116 + 100 + 30,
> +	.htotal = 1116 + 100 + 30 + 100,
> +	.vdisplay = 2484,
> +	.vsync_start = 2484 + 70,
> +	.vsync_end = 2484 + 70 + 48,
> +	.vtotal = 2484 + 70 + 48 + 70,
> +	.width_mm = 66,
> +	.height_mm = 146,
> +	.type = DRM_MODE_TYPE_DRIVER,
> +};
> +
> +static int nt37705_get_modes(struct drm_panel *panel,
> +			     struct drm_connector *connector)
> +{
> +	return drm_connector_helper_get_modes_fixed(connector, &nt37705_mode);
> +}
> +
> +static const struct drm_panel_funcs nt37705_panel_funcs = {
> +	.prepare = nt37705_prepare,
> +	.unprepare = nt37705_unprepare,
> +	.get_modes = nt37705_get_modes,
> +};
> +
> +static int nt37705_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops nt37705_bl_ops = {
> +	.update_status = nt37705_bl_update_status,
> +};
> +
> +static struct backlight_device *
> +nt37705_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.scale = BACKLIGHT_SCALE_NON_LINEAR,
> +		.brightness = 4095,

maybe setting it to half at boot would be sensible?

> +		.max_brightness = 4095,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &nt37705_bl_ops, &props);
> +}
> +
> +static int nt37705_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct nt37705_panel *ctx;
> +	int ret;
> +
> +	ctx = devm_drm_panel_alloc(dev, struct nt37705_panel, panel,
> +				   &nt37705_panel_funcs,
> +				   DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
> +
> +	ret = devm_regulator_bulk_get_const(dev,
> +					    ARRAY_SIZE(nt37705_supplies),
> +					    nt37705_supplies,
> +					    &ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ctx->panel.backlight = nt37705_create_backlight(dsi);
> +	if (IS_ERR(ctx->panel.backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +				     "Failed to create backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	/* This panel only supports DSC; unconditionally enable it */
> +	dsi->dsc = &ctx->dsc;
> +
> +	ctx->dsc.dsc_version_major = 1;
> +	ctx->dsc.dsc_version_minor = 1;
> +
> +	/* TODO: Pass slice_per_pkt = 2 */
> +	ctx->dsc.slice_height = 12;
> +	ctx->dsc.slice_width = 558;
> +	/*
> +	 * TODO: hdisplay should be read from the selected mode once
> +	 * it is passed back to drm_panel (in prepare?)
> +	 */
> +	WARN_ON(1116 % ctx->dsc.slice_width);
> +	ctx->dsc.slice_count = 1116 / ctx->dsc.slice_width;
> +	ctx->dsc.bits_per_component = 8;
> +	ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
> +	ctx->dsc.block_pred_enable = true;
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		drm_panel_remove(&ctx->panel);
> +		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static void nt37705_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct nt37705_panel *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id nt37705_of_match[] = {
> +	{ .compatible = "boe,bj631jhm-t71-d900" },

it would make sense to put DDIC as part of compatible, something like 
novatek,nt37705-bj631jhm

we communite with DDIC, not with the panel directly.

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, nt37705_of_match);
> +
> +static struct mipi_dsi_driver nt37705_driver = {
> +	.probe = nt37705_probe,
> +	.remove = nt37705_remove,
> +	.driver = {
> +		.name = "panel-novatek-nt37705",
> +		.of_match_table = nt37705_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(nt37705_driver);
> +
> +MODULE_DESCRIPTION("DRM driver for NT37705-equipped DSI panels");
> +MODULE_LICENSE("GPL");
> 

-- 
David Heidelberg


