Return-Path: <linux-arm-msm+bounces-54825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B11AA94865
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Apr 2025 19:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEA4E18906A9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Apr 2025 17:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9891EA7ED;
	Sun, 20 Apr 2025 17:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ge2+syEV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEEE10F1;
	Sun, 20 Apr 2025 17:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745168740; cv=none; b=rEVLnWzE8ksSzocrZm88zTUwnG1/jYTzbwwVIik8D2+WDxX8nLD/sB1AEIErhgwk8HyFut+59gD94+OMB8djmq229/BGOJpCHHW1xbAomc7fujrpa00B6q3zh0400KoAtv6I0Uch2f/HHycIPpoM0oqvf2Z/9OGmWTPrSaLiSVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745168740; c=relaxed/simple;
	bh=Y2pVCEFh35K+RUIcmOzKQq+C3eDWa/McD4hyR7bsBjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCvgwFWoX87WanQFKRTxHtkTjv9pywRiMQ5Miyp+8EFovGeoCUc6MLJfdgDspKmGFaEQ8kaOklorYNVqOao9C/3M8TrjSE/JCk0vW8mVtT5xKrt4d+fmzZr+3rH3uYhuojBV3nnfQqPPMeCnqaIJ7zfQl7r+Z43MnP0/0AzhSGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ge2+syEV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7710C4CEE2;
	Sun, 20 Apr 2025 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745168739;
	bh=Y2pVCEFh35K+RUIcmOzKQq+C3eDWa/McD4hyR7bsBjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ge2+syEVpwWvWrfCX/w9WQize6aSsWVIxaKSipkGalWRph3me7A9Yq6EjP6ipyzHc
	 yv4U3FgFUj2vbqJzH7I7u7lQL0nWZ/JPXoSvpubKR4nQqh+sp2/rqEOWum1OPm50Vi
	 P/Ko095zA+XtRuqbl67xnVJCF+lLh28NaIWnO86nzf/VWl5mxqoowloLfaga6XCJo8
	 GcfFtPGC3oUfU/j8kLI5Ky3j+cwd1sdl7E+Qjp/o75a69L8qHzfakKjtwn7aJ0961Y
	 azK+LsxfLOGaERNuUrnhUlI6pfKyJ5a3VDfL+fGoWBqSNNxzYGAXxUuUDN8D+0PjNl
	 J4QBzhcrOTWAg==
Date: Sun, 20 Apr 2025 12:05:36 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ARM: dts: qcom: msm8974-oneplus-bacon: Add alias for
 mmc0
Message-ID: <k7dm2tpw3mg34fydyug3rjnkwgfu2lwwzddd4edmano6jsgoiv@6klzba5rjpdy>
References: <20250419-msm8974-mmc-alias-v1-0-82aa131224b6@lucaweiss.eu>
 <20250419-msm8974-mmc-alias-v1-1-82aa131224b6@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-msm8974-mmc-alias-v1-1-82aa131224b6@lucaweiss.eu>

On Sat, Apr 19, 2025 at 11:03:57AM +0200, Luca Weiss wrote:
> Add an alias for the internal storage so it always becomes mmcblk0.
> 

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
calls for a problem description to start your commit message. Sometimes
the problem is obvious, but here &sdhc_2 is disable on this board, so
when does this not become mmcblk0? What is the problem you're solving?

Regards,
Bjorn

> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
> index 4c8edadea0ac63db668dbd666fbb8d92e23232b7..88ff6535477bffefe475cc5fe927b3cc5d223084 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
> @@ -13,6 +13,7 @@ / {
>  	qcom,board-id = <8 0>;
>  
>  	aliases {
> +		mmc0 = &sdhc_1;
>  		serial0 = &blsp1_uart2;
>  	};
>  
> 
> -- 
> 2.49.0
> 

