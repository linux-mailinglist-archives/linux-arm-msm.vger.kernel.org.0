Return-Path: <linux-arm-msm+bounces-99024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKcCCjXEvmkRbAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 17:15:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 687432E64B8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 17:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC14630086B7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 16:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830BD31D381;
	Sat, 21 Mar 2026 16:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="uKdagoi2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90BB31AF31;
	Sat, 21 Mar 2026 16:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774109744; cv=none; b=q6FZaMRTSwl604aV/WfQ6OpBiMZZKOGkK2Rh9wVKI5kWTAvWGkilemko1DVEplvgv5dlSHPiRDRdA1uuy65vhCKkHABaiNcKZLYGkLug0EU2/FPhTLqGi9iLqztkRc0/Zv0BCrgGxuFHNsAGe3l0AxBobUK3rlVfDhlLOKkzNJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774109744; c=relaxed/simple;
	bh=AYOratEPILDbogYZ1WfiD0THvnwSWeWlBhpHZUoYx54=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ctHh5zZEofhcA4+rRGkPKxnjIyHYNq7ZOzVNxmrDDKQaWyMKVHqqmqyhjRngg8TDVq+yTTSvAF2D4xNsIs10TIjsjr+67dlh7/Eknx1K7EZT+77pGVh7X1AS2Sp1+4EvDZ6nfSellzmnYD+L3rWXCT9DyP9j08vzu90H2CazHh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=uKdagoi2; arc=none smtp.client-ip=79.135.106.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1774109734; x=1774368934;
	bh=QotTHgm5szfDydHr9RZe/Pmi7UIj/OMAipB3hOHJLmw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=uKdagoi2L9q735o9uBLUbe0p9IWsDjPM59Lh+XCNGXygsYF1FJY8D/cM343QnBvMP
	 2S1IgoGYX/UPdcZcJEdRwT7HspcHAZxGg5vRP9jC164LzPwyWuo7LdSE3UIXUhXZmW
	 /AbSqNvQ1+5dx+VQqZNRTO5WqTFiNK7AR7/alVFwjTf3nnRTkCk8XBo8A7NfBJUtXs
	 byKWK8K1DgTke2SI08LPhdsCEww7qja7UknjAMgGkIfiA6MgXBDnvvRua6Li5WvcIb
	 nnxORmWAPuJLUoCX43jSELPFsbkuC0fSDr8+nyJLI7IpH1Tfrol47qppo4mA6XmHMF
	 zzK2OxKFWJYQQ==
Date: Sat, 21 Mar 2026 16:15:29 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: display: panel: Add Novatek NT35532 LCD DSI
Message-ID: <JPvrBL0VElAnSybKBmlSXQbxGuYnospMhh-e3w4Ug5_6boEWzayNwLUDvCJPlz5IH5JAjciiMhdTBEOiTwJ7e0cbuZW7DV7r55qka0VmhBc=@protonmail.com>
In-Reply-To: <9bb6e4ac-c7f2-4f1d-aff0-70eefec810a2@kernel.org>
References: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com> <20260318-rimob-new-features-v2-1-c1bf8917449e@protonmail.com> <20260319-amorphous-pastoral-turtle-851af9@quoll> <oMTrCB7euJojLz1EUHDhHCq071GQWD0g7-sqwahA62CnM-sVw08UCNhKdgHX2NrEN3H8iRhc0suejuq5JZ39UA2nEfKhRq9qwYJWSxCrAtc=@protonmail.com> <9bb6e4ac-c7f2-4f1d-aff0-70eefec810a2@kernel.org>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: c3476e88b1fb925ce3150479b96fa7d10da5ebb6
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
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99024-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian_ci@protonmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 687432E64B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Saturday, March 21st, 2026 at 10:56, Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> On 20/03/2026 23:32, cristian_ci wrote:
> > On Thursday, March 19th, 2026 at 10:09, Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >
> >> On Wed, Mar 18, 2026 at 11:28:09PM +0100, Cristian Cozzolino wrote:
> >>> +  avdd-supply:
> >>> +    description: positive boost supply regulator
> >>> +
> >>> +  avee-supply:
> >>> +    description: negative boost supply regulator
> >>> +
> >>> +  vci-supply:
> >>> +    description: regulator that supplies the analog voltage
> >>> +
> >>> +  vddam-supply:
> >>> +    description: power supply for MIPI interface
> >>> +
> >>> +  vddi-supply:
> >>> +    description: regulator that supplies the I/O voltage
> >>> +
> >>> +  port: true
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - reset-gpios
> >>> +  - avdd-supply
> >>> +  - avee-supply
> >>> +  - vci-supply
> >>
> >> Only VDDI is required according to datasheet (see page 11 and page 16)=
.
> >
> > Just to be sure, are you mentioning the part saying there are multiple
> > power modes (2-1PWR, 2-2PWR, 3=C3=A9WR and 4PWR) related to NT35532?
> >
> >> Others are needed only in specific configurations, which I would ignor=
e
> >> for the simplicity of the binding. Drop these three.
> >>
> >> Previous discussion point was about this - write bindings based on
> >> datasheet, since it is available.
> >
> > I've removed avdd, avee and vci supplies from 'required' properties
> > and I've also tested the new bindings (just for completeness). Now,
> > I'm going to reintroduce again the issue already raised previously
> > (for which I received no replies in v1): should I submit a v3
> > series including my new changes or I've to stick with v2 here, in
> > order to address review concerns about binding, first?
> >
>=20
> I don't understand the question. This is v2, right? So I asked to make
> changes to it, thus you should submit v3 after receiving some more
> review for example.

I've submitted v3 of patch series considering that, apart dt-bindings, I=20
think I've addressed reviews for the rest of patches, during these last=20
days.

> Best regards,
> Krzysztof
> 

