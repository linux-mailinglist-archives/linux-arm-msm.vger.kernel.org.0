Return-Path: <linux-arm-msm+bounces-98692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePm4Bz7Bu2n1ngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:26:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D34AD2C89D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0934A3033BD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF4B3B38BC;
	Thu, 19 Mar 2026 09:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="f6g4aQyj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A313B52E4
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912319; cv=none; b=t8584+DjCt79Va5MSzmk1/ai5ncSz2w+I0CyTmD7zjsJYfkuU8bLghNCp4R6D6vXP92r5GDl4aue5yCQRePYBNvILmgh8VUgoorcbigWFMZgNtG5NZqtVbKyWwUxKy5bTVsFsfdObXPCwwyHU/vpS8rMUw+LUHrflhmFQWzLPmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912319; c=relaxed/simple;
	bh=TzMhTLv3JXJQwVWtYSV42Qwo1LYdvbXGB4drPcrZNxU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e8l0JI/RKKmaOQrZ82KlJNEQtZfRK15EQFe/SBdKmU2FmPvOb/j72HJdDe/luZGb40iz8GDj1GoiwC7bCOmB5gpqjX6khC6+0dE/7rDq/7qJBpGGa8XhfAeaHWKl+E6TwUJs30J2qdqUs9iESAUbMnAIWeJniTE1uctak3l/uo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=f6g4aQyj; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773912314; x=1774171514;
	bh=1WJ0SXstxMz3JRJWYQZyv5yCYZe13YrJMFbVRqUBtuI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=f6g4aQyjsbyon0TVKTK6hRFU7/YzyFKxyRRqyCChYFJ9XeZixlXm8eSn4eLetRLaZ
	 wCirfkFmHsxz+lVUZw8jneWIh9bQNkMLHtaIn3U+qZASEENXy54kd+wiqnvBsAvWdG
	 EI1sh4H7fX/fskcyjbx1Xo1gdvmyNl+QhGTY5DE7rMlySVzYJAwo+VZfBkPk7mGj+M
	 AMO6HlYERLDcDazD4owO0fjojX099rxSiKwshX0qlD6WWJTZWjbUwRZLldAoU+gh8b
	 +36FahD1zK677U0A1mhtE5tax0ucggNcZ9q6Q92+KoVhBstuKsuFrgfmcphBiMk7W1
	 fedcTGbcBisyQ==
Date: Thu, 19 Mar 2026 09:25:08 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] drm/msm/dsi: Add support for RGB101010 pixel format
Message-ID: <pGJabrbuMx_tCkcjrvUESbgwgvwGXDQYJ3czHFEWSDDVv8ugukIWOchF7uV8D1Ns1WI4O9OKDBeKdOW4I83uD7ZfwX58k0EpxHwVVgcnSIU=@pm.me>
In-Reply-To: <5b79ccbd-5c75-454b-8b3f-812a6c59157b@oss.qualcomm.com>
References: <20260318-dsi-rgb101010-support-v2-0-698b7612eaeb@pm.me> <20260318-dsi-rgb101010-support-v2-2-698b7612eaeb@pm.me> <5b79ccbd-5c75-454b-8b3f-812a6c59157b@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: cf393307f1ff1ef280b98573057ef3190670fbf1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98692-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D34AD2C89D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thursday, March 19th, 2026 at 5:10 AM, Konrad Dybcio <konrad.dybcio@oss.=
qualcomm.com> wrote:

> On 3/19/26 5:00 AM, Alexander Koskovich wrote:
> > Add video and command mode destination format mappings for RGB101010,
> > and extend the VID_CFG0 DST_FORMAT bitfield to 3 bits to accommodate
> > the new format value.
> >
> > Make sure this is guarded behind MSM_DSI_6G_VER >=3D V2.1.0 as anything
> > older does not support this.
> >
> > Required for 10 bit panels such as the BOE BF068MWM-TD0.
> >
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 8 ++++++++
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.h             | 1 +
> >  drivers/gpu/drm/msm/dsi/dsi_host.c            | 9 +++++++++
> >  drivers/gpu/drm/msm/registers/display/dsi.xml | 5 ++++-
> >  4 files changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/ds=
i/dsi_cfg.c
> > index bd3c51c350e7..6a7ea2183a3b 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > @@ -133,6 +133,7 @@ static const struct msm_dsi_config msm8998_dsi_cfg =
=3D {
> >  =09.io_start =3D {
> >  =09=09{ 0xc994000, 0xc996000 },
> >  =09},
> > +=09.has_rgb30 =3D true,
>=20
> I wrote a patch to determine this at runtime, and only after I was done, =
I
> noticed that we can already achieve this:
>=20
> bool msm_dsi_host_is_wide_bus_enabled(struct mipi_dsi_host *host)
> {
> =09struct msm_dsi_host *msm_host =3D to_msm_dsi_host(host);
>=20
> =09return msm_host->dsc &&
> =09=09(msm_host->cfg_hnd->major =3D=3D MSM_DSI_VER_MAJOR_6G &&
> =09=09 msm_host->cfg_hnd->minor >=3D MSM_DSI_6G_VER_MINOR_V2_5_0);
> }
>=20
> let's perhaps extract this to a msm_dsi_host_version_is_gt(u32 major, u32=
 minor)
> or similar

That's what I was looking into initially, but V2_2_0 (0x20000000) is numeri=
cally less than V2_1_0 (0x20010000) so didn't think I could do that.

Do you know if msm8998 is correct? Downstream says it is 2.0 not 2.2.=20

>=20
> and your assumption about >=3Dv2.1 is corroborated by a doc I have
>=20
> Konrad
>=20

Thanks,
Alex

