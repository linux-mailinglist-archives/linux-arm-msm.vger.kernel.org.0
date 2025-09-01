Return-Path: <linux-arm-msm+bounces-71420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0888BB3EBC6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 18:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A4AC14E30CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 16:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A85F2EC093;
	Mon,  1 Sep 2025 16:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJ79/dko"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E357F2DF14B;
	Mon,  1 Sep 2025 16:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756742494; cv=none; b=Hv/PW2lAV/zjK8Q/oSj+BzBS3EvLVdKC9jSHwK4Up26yZvG+0/VsJmIqMr2BijVauRHCfcn/xnMdsQ9NQ7yoKp9hpjGInW79cRhDbOSDR7f+qfBgs99DkxJnhToOX0QhuLJVRzXqONvOemzj/Yo3IGbBAk8l2OMA+4xpT/YDajM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756742494; c=relaxed/simple;
	bh=z5yCTntK4RuqQSdqFK5vnUdzIC6WTIG/xIglDMsKX0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLSxSCPzu0Xy2h/c0rh24RhgDrjV5BgFKdwMnNyLP0QcHGKeByL643t0pzTzeFHiPMR624nqhbtDuIVBEcEtZLPH8tfA67f8mjhWUY245Chs0saHocN2FYHvq3AORoQ2XLuqKqpwVG45fSp5R0B450M3m57QTC1FBI4niyMbqis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJ79/dko; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FA2C4CEF4;
	Mon,  1 Sep 2025 16:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756742493;
	bh=z5yCTntK4RuqQSdqFK5vnUdzIC6WTIG/xIglDMsKX0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJ79/dkoU9unwPyejFqBxfrb1Rn9r51V20U1VhGALcIG13s0CWx5ozXG+o7i5eoJ3
	 JkWHSDyjpqdo1MKoRemX4SK9Fi5xfs3Mxw5CJAjAJvI5yu1K4wGY3/lTp+9Z52tZlO
	 EuNxlb381rXeyikCsudeAWgQ1rC+eSqTc7DkiHjBOpCPPKJqRiUv8zVD4DLOJz/wCH
	 K33yZzzPB3X11UC1FHa/gAc9R1Vk1oEnHElXI8BZaULrYhwCLsy7rYzhq51W/Ja8XP
	 f8+NVxjmYnIDS6fYLPQoTfobfx3tvICZKWiuSXxJCpX9kWG+eSL1ooE1K7ywQ5Z+8v
	 Zjhldp3TR3nDA==
Date: Mon, 1 Sep 2025 11:01:31 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alejandro Tafalla <atafalla@dnyon.com>, Luca Weiss <luca@lucaweiss.eu>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8953-xiaomi-daisy: fix cd-gpios
Message-ID: <q4t2cmg5xtzbga2u3nnxayvb3mom5zaffhyidki2h7pmctk6f4@syj4byco3pwi>
References: <20250830-daisy-sd-fix-v1-1-727e83a987b8@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250830-daisy-sd-fix-v1-1-727e83a987b8@mainlining.org>

On Sat, Aug 30, 2025 at 11:59:30PM +0200, Barnabás Czémán wrote:
> Correct cd-gpios in xiaomi-daisy according to downstream sources
> it is using GPIO_ACTIVE_HIGH instead of GPIO_ACTIVE_LOW.

Is the problem you're solving that the DT doesn't match downstream, or
that card detect doesn't work? Does it work after this patch, or is it
just aligned with downstream?

Regards,
Bjorn

> 
> Fixes: 38d779c26395 ("arm64: dts: qcom: msm8953: Add device tree for Xiaomi Mi A2 Lite")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
> index 336b916729e4721b5ba8f4f7e368d0d838aa54ab..ddd7af616794290aa1f06228a95cfa1d42b006e6 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
> @@ -296,7 +296,7 @@ &sdhc_2 {
>  	vmmc-supply = <&pm8953_l11>;
>  	vqmmc-supply = <&pm8953_l12>;
>  
> -	cd-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
> +	cd-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
>  
>  	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
> 
> ---
> base-commit: 3cace99d63192a7250461b058279a42d91075d0c
> change-id: 20250830-daisy-sd-fix-011c23468e2a
> 
> Best regards,
> -- 
> Barnabás Czémán <barnabas.czeman@mainlining.org>
> 

