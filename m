Return-Path: <linux-arm-msm+bounces-57553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 925FFAB2BF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 00:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5B303B8D00
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 22:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFBF2609D0;
	Sun, 11 May 2025 22:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+bOzdDE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA4DBE4A;
	Sun, 11 May 2025 22:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747003697; cv=none; b=lmKP8a5AhRB4TgUH8c1ILB6GhWf/eGQciQT7tSa4hBiYavMB1O2CWhTb6K9KuxKk6KzwhzcDq7mN5ihVnIP+fwCZmmsHYqnIz1bCkZKy+lZYLO2oJv5o62SAI3hU5Yv4llaI9sIUeGWFpywaweZjxkBjwWugIZaAlgF6wjBOMn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747003697; c=relaxed/simple;
	bh=cDd9/C/c/hoFNChqLxPmDmUtIiKdG7G1InZEgNWwhVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s29DIpzunpWGcGX3F+Ay949Ioh5BNf8Bx7ZkA1MX8CoNItl4vIhN1dplB9Y3RnZ83QZGhk5CGXcapb5A7rhqsPd9DSVxskXXjXesORV6C/dzdaSE1URLHw0n6mQc6eahi9JLL7f8F2jCKwjpgSm4jSW1jA75bMRlZd4YJGAefRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+bOzdDE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F115C4CEE4;
	Sun, 11 May 2025 22:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747003696;
	bh=cDd9/C/c/hoFNChqLxPmDmUtIiKdG7G1InZEgNWwhVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+bOzdDE9hjFDFpmFPuaK27OUfUz1k3vHBW5WiT85TyahbcDQbj6oJF5Vat90gDBR
	 YIDLxOBM7WjMLUmb3U+eBp9WTU3wtcwBxQbj8foGI5NOaoJUr8O9iDAznjyTDMKfJt
	 5A05kdhf7lxEPtfqSRCnkqPsBSpKXiZfUZfdx6RTSDsbpnf/bX+abRk/w2UiL34l6H
	 JgoWm2mfCh1drjmxvsAWymgMwzvNOfgqxMQAzK5feWri42QyU0LDjjGOtrzrEMBY6v
	 E/sSD5CsEX95Xg4OkTyfsY/jGDF2y1D1VsBp+Q3qDO5iiI4hW1eNOuYGVa7bRErvZG
	 l90ZKoZBLt9ag==
Date: Sun, 11 May 2025 17:48:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Georgi Djakov <djakov@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: mailbox: qcom,apcs: Add separate node
 for clock-controller
Message-ID: <7vszdea2djl43oojvw3vlrip23f7cfyxkyn6jw3wc2f7yowht5@bgsc2pqscujc>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
 <20250506-qcom-apcs-mailbox-cc-v1-1-b54dddb150a5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-qcom-apcs-mailbox-cc-v1-1-b54dddb150a5@linaro.org>

On Tue, May 06, 2025 at 03:10:08PM +0200, Stephan Gerhold wrote:
> APCS "global" is sort of a "miscellaneous" hardware block that combines
> multiple registers inside the application processor subsystem. Two distinct
> use cases are currently stuffed together in a single device tree node:
> 
>  - Mailbox: to communicate with other remoteprocs in the system.
>  - Clock: for controlling the CPU frequency.
> 
> These two use cases have unavoidable circular dependencies: the mailbox is
> needed as early as possible during boot to start controlling shared
> resources like clocks and power domains, while the clock controller needs
> one of these shared clocks as its parent. Currently, there is no way to
> distinguish these two use cases for generic mechanisms like fw_devlink.
> 
> This is currently blocking conversion of the deprecated custom "qcom,ipc"
> properties to the standard "mboxes", see e.g. commit d92e9ea2f0f9
> ("arm64: dts: qcom: msm8939: revert use of APCS mbox for RPM"):
>   1. remoteproc &rpm needs mboxes = <&apcs1_mbox 8>;
>   2. The clock controller inside &apcs1_mbox needs
>      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>.
>   3. &rpmcc is a child of remoteproc &rpm
> 
> The mailbox itself does not need any clocks and should probe early to
> unblock the rest of the boot process. The "clocks" are only needed for the
> separate clock controller. In Linux, these are already two separate drivers
> that can probe independently.
> 

Why does this circular dependency need to be broken in the DeviceTree
representation?

As you describe, the mailbox probes and register the mailbox controller
and it registers the clock controller. The mailbox device isn't affected
by the clock controller failing to find rpmcc...

Regards,
Bjorn

