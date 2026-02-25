Return-Path: <linux-arm-msm+bounces-94190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCykAwRmn2lRagQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 22:13:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A625B19DB4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 22:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FAC0302FB04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 21:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0E531354C;
	Wed, 25 Feb 2026 21:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OspnRTDT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C00313E31
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 21:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772054016; cv=pass; b=VpubRceh3goDIh2C60H4KQiP/U0OyTuVZE9brJTUQoyMoCJUy+driOaHa6ka57X2kE/LPwaLyZ67btCehKs60BJkOSAmjQVeaNFgqDWVoEfmIbiMWtHEpskwCUOLfJmKpaqZCWu/o0Oyp4vmUlZSWPjC0Q/Jp9FeCVr0SU3wqMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772054016; c=relaxed/simple;
	bh=dy7zG1DRvv14sdZGafe4580AOcjEAto8832ZzrAtbiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVRf4exNWVCJMVPj4VB4sYPQnvTIIfErxSRaFt4XcYLaQixnsdbx5tmMJodn8XlsdmlnrbHkNarvPEUAHJkr7jDtUDbnMtBhTbiP6CdpSQ9hhFyaleA6zRPfYmaeMhn/NlRTI79VwT6z13UcrcFzhGqilfdAzvXHhzDsyBbJQ8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OspnRTDT; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bdb17511aaso165321eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 13:13:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772054009; cv=none;
        d=google.com; s=arc-20240605;
        b=dwXll7eM6A5eiyCUs7ad1YcXwonxRVsPrxlWSGKDvegfloDqm+yXGvYg1FwOr/q+ad
         hB+NoXjZ1+a3Ni52SfE4m2BlAnHR91Q0GxjFjM2MdGcfru4TVGmsd/I+L0ppF6o/cs7q
         x8BHYhSNI+L0av9hYgbq0pYjhS11skYP0zX4aBtM0M8QcaadZwYxRH3RAkzXqnfDRZWu
         Xx9/rVgscQ2kK9VS+blp2MovCbrwtp/TtQvmQQ/E0H6qk/NMpyeqXU4PlN5DKrzcFbLE
         UZjFL4DTyFk4aayvhJmkWU1epH24XVVRWkByS9mQ1j9zvJNaab6mKum56ogHTSTtILP8
         eAXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kI/lMs29KmFTEwrEKzW23Xiq7sNZ0CV1sKAB78o6EvU=;
        fh=+jvojnCeX6iECdWduM4QKow8Qmnkuk/v+hDnbxs7I3M=;
        b=CHABSpAYpqf6/lJpX9XqwO7cLMeoTwrIadwON/nwsBx3MTfsyk/mvtBf84hysb4y3y
         ujVtqD1MxF5SsyBtA37pQoKeMAxDhUd9tEmqXbz0hszvuJaxEqXNrn1bKgbQLNfAjon9
         GMiS51pnNPUb/lKbS8h2RTdprIhZOTDeE8WljUS4tAR9lmLuaNQQ7a1ftO86z9BL9X5z
         eR1H31Vr0U7zv1g1pgEdTL7UdbHuDVCm1+bUUWBcwBwwc5wTLynQcETyrsypaYKJVSMN
         hIPLee3KdX0XTtqmCmoqjbVLVGrwNduZrRRGc27oFqQgmBYK5H7SFZMVpU37QiowHLoA
         2nnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772054009; x=1772658809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kI/lMs29KmFTEwrEKzW23Xiq7sNZ0CV1sKAB78o6EvU=;
        b=OspnRTDTrh1KCnfofY3n7W/e30s70UV7GuP1GddTeY8cdTd8BwVDFFkzYnJlMOPiJ/
         ql7Vje4daKVEpLj8umBk0/INgUS4kwJHpUBzUAoQmCo1lkPbq/qsdoFoAxN7o+9LeEpX
         k5x6Dq7iUcl9aywS5vK4sU0D/Q4Kmw+yohGex1E489qjYq1WSNLi3heE+JcotcpKZDDp
         k56lme4bNl8U09MZfwrJuLcFJDwLr+OtPwsa3u7VmESwL5CkQ6JE6INpHva4kvdz/+6J
         /WxSYw/KPKz2c8nGlcLBMbUQfkPhPhwgR3dyQvd+gU5t5sAG6a/MuF0awgsQkUNowhnb
         FWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772054009; x=1772658809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kI/lMs29KmFTEwrEKzW23Xiq7sNZ0CV1sKAB78o6EvU=;
        b=bN0zzwvn/+vkoIaffYZXM/znkpi8TVyIQz7Zs+sDbV+SMKk6YYaatgRxfNdTs7yNHr
         bWTAWk1lMhhsLv2C5Oow53IbXr7AOJ7Ysv0ii7IMQfWLLDsWMcvBSco+A/vxGhL+TqJR
         a+eA4vyhG0l5tb9T+QEwzSLN+Ftcd4glH3gtdZIAUVFrVyT7SG9ae37gcCwlRc8cg96k
         3COMuJOsPlRDp7ko9P+zqIZXpx5Yg0//ECg4YVo+7eXBCZQXdxdJ2RycxJfemPlAKSMk
         n6leFVogWr3RU5Whvvvt8NAxo/Xv2Hdgl+po15BsHSjmbD210GstSI+tRELXEXGz1sL0
         8cag==
