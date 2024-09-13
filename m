Return-Path: <linux-arm-msm+bounces-31692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A21977D9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 12:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB64528A62B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 10:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3AF1D86E4;
	Fri, 13 Sep 2024 10:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="dcOugToG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE881D86D4;
	Fri, 13 Sep 2024 10:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223485; cv=none; b=GHDhaojhOCQ8vbsdnsD/CSqDl0cy1BH0r3Gd5/mE3kZvGy7Gbt4PsqPMIm29RrBX82iMMuJMVxVV6jPKerpWD8BKh56WfzVDPAkEoOvGvTmIvOOT1ehuiAhjOvLeZVDkw5n4TLwAh+g1IP0EmVPhYiXWr5h/jg//bPIjkMw1HvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223485; c=relaxed/simple;
	bh=7PC7dBsO5qdVJj9CUBwHk7MsyB3cbQSwmRq1M/Lstw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHquVlE4JU4cKyjC4skmNYHHY6S4HJQ5L0exbA4b6nWqlo5hMl8J5gRvnnRWpFIdKOmXvqbEmYtwc+K0Cu7mQyV3aaOGt+TEEixbDrawvsxuhthqC7CQcHnK4+g88qRqjrP6CUBHOnAi4rOlBWyOm1vJq8UvuBqJtIEZCCsUuuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=dcOugToG; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VP+/xz/zRmlGlWOlqk49bxIVVwjukdiFcru7Plei7HE=; b=dcOugToGenxuel3DOFxVhA1/jr
	gMO0lvyUIUOMzmZiFzUXAaoga5MQ/X16YL2RBGq4v7xqROkiJNYQxFUvqd3QjecjowtMfUyqNr7vM
	6X5MIhUvElmt4csGfCjfKywzRtW+2nmUDSbCwbfCoJPZe94EvSVnf0ozba7jZrCQ3CEjkVepTEWia
	Rnt9AVl5PLmLIvKeyaW3GZ7h1rBE7BLhPglFIytpZnOrJvcK1Tnjrkw9nmKATqdfuilSTJVBwQi2X
	KrPVrn6R2qZeE3qOxPZHCnOc+gHrM0mgj5Wib7bFgaKJoZA5DSXF8/rvLCdxUxa8knt7rMGNpE8DH
	WpggVSxQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1sp3QD-002Dv2-2s;
	Fri, 13 Sep 2024 18:31:16 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 13 Sep 2024 18:31:15 +0800
Date: Fri, 13 Sep 2024 18:31:15 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@quicinc.com,
	quic_psodagud@quicinc.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: crypto: qcom,prng: document support for
 SA8255p
Message-ID: <ZuQUc3hWESCELCLx@gondor.apana.org.au>
References: <20240905190605.3770972-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905190605.3770972-1-quic_nkela@quicinc.com>

On Thu, Sep 05, 2024 at 12:06:05PM -0700, Nikunj Kela wrote:
> Document SA8255p compatible for the True Random Number Generator.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
> 
> Changes in v3:
> 	- Removed the patch from original series[1]
> 
> Changes in v2:
> 	- Added Reviewed-by tag
> 
> [1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
> ---
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

