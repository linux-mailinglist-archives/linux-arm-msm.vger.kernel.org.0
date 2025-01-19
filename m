Return-Path: <linux-arm-msm+bounces-45485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F3AA16039
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 05:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A3003A2CDC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 04:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D931465B8;
	Sun, 19 Jan 2025 04:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="qDI93WsX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2056229415;
	Sun, 19 Jan 2025 04:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737262181; cv=none; b=kQfbOfz6OrLifQC6Bf/G0zjUCYMKE9VCmtB0xd/0CMqUJOGxqQXbwSlwU9yvAlhpEr5vlBiLzzLprrjPYrK7GTKPq4Br6Bf1xaNw6BnF+EK/FRg4xO+zIGMlHpxM3i8YGa1wSZnmOSEi6NZiiUiwo2mvDrRalaXioKD+JrsqUXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737262181; c=relaxed/simple;
	bh=G0mEtf6sFabey0h87yztrKXIZJyk9owgdja9gfqrOo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdWCnKNvqH8QI+IxthXSh9KpRSJopbEV2Pr/oEEWaqGk308bz0P3YKKQBBk7v5xiPZXRcAW5i9Jy/m7Q6jfM9+xhPO20PkKJ1w00ub2NBVnuhkvbs0Alb/vk2uppKYJXdV9rEvMUlCO+kGgEB1YXbJGeLXhu818/orXlENXS3Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=qDI93WsX; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hn8TvoF3M0nwEiuHQZPt0xbeO5eOxJ2Yib43ffBbvXA=; b=qDI93WsXDo8iNYf84/liTTHzk3
	PEMSuN4LZ5vZsyv+ot/iluYCEbpxi+TBaCQs1wTpBMYX0oyoYvU87qru84X4Mx6JWwhvJ4I2Pomu7
	V7nwcu7TTAy3HqGz+o2KvLb+JvrUud+X1jEpNo0Wvi7XaPhmdpgSPSztFlfY249ko18Vl0iG7h4dS
	bLz5tfMJA8dmHy4kG2lbvjhfxRCHAUM3CqDGAN/dzIY2HQqUAnf6spKrIMvDHM5Q4hUvELoiRX69S
	AhrOtknaszu6sY2yBv3LXbLrP+3Tkv0oow1Nn+nlA44TmTy0tbM01HAOwFIldwZmGSU9Djidnqvpg
	bdK6ndFQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tZN2h-00AVZB-0p;
	Sun, 19 Jan 2025 12:49:33 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 19 Jan 2025 12:49:31 +0800
Date: Sun, 19 Jan 2025 12:49:31 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-crypto@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gaurav Kashyap <quic_gaurkash@quicinc.com>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sm8750: Introduce crypto support
 for SM8750
Message-ID: <Z4yEW4M_dqhEPxJC@gondor.apana.org.au>
References: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>

On Mon, Jan 13, 2025 at 01:16:20PM -0800, Melody Olvera wrote:
> Document and describe the crypto engines and random number generators
> on the SM8750 SoC.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
> Gaurav Kashyap (6):
>       dt-bindings: crypto: qcom-qce: Document the SM8750 crypto engine
>       arm64: dts: qcom: sm8750: Add QCrypto nodes
>       dt-bindings: crypto: qcom,prng: Document SM8750 RNG
>       arm64: dts: qcom: sm8750: Add TRNG nodes
>       dt-bindings: crypto: qcom,inline-crypto-engine: Document the SM8750 ICE
>       arm64: dts: qcom: sm8750: Add ICE nodes
> 
>  .../bindings/crypto/qcom,inline-crypto-engine.yaml |  1 +
>  .../devicetree/bindings/crypto/qcom,prng.yaml      |  1 +
>  .../devicetree/bindings/crypto/qcom-qce.yaml       |  1 +
>  arch/arm64/boot/dts/qcom/sm8750.dtsi               | 43 ++++++++++++++++++++++
>  4 files changed, 46 insertions(+)
> ---
> base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
> change-id: 20250107-sm8750_crypto_master-12e2fc2fcf32
> 
> Best regards,
> -- 
> Melody Olvera <quic_molvera@quicinc.com>

Patches 1/3/5 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