X-Forwarded-Encrypted: i=1; AJvYcCV14OwXou0a0ZcfpSJJCSGZXKNFtfJbAWsQuLCdj9MyFuDwR0YS3BpIT9U4Vtuj7XT0fyBpjbOzmD9ApO4o@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx+SGz9oU2LQXT3QyKjsl+rpkcxoILMkI1yYOwuLh7Ve3wO5Ja
	mxDoNVEvI62ueTWdJH5Kr76ByFctkiVPw51/VLoZ+q/8wqTPn7Q3cxUlnSW+d0Hui/20c+1Pi/W
	xva6E039ewlLfTZbNvC6brvcsprx1Jt4=
X-Gm-Gg: ATEYQzzUBnKmuixUfNfQQ7YzWsd/rqDzoANJ4s09PCYHjeGiwULSxfjtRHEsUSZTNtd
	6kkln3lDzkDOilBuoCPQPAkPo9SRFPyqbhurGHe6RtenVU9CvcvOawn4yXH5Lrta5n5ycjHU1ex
	M0OOow90St0SIeNGp5wGMU5iuxDgaGrIjMQpcqYtzBIELgR6cDdLrtSX/LtWGVj7Ka2enmwuYSa
	2SW4nsrsR/pP6ANSFYUIOwR07oZ74x/GhrDMCEhRKHHBGGx3UpYAEvKe35ZIUEozWQJeMpsT4bT
	PYHOG6Q=
X-Received: by 2002:a05:693c:6087:b0:2bd:c82e:41c6 with SMTP id
 5a478bee46e88-2bdc82e44bamr1164722eec.22.1772054009358; Wed, 25 Feb 2026
 13:13:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
 <20260223-panel-patches-v2-2-1b6ad471d540@gmail.com> <44283903-f11d-4b13-a6c7-6f0d40a3d00b@ixit.cz>
In-Reply-To: <44283903-f11d-4b13-a6c7-6f0d40a3d00b@ixit.cz>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 25 Feb 2026 23:13:18 +0200
X-Gm-Features: AaiRm53ns1g6zdXFVqsW7H7CbKjhua17z8nCzLmCQ8NUsxFn6UkK1_Wtl-Egxlw
Message-ID: <CAHuF_ZoZDJ9bGKv9FqAoJsBMjVeyHAJWqoc5NA3sshep3cdDwQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm: panel: Add Samsung S6E8FCO
To: David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94190-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,protonmail.com:email,mail.gmail.com:mid,ixit.cz:email]
X-Rspamd-Queue-Id: A625B19DB4F
X-Rspamd-Action: no action

