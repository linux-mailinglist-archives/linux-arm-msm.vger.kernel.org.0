Return-Path: <linux-arm-msm+bounces-95932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCriLqq3q2n7fwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 06:29:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 424F522A3E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 06:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A993304CA43
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 05:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3FA34A76B;
	Sat,  7 Mar 2026 05:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="fXVndNcp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B9036894D;
	Sat,  7 Mar 2026 05:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772861308; cv=none; b=QLsqvmSaiwAVmYyEKeqMto/WmMRXW1FNpqwjEVJ7p3sU85z0OCCC9TXcVI3d5gKIoQwVd5YIeS1s1IqGo3twRySX4XIgYIJkGWg631Zj9mzVWa+syTHG29e0TOLVGTr8QKzzCcggDqntyw3YTaPZyJXgJ94NLimKkqOi9JQLcUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772861308; c=relaxed/simple;
	bh=OQNbLzyU3Qmf6r/JkKGRWkfEDA/7PAQQuo2Gn3W6BJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyxBlD+KAhFtd8NdlgQ/biiN/JjTM0vVpHMFoQ59p0JUFJEPELSyT02F+UPVu7rpCJFl4JSd4tg3SgddOEUf5rv08JNaJoy05WXIrvB0N44C3EvAD/MadxzgWsF1dUXz9fdLRyUyrISey+9cOCRiAojob2EwBXE5fQ6xK/NI5fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=fXVndNcp; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=yo+IddqOCrOr1IYUEm6NZ6DdLQMY9Wy4rdVxCyJhmkQ=; 
	b=fXVndNcpxKTn5xK1z1lOIwRIPB1RKDW4SyGoPNXMlQG5N7+T3j+MydEQ+H9JSLlgACtmJWLQ43i
	ljSl7Rg2WsU+UjBfLTBAtLemvDUEZEAkcbFg25W3YdEDakzpDwPI5X5MrbzkZdKw2L9M5AH1TwwNj
	ODi6UFnkmEXmmOM4250AZ6A4/EoMdIStSc0H105KFl7wtQ9Dmdbm9eMNRxMIlXdixhETX4GdpAqgl
	ilZoyQqmdlReymwUoj/VW2/+OnHngiSjxW7OEMBCNKEulNmZqXbKHxq1ET+VGTOqr3wuol3s1sLZO
	YAdPGZKnC02FAGb12znO39g2mQNF04Austug==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vykD5-00CJVz-10;
	Sat, 07 Mar 2026 13:28:20 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 07 Mar 2026 14:28:19 +0900
Date: Sat, 7 Mar 2026 14:28:19 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: crypto: qcom,inline-crypto-engine: Document
 the Eliza ICE
Message-ID: <aau3c8RwVMSkb1lZ@gondor.apana.org.au>
References: <20260223-eliza-bindings-crypto-ice-v1-1-fc76c1a5adce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-eliza-bindings-crypto-ice-v1-1-fc76c1a5adce@oss.qualcomm.com>
X-Rspamd-Queue-Id: 424F522A3E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[apana.org.au,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gondor.apana.org.au:s=h01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gondor.apana.org.au:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95932-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herbert@gondor.apana.org.au,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.978];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,apana.org.au:url,apana.org.au:email,gondor.apana.org.au:dkim,gondor.apana.org.au:mid,qualcomm.com:email]
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 10:44:02AM +0200, Abel Vesa wrote:
> Document the Inline Crypto Engine (ICE) on the Eliza platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

