Return-Path: <linux-arm-msm+bounces-64128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ADFAFE16E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 09:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3D10567A9D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 07:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00762701CC;
	Wed,  9 Jul 2025 07:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MK68mpxR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C7623D2A8;
	Wed,  9 Jul 2025 07:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752046635; cv=none; b=Dj3EiilFZPqNsh17BhdC6AOgs5wUVZwOaF+Vy5D10tcc9U7imhahS24Dxjn5Y9bpB4bliTBQwWxURsGM6JB+81Wo8tgyElkLeC2Z80A7bGFl+tWV5O140KJw8kjGnBY7ONP34i0r7PbnFux42xseiQW0KD6lKK2ptQ7HG9PdvyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752046635; c=relaxed/simple;
	bh=8zyveNntrifP7/dTsOJwMViE80RVCE864l3k3QWDiNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPVvuSMQdVaJBJSaJ2bHDL6sPrUQrav63UqowxN+tqBaffX1k3iTkzwF98Rq63O6xrm8eUZrlacBotfXajiXpDfKGKrYoyuc/g3hnt3Gy+bObmgN5V/G5xZHjHD4FOvL9Ifh4Qrkv5awYub9Eh1Fgv6kXMo8EHyzVVUUHeECeAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MK68mpxR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D9AC4CEF1;
	Wed,  9 Jul 2025 07:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752046634;
	bh=8zyveNntrifP7/dTsOJwMViE80RVCE864l3k3QWDiNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MK68mpxRCItGbK5GgXo19bZXoN2Yytcm/HFCdrDA63uiZiaWv/JsUMm1Wql49b/8k
	 ulwJet8+PiyebCYbvHAEC6jzBnI7XTJyoirIK9dcCHRKFGFz35s7eevdZdx3QpeZRw
	 nGR9LuwhAo27BvNuHuoKSc590Cbk/N0EvvK+EUddgVkKE4TL9PxaMO3Vw8WxxiYAmR
	 2Ghwy1WOHNxX78AAws+IQRrO3o+8m5vVAaQtbjX5WQ2UdR125nYnHDJ/IuWzgcmw2q
	 CoSIfkGJCyHfZpupx4iLoAnYzXuhw9sNj0etWSMcmv0f7vfKRY+OJJkgM5mZ+5GFV8
	 mxA6kea9miOfg==
Date: Wed, 9 Jul 2025 09:37:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: x1-hp-x14: Commonalize HP
 Omnibook X14 device tree
Message-ID: <20250709-attractive-grouse-of-variation-dadcf1@krzk-bin>
References: <20250708-hp-x14-x1p-v5-0-44c916efa973@oldschoolsolutions.biz>
 <20250708-hp-x14-x1p-v5-2-44c916efa973@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708-hp-x14-x1p-v5-2-44c916efa973@oldschoolsolutions.biz>

On Tue, Jul 08, 2025 at 10:34:07PM +0200, Jens Glathe wrote:
> Commonalize the HP Omnibook X14 device tree for derivation of Hamoa (x1e*/x1p6*)
> and Purwa (x1p4*/x1*) variants. Required because the device trees are not
> compatible.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  ...hp-omnibook-x14.dts => x1-hp-omnibook-x14.dtsi} |   23 -
>  .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1610 +-------------------
>  2 files changed, 34 insertions(+), 1599 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
> similarity index 98%
> copy from arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
> copy to arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
> index 8d2a9b7f4730783bbaa81e488a0e99cc195a195f..740d145d51a90b67e572b02486eeff9aa256fcde 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
> +++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
> @@ -4,17 +4,12 @@
>   * Copyright (c) 2024, Xilin Wu <wuxilin123@gmail.com>
>   */
>  
> -/dts-v1/;
> -
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
> -#include "x1e80100.dtsi"
> -#include "x1e80100-pmics.dtsi"
> -
>  / {
>  	model = "HP Omnibook X 14";
>  	compatible = "hp,omnibook-x14", "qcom,x1e80100";

All these properties should be gone from DTSI.

> @@ -860,10 +855,6 @@ vreg_l3j_0p8: ldo3 {
>  
>  &gpu {
>  	status = "okay";
> -
> -	zap-shader {
> -		firmware-name = "qcom/x1e80100/hp/omnibook-x14/qcdxkmsuc8380.mbn";
> -	};
>  };

...

> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.

Incomplete copyrights. While renaming/splitting you are not allowed to
change them.

> + */
> +
> +/dts-v1/;
> +
> +#include "x1e80100.dtsi"
> +#include "x1e80100-pmics.dtsi"
> +#include "x1-hp-omnibook-x14.dtsi"

Best regards,
Krzysztof


