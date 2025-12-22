Return-Path: <linux-arm-msm+bounces-86263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EA2CD6EFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 20:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8E483001036
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 19:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243E4335568;
	Mon, 22 Dec 2025 19:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="da5sozt6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0262D8DD4;
	Mon, 22 Dec 2025 19:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766430598; cv=none; b=RMV/sgtTI6G0Iy8Gx3e4J8T2wqwKhbEAelMtaErueprqAwEe1qXNOMVeA5yzjxNOdi2ZAVKQ5AUHyN7UkZ+DhAg0+HYokJTA6UR+dZMAgemSUOK01x4ASimCfejcUYre5xjVkvjHz7lfwldSWgdWR2ctQW8KVDW2zcxG8kGIuwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766430598; c=relaxed/simple;
	bh=VjJUPCw1QULSvot1INfFk4elEQsMIwwwA8SKT/vRYOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNCRd1lPShOv/O6jgSuUOjIRu7CzKAczBJAOjTECCLI50ugSDSdAXdcHo6Et9H8GwCkc71HiFv7UoMt73Wc50XO1Lsv7uRuUeoTerVrLpoS+tXY9JrsYZrFECOgDrfPuc11X++EhCxPujswcOkDT39reBfHzV6eva53mH04zR7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=da5sozt6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4CC1C4CEF1;
	Mon, 22 Dec 2025 19:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766430597;
	bh=VjJUPCw1QULSvot1INfFk4elEQsMIwwwA8SKT/vRYOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=da5sozt6FC/UZfqNp8hmgW3L+vDmj668qQ8fpB0U0ZPzgIpwp3RZIEo4DBgkemiOx
	 K9ZheksqU+ALESbs+1/X30PhGkWhNlECNNFYm0rY2szteQdBvSpzOol0lTtYfMY9Lp
	 so//HkLpVllANahcL2+zRJIaQg9vZ2jE0CrBYjfpFljEp6KA2ThyrCo4r6K8MQf6a9
	 8F6/+lpxvx6jL6lyHctbVkMquG7ym1AHg3uecVZqWBN+2iy9SG8zx/bU/xYi7n8pBc
	 SU8jW45pl/Z8zZQ8et+PJkUGQCnxDBeWQz0oII14ECnRxLNzAVH45Jf47xjWU3lhd/
	 3lXhmlEDFQBDg==
Date: Mon, 22 Dec 2025 13:09:54 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: rcg2: compute 2d using duty fraction directly
Message-ID: <emy273nvnbzznvufe6fmbysrln6d7lm4xi5rwsuwnj4kjlalvx@7j4dxyd2f25l>
References: <20251222-duty_cycle_precision-v1-1-b0da8e9fdab7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251222-duty_cycle_precision-v1-1-b0da8e9fdab7@oss.qualcomm.com>

On Mon, Dec 22, 2025 at 10:38:14PM +0530, Taniya Das wrote:
> From: Taniya Das <quic_tdas@quicinc.com>

Please use oss.qualcomm.com.

> 
> The duty-cycle calculation in clk_rcg2_set_duty_cycle() currently
> derives an intermediate percentage `duty_per = (num * 100) / den` and
> then computes:
> 
>     d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
> 
> This introduces integer truncation at the percentage step (division by
> `den`) and a redundant scaling by 100, which can reduce precision for
> large `den` and skew the final rounding.
> 
> Compute `2d` directly from the duty fraction to preserve precision and
> avoid the unnecessary scaling:
> 
>     d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
> 
> This keeps the intended formula `d ≈ n * 2 * (num/den)` while performing
> a single, final rounded division, improving accuracy especially for small
> duty cycles or large denominators. It also removes the unused `duty_per`
> variable, simplifying the code.
> 
> There is no functional changes beyond improved numerical accuracy.
> 
> Fixes: 7f891faf596ed ("clk: qcom: clk-rcg2: Add support for duty-cycle for RCG")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rcg2.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index e18cb8807d73534c6437c08aeb524353a2eab06f..2838d4cb2d58ea1e351d6a5599045c72f4dc3801 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -755,7 +755,7 @@ static int clk_rcg2_get_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>  static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>  {
>  	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> -	u32 notn_m, n, m, d, not2d, mask, duty_per, cfg;
> +	u32 notn_m, n, m, d, not2d, mask, cfg;
>  	int ret;
>  
>  	/* Duty-cycle cannot be modified for non-MND RCGs */
> @@ -774,10 +774,8 @@ static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>  
>  	n = (~(notn_m) + m) & mask;
>  
> -	duty_per = (duty->num * 100) / duty->den;
> -
>  	/* Calculate 2d value */
> -	d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
> +	d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);

This looks better/cleaner. But for my understanding, can you share some
example numbers that shows the problem?

Regards,
Bjorn

>  
>  	/*
>  	 * Check bit widths of 2d. If D is too big reduce duty cycle.
> 
> ---
> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> change-id: 20251222-duty_cycle_precision-796542baecab
> 
> Best regards,
> -- 
> Taniya Das <taniya.das@oss.qualcomm.com>
> 

