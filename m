Return-Path: <linux-arm-msm+bounces-118621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A69uAKFeVGrclAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 05:42:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 555A1746FAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 05:42:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gondor.apana.org.au header.s=h01 header.b=Qb2bWov7;
	dmarc=pass (policy=quarantine) header.from=apana.org.au;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118621-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118621-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A749C300F57C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 03:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B236333A00C;
	Mon, 13 Jul 2026 03:42:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADAC1F3BA4;
	Mon, 13 Jul 2026 03:42:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783914139; cv=none; b=Bg6KOGFUXi1nKciSoIdFdQ8z5MLBTiDvGthv2sdBNyjMWyM3zuk74GC2JGIbb5u2z+E66503kSkVuRl5bpRe86EA3tEoOB4uKzAqzg8HLnvXBk4a+99Eop15iI/gK3EZOe02CDEbkOjpLv6mXbTt7w0GIm0QaV89+NAETCLUbeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783914139; c=relaxed/simple;
	bh=viFaBWiMYiXNWA4jLXpBiJLpNrYbbMfjMI1CIpubu4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVgTCtVtv8SYyLkyKmWbyuETpfml/lkgZ1WmWVQcvkAA0aA9/mKPA98BaVOesyYMOD5NSNCdO6ijJOysd0/578+C+MitO/G6pw+3vGycidzneex0MuWGKQiqPeATXmnRFp9QGtlkXJeLKzOzF7qhmnU+zZ2jzqjU7GMyN7VR+d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=Qb2bWov7; arc=none smtp.client-ip=180.181.231.80
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=89rWfb/GKA0YbwlF/rC1Uqb+AHHDfcTsgnf6prS00ms=; 
	b=Qb2bWov7fDBLJ4II8sHjsLbeIXS4BXEzwIlOgSn1BDBcp1Vkbk9yo6voNd5z1BnQaDm8W8bfCHd
	6oWRW1VN1NYQYo93R6N9AsmmaOoB3y1Oo77s1Z4cyz0khXh+AnHUmHOKi8URHGJhKGnu7F7lXgtAM
	U2spVQE/Ax9CwwX1VQF9iUSRDTTyXpHpWLpb9aqQqnIOWDJ5gVTcQfNwBzRztQ2ZFmVEoAakRC5AD
	nz9LzgWWhBTq+8UuLXPQ17GIcDCVFRMopIY0NkTkHwICMORLitb42bdHqebl4sPB/vZpmoKlm5qgo
	fjWbWEw6hABQ1T1+auOa2NMplNFQ2I5NJLMw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wj7Yb-0000000CyEH-3axH;
	Mon, 13 Jul 2026 11:42:14 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 13 Jul 2026 13:42:13 +1000
Date: Mon, 13 Jul 2026 13:42:13 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] dt-bindings: crypto: Add Qualcomm Maili crypto
 support
Message-ID: <alRelRyJDvTdNTgJ@gondor.apana.org.au>
References: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[apana.org.au,quarantine];
	R_DKIM_ALLOW(-0.20)[gondor.apana.org.au:s=h01];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118621-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[herbert@gondor.apana.org.au,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gondor.apana.org.au:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,apana.org.au:url,apana.org.au:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 555A1746FAD

On Sun, Jun 28, 2026 at 11:44:34PM -0700, Jingyi Wang wrote:
> Add crypto(ICE and TRNG) dt-binding support for Qualcomm upcoming Maili
> SoC. Meanwhile fix the power-domain and clk missing on Hawi.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Changes in v2:
> - add power-domain and clk constraint
> - add acked-by tag
> - Link to v1: https://lore.kernel.org/r/20260609-maili-crypto-v1-0-0f577df56a61@oss.qualcomm.com
> 
> ---
> Jingyi Wang (3):
>       dt-bindings: crypto: qcom,prng: Document Maili TRNG
>       dt-bindings: crypto: qcom,inline-crypto-engine: Document Maili ICE
>       dt-bindings: crypto: qcom,ice: Fix missing power-domain and iface clk on Hawi
> 
>  .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml          | 3 +++
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml                | 1 +
>  2 files changed, 4 insertions(+)
> ---
> base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
> change-id: 20260609-maili-crypto-5d612f629acf

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

