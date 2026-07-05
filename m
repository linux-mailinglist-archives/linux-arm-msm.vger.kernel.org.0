Return-Path: <linux-arm-msm+bounces-116525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BByGJucWSmrj+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:33:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B370976D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:33:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gondor.apana.org.au header.s=h01 header.b=D6I3DI8N;
	dmarc=pass (policy=quarantine) header.from=apana.org.au;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116525-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116525-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3E34300B3E1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 08:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054E0318146;
	Sun,  5 Jul 2026 08:33:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7A3433E7A;
	Sun,  5 Jul 2026 08:33:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783240420; cv=none; b=pOZdW3nygaQtxRbQm3ItL6oMGApqzPkEMLmPeoQplf8Q3QEAGMQACWuCg91EX2nmx7fq+eSz0ZZS3hVoLU+Y3QiBiYIn2kvza/YXmFg+P7G4SiNRORz+deqqTyZDUP0o70rOUgzfcgyYhnPFlWsF8P8iJcBfRobMVBQ7ViTNO78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783240420; c=relaxed/simple;
	bh=ZYfWVZBwE87UsI5RQSs+53jrp0ELz2YHyiPdy6sEhvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qt38wRhN+wqiUR+gYgtjQGt/PH7mQ84JGZHvvp2yOIoBePCanzYeOJK09+I2ieLDmdGxUJ/KAIH+W4PcIIOWO9fX5nFznrgBp6YPzzlJPL61a/FPbCvEd6xPcRhAmP5oqLNtSJrntVl5aqQ9hEbBzdIaiNpW+jNuXtgOUzBkJ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=D6I3DI8N; arc=none smtp.client-ip=180.181.231.80
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=tVOBl3pFmHo3gQUWye2S7BCioHkaAaDOttuAOXMpMbY=; 
	b=D6I3DI8NrIG+5KjAQ09sHY2/wH31qmCbqLiknGddMJKS9tBOvhOicIexz/4/iaI7I+gKiNIW/ox
	McyPSUScfuTFcJdzyTNalysnm1OCOX3KZpkjG23n8Aj+F6Slu2qSEDy/iFPxDou8ST4LSWqYNSK5X
	kZxCElPJaZwznrpqj9rl0yCPRoggt9srb2dJj9b8khFJn1scLeG0ouRJWUo+hETj7chyRkxY3xnZE
	ZeYVOaMovC4vGOWZu5FVPHG8PjYCCPaBOtmh/XcaHWFgNXDTtAsLE+WUb973YH95R1TdQvz49F11Z
	57l76GmNBEOMuDQtZQg47wsLf7Rcs24/+BOQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wgII8-0000000Al1Q-02x1;
	Sun, 05 Jul 2026 16:33:33 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 05 Jul 2026 16:33:32 +0800
Date: Sun, 5 Jul 2026 16:33:32 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/7] Finish removing crypto_rng from drivers/crypto/
Message-ID: <akoW3D0-IEaNP9Zj@gondor.apana.org.au>
References: <20260615224131.69370-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615224131.69370-1-ebiggers@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[apana.org.au,quarantine];
	R_DKIM_ALLOW(-0.20)[gondor.apana.org.au:s=h01];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-116525-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[herbert@gondor.apana.org.au,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gaurav.jain@nxp.com,m:horia.geanta@nxp.com,m:pankaj.gupta@nxp.com,m:clabbe.montjoie@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:clabbemontjoie@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gondor.apana.org.au:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herbert@gondor.apana.org.au,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gondor.apana.org.au:from_mime,gondor.apana.org.au:dkim,gondor.apana.org.au:mid,vger.kernel.org:from_smtp,apana.org.au:url,apana.org.au:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F40B370976D

On Mon, Jun 15, 2026 at 03:41:24PM -0700, Eric Biggers wrote:
> This series finishes removing the unused, redundant, and frequently
> broken crypto_rng support from drivers/crypto/.  It applies to
> cryptodev/master.
> 
> Patches 1-4 are a resend of
> https://lore.kernel.org/linux-crypto/20260608175848.2045229-1-ebiggers@kernel.org/
> 
> Please consider these patches for 7.2, considering that most of these
> drivers had security vulnerabilities which would have needed to be fixed
> right away anyway.  And the qcom hwrng fixes are important too.
> 
> Eric Biggers (7):
>   crypto: qcom-rng - Enable clock in hwrng case
>   crypto: qcom-rng - Allow zero as a random number
>   crypto: qcom-rng - Remove crypto_rng interface
>   hwrng: qcom - Move qcom-rng.c into drivers/char/hw_random/
>   crypto: sun8i-ce - Remove crypto_rng interface
>   crypto: sun8i-ss - Remove crypto_rng interface
>   crypto: caam - Remove crypto_rng interface
> 
>  arch/arm/configs/multi_v7_defconfig           |   2 +-
>  arch/arm/configs/qcom_defconfig               |   2 +-
>  arch/arm64/configs/defconfig                  |   2 +-
>  drivers/char/hw_random/Kconfig                |  11 +
>  drivers/char/hw_random/Makefile               |   1 +
>  drivers/{crypto => char/hw_random}/qcom-rng.c | 156 ++----------
>  drivers/crypto/Kconfig                        |  12 -
>  drivers/crypto/Makefile                       |   1 -
>  drivers/crypto/allwinner/Kconfig              |  16 --
>  drivers/crypto/allwinner/sun8i-ce/Makefile    |   1 -
>  .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  63 -----
>  .../crypto/allwinner/sun8i-ce/sun8i-ce-prng.c | 159 ------------
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  29 ---
>  drivers/crypto/allwinner/sun8i-ss/Makefile    |   1 -
>  .../crypto/allwinner/sun8i-ss/sun8i-ss-core.c |  45 ----
>  .../crypto/allwinner/sun8i-ss/sun8i-ss-prng.c | 177 -------------
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h  |  23 --
>  drivers/crypto/caam/Kconfig                   |   9 -
>  drivers/crypto/caam/Makefile                  |   1 -
>  drivers/crypto/caam/caamprng.c                | 241 ------------------
>  drivers/crypto/caam/intern.h                  |  15 --
>  drivers/crypto/caam/jr.c                      |   2 -
>  drivers/gpu/drm/ci/arm64.config               |   2 +-
>  23 files changed, 41 insertions(+), 930 deletions(-)
>  rename drivers/{crypto => char/hw_random}/qcom-rng.c (53%)
>  delete mode 100644 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c
>  delete mode 100644 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c
>  delete mode 100644 drivers/crypto/caam/caamprng.c
> 
> 
> base-commit: 6ea0ce3a19f9c37a014099e2b0a46b27fa164564

Patches 4-7 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

