Return-Path: <linux-arm-msm+bounces-102847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI+gDIRd22mWAwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 10:53:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C9D3E328C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 10:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EABC3019199
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 08:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312FA29BDB4;
	Sun, 12 Apr 2026 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="VAC3Qapf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF752DEA64;
	Sun, 12 Apr 2026 08:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775983957; cv=none; b=Z+WyvMFPyyiZnE02mRD9MMG4SplWAnvAbmwAt+qJiY6CEIZl8WCvNBQp4A2s7nIi5LnxQK4BeKJYBTtDtRoLWTZuqrJOM6TXzH89hXgx3zFQM4HHFreJAo25j8qrOcxKLk0xiiHCpBf9TIkXg2HHJ5j/L2q++Wvo2+w2S04Tx6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775983957; c=relaxed/simple;
	bh=qC8azDV0vffk9hHMlDY/PxsnnxgTSWST1PfaNo7yrJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0O4JkY432FP600S7tVj+L1VexZcFxObxrm5dNTQRSvLqY62VQqvxSV5GodDHmkQbXqNsN7hlFwPRF9FBcv5D/FbKP5gK4QTwrwviNKy8NtlLUqVo7qDC9s9KrH8NEmBLGpp3NuzCZrlipVQysw1zsbwBxqvyyHik91LBWbU6Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=VAC3Qapf; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=YXlCirSCQoS/yjXkuLU4P2eBAK34ytGDfIwQK/GVfuc=; 
	b=VAC3QapfkTWkn+UhlQ99gqwPhxwu8SxoQlX8d3kXM51gcCZ1TTT7cT5DO4H6San+Nbejbc6PRtt
	1Eae9o9DdAmvyGsvxqPC5KMxG37TnIF40ETRj4WRLUgQa7z4yj+ySm9MYP1SimAjhclibPwacwH3/
	rku7Vqk6r6ardjQsGIrRVwip71dsYVgAsdZjIT7hyzjTTwxP2i5wGk+mvhtONzC5F51rW2kht3JiI
	7KhKahjt07m0/Nt8bu5qhFIvqP1IUBxlsBQZO71CZHIVlGRH1lAKzA+ai48zLgIO0WjYMqLg+9FUf
	ZmHzkdJnpXf+mK2do49wzjI7xrQvutlknK3A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wBq8w-005UJe-08;
	Sun, 12 Apr 2026 16:52:29 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 12 Apr 2026 16:52:28 +0800
Date: Sun, 12 Apr 2026 16:52:28 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: qce - simplify qce_xts_swapiv()
Message-ID: <adtdTF0wommm_LW6@gondor.apana.org.au>
References: <20260330173923.479407-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330173923.479407-3-thorsten.blum@linux.dev>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[apana.org.au,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gondor.apana.org.au:s=h01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-102847-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gondor.apana.org.au:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herbert@gondor.apana.org.au,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,apana.org.au:email,apana.org.au:url,gondor.apana.org.au:dkim,gondor.apana.org.au:mid,linux.dev:email]
X-Rspamd-Queue-Id: 86C9D3E328C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 07:39:25PM +0200, Thorsten Blum wrote:
> Declare 'swap' as zero-initialized and use a single index variable to
> simplify the byte-swapping loop in qce_xts_swapiv(). Add a comment for
> clarity.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/qce/common.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

