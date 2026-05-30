Return-Path: <linux-arm-msm+bounces-110357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LPvG6DAGmp88AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 12:49:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB02860C3C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 12:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87CB43020AAB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 10:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DD539B49E;
	Sat, 30 May 2026 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MP5c73d9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BFF2FE074;
	Sat, 30 May 2026 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780138093; cv=none; b=d5bfONUwg9Ge43KVvsOvgYldyMw07qBR/gFlGhdYaunrmYUpnEd1xd2aKsg/kXVgtEUvpS/H4UDQrZxTwEbeTtkv50xU7xkckBYcxL2JZgtzSsQ8WRW7fnijp9U/p4VpT8ggnBmP9xGecKQRWTOGqn0QFVo/QMBUMAEihyxio7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780138093; c=relaxed/simple;
	bh=P0FCZwwYbVMr0jekGLdzkA0WJKNkpxU2GibrYj/mhk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9/VN4TOGiG7KZ/7RUk9WvZ7a6NGBgrIeoJ99EIlm/KxTQ/Z8DjmiLZ6nAbOtp1nu1KTjJRMq4eAIff1A8MUAcVTD/48ILP6LezQrOKq0oyDlVIa8vmlEva60x3k+kfbFKbBt9/2TKAw4/0Qt07wN+1BC/KPflf6f7hDvifhm8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MP5c73d9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49D91F00893;
	Sat, 30 May 2026 10:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780138092;
	bh=8ZOkOiUGphlye6XMDBEWeJg+3upNBwM3JqNA5E14kxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MP5c73d9myscEqyCSzql55cJ27CeS+f0OyRedHnif8Ny44lNNrYxpOuTIVQqlUmbf
	 iS1Lyx17qVCiER0uLQcw/OIH0j42Zi70dtGt9eAGTS/iaMEbnbbJWVK087lh5ZFMxM
	 A3/9LnhWwT0BqzFAtrPh16o3vvzNTryX+Y/nRsNJnx1fCvA1jtMqVZywrgd8KKCpie
	 uIVjnR//3JbS0erZg+8JCOyPZcGQIpSHvFTXXasBuyrM8Wjj+vFAV7YPzM1vyla2cc
	 NvugdXL2GIQfechTmq05Y2/AzeIldT2WGT955Dw4r3FgkJFM3d3094zUQVxzplrOvC
	 DkP0oorkhEPgw==
Date: Sat, 30 May 2026 12:48:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] crypto: Delete Qualcomm crypto engine driver
Message-ID: <20260530-unbeatable-supportive-wren-c27de8@quoll>
References: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
 <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
 <7rgfuvv3hai7g4wt4accbkejtzdt5dnb6mkj6x7ox5sz35q4n2@h7j6rr7extuj>
 <66317f6a-645e-432b-ae11-8f40569d4117@gmail.com>
 <d97382a6-6c5d-4a3f-89cc-3ae9b432de3f@kernel.org>
 <20260524204537.GB110177@quark>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260524204537.GB110177@quark>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110357-lists,linux-arm-msm=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CB02860C3C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 24, 2026 at 03:45:37PM -0500, Eric Biggers wrote:
> On Sun, May 24, 2026 at 10:29:28PM +0200, Krzysztof Kozlowski wrote:
> > On 24/05/2026 22:12, Demi Marie Obenour wrote:
> > > On 5/24/26 12:42, Dmitry Baryshkov wrote:
> > >> On Sat, May 23, 2026 at 03:03:56PM -0400, Demi Marie Obenour via B4 Relay wrote:
> > >>> From: Demi Marie Obenour <demiobenour@gmail.com>
> > >>>
> > >>> It's slower than the generic C code and causes problems.
> > >>
> > >> Which problems?
> > > 
> > > See https://lore.kernel.org/all/20260522024912.GC5937@quark/.
> > 
> > Your commit is still incomplete and other people's opinion is poor
> > reason. If you do not know what to write, ask that person to make
> > necessary changes.
> > 
> > Not mentioning that removing driver is not even necessary to achieve the
> > goal Eric was mentioning and if I understood correctly: you are removing
> > even the pieces Eric found useful.
> 
> This driver is more than an order of magnitude slower than the CPU for
> both encryption and hashing.  See:
> 
>     https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kernel.org/
>     https://lore.kernel.org/r/20250615031807.GA81869@sol/
> 
> There are many examples of it having bugs as well, for example see the
> second link above.
> 
> That's why it had to be disabled via the cra_priority system.  This
> driver was actively making Linux worse.
> 
> This isn't particularly unique to drivers/crypto/, of course.  This one
> we just have data on, so it's a bit clearer.
> 
> I've yet to see any real reason to keep this driver.
> 
> Crypto drivers need to be held to a higher standard than other device
> drivers, as well.  The onus is on those who want to keep a particular
> crypto driver to prove that it's worth keeping.

Commit doing the work should have all these explanations, including
numbers. External references are not a proper justification for commits.

Make your case, describe the findings including impact (or lack of
impact) on ongoing hw wrapped keys work and inlined encryption for other
devices (ICE).

Best regards,
Krzysztof


