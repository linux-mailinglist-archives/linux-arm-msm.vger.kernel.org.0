Return-Path: <linux-arm-msm+bounces-49283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B17A43E24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 12:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4F0D17137F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F69526869E;
	Tue, 25 Feb 2025 11:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jOiyrIO+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B4F268692;
	Tue, 25 Feb 2025 11:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483990; cv=none; b=VX60JwyqnuJUrklsFIVJtRWh/Jc05cDyAnQYHXWvKrytZSJe3Z+mDMWpT3qJfgmgldHNU5WQkXA8YFKXhQvtgxxKkk0gSu55twHiDU//uC4bzbcp8BDvPSeDmOjhx/TNMpHnHYRPvPmtPfr8Cwr2Sz3Bwi6KZX5hH3Nu5fZEwCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483990; c=relaxed/simple;
	bh=4IIRoh5wb+/jIFP4g7aKueshVyB+l000sg+l64SSteI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4g/IP69IWy8JlYaH/oIHkGNq50ylo4l0pkDgaGBCmIY+Z10YvrM3dN07q//Er6ddg88YDtdx6jT2EVncrWQeMp3zGOo9qTrrLVXc0lSBlU8wDJewUs8mVPusiK1B6mo5CxR3H73pIIXYtdieKRGrpVW20+jlgVBSJYf0lXKoxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jOiyrIO+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92D7C4CEDD;
	Tue, 25 Feb 2025 11:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740483989;
	bh=4IIRoh5wb+/jIFP4g7aKueshVyB+l000sg+l64SSteI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jOiyrIO+unuve0eE7gyGrpzrY1t0WNOSfUpUXflagWiw1Wj+TfYH5+Gf6VghbxTRy
	 lGVTtdUWHkiBQDmRih8snkWBDO+rI3j1anTpXteFXmxn585+oREVOnPZeh4+k/PsOh
	 UXLIwJ1f8UJjC/a/FplnZrWb1APIe16KtPG63u+BjhLmgq0V7U/fk58FwQQi/GsnF9
	 jB4ZuVNweDB+2m4RWjwnDLn2huExQin9znUa3+keWKJ/yDGy1DXLVfN5hks64pP+vx
	 Ea7TMIJw7sbjyaRvxdu+dHiFRM2QpHznJMW2sxsVySk3R/ehtXDJPMG981GSujsr29
	 BNFDAW4pKxL9A==
Date: Tue, 25 Feb 2025 12:46:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: snps-eusb2: add exynos2200
 support
Message-ID: <20250225-conscious-spotted-ape-a71edd@krzk-bin>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-3-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-3-ivo.ivanov.ivanov1@gmail.com>

On Sun, Feb 23, 2025 at 02:22:21PM +0200, Ivaylo Ivanov wrote:
> Exynos 2200 makes use of the Synposys eUSB2 IP, so document it in the
> binding. Unlike the currently documented Qualcomm SoCs, it doesn't provide
> reset lines for reset control and uses more clocks.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov@gmail.com>

Mismatched sob. Be sure you run checkpatch before posting.

> ---
>  .../bindings/phy/snps,eusb2-phy.yaml          | 64 +++++++++++++++++--
>  1 file changed, 57 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
> index 22c77968f..f4164db71 100644
> --- a/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
> @@ -23,6 +23,7 @@ properties:
>                - qcom,x1e80100-snps-eusb2-phy
>            - const: qcom,sm8550-snps-eusb2-phy
>        - const: qcom,sm8550-snps-eusb2-phy
> +      - const: samsung,exynos2200-snps-eusb2-phy
>  
>    reg:
>      maxItems: 1
> @@ -31,12 +32,12 @@ properties:
>      const: 0
>  
>    clocks:
> -    items:
> -      - description: ref
> +    minItems: 1
> +    maxItems: 3
>  
>    clock-names:
> -    items:
> -      - const: ref
> +    minItems: 1
> +    maxItems: 3
>  
>    resets:
>      maxItems: 1
> @@ -58,11 +59,60 @@ required:
>    - compatible
>    - reg
>    - "#phy-cells"
> -  - clocks
> -  - clock-names
>    - vdd-supply
>    - vdda12-supply
> -  - resets
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm8550-snps-eusb2-phy
> +
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1

I don't understand this. What's the top-level value here?

> +
> +        clocks:
> +          items:
> +            - description: ref
> +
> +        clock-names:
> +          items:
> +            - const: ref
> +
> +      required:
> +        - clocks
> +        - clock-names
> +        - resets
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos2200-snps-eusb2-phy
> +
> +    then:
> +      properties:
> +

Drop blank line

Best regards,
Krzysztof


