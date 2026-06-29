Return-Path: <linux-arm-msm+bounces-115249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kGowDOf2QmrWKQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 00:51:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 950066DF18F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 00:51:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samcday.com header.s=protonmail3 header.b=Vv3i6Ntx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115249-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115249-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8020B300D713
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 22:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685023C457D;
	Mon, 29 Jun 2026 22:51:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6230E3B5847;
	Mon, 29 Jun 2026 22:51:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782773475; cv=none; b=TrkEEPxOmZbdO8+GgcgIkPS7zywJ4APLXeGRCaygNAOrb9rbQ0wduKTMOWTiA/mXsaHt6UB/QpD8PFUJn3iyGi+xzciXNifbNzSLDmpiJepejZVtQFm0NHX6px8CCIbIQ2keHfbZlqSdnyqJA9r37jCeEw8ZLrAEGJJp+XEpzA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782773475; c=relaxed/simple;
	bh=tkwBxMmSOT+KuOoFJZXGBNC5ucNjMDsj4Q95vZ+uw88=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OxHtFiYww+Zac/LrwmXMsacXjmnWs6uF7iGDUP4vHPJsnljc6XesgD7RT+2Wrvw4cM1ine/vsCPYOLlcEyaQZ+qHMCcVPjOQgQpORMUwODhxD8uvEIjF79QGCvtH5KAVFqwt6CUK5RhJlwMWKUD69/2Z+9lszGea17E09TUHQi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=samcday.com; spf=pass smtp.mailfrom=samcday.com; dkim=pass (2048-bit key) header.d=samcday.com header.i=@samcday.com header.b=Vv3i6Ntx; arc=none smtp.client-ip=85.9.210.45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samcday.com;
	s=protonmail3; t=1782773464; x=1783032664;
	bh=tkwBxMmSOT+KuOoFJZXGBNC5ucNjMDsj4Q95vZ+uw88=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Vv3i6NtxaOqMSjW2NkoeAKCW9cZQJz1TDfCJldhBDm19VibhfR14R1VTuOHlhfyFF
	 D7DytWEySjVmYRCjX9u3a5Rwmdq20elYki254gAy3iO4pJsbRaY9wF2xYkv10F/YOn
	 CNNLWiNyDh7kHYsJM8sIEmrumAg+kfPqUVduRy1osb84CTqGYX5jyMtw9LL69LH2D7
	 X+QHqFg8jMaZQoNASVh/6yxzid0stHP5MKpmyUJ4uvNyxM7y6qHnQDYLrUePQc9ATF
	 8+2bNhxaCGcyofdEDibi5tyfQC6nPQd5Bz1oGlQKB1NPn70t0pJ7v1jBb2+OuYKZ4z
	 M/YrTbvc81l3Q==
Date: Mon, 29 Jun 2026 22:51:01 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Sam Day <me@samcday.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: add panel rails to simplefb
Message-ID: <6MmdbjsuzuidbfnSBPTziatRh-MvvYkxzODIjsq8bXLfdTs-DzdUHnwdKwSaxueLHWI3nKUEzU-rzwTdlAGbegYrjKf_IeLk-bynAUkxVOA=@samcday.com>
In-Reply-To: <r8tz7rKt6U-PclpxY-kaU-FgoxyZlZI1h-xRvonHnZFGl83UPA0T_sgF9ZNkSeRNlObH2HHdns2CF-XB1Gvj3foNLFfg-zVhNghcp-Ygl8E=@samcday.com>
References: <20260616-sdm845-oneplus-simplefb-regulators-v1-1-1db1804acef6@samcday.com> <c4a70b1e-ea48-49d2-afa6-639b73983729@oss.qualcomm.com> <pYvHBJyxrxgzDI2_h79hEn-wmgJbJpQ4z6Gy1doFhulVhtsOLeOyn5C-ZtxpPjNyv68za3FmQyxVF1KK7wRPF5SLGRK6gZC9s2QK8jgXhHQ=@samcday.com> <92735f0d-9672-4f99-8cb5-28dd78eeeb8e@oss.qualcomm.com> <r8tz7rKt6U-PclpxY-kaU-FgoxyZlZI1h-xRvonHnZFGl83UPA0T_sgF9ZNkSeRNlObH2HHdns2CF-XB1Gvj3foNLFfg-zVhNghcp-Ygl8E=@samcday.com>
Feedback-ID: 25366008:user:proton
X-Pm-Message-ID: 8ee9728fa354808ebf4ed353ca1355c001f0f962
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[samcday.com:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[samcday.com];
	FORGED_SENDER(0.00)[me@samcday.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115249-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samcday.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@samcday.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samcday.com:dkim,samcday.com:email,samcday.com:mid,samcday.com:from_mime,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 950066DF18F

Hi Konrad,

On Tuesday, 30 June 2026 at 8:39 AM, Sam Day <me@samcday.com> wrote:

> Hey Konrad,
>=20
> On Tuesday, 30 June 2026 at 12:24 AM, Konrad Dybcio <konrad.dybcio@oss.qu=
alcomm.com> wrote:
>=20
> > On 6/20/26 1:15 AM, Sam Day wrote:
> > > Hello Konrad,
> > >
> > > On Saturday, 20 June 2026 at 1:11 AM, Konrad Dybcio <konrad.dybcio@os=
s.qualcomm.com> wrote:
> > >
> > >> On 6/16/26 7:27 AM, Sam Day via B4 Relay wrote:
> > >>> From: Sam Day <me@samcday.com>
> > >>>
> > >>> These regulators are marked regulator-boot-on, but that doesn't
> > >>> guarantee they'll stay alive as long as the simplefb does. Adding t=
he
> > >>> explicit supplies ensures that booting with MDSS disabled doesn't
> > >>> switch the panel off 30 seconds after boot.
> > >>
> > >> Why would you boot without MDSS if you want the panel to function?
> > >
> > > For my particular use-case [1] I'm trying to avoid taking over the di=
splay
> > > hardware entirely, and use simplefb until kexecing into the real kern=
el. In
> > > this case the user might halt in a pre-boot menu UI for a while.
> > >
> > > I can also imagine this being similarly useful for "recovery kernel" =
use-cases
> > > where again, it may not be desirable to assume control of MDSS/MDP/DS=
I blocks.
> > >
> > > [1]: https://github.com/samcday/pocketboot
> >
> > Can you handle this by adding a panel =3D <&display_panel> property
> > under simplefb, pointing to the display panel defined in the same
> > file?
>=20
> No, that won't work because display_panel is a child of mdss_dsi0, which =
is
> a child of mdss. So if those nodes are disabled (which is what I'm trying=
 to
> achieve), fw_devlink will defer probing simplefb.

I apologize for spamming you with false assertions! I just realized that
fw_devlink won't step in and enforce such probe deferral unless the propert=
y
explicitly ends with -supply.

However, I tried your suggestion and confirm that the LCD_VCI_3V + VDDI_POC
regulators are still turned off by regulator_init_complete_work(). Since I'=
ve
already embarrassed myself once today I'm not going to attempt to speculate=
 as
to why :)

Cheers,
-Sam

>=20
> BR,
> -Sam
>=20
> >
> > Konrad
> >

