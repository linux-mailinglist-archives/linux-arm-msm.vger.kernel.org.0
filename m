Return-Path: <linux-arm-msm+bounces-54890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 977A3A95803
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 23:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CBB97A6ADC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 21:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E3A1F0E32;
	Mon, 21 Apr 2025 21:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8ULaN64"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EA31E9916;
	Mon, 21 Apr 2025 21:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745271167; cv=none; b=G3cox29+NjynvJcECUe1BW735zxR19Pnli2A48xszgRySNIVmdgoiBY75iBC2XrrDYumOHC7dSJ+RC6+XpBFfBpz1WqFB2LZoDnotA22eoAr8bwKwgIUtKtL5H+XhGvqwWRJnAmuZog7hOsTH52Ai442QfspZnXVb67hKv72Y4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745271167; c=relaxed/simple;
	bh=QLIGv6BbptEPQr0f4i4xGAOTh8BsPkZbgBrT/SzcXm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbEzlMU8unere9MK1KUkotKCncNRLXxZHKPfgeg/kVJCsTj7cmQpiRYTMBcZEA4osw4Rlg172R5U4Z7Kfu8lWJQ8aknVwoKet4kCNe595ZxJPYh0SO8n6xQCIZA9g+TL9mFAvRjJLbmTRbRNfHe6xAWGi3GUL08IaB2vMA2A8M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8ULaN64; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF39DC4CEE4;
	Mon, 21 Apr 2025 21:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271167;
	bh=QLIGv6BbptEPQr0f4i4xGAOTh8BsPkZbgBrT/SzcXm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T8ULaN64PeXZQfBJisV9YtKLO1q59790zkrdA9tu9dIiLfgg8a5sgJL01BjAbTgZK
	 EJZ0fgjVKs11DANCdMkauVLrzKoEZh/fE2+MS686/81nFOeTUpSOo2mojV/YRGHiXF
	 7oIeOkTWu4ODnomiC6t0j1J4iHu8EEbGdd32b3coyVRUkkHPkZgfXM9+5aAoVptbvc
	 ZAuYxJCf6Z/LHV1oGY3cbTBuiqH5IgEQph5bmbi3+glaNovUJf1mzWQ28RRMMZg8cG
	 PiPNWNli+BQ234DC9YXPXt8WpPG2eZtEAs4ekMWpzZGxrSzisv2KAxg3wMJWp4/0MZ
	 xY3Tm5tiaMxHg==
Date: Mon, 21 Apr 2025 16:32:44 -0500
From: Rob Herring <robh@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 more tuning overrides
Message-ID: <20250421213244.GA2725065-robh@kernel.org>
References: <20250416120201.244133-1-mitltlatltl@gmail.com>
 <20250416120201.244133-2-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120201.244133-2-mitltlatltl@gmail.com>

On Wed, Apr 16, 2025 at 08:02:00PM +0800, Pengyu Luo wrote:
> In downstream tree, many registers need to be overridden, it varies
> from devices and platforms, not only HS trasmit amplitude(0x51),

spelling

> HS disconnect threshold(0x53), Tx pre-emphasis tuning(0x57). And
> some devices require different overrides for different dr_mode. So
> add property entries for host mode, original entries will be used
> for device mode.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  .../phy/qcom,snps-eusb2-repeater.yaml         | 41 +++++++++++++++++--
>  1 file changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> index d16a543a7..d0f5e770d 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> @@ -36,25 +36,60 @@ properties:
>  
>    qcom,tune-usb2-disc-thres:
>      $ref: /schemas/types.yaml#/definitions/uint8
> -    description: High-Speed disconnect threshold
> +    description: High-Speed disconnect threshold for device mode
>      minimum: 0
>      maximum: 7
>      default: 0
>  
>    qcom,tune-usb2-amplitude:
>      $ref: /schemas/types.yaml#/definitions/uint8
> -    description: High-Speed transmit amplitude
> +    description: High-Speed transmit amplitude for device mode
>      minimum: 0
>      maximum: 15
>      default: 8
>  
>    qcom,tune-usb2-preem:
>      $ref: /schemas/types.yaml#/definitions/uint8
> -    description: High-Speed TX pre-emphasis tuning
> +    description: High-Speed TX pre-emphasis tuning for device mode
>      minimum: 0
>      maximum: 7
>      default: 5
>  
> +  qcom,tune-usb2-squelch:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: Squelch detection threshold tuning for device mode
> +    minimum: 0
> +    maximum: 7
> +    default: 3
> +
> +  qcom,tune-usb2-disc-thres-host:

Put this and the others after each existing property (for device mode). 
Ideally, these would all be in alphabetical order.

> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: High-Speed disconnect threshold for host mode
> +    minimum: 0
> +    maximum: 7
> +    default: 0
> +
> +  qcom,tune-usb2-amplitude-host:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: High-Speed transmit amplitude for host mode
> +    minimum: 0
> +    maximum: 15
> +    default: 8
> +
> +  qcom,tune-usb2-preem-host:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: High-Speed TX pre-emphasis tuning for host mode
> +    minimum: 0
> +    maximum: 7
> +    default: 5
> +
> +  qcom,tune-usb2-squelch-host:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: Squelch detection threshold tuning for host mode
> +    minimum: 0
> +    maximum: 7
> +    default: 3
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.49.0
> 