> Break up the circular dependency chain in the device tree by separating the
> clock controller into a separate child node. Deprecate the old approach of
> specifying the clock properties as part of the root node, but keep them for
> backwards compatibility.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  .../bindings/mailbox/qcom,apcs-kpss-global.yaml    | 169 ++++++++++++++-------
>  1 file changed, 118 insertions(+), 51 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index a58a018f3f7b9f8edd70d7c1bd137844ff2549df..3a0a304bb65a68b2d4a1df79b3243ddac6bf88b2 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -72,6 +72,7 @@ properties:
>      description: phandles to the parent clocks of the clock driver
>      minItems: 2
>      maxItems: 3
> +    deprecated: true
>  
>    '#mbox-cells':
>      const: 1
> @@ -82,6 +83,23 @@ properties:
>    clock-names:
>      minItems: 2
>      maxItems: 3
> +    deprecated: true
> +
> +  clock-controller:
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      clocks:
> +        description: phandles to the parent clocks of the clock driver
> +        minItems: 2
> +        maxItems: 3
> +
> +      '#clock-cells':
> +        enum: [0, 1]
> +
> +      clock-names:
> +        minItems: 2
> +        maxItems: 3
>  
>  required:
>    - compatible
> @@ -90,6 +108,76 @@ required:
>  
>  additionalProperties: false
>  
> +# Clocks should be specified either on the parent node or on the child node
> +oneOf:
> +  - required:
> +      - clock-controller
> +    properties:
> +      clocks: false
> +      clock-names: false
> +      '#clock-cells': false
> +  - properties:
> +      clock-controller: false
> +
> +$defs:
> +  msm8916-apcs-clock-controller:
> +    properties:
> +      clocks:
> +        items:
> +          - description: primary pll parent of the clock driver
> +          - description: auxiliary parent
> +      clock-names:
> +        items:
> +          - const: pll
> +          - const: aux
> +      '#clock-cells':
> +        const: 0
> +
> +  msm8939-apcs-clock-controller:
> +    properties:
> +      clocks:
> +        items:
> +          - description: primary pll parent of the clock driver
> +          - description: auxiliary parent
> +          - description: reference clock
> +      clock-names:
> +        items:
> +          - const: pll
> +          - const: aux
> +          - const: ref
> +      '#clock-cells':
> +        const: 0
> +
> +  sdx55-apcs-clock-controller:
> +    properties:
> +      clocks:
> +        items:
> +          - description: reference clock
> +          - description: primary pll parent of the clock driver
> +          - description: auxiliary parent
> +      clock-names:
> +        items:
> +          - const: ref
> +          - const: pll
> +          - const: aux
> +      '#clock-cells':
> +        const: 0
> +
> +  ipq6018-apcs-clock-controller:
> +    properties:
> +      clocks:
> +        items:
> +          - description: primary pll parent of the clock driver
> +          - description: XO clock
> +          - description: GCC GPLL0 clock source
> +      clock-names:
> +        items:
> +          - const: pll
> +          - const: xo
> +          - const: gpll0
> +      '#clock-cells':
> +        const: 1
> +
>  allOf:
>    - if:
>        properties:
> @@ -98,15 +186,10 @@ allOf:
>              enum:
>                - qcom,msm8916-apcs-kpss-global
>      then:
> +      $ref: "#/$defs/msm8916-apcs-clock-controller"
>        properties:
> -        clocks:
> -          items:
> -            - description: primary pll parent of the clock driver
> -            - description: auxiliary parent
> -        clock-names:
> -          items:
> -            - const: pll
> -            - const: aux
> +        clock-controller:
> +          $ref: "#/$defs/msm8916-apcs-clock-controller"
>  
>    - if:
>        properties:
> @@ -115,17 +198,10 @@ allOf:
>              enum:
>                - qcom,msm8939-apcs-kpss-global
>      then:
> +      $ref: "#/$defs/msm8939-apcs-clock-controller"
>        properties:
> -        clocks:
> -          items:
> -            - description: primary pll parent of the clock driver
> -            - description: auxiliary parent
> -            - description: reference clock
> -        clock-names:
> -          items:
> -            - const: pll
> -            - const: aux
> -            - const: ref
> +        clock-controller:
> +          $ref: "#/$defs/msm8939-apcs-clock-controller"
>  
>    - if:
>        properties:
> @@ -134,17 +210,10 @@ allOf:
>              enum:
>                - qcom,sdx55-apcs-gcc
>      then:
> +      $ref: "#/$defs/sdx55-apcs-clock-controller"
>        properties:
> -        clocks:
> -          items:
> -            - description: reference clock
> -            - description: primary pll parent of the clock driver
> -            - description: auxiliary parent
> -        clock-names:
> -          items:
> -            - const: ref
> -            - const: pll
> -            - const: aux
> +        clock-controller:
> +          $ref: "#/$defs/sdx55-apcs-clock-controller"
>  
>    - if:
>        properties:
> @@ -153,17 +222,10 @@ allOf:
>              enum:
>                - qcom,ipq6018-apcs-apps-global
>      then:
> +      $ref: "#/$defs/ipq6018-apcs-clock-controller"
>        properties:
> -        clocks:
> -          items:
> -            - description: primary pll parent of the clock driver
> -            - description: XO clock
> -            - description: GCC GPLL0 clock source
> -        clock-names:
> -          items:
> -            - const: pll
> -            - const: xo
> -            - const: gpll0
> +        clock-controller:
> +          $ref: "#/$defs/ipq6018-apcs-clock-controller"
>  
>    - if:
>        properties:
> @@ -179,19 +241,7 @@ allOf:
>        properties:
>          clocks: false
>          clock-names: false
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,ipq6018-apcs-apps-global
> -    then:
> -      properties:
> -        '#clock-cells':
> -          const: 1
> -    else:
> -      properties:
> +        clock-controller: false
>          '#clock-cells':
>            const: 0
>  
> @@ -216,6 +266,23 @@ examples:
>      };
>  
>    # Example apcs with qcs404
> +  - |
> +    #define GCC_APSS_AHB_CLK_SRC  1
> +    #define GCC_GPLL0_AO_OUT_MAIN 123
> +    mailbox@b011000 {
> +        compatible = "qcom,qcs404-apcs-apps-global",
> +                     "qcom,msm8916-apcs-kpss-global", "syscon";
> +        reg = <0x0b011000 0x1000>;
> +        #mbox-cells = <1>;
> +
> +        apcs_clk: clock-controller {
> +          clocks = <&apcs_hfpll>, <&gcc GCC_GPLL0_AO_OUT_MAIN>;
> +          clock-names = "pll", "aux";
> +          #clock-cells = <0>;
> +        };
> +    };
> +
> +  # Example apcs with qcs404 (deprecated: use clock-controller subnode)
>    - |
>      #define GCC_APSS_AHB_CLK_SRC  1
>      #define GCC_GPLL0_AO_OUT_MAIN 123
> 
> -- 
> 2.47.2
> 

