Return-Path: <linux-arm-msm+bounces-64301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8893FAFFB29
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 09:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 668AA3AB4D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 07:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BDB28B4F4;
	Thu, 10 Jul 2025 07:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYHcQt6W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D4428B4E2;
	Thu, 10 Jul 2025 07:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752133282; cv=none; b=s2OuQFndUXbJTZv6Kb0d9NCgOzYpZF++mO2MmGz8cXm1YYd4hNv09Am1HpoD0FcNDgOmA/xLvrb/w7YfliJWEgMmQEIrXlzWP0/A0vwFGBNCJpgGOVpq3bNg1i/7Ofwa1JLDrb4MQ46NllbJH8rMlfXKMSLuO5MNJeaYrx5djZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752133282; c=relaxed/simple;
	bh=aNFEsePcvzZQh9sQp/6/WxI32Fe+Fhw2Pp0M2LiCAzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfQr2KMnsXsrQ+Q1JF2Tvc9TK6fyAt1yLSoxGg4orOhEXKq8EF9jYNGL87hky52rUPfDjsvr3TI9NmI3bTbjyN5eDF86+mlGxpkT/PIKgyYAoVU4ZSUviH4rgP/cCtarUV2EX3zdxpqbbEZpitkMv9ynN/75kwBTxR20oU3UnvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYHcQt6W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8DDC4CEE3;
	Thu, 10 Jul 2025 07:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752133281;
	bh=aNFEsePcvzZQh9sQp/6/WxI32Fe+Fhw2Pp0M2LiCAzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PYHcQt6WPWsKhckGUEwcUee8LcmoNGpCAk/uFly81qRZBPbfj6rKesvGQg/EQEHmF
	 DFin+fvCJem9F231KmhLQnmXYeLENM/HgteMgG2chZFCA4qN/bdyXXNuiQk4cPlmIf
	 6W7i5xBM8M6mhK45fRHWIbF8/o/u/OBSBXNtzXHXCr3ZKq+90O6QCeZ5AKgOGQDDzp
	 8ejeaSlro/MagaVKgs7ID1jWPSSWRX4DHr9lhWLw6rn3HS4pDmDrExo/3AYjCx/RIa
	 ASY2IxLZ1KTRt3OiQltCZqOj5PmK/xpEEo8Fz/jCafLBIok96pJrsTbWZCUjYUPD3c
	 WPY7JUhsd6FRg==
Date: Thu, 10 Jul 2025 09:41:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: x1-hp-x14: Add support for
 X1P42100 HP Omnibook X14
Message-ID: <20250710-fervent-shapeless-pogona-598c2e@krzk-bin>
References: <20250709-hp-x14-x1p-v6-0-f45cc186a62d@oldschoolsolutions.biz>
 <20250709-hp-x14-x1p-v6-3-f45cc186a62d@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709-hp-x14-x1p-v6-3-f45cc186a62d@oldschoolsolutions.biz>

On Wed, Jul 09, 2025 at 09:26:54PM +0200, Jens Glathe wrote:
> These laptops are the same as the already known 14-fe0xxx models, but
> with a Purwa SoC, SKU number 14-fe1xxx. [1]
> 
> The supported features are the same as for the original Omnibook X14:
> 
> - Keyboard (no function keys though)
> - Display
> - PWM brightness control
> - Touchpad
> - Touchscreen
> - PCIe ports (pcie4, pcie6a)
> - USB type-c, type-a
> - WCN6855 Wifi-6E
> - WCN6855 Bluetooth
> - ADSP and CDSP
> - X1 GPU
> - GPIO Keys (Lid switch)
> - Audio definition (works via USB and with internal speakers)
> 
> https://www.hp.com/us-en/shop/pdp/hp-omnibook-x-laptop-next-gen-ai-pc-14-fe100-14-a4nd1av-1#techSpecs
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |  2 ++
>  .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     | 33 ++++++++++++++++++++++
>  2 files changed, 35 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


