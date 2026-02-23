Return-Path: <linux-arm-msm+bounces-93808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO3aFPG1nGkNKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:17:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A887517CCD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59A573046500
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4222B376BF7;
	Mon, 23 Feb 2026 20:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLHDX3Vt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661E3376BFD
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 20:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771877839; cv=pass; b=lkMifwG/uZYnI81LJJ5EGulJDoX08lQ7YgcMiq3KCGQ1DchTM1XnN2ssaz/x/WFHSylnTel0Xf5QzJFgAaOCGT2wZf6fj2OVWJHlzNZNG+pCPbbn/8guGwvuO7QAwf+NDmg8k/MXaUEnhe9vOrjq4/M5lG/OmaN/K49DZDa0LWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771877839; c=relaxed/simple;
	bh=ceb0+/4imQs3+NBjs4WWx4sCzkZG1sxDy5ntGNiBLP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LVC3rJ8CdH0VjyKaDLV2zEZIFG//c1RfJZNQiWMXzz/uz/HNltQgM7iinTYw3Fepw0SRpikGbFsZ0pHPwZ0Fn5SvKAN2gfQfJyvFhRSbEFr7ROH/9Q1BOIWFYs4dMh19SSdjxMR1iLqmceZWJ0W5tErrKX+jeLGHN5niTrcCx7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLHDX3Vt; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b82c605dbdso4488508eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:17:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771877836; cv=none;
        d=google.com; s=arc-20240605;
        b=LWcjQN5rhp+NS1MktqOIwb8xZoyou4/T31jv518cawI6t+/+++gowARlM63WLSFiVn
         RMzB7p3CGROev5p5eoUYdCq0QTs+oWewMP5kXUxYItP1xbAW2erOl2INmXreW77CKmD+
         CCvlGQVb9UudNLeQilVpZaHJRwLD3JVrUfaud5otNYRKo0FjVZ4TM08Y+Wposwt5h9Ii
         kijuOzjGN/QvczKIVSVGU0PjQBph9BJSp/dnXGCdWkjRZTXB3FL4CeXlXyXG0ZuJvo6+
         u8O9llUChsQyiDB2krj9TfbPBiBibLt896uuBM4F1mbdJhl4I42eTeRZ9ue8q5l+sdQQ
         s+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ku3Mg3/oKQLa8vntyumKsTib+5PskclBL/D3UhM5Vrc=;
        fh=ze0MhHgo5Ly1bK0/XJo9QoOCrPRE93XNDyxlI9slPM8=;
        b=SWMcKCeeZ8BucgGV5naSE7O/HsOlKZidlFs9pj/Gx/eZNp7wFw9Buqb99DNZ4qZ0R0
         ARTfUv5XL2mjbr6qINiwi/G7N9jALOFQ43VuLXBmFu4rDQgKGopxlHpV4VRJDRdL5jCw
         ++qs2myOlsn6aFRVovPbd75yl6uY+XxxFugKv9xprgmyNDJsb6P4NVo+LKqr6/vl5fg1
         +eDoZ3HRxsZa9aRuXLfsB3cSbx376Slt67EbENrLWnPeLG2Bbi0Eu2B0TFDOE19vdAtn
         jB6dJmXrkhTKMo9MeB2HjwlgwKMSTfQ81/uzWlBq+WArUfHAQE0W6q6k+C/R2Ok09VmH
         dEGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771877836; x=1772482636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ku3Mg3/oKQLa8vntyumKsTib+5PskclBL/D3UhM5Vrc=;
        b=BLHDX3Vt0aP2FlDcX1iZsGZZKp44xCUewXgEqmd2xWCWR9vSvjU37jv9St25f3HdJW
         vB1/QuqLRHJtyGfpz8vfSStIGS8hDEwx6KVF/PV6ekZ2/pu3UQLJu7hdeX2k9ulu+tSR
         SficUg8Il+wcHw5tOP7g6m9kJoZOYDauz/OO79Pl49cz+7WF1fzqXjlHob6dnSU62/AU
         s+M5OvWLtCg71QV3TuG00dnv+7TSWevrkLWGjpIDbfPOv/35TeaEefeGVAhRgtigjkbA
         h/+ODrT3pJGzQXLuumTO++Yk7dGk+PEQVULsGCjlmrs8pVDBHC/MzU5w3fti09vqTgG7
         PRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771877836; x=1772482636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ku3Mg3/oKQLa8vntyumKsTib+5PskclBL/D3UhM5Vrc=;
        b=dYmAavYNzdninbFSRM05BpqB4u2aPtuEg8B1ti6wR/vWyag1yzorNhDRVo9YXofQf+
         XeAPvWpPu1ObJzac4JeQMoxy0omLSpIqWpJkJV60jDIjqojKeO+2DCjRCUCezmrlmB6D
         WPnd1E0fZT4sT0bA3JKhxWAknA/Diq8HAAKowResu5u68sDN/i26YK3ajlcFVvTQ+U88
         RW1fiwTDqp/0c03zpbff8dKR2DE9KCVxDSHpoGISK62ejXP49tSHV1yG9RN45xi1/90B
         bCJXhfZAMCt3gUPgQLR4ORbW/t31Kb53xPftODRwmWX01hCSqOMSeu/Cq9zVzuHUUO8S
         OoLA==
X-Forwarded-Encrypted: i=1; AJvYcCX2LZFRukV3rK4yIGYpH8zAIVc8hgJIIEKeLexhF5vGMCos4gOYBiHX8ykz2c0P6glET44XBBRECj39qXrp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm+iiNlQxZdXFl4QIL8k2MksemmrbrrhraHf0vKVO/vsbGhjs8
	MvX6sqod+NEpowg5ZVSDTXMwNlek0obRzx7hAKzoQaX4/cK10+7dwpFH7eEUWAoGjqCO34CQHT/
	B31LwQi9i6uD0UG9hFnV3xjPBYk9hQ7g=
