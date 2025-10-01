Return-Path: <linux-arm-msm+bounces-75668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF0BBAFF17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 11:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E71D81C5977
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 09:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6CA29AAF8;
	Wed,  1 Oct 2025 09:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6t+EpOt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF5529A31C;
	Wed,  1 Oct 2025 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759312750; cv=none; b=jVHyVzhP6OsTFvlEy4rgxrSarrPfM+UM6n1pmDsJ8bqZjBcOKiYnw03xpI8Bo2aYAl6A9qu9OPCfDGfYyJYtsLk0BLbPifQQyzP0ySvWBtGm3KqGvMWLUk9PThmAvWhp31huc+ngLSKwUoc5IgzhvH4yPE9zDAK9ytlTxmrHubY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759312750; c=relaxed/simple;
	bh=zQh3WXGk/9eQB/zxNVg6iMZ/HSaTpK+7Py1m4QRWrMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgN55eq+ggEBiAxP2XlPgjCBADWFjIO/UaotFWnATBkqsPZPJ0xloNVTybfnYG01XZRiLl44dYNRYk7I3PgS5LSn9w1m90B/1GnLM97K30INMw23109EID9dogxVth3/zZYyPu1ysSTtjHlRIi8SkCRFySb8ETP+wVLVzjVxy1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6t+EpOt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3385BC4CEF7;
	Wed,  1 Oct 2025 09:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759312749;
	bh=zQh3WXGk/9eQB/zxNVg6iMZ/HSaTpK+7Py1m4QRWrMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R6t+EpOtg9phG1/VYTsHF/VnAqKQkR6zUFARBtsmb9XSfTLAFLHML9KiG8+rgeBmf
	 Xm4/t1KD6j8c4eANQ6SdQON0liiDinPdJOvaOAKEFH7itPWtDtAiixf6wSV+34xZIJ
	 y0nYVeevlSWlrQTEAYyzMm7XuFxw+fmNfSlNsMIdBwqSRhxDrQa5wTs2dU9XpXETRV
	 pg5WB/6RopBuv7eUkTTduH08uSpQjN+mHcaGkIGKbUvVlm2sRbp1n2ryrjawqhlAQr
	 k+zTngMNdWV/0KFWUIY21RFFvxE9pT9RiaBQAvg9S6aIYV6nZ14iDy0nswzwFNIWHf
	 XwjkH6qftQTwA==
Date: Wed, 1 Oct 2025 10:59:04 +0100
From: Lee Jones <lee@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] dt-bindings: max77705: add interrupt-controller
 property
Message-ID: <20251001095904.GQ8757@google.com>
References: <20250925-starqltechn-correct_max77705_nodes-v4-0-93b706bdda58@gmail.com>
 <20250925-starqltechn-correct_max77705_nodes-v4-3-93b706bdda58@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925-starqltechn-correct_max77705_nodes-v4-3-93b706bdda58@gmail.com>

On Thu, 25 Sep 2025, Dzmitry Sankouski wrote:

> Add interrupt-controller property, because max77705 has dedicated interrupt
> source register to determine which sub device triggered an interrupt.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
> Changes in v4:
> - fix commit message: node -> property
> - fix commit message: minor reword and punctuation

Please also fix the subject line.  Format should be:

  dt-bindings: mfd: <device>: Subject line starting with an uppercase char

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

-- 
Lee Jones [李琼斯]

