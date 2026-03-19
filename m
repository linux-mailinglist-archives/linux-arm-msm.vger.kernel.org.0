Return-Path: <linux-arm-msm+bounces-98814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAZQI65IvGknwgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 20:04:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A490E2D1793
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 20:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BA0693001A51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D08364953;
	Thu, 19 Mar 2026 19:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="TKwe6vIc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2452338906;
	Thu, 19 Mar 2026 19:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773947048; cv=none; b=Kf3I8RVVo3br8SA//EFM1y4ewQlSs3dzLKpYvW2cO5h0hk5wxDU4Lw3VNN6dgdfd3p0pKwKrombLw6JPHVTwI6UftjSLeOrKaEn6ta5Fz5OSRG1d0kYXiNfzmlt0MFLwb/P2j8+Q7ozebqQjK8cPgzfvjWtAP+lv962N6LrsQMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773947048; c=relaxed/simple;
	bh=um0dAWeLES+rkGBaN9F/UxTmM5+C0ov2YAcJTd2NQ8M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YyhCRA4I5lmcR/EtDQHCfpiVFDf7yoaxzrR+KkMT3GXbaCAIWkpoC6nC0YfkB0FPsXD2vJsi82TPt0V0YgLa6NcL/ATr9qPG32gU5jR8/pwNPuHKUJGTZGwbJ+ACY3+XysMjGpq0DoHEBA24UaS6DbBl30wpD6Ozw7e+9BByq2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=TKwe6vIc; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773947039; x=1774206239;
	bh=Z7rz17oXwJA2+Xw+Tg0a6ScefxcvHHGVlmuQ1UcC2rY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TKwe6vIcpm0QAZdnu6XpX/mNxIfG2Nb3MlLrh0zym6eQaugGYQ0S74xqtpspCdn5h
	 Ekwpb66+I5jIrZyL9lZ8Sb5nDHtuhscZpf86XJuNdUZDsKKSvNAAhfR8v4Wc0VeF0C
	 lSPHswtiYE2ykUd0IXiLlfjVOeQerYqZoJeXBOqJefvL6l7AmZywwTQyrQB/eCGsSb
	 5RnqJv03u4pIAaPbFJ9n8RsujS7QHyvaPiW24SbOKIAEUe7a0+xuUC98v07Xoj9hT2
	 oDWpM8FpY1MBxLswC7QC2zLGgPELbzxy/Ig7cVBw3E58FJWrOKjxKj+CR7poQ+8LMB
	 LdJiJnWsRcUtQ==
Date: Thu, 19 Mar 2026 19:03:52 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 3/4] drm/msm/dsi: Add support for RGB101010 pixel format
Message-ID: <ZFutyWx-D2vGcrFK6-0ybqW1lyufJy0qIr2g8QtwbUArTYq5Pus7dcqie5lJjYgFgyAmB_othdAem8nuN4kcJGF8dINyvDQz9BhUKkOo__A=@pm.me>
In-Reply-To: <gompbnsbhmfx3ze2nq2h47t5aohsm6oxuetaymjpn6kajmhu65@r4qnbfshwmgh>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me> <20260319-dsi-rgb101010-support-v3-3-85b99df2d090@pm.me> <gompbnsbhmfx3ze2nq2h47t5aohsm6oxuetaymjpn6kajmhu65@r4qnbfshwmgh>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 585559cb4244f9036800069bc683aa8c6646446f
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98814-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.945];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,pm.me:dkim,pm.me:email,pm.me:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A490E2D1793
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thursday, March 19th, 2026 at 3:00 PM, Dmitry Baryshkov <dmitry.baryshko=
v@oss.qualcomm.com> wrote:

> On Thu, Mar 19, 2026 at 11:57:56AM +0000, Alexander Koskovich wrote:
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
> >  drivers/gpu/drm/msm/dsi/dsi_host.c            | 10 ++++++++++
> >  drivers/gpu/drm/msm/registers/display/dsi.xml |  5 ++++-
> >  2 files changed, 14 insertions(+), 1 deletion(-)
>=20
> For the patch itself:
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>=20
> Note, you've dropped the patch adding RGB101010 to
> include/drm/drm_mipi_dsi.h without declaring a dependency on any
> external patchset, so this can't be merged.

Oops, guess I skipped over that while rebasing. Will address in v4.

>=20
> Also, there was a report from LKP that you need to fix the meson driver
> while adding new MIPI define (we should not be introducing known
> warnings to the kernel).

Will address that

>=20
> --
> With best wishes
> Dmitry
>=20
>=20

Thanks,
Alex

