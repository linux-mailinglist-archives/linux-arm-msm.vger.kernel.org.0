Return-Path: <linux-arm-msm+bounces-98976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHJ7NwfLvWlgCAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 23:32:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE9D2E1CCC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 23:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF17230125F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 22:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D430938BF6C;
	Fri, 20 Mar 2026 22:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="vFq6emCH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10696.protonmail.ch (mail-10696.protonmail.ch [79.135.106.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50F7314A65
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 22:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774045955; cv=none; b=mLf60Wp2t6j/h+3tbjYSJ2OYQmQ1cvoZ+EDwwpM5+5fruEav7c96RCErva9TW633jMo3ZBPOfrz/nQz50+QMApNkNNuI2i3lJzmq3lkj/i4rJbyQRhCYJ+OGAFhMXDEl7ttsd9jijFkVSPZ8+lXPs1yBp5tzWGyBeqqlJlyCu5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774045955; c=relaxed/simple;
	bh=AbAJ6kJCpxIex40lxJPqgz8FVRA08Ydz8UH2X5iXfY8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gK+j59R1i2WL5gcl4+hRFkaCELKHoyk/ZAdnoC5XtV97Rpgp657Ao2WdIuMi7BzvmHsrTXeTw+Pf/ITKl0jSAlSc2zTn14ybRUlefiFwdUBLvO/blYxTYnVLlxJIMbADWl0UxhyqYewKvgsIzwGL7YIVjnBfm3+7TzzU5UuQM7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=vFq6emCH; arc=none smtp.client-ip=79.135.106.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1774045944; x=1774305144;
	bh=QyU3KziqZxd9HOhx4Gs65M6cMH9dTEoOjkIOFlgjlAc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=vFq6emCHQOyQdgP2aUob/id6mm+oqQrrLlZ0+Br2YAZCJIfE+0p1PO7CNZqeL+S8O
	 Ce0CGIzI/T+aWIqq175gvxn67Pf0xf/y4YEm1qunOk8NApn8xoZkrWdlYZ09ZuRr22
	 AUqFDNDwaJ8aOFkXGRq9XVelRMOBbwl/FEWkWZ3x5V181w54WtNeaoS3plf0VrhrA+
	 wbHiMiCviLIUboZpHG0lX/KDlaB9e1jriYoIAjgVOmTuxPVvvNDNrKXuxTn7G5gQuB
	 xgN1Hqo1XNX3uw8q+CqX+d6qHf25GkpYKu5Q5R9TEmN/5Fs6Dn/ZxZ4BuQT/FzyHh7
	 XDemqkqBxICHQ==
Date: Fri, 20 Mar 2026 22:32:18 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: display: panel: Add Novatek NT35532 LCD DSI
Message-ID: <oMTrCB7euJojLz1EUHDhHCq071GQWD0g7-sqwahA62CnM-sVw08UCNhKdgHX2NrEN3H8iRhc0suejuq5JZ39UA2nEfKhRq9qwYJWSxCrAtc=@protonmail.com>
In-Reply-To: <20260319-amorphous-pastoral-turtle-851af9@quoll>
References: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com> <20260318-rimob-new-features-v2-1-c1bf8917449e@protonmail.com> <20260319-amorphous-pastoral-turtle-851af9@quoll>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: aa5d67d40f9ced9875dfeb1b6597c0c1dad3b0c0
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
	TAGGED_FROM(0.00)[bounces-98976-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian_ci@protonmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4BE9D2E1CCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thursday, March 19th, 2026 at 10:09, Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> On Wed, Mar 18, 2026 at 11:28:09PM +0100, Cristian Cozzolino wrote:
> > +  avdd-supply:
> > +    description: positive boost supply regulator
> > +
> > +  avee-supply:
> > +    description: negative boost supply regulator
> > +
> > +  vci-supply:
> > +    description: regulator that supplies the analog voltage
> > +
> > +  vddam-supply:
> > +    description: power supply for MIPI interface
> > +
> > +  vddi-supply:
> > +    description: regulator that supplies the I/O voltage
> > +
> > +  port: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reset-gpios
> > +  - avdd-supply
> > +  - avee-supply
> > +  - vci-supply
>=20
> Only VDDI is required according to datasheet (see page 11 and page 16).

Just to be sure, are you mentioning the part saying there are multiple=20
power modes (2-1PWR, 2-2PWR, 3=C3=A9WR and 4PWR) related to NT35532?=20

> Others are needed only in specific configurations, which I would ignore
> for the simplicity of the binding. Drop these three.
>=20
> Previous discussion point was about this - write bindings based on
> datasheet, since it is available.

I've removed avdd, avee and vci supplies from 'required' properties=20
and I've also tested the new bindings (just for completeness). Now,=20
I'm going to reintroduce again the issue already raised previously=20
(for which I received no replies in v1): should I submit a v3=20
series including my new changes or I've to stick with v2 here, in=20
order to address review concerns about binding, first?

> > +  - vddi-supply
> > +  - port
> > +
> > +additionalProperties: false
>=20
> Best regards,
> Krzysztof
>=20
> 

