Return-Path: <linux-arm-msm+bounces-112841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rRGEMAWBK2r6+gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 05:46:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EC9676788
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 05:46:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gondor.apana.org.au header.s=h01 header.b=klgtFRZa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112841-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112841-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=apana.org.au;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8F9130D148A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 03:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427FF2F8E9C;
	Fri, 12 Jun 2026 03:46:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B2D33BBBD;
	Fri, 12 Jun 2026 03:46:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781235964; cv=none; b=sn6lWvCSly/+ti5OBBkGn5sHKHCU3p0FHJh8UOuoFQcBKc1cU2PrytWk80w8r0H/kJk92+xELupmf5ykb/8r0Rzp0Upf4d5sAXN9OzNa5efCwVXL2JqMIInpNHKEvfqhw0IQX6Civ0BNcKdogIOBcDPNiog48PLXAKE0p4d+0Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781235964; c=relaxed/simple;
	bh=YmIT30wJVMHHDBOaAYxOWOsJy3qLJqGh5jo8uWSE3IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9asc+VXvcJFzLVJMFpuRnG6eRYx4x71VPMZKJaZAvgaTMH2lfQWZL1CcuBUjocv7ZICb9/wMVbqcRJXwmUMxEznAkwTH9UZRRmvlu06uyAhxS9GZmbnLH1Y7jKvcet4TPMm3CzBwOQsZ+1fuv2327QBIsO/ClM251Dn7SaRbaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=klgtFRZa; arc=none smtp.client-ip=180.181.231.80
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=Bhaujo1ehdyWC/DbtAq8rlj792b9Kpuyl7yql8WoRa0=; 
	b=klgtFRZa0JchY1z3u9Z+TRPFlWziQRUxg4swv9VF+nu0Ikw5OIxlVGmbjZhvO0nIQ5x1eEQ48vL
	6BX28lE+RUDaX8WMtbA9h89TdQm4OmBUGin2sI/PLeSOyX0De6Hqi/7544M81NJk9wawiTRP6eSfc
	U3CS675ZqCANKS6/pu7iQpd2eczvF681faprkBoVZDCabooknz4YDj7mrtt950pkDBAtzccwNO/jN
	xkt/EhWxcBmJkV1mN0fbQgJyk4tr/V141pMWKC0tsa5uBf2Oi9FjxIs9CE3a4Be2AxaE4QGdcX2aw
	cbGaalhlrdx4U2Bz1xSzEhAAZc6RdO6PNyIg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wXsq8-00000004mdI-3Me3;
	Fri, 12 Jun 2026 11:45:53 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 12 Jun 2026 11:45:52 +0800
Date: Fri, 12 Jun 2026 11:45:52 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Thara Gopinath <thara.gopinath@linaro.org>,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: qce: Fix xts-aes-qce for weak keys
Message-ID: <aiuA8CCGcfP6MdLy@gondor.apana.org.au>
References: <20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com>
 <20260610-qce_selftest_fix-v1-1-1b0504783a46@oss.qualcomm.com>
 <533motquixnbence674lawbnlnxevcrcnysymwncjis46j5uoq@wcemraangg63>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <533motquixnbence674lawbnlnxevcrcnysymwncjis46j5uoq@wcemraangg63>
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,davemloft.net,kernel.org,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-112841-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[herbert@gondor.apana.org.au,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:thara.gopinath@gmail.com,m:davem@davemloft.net,m:brgl@kernel.org,m:ebiggers@kernel.org,m:thara.gopinath@linaro.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71EC9676788

On Fri, Jun 12, 2026 at 03:40:49AM +0300, Dmitry Baryshkov wrote:
>
> > Fix xts-aes-qce behavior by using generic helper xts_verify_key() to
> > reject keys early with -EINVAL for FIPS mode active(or FORBID_WEAK_KEYS
> > set). For non-FIPS mode, since QCE hardware cannot accept the keys, use
> > software fallback mechanism to encrypt the data.
> 
> No, if it is a hardware driver, there should be no software fallback.

The driver must support everything that the software implementation
supports.  So if the hardware can't do something, it has to use a
fallback.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

