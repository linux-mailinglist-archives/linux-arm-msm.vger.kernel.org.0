Return-Path: <linux-arm-msm+bounces-107934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL44HdkvB2p3sgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 16:38:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8B255189F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 16:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90B03306263A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BF13932D1;
	Fri, 15 May 2026 14:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Odb4Gkbb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B663AD510
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 14:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855517; cv=none; b=sm1Wk3bnz4sVhqXXj3d0BWmSqLsMQj9M+UuVfcZmK5iKWde661fiKQDbOBrC7RVssJhF0o6Rb2FIWnippcOYjjlHWLwEkJxxo0OFFRKVOIMjhWGqmsKbwvqcS8RWoLc7aoHh/POg4aMU2bzBARHTA4Yh0yZeIJ8ypJHBCXw3pr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855517; c=relaxed/simple;
	bh=OWnWFxSdmpvYr6SK5ppnHAgSN/bQXmTVCLxMZEG18Io=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=u0LoQWOFgyZUot5fFmOqDm7chvs9gsS2MOxVLGcBohwzHPGm5fGAzGlpO3etO+QZD3u5X+eAzcktL8vMYC+9dr+/7fGW7gLj/LWD+l+iTVo5Y+TE3nYl0d9Jt3OzqNUcUGB2mml29PMNqsaU6k6C+228CLycgQgADnvadaoQUbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Odb4Gkbb; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bcc9fdc959cso1059338366b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 07:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1778855513; x=1779460313; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiChq0bWxYu8cm+d+z1QVhaK5qjC2UQLCYZmN1T6Ywc=;
        b=Odb4GkbbhdwNaYB0R7+n3fIXSGI/n0E8sm+7gwB2ebw9/pYiIpB/VgzUNukQatrc6S
         MVN6U+4bvho1po6oE8G18Dnnhah7TJzj44y1lYNG47WY9pRz/j/UVNZBM/HWlfgFaUBL
         x+ZTIcR9rQl9OrjsTsciP+grb16EeBCSGR1O6pYVu7CPnAt4trD4AxaQ5ixP/P2wEyPk
         t1y/+8fiTl3JHAeANtK0Lj1sYrG4YSfyoJNY0yBM2NdJglfWQFNCH7wiynjf88b4uspQ
         fah+vf99qJdjCWCbvMQ3MHkwCsUky8ln8DJY/7Ir7mElP/xKWsVsLAqT9D11EeMZflHL
         Kocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778855513; x=1779460313;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WiChq0bWxYu8cm+d+z1QVhaK5qjC2UQLCYZmN1T6Ywc=;
        b=mzVPWE0SP3W1ys95byN8o/jtOVnR68t9nB6RcnMjsyylC9GoP5vznhGTFUG/Gc8W/Q
         r4+WMTDU1mgh6x4TK4GSLTBIGJzoj/Zn+vqV/CwYQtOJkE0oRZG6htDIRsK4gAu71pBN
         46SqmH4kLLe9lIwx8uG6KBXUOTCoOewYUio0O6BcaS0PlbRXdXlaFrRE9hCPfRlpntSN
         Ox9yFT+++GEjZHCJPGrwMX4Z1eMhtfE9w/wROzRhP4Bf844K35Gt1lgmAjIIcvNyk5xG
         5wF26TdCb63A6kczXtu1XOS/gz7tph82LTbFr8VO1StYfFkj+GbSE50dbPKLo0f2MIGy
         sVQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NzKUFPmLlXZKthdyU/3cy0XVzWlthix0HXYP3YCI9oNhnORTAKA0uCMWbB69AwZPDa5ApNSVET+XLd3N7@vger.kernel.org
X-Gm-Message-State: AOJu0YxOW/iyqb+yUSqE0HJbVojWJDPKJ7FfcPv1rEOHw8USeUK0SSqf
	QTTOwBxcscx7ZXWEa57q6n5N+0yNx8p8Mb4jyH0bsFQxN789oFosC+sGVIYuCJXbfc8=
