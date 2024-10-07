Return-Path: <linux-arm-msm+bounces-33444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F23B993682
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 20:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52637280D84
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 18:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134EB1DE2DA;
	Mon,  7 Oct 2024 18:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKFdgKqV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AE21DE2D7;
	Mon,  7 Oct 2024 18:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326705; cv=none; b=ggqNuDZp0GThgWMW8SogTIsA+qA25+mbxzX8Rkt+42RGxIn8dOpHZyEnA8cHqtITnBafhVTlHKdarJdHfvdJGe2uiVi4j8hXaVZmzG78qo7ZkJKB9yZ7CE1pWy0+0HJt33Djb9NaUetQ+Ri9+HKApr2QuMfrOWvZ0Hx8940e3/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326705; c=relaxed/simple;
	bh=aFgguVkPgvmYEgo1nNrrsaTAGtizvvAO8EL4w8hkF2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UDINV7NWAaNVC7gc11Pnw7o6dEfnD068P5gBdMfwdKg+C3EERaj25obdXP+JDWaV4h6Mu/EHBKe9lS+Q4nxFEkl3+gsD4TRjwx3LKZevrDBFCUlS57Q4EomjKPhwHMhV1x8WE9XCRdbnK+hIOpJw1eHG+U3HfNnmd0K7ApRV8J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKFdgKqV; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a99422929b2so274157366b.0;
        Mon, 07 Oct 2024 11:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326701; x=1728931501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpcBS4W1kFB+12tXh89jBvEFmKSth35TqnF+NTQazEw=;
        b=SKFdgKqVHfVefrMqMzlBnuppKpf7H+5X9yQFZwMxMLwGKCJJm790DjvH+FFPUNlxwZ
         rrrP95R5eltL+KG63+tWZxKpDcUgoCYeodNZYweOEFfwHCPnlw1FMBbGZtjW3XJRHoPg
         PZJ4yg+cH3TJK2WUxnT1NjM0ntrQCYn233mFDFOYc5jRKD0WyC3YA/akboA+d3P6o2bu
         ax66V7N8qCwU33EC4zyEua1A6DsutdV/DNq6GTjyxjqWRaDk37OQZ9gnMljurf008QGU
         5LMUYWLDMULI9SPquucYSXodMsuq5GJo/38LZkH+DEXs5SHLDZWmATx7fB4aj826+MjC
         zU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326701; x=1728931501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpcBS4W1kFB+12tXh89jBvEFmKSth35TqnF+NTQazEw=;
        b=Mv+jdyt36nfAy8JEGo1Qr8HnHdoo0rgyDdeAjdWpEX8pCKsl0Nk0C/006NNuoQ1hr4
         f1xtnL8wsvrzNyVZQRtXw3qXsMKAvP8pdhQzeSrnaa85nVY7rKY+RusQhV3x/IhneZOI
         G6QzwYoJPEfTWHpRQxTDJ9A4xeV4DKr9+c+YZyG7AEKrIDCyh+sCRX8hqh7bCYVGLd1T
         32yjFT+ZVZoNHAA4XnuGnga6G5H70dMb4lIdf0CsbielduhFAw8tokg/9V6CO1fkSPCr
         CO8wqlxz5QmnjLPP4JQfevhxF3GPEO9kSLj2er14Ki2ut8WnqyRqkEZGdDaGiz6GXRy/
         RjCA==
X-Forwarded-Encrypted: i=1; AJvYcCUO9QSNpYqb0VDm2AZZ7huATEreI+kSWA/D0ENSKl984XGxgmyNkxR6Vcp+mqPDvdOKAKmPi3APnKgr3bWCLQ==@vger.kernel.org, AJvYcCWbcITh480UTgJjo62XHREznPJzGKGmxtpx4Fnv5smhLRPS3WxI2ghFPgmstnmhgNJmfz+ix3lkRQlf@vger.kernel.org, AJvYcCWl0TBu+mJ3aoUX301dzvgWpA0eKNcR6wBciTueJrXirzu7CQpgERIT5+Q1ULxJKb+SbktHV/IU9AFr146CQatCkzkUFA==@vger.kernel.org, AJvYcCWr6JdWM5WJmzXs4whQwY9RvWbx+MISoQ0mzEgigKkn51WFY9+QFvxZPSKi6UQ/taPpQIDNyHB1ZLrsHI6P@vger.kernel.org
X-Gm-Message-State: AOJu0YwfaA7HCnpKJZnuVemKrkOB/qTc2xrwfjiE3sEhUdQa58/9jQHv
	9bxFv66mdwBDKpcKGe67QXLfwZ05cTEQkRfTjdRLFnxkbvOwAUBzvjZavdYL5ugEpPNHLpTYilv
	0Ax2EHTdLEkqnGOU6mzApmET83Q==
