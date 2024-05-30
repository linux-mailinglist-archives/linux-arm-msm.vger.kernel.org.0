Return-Path: <linux-arm-msm+bounces-21141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFF38D502C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 18:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 299651C21315
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 16:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF747381AD;
	Thu, 30 May 2024 16:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sixJYJKW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF90036AF8;
	Thu, 30 May 2024 16:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088022; cv=none; b=Ckbs4O4NRF9YObozN2I+w/CA64y5NgObjcVK4UVUCECxa/3bc7iWW4VDVunMdQSM++GRL0slDeLI/FKt+MGzCtOuGuwKINDSVDUAR1HU4U5/izvyART6xL/nO+kwqfDWUUEVUtC/XXUZs+Dnj6Fhbo1KAuyNTttNQ+Nd4AF53Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088022; c=relaxed/simple;
	bh=csreo/Y/zB61/KT65YfRul5d1wWNhzkYFyul/L8HqhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5d2fYh3/Jf5+970nbphkODD/jNOW5lKX7zsFaOW8DQghzbHzpuUbwBtIk5TwRU4J54TUdtrI+nlJX5TIhQtpl+oCpGdpx9MCaDH+KtoCU1lGP11gwjd6k/V/6AgAz1wNEFeV3swaoMA/xSKNkIUAf6zHtm2zolu3xRzMOV7+j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sixJYJKW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF57C2BBFC;
	Thu, 30 May 2024 16:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717088022;
	bh=csreo/Y/zB61/KT65YfRul5d1wWNhzkYFyul/L8HqhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sixJYJKWs8HReCy7Tg16UifgqrjMgDVvixJBeAub/KuvifQBz1Xf5+POmNDgV3Mnq
	 KzLdP0gPRLUp16g7RaYaF+gfZJhKyK3Xkyo8VpXO8hDbQmOJCeSIHclpysYtLIkvca
	 CB2avUe5wOFTZSRhQZg1mik/iZq4bWuMGKtaZkQAN4L4OOk0UN4N8LNBnXXtHu/aU+
	 RxUnjfLjT66r4mFHP10sX3skfw85sQgKd6RMCwHRKbcr8yjZD2DvB71Hk9sPfDx+6K
	 1bnN76QaoAwFfdDMTbvwv/mpcpXlOQ+wDhs2zp8oTZ+G+rzlUMmTwXUk/WtOYlYkJM
	 oc6fCpoNOmWbA==
Date: Thu, 30 May 2024 22:23:35 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Fix halt_check for all 3 USB
 PHY pipe clocks
Message-ID: <20240530165335.GB11438@thinkpad>
References: <20240530-x1e80100-clk-gcc-fix-halt-check-for-usb-phy-pipe-clks-v1-1-16c6f4dccbd5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240530-x1e80100-clk-gcc-fix-halt-check-for-usb-phy-pipe-clks-v1-1-16c6f4dccbd5@linaro.org>

On Thu, May 30, 2024 at 07:48:44PM +0300, Abel Vesa wrote:
> Since the pipe clocks are fed by the QMP PHYs, they are not under the
> GCC control, therefore the halt bit might not get. This will lead to
> the clock driver reporting the clock as stuck, but that is inaccurate.
> So instead of waiting for the halt bit to get set, just use the
> HALT_DELAY flag.
> 

Isn't this behavior applicable to PCIe pipe clocks also?

- Mani

> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/clk/qcom/gcc-x1e80100.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> index 1404017be918..afff7cd14848 100644
> --- a/drivers/clk/qcom/gcc-x1e80100.c
> +++ b/drivers/clk/qcom/gcc-x1e80100.c
> @@ -5186,7 +5186,7 @@ static struct clk_regmap_mux gcc_usb3_prim_phy_pipe_clk_src = {
>  
>  static struct clk_branch gcc_usb3_prim_phy_pipe_clk = {
>  	.halt_reg = 0x39068,
> -	.halt_check = BRANCH_HALT_VOTED,
> +	.halt_check = BRANCH_HALT_DELAY,
>  	.hwcg_reg = 0x39068,
>  	.hwcg_bit = 1,
>  	.clkr = {
> @@ -5257,7 +5257,7 @@ static struct clk_regmap_mux gcc_usb3_sec_phy_pipe_clk_src = {
>  
>  static struct clk_branch gcc_usb3_sec_phy_pipe_clk = {
>  	.halt_reg = 0xa1068,
> -	.halt_check = BRANCH_HALT_VOTED,
> +	.halt_check = BRANCH_HALT_DELAY,
>  	.hwcg_reg = 0xa1068,
>  	.hwcg_bit = 1,
>  	.clkr = {
> @@ -5327,7 +5327,7 @@ static struct clk_regmap_mux gcc_usb3_tert_phy_pipe_clk_src = {
>  
>  static struct clk_branch gcc_usb3_tert_phy_pipe_clk = {
>  	.halt_reg = 0xa2068,
> -	.halt_check = BRANCH_HALT_VOTED,
> +	.halt_check = BRANCH_HALT_DELAY,
>  	.hwcg_reg = 0xa2068,
>  	.hwcg_bit = 1,
>  	.clkr = {
> 
> ---
> base-commit: 9d99040b1bc8dbf385a8aa535e9efcdf94466e19
> change-id: 20240530-x1e80100-clk-gcc-fix-halt-check-for-usb-phy-pipe-clks-ef8cf5b5631b
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

