Return-Path: <linux-arm-msm+bounces-31813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9885979DB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 11:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCD6F1C2260D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 09:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE5013DB9F;
	Mon, 16 Sep 2024 09:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0H/SP3u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BBCDDA6;
	Mon, 16 Sep 2024 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726477328; cv=none; b=hKFKm71T2IbiAoXRGsArdBGoI3Nq/m+gF94bFedt4BQHhxnn9eMmRO11xsdmtZaKGVZsPHaqi7Su/a0a5EGtiKLkWl2WkZRzS5iJprNgXRD1IBvqcCiY7AMO8Uh9YxiqCb7Hl07vOf2O9mQyC5sCHj1e2c64SjeTxQ3vLY/OXjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726477328; c=relaxed/simple;
	bh=nGalXd4hLdBcDXpUx4Pm4IGhmMC2B6uxDBACi78ckAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSUzWyNtQf++td3UB8ER0iPW70Mqk197YnTi/+e9KkfxZWSzMeugI3hOqwnTsv569hnKTBGs53DpgppR38yYh/zCVY62JjECJ4EDjm2UHCA2mGnfNatPz5tfJWLn/we0IeK7Qttiuy/CdhDHEBgQ3YkUoqo2NFGiZA9Bz8jbBrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0H/SP3u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA1CC4CEC4;
	Mon, 16 Sep 2024 09:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726477327;
	bh=nGalXd4hLdBcDXpUx4Pm4IGhmMC2B6uxDBACi78ckAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a0H/SP3uX90N7EafCwxR82JwCaOQOyyIcX253+yz4Q+nHAotwPFnGCDRtebD9OFpg
	 BLXrpXABQei3HwZtSqdv5RfJLl1LJPVsdF5bwQ+0BWpm0KXxpqVSwdZJvldl2DODn0
	 cpWXPzyvlcjBnvYigHuiyDN3ix0WU/d+UT1VjgigxgkBL8HnBxuBLvidmNh2vTC/Q0
	 FDm4YeFkj4lA1xgT+qdpK/8P5lMitsaOfBAlGs30/jsIrguGk+TKtRq5uIz+eBrOXS
	 SuO/c9GTfM0dQn862rntPPIcrkerSKyJtB1T6nkguGjaQvRRKEwxUcE72HZBKj3HMy
	 eOWkjwHhhE56w==
Date: Mon, 16 Sep 2024 11:02:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: coresight: Update the pattern
 of ete node name
Message-ID: <jlr7j3sqjjrf7a7ttttwe7luud3nuuxo43s62iumlq3p3qe2x7@2jcpcjq5vnc7>
References: <20240913092430.31569-1-quic_jinlmao@quicinc.com>
 <20240913092430.31569-2-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240913092430.31569-2-quic_jinlmao@quicinc.com>

On Fri, Sep 13, 2024 at 02:24:28AM -0700, Mao Jinlong wrote:
> The device full name is embedded trace extension. There is no good fit
> in generic names list for the embedded trace extension. ETE is abbreviation
> of embedded trace extension and the number is the CPU number that ete is
> associated.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../bindings/arm/arm,embedded-trace-extension.yaml          | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml b/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
> index f725e6940993..0a88e14e7db3 100644
> --- a/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
> @@ -23,7 +23,7 @@ description: |
>  
>  properties:
>    $nodename:
> -    pattern: "^ete([0-9a-f]+)$"
> +    pattern: "^ete-[0-9]+$"

-[0-9]+ should be optional, because you could have just one ete, right?

^ete(-[0-9]+)?$

Best regards,
Krzysztof


