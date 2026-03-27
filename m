Return-Path: <linux-arm-msm+bounces-100257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEUdKLZZxmlgJAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:19:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 085D0342626
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37741304EAB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8AB3A6EF9;
	Fri, 27 Mar 2026 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="cCrIif+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1390A32C942;
	Fri, 27 Mar 2026 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606256; cv=none; b=kwySBVMTwxDyQtNSpVq8nnJc9njfEPbDuqtu/2CKFPzji7JY94fHA1zN0sSZewl5ahJj34abURfRDojMnmhxjgL9uPn5KOvPcVepo51Vn2jIyvI+cfNtoY/eepwGAp4F2D+9BETWPctWZ4zLnyMFrAml6R/AEZHc4i3ASEPMypE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606256; c=relaxed/simple;
	bh=rRMpY9Vu5taearr2M+M/MlfsiwB0ED39FZzkHGrByuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnG6DDSpquShwoeqI8Uhdbq4JPoW8bis1mZ1Alq63Rqcgf1goGtVj51qGHDZckSH0ndpUPwzg/8i/KAfWJDJ1NioqIlI0jcKeYKOq1CZuTZhKRK95HRXdqS0qUgnac/np1k8W/CIeTq5DrMghuF/Dk95hIFFrK0OBAE/tNircCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=cCrIif+x; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=bDYHGsUWeR6d4A8nTkH2Nm/tZyp0AYSrpLV6iqpODto=; 
	b=cCrIif+xC5l2DqqIHVAaZ/HUGKjvvHDMizOmRso+pcd8xOCpcuiMrtplIqeZyteW+qCrGkYh64W
	dIPj2MTfhtct8PfpVVQhr37RokA8/jDDdRz1a3o92HoWx/O1aPT+dHvo0aIOYwyo42rk69YeTRusj
	fvn7lHqMu0ULt7JcZ/yR2Pmt9SabhvlKxTW2WeDJ1oQqroNbtxt0XNLj/59h4DPedX7cN6K6Sylxt
	WvTyH8R6571ZxE2yxNOUMEUXlxZVAUcZ3676pqPMF4svmQw33gii0A8tMUR+W6cu0s9sKvhGiFqh1
	oIBgYqIj3nWECtVHPAvFZZCbSlSgtMU0xyeA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w63jy-001btk-05;
	Fri, 27 Mar 2026 18:10:49 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 27 Mar 2026 19:10:48 +0900
Date: Fri, 27 Mar 2026 19:10:48 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: qce - use memcpy_and_pad in qce_aead_setkey
Message-ID: <acZXqElwOfjrZ4C6@gondor.apana.org.au>
References: <20260321131439.40149-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321131439.40149-2-thorsten.blum@linux.dev>
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
	TAGGED_FROM(0.00)[bounces-100257-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[apana.org.au:email,apana.org.au:url,linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gondor.apana.org.au:dkim,gondor.apana.org.au:mid]
X-Rspamd-Queue-Id: 085D0342626
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 02:14:39PM +0100, Thorsten Blum wrote:
> Replace memset() followed by memcpy() with memcpy_and_pad() to simplify
> the code and to write to ->auth_key only once.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/qce/aead.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

