Return-Path: <linux-arm-msm+bounces-80524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295DC3953A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 08:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DFDB74F78DC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 07:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6C0280A3B;
	Thu,  6 Nov 2025 07:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="l4iK+ckC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972C127B4FB;
	Thu,  6 Nov 2025 07:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762412679; cv=none; b=PksQReWXLW3EjZKFHnW5PPg7BtzJy9RngRwV5vyAXcVdyOhF8VWcNMh4Uld5VbtPpz35IObFpLtLiGp/7ZmzBPmVrlbduyPscEE0gfNhWQGZ1MFAxDjrGaY0xJdmS8hsQA2sPxELbFdxm/d/3gR53YOarmiQVpepzO78Qxjveho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762412679; c=relaxed/simple;
	bh=aUM3igtBJFmfgzlP6SCib2HpUYHfqFt++iCsK8cSxy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CK7hKTxkmR+4ATRa1KhEzhQ95ek9zsYW1MT0VzF0Z4B55LhHWXP/Mba732Ug+Xx+EZ462FLntV1NOOOZPGtGtxGPSGeMjXvSPDo7pn+/qqqRp7ttLd6wTIIPxA+TFgPuGotQN57fI16eEHEhAayYELO1kA6qtSq9yLoOoFX3vMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=l4iK+ckC; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=H9nwZJbyKGZpfmt/47sR9DjnvJu5KLnr76lXv4pb71U=; 
	b=l4iK+ckCWdlGIFRLMPlI6ufc03N/mAMtspDSnnFtFu5Goy33FLH1Zyd6qj8IDWMockRynn8Nei/
	F4I4y4wiPgXQYdXYwu08SuYBuc9InlzyseJLcsjWtyLIScrkvmBd4KF4xGEWSs0Af4mJJB0zdZ4hy
	7hLs6vv/f2QoVIjY2uUQK8G889fO6/n3ZLlARLtjS+dOGMH/nb+zjYNRgq1FWr45mXazu7bVgLJHn
	z8td5InziNv1IKlzgy7lBxnB5na4juPxHENIZlLjstHJG7z+iUgwoogramMuM788bBftlTGwknTMT
	mnn4yftDXkk5buNuwzdlP6b4ASTla6IO5NEg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vGu2o-000rXP-2Q;
	Thu, 06 Nov 2025 15:04:31 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 06 Nov 2025 15:04:30 +0800
Date: Thu, 6 Nov 2025 15:04:30 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/3] Add Crypto support for Kaanapali SoC
Message-ID: <aQxIfiEHXDbsSVVu@gondor.apana.org.au>
References: <20251029-knp-crypto-v2-0-b109a22da4f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-knp-crypto-v2-0-b109a22da4f7@oss.qualcomm.com>

On Wed, Oct 29, 2025 at 01:25:28AM -0700, Jingyi Wang wrote:
> Add Crypto support for Qualcomm Kaanapali Platform including True Random
> Number Generator and Qualcomm crypto engine.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix title and commit message in patch3
> - Link to v1: https://lore.kernel.org/r/20250924-knp-crypto-v1-0-49af17a231b7@oss.qualcomm.com
> 
> ---
> Gaurav Kashyap (3):
>       dt-bindings: crypto: qcom,prng: Document kaanapali RNG
>       dt-bindings: crypto: qcom-qce: Document the kaanapli crypto engine
>       crypto: qce: fix version check
> 
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml  | 1 +
>  drivers/crypto/qce/core.c                               | 3 +--
>  3 files changed, 3 insertions(+), 2 deletions(-)
> ---
> base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
> change-id: 20251029-knp-crypto-e2323bd596e3
> 
> Best regards,
> -- 
> Jingyi Wang <jingyi.wang@oss.qualcomm.com>

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

