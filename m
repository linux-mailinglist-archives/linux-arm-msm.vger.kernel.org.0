Return-Path: <linux-arm-msm+bounces-89264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 277B4D2857A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 494E1300B8A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA913218CC;
	Thu, 15 Jan 2026 20:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGqqIZDj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8905322C7F;
	Thu, 15 Jan 2026 20:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768508006; cv=none; b=OTk+lFzXBxb7VmFEk1ttIrvXi3hUfYv8exoObs37pgZX9Gfw3p1pSbcgx4qLfc0e7hitbSH8o0yODhoi/Oi3uxIYRzYUL+6d6bT1Y3g5zJMSgLy5DTiqjv4NCzn/nyCYxyhDXddCCpNn41YRCa4DJCeDfqD6fZEkq4cSNHOxlhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768508006; c=relaxed/simple;
	bh=jr1ilPMwkKVPl5pCqJ+dK2J5Y6Fat4nqVFc+IPPKXho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jt9Z1Ub+zsHq6VJMMydatCdiYGKogWM/A7JxoiSJHoArbzZkGuMpox9oARjeb7yfiHi+9xMYfkH5afMxK/o1d1aoHyABDFyBfX4FrDa0mdCU87sLg+Q5B37ZUnB20q6zxPqvUGyp7eEZMQIGkkxe+af/OhVAR5r5zp3rgS83OPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGqqIZDj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F62C116D0;
	Thu, 15 Jan 2026 20:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768508002;
	bh=jr1ilPMwkKVPl5pCqJ+dK2J5Y6Fat4nqVFc+IPPKXho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LGqqIZDjoVPQtR/3wDlYFN+igzv6lrRttYgjEEaG7qVZ8lxeL5t3uvciHYzrgPMkZ
	 /HsZyMZo5eDNW4ELBFcrY5S65A9WVUF9rt8+r1QblQnGG1bqLv5jtjClmTO8FTbEPa
	 1KnivTllcA3pe2nLuFAem5cDhaoK/uh8bgNEUIAdsQy6r9y2fBYGVfVMel8s2Q3Lxq
	 fKOPkVHcvikDMRP9F/02LE0pYiH46/4S2hWARlkdGuuOCbGHmF98wqzeZ2/7V2ztm8
	 Wvz17wU+k8B2X2MN9rAU1AHN/ZRpCmWWY2pODee6inJcVRtciIVf7KZ+yTDjLwmioW
	 6CSSre2cpKSkg==
Date: Thu, 15 Jan 2026 14:13:21 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: cpus: Deprecate Qualcomm generic
 compatibles
Message-ID: <20260115201321.GA1101678-robh@kernel.org>
References: <20260115083503.43796-2-krzysztof.kozlowski@oss.qualcomm.com>
 <59ae6b16-7866-413a-a1d2-4a735024c108@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59ae6b16-7866-413a-a1d2-4a735024c108@oss.qualcomm.com>

On Thu, Jan 15, 2026 at 11:19:47AM +0100, Konrad Dybcio wrote:
> On 1/15/26 9:35 AM, Krzysztof Kozlowski wrote:
> > Move four compatibles for Qualcomm Krait, Kryo, Oryon and Scorpion
> > custom CPU cores out of the enum into separate one with deprecated: true
> > annotation, because these are too generic names.
> > 
> > These are names of the families and there are significant differences
> > within individual processors, e.g. Kryo6xx can based on architectures
> > from Cortex-X2, A710, A510 to A78 and probably more.
> > 
> > Just like other vendor processors are differentiated, also Qualcomm CPUs
> > should come with specific compatibles.
> > 
> > Cc: Bjorn Andersson <andersson@kernel.org>
> > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > -      - arm,armv8 # Only for s/w models
> 
> I'm still bitter about this one existing
> 
> $ rg '"arm,armv8"' arch -l | sort
> 
> arch/arm64/boot/dts/arm/foundation-v8.dtsi
> 
> This makes some sense (see [1])
> 
> arch/arm64/boot/dts/arm/fvp-base-revc.dts
> arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
> 
> These seem to be spawned with a specific virtualized Cortex type

No, these are "generic" cores where arch features can be turned on/off 
and configured.

> 
> arch/arm64/boot/dts/nvidia/tegra264.dtsi

It's hard to keep new ones from sneaking in...

Rob

