Return-Path: <linux-arm-msm+bounces-110971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LE1OKEslIGp9xQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:59:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 60104637CA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:59:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=H6Pc63oZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110971-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110971-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=pm.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CAAE4301D597
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 12:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECD543E9D5;
	Wed,  3 Jun 2026 12:59:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA9046AF27
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 12:59:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491593; cv=none; b=hD+gZqpqwRqN9GGQMvtgZ+XNZSF/OEDCSE8Rl5Gqgy70fb2R8kIUWmSYZZXjJQbzbc/IjlTCm9IHFcB5zcuaZ2fatJf8+viEAx9VZalosw0aIO5Z/fH610EmIqdWA1gow8Hnjwg8Jhp+CjdpLSvT/s3cJtFW1eEdLEdi5Z70Zjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491593; c=relaxed/simple;
	bh=HXfSaKwaFzTSBH/qZwISRTV4/1uglxwps3LuuKmtlng=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ccZmifLEoo25G0RkIg9YwxpMP8QBEf676tM3Cqb0pEc1ZuFbreAYDIZZJwQBiTVcAb6VGLtxkImqwH/lUMaT1MRUGQ3EPH5Irct4Jqztq8lgd3cJd0VetcXF0lD1vrN8mcarqApre9F9FULd2vKpgIhjMctTUxBSKorI2F1o6fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=H6Pc63oZ; arc=none smtp.client-ip=109.224.244.122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780491590; x=1780750790;
	bh=zaaajWuNCVDgD6MaHUWpYX4Z16zlBDOLHGoI+iLmK4Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=H6Pc63oZGiw72tBc4X5vHQpakGJw0+nvEF3vWWSM7YbvXJ0yGcLrf7zPoZ8dv5g0B
	 4ki/0IplEAb47MTZbZ0ILEEzBLXMkHPVetgy9rl8TOjksvjUMaKAV3zezbo3N69uC5
	 tsvGGIARrLzRt0Gj9GGJqKQWKkqvKOCazOWfKCytn+zsu7yXNemRXyS7VSKD2omg2F
	 L7gu4X0PMyhiMFMe4krPaEV+c2BWKC5UB03dHiNHiYKzUqsjg8uQp9RaROAM38mycv
	 0nKDVhBlhPdRoVmXXTH7wXQTddllrauFeA/xoj4UI6hnQRkXZJ95RwvJ3vmDnl/snK
	 V7iP7/Pz8jdKA==
Date: Wed, 03 Jun 2026 12:59:44 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos-nothing-asteroids: Drop simplefb
Message-ID: <4Fnu-d1cqR09ASN7DZABvKUO9mibDR3sRDoETHQpnOhzFTdtp-QIjy61Xed2OMB4Ddw96NGv7a4pmLNFXQESxWfNCLv9xQfyeWqAi_IdGNc=@pm.me>
In-Reply-To: <hs5roqpupi7svf4pyylvseqx44s6jcwnb4he36psoijjeeizbl@aq3b7k3xffxn>
References: <20260603-asteroids-drop-simplefb-v1-1-34d73477c9d4@pm.me> <hs5roqpupi7svf4pyylvseqx44s6jcwnb4he36psoijjeeizbl@aq3b7k3xffxn>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: fa33e3313ed6f1df4429c7e69f106ae27453999f
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110971-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,pm.me:mid,pm.me:dkim,pm.me:from_mime,pm.me:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60104637CA2

On Wednesday, June 3rd, 2026 at 8:54 AM, Dmitry Baryshkov <dmitry.baryshkov=
@oss.qualcomm.com> wrote:

> On Wed, Jun 03, 2026 at 12:41:34PM +0000, Alexander Koskovich wrote:
> > The dummy panel compatible 'boe,bf068mwm-td0' is missing documentation
> > and gives a warning. The 'interconnects' property is also missing from
> > the binding.
> >
> > Dropping the nodes here and will just submit panel binding & driver for
> > use with MSM DRM.
> >
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> >  .../boot/dts/qcom/milos-nothing-asteroids.dts      | 38 --------------=
--------
> >  1 file changed, 38 deletions(-)
> >
> > @@ -131,15 +107,6 @@ ramoops@81f20000 {
> >  =09=09=09mem-type =3D <2>;
> >  =09=09=09pmsg-size =3D <0x200000>;
> >  =09=09};
> > -
> > -=09=09/*
> > -=09=09 * ABL is powering down display and controller if this node is
> > -=09=09 * not named exactly "splash_region".
> > -=09=09 */
>=20
> You might want to keep this node.

I have it dropped in my working tree and works fine with MSM DRM,
unless you're thinking of keeping it for out of tree simplefb users?

>=20
> > -=09=09splash_region@e3940000 {
> > -=09=09=09reg =3D <0x0 0xe3940000 0x0 0x2b00000>;
> > -=09=09=09no-map;
> > -=09=09};
> >  =09};
> >  };
> >
> > @@ -507,11 +474,6 @@ vreg_l12f: ldo12 {
> >  =09};
> >  };
> >
> > -&dispcc {
> > -=09/* Disable for now so simple-framebuffer continues working */
> > -=09status =3D "disabled";
> > -};
> > -
> >  &gcc {
> >  =09protected-clocks =3D <GCC_PCIE_1_AUX_CLK>, <GCC_PCIE_1_AUX_CLK_SRC>=
,
> >  =09=09=09   <GCC_PCIE_1_CFG_AHB_CLK>, <GCC_PCIE_1_MSTR_AXI_CLK>,
> >
> > ---
> > base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
> > change-id: 20260603-asteroids-drop-simplefb-0aeb1d1bbadb
> >
> > Best regards,
> > --
> > Alexander Koskovich <akoskovich@pm.me>
> >
> >
>=20
> --
> With best wishes
> Dmitry
>=20

Thanks,
Alex

