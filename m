Return-Path: <linux-arm-msm+bounces-101552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA6XFAR+zmnBnwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 16:32:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DC76238A900
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 16:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC8C730AAAEC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 14:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C9E3AC0FB;
	Thu,  2 Apr 2026 14:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gm8SVwu5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27622E0B58
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 14:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775140137; cv=none; b=Ty8VKt8eD75uJ9qeI8qZE959mLLlpadS+Gii9SByo1Yabb5y68WbuUkghaE3YvBdWaEsIgbOXu+tF1zuYVqQq6laPH7kLw5lVr9wG/qyFPx/AOqRA5OaPnYOWoRhW7L8k3HohcUP4vmw+RjD8ILxMQlYPxBiC+DyD6zAj0kvhQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775140137; c=relaxed/simple;
	bh=aUiDU6NtU4crFe7j/IYe7KoI0Gyp57fBYvaYUZmymHo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T3nuWqf77GZy8F0W4/xtBLdOggC2hKn7+cf6OeA1/vPpbSkrYLf4Hw5lSZOjQg0iAB/2piyxzqwL/+jQXzjsQ8KNb/7RsgUbnW62eHMjyG27GfdGrnn/QLOWsVXtQJn2VTwng61prfxBo3nPi6UaRguo0RZqSebyFXzC4tDfO4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gm8SVwu5; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775140127; x=1775399327;
	bh=61zlP1aorHbsMAHfSZBm3dDR0SYcYTVTWR5dLhiSR7Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gm8SVwu5v9JMT85/BjOj8bg24O4S/6ijwXdJcduK0TvdrxF4BpPACbUjOFhPoghwa
	 SyIHO4TnJVj/yfnBD+ImYFKMrciJ/W4vJJPm0aDAHJAmhHga6qYkJB8rXVIYCLlbKt
	 IsXu7TvPiKFB05y6OOfc0OQqo6hjCERuf2Cj0t14SusruyWzXu3q3sFgpuA1CjC0UN
	 D3rhg85Aho8OGW9KK9NJNK7ZYq6wjTLpKCBYjkTnfsOA74pSR7eYOotPT8qrQBvXhY
	 iN0ymU8lSxqeSNuwr75FGkF5a+pXfDc6glvaPwcrgxY4/F8Nd7UTEsAuEiYB4hxrkv
	 iWBq4HQJLIrRw==
Date: Thu, 02 Apr 2026 14:28:43 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: milos: Add Adreno 810 GPU and GMU nodes
Message-ID: <R7Ih8jyIY_3BU4y0YERxTj8EaSkmFovmHoVqcbBcUfad9nn0UGonyc4othMA9YsIYlHtnkinSVCNdZgqFxa_B-2nTPDT3MlJud5LpE8jfWc=@pm.me>
In-Reply-To: <20260402-military-arrogant-woodpecker-4ab9b5@quoll>
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me> <20260331-adreno-810-v1-6-725801dbb12b@pm.me> <20260402-military-arrogant-woodpecker-4ab9b5@quoll>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 8ca7a17b3f3180d3444524a81e6eb8372a481313
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101552-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DC76238A900
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thursday, April 2nd, 2026 at 4:19 AM, Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:

> On Wed, Apr 01, 2026 at 02:17:44AM +0000, Alexander Koskovich wrote:
> > Add GPU and GMU devicetree nodes for the Adreno 810 GPU found on
> > Qualcomm SM7635 (Milos) based devices.
> >
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> >  arch/arm64/boot/dts/qcom/milos.dtsi | 148 ++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 148 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/=
qcom/milos.dtsi
> > index 621f05820826..a8feb0339804 100644
> > --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> > @@ -7,6 +7,7 @@
> >  #include <dt-bindings/clock/qcom,milos-dispcc.h>
> >  #include <dt-bindings/clock/qcom,milos-gcc.h>
> >  #include <dt-bindings/clock/qcom,milos-gpucc.h>
> > +#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
>=20
> Why? My next from 27th Match does not have Milos in that binding. Was it
> added? It's worth mentioning in commit msg.

They use the same driver and the GX_CLKCTL_GX_GDSC definition would be
identical, so the header can be reused. I'll mention it in the commit
msg for v2.

>=20
> Also, please keep alphabetical sort of the includes, k < m.

Fixed in v2.

>=20
> Best regards,
> Krzysztof
>=20
> 

