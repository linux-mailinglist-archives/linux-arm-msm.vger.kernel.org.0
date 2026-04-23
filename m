Return-Path: <linux-arm-msm+bounces-104375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDSfNcSA6mm80AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 22:27:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 379D7457455
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 22:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81162300B605
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 20:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C56333439F;
	Thu, 23 Apr 2026 20:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="ULOazdOO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A3A32ED39
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 20:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776976064; cv=none; b=aRyciCxJzDg9Rfwa1IyUrEH4RfaaUMeJ2D3d0+NNKECUWNBa9QvKH2h79APGk/x+pO+iVgDGNhsdpXFb4xd1Xxm59MCj+dtqiCkCm4oAKm5BEpIfU11ALyStq3Umi7hbcxxyZq49NxdK2bd2614HgDfNJbqQT69IDYJtbTEkahc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776976064; c=relaxed/simple;
	bh=JiO+nL3nWpHhg6uFWwwLfYy3x42UnvI90KTZdlD8a/0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S05kW9Xc3SbboTrHBW6fOcUSfQ3k5NrB89NCWSNA6K+lf8ZeIURXNuFdARGsBesg0435MH+p64aj+Un4Ng+LFzpZ2XlJnuKdi2201/EVXJAHZHLKi0N/lLY34capVvM2YRFZqu9I7QhcceVr3PWc58A9l6qXuSuGjzL7jPlwGAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=ULOazdOO; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776976054; x=1777235254;
	bh=jC3Jj+pe7e8TjZGPc3jpIn3auWo68Qc5RELwM6CC6mo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ULOazdOOWnHQZXmGMx2nGb1WGe6LJDbwJm3SCNhKpDAAWMeouv595xSL+RUdlnvbh
	 vmmcUUxDU+Z+1PCrFdlOIB0/UPGAca1rSluiUU46rRnFt567Ferw+y7BAu4ykHTin/
	 8p9KZ3mFSRRm3FABo8+OPQ5bXT8xeuRccC/j1UmA2jFx1yBYogUhw1yx2U/dvzt9OC
	 W3XSa90ZEBPDWA3/+oOgOIu6RqzGkP6aRd1ctoDzVIgZ7mV0oNdOF4UIxGyfibl6II
	 O7fkH79w+l3EGLycdB+aucIOv9CJ/lu/UUhdCKzNsEoPrn6EcoxW7GMaTL03zddcCP
	 SNgxpkIXHs1Vw==
Date: Thu, 23 Apr 2026 20:27:27 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 6/7] drm/msm/adreno: add Adreno 810 GPU support
Message-ID: <RxsrYj7kE1fS38uw9Frlum-uhzNhpKl4jkrZhaTmBCLLg5ZXTIG-2qdD8HTAyeyHfGMxjV8BAtwwsJJx28J6XApr3P2cFFmNMux3uKTUKgo=@pm.me>
In-Reply-To: <eccce3f2-01a8-4454-87d2-3a599a15b34f@oss.qualcomm.com>
References: <20260416-adreno-810-v4-0-61676e073f8a@pm.me> <20260416-adreno-810-v4-6-61676e073f8a@pm.me> <eccce3f2-01a8-4454-87d2-3a599a15b34f@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: b068081630eee9f29900c9312ab14b1b0fe8d6de
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104375-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,fairphone.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:dkim,pm.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 379D7457455
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wednesday, April 22nd, 2026 at 9:04 AM, Konrad Dybcio <konrad.dybcio@oss=
.qualcomm.com> wrote:

>=20
>=20
> On 16-Apr-26 13:05, Alexander Koskovich wrote:
> > Add catalog entry and register configuration for the Adreno 810
> > found in Qualcomm SM7635 (Milos) based devices.
> >
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 296 ++++++++++++++++++++++=
++++++++
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 +
> >  2 files changed, 301 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_catalog.c
> > index 550ff3a9b82e..1190804632d6 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > @@ -1799,6 +1799,259 @@ static const struct adreno_reglist_pipe x285_dy=
n_pwrup_reglist_regs[] =3D {
> >  };
> >  DECLARE_ADRENO_REGLIST_PIPE_LIST(x285_dyn_pwrup_reglist);
> >
> > +static const struct adreno_reglist_pipe a810_nonctxt_regs[] =3D {
>=20
> To align with the latest kgsl which includes all the latest
> recommendations, remove:
>=20
> { REG_A8XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
>=20
> { REG_A8XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
> { REG_A8XX_TPL1_DBG_ECO_CNTL1, 0x00000724, BIT(PIPE_NONE) },
>=20
> { REG_A8XX_UCHE_CACHE_WAYS, 0x00080000, BIT(PIPE_NONE) },
>=20
> { REG_A8XX_VSC_BIN_SIZE, 0x00010001, BIT(PIPE_NONE) },
>=20
> and add:
>=20
> (below RB_CCU_CNTL)
> { REG_A8XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
>=20
> (swap in place)
> { REG_A8XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
> { REG_A8XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
>=20
> (below UCHE_CCHE_CACHE_WAYS)
> { REG_A8XX_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },
>=20
> (below RB_GC_GMEM_PROTECT)
> { REG_A8XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },

Just wanted to clarify if this was a typo, since you also asked for RB_CCU_=
DBG_ECO_CNTL below RB_CCU_CNTL as well.

>=20
> (The order doesn't actually matter but it'll be easier to diff)
>=20
> Konrad
>=20

Thanks,
Alex

