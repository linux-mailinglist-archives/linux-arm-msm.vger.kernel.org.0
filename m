Return-Path: <linux-arm-msm+bounces-58291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60546ABACEE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 02:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 872521784FC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 00:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A6F4C7F;
	Sun, 18 May 2025 00:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pb43cW6D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D1A3FE4;
	Sun, 18 May 2025 00:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747528295; cv=none; b=npsckWgL72v+CU0xdrdNGGQUGxSTexnfn8dpiCH4XogfHCNlix8O1mz2NLeKg/6vLcJCDwIU+OD50dysDpbDhYfWors9RoEiSkuyFu06BabYN0ZF79mPDCUAZk9dpMinJgbz74Dd1Te4Wr/Wqm3wOVLaruJJgnLThTnZMnXaEuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747528295; c=relaxed/simple;
	bh=4EjXNl9cem/bffRs5HKqI6E8Ik9puVECmh4sVeV1DuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iz5doM3SEp44cUjroBYGlFJ4j89TIJP/Ekp344UDALyhwx6Yj5d2ZKpwCcM24UMkR3HQ6sLB57FJFKENHqX2pd19/Xxiv/0cWeqoHJgAXp0163DCBdCvrZWz2Hq3BZorqz8wwhWuxys1ZOe+gLz7EgmXzrHQLlig/jCZCEr8c9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pb43cW6D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D1DC4CEE3;
	Sun, 18 May 2025 00:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747528294;
	bh=4EjXNl9cem/bffRs5HKqI6E8Ik9puVECmh4sVeV1DuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pb43cW6DfjFHAaZxI1aVKpz4vnE7yiDo5mZhGciMX2rpapZAi558v4KvDf9Zv30YW
	 ZRpHkpAc8EY3tU7KAO6ySZG7ZsYa00/FW0+4MOoG4UjgejBOcm3+7D3keHyTs03cGu
	 0BcmZaZlP0FmlG+0rz/ha2BKZNRteA4D7B1AIzOxtUz+NsUT2UtgOP6RyDhh2iRho2
	 L1DBv3cpiyYtNNL9B3MD6M7wLCsXquoA1zEYdvlwZ20tgeNYvW9yLeL7qcDNnL4KFt
	 Oqw+P7m3cFd6HA3tf3Yt8BrYFAUMDkuHXC7RFdrg1ngmHSJBAV8lAZabWon+phBEiD
	 VMok9chqkJRPw==
Date: Sat, 17 May 2025 19:31:21 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: i2c: qcom-cci: Document QCM2290
 compatible
Message-ID: <rfi4iw4gnws7twjvln7w6shwpg767gbanw5jt7zq2wwfnybff4@ov2iuxmyvd5y>
References: <20250414131115.2968232-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414131115.2968232-1-loic.poulain@oss.qualcomm.com>

On Mon, Apr 14, 2025 at 03:11:14PM +0200, Loic Poulain wrote:
> The CCI on QCM2290 is the interface for controlling camera sensor over I2C.
> It requires only two clocks.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Binding patches goes through the respective driver tree. Please resubmit
this with appropriate recipients. Once the binding is merged I will
pick the dts change.

PS. "b4 prep --auto-to-cc" would have done this for you.

Regards,
Bjorn

> ---
>  v2: Reorder commits and Fix binding testing syntax
>  v3: Add clocks minItems for msm8974 as top-level minItems changed
>  v4: change AHB clock name from camss_top_ahb to ahb 
> 
>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 22 +++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 73144473b9b2..83b13370ff6c 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -25,6 +25,7 @@ properties:
>  
>        - items:
>            - enum:
> +              - qcom,qcm2290-cci
>                - qcom,sc7280-cci
>                - qcom,sc8280xp-cci
>                - qcom,sdm670-cci
> @@ -44,11 +45,11 @@ properties:
>      const: 0
>  
>    clocks:
> -    minItems: 3
> +    minItems: 2
>      maxItems: 6
>  
>    clock-names:
> -    minItems: 3
> +    minItems: 2
>      maxItems: 6
>  
>    interrupts:
> @@ -113,6 +114,7 @@ allOf:
>      then:
>        properties:
>          clocks:
> +          minItems: 3
>            maxItems: 3
>          clock-names:
>            items:
> @@ -120,6 +122,22 @@ allOf:
>              - const: cci_ahb
>              - const: cci
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,qcm2290-cci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: ahb
> +            - const: cci
> +
>    - if:
>        properties:
>          compatible:
> -- 
> 2.34.1
> 

