Return-Path: <linux-arm-msm+bounces-28710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6F7953C98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 23:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 813D9B23825
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 21:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334D614A609;
	Thu, 15 Aug 2024 21:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eIszizQp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0669C4DA13;
	Thu, 15 Aug 2024 21:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723757419; cv=none; b=IgTy0+WYj2OmCe181e1P7DIUptcz5KZY43kfL9r6FuF0SmOSoQLQe+qIU4A7Dyjl/24c9AMohvt+pDiDkHp3u6kVlTp3WVh6x3ihVyLwID8/kztEH4Yl/IlUJFDj+Pb+VQSzOkl+ha+iYEcRSNBsgWzZWUeIYtJ+DJV1FQeSUAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723757419; c=relaxed/simple;
	bh=y8W8HNJ08a0TqNYCTQhP1KK/N2jnJJur8+koadftfBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOx7r+mp/YuKyhmrNn0VIyoj0L/XTxRzRUlN3cuGGf3JNI2QSXHpn3ZU1kTRnzisqFzwC0Oxy7Mte3ud7tbRC3ifGO87UuVu3mqN+R1Hd0cDj4fdLjOJ4RJ++eohMIKcuFVitDRYT7ZH0BtfGv39GrvN9+2iLm8oJ4w6SDHSsYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eIszizQp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B05CC32786;
	Thu, 15 Aug 2024 21:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723757418;
	bh=y8W8HNJ08a0TqNYCTQhP1KK/N2jnJJur8+koadftfBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eIszizQp3QF/JwXlpFbEXBZYQkpfyfVVhD+9ypDjnowUhMTIvuqbCdrIbSo9RDE7Z
	 mohmZ/RRh2cEGVQp7VUar32BWJ6jJ7+r0HnxJwUnlMvrx6osU1iSN/PSn9ItZmu9q0
	 XQEyeEScA44UuytOUXtWRhQZ9LUVaNCT0weLj2OZE2W3g/7C2phqZEghRRJIxZHNEV
	 X+KjuAaAoBRLmcgDLpLRuJny1PlbuacpDCW9VuyKWYRdGf3NX7XmKK2WUCX0zvAYM1
	 bgLhMbCJ+pPE3Di+H0H7+2iIZlQDMf6QIpI1cnhCq29J+ypmlESN1QisOVT71JOX5s
	 PC6e8if+kedqQ==
Date: Thu, 15 Aug 2024 16:30:15 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, kernel test robot <lkp@intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH V2] clk: qcom: clk-alpha-pll: Simplify the
 zonda_pll_adjust_l_val()
Message-ID: <om5c5wmziw5wywzwp3qirruaaxjughcneupkyzl4hi3jzfuhhg@f5cfsjwabday>
References: <20240814102005.33493-1-quic_skakitap@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814102005.33493-1-quic_skakitap@quicinc.com>

On Wed, Aug 14, 2024 at 03:50:05PM GMT, Satya Priya Kakitapalli wrote:
> In zonda_pll_adjust_l_val() replace the divide operator with comparison
> operator since comparisons are faster than divisions. Also, simplify the
> logic and remove the unnecessary 'quotient' local variable.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes in V2:
>  - Simplify the logic and remove unnecessary quotient variable.
>  - Remove Fixes tag as this is just a simplification.
> 
>  drivers/clk/qcom/clk-alpha-pll.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 2f620ccb41cb..4ce3347beb39 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2120,14 +2120,11 @@ static void clk_zonda_pll_disable(struct clk_hw *hw)
>  
>  static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32 *l)
>  {
> -	u64 remainder, quotient;
> +	u64 remainder;
>  
> -	quotient = rate;
> -	remainder = do_div(quotient, prate);
> -	*l = quotient;
> +	remainder = do_div(rate, prate);

This does not compile on arm32 target.

Regards,
Bjorn

>  
> -	if ((remainder * 2) / prate)
> -		*l = *l + 1;
> +	*l = rate + (u32)(remainder * 2 >= prate);
>  }
>  
>  static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> -- 
> 2.25.1
> 

