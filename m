Return-Path: <linux-arm-msm+bounces-111399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wxZ0Guu2ImpRcgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:45:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3A9647D6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:45:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gondor.apana.org.au header.s=h01 header.b=en0nmYR0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111399-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111399-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=apana.org.au;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D61E303DD5C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 11:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8471C4CA279;
	Fri,  5 Jun 2026 11:39:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDF54CA26E;
	Fri,  5 Jun 2026 11:39:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659562; cv=none; b=PgknFlzy5oGylFvxUAhVpsuF2XwVr+i5nAEVuzFYp6hMd/XvljSWw9Rzy02fSNb5w0DSgztXHI+XGfWl5CmNRq49MdI8/AFXIqJ0V+8QdNZlPWJw6lirCaVploIsCff+OvLDXmmIoJX+X+FxvI8YAiPIorL1b6giUTtj3JaTA6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659562; c=relaxed/simple;
	bh=zqH0Q9ITwZQODfgiXtS4y+OJk5FtZCErLivlcfamoMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1hllozU1ofdB2JUxhTMW2X9eGBA5yIcfiaBA4xMDwafXQzA7vr8/k5PGvD7tYEdBROC8RIh1NOzG8RWiKqrWLv5uIUXpoOQ0EGB0NlzeaYeLGDHrYFqYmqmj2M65ZDDhsT8lLclxYVsDbZpdNmKN2q/heEtPftZhAuIZdsMVKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=en0nmYR0; arc=none smtp.client-ip=180.181.231.80
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=CHFPaICTJPqItjzPT3W6kuckW8eRD1ugtO9S1RGUb0U=; 
	b=en0nmYR0NtYoq2N/hRP19z/02wCbOpSkAmac2uob0FcV7wp+skXXBBBFQAA2dhUXsXsmsz+38I+
	8gCrPRppb7ohdmZ4CjVfanJMPCnhfg1bY3xO1pRGL8zeE1yiSK/oa9xBc+TN+47yn/7u+LBQhpM8f
	BBCRv0ftK1wIkllkFBlDq2RYvBovm6655DA8yw+VOeVZiplRsfGGX3I1xFOFe9vcdsLi81k3QEmDH
	17g2Owg4Yit88ZKvmxGLjH8dxMmJx5XwjT66yyfBGzQ40ov4MKXhczYwyY0aCNi3yh2zC2wt/ujT1
	ND9T95T178jCgz8V8ZPlMnzyGzSQxQE8vx4Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wVStN-002olC-2u;
	Fri, 05 Jun 2026 19:39:14 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 05 Jun 2026 19:39:13 +0800
Date: Fri, 5 Jun 2026 19:39:13 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] dt-bindings: crypto: Add Qualcomm Hawi crypto support
Message-ID: <aiK1YfeKShMTApph@gondor.apana.org.au>
References: <20260521-hawi-crypto-v1-0-9176a3b51bc0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-hawi-crypto-v1-0-9176a3b51bc0@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[apana.org.au,quarantine];
	R_DKIM_ALLOW(-0.20)[gondor.apana.org.au:s=h01];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111399-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[herbert@gondor.apana.org.au,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gondor.apana.org.au:mid,gondor.apana.org.au:from_mime,gondor.apana.org.au:dkim,apana.org.au:url,apana.org.au:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC3A9647D6F

On Thu, May 21, 2026 at 12:36:19PM +0000, Manivannan Sadhasivam wrote:
> Hi,
> 
> This series adds the crypto (ICE, TRNG) dt-binding support for Qualcomm's
> upcoming Hawi SoC.
> 
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
> Manivannan Sadhasivam (2):
>       dt-bindings: crypto: qcom,prng: Document Hawi TRNG
>       dt-bindings: crypto: qcom,inline-crypto-engine: Document Hawi ICE
> 
>  Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml                 | 1 +
>  2 files changed, 2 insertions(+)
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260521-hawi-crypto-138bfd2a6ec5

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

