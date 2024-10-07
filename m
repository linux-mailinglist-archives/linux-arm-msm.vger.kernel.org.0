Return-Path: <linux-arm-msm+bounces-33450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A93B99937D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 22:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD0651C20A8D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 20:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FA51DE3DB;
	Mon,  7 Oct 2024 20:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIzmc+uO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C151865FC;
	Mon,  7 Oct 2024 20:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728331229; cv=none; b=fk80x7Ebgs1umyvbuf5cKDDg3tkX3cKd2cNS5LqKnz4h9BeLk/W6NMvf2h2gnXN0fZfi2hor91rs4XLGAL1CMS2+PELtM2x/4AFY0H4K7DRcijKJq6pxqw7Gff93OMe6iS4eovOegkfquApJBxmcyDiWQEUZiyVPkT1wRw6m2rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728331229; c=relaxed/simple;
	bh=TtJAzQM2NtR+aEQK2OIN2Vn/FJlu03Hlz0x+rB3C5eQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJ2EhC9SQvOsf+cx3aqcooEHYJx1ubA8epm0rYXOymHd1ANQTohYwQ17oChOGuMzY3J92gGfhfuH9Dbfg6oP0+XUZxX99JrukYOqMWTmyr5ccyeNvIUYnj2ygdvoqhCkNQgI7iapm5wTRHAphpGoJq2/e6Ipxm4CTM+ByKzDuDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIzmc+uO; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9963e47b69so84917466b.1;
        Mon, 07 Oct 2024 13:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728331226; x=1728936026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OT6xKH/kSeLVKNU9JNpMOg+05Q9qIAbICN9iB6I+k6g=;
        b=CIzmc+uOZOeBALHeyJgbNDGuKWANrttG+bhVmfa4TmQFV44BVDFI4sx5AR29gyZsQ0
         Dxah56TG+klX9NKgMB+EZuGQgH+qRVaKwtwO/u67gCOxyGwTeueHjWF4EVP5z6lzPMKC
         AZzCkJlDp0cAeh//RzFhoB/TCpQfGCKVvpMG46ZL5Y8QjtMXWlMYrQbS+xeyT9hjEL3X
         FjpI0Dha713Ev20zYn90cwuRL4UnZp+ZNhBahhe//c5zP3/ElJ73I33RsKJvkd/7+K2s
         oc8Erwhf2GF4ozl+4WD5gckvpxkMKJppVbLhVTQt4A5cTesl0S/befEzoXyk5SlV4HDc
         O8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728331226; x=1728936026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OT6xKH/kSeLVKNU9JNpMOg+05Q9qIAbICN9iB6I+k6g=;
        b=bkcQH5bf1Fn5E3EIjerFz8546XgAKs0ATnJQv8SC0y5O0/48U5eQCbUvLE6TBWb9L3
         iSLNFyhxhSfwyZLk70xGAJ2iC7v9ZcYySBeqzis6pm0y/vvlMYfzW85Owe1dOcAnYSsk
         gCswkxkY7ZY8izb3D0WWnMqrcDbT+OyNk1trz82keCJtwonUfm3ewqHwvBZhJQRwhVKG
         LpqNzDE8TfI6ZMg7cwCiR2I1hNhBuWNkGoPLxdWGiYusmmRzrvg99b/TScx1SLR50Cnz
         mBhNoHUl3SidVeRcfJeP0gH+7r8m67GcssUlhS5IKFbgBe+Q3qvKHlh5SLHhsaWtqbxH
         2rSA==
X-Forwarded-Encrypted: i=1; AJvYcCV2ZoLSByIKN+GIz3KoOzG8RM1dC8GOlsj6xKDek8N920SxyEndJ6sgr4KqHcWS2mtGtK4zmRfjCk/6NAiwPvjt59/+xQ==@vger.kernel.org, AJvYcCWcKIZ5JWXtbTts9cwknlDI2doo1gItYR5F30R2/OXXCsNtlol0mqrRR49EcebYIoB+biCK0nfSKLGEu8nW@vger.kernel.org, AJvYcCX+Dy8u+UDNUGvOLA+p2f3Mo675wtvvvLM4og2QKDvQKmBsq/VZbJCfFBe+7nWl+BzjybhQ9f8SUDnzjViygw==@vger.kernel.org, AJvYcCX+HR6qsNjLLvDhGEyrZlGaTb+vpzUlXqVm0fosc9Wlop/wVnbUJknpiJZEk62O9iyitICFQrVE85Ll@vger.kernel.org
X-Gm-Message-State: AOJu0YxeUYxH1m8LKfXb6WbLjBLL3N8g/gDyJVIKogmzsKCb3Ifz/rb8
	UOPVCUKTzaFtPyfXLWu176UhQTJORX/kh0oHImbruVjFkEg7dwuDDQwcJ55Fd+CYqbAqDVULUSc
	D4f8FwTND/aHESZUXIm4pxkQq1w==
X-Google-Smtp-Source: AGHT+IHSzR3rAqiy5pJIgwzaNywFeckBD2pUNplX4II9/i4ncSd1RgLLQujAJ9bVoefSp9M0aiuooG/0Ogm5Nkot8Yk=
X-Received: by 2002:a17:907:3183:b0:a8d:29b7:ecf3 with SMTP id
 a640c23a62f3a-a991bce3fbcmr1478655766b.13.1728331225883; Mon, 07 Oct 2024
 13:00:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240908223505.21011-1-jerome.debretagne@gmail.com>
 <20240908223505.21011-4-jerome.debretagne@gmail.com> <f9cbd1c3-eb05-4262-bdc6-6d37e83179e5@gmail.com>
 <CA+kEDGEdd_s+DGKsVNY6Jy870B72eHuaj2EgEnwP8J46ZGbxpQ@mail.gmail.com> <8370d062-b3d2-46f5-9e7b-8e16edde8480@redhat.com>
