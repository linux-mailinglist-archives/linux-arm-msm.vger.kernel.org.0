Return-Path: <linux-arm-msm+bounces-87312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DBCCF01E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 16:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 857D53002281
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 15:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755C01EC01B;
	Sat,  3 Jan 2026 15:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OaPcPNzG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC0B1A9FAF;
	Sat,  3 Jan 2026 15:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767454273; cv=none; b=q+oFXIbTWQh17ZGGJTFt5pb5F6TBC9M0fqd+JyJycrYRBpwmMuK9ogGzDxLAOlRziwGKNUMWi1nNc+oe+0tqVn/0/wwr4f0qVeeB3nMGuBD7zZGryxAGM1PJC/LqvE1hgyZgNNmrnl+QqGZhfeA9XDafsKn+kOVqiS/bSLcwVGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767454273; c=relaxed/simple;
	bh=kl6qTPp3RSkSjEuA9MaghL6DrnrfjFyfW8WoI0NBE0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQHAR2JfSTLbgManGYwfZsEY7sRKbw4B/3geP/gaR3kVhhAalBU0mtZaL54Eg2D6g9JMfvZOHXabXrRF+HvRGG6QAFdiRyDZv9c0tIk+hpN/vWKyeI3mN2miDx3IJ48TYgkIdhb3XUbun73LqihAzExPy70bq84j0h1DSUpJaS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OaPcPNzG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C21C113D0;
	Sat,  3 Jan 2026 15:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767454272;
	bh=kl6qTPp3RSkSjEuA9MaghL6DrnrfjFyfW8WoI0NBE0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OaPcPNzGhiI60ViGZyqcrWIcM1V381NPIDI7KcgpfwswOxmaFECuJWDK4Cki6c19J
	 6dXWzq8HXPJP3aUrFz1tXbHkS7Z7WAyT7cV2F0A5nyyr5ezoen5i9OFkRtQ9xq24ym
	 gsTVSXU4vCBRho+eVTWpv0yP1yO5rcSYOu33zm8aPtjahAyLYAtpsVpj0XkX6R9iRD
	 YUmdNeXac7j3vRuWcZ1LLMPf6tQ3ZCF7kBsp7e8+pGcKPFkhIYaovZ2wVhggEdS/tP
	 Fp3+ZleQIbjoNLUPDU0y+eQXo57epGH9UjdcwwaY9I/C6kPJ7AhQMkGs+TEVkNdob6
	 IeKWWU6gg7ilg==
Date: Sat, 3 Jan 2026 09:31:09 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,adsp: Allow cx-supply on
 qcom,sdm845-slpi-pas
Message-ID: <wj62mko4bmt7xyr4rqssgegkkdndwyxobyqwo3q7iff5cu7b6s@4pgat7y366mx>
References: <20251229152658.284199-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229152658.284199-2-krzysztof.kozlowski@oss.qualcomm.com>

On Mon, Dec 29, 2025 at 04:26:59PM +0100, Krzysztof Kozlowski wrote:
> One SDM845 board uses cx-supply, which is not allowed by the bindings,
> as reported by dtbs_check:
> 
>   sdm845-samsung-starqltechn.dtb: remoteproc@5c00000 (qcom,sdm845-slpi-pas): Unevaluated properties are not allowed ('cx-supply' was unexpected)
> 
> The SDM845 SLPI binding already allows lcx and lmx domains, thus the
> cx-supply seems like a fake name for something else, e.g. some
> enable pin.

We've seen a few other cases where specific rails are powered by
external LDOs, instead of the rails represented as RPMh power-domains,
but I can't see that this would apply for CX.

> The qcom_q6v5_pas.c driver parses cx-supply, so it is an
> established ABI, therefore document it for this device only.

This part of the implementation is a remnant from times before we had
decided to represent the corner(level)-based power rails as
power-domains (and iirc some older platforms still need/expect this).

Regards,
Bjorn

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> index 137f95028313..16a245fe2738 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> @@ -32,6 +32,8 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  cx-supply: true
> +
>    px-supply:
>      description: Phandle to the PX regulator
>  
> @@ -159,6 +161,9 @@ allOf:
>            items:
>              - const: lcx
>              - const: lmx
> +    else:
> +      properties:
> +        cx-supply: false
>  
>    - if:
>        properties:
> -- 
> 2.51.0
> 

