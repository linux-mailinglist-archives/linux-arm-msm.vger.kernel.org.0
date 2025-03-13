Return-Path: <linux-arm-msm+bounces-51327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DF6A60486
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 23:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4038F19C4658
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 22:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0971F791A;
	Thu, 13 Mar 2025 22:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcW5SMgw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A8F1F5853;
	Thu, 13 Mar 2025 22:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741905593; cv=none; b=ReGTOOVB7rMtMS86h50F6c199eig0+i4F3LpGCnpWayADDuOIcJ/FaA6hcUxNfG9Ly7+h7SrtMUSJGD0Y0J6F0d+i46HIxm2RWdfgA2sXOweffXMw75/an3vAAiBmrqOCGJwmlPUsRWgYpZaPwJ5LDEc1nEBwL4Ah3soiJl7YvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741905593; c=relaxed/simple;
	bh=1i3qPR1K02u68dXpziD9YbLDwBYNBX/fHG+w5jOQ7Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYeo2kLlcaJpIEs54HaXfhnUHLuAA0iDNCqPFJdRAepjG7aB8+ZuzT3cZXD5bCdIYxcGnNOIyyl8Pux8BdjvD2Yjs/x5Q9GmTH6pF8BVOUbwL39xim5wJgBteMDf+Zp/xDxksNQFJCb1Sj8zwZ7yJxk7oBvNuhhBuV47xb94Bbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcW5SMgw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08C4C4CEDD;
	Thu, 13 Mar 2025 22:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741905593;
	bh=1i3qPR1K02u68dXpziD9YbLDwBYNBX/fHG+w5jOQ7Hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YcW5SMgwCy8sjNkGjWvm54fM2z1vLRSHjC4GjqVkNCqHQ1fZwu4fwOro7H4u9TfPg
	 1Z5WqCZTz6DiNb98vmk+XJhPPyZbOck2zCu6JHphJbsSOy+Nl+on9r/XyPIxJ5WGes
	 5mlTRc0hnsywS/YzCuQbOJzpxC4IrYNC0Pa/DUBT7RtpCeVVZWRdzXCL3eeOogVLNe
	 m/83bfdZR6YE9PM+TU7ukYFuqB2zD9+kdESiw9BTD1144auZmVRbNKlpO7HXXl1VTP
	 DixLU6AUBH0cDSQQmY+0Nn9KukIgyRj91oh1Tno+Lac/GngR8T+rn80n4PLWMVoztk
	 pgBFGTvILpNWA==
Date: Thu, 13 Mar 2025 17:39:50 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] clk: qcom: common: Add support to configure PLL
Message-ID: <enbhxe2ewhguebg7hvjadzqajftfff6whd27smkdwfzz4hbvwm@go72ix5c4d6k>
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <20250306-videocc-pll-multi-pd-voting-v2-2-0cd00612bc0e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-videocc-pll-multi-pd-voting-v2-2-0cd00612bc0e@quicinc.com>

On Thu, Mar 06, 2025 at 02:25:34PM +0530, Jagadeesh Kona wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Integrate PLL configuration into clk_alpha_pll structure and add support
> for qcom_cc_clk_alpha_pll_configure() function which can be used to
> configure the clock controller PLLs from common core code.

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
starts with "Describe your problem."

I don't see a problem description here.

> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.h |  2 ++
>  drivers/clk/qcom/common.c        | 55 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/common.h        |  1 +
>  3 files changed, 58 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index 79aca8525262211ae5295245427d4540abf1e09a..943320cdcd10a6c07fcd74dccb88be847dc086c2 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -81,6 +81,7 @@ struct pll_vco {
>   * struct clk_alpha_pll - phase locked loop (PLL)
>   * @offset: base address of registers
>   * @regs: alpha pll register map (see @clk_alpha_pll_regs)
> + * @config: array of pll settings
>   * @vco_table: array of VCO settings
>   * @num_vco: number of VCO settings in @vco_table
>   * @flags: bitmask to indicate features supported by the hardware
> @@ -90,6 +91,7 @@ struct clk_alpha_pll {
>  	u32 offset;
>  	const u8 *regs;
>  
> +	const struct alpha_pll_config *config;
>  	const struct pll_vco *vco_table;
>  	size_t num_vco;
>  #define SUPPORTS_OFFLINE_REQ		BIT(0)
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 9e3380fd718198c9fe63d7361615a91c3ecb3d60..74d062b5da0647f7f2bd8fd7a004ffdb1116c1ea 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -13,6 +13,7 @@
>  #include <linux/of.h>
>  
>  #include "common.h"
> +#include "clk-alpha-pll.h"
>  #include "clk-rcg.h"
>  #include "clk-regmap.h"
>  #include "reset.h"
> @@ -284,6 +285,60 @@ static int qcom_cc_icc_register(struct device *dev,
>  						     desc->num_icc_hws, icd);
>  }
>  
> +static void qcom_cc_clk_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap)
> +{
> +	if (!pll->config || !pll->regs)
> +		return;
> +
> +	switch (GET_PLL_TYPE(pll)) {
> +	case CLK_ALPHA_PLL_TYPE_LUCID_OLE:
> +		clk_lucid_ole_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_LUCID_EVO:
> +		clk_lucid_evo_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_TAYCAN_ELU:
> +		clk_taycan_elu_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_RIVIAN_EVO:
> +		clk_rivian_evo_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_TRION:
> +		clk_trion_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_HUAYRA_2290:
> +		clk_huayra_2290_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_FABIA:
> +		clk_fabia_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_AGERA:
> +		clk_agera_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_PONGO_ELU:
> +		clk_pongo_elu_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_ZONDA:
> +	case CLK_ALPHA_PLL_TYPE_ZONDA_OLE:
> +		clk_zonda_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_STROMER:
> +	case CLK_ALPHA_PLL_TYPE_STROMER_PLUS:
> +		clk_stromer_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_DEFAULT:
> +	case CLK_ALPHA_PLL_TYPE_DEFAULT_EVO:
> +	case CLK_ALPHA_PLL_TYPE_HUAYRA:
> +	case CLK_ALPHA_PLL_TYPE_HUAYRA_APSS:
> +	case CLK_ALPHA_PLL_TYPE_BRAMMO:
> +	case CLK_ALPHA_PLL_TYPE_BRAMMO_EVO:
> +		clk_alpha_pll_configure(pll, regmap, pll->config);
> +		break;
> +	default:

This would be annoying to hit when adding a new PLL type, a BUG(); would
be useful here.

> +		break;
> +	}
> +}
> +
>  int qcom_cc_really_probe(struct device *dev,
>  			 const struct qcom_cc_desc *desc, struct regmap *regmap)
>  {
> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> index 7ace5d7f5836aa81431153ba92d8f14f2ffe8147..2066c8937936235d7bd03ab3225d4b3f4fb08dd0 100644
> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -18,6 +18,7 @@ struct clk_hw;
>  #define PLL_BIAS_COUNT_MASK	0x3f
>  #define PLL_VOTE_FSM_ENA	BIT(20)
>  #define PLL_VOTE_FSM_RESET	BIT(21)
> +#define GET_PLL_TYPE(pll)	((pll->regs - clk_alpha_pll_regs[0]) / PLL_OFF_MAX_REGS)

Why would this go in qcom/common.h, when clk_alpha_pll_regs is defined
in clk-alpha-pll.h?

Regards,
Bjorn

>  
>  struct qcom_icc_hws_data {
>  	int master_id;
> 
> -- 
> 2.34.1
> 

