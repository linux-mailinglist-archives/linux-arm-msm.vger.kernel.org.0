Return-Path: <linux-arm-msm+bounces-87277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB54FCEF566
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 22:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A240300C2B0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 21:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE2D2D6619;
	Fri,  2 Jan 2026 21:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKMiGmme"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EB8219A8D;
	Fri,  2 Jan 2026 21:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767388215; cv=none; b=LW3F0S/WbntPUQBa1qkapTl8glkCnXVLxQveNc916ImcAuIg8RQXHWDPrRBDYDyMepBM1qQ2dWdefBbEpp/z6ey6VeMXERkKvNR/wlxeWV94aOlOI1kxLuqon1BfH/6ZF5cg21xdqSH8p5HkguySfq+KWwwgYIZF+wakUMK1umM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767388215; c=relaxed/simple;
	bh=lQTcRdEeiie90zb13gty2n3r50qs7Iq/ZfMmtsuIQrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRHa5nlQeyNz4lmvjG2KI9h8lgvh29kfIDx/HF0QW7c0yUtj45+ZpATGAr8NcT1riEJ1M0UFfQyeiNdBmGXA7/jhTR8QPTkEe5bdiDyzxCQJBFMcZs30IE1gNCqA2HviQXb6LwQQ5oUc2qUI68v98LW5nypxZoUD0AoFmBxzgTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKMiGmme; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB75FC116B1;
	Fri,  2 Jan 2026 21:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767388213;
	bh=lQTcRdEeiie90zb13gty2n3r50qs7Iq/ZfMmtsuIQrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKMiGmmeQaniXcs1vjJ60EZzMY0HIBbADuqd+jgYK44IBNcy9dl0HUPYd9VnxzqXs
	 iRR1o/wJN/NdrXBzss1ORoeNhuBJdcXZVOVsr7YUJ2jOsce2/GxzA8p8hJ23pRoOdd
	 ZcbyXjPJ1Tf1EdrnTk47XW3uDuo8bSTMunwuNernbWdhS6oM3yCSeNMPtFIBnnzClk
	 rp9dB6J193vbmt3McWDG2Zzjaa0B22D5s2k6MvG6rbNzpPXzOHkoqL4+3IzoHOe4Mj
	 ZLdNLv0XjxleAYYPr1Qh6hry+IaRqcAkssUxLvbrlIL0H5bWhNQSlguHX93fKaW0/3
	 KI4rq1Kc/0qWQ==
Date: Fri, 2 Jan 2026 15:10:10 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] clk: qcom: gcc-kaanapali: Fix double array
 initializer
Message-ID: <j2qvtpdsak2z2l3o5ckpin7zun4wo3c5uc6jvutfdkfbqebfxa@zvbg6tmph7eg>
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>

On Wed, Dec 24, 2025 at 12:22:58PM +0100, Krzysztof Kozlowski wrote:
> [GCC_QMIP_VIDEO_VCODEC_AHB_CLK] element in clk_regmap array is already
> initialized, as reported by W=1 clang warning:
> 
>   gcc-kaanapali.c:3383:36: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Does anyone even build this code before sending it to upstream?

It hope the author does...but I of couse sanity check the result through
an allmodconfig build across a few different architectures before
pushing.

But it seems passing '--environment "W=1"' to tuxmake doesn't actually
enable these warnings :(

Thanks for the report, and the fixes.

Regards,
Bjorn

> ---
>  drivers/clk/qcom/gcc-kaanapali.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
> index 182b152df14c..b9743284927d 100644
> --- a/drivers/clk/qcom/gcc-kaanapali.c
> +++ b/drivers/clk/qcom/gcc-kaanapali.c
> @@ -3380,7 +3380,6 @@ static struct clk_regmap *gcc_kaanapali_clocks[] = {
>  	[GCC_QMIP_VIDEO_CV_CPU_AHB_CLK] = &gcc_qmip_video_cv_cpu_ahb_clk.clkr,
>  	[GCC_QMIP_VIDEO_CVP_AHB_CLK] = &gcc_qmip_video_cvp_ahb_clk.clkr,
>  	[GCC_QMIP_VIDEO_V_CPU_AHB_CLK] = &gcc_qmip_video_v_cpu_ahb_clk.clkr,
> -	[GCC_QMIP_VIDEO_VCODEC_AHB_CLK] = &gcc_qmip_video_vcodec_ahb_clk.clkr,
>  };
>  
>  static struct gdsc *gcc_kaanapali_gdscs[] = {
> -- 
> 2.51.0
> 

