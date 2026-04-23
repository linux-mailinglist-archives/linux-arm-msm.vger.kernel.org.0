Return-Path: <linux-arm-msm+bounces-104376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGMHG+GC6mn80AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 22:36:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FA04574CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 22:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 487C330180A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 20:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8232033B6D0;
	Thu, 23 Apr 2026 20:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gNcE76g7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A1A310645
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 20:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776976468; cv=none; b=AwZLoTzaKFLRxlSRbjBHgzLz427/1ZqgINCqHpseF4axKYYRozydiPwI0/D9gW2VD9Mzpqfge2xm8RF5vxBWHro5PE3A0JQlwpGMdz/JUwiT5ync6hMHdhqRDM5vRpNPUXNk79rYtGTTNTYxrjSDMQl9P9zWKxWyGCs8TsuUYg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776976468; c=relaxed/simple;
	bh=tGtGh8LHhCpfw4P5NPtnBbIVXU6pxxNKs0P+PDjh1ME=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aX2QxaicD7UWuw96eW/44e8WYVoczvTNdiTmmVyou70scKzOgiG5LCqQihY+ILOh/pZuw6VlNvsDJ3JYiOJjp1vqGTUcYCuE82gn4ULznGQiT+8cjXX4GXUBQljU0FJcdKiebCNlPQSnUWCmzcl8T1hOL795ApxIre5mZhNoLb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gNcE76g7; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776976463; x=1777235663;
	bh=G/daCJIfnhGdXQISec5Nc7m2347M1zLsULfaxHx3oG8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gNcE76g7YofdTje7Aer6qNs/kz0XY0pThZiRLQj9QDZU3DpUB8Imy/yX1WAWrCc/l
	 i31sGjdYaMYJdaqad7az7w7NApoOyuP32NSP5JmgvxDBhwgxoe4yJvoh4rdtUJ2R1q
	 vsuNxEM4/OOK3nm3ZxSmN/9H0maRocDqFM+s9JN21oGBIITlDk7HX+CXsWzusCpo7e
	 TtSo8ov1acLag2y+OtRfPNUQ5H4fmZ1wlbJ+Jbblibhz4PS3Jkchyy4iXxWZshCeHT
	 3vn5wscno1YvVAcpjV7h9YYG8QpM06TfIYlRbW2mk3GdKQea8BqBtPn7VmhyC3+hho
	 8YyzH9E3hBqoQ==
Date: Thu, 23 Apr 2026 20:34:17 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 6/7] drm/msm/adreno: add Adreno 810 GPU support
Message-ID: <oka0Q911ixJLZzAbfWBx54dOmxbQAre36QqHUX4iDZoH3TE5jD-IqTAHspti6B8kfpLQ-OTnuWjFdXtsqJM-CUC8G9R3x_9vFI--LnpppiA=@pm.me>
In-Reply-To: <23fbb36e-56b4-4ecf-94e9-4038c6311b31@oss.qualcomm.com>
References: <20260416-adreno-810-v4-0-61676e073f8a@pm.me> <20260416-adreno-810-v4-6-61676e073f8a@pm.me> <23fbb36e-56b4-4ecf-94e9-4038c6311b31@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 65a8b8efc4ce8f33e838f483cd77361e1348e288
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
	TAGGED_FROM(0.00)[bounces-104376-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:dkim,pm.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url,qualcomm.com:email]
X-Rspamd-Queue-Id: B6FA04574CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wednesday, April 22nd, 2026 at 9:04 AM, Konrad Dybcio <konrad.dybcio@oss=
.qualcomm.com> wrote:

> On 4/16/26 1:05 PM, Alexander Koskovich wrote:
> > Add catalog entry and register configuration for the Adreno 810
> > found in Qualcomm SM7635 (Milos) based devices.
> >
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
>=20
> [...]
>=20
> > +static const uint32_t a810_pwrup_reglist_regs[] =3D {
> > +=09REG_A6XX_UCHE_MODE_CNTL,
> > +=09REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
> > +=09REG_A8XX_UCHE_GBIF_GX_CONFIG,
> > +=09REG_A8XX_UCHE_CACHE_WAYS,
> > +=09REG_A8XX_UCHE_CCHE_MODE_CNTL,
> > +=09REG_A8XX_UCHE_CCHE_CACHE_WAYS,
> > +=09REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN,
> > +=09REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN + 1,
> > +=09REG_A8XX_UCHE_CCHE_TRAP_BASE,
> > +=09REG_A8XX_UCHE_CCHE_TRAP_BASE + 1,
> > +=09REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE,
> > +=09REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE + 1,
> > +=09REG_A8XX_UCHE_WRITE_THRU_BASE,
> > +=09REG_A8XX_UCHE_WRITE_THRU_BASE + 1,
> > +=09REG_A8XX_UCHE_TRAP_BASE,
> > +=09REG_A8XX_UCHE_TRAP_BASE + 1,
> > +=09REG_A8XX_UCHE_CLIENT_PF,
> > +=09REG_A8XX_VSC_BIN_SIZE,
>=20
> This REG_A8XX_VSC_BIN_SIZE is removed from all lists for all chips
> in newer kgsl
>=20
> > +=09REG_A8XX_RB_CMP_NC_MODE_CNTL,
> > +=09REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
> > +=09REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
> > +=09REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN + 1,
> > +=09REG_A7XX_SP_READ_SEL,
>=20
> Somewhat similarly,
>=20
> TPL1_NC_MODE_CNTL
> TPL1_DBG_ECO_CNTL
> TPL1_DBG_ECO_CNTL1
>=20
> should be preempt+ifpc for all targets, it seems
>=20
> [...]
>=20
> > +static const u32 a810_ifpc_reglist_regs[] =3D {
> > +=09REG_A8XX_RBBM_NC_MODE_CNTL,
> > +=09REG_A8XX_RBBM_PERFCTR_CNTL,
>=20
> This list matches the expectations, modulo this RBBM_PERFCTR_CNTL

Note on this, added this shortly before submitting this series as requested=
 by Akhil:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40613#note_339530=
8

Though, I've seen some perfctr stuff on list so not sure if this should be
removed soon...

> and the registers I mentioned above that should be moved to the
> first list
>=20
> [...]
> > +static const struct adreno_reglist_pipe a810_dyn_pwrup_reglist_regs[] =
=3D {
> > +=09{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> > +=09{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> > +=09{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) =
},
> > +=09{ REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +=09{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +=09{ REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },
>=20
> + RB_CCU_DBG_ECO_CNTL to BR
>=20
> [...]
>=20
> > +=09=09.speedbins =3D ADRENO_SPEEDBINS(
> > +=09=09=09{ 0,   0 },
> > +=09=09=09{ 242, 1 },
> > +=09=09=09{ 221, 2 },
> > +=09=09),
>=20
> The DTs I have all point to SMEM-based SKU checks. Did you find these
> numbers empirically?

Yes, and I used speedbin instead as upstream doesn't support the SKU checks
downstream does. Utilizing GPU_CC_FREQ_LIMIT_VAL to serve as speedbin
on this platform.

>=20
> Konrad
> 

