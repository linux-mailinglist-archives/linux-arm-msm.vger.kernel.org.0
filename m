Return-Path: <linux-arm-msm+bounces-98888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLD2LjL1vGms4wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:20:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B082D6865
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4C7230B2735
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 07:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4003596F8;
	Fri, 20 Mar 2026 07:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="INtXjfTu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24430.protonmail.ch (mail-24430.protonmail.ch [109.224.244.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFF446BF
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773991163; cv=none; b=TDYQvj2MJivwEH+o7ZmfD+Y1AQhnzvsIbnwxUlpiif/4cBfXZxEuuRU2UqHZRvp96n5VyVyKpXtOfkIHoDxpfPXYfyXKlNGhxD/tRBSxHh60JwuI3uJrfRqE8811/d6gAq4KMZ+5oJ4GxdN9hWqhbA/gzOUFbQnneKjB1TOUWgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773991163; c=relaxed/simple;
	bh=d8KZnHOUKc9aPKh5RRZ2INy5sMjFQ1N3a3BA8s1oSug=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D37doaWDNfg2ZpS9IRlL7AFL85WHhU4T0xh6OxIJrI+zdYplyKM70ayULoYkdrG0+Gz06S9WYoGbzA92rFC6H9kqlFe06azR4yVrRwXwrBKpKX5S5p0VX5RTbB9iqpAwFVWCTxGeiEts0dQikubUREeqLTEi5yKLwkV0vKQALLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=INtXjfTu; arc=none smtp.client-ip=109.224.244.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773991152; x=1774250352;
	bh=+XRuUNY/hs84dNZVuW3v8EtYOa8xUIu2OLZAs6swl6w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=INtXjfTu6Poa+7BLNGkevsDHl+W/CESmy3XD2c0ApIVLVTfB1dl3NAHSHycLrhB37
	 pDl5OrqL5hvo9v5jGvj+mJlv5ilzhi6ojB2QP5tsb2hofVvFv7iGLSQ/16bhmCa8T4
	 YIMp3KHJh7TSMk8DjhV1ViFJS1cWdhVrTBvI75iA35m77nK2coApTkGldgrGQdYLZ+
	 pQXhJz9JBNs5HrqpjHHRZCDy/AM/RWUdyMh+sciT73woXxu0hV4exDkzQRF5TPffU1
	 j/GmX/XxRySCCqHxzmSzoiIyLcLO0DJsnDpF5UbitXeIpswtKaoyneUK4BkCXpc8RF
	 c3C7hAK+H2A2A==
Date: Fri, 20 Mar 2026 07:19:06 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] drm/panel: Add driver for Novatek NT35532
Message-ID: <4f3qSm2N-iqHmdKAzp6YslvLGtZbaeYJhV9pae3gtww5xiIUDM3Xov9wdCCumhINDMaHeFaJPMf23RqvZZkDQlE8D6hObDFaCd1vZjUHUoA=@protonmail.com>
In-Reply-To: <byxrw5g4t23vivbt4xxpyfcsbrmlaju4lqqwsc75iqizoqmt4n@ltuwlggbitye>
References: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com> <20260318-rimob-new-features-v2-2-c1bf8917449e@protonmail.com> <byxrw5g4t23vivbt4xxpyfcsbrmlaju4lqqwsc75iqizoqmt4n@ltuwlggbitye>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 73aca8d40c90d8b6aa8bf437ae557b39d9b0cefe
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98888-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.546];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian_ci@protonmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonmail.com:dkim,protonmail.com:email,protonmail.com:mid]
X-Rspamd-Queue-Id: 52B082D6865
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thursday, March 19th, 2026 at 03:27, Dmitry Baryshkov <dmitry.baryshkov@=
oss.qualcomm.com> wrote:

> On Wed, Mar 18, 2026 at 11:28:10PM +0100, Cristian Cozzolino via B4 Relay=
 wrote:
> > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> >
> > Add support for Novatek NT35532-based 1080p video mode DSI panel.
> >
> > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > ---
> >  MAINTAINERS                                   |   1 +
> >  drivers/gpu/drm/panel/Kconfig                 |  11 +
> >  drivers/gpu/drm/panel/Makefile                |   1 +
> >  drivers/gpu/drm/panel/panel-novatek-nt35532.c | 779 ++++++++++++++++++=
++++++++
> >  4 files changed, 792 insertions(+)
> >
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I'm doing a test: since I'm not sure if:

=09select VIDEOMODE_HELPERS

is actually needed in Kconfig nt35532 entry, I've temporarily=20
removed that select line and regenerated .config file. Though,=20
I've noticed CONFIG_VIDEOMODE_HELPERS was still set to 'y'=20
nevetheless, so I decided to not going forward since that=20
code would have been built anyway so that there was no=20
point for doing that. I wonder: is that select line really=20
necessary, at this point?

> --
> With best wishes
> Dmitry
> 

