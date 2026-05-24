Return-Path: <linux-arm-msm+bounces-109542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCKkBnljE2r+/QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 22:45:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAA15C4353
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 22:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9442300A511
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 20:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE03030566F;
	Sun, 24 May 2026 20:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9QgvtZ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96420E555;
	Sun, 24 May 2026 20:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779655541; cv=none; b=kaTdO1ckchcykhOSJngT9wvWo3IDSCxjG2dPr5fSmy6q/zK72s3gTt/T4lP+Ba0rtt7anZTLlUtmiNQFLczXG6EhOVT2MCBlciIK2aifUxN5asgRk+5iZji/NzjxdaXfkrVgma17qwRKDFq7l23VY68uB7nQs8tfUr9vMaPqV50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779655541; c=relaxed/simple;
	bh=GM6rFa5xabHqEwW34KJh70uVGE8l2BXBCy8pII0hck0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Co6Zh0xgONw6Sdj08W/Lo+3JXAGuHE/4Da9s7Zsgv6e71ypLgrSmpbGT00sJ+feWVVwZ9lMtNX3GBNCg33DwPeTUBrFVnpE2q40S0/dNG4jNV0bVJuNhQAucuOWOEyaSr17wn7jimTOwpIIhWkaJhcDJBr338VrCPJHK5AKEQbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9QgvtZ+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D5D1F000E9;
	Sun, 24 May 2026 20:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779655540;
	bh=lPkX7igJ13fuMwN8FYyuf3QvoeBkEBGD1vYFDYDWhAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T9QgvtZ+uMkpNmsWRi/zVFffFNF5jMA/0ZOfXC6JLYiAXyw/ek26C/nItMVGFo4Sg
	 DjcmA+xhlLn+2VeovYwuZIlB5jRWJUiDbJ53katUzJA/oZyjZoRwif0e9gKvyyE4vE
	 LcKFipddaVFRW1AS/FJKUEidna/1d8XW5GWQYwHpzbKqt9S8SXjG9oG3+C09lB8weV
	 uuSSn0H4gNej9zoNV4s6VD05eJDSA7EPVcAgl6JhqFWa4vcVzbwWOHaYnB3E5jDdPt
	 Z+HTyUbd0j0U2rPfeB6ymfNzl3saqGtlHRQeeIMtq/gRa5v8VufmsUjIb+uaZsM1ZG
	 3TZQ21g+fajtQ==
Date: Sun, 24 May 2026 15:45:37 -0500
From: Eric Biggers <ebiggers@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] crypto: Delete Qualcomm crypto engine driver
Message-ID: <20260524204537.GB110177@quark>
References: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
 <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
 <7rgfuvv3hai7g4wt4accbkejtzdt5dnb6mkj6x7ox5sz35q4n2@h7j6rr7extuj>
 <66317f6a-645e-432b-ae11-8f40569d4117@gmail.com>
 <d97382a6-6c5d-4a3f-89cc-3ae9b432de3f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d97382a6-6c5d-4a3f-89cc-3ae9b432de3f@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109542-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,armlinux.org.uk,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7EAA15C4353
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 24, 2026 at 10:29:28PM +0200, Krzysztof Kozlowski wrote:
> On 24/05/2026 22:12, Demi Marie Obenour wrote:
> > On 5/24/26 12:42, Dmitry Baryshkov wrote:
> >> On Sat, May 23, 2026 at 03:03:56PM -0400, Demi Marie Obenour via B4 Relay wrote:
> >>> From: Demi Marie Obenour <demiobenour@gmail.com>
> >>>
> >>> It's slower than the generic C code and causes problems.
> >>
> >> Which problems?
> > 
> > See https://lore.kernel.org/all/20260522024912.GC5937@quark/.
> 
> Your commit is still incomplete and other people's opinion is poor
> reason. If you do not know what to write, ask that person to make
> necessary changes.
> 
> Not mentioning that removing driver is not even necessary to achieve the
> goal Eric was mentioning and if I understood correctly: you are removing
> even the pieces Eric found useful.

This driver is more than an order of magnitude slower than the CPU for
both encryption and hashing.  See:

    https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kernel.org/
    https://lore.kernel.org/r/20250615031807.GA81869@sol/

There are many examples of it having bugs as well, for example see the
second link above.

That's why it had to be disabled via the cra_priority system.  This
driver was actively making Linux worse.

This isn't particularly unique to drivers/crypto/, of course.  This one
we just have data on, so it's a bit clearer.

I've yet to see any real reason to keep this driver.

Crypto drivers need to be held to a higher standard than other device
drivers, as well.  The onus is on those who want to keep a particular
crypto driver to prove that it's worth keeping.

- Eric