X-Gm-Gg: ATEYQzyhkJ3QtXWzoJ9fDgueiAQlP+73QbXpgDAjJ8HzGvKhjJNo3m0mAeLLvW9m2F9
	AN69XqgoOLu9WclwUsE1Jqu1MvjkxyFDdDNaPMbWONzYk8cgT2Q8DBSHYCbjtT+QVAkJTRf2v9i
	D0sAqzj938o5F4fEcwiS4TKKKMsiwQ3reG50H/knyohn47bG3keoorxWcc65yGKWfb7odiz/BNc
	FrN9YNqdsTUhk5OFv64zE6bK5BklEl6M0Nwga4UJ8r+uJtdSxpXM5WTAecPTIakscJWRfObcOLz
	wBTR62U=
X-Received: by 2002:a05:7300:2308:b0:2ba:8e16:260e with SMTP id
 5a478bee46e88-2bd7bae98aemr4722722eec.11.1771877835876; Mon, 23 Feb 2026
 12:17:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
 <20260223-panel-patches-v1-2-7756209477f9@gmail.com> <5ibwkfovm2vvpin475c47lueomscnetwv6myglxqtaw7x26l2m@q6p5vye7itnh>
In-Reply-To: <5ibwkfovm2vvpin475c47lueomscnetwv6myglxqtaw7x26l2m@q6p5vye7itnh>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Mon, 23 Feb 2026 22:17:02 +0200
X-Gm-Features: AaiRm50W1tsviNG90UeMm0nn7lr90F7cH3ejpUjkJcKTj0bb54NI64GJklPJBu8
Message-ID: <CAHuF_ZqVUvQSvQNnC55kDGE5KiDPPOphZCxOSmW_uqp5DGeCAA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drivers: gpu: drm: panel: Add Samsung S6E8FCO
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93808-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid,protonmail.com:email]
X-Rspamd-Queue-Id: A887517CCD8
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 at 21:37, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Feb 23, 2026 at 04:24:03PM +0200, Yedaya Katsman wrote:
> > Add driver for Samsung S6E8FCO DSI video mode panel, used in
> > Xiaomi Mi A3 mobile phone.
> >
> > Co-developed-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > Signed-off-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> > ---
> >  MAINTAINERS                                   |   1 +
> >  drivers/gpu/drm/panel/Kconfig                 |  12 ++
> >  drivers/gpu/drm/panel/Makefile                |   1 +
> >  drivers/gpu/drm/panel/panel-samsung-s6e8fco.c | 293 ++++++++++++++++++=
++++++++
> >  4 files changed, 307 insertions(+)
>
> Please change the subject to follow "drm: panel: foo bar baz".
Ok
> With that in place:
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Thanks
>
>
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 545d4cf68b9ac27765c7981e668e32cfecf3366b..238b5332eaf0e0cfb983408=
4e24671ccaee79939 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8187,6 +8187,7 @@ DRM DRIVER FOR SAMSUNG S6E8FCO PANELS
> >  M:   Yedaya Katsman <yedaya.ka@gmail.com>
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.y=
aml
> > +F:   drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
> >
> >  DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
> >  M:   David Heidelberg <david@ixit.cz>
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
> > +       a resolution of 720x1560.
> > +       Found in the Xiaomi Mi A3 smartphone (xiaomi-laurel).
> > +
> >  config DRM_PANEL_SAMSUNG_SOFEF00
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
> >  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) +=3D panel-samsung-=
s6e88a0-ams452ef01.o
> >  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) +=3D panel-samsung-s6e8aa0.o
> >  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01) +=3D panel-samsu=
ng-s6e8aa5x01-ams561ra01.o
> > +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8FCO) +=3D panel-samsung-s6e8fco.o
> >  obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) +=3D panel-samsung-sofef00.o
> >  obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) +=3D panel-seiko-43wvf1g.o
> >  obj-$(CONFIG_DRM_PANEL_SHARP_LQ079L1SX01) +=3D panel-sharp-lq079l1sx01=
.o
> > diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c b/drivers/gp=
u/drm/panel/panel-samsung-s6e8fco.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..0a1a1c680ee143d2429a6e1=
ea59a4fdd16b156b4
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
> > @@ -0,0 +1,293 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +// Copyright (c) 2025 Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > +// Generated with linux-mdss-dsi-panel-driver-generator from vendor de=
vice tree:
> > +// Copyright (c) 2026, The Linux Foundation. All rights reserved.
>
> Hmm, so Kamil worked on it before it was written by LF? Are you sure
> that the year here is correct?

What happened is kamil worked on it, and then I regenerated it again
with the script. Re-considering it, the LF copyright should be from
the start, I shouldn't have modified it, will fix, thanks for pointing
it out!

> > +
>
> > +
> > +static const struct backlight_ops s6e8fco_samsungp_bl_ops =3D {
> > +     .update_status =3D s6e8fco_samsungp_bl_update_status,
> > +     .get_brightness =3D s6e8fco_samsungp_bl_get_brightness,
>
> Does it actually return the written value?
Yes, writing to /sys/class/backlight/5e94000.dsi.0/brightness and
reading from /sys/class/backlight/5e94000.dsi.0/actual_brightness
works correctly.

> > +};
> > +
>
> --
> With best wishes
> Dmitry

Regards, Yedaya