On Tue, 24 Feb 2026 at 00:00, David Heidelberg <david@ixit.cz> wrote:
>
> On 23/02/2026 21:26, Yedaya Katsman wrote:
> > Add driver for Samsung S6E8FCO DSI video mode panel, used in
> > Xiaomi Mi A3 mobile phone.
> >
> > Co-developed-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > Signed-off-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   MAINTAINERS                                   |   1 +
> >   drivers/gpu/drm/panel/Kconfig                 |  12 ++
> >   drivers/gpu/drm/panel/Makefile                |   1 +
> >   drivers/gpu/drm/panel/panel-samsung-s6e8fco.c | 293 +++++++++++++++++=
+++++++++
> >   4 files changed, 307 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 545d4cf68b9ac27765c7981e668e32cfecf3366b..238b5332eaf0e0cfb983408=
4e24671ccaee79939 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8187,6 +8187,7 @@ DRM DRIVER FOR SAMSUNG S6E8FCO PANELS
> >   M:  Yedaya Katsman <yedaya.ka@gmail.com>
> >   S:  Maintained
> >   F:  Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.y=
aml
> > +F:   drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
> >
> >   DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
> >   M:  David Heidelberg <david@ixit.cz>
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kcon=
fig
> > index 7a83804fedca1b688ce6fbe4295ec9009007e693..734640bb3f73c83e9273573=
aeb720ea1ba20862f 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -893,6 +893,18 @@ config DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01
> >         ~5.6 inch AMOLED display, and the controller is driven by the M=
IPI
> >         DSI protocol with 4 lanes.
> >
> > +config DRM_PANEL_SAMSUNG_S6E8FCO
> > +     tristate "Samsung S6E8FCO DSI video mode panel"
> > +     depends on OF
> > +     depends on BACKLIGHT_CLASS_DEVICE
> > +     select DRM_MIPI_DSI
> > +     select VIDEOMODE_HELPERS
> > +     help
> > +       Say Y or M here if you want to enable support for the Samsung v=
ideo
> > +       mode panel S6E8FCO. The panel has a 6.09 inch AMOLED display, w=
ith
>
> The S6E8.. is not panel, but Display Driver IC, the panel from the
> replacement parts is likely one of M1906F9SH M1906F9SI, thus I would say
> M1906F9.
>
> > +       a resolution of 720x1560.
> > +       Found in the Xiaomi Mi A3 smartphone (xiaomi-laurel).
> > +
> >   config DRM_PANEL_SAMSUNG_SOFEF00
> >       tristate "Samsung SOFEF00 DSI panel controller"
> >       depends on OF
> > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Mak=
efile
> > index b9562a6fdcb38bfd0dfee9e8c11e16149ada4386..54eca60e5b57328ea94ed78=
80f4dead981f87fc1 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -91,6 +91,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS427AP24) +=
=3D panel-samsung-s6e88a0-ams4
> >   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) +=3D panel-samsung=
-s6e88a0-ams452ef01.o
> >   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) +=3D panel-samsung-s6e8aa0.o
> >   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01) +=3D panel-sams=
ung-s6e8aa5x01-ams561ra01.o
> > +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8FCO) +=3D panel-samsung-s6e8fco.o
> >   obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) +=3D panel-samsung-sofef00.o
> >   obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) +=3D panel-seiko-43wvf1g.o
> >   obj-$(CONFIG_DRM_PANEL_SHARP_LQ079L1SX01) +=3D panel-sharp-lq079l1sx0=
1.o
> > diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c b/drivers/gp=
u/drm/panel/panel-samsung-s6e8fco.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..7bbbe8af3e2eb9021ed7f55=
5cb4ad2b0d7ea55ee
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
> > @@ -0,0 +1,293 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +// Copyright (c) 2025 Kamil Go=C5=82da <kamil.golda@protonmail.com>
>
> nitpick: you can also drop copyright year from your copyright or update,
> up to you.
>
> > +// Generated with linux-mdss-dsi-panel-driver-generator from vendor de=
vice tree:
> > +// Copyright (c) 2025, The Linux Foundation. All rights reserved.
> > +
> > +#include <linux/backlight.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <video/mipi_display.h>
> > +
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +struct s6e8fco_samsungp {
> > +     struct drm_panel panel;
> > +     struct mipi_dsi_device *dsi;
> > +     struct regulator_bulk_data *supplies;
> > +     struct gpio_desc *reset_gpio;
> > +};
> > +
> > +static const struct regulator_bulk_data s6e8fco_samsungp_supplies[] =
=3D {
> > +     { .supply =3D "vddio" },
> > +     { .supply =3D "ldo" },
> > +     { .supply =3D "iovcc" },
> > +};
> > +
> > +static inline
> > +struct s6e8fco_samsungp *to_s6e8fco_samsungp(struct drm_panel *panel)
> > +{
> > +     return container_of_const(panel, struct s6e8fco_samsungp, panel);
> > +}
> > +
> > +static void s6e8fco_samsungp_reset(struct s6e8fco_samsungp *ctx)
> > +{
> > +     gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> > +     usleep_range(12000, 13000);
> > +     gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > +     usleep_range(2000, 3000);
> > +     gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> > +     usleep_range(10000, 11000);
> > +}
> > +
> > +static int s6e8fco_samsungp_on(struct s6e8fco_samsungp *ctx)
> > +{
> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
> > +
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0x5a, 0x5a);
>
>    #define s6e3fc2x01_test_key_on_lvl3(ctx) \
>            mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0x5a, 0x5a> +
> > +     mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x0000);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DIS=
PLAY,
> > +                                  0x20);
> > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> > +     mipi_dsi_msleep(&dsi_ctx, 50);
> > +     mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> > +
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x04, 0xed);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xed,
> > +                                  0xe4, 0x08, 0x96, 0xa4, 0x2a, 0x72, =
0xe2,
> > +                                  0xca, 0x00);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0xa5, 0xa5);
>
>    #define s6e3fc2x01_test_key_off_lvl3(ctx) \
>            mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0xa5, 0xa5)
>
> etc. etc., check panel-samsung-s6e3fc2x01.c for example (and eventually
> other surrounding drivers) and try to de-mystify the writes as much as
> you can (ofc "reasonably" - as we don't have the datasheet).
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0x5a, 0x5a);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x93);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x05, 0xf4);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x03);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xed, 0x01, 0x81, 0x04);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0xa5, 0xa5);
> > +
> > +     return dsi_ctx.accum_err;
> > +}
> > +
> > +static int s6e8fco_samsungp_off(struct s6e8fco_samsungp *ctx)
> > +{
> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
> > +
> > +
> > +     mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> > +     mipi_dsi_msleep(&dsi_ctx, 20);
> > +     mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> > +     mipi_dsi_msleep(&dsi_ctx, 120);
> > +
> > +     return dsi_ctx.accum_err;
> > +}
> > +
> > +static int s6e8fco_samsungp_prepare(struct drm_panel *panel)
> > +{
> > +     struct s6e8fco_samsungp *ctx =3D to_s6e8fco_samsungp(panel);
> > +     struct device *dev =3D &ctx->dsi->dev;
> > +     int ret;
> > +
> > +     ret =3D regulator_bulk_enable(ARRAY_SIZE(s6e8fco_samsungp_supplie=
s), ctx->supplies);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to enable regulators: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     s6e8fco_samsungp_reset(ctx);
> > +
> > +     ret =3D s6e8fco_samsungp_on(ctx);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to initialize panel: %d\n", ret);
> > +             gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > +             regulator_bulk_disable(ARRAY_SIZE(s6e8fco_samsungp_suppli=
es), ctx->supplies);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int s6e8fco_samsungp_unprepare(struct drm_panel *panel)
> > +{
> > +     struct s6e8fco_samsungp *ctx =3D to_s6e8fco_samsungp(panel);
> > +     struct device *dev =3D &ctx->dsi->dev;
> > +     int ret;
> > +
> > +     ret =3D s6e8fco_samsungp_off(ctx);
> > +     if (ret < 0)
> > +             dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> > +
> > +     gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > +     regulator_bulk_disable(ARRAY_SIZE(s6e8fco_samsungp_supplies), ctx=
->supplies);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct drm_display_mode s6e8fco_samsungp_mode =3D {
>
> name the struct according to the panel, not (only) the DDIC.

Did that (in the next version I will send), changed the rest of
driver to be very S6E8FCO-M1906F9 specific as well.
>
> > +     .clock =3D (720 + 350 + 40 + 294) * (1560 + 17 + 2 + 5) * 60 / 10=
00,
> > +     .hdisplay =3D 720,
> > +     .hsync_start =3D 720 + 350,
> > +     .hsync_end =3D 720 + 350 + 40,
> > +     .htotal =3D 720 + 350 + 40 + 294,
> > +     .vdisplay =3D 1560,
> > +     .vsync_start =3D 1560 + 17,
> > +     .vsync_end =3D 1560 + 17 + 2,
> > +     .vtotal =3D 1560 + 17 + 2 + 5,
> > +     .width_mm =3D 65,
> > +     .height_mm =3D 140,
> > +     .type =3D DRM_MODE_TYPE_DRIVER,
> > +};
> > +
> > +static int s6e8fco_samsungp_get_modes(struct drm_panel *panel,
> > +                                   struct drm_connector *connector)
> > +{
> > +     return drm_connector_helper_get_modes_fixed(connector, &s6e8fco_s=
amsungp_mode);
> > +}
> > +
> > +static const struct drm_panel_funcs s6e8fco_samsungp_panel_funcs =3D {
> > +     .prepare =3D s6e8fco_samsungp_prepare,
> > +     .unprepare =3D s6e8fco_samsungp_unprepare,
> > +     .get_modes =3D s6e8fco_samsungp_get_modes,
> > +};
> > +
> > +static int s6e8fco_samsungp_bl_update_status(struct backlight_device *=
bl)
> > +{
> > +     struct mipi_dsi_device *dsi =3D bl_get_data(bl);
> > +     u16 brightness =3D backlight_get_brightness(bl);
> > +     int ret;
> > +
> > +     dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> > +
> > +     ret =3D mipi_dsi_dcs_set_display_brightness_large(dsi, brightness=
);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> > +
> > +     return 0;
> > +}
> > +
> > +static int s6e8fco_samsungp_bl_get_brightness(struct backlight_device =
*bl)
> > +{
> > +     struct mipi_dsi_device *dsi =3D bl_get_data(bl);
> > +     u16 brightness;
> > +     int ret;
> > +
> > +     dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> > +
> > +     ret =3D mipi_dsi_dcs_get_display_brightness_large(dsi, &brightnes=
s);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> > +
> > +     return brightness;
> > +}
> > +
> > +static const struct backlight_ops s6e8fco_samsungp_bl_ops =3D {
> > +     .update_status =3D s6e8fco_samsungp_bl_update_status,
> > +     .get_brightness =3D s6e8fco_samsungp_bl_get_brightness,
> > +};
> > +
> > +static struct backlight_device *
> > +s6e8fco_samsungp_create_backlight(struct mipi_dsi_device *dsi)
> > +{
> > +     struct device *dev =3D &dsi->dev;
> > +     const struct backlight_properties props =3D {
> > +             .type =3D BACKLIGHT_RAW,
> > +             .brightness =3D 268,
>
> ~ 10% of brightness at boot? What is the scale? Shouldn't make sense to
> set it around 50%? (just asking)
This is just what was configured downstream, it looks bright enough for me
fwiw, I can change it if you want.

> > +             .max_brightness =3D 2047,
> > +     };
> > +
> > +     return devm_backlight_device_register(dev, dev_name(dev), dev, ds=
i,
> > +                                           &s6e8fco_samsungp_bl_ops, &=
props);
> > +}
> > +
> > +static int s6e8fco_samsungp_probe(struct mipi_dsi_device *dsi)
> > +{
> > +     struct device *dev =3D &dsi->dev;
> > +     struct s6e8fco_samsungp *ctx;
> > +     int ret;
> > +
> > +     ctx =3D devm_drm_panel_alloc(dev, struct s6e8fco_samsungp, panel,
> > +                                &s6e8fco_samsungp_panel_funcs,
> > +                                DRM_MODE_CONNECTOR_DSI);
> > +     if (IS_ERR(ctx))
> > +             return PTR_ERR(ctx);
> > +
> > +     ret =3D devm_regulator_bulk_get_const(dev,
> > +                                         ARRAY_SIZE(s6e8fco_samsungp_s=
upplies),
> > +                                         s6e8fco_samsungp_supplies,
> > +                                         &ctx->supplies);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > +     if (IS_ERR(ctx->reset_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> > +                                  "Failed to get reset-gpios\n");
> > +
> > +     ctx->dsi =3D dsi;
> > +     mipi_dsi_set_drvdata(dsi, ctx);
> > +
> > +     dsi->lanes =3D 4;
> > +     dsi->format =3D MIPI_DSI_FMT_RGB888;
> > +     dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BUR=
ST |
> > +                       MIPI_DSI_CLOCK_NON_CONTINUOUS;
> > +
> > +     ctx->panel.prepare_prev_first =3D true;
> > +
> > +     ctx->panel.backlight =3D s6e8fco_samsungp_create_backlight(dsi);
> > +     if (IS_ERR(ctx->panel.backlight))
> > +             return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> > +                                  "Failed to create backlight\n");
> > +
> > +     drm_panel_add(&ctx->panel);
> > +
> > +     ret =3D mipi_dsi_attach(dsi);
> > +     if (ret < 0) {
> > +             drm_panel_remove(&ctx->panel);
> > +             return dev_err_probe(dev, ret, "Failed to attach to DSI h=
ost\n");
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void s6e8fco_samsungp_remove(struct mipi_dsi_device *dsi)
> > +{
> > +     struct s6e8fco_samsungp *ctx =3D mipi_dsi_get_drvdata(dsi);
> > +     int ret;
> > +
> > +     ret =3D mipi_dsi_detach(dsi);
> > +     if (ret < 0)
> > +             dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n"=
, ret);
> > +
> > +     drm_panel_remove(&ctx->panel);
> > +}
> > +
> > +static const struct of_device_id s6e8fco_samsungp_of_match[] =3D {
> > +     { .compatible =3D "samsung,s6e8fco" },
>
> Optimally the compatible should reflect the panel used, eg something
> like samsung,s6e8fco-m1906f9 . It's possible there will be more panels
> using this DDIC, then this would make it much clearer.

Will do
> Happy to see another phone panel heading to mainline, thanks for your wor=
k!

Thanks for your review!
> David
>
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, s6e8fco_samsungp_of_match);
> > +
> > +static struct mipi_dsi_driver s6e8fco_samsungp_driver =3D {
> > +     .probe =3D s6e8fco_samsungp_probe,
> > +     .remove =3D s6e8fco_samsungp_remove,
> > +     .driver =3D {
> > +             .name =3D "panel-samsung-s6e8fco",
> > +             .of_match_table =3D s6e8fco_samsungp_of_match,
> > +     },
> > +};
> > +module_mipi_dsi_driver(s6e8fco_samsungp_driver);
> > +
> > +MODULE_AUTHOR("Kamil Go=C5=82da <kamil.golda@protonmail.com>");
> > +MODULE_DESCRIPTION("DRM driver for s6e8fco samsung amoled video mode d=
si panel");
> > +MODULE_LICENSE("GPL");
> >
>
> --
> David Heidelberg
>

Thanks, Yedaya