X-Gm-Gg: Acq92OHTCzYjW7An1fH98mgdKCR0XbiT3PR73TpdYHfabs69POZuC0aTvo3lqjYrMz3
	rkKvvYoXDHgBFTRsIJsxz6N4aflHfUqbbQgX/J+LGactAkvFxxCaoUpoQqNooisiyya7BTFZLmn
	WIuyPHqB6YfSBPTfDD0Tqna9W2jg1i+jtPBOQmQdsWxC0UWUs3nHgerxQiBOt8FCwqJsEm+xxl4
	AAgysjD9ETFe4kuSsM8nir6RnxZMFV8gcPV2CVZzyWpMJ8ynfFZLDx05N08r+5ucburuHEdrAeT
	zAL3b9TfrNDwrlQx2i6rSW65dG0wSoSUo6HZeIeb/etC1cECidMdMY27KtPXeaQOu1H3lWD3+yE
	i3f9nRz4LtppDqdOQzHkFWk5mIZLxFOqHD0h2kv6Znb5JDzhDi3zpqW4tTip1b/SQl81JyBxe2F
	udErmX/CMKyXbD+2FSe6Zgjkvi3ndVLiMefDYoBUaaDOov579csPqgYpVqQeOIkcqbXasn
X-Received: by 2002:a17:907:9483:b0:bd2:bd43:b46c with SMTP id a640c23a62f3a-bd517979775mr246890366b.43.1778855512784;
        Fri, 15 May 2026 07:31:52 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4de6f28sm240053066b.34.2026.05.15.07.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 07:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 May 2026 16:31:51 +0200
Message-Id: <DIJBNGDNXE0L.2I0H4PBDDODOP@fairphone.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Jessica Zhang" <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/4] drm/panel: Add driver for Novatek NT37705 panel
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-2-e09cb05651cc@fairphone.com>
 <c06623ba-b19c-471a-becb-2fafddb3583c@suse.de>
In-Reply-To: <c06623ba-b19c-471a-becb-2fafddb3583c@suse.de>
X-Rspamd-Queue-Id: BF8B255189F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107934-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[suse.de,fairphone.com,linaro.org,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:mid,fairphone.com:dkim]
X-Rspamd-Action: no action

On Fri May 8, 2026 at 10:06 AM CEST, Thomas Zimmermann wrote:
> Hi
>
> Am 01.05.26 um 15:52 schrieb Luca Weiss:
>> Add support for the 2484x1116 AMOLED panel from BOE (BJ631JHM-T71-D900)
>> bundled with a NT37705 driver IC, as found on the Fairphone (Gen. 6)
>> smartphone.
>>
>> The panel can also be configured in 10-bit (RGB101010) mode, however
>> currently it's configured in 8-bit (RGB888) since there's some issues in
>> the Qualcomm DPU driver when driving this panel in 10-bit.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   drivers/gpu/drm/panel/Kconfig                 |  11 +
>>   drivers/gpu/drm/panel/Makefile                |   1 +
>>   drivers/gpu/drm/panel/panel-novatek-nt37705.c | 413 ++++++++++++++++++=
++++++++
>>   3 files changed, 425 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconf=
ig
>> index 979109c27b9b..59ab3f29d8ef 100644
>> --- a/drivers/gpu/drm/panel/Kconfig
>> +++ b/drivers/gpu/drm/panel/Kconfig
>> @@ -624,6 +624,17 @@ config DRM_PANEL_NOVATEK_NT37700F
>>   	  Say Y here if you want to enable support for Novatek NT37700F DSI
>>   	  panel module. The panel has a resolution of 1080x2160.
>>  =20
>> +config DRM_PANEL_NOVATEK_NT37705
>> +	tristate "Novatek NT37705-based DSI panel"
>> +	depends on OF
>> +	depends on DRM_MIPI_DSI
>> +	depends on BACKLIGHT_CLASS_DEVICE
>> +	select DRM_KMS_HELPER
>> +	help
>> +	  Say Y here if you want to enable support for Novatek NT37705-based
>> +	  display panels, such as the one found in the The Fairphone (Gen. 6)
>
> Duplicate 'the'

