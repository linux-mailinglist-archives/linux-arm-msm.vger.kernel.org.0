Return-Path: <linux-arm-msm+bounces-66440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6E9B10354
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 10:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E20051C801B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 08:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41D92749F8;
	Thu, 24 Jul 2025 08:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAzLCrI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720882741B1;
	Thu, 24 Jul 2025 08:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753345086; cv=none; b=m3GcjrdybnF0vEMBgjbRmreMysZNESVa4yOafK3hREseOyCAmlcRcoN6YWDa6+6oD7tZFuXmFT3HY/LhekDFhPbZO5pc0DYAcnJ8dbuUA3NVAPpuy8i0bH+4zfRvi4tQVK9C4I+pejIg6q9u0A+qnbDixkQ5Z3xSLATTD3ZwNq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753345086; c=relaxed/simple;
	bh=OL9bBpIegpyWIY833O11UHbhceAp80SpQbly2RuewQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLjRkGC1GrjcTuDpes9UbGrQie82cJXcTzfhHxyPDOde+RnWI9DdQ2ziJ0pf+ZOG+n9chORW3ZtBglknorQSJCV6nFOwTkyyGTqlLQgJhnhYoMzYgzAhkBtZI+BDOtfBFZqL5OLligiITr2OMPITjNNpVBSKEJvVyK8/YvZ6wzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAzLCrI/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 707F6C4CEED;
	Thu, 24 Jul 2025 08:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753345085;
	bh=OL9bBpIegpyWIY833O11UHbhceAp80SpQbly2RuewQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GAzLCrI/PqXie1AHtKRR9uuKU0WJYsRN0VNr/7uJWdIStT5vNl40ZH4x1vXOKuJAW
	 dq+bQKnZVX9dOsbXLV41nWsD/abCalVd8ltVnbHe94IVwu3RwRbMd395W/vcVUxctK
	 aeuQNhRkhQE0obYfs+Rx8SYmDkD3CCIAGePxpQoBSRg2C3XBkaLCARrlYj7KEbs8vy
	 zPi0iowVFiBNiCnFiyxCPKwHBNPYr1lXGPRJmFNAu8SEL8BkIGfZa5SXlQtg3aNE1k
	 ogVsvJeLkNXs4XRuGubXa6JQSYHyMX1CVXH994VZU9MVRyNgjwyKl2g+crFX29NAvR
	 3tDZWTVKndB4w==
Date: Thu, 24 Jul 2025 10:18:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom: Add SM8750 GPU clocks
Message-ID: <20250724-blazing-therapeutic-python-1e96ca@kuoka>
References: <20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com>
 <20250723-topic-8750_gpucc-v2-1-56c93b84c390@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250723-topic-8750_gpucc-v2-1-56c93b84c390@oss.qualcomm.com>

On Wed, Jul 23, 2025 at 10:38:48PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The SM8750 features a "traditional" GPU_CC block, much of which is
> controlled through the GMU microcontroller. Additionally, there's
> an separate GX_CC block, where the GX GDSC is moved.
> 
> Add bindings to accommodate for that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  5 ++
>  .../bindings/clock/qcom,sm8750-gxcc.yaml           | 61 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,sm8750-gpucc.h      | 53 +++++++++++++++++++
>  3 files changed, 119 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> index 02968632fb3af34d6b3983a6a24aa742db1d59b1..d1b3557ab344b071d16dba4d5c6a267b7ab70573 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> @@ -20,6 +20,7 @@ description: |
>      include/dt-bindings/clock/qcom,sm8550-gpucc.h
>      include/dt-bindings/reset/qcom,sm8450-gpucc.h
>      include/dt-bindings/reset/qcom,sm8650-gpucc.h
> +    include/dt-bindings/reset/qcom,sm8750-gpucc.h
>      include/dt-bindings/reset/qcom,x1e80100-gpucc.h
>  
>  properties:
> @@ -31,6 +32,7 @@ properties:
>        - qcom,sm8475-gpucc
>        - qcom,sm8550-gpucc
>        - qcom,sm8650-gpucc
> +      - qcom,sm8750-gpucc
>        - qcom,x1e80100-gpucc
>        - qcom,x1p42100-gpucc
>  
> @@ -40,6 +42,9 @@ properties:
>        - description: GPLL0 main branch source
>        - description: GPLL0 div branch source
>  
> +  power-domains:
> +    maxItems: 1

This should be a different binding or you need to restrict other
variants here.

> +
>  required:
>    - compatible
>    - clocks
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8750-gxcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8750-gxcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b900c19156f5a2ba4e0f7c95276c771f615fdf23
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8750-gxcc.yaml

There is nothing for clocks in the binding. Place power domain providers
in their directory.

> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm8750-gxcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics Clock & Reset Controller on SM8750

There is no clocks nor resets here. Only power domains.

> +
> +maintainers:
> +  - Konrad Dybcio <konradybcio@kernel.org>
> +
> +description: |
> +  Qualcomm graphics clock control module provides the clocks, resets and power

Also confusing.

> +  domains on Qualcomm SoCs.
> +
> +  See also:
> +    include/dt-bindings/reset/qcom,sm8750-gpucc.h

reset or clock path?

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8750-gxcc
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: GFX voltage rail
> +      - description: MX_COLLAPSIBLE voltage rail
> +      - description: GPU_CC_CX GDSC
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - power-domains
> +  - '#power-domain-cells'
> +

You miss ref... or this is a bit confusing.

> +unevaluatedProperties: false

additionalProperties instead

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sm8750-gpucc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@3d64000 {

No, clock controllers have clock-cells. This cannot be a clock
controller if it does not have any clocks for anyone to use.

Best regards,
Krzysztof


