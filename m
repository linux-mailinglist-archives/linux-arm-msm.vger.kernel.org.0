Return-Path: <linux-arm-msm+bounces-35374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D76649A9DA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98897283031
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6545A195809;
	Tue, 22 Oct 2024 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtA4ToSH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90284191F65;
	Tue, 22 Oct 2024 08:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729587419; cv=none; b=X/oOTK6pojsQbNNYK3XfzpcilMs0VQBQxGbhIMugYoGc3QXOs8dTQ7bxVIsurZuPrZDSfRnsboK3QvGuLl2bXklZ87zzP9cjqR3d9cE0vQFeV+GKwMPSRbiOBfJyHgFeCL+OLyM2t2wGeUThCvYBw77aBOwTKIs4PA0ZUQB7Ld4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729587419; c=relaxed/simple;
	bh=PBS6patg8orzXZGMN84nPmy0cveg0QjRKx5CAIpZy8k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mnK/BUXlMqrh7n/BRRF/d8mXy3p72tbSVNZ0OnRgedZ6P6YaScpXhxHgwAUTpWFTSkSoVvCqWb4eGe+qpfcIjr/UCmr+k61RHtEzGiJIXyDURebAIbNdtQ+0JHODkoTKVLX4JzObzkDGYVnfe+KK7tnTjeIXJTw92p6gkE3gAkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtA4ToSH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729587418; x=1761123418;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PBS6patg8orzXZGMN84nPmy0cveg0QjRKx5CAIpZy8k=;
  b=KtA4ToSHfHncqAVLHnG7C5l7EUk39Oiwb7mTTABRlEl/OaG4r8AG+nB7
   R/UPB2uu42uHwqDpYHbxlaEM5moOj9/ByJY1giQ7PnBmNkA45/gXq1r0C
   8cC+H09Muq+Dy/esGLDMcZl0u4PZNYb9w4DbY1hDZaglwVBLbZR8Myx8q
   I+ajGF65VwC+tbJtNMvKWRKYbxyQhWaJqODzE0aN5ZdLrdQBEUF4QaaHy
   PQuTVNPYwwo2lC9CBXJ4uZASNNxtF5bgQfIz0OByoyYml45+rk1J+S2ml
   l42aWr1PvfqGgzZPmnivF5b7Rw808/rq2ycxn5lS6ClTwK7g/pDM4Ub7A
   Q==;
X-CSE-ConnectionGUID: EeqNBb3yS3uYQ/ldFc9PXQ==
X-CSE-MsgGUID: 1/ydBne2Qb2aYKrhrBaFTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="28564714"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="28564714"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 01:56:57 -0700
X-CSE-ConnectionGUID: 0MU8dnb7QXGk+MiEJrRF7A==
X-CSE-MsgGUID: KJGFvjYHSeq84FJ84h6e9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="110616118"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.146])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 01:56:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 22 Oct 2024 11:56:49 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: =?ISO-8859-15?Q?J=E9r=F4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
    Maximilian Luz <luzmaximilian@gmail.com>, 
    Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
    linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 3/5] platform/surface: aggregator_registry: Add Surface
 Pro 9 5G
In-Reply-To: <8370d062-b3d2-46f5-9e7b-8e16edde8480@redhat.com>
Message-ID: <555f8a3a-ae5e-57e7-f176-96c52e1a5d45@linux.intel.com>
References: <20240908223505.21011-1-jerome.debretagne@gmail.com> <20240908223505.21011-4-jerome.debretagne@gmail.com> <f9cbd1c3-eb05-4262-bdc6-6d37e83179e5@gmail.com> <CA+kEDGEdd_s+DGKsVNY6Jy870B72eHuaj2EgEnwP8J46ZGbxpQ@mail.gmail.com>
 <8370d062-b3d2-46f5-9e7b-8e16edde8480@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1015361985-1729587409=:969"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1015361985-1729587409=:969
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 7 Oct 2024, Hans de Goede wrote:

> Hi J=C3=A9r=C3=B4me,
>=20
> On 7-Oct-24 8:44 PM, J=C3=A9r=C3=B4me de Bretagne wrote:
> > Hi,
> >=20
> > I'm replying with Hans and Ilpo, who I initially forgot for this
> > patch, sorry about that.
>=20
> No worries thank you for forwarding Maximilian's review.
>=20
> > Le mar. 10 sept. 2024 =C3=A0 23:29, Maximilian Luz
> > <luzmaximilian@gmail.com> a =C3=A9crit :
> >>
> >> Looks good. Two very small nit-picks below, if this goes for a v3:
> >=20
> > Atm I'm not planning for a v3 as Bjorn has applied the other v2
> > patches earlier today.
> > Feel free to include the 2 small suggestions when applying this patch m=
aybe?
> >=20
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
> >=20
> > :)
> >=20
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
> >=20
> > Thanks for your review and all the work about SSAM for Surface owners!
>=20
> FWIW I agree with Maximilian's remarks and I would really like to
> see these applied to clearly differentiate the x86 and ARM versions.
>=20
> Normally I would pick up a patch like this which just adds hw-ids as
> a fix for 6.12-rc# and squash in the suggested changes.
>=20
> But looking at the test of the series this is more 6.13 material
> since the rest is landing in 6.13, right ?
>=20
> Patches for linux-next / 6.13 are managed by Ilpo this cycle.
>=20
> So I'll leave it up to Ilpo if he will squash in the suggested changes
> or if he wants a new version (of just this patch, no need for a v3
> of the already applied patches).

Hi all,

I've now applied patch 3 to review-ilpo branch in pdx86 repo.

I'd appreciate if somebody confirms I got those comment edits right.

--=20
 i.

--8323328-1015361985-1729587409=:969--

