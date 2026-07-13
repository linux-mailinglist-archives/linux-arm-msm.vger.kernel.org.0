Return-Path: <linux-arm-msm+bounces-118622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ySU+AoVfVGoIlQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 05:46:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 881C2746FE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 05:46:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gondor.apana.org.au header.s=h01 header.b=k6xQvjpo;
	dmarc=pass (policy=quarantine) header.from=apana.org.au;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118622-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118622-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFF38300D173
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 03:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66EBF2D7DEA;
	Mon, 13 Jul 2026 03:45:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECB522ACFA;
	Mon, 13 Jul 2026 03:45:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783914357; cv=none; b=lFnFRVLnt0+IoMVsOvxeApA/I5rgrRBvuj/HNvzNGzbhWF7Ei/rtClHoItRxSNbh+3taLHk1umhXH2iQNHMzboUcuhFLE3XCQapC6MjS1WRZr38S6ujrfU9vZnPEhMk7joMO2rwFhNMpv05oV6qd9mT1U4yyQMjT2AAkP8elFUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783914357; c=relaxed/simple;
	bh=nqwL40z1GTr2J8/1BOTngHI0QMaBpv3qFaA9UB1BoYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osnunMaxMwhYQ/MlUyRoJBrbwQcg8A2c8AtnbbZkc4JlmASTWoc+NylErqPIdjC4zVg0ElDV8R10hfkEkYvYkrp9AqNoUCPxTHZpqtqoQf1IX1ftcH4ntpCB1i+XbQZPuEIK/Q05e3mU1XkqRqJI14BKk7SgOKqE74JOUCj5ESw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=k6xQvjpo; arc=none smtp.client-ip=180.181.231.80
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=zaWywlLBfxdm0soL44oF7RmWKFaPEOc18ilbGgDmy+w=; 
	b=k6xQvjpoOxPu5foZkK9BbGb2knUyFMlHThX8aENFmiuuySagt9lWqBqGB0Z3gSOyT5cdHCpAt3u
	ZuZyW594Pb12eZbQ6KiyKlaIwQP1aT8qYgcb1f6Iidt9LEKnhfh2ccMFjgfqFrJFEri+LSqnTeRbW
	XrT/wTvnvs2rMMZWzjBkqDchDbWwX2Q3X35kdkk7lUiHxwReG9POliuQCjBikAXGIfZp6BF+/jfPf
	OFj4o1G54EcIrXrbJvViM1ec6PpqAM6gExfZsOUuEbh2HvdMH9jXBbPfUYjopuPv8Kcvf4fEdE2GD
	ec0JaqU1TB5RcUqKwOLLWlOZNnh0wTCAEatw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wj7c8-0000000CyHt-0yMy;
	Mon, 13 Jul 2026 11:45:53 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 13 Jul 2026 13:45:52 +1000
Date: Mon, 13 Jul 2026 13:45:52 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: Re: [PATCH RESEND] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Nord ICE
Message-ID: <alRfcKxddHBYztMD@gondor.apana.org.au>
References: <20260704004408.2303468-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704004408.2303468-1-shengchao.guo@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[apana.org.au,quarantine];
	R_DKIM_ALLOW(-0.20)[gondor.apana.org.au:s=h01];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118622-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:deepti.jaggi@oss.qualcomm.com,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[herbert@gondor.apana.org.au,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gondor.apana.org.au:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herbert@gondor.apana.org.au,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gondor.apana.org.au:from_mime,gondor.apana.org.au:dkim,gondor.apana.org.au:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,apana.org.au:url,apana.org.au:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 881C2746FE4

On Sat, Jul 04, 2026 at 08:44:08AM +0800, Shawn Guo wrote:
> Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> It was included in the Nord SA8797P DTS series [1] due to that
> the prerequisite changes were picked up by Bjorn for 7.2. Resend it to
> Herbert as the dependency is gone now with 7.2-rc1.
> 
> [1] https://lore.kernel.org/all/20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com/
> 
>  .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml   | 2 ++
>  1 file changed, 2 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