X-Google-Smtp-Source: AGHT+IHZEUV4xvcw8SnHslCYeh5PcSBDUdYW6T/3iLmwJdzSsN1GbFdNXmoh1kVFwkjuukt+zfTzgyYykjTrJFDjclw=
X-Received: by 2002:a17:907:6d20:b0:a99:3f6e:2da1 with SMTP id
 a640c23a62f3a-a993f6e2e6emr760687066b.38.1728326701141; Mon, 07 Oct 2024
 11:45:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240908223505.21011-1-jerome.debretagne@gmail.com>
 <20240908223505.21011-4-jerome.debretagne@gmail.com> <f9cbd1c3-eb05-4262-bdc6-6d37e83179e5@gmail.com>
In-Reply-To: <f9cbd1c3-eb05-4262-bdc6-6d37e83179e5@gmail.com>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Mon, 7 Oct 2024 20:44:24 +0200
Message-ID: <CA+kEDGEdd_s+DGKsVNY6Jy870B72eHuaj2EgEnwP8J46ZGbxpQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] platform/surface: aggregator_registry: Add Surface
 Pro 9 5G
To: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm replying with Hans and Ilpo, who I initially forgot for this
patch, sorry about that.

Le mar. 10 sept. 2024 =C3=A0 23:29, Maximilian Luz
<luzmaximilian@gmail.com> a =C3=A9crit :
>
> Looks good. Two very small nit-picks below, if this goes for a v3:

Atm I'm not planning for a v3 as Bjorn has applied the other v2
patches earlier today.
Feel free to include the 2 small suggestions when applying this patch maybe=
?

> On 9/9/24 12:35 AM, J=C3=A9r=C3=B4me de Bretagne wrote:
> > Add SAM client device nodes for the Surface Pro 9 5G, with the usual
> > battery/AC and HID nodes for keyboard and touchpad support.
> >
> > Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.co=
m>
> > ---
> >   .../surface/surface_aggregator_registry.c       | 17 ++++++++++++++++=
+
> >   1 file changed, 17 insertions(+)
> >
> > diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/d=
rivers/platform/surface/surface_aggregator_registry.c
> > index 25c8aa2131d6..8b34d7e465c2 100644
> > --- a/drivers/platform/surface/surface_aggregator_registry.c
> > +++ b/drivers/platform/surface/surface_aggregator_registry.c
> > @@ -390,6 +390,21 @@ static const struct software_node *ssam_node_group=
_sp9[] =3D {
> >       NULL,
> >   };
> >
> > +/* Devices for Surface Pro 9 5G. */
>
> Would be nice if you could change the comment on the SP9 node group to
> "Surface Pro 9 (Intel/x86)" and the comment here to "Surface Pro 9 5G
> (ARM/QCOM)" or something along those lines to make things a bit more
> clear.
>
> > +static const struct software_node *ssam_node_group_sp9_5G[] =3D {
>
> (This is really just me being a bit obsessive:) It would be nice to have
> all-lowercase variable names (regarding the 5G).

:)

> > +     &ssam_node_root,
> > +     &ssam_node_hub_kip,
> > +     &ssam_node_bat_ac,
> > +     &ssam_node_bat_main,
> > +     &ssam_node_tmp_sensors,
> > +     &ssam_node_hid_kip_keyboard,
> > +     &ssam_node_hid_kip_penstash,
> > +     &ssam_node_hid_kip_touchpad,
> > +     &ssam_node_hid_kip_fwupd,
> > +     &ssam_node_hid_sam_sensors,
> > +     &ssam_node_kip_tablet_switch,
> > +     NULL,
> > +};
> >
> >   /* -- SSAM platform/meta-hub driver. --------------------------------=
-------- */
> >
> > @@ -462,6 +477,8 @@ static const struct acpi_device_id ssam_platform_hu=
b_acpi_match[] =3D {
> >   MODULE_DEVICE_TABLE(acpi, ssam_platform_hub_acpi_match);
> >
> >   static const struct of_device_id ssam_platform_hub_of_match[] __maybe=
_unused =3D {
> > +     /* Surface Pro 9 5G */
> > +     { .compatible =3D "microsoft,arcata", (void *)ssam_node_group_sp9=
_5G },
> >       /* Surface Laptop 7 */
> >       { .compatible =3D "microsoft,romulus13", (void *)ssam_node_group_=
sl7 },
> >       { .compatible =3D "microsoft,romulus15", (void *)ssam_node_group_=
sl7 },
>
> Thanks!
>
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

Thanks for your review and all the work about SSAM for Surface owners!

Regards,
J=C3=A9r=C3=B4me

> On a related note: I'm wondering whether we should also already add the
> ACPI IDs for the as-of-now ARM-only devices. Technically, things won't
> work with ACPI right now, but it's not because of the SAM driver stack.
> Or maybe at least add them to the comments as a way of documenting it.
>
> Best regards,
> Max

