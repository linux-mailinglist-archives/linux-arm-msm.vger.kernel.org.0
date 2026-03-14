Return-Path: <linux-arm-msm+bounces-97676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC69Ei3ttGm/uQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:07:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E334D28BAFA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD85C301DD61
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 05:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C2F34E770;
	Sat, 14 Mar 2026 05:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="eRWqP4dO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D3A322C78;
	Sat, 14 Mar 2026 05:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773464848; cv=none; b=lBpMtoPIylyzLW2WmBde4+E7oi7bmuENGhZG+FyJXsBSe+YSwEclW5JxKF8COaeWRpEzfb0n8B4VoQeR3dOOQ0kKuhsMPR5qIkGGWkYL3xKjGsnb5RcYK/DdDZbvuje7oU+f9cSd6IAzvXu7WV3cPYZknIW2GF5hjvkL+toNtEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773464848; c=relaxed/simple;
	bh=Pvb5Cu0oEadGdfd36Tvy3YhUaw19yeeKFCo9PftE6eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAut5KAXNmqwEa/QyVgcST+8ULufUCNKQYjAwYofTx4B9CrWuu4uYmalTQ2kvygtH37zcfptAaPdQ2Qosov4BrOB/9t/ItQe7lTrq2rTTPmB9U0tws054rO4DFfUMwm77RZgBLUDPQcSPdrar1B9O3fkp4Ih65APfTaj13fS6JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=eRWqP4dO; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=TfKhN1XBe9yf3sHUlBvYXS1CMaSFz0jikCsRd+czjuI=; 
	b=eRWqP4dOF1FoWGc6dsyFkT6HRdybqlRASt2Gu6/XsY74NyDQBRHgSyM8lfCeV1tAlS7RYxk1r/E
	0TXglAZGcalZ8epi6bdu+vNHqmNfoQQ840AiEZOf4/qs9gwv4ibZC43CnXbc6hPRH05EyjyuAAahA
	JujlVoUymD52Cds1oZgTbC8bJNqQW+QsOWtL4HYH0GeY7chbIllT7WebU4h2ujxk2sIwj/XCEsrDe
	/A2qqwv28L7W7L/FSdxTZPQGk2VKNYLHMneMrUxpGBByGV9wHMFrDKjHOBaIO4Jp5BhcPzwHhbdc6
	oQrQxVfqA3LTrg67Dcu27aurvImrsOb7bgpw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w1HDY-00EL22-0b;
	Sat, 14 Mar 2026 13:07:17 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 14 Mar 2026 14:07:16 +0900
Date: Sat, 14 Mar 2026 14:07:16 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: qce - Remove return variable and unused
 assignments
Message-ID: <abTtBCduUWA1GwLx@gondor.apana.org.au>
References: <20260302113453.938998-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302113453.938998-2-thorsten.blum@linux.dev>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[apana.org.au,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gondor.apana.org.au:s=h01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97676-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gondor.apana.org.au:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herbert@gondor.apana.org.au,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: E334D28BAFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 02, 2026 at 12:34:53PM +0100, Thorsten Blum wrote:
> In qce_aead_done(), the return variable 'ret' is no longer used - remove
> it. And qce_aead_prepare_dst_buf() jumps directly to 'dst_tbl_free:' on
> error and returns 'sg' - drop the useless 'ret' assignments.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/qce/aead.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

