Return-Path: <linux-arm-msm+bounces-74443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1A0B91EF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 17:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B18CB7A4AFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 15:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68DDA2E6CDB;
	Mon, 22 Sep 2025 15:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6N4B1ZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0362AF1B;
	Mon, 22 Sep 2025 15:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555046; cv=none; b=mJVjXHKWwibrxpLKLcLB291UQmVe1/gNsOBbozR7dvIu/og9ceOxQXInzGWPAA4xbMTnPz4Lixhn9A36H7c/cQcOksU6rkVTMIWwyJQ2KuCWd6xXFT3jopOKXCxmCCLOe+rD49bUfRGGO8jrz4o3bEERShHSbXHLNyq/MB6WBgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555046; c=relaxed/simple;
	bh=9rHZ46XQ5Qf/T3d8zzS2nXiEGU9SVrkDNZX4Ew3/lcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8H1ejCIvccztbETuMaGWNjoRk/EeX8YhSKFqsip/8zMPPJbbj/WUtG0wHhxr4rjx0ZE2lm4skuNopYE36wOCRu5Jfe6/3wJwU7owNgh3O8u1s8NJ+v6KjJjfimTaBMEKUe2/edwzXmdQaI//hWnqglRhYV5PC7DCaMVU7I5LPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6N4B1ZW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36D8C4CEF7;
	Mon, 22 Sep 2025 15:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555046;
	bh=9rHZ46XQ5Qf/T3d8zzS2nXiEGU9SVrkDNZX4Ew3/lcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T6N4B1ZWorGk+L/UGZxbHdH1HdmI84ojMsZi6kG5My+Hru+jwCNqOxvOUBjqizQZy
	 h3o1M9/Yyyvokovm8IqHQ2wlBb0K9NPUwmvRwuw5V1ADrYOG4CpukYgIl5JzboMifB
	 ULra0fcxgl8oVORd4ETL4ExxVkmG675nIu+X1LiSW2+wMGXM+85EcLokJc4TE5zObb
	 adXV3rlbHLCytUt8h1gDEsfw27t8TI1q4jgUGvdnQccjBeGq75Ekja7oi6y1jlwoVK
	 u0aRggSPVtBWHOZvCTpG8m2ylT/P/KFm5Qyqq7faHb5w1N+3gLuoe9OJhqxnd6vx8p
	 D4UpHSwrUabLA==
Date: Mon, 22 Sep 2025 10:30:45 -0500
From: Rob Herring <robh@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: max77705: add interrupt-controller
 node
Message-ID: <20250922153045.GA4143633-robh@kernel.org>
References: <20250912-starqltechn-correct_max77705_nodes-v3-0-4ce9f694ecd9@gmail.com>
 <20250912-starqltechn-correct_max77705_nodes-v3-1-4ce9f694ecd9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912-starqltechn-correct_max77705_nodes-v3-1-4ce9f694ecd9@gmail.com>

On Fri, Sep 12, 2025 at 07:47:01PM +0300, Dzmitry Sankouski wrote:
> Add interrupt-controller node, because it has dedicated interrupt source
> register, to determine which sub device triggered an interrupt.

The subject and commit msg are wrong. You aren't adding a node.

> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/maxim,max77705.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml
> index 0ec89f0adc64..d265c8213a08 100644
> --- a/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml
> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml
> @@ -26,6 +26,18 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  interrupt-controller:
> +    description:
> +      The driver implements an interrupt controller for the sub devices.
> +      The interrupt number mapping is as follows
> +      0 - charger
> +      1 - topsys
> +      2 - fuelgauge
> +      3 - usb type-c management block.
> +
> +  '#interrupt-cells':
> +    const: 1
> +
>    haptic:
>      type: object
>      additionalProperties: false
> @@ -120,8 +132,10 @@ examples:
>              reg = <0x66>;
>              interrupt-parent = <&pm8998_gpios>;
>              interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +            interrupt-controller;
>              pinctrl-0 = <&chg_int_default>;
>              pinctrl-names = "default";
> +            #interrupt-cells = <1>;
>  
>              leds {
>                  compatible = "maxim,max77705-rgb";
> 
> -- 
> 2.39.5
> 