Marketing really wanted to have it be "The Fairphone". Will change and
make it saner.

>
>> +	  smartphone.
>> +
>>   config DRM_PANEL_NOVATEK_NT37801
>>   	tristate "Novatek NT37801/NT37810 AMOLED DSI panel"
>>   	depends on OF
>> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Make=
file
>> index 0d694acbfbb6..94639bc58ca8 100644
>> --- a/drivers/gpu/drm/panel/Makefile
>> +++ b/drivers/gpu/drm/panel/Makefile
>> @@ -61,6 +61,7 @@ obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) +=3D panel-nov=
atek-nt36523.o
>>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) +=3D panel-novatek-nt36672a.o
>>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672E) +=3D panel-novatek-nt36672e.o
>>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37700F) +=3D panel-novatek-nt37700f.o
>> +obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37705) +=3D panel-novatek-nt37705.o
>>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37801) +=3D panel-novatek-nt37801.o
>>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) +=3D panel-novatek-nt39016.o
>>   obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) +=3D panel-mantix-mlaf057we=
51.o
>> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37705.c b/drivers/gpu=
/drm/panel/panel-novatek-nt37705.c
>> new file mode 100644
>> index 000000000000..27bd8072ccd1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panel/panel-novatek-nt37705.c
>> @@ -0,0 +1,413 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor dev=
ice tree.
>> + * Copyright (c) 2026 Luca Weiss <luca.weiss@fairphone.com>
>> + */
>> +
>> +#include <linux/backlight.h>
>> +#include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/regulator/consumer.h>
>> +
>> +#include <video/mipi_display.h>
>> +
>> +#include <drm/display/drm_dsc.h>
>> +#include <drm/display/drm_dsc_helper.h>
>
> IIRC this requires
>
>  =C2=A0select DRM_DISPLAY_DSC_HELPER
>
> in the Kconfig. Maybe double-check.

Will check. Always difficult to figure out the proper dependencies in a
fully-featured defconfig build.

