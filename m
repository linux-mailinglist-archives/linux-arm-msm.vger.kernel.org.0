Return-Path: <linux-arm-msm+bounces-116523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xwi7AF8VSmqu+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:27:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B40C7096FF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:27:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gondor.apana.org.au header.s=h01 header.b=IdE6efxt;
	dmarc=pass (policy=quarantine) header.from=apana.org.au;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116523-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116523-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6ADEC3009992
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 08:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20ED53672B5;
	Sun,  5 Jul 2026 08:27:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3237330C158;
	Sun,  5 Jul 2026 08:27:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783240027; cv=none; b=oHuQfrREuFlHJWGSEQFilAVAFUUw4R/fR6xTcBgVCCBodVS1NsePLEsDtBdeSUOjMMHfc6bJfzXGrnbl/tqCIg+pIjyFjhO3kDl1huvZSH4PJ0RUgiGyWOZsAq5TxpRFROiiurHBu95541Clw87BZehocBWlKm4+geGKl5S8EHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783240027; c=relaxed/simple;
	bh=EpKlMW5LveiYMuciMiXq64pDB1DX6k3eAxVfOX1YcKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=WJb9vFva69HiMScS7MYvFXHl5IqYLZPWQmJ7LsFn7yLFuV43oMtgY1kloUVqfUNnSJbTYleFRPZJlKi+zihZBmKj6L8WT2DePqnFM+HW/8Eaewmzc0fLhtuCATr53jq2iuGTPR45xBW50w80ESGJpxp/kvSm8O+wKIwy8QRIUew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=IdE6efxt; arc=none smtp.client-ip=180.181.231.80
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:from:
	content-type:references:reply-to;
	bh=uOa1wMFrNOEdUyDKqta6glQyq4ySoPGgS/Mn8d2L3d4=; b=IdE6efxtbCK7cJNiuqrnOQfxlc
	5W1XYMbFN8Yq3RH/oSL2bjG9FtgjEjFJs/cckyV7SsMLIFWWuo9gARB3dcwoertEWMXm5m6qFBrPM
	Zz377ylFTUilGGFn+mBc9ckLtikGk92HqsGpPdoDNUU5B6i7WmP4YpCjEGxWdWdI7nsfusKlYk6g2
	RKVDqKmRBeVPGrNHIOBCuqHsm+JGcARXntMBbvapSL1v4J+oMEPERMtRIIXyfuuyHLdMULCY2soeF
	lfU+7kp7/rjZqMwwA4NhxSJj3ZxszybTydpP8RK8ndzEmjzDJxwK4cneukBRu9AjfGFmDpX4CZ/D8
	LPbZxVbQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wgIBj-0000000Akub-44HX;
	Sun, 05 Jul 2026 16:26:57 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 05 Jul 2026 16:26:55 +0800
Date: Sun, 5 Jul 2026 16:26:55 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_omprsing@quicinc.com, quic_bjorande@quicinc.com,
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
	olivia@selenic.com, ebiggers@kernel.org,
	neeraj.soni@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v2 0/4] qcom-rng fixes and cleanups
Message-ID: <akoVT0XHNhxy9-ej@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608175848.2045229-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[apana.org.au,quarantine];
	R_DKIM_ALLOW(-0.20)[gondor.apana.org.au:s=h01];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116523-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[herbert@gondor.apana.org.au,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_omprsing@quicinc.com,m:quic_bjorande@quicinc.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:olivia@selenic.com,m:neeraj.soni@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gondor.apana.org.au:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herbert@gondor.apana.org.au,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,apana.org.au:url,apana.org.au:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B40C7096FF

Eric Biggers <ebiggers@kernel.org> wrote:
> This series fixes several bugs in qcom-rng, including failure to enable
> the clock before accessing the hardware, generating biased random
> numbers, and generating duplicate or non-random numbers due to missing
> locking.  To fix the latter bug, it drops the support for the
> duplicative crypto_rng interface, which isn't used in practice, leaving
> just hwrng which is the one that actually matters.
> 
> This series is targeting cryptodev/master
> 
> Changed in v2:
>  - Changed patch 3 to make the driver continue to be bound even when
>    hwrng is unsupported.
>  - Added blank line in patch 2
>  - Added Reviewed-by
> 
> Eric Biggers (4):
>  crypto: qcom-rng - Enable clock in hwrng case
>  crypto: qcom-rng - Allow zero as a random number
>  crypto: qcom-rng - Remove crypto_rng interface
>  hwrng: qcom - Move qcom-rng.c into drivers/char/hw_random/
> 
> arch/arm/configs/multi_v7_defconfig           |   2 +-
> arch/arm/configs/qcom_defconfig               |   2 +-
> arch/arm64/configs/defconfig                  |   2 +-
> drivers/char/hw_random/Kconfig                |  11 ++
> drivers/char/hw_random/Makefile               |   1 +
> drivers/{crypto => char/hw_random}/qcom-rng.c | 156 +++---------------
> drivers/crypto/Kconfig                        |  12 --
> drivers/crypto/Makefile                       |   1 -
> drivers/gpu/drm/ci/arm64.config               |   2 +-
> 9 files changed, 41 insertions(+), 148 deletions(-)
> rename drivers/{crypto => char/hw_random}/qcom-rng.c (53%)
> 
> 
> base-commit: 79bbe453e5bfa6e1c6aa2e8329bfc8f152b81c9b

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

