Return-Path: <linux-arm-msm+bounces-52474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0320CA704D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 16:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB417188F6D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 15:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76C025BAD5;
	Tue, 25 Mar 2025 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vLPVmvDc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C041F4E4B;
	Tue, 25 Mar 2025 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742915772; cv=none; b=ULMjGfPz7lz8FORODyv9/2xOwHZHHuUmK2tTtEw1InRTGrDQAea4BywdOY2Z65lKYiEIl6QqR+i+LXK5UnwFMtgCFWhpxY4UnYkcxKlACUM5o+r10GkS5AHoL5iL40hciVx3kKelVBGA5SuKbfqX3YnGw9fMU/LZlyzzaEIaw6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742915772; c=relaxed/simple;
	bh=5ByUJpks9hkZhuJoceNmjpMgpU8NiVFGUeBDfoAE150=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ymu18HODcd+aF7swLSCkKwEk2L1eJh4vRTe+lqDZV7yR2UHKhAaXqOimzUc8Ik5rHz3n5o+goCWMn8j8aAAHzwOUYScCqXEtvnVekdSK3nYr86CbFMHd3BWnX5N60BnqtySFBYo3UboF2aDOaqefwSJECEdmUuTHjEZ6a8RPJes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vLPVmvDc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E88A6C4CEE4;
	Tue, 25 Mar 2025 15:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742915772;
	bh=5ByUJpks9hkZhuJoceNmjpMgpU8NiVFGUeBDfoAE150=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vLPVmvDcdWcHF5VNb//6QuBceDBAFsUxvouEhOfevFwX7zzpHqTD7Z2q4DJvRmlFB
	 GQv1gvCsygYRFHv/ja5UWu4+WwEr1my4iRzZQPi9S1P3dCtAutlpaKrsV8AW3L5Uto
	 GqaKna3ic6X4bfMn91rlM047BCW+Dz/DM00Ld9yAJISCgFtC73NjcItqk3jIbkk51P
	 fMr+TeBbaJy0F2tl7TqWhL7UwehxwVTrq3m5i9vgrRqtKk8I5jBlwlT7QIfHztKbxR
	 vqQr78kIqdwVTfurkMxTojgv1Wz7bZxQuiWMoNU5vCFuOJI+kdOpM8DYxnnec0XaQ3
	 G9cZsUGQP+61w==
Date: Tue, 25 Mar 2025 10:16:11 -0500
From: Rob Herring <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 02/10] dt-bindings: phy: samsung,usb3-drd-phy: add
 exynos2200 support
Message-ID: <20250325151611.GA2057949-robh@kernel.org>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-3-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321135854.1431375-3-ivo.ivanov.ivanov1@gmail.com>

On Fri, Mar 21, 2025 at 03:58:46PM +0200, Ivaylo Ivanov wrote:
> Document support for Exynos2200. As the USBDRD 3.2 4nm controller
> consists of Synopsys eUSB2.0 phy and USBDP/SS combophy, which will
> be handled by external drivers, define only the bus clocked used
> by the link controller.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/phy/samsung,usb3-drd-phy.yaml    | 38 +++++++++++++++++--
>  1 file changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> index 16321cdd4..819e4afe6 100644
> --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> @@ -26,6 +26,7 @@ properties:
>    compatible:
>      enum:
>        - google,gs101-usb31drd-phy
> +      - samsung,exynos2200-usb32drd-phy
>        - samsung,exynos5250-usbdrd-phy
>        - samsung,exynos5420-usbdrd-phy
>        - samsung,exynos5433-usbdrd-phy
> @@ -33,24 +34,32 @@ properties:
>        - samsung,exynos850-usbdrd-phy
>  
>    clocks:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 5
>  
>    clock-names:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 5
>      description: |
> -      At least two clocks::
> +      Typically two clocks::

Don't need double colon.

>          - Main PHY clock (same as USB DRD controller i.e. DWC3 IP clock), used
>            for register access.
>          - PHY reference clock (usually crystal clock), used for PHY operations,
>            associated by phy name. It is used to determine bit values for clock
>            settings register.  For Exynos5420 this is given as 'sclk_usbphy30'
> -          in the CMU.
> +          in the CMU. It's not needed for Exynos2200.
>  
>    "#phy-cells":
>      const: 1
>  
> +  phys:
> +    maxItems: 1
> +    description:
> +      Phandle to USBDRD-underlying high-speed PHY

Drop 'phandle to'.

> +
> +  phy-names:
> +    const: hs
> +
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>      description:
> @@ -137,6 +146,27 @@ allOf:
>          - vdda-usbdp-supply
>          - vddh-usbdp-supply
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos2200-usb32drd-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          items:
> +            - const: phy
> +        reg:
> +          maxItems: 1
> +        reg-names:
> +          maxItems: 1
> +      required:
> +        - phys
> +        - phy-names
> +
>    - if:
>        properties:
>          compatible:
> -- 
> 2.43.0
> 

