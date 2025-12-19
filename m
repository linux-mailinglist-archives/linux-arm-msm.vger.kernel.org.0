Return-Path: <linux-arm-msm+bounces-85788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5F4CCEBA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 08:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9609303C9ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 07:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8C02C11D9;
	Fri, 19 Dec 2025 07:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="SNSdODFh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497D718DB2A;
	Fri, 19 Dec 2025 07:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766128199; cv=none; b=DHnVRmhj3zj+k/H0E7CgSOIVdsqgJmRMORc0IfEcaDserh/mYXrYh6FDUeDH/cZITpaH2lf2gqc/KA/uXSOaKCU0pqRk1h/UPHAgy+kMRmMuhor0VH4V7aCoebYlbk71A8iplgErQeoyCeBiuQZPHMz07MfcsBrCEewVBJ4TLp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766128199; c=relaxed/simple;
	bh=dA8RvCsjKhU+EjuQTQcbsQQJZrnPaP6jX3HEHsmfXRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFQkbyjnIkD1jmnZ5mXObY7WBhnDgNkd3s63zNRp+235nYLKCTKMqruDt7GE6/dfnh9cpRC2unzgopwV3HLyIaBSj+KvWfpOE9YLAPavkjBNjw58QssL4QXsrtRSq7fpK+OZ8lkld4pO3ZTUDsQzyymhcc14jB6YaaVxpwFVXiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=SNSdODFh; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=a3QriGnReRaL4Qt11/fH4kIQ67VwFXEXeX4m5RfeUoY=; 
	b=SNSdODFhcNH4/kEbTQ691HMkXfhEm3ZmzXFaGO1vBup4iuwDjvrYDzLRddTlcr2sLNvH2F6V8fM
	zRkbkqbjYvlBoLgUTlPtGUSHpMtYpcyd9Y2gGxj9wi+LOIWq28i57vQ1xPWM+rBO2gb8b9oooNMdF
	cyKYhP/3udvwrRdpGatC4oBK2j6fDsK6Fy1R1kYX9GKi41uliF0vMjJFgNZBDDIO/PXy2wWqTlmHv
	my/rAl0kIO0nUyuZqnmdS7lSbAOaLrHsYwsibei1kfqIouypMAQktqmxyCqhiyy526ksq0Ci5iaYH
	RaQNynDy4Tzv1orOnEPzqQf1/rZp7JEhFaNg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vWUcY-00BEjm-17;
	Fri, 19 Dec 2025 15:09:51 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 19 Dec 2025 15:09:50 +0800
Date: Fri, 19 Dec 2025 15:09:50 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: crypto: qcom,prng: document x1e80100
Message-ID: <aUT6PoHe5nLOhfCL@gondor.apana.org.au>
References: <20251211-trng_dt_binding_x1e80100-v3-0-397fb3872ff1@oss.qualcomm.com>
 <20251211-trng_dt_binding_x1e80100-v3-1-397fb3872ff1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-trng_dt_binding_x1e80100-v3-1-397fb3872ff1@oss.qualcomm.com>

On Thu, Dec 11, 2025 at 02:14:59PM +0530, Harshal Dev wrote:
> Document x1e80100 compatible for the True Random Number Generator.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

