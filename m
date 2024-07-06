Return-Path: <linux-arm-msm+bounces-25423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D0D92952D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62B021F217B8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 20:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB35E1CFB9;
	Sat,  6 Jul 2024 20:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQOwVRnq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEF117753;
	Sat,  6 Jul 2024 20:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720296306; cv=none; b=VlrnviUQ5UlH2Z3d5a1xETT12fd2iDdkyO2/kN3J8w91PzFWI/LOnGlld8Ss38cAqL961oCx/oIhPjRIs7x4YhgcVMutWhlZuD3+Hdu7DxzhkbG6G3Qm6EUbWpbo2jWJCs1w4jOLDdINFRe7JF0Q2wZKVVoQGlhURKkODmbA98M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720296306; c=relaxed/simple;
	bh=gsgLqZekbaK5U7yFxFJJuGpKdNPQiaPBRFGPr9Co5Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+SftzSmJbk9H9D9SSqRrwkfaWXm6DIrRt7NU/jv8h1HW28Yunk+J8CUSE2+TafMSnbiTLOnXZ/M5A3VcAgH+I5DEhcRCKERIIkd+DgQzMkro8zSxR6aE/mY0kPCeRPGopcI5euqN4Blegjs+RVYvFLrLUC42XgjBtatS4qPuPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQOwVRnq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A84C2BD10;
	Sat,  6 Jul 2024 20:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720296306;
	bh=gsgLqZekbaK5U7yFxFJJuGpKdNPQiaPBRFGPr9Co5Vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQOwVRnq35kj17RHr8XyfTtDC7pVYT6qrIpnDZir31rydpWqTWjGXdcAJHuXNYo9m
	 tS0d6rmuTcDsraxvgm0QcPc8wuLIr6enddbF6zIyaOoedsrQadXEZ4Q884cb+Fb71d
	 5BoHKpEMDLt48oNaFAyebubXvT1UEXUEZy/Kz0i3H6DBm+hL+p+DD78eRIMsiatOHT
	 G8g2sR2+xEejypRzbSBHZOofNVEbEsDQc+LlsIIYntOJX19CoLM7VTLtz3J21YHnMp
	 ktEOE1JVEJXNI95vnSp1pDvIkTioYjRcFWkFiQE0WHuyR4fwgWrhyM0ptExpwIsyqS
	 MmP0aDWjemkfg==
Date: Sat, 6 Jul 2024 15:05:03 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: apq8960: correct memory base
Message-ID: <ir4hatefzt6luxkjrqro2bf5k7s2hnsw6o75q5543rakh2zpvg@wnnerfjswabz>
References: <20240706193415.218940-1-david@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706193415.218940-1-david@ixit.cz>

On Sat, Jul 06, 2024 at 12:34:07PM GMT, David Heidelberg wrote:
> Bootloader will provide the information anyway to the kernel.

How about we describe an actual problem here?

Perhaps this is the problem you're solving?:

"""
DeviceTree validation requires a unit address on the memory node, adjust
the base to match [Ref] and use this as unit address.

The bootloader will update the information with the actual values during
boot.
"""

I'd also prefer s/apq8960/msm8960/ in $subject, is there a reason why
you did choose apq8960?

Regards,
Bjorn

> 
> Ref: https://github.com/msm8916-mainline/lk2nd/blob/main/target/msm8960/rules.mk
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git ./arch/arm/boot/dts/qcom/qcom-msm8960.dtsi ./arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> index a9c6d2dbb460..ebc43c5c6e5f 100644
> --- ./arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ ./arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> @@ -47,9 +47,9 @@ L2: l2-cache {
>  		};
>  	};
>  
> -	memory {
> +	memory@80000000 {
>  		device_type = "memory";
> -		reg = <0x0 0x0>;
> +		reg = <0x80000000 0>;
>  	};
>  
>  	cpu-pmu {
> -- 
> 2.45.2
> 

