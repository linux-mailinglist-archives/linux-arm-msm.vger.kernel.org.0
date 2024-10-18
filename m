Return-Path: <linux-arm-msm+bounces-35040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E21969A47C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 22:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E4871F23DA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240A1202F91;
	Fri, 18 Oct 2024 20:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="AzS5mWF2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E313976C61;
	Fri, 18 Oct 2024 20:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729282941; cv=none; b=k7flRHARBDLdeDb2TX3xJ8qondd+vqoPc2UG65j+fCfNTXUnywfMgzY0acTMHqYV6kDaeJBu2G57o/9PGOdfRL3xB6hRAFex/gObF3/wI5pUc/isHJ0iUTwLtQ/aiPo8ofG37CNOxiNmc5GRGJyAbjl94g47ZYP8zrO8pF+f4Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729282941; c=relaxed/simple;
	bh=AEpIX87u6ly5mOIlQvmun4Zx3DN9eei8xj2DPqx9DW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubjWfa5wEKofaVPjiHnGbFl3TYP26a8n8LpblQ/YINUAWyALoDdUFUUHJA2EnfYDFekBXoAuL6dzUZQ714pDMTp4vUOKAL+Ffcl5/8n0slFI0iBlvvbk0wPoz+kohmTdo5RL+J26UY5npQi0m//VN3i8RaFUTOPYtDwcA5SzM00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=AzS5mWF2; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 1tSztRJVdXf9d1tSztsQxM; Fri, 18 Oct 2024 22:21:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1729282861;
	bh=fb+WEgTQCQB3j1AwAK+l/pubUHA/JnOar0I0oFEQRe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=AzS5mWF23ebjKdIqHWt4ynRDTxEE14o1MhSB5PunPSpJr6eL1BbnCX+GP3Gog2JSH
	 INE4swjfvQFonEr0E8lEN11yyl4NEI47ySLwlflC0CEYSBobufwhn0QuV5JXVHg14N
	 ufZ5rPJTXLNe0sWokcH+L25YSskr6ptc9z2olyworMasDaur1Utd8ZT3F8Q+kHTLLc
	 8ht5M8kBiIVtR5k5M2xkXPjAyOPtoQcebgjlfWvjjZefTnRdrFX4DhjO2FtjUzz25e
	 ZUSfgPp8LNPnPnDWJcb4WNP4sIcY/s6goQ8/3LRTyrgPykP5h7aGXdlB8dKMBhHlmu
	 UId0/huBU2HZg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 18 Oct 2024 22:21:01 +0200
X-ME-IP: 90.11.132.44
Message-ID: <f78c5fce-4d7e-429b-945a-8e62cb9a2350@wanadoo.fr>
Date: Fri, 18 Oct 2024 22:20:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] clk: qcom: clk-alpha-pll: Add support for dynamic
 update for slewing PLLs
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-2-4cfb96d779ae@quicinc.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241019-qcs615-mm-clockcontroller-v1-2-4cfb96d779ae@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 18/10/2024 à 21:15, Taniya Das a écrit :
> The alpha PLLs which slew to a new frequency at runtime would require
> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
> which can support the slewing of the PLL to a new frequency.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>   drivers/clk/qcom/clk-alpha-pll.c | 172 +++++++++++++++++++++++++++++++++++++++
>   drivers/clk/qcom/clk-alpha-pll.h |   1 +
>   2 files changed, 173 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 03cc7aa092480bfdd9eaa986d44f0545944b3b89..6f51bdd2b500ceeccbca0aefd5003df10ad1e1ae 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2758,3 +2758,175 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
>   	.set_rate = clk_zonda_pll_set_rate,
>   };
>   EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
> +
> +static int clk_alpha_pll_slew_update(struct clk_alpha_pll *pll)
> +{
> +	int ret = 0;

Nitpick: unneeded initialisation

> +	u32 val;
> +
> +	regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_UPDATE, PLL_UPDATE);
> +	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
> +
> +	ret = wait_for_pll_update(pll);
> +	if (ret)
> +		return ret;
> +	/*
> +	 * Hardware programming mandates a wait of at least 570ns before polling the LOCK
> +	 * detect bit. Have a delay of 1us just to be safe.
> +	 */
> +	mb();
> +	udelay(1);
> +
> +	return wait_for_pll_enable_lock(pll);
> +}

...

> +static int clk_alpha_pll_slew_enable(struct clk_hw *hw)
> +{
> +	int rc;
> +
> +	rc = clk_alpha_pll_calibrate(hw);
> +	if (rc)
> +		return rc;
> +
> +	rc = clk_alpha_pll_enable(hw);
> +
> +	return rc;

Nitpick: return clk_alpha_pll_enable(hw);

> +}
> +

