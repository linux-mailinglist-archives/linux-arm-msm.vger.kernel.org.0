Return-Path: <linux-arm-msm+bounces-101583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECH1AU3qzmnXrwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 00:14:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6782A38EA9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 00:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BD803013D75
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 22:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FB6378833;
	Thu,  2 Apr 2026 22:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Pzc7FSlG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9841F3A383C
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 22:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775168053; cv=none; b=ceSLdNA4y6r4UgLULn07whfTlUBdsjCob4LZnYfszW+Wahu3ERM/SWwnJuLdFgVJr7WwvMX0sGN9IrheC0Yn6VkD6/lZx4Q0TDlMi0hK0DVrwH3TiNfy54v4q27xshBbP+dyQvplGBAuLyikFQdITmk4mTMqs4h8vkBRNpEtbYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775168053; c=relaxed/simple;
	bh=fB8Hj7kJM5mSf18WSQyY6XbK44fgKlgfzeYX1184pYs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UXME2D+A+9KYa0ANkawPnXPME0hWSfYa8leeTf4GVHAC5+uEnEyd+095ikGWZf+cQbeQhtY35DSPkxMCjRqb6OyHKst1V8W/cO4ciMy6M36S3eAjmzDDF9ev9EqaOum5HvjuXUW2tbdbRAcvqBLcxJ+1oBHJxCfYpuDfpEOviZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Pzc7FSlG; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775168049; x=1775427249;
	bh=jCVxWp1Wa9DZrYLVZygaJiD6PPNzR/XYIA5bc1ilxoM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Pzc7FSlGncSn9+Dho8TL2mFejNm7yEwhSU4bclcihtXJ2Gx93GiFeFzBaSK14l873
	 6KtRMy0nq3+1+Yjmo7JxqUYDkJ+8ioPozIP2Hev2evIW6GTtToDvL10iXrsF8bUPh7
	 eRqHP00lcNvOmQryJy/rNNV57xa9iGFaeHL+QWSf5ecn/hIgzhrC7zZ8mpJ6NFy4wN
	 YpRKLNCx8GU60GSG4Cok55wGjAys+fuUqtu7q52pznSO34jDea7xsFqe4s4cXWjbia
	 ohSGhfFMlHdWBpLMU28p4SGGxueb2fJbcaK8AnyiPRVZ4Y4QDifU7GFJTvTeSHfDdv
	 eWpRgKqi7/eVg==
Date: Thu, 02 Apr 2026 22:14:03 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] drm/msm/adreno: add Adreno 810 GPU support
Message-ID: <hvcBm15eFRX0ZonD34zzneuD50ceOzKGo1pE8LkQrQL1qEb4t0pEA4ankxEViVr7lwghJeGOoYp2ub8Ti2idrIzMfBXHBqnXejwukigxz9s=@pm.me>
In-Reply-To: <6da36e75-effb-4e3e-a2f9-c0f3ebdbcc21@oss.qualcomm.com>
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me> <20260331-adreno-810-v1-5-725801dbb12b@pm.me> <6da36e75-effb-4e3e-a2f9-c0f3ebdbcc21@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 3bbaf83d1f497f4183e13864bd345040f061a6ef
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
	TAGGED_FROM(0.00)[bounces-101583-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:dkim,pm.me:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 6782A38EA9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wednesday, April 1st, 2026 at 6:15 AM, Konrad Dybcio <konrad.dybcio@oss.=
qualcomm.com> wrote:

>=20
> I may be on an older tag or something, but:
>=20
> $ diff /tmp/downstream.txt /tmp/upstream.txt
> 24a25
> > { GEN7_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
> 27,28c28,29
> < { GEN8_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
> < { GEN8_UCHE_MODE_CNTL, 0x00020000, BIT(PIPE_NONE) },
> ---
> > { GEN8_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
> > { GEN8_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
> 31,32c32
> < /* Disable write slow pointer in data phase queue */
> < { GEN8_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },
> ---
> > { GEN8_UCHE_CACHE_WAYS, 0x00080000, BIT(PIPE_NONE) },
>=20
>=20
> > +};
> > +
> > +static const u32 a810_protect_regs[] =3D {
>=20
> $ diff /tmp/downstream.txt /tmp/upstream.txt
>=20
> < A6XX_PROTECT_NORDWR(0x0ae00, 0x0),
> < A6XX_PROTECT_NORDWR(0x0ae02, 0x4),
> ---
> > A6XX_PROTECT_NORDWR(0x0ae00, 0x6),
>=20
> -> the difference is that
>=20
> SP_DBG_ECO_CNTL and SP_ADDR_MODE_CNTL are not protected
>=20
> that might have been a part of the ^ difference

Going back for v2 and making sure this is 1:1 to GRAPHICS.LA.14.0.r5-03100-=
lanai.0, I
think I was going back and forth between my own downstream from the OEM,
GRAPHICS.LA.14.0.r5 and GRAPHICS.LA.15.0.r1.

GRAPHICS.LA.15.0.r1 has gen8_3_0 support, but I'm not sure if there are any
devices that actually ship with it on that branch. Seemed to be fairly out
of sync from LA.14.

>=20
> Also it may be that the better name for this table is a830_protect_regs[]

Can you elaborate on this? The only names I know this GPU by are "a810" and
"gen8_3_0".

>=20
>=20
> The other tables, I'm lost. Akhil, please take a look.
>=20
>=20
> Konrad

Thanks,
Alex
>=20
> 