In-Reply-To: <8370d062-b3d2-46f5-9e7b-8e16edde8480@redhat.com>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Mon, 7 Oct 2024 21:59:49 +0200
Message-ID: <CA+kEDGHfXa27HJ1KEcRfss9-FeQ-cCqrcQ8pYeWjWZf_N8YaHw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] platform/surface: aggregator_registry: Add Surface
 Pro 9 5G
To: Hans de Goede <hdegoede@redhat.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 7 oct. 2024 =C3=A0 20:54, Hans de Goede <hdegoede@redhat.com> a =C3=
=A9crit :
>
> Hi J=C3=A9r=C3=B4me,
>
> On 7-Oct-24 8:44 PM, J=C3=A9r=C3=B4me de Bretagne wrote:
> > Hi,
> >
> > I'm replying with Hans and Ilpo, who I initially forgot for this
> > patch, sorry about that.
>
> No worries thank you for forwarding Maximilian's review.
>
> > Le mar. 10 sept. 2024 =C3=A0 23:29, Maximilian Luz
> > <luzmaximilian@gmail.com> a =C3=A9crit :
> >>
> >> Looks good. Two very small nit-picks below, if this goes for a v3:
> >
> > Atm I'm not planning for a v3 as Bjorn has applied the other v2
> > patches earlier today.
> > Feel free to include the 2 small suggestions when applying this patch m=
aybe?
> >
> >> On 9/9/24 12:35 AM, J=C3=A9r=C3=B4me de Bretagne wrote:
> >>> Add SAM client device nodes for the Surface Pro 9 5G, with the usual
> >>> battery/AC and HID nodes for keyboard and touchpad support.
> >>>
> >>> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.=
com>
> >>> ---
> >>>   .../surface/surface_aggregator_registry.c       | 17 ++++++++++++++=
+++
> >>>   1 file changed, 17 insertions(+)
> >>>
> >>> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b=
/drivers/platform/surface/surface_aggregator_registry.c
> >>> index 25c8aa2131d6..8b34d7e465c2 100644
> >>> --- a/drivers/platform/surface/surface_aggregator_registry.c
> >>> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> >>> @@ -390,6 +390,21 @@ static const struct software_node *ssam_node_gro=
up_sp9[] =3D {
> >>>       NULL,
> >>>   };
> >>>
> >>> +/* Devices for Surface Pro 9 5G. */
> >>
> >> Would be nice if you could change the comment on the SP9 node group to
> >> "Surface Pro 9 (Intel/x86)" and the comment here to "Surface Pro 9 5G
> >> (ARM/QCOM)" or something along those lines to make things a bit more
> >> clear.
> >>
> >>> +static const struct software_node *ssam_node_group_sp9_5G[] =3D {
> >>
> >> (This is really just me being a bit obsessive:) It would be nice to ha=
ve
> >> all-lowercase variable names (regarding the 5G).
> >
> > :)
> >
> >>> +     &ssam_node_root,
> >>> +     &ssam_node_hub_kip,
> >>> +     &ssam_node_bat_ac,
> >>> +     &ssam_node_bat_main,
> >>> +     &ssam_node_tmp_sensors,
> >>> +     &ssam_node_hid_kip_keyboard,
> >>> +     &ssam_node_hid_kip_penstash,
> >>> +     &ssam_node_hid_kip_touchpad,
> >>> +     &ssam_node_hid_kip_fwupd,
> >>> +     &ssam_node_hid_sam_sensors,
> >>> +     &ssam_node_kip_tablet_switch,
> >>> +     NULL,
> >>> +};
> >>>
> >>>   /* -- SSAM platform/meta-hub driver. ------------------------------=
---------- */
> >>>
> >>> @@ -462,6 +477,8 @@ static const struct acpi_device_id ssam_platform_=
hub_acpi_match[] =3D {
> >>>   MODULE_DEVICE_TABLE(acpi, ssam_platform_hub_acpi_match);
> >>>
> >>>   static const struct of_device_id ssam_platform_hub_of_match[] __may=
be_unused =3D {
> >>> +     /* Surface Pro 9 5G */
> >>> +     { .compatible =3D "microsoft,arcata", (void *)ssam_node_group_s=
p9_5G },
> >>>       /* Surface Laptop 7 */
> >>>       { .compatible =3D "microsoft,romulus13", (void *)ssam_node_grou=
p_sl7 },
> >>>       { .compatible =3D "microsoft,romulus15", (void *)ssam_node_grou=
p_sl7 },
> >>
> >> Thanks!
> >>
> >> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
> >
> > Thanks for your review and all the work about SSAM for Surface owners!
>
> FWIW I agree with Maximilian's remarks and I would really like to
> see these applied to clearly differentiate the x86 and ARM versions.

I stuck to the official names but they can be confusing as-is.

> Normally I would pick up a patch like this which just adds hw-ids as
> a fix for 6.12-rc# and squash in the suggested changes.
>
> But looking at the test of the series this is more 6.13 material
> since the rest is landing in 6.13, right ?

The rest is in arm64-for-6.13 and drivers-for-6.13 in Bjorn's tree indeed.

> Patches for linux-next / 6.13 are managed by Ilpo this cycle.
>
> So I'll leave it up to Ilpo if he will squash in the suggested changes
> or if he wants a new version (of just this patch, no need for a v3
> of the already applied patches).
>
> Regards,
>
> Hans

Sure, let's see what Ilpo prefers.

Regards,
J=C3=A9r=C3=B4me

