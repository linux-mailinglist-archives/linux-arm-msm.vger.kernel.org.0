Return-Path: <linux-arm-msm+bounces-63150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02560AEF0A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FB171BC0409
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 08:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370E5269AFB;
	Tue,  1 Jul 2025 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKxOAGae"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE83B7260F;
	Tue,  1 Jul 2025 08:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357672; cv=none; b=tKt3dIq/rDz4eWzqYn1sBnw4qxkU1VS4XZc4tDStUz/xkteSvH7evX5UEyVmxewuxOiR+89gMziJFuwwRgoSzLm5Ee8bfRXgJ5zE3LhqccPFqIg7VrFOFQhnbGRc4GY/5q8V/SkJCy/9RXi5FEPmnKXRaptlQpRAbkKTPomAY4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357672; c=relaxed/simple;
	bh=m3xTmeT9xAZJZSYGiaGAJzohl2IuNuPGb+faV7IR8K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHQnoiXJND14LWq+V3Wr4U+ZZQeyAvTgPpD+03m1mtA46bv1dc3MGp6EQrZ10ZkAx52CCPAUMSQBmGaSt2zQ4hcdR7TOvhLxYJjruJlIF6dSyvV/cE917VIVPqxF2eSiU28q+CajFDb/VGh3wlA+zU5dBEoie+h2IrnupCKLrg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKxOAGae; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983CDC4CEEB;
	Tue,  1 Jul 2025 08:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751357671;
	bh=m3xTmeT9xAZJZSYGiaGAJzohl2IuNuPGb+faV7IR8K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MKxOAGaeknCUA88rwzsYTJ8GpOdOuKFGoIjsiq5ix5S24wxpyhjMbmA4gmy//wSlp
	 +PaPbYqbGGarQPnbOstgY+GeqcnxzzdfCFqOqzFVEViNbQ9O4IfqJCJoD/4wad9O2b
	 tCJ4UtgLE8/xGf5fNwlcNJlcvVyaYXZ1Nv9iVq5DLyChHVhYerORqSVXysFJQMmLXX
	 hvJEu3lzNB+qXpGewgGLpeyb+IaELZYA+T9v1uYIjx4xtqdX5n4fpTMmWM+Jkd0I1X
	 SVvMhXgls9Yb8GfnN2+5k2vcwrpfhStKfsHJ/IQq9e7JAnb+DGlvDXGjT4vYt9h7cS
	 15/UOZnIKATdg==
Date: Tue, 1 Jul 2025 10:14:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,sm8550-pas:
 document SM7635 ADSP & CDSP
Message-ID: <20250701-pretty-vivacious-panther-540ff4@krzk-bin>
References: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
 <20250627-sm7635-remoteprocs-v2-2-0fa518f8bf6d@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627-sm7635-remoteprocs-v2-2-0fa518f8bf6d@fairphone.com>

On Fri, Jun 27, 2025 at 08:55:43AM +0200, Luca Weiss wrote:
> Document the ADSP & CDSP remoteprocs on the SM7635 Platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index 2dd479cf48217a0799ab4e4318026d8b93c3c995..44cc329be5067ab6cbaa0a467669cb3f55c7e714 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -18,6 +18,8 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,sdx75-mpss-pas
> +          - qcom,sm7635-adsp-pas
> +          - qcom,sm7635-cdsp-pas

I don't understand why this is here and mpss and wpss are in other file.
It is supposed to be in one binding file, especiall that:

>            - qcom,sm8550-adsp-pas
>            - qcom,sm8550-cdsp-pas
>            - qcom,sm8550-mpss-pas
> @@ -165,6 +167,24 @@ allOf:
>            minItems: 5
>            maxItems: 5
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,sm7635-adsp-pas
> +            - qcom,sm7635-cdsp-pas

it does not fit existing cases!

> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 6
> +          maxItems: 6
> +        interrupt-names:
> +          minItems: 6
> +          maxItems: 6
> +        memory-region:
> +          minItems: 2
> +          maxItems: 2
> +
>    - if:
>        properties:
>          compatible:
> @@ -185,6 +205,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,sm7635-adsp-pas
>                - qcom,sm8550-adsp-pas
>                - qcom,sm8650-adsp-pas
>                - qcom,sm8750-adsp-pas

sm6350 fits, doesn't it?

> @@ -239,6 +260,22 @@ allOf:
>              - const: mxc
>              - const: nsp
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,sm7635-cdsp-pas
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: CX power domain
> +            - description: MX power domain
> +        power-domain-names:
> +          items:
> +            - const: cx
> +            - const: mx

And again this is like sm6350 :/

Best regards,
Krzysztof


