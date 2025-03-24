Return-Path: <linux-arm-msm+bounces-52299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE99A6D68E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 09:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 646FB188D5DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FC825D54D;
	Mon, 24 Mar 2025 08:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m23E7Swc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A19825D545;
	Mon, 24 Mar 2025 08:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742805948; cv=none; b=ZxvfXLs2blXBIAKPD3lFdPV3dRB8+SwU394zZSlMll4J5xnvJbixeIP5WR8DbJ9n+l9mVIpE4xOZCmEVMyFUAh78CKZYMLrlzza817xfih4Ie6NG1kNuqIMrJpMap/ZUYC3EkirKbkHwU7o3IjFATKTbHqjpjnTZao6c14UyTow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742805948; c=relaxed/simple;
	bh=My3iW3rQTVfHmWaiaXBjl0AqO8eaZeyr5K3v+jogMwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdqYM3iNIflmLKpRsP3Ja4NbqJ0kDxLvjTdBaR0B7/NCbkkeMQyxDt1AjinsNDBgw+Pta1935aBhDiJsnHwq28pXHkdpShxGEYAiGXD0URp/KbdosRgzdhEZ/ol4MiGpCZe7zeATW4SSeBNoWKzcr+q4R7HmsSyDVdNrPeLTCGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m23E7Swc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11DC8C4CEDD;
	Mon, 24 Mar 2025 08:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742805947;
	bh=My3iW3rQTVfHmWaiaXBjl0AqO8eaZeyr5K3v+jogMwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m23E7Swc3Q6IX3VQrsQq4knOxscSc5QpOFtZ2VF/UvbAZOfdos4/gk8U+FUyF0VcQ
	 h4mmvs44GI80VAM6JsHSbN4wb82izFA0vTkrKBwSsq/KuPgbF+vxBYka1ZD+UiN7XA
	 91KeVY8qL3V9iH0P67xZbSp/VkXwOIJSbmIbx8K8aBuVSDC75x7MCQS2v4vfY6vCcn
	 N2k14OMys6gTKMuUydqJclmb5R8DCSR2JAYE65mvU3x+Ozd4hUVzT5dtfnjYhA70Lv
	 T0pJJn93/P14Vsx70udZPNdd7MRXteSVJGEga6RqGWB3U2moP51+sl7B4W+7WJq3NP
	 ZzTxEBIsk8WZA==
Date: Mon, 24 Mar 2025 09:45:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 01/10] dt-bindings: phy: add exynos2200 eusb2 phy
 support
Message-ID: <20250324-important-kangaroo-of-prowess-0d2c30@krzk-bin>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-2-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250321135854.1431375-2-ivo.ivanov.ivanov1@gmail.com>

On Fri, Mar 21, 2025 at 03:58:45PM +0200, Ivaylo Ivanov wrote:
>  description:
> -  eUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
> +  eUSB2 controller supports LS/FS/HS usb connectivity.
>  
>  properties:
>    compatible:
> @@ -23,6 +23,7 @@ properties:
>                - qcom,x1e80100-snps-eusb2-phy
>            - const: qcom,sm8550-snps-eusb2-phy
>        - const: qcom,sm8550-snps-eusb2-phy
> +      - const: samsung,exynos2200-snps-eusb2-phy

These two entries is just an enum.

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

I am still not conviced that creating one schema for these devices
brings benefits. If this is going to be one binding, then keep the list
here with three items and add minItems, so the list is the same for all
variants.

>  
>    clock-names:
> -    items:
> -      - const: ref
> +    minItems: 1
> +    maxItems: 3

Keep the list here with three items and add minItems.


>  
>    resets:
>      maxItems: 1
> @@ -62,7 +63,52 @@ required:
>    - clock-names
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

Not much improved, my comment is still valid.


> +
> +        clocks:
> +          items:
> +            - description: ref

maxItems: 1

> +
> +        clock-names:
> +          items:
> +            - const: ref

maxItems: 1

> +
> +      required:
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

Drop blank line.

and the clocks get here minItems: 3

Best regards,
Krzysztof


