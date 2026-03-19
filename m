Return-Path: <linux-arm-msm+bounces-98772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ACaJjULvGkArgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:41:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FF52CD0CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA732310099E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AA93D413F;
	Thu, 19 Mar 2026 14:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="iLHMnU5V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB473D16EC
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 14:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931266; cv=none; b=Cn6FwHBUqlSDOYARWF0yAJ+q2qI3MLZmpXYv2VsVLh6g813eidc8OJCLXspZJBBMSR80YykeBc+rJf2q4PQEmV634RopKJBU5nWirYNx4RrYbSrGIU865W72GwHF594ZSaXqglqNizVaRh0wNo9BMICqEBXkSKCfLmQ4VkrKZow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931266; c=relaxed/simple;
	bh=pMRqysFxwahQPN1ndIC750Si6tdhw6BU9OY20FS2f48=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X2nQbIq7nmd7k1LpgF+rep2gvu+CPbIYVAGf8tUvyO3iMw+1QLk41VtudPG48X1x/OqXC7EJvKXUzxryounmeRWk014kG7klzaINwV8iiS550p3rb9fGQFmmv/r7QaXUaX0kclGbQ2WUNq3G6EvO1KnTxrtZgAX9P6c+XAPPVgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=iLHMnU5V; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773931254; x=1774190454;
	bh=2ry14m7uPfswpHvhZSiuWQzbmbQ/crOXJDMqiWlZEZg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iLHMnU5V0lCGv1dm4w9hsRcN0+zxQwdHU3QFBGjxAYwLsKbpRUd8YQcytc85zgwRJ
	 L+gHYyDuDFYXml8X64fwWsZmvZKaS+lNjLYyAij8Xumg/9/QbFVSKqG63ub9dCMXWq
	 Pr5pxfEY1iQhZ5rJTJejvniXjk2tkw1dSkb4OEPxtL+kb3PbrMeO1PFifOswtNmcxS
	 XeJKlOyl/7sHKLVg7sSid5tqFkv88A+cTy/TIUHn/skbxRR53mwoTOCclCz1I/iXb6
	 5vSh3TOTUsTNu7eh/WQ16ZZvn1p3BNHmgJuAdWEB4iOIAG0Hbj2uivAVUgUilT657L
	 ycLOHvKHzEIZA==
Date: Thu, 19 Mar 2026 14:40:48 +0000
To: Neil Armstrong <neil.armstrong@linaro.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width calculation
Message-ID: <3gLK4s97giqqXagfHKhfiIHbfbl2snwfOj9dcTNGPUYi10w9-1EdATqzz1LPCVTpz4bLFYOm8u_Fl8PfC7t5yabows4UCzRKVwjraEWW6hc=@pm.me>
In-Reply-To: <1360a31d-669e-48df-a1be-f0af4a253cd7@linaro.org>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me> <20260319-dsi-rgb101010-support-v3-4-85b99df2d090@pm.me> <1360a31d-669e-48df-a1be-f0af4a253cd7@linaro.org>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 6a9b462a04febf44f134204d15bf2f50d0035867
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98772-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.899];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F0FF52CD0CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thursday, March 19th, 2026 at 10:13 AM, Neil Armstrong <neil.armstrong@l=
inaro.org> wrote:

> Hi,
>=20
> On 3/19/26 12:58, Alexander Koskovich wrote:
> > Using bits_per_component * 3 as the divisor for the compressed INTF
> > timing width produces constant FIFO errors for the BOE BF068MWM-TD0
> > panel due to bits_per_component being 10 which results in a divisor
> > of 30 instead of 24.
> >
> > Regardless of the compression ratio and pixel depth, 24 bits of
> > compressed data are transferred per pclk, so the divisor should
> > always be 24.
>=20
> Not true with widebus, specify why 24 and because DSI widebus is not impl=
emented yet.
>=20
> >
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 ++++-----
> >   1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/dri=
vers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > index 0ba777bda253..5419ef0be137 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > @@ -122,19 +122,18 @@ static void drm_mode_to_intf_timing_params(
> >   =09}
> >
> >   =09/*
> > -=09 * for DSI, if compression is enabled, then divide the horizonal ac=
tive
> > -=09 * timing parameters by compression ratio. bits of 3 components(R/G=
/B)
> > -=09 * is compressed into bits of 1 pixel.
> > +=09 * For DSI, if DSC is enabled, 24 bits of compressed data are
> > +=09 * transferred per pclk regardless of the source pixel depth.
> >   =09 */
> >   =09if (phys_enc->hw_intf->cap->type !=3D INTF_DP && timing->compressi=
on_en) {
> >   =09=09struct drm_dsc_config *dsc =3D
> >   =09=09       dpu_encoder_get_dsc_config(phys_enc->parent);
> > +
> Drop this change
>=20
> >   =09=09/*
> >   =09=09 * TODO: replace drm_dsc_get_bpp_int with logic to handle
> >   =09=09 * fractional part if there is fraction
> >   =09=09 */
> > -=09=09timing->width =3D timing->width * drm_dsc_get_bpp_int(dsc) /
> > -=09=09=09=09(dsc->bits_per_component * 3);
> > +=09=09timing->width =3D timing->width * drm_dsc_get_bpp_int(dsc) / 24;
>=20
> It would be helpful to somehow show that 24 is 8 * 3, 8 being the byte wi=
dth and 3 the compression ratio.

Can you clarify what the 3 represents? My panel should have a 3.75:1 compre=
ssion
ratio (30/8) so the final divisor of 24 would be wrong for my panel if its =
the
compression ratio?

>=20
> >   =09=09timing->xres =3D timing->width;
> >   =09}
> >   }
> >
>=20
>=20
>=20

Thanks,
Alex