>
>> +#include <drm/drm_mipi_dsi.h>
>> +#include <drm/drm_modes.h>
>> +#include <drm/drm_panel.h>
>> +#include <drm/drm_probe_helper.h>
>> +
>> +struct nt37705_panel {
>> +	struct drm_panel panel;
>> +	struct mipi_dsi_device *dsi;
>> +	struct drm_dsc_config dsc;
>> +	struct regulator_bulk_data *supplies;
>> +	struct gpio_desc *reset_gpio;
>> +};
>> +
>> +static const struct regulator_bulk_data nt37705_supplies[] =3D {
>> +	{ .supply =3D "vddio" },
>> +	{ .supply =3D "dvdd" },
>> +	{ .supply =3D "vci" },
>> +};
>> +
>> +static inline struct nt37705_panel *to_nt37705_panel(struct drm_panel *=
panel)
>> +{
>> +	return container_of_const(panel, struct nt37705_panel, panel);
>
> Either just use container_of or build something that respects the=20
> input's const-ness.

I really don't get what you mean here? Why is container_of_const() bad
here?

>
>> +}
>> +
>> +static void nt37705_reset(struct nt37705_panel *ctx)
>> +{
>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>> +	usleep_range(10000, 11000);
>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>> +	usleep_range(5000, 6000);
>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>> +	usleep_range(10000, 11000);
>> +}
>> +
>> +static int nt37705_on(struct nt37705_panel *ctx)
>> +{
>> +	struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
>> +
>> +	ctx->dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
>> +
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
>> +				     0x55, 0xaa, 0x52, 0x08, 0x00);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1b);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba, 0x18);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1c);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>> +				     0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00,
>> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +				     0x00, 0x00);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x2c);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>> +				     0x00, 0x01, 0x01, 0x01, 0x00, 0x05, 0x05,
>> +				     0x05, 0x00, 0x05, 0x05, 0x05, 0x00, 0x00,
>> +				     0x00, 0x00);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x3c);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>> +				     0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x0b,
>> +				     0x0b, 0x00, 0x00, 0x0b, 0x0b, 0x00, 0x00,
>> +				     0x00, 0x00);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x4c);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>> +				     0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
>> +				     0x1d, 0x00, 0x00, 0x00, 0x1d, 0x00, 0x00,
>> +				     0x00, 0x00);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x5c);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>> +				     0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
>> +				     0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
>> +				     0x01, 0x01);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x6c);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>> +				     0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x0b,
>> +				     0x77, 0x77, 0x00, 0x00, 0x0b, 0x00, 0x1d,
>> +				     0x00, 0x1d);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x7c);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>> +				     0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x0b,
>> +				     0x77, 0x77, 0x00, 0x00, 0x0b, 0x00, 0x1d,
>> +				     0x00, 0x1d);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x8c);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +				     0x00, 0x00);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x9c);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>> +				     0x11, 0x11, 0x20, 0x02, 0x00, 0x03, 0x00,
>> +				     0x00);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0xa4);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba, 0x00, 0xc0, 0x40, 0x08);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0xa8);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>> +				     0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22,
>> +				     0x22);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0xb0);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
>> +				     0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22,
>> +				     0x22);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
>> +				     0x55, 0xaa, 0x52, 0x08, 0x01);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x05);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc5, 0x15, 0x15, 0x15, 0xdd);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
>> +				     0x55, 0xaa, 0x52, 0x08, 0x00);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0e);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x32);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
>> +				     0x55, 0xaa, 0x52, 0x00, 0x00);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x80);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x19);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x00);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1a);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x55);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x11);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x01, 0x7f);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x2d);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x01, 0x20);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x81);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x05);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x3c);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x02);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf9, 0x04);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1e);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x0f);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0f);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf5, 0x20);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0d);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x80);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x83);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x12);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x41);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x13);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x21);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x00);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
>> +				     0x20);
>> +	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x045b);
>> +	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x09b3);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x00)=
;
>> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0xbb0d);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x04);
>> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0xfe0f);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x01, 0x19);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x01);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x90, 0x03, 0x03);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x91,
>> +				     0x89, 0x28, 0x00, 0x0c, 0xd2, 0x00, 0x02,
>> +				     0x2f, 0x01, 0x18, 0x00, 0x07, 0x09, 0x75,
>> +				     0x08, 0x34, 0x10, 0xf0);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x02);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x01);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x30);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x00);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x00);
>> +	mipi_dsi_msleep(&dsi_ctx, 120);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x00);
>> +	mipi_dsi_msleep(&dsi_ctx, 22);
>> +
>> +	return dsi_ctx.accum_err;
>> +}
>> +
>> +static int nt37705_off(struct nt37705_panel *ctx)
>> +{
>> +	struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
>> +
>> +	ctx->dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
>> +
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x00);
>> +	mipi_dsi_msleep(&dsi_ctx, 20);
>> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x00);
>> +	mipi_dsi_msleep(&dsi_ctx, 120);
>> +
>> +	return dsi_ctx.accum_err;
>> +}
>> +
>> +static int nt37705_prepare(struct drm_panel *panel)
>> +{
>> +	struct nt37705_panel *ctx =3D to_nt37705_panel(panel);
>> +	struct device *dev =3D &ctx->dsi->dev;
>> +	struct drm_dsc_picture_parameter_set pps;
>> +	int ret;
>> +
>> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(nt37705_supplies), ctx->suppl=
ies);
>> +	if (ret < 0) {
>
> Common style is to check for errors with
>
>  =C2=A0 if (ret)
>
> Here and everywhere else.

At least for regulator_bulk_enable() "ret < 0" is actually more popular
than just "ret".

Kernel doc says "Return: 0 on success or a negative error number on
failure." so a positive integer should in theory never happen so they're
equivalent.

(git grep -h -A2 regulator_bulk_enable | grep if | sed 's|^[ \t]\+||' | sed=
 's| {$||' | sort | uniq -c)

Thanks for the review!

Regards
Luca

