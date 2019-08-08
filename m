Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE2E2859A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 07:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbfHHFOO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 01:14:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:50376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbfHHFON (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 01:14:13 -0400
Received: from localhost (unknown [122.178.245.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D18022186A;
        Thu,  8 Aug 2019 05:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565241252;
        bh=uTQbu9mGSxVTJETQA4FUVAen+xLMIIOIE1bWzh+FlNk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GntMZuHjbR72qZbxMF3Y4KDcZuAsLd/9O+2tfW3Q5tK1auI7H/nH3dVqWsRPAu34r
         3iPb4UGv9B/HPyejvqHjx0GTuNYqTXRfgvmIhzdeiN58f3rBJ+FxiBAX/AUxEpSGks
         BhLEIpap271YTHWqbkMlUx8RhCv5r3swH2UPWE/o=
Date:   Thu, 8 Aug 2019 10:43:01 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v1 2/2] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
Message-ID: <20190808051301.GL12733@vkoul-mobl.Dlink>
References: <20190807181301.15326-1-tdas@codeaurora.org>
 <20190807181301.15326-3-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807181301.15326-3-tdas@codeaurora.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07-08-19, 23:43, Taniya Das wrote:

> +static struct clk_alpha_pll gpll0;
> +static struct clk_alpha_pll gpll1;
> +static struct clk_alpha_pll gpll4;
> +static struct clk_alpha_pll gpll6;
> +static struct clk_alpha_pll gpll7;
> +static struct clk_alpha_pll_postdiv gpll0_out_even;

I am not sure we need these, reordering code and getting rid of them
should be easy enough (i did that for sm8150)

> +static const struct parent_map gcc_parent_map_0[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_GPLL0_OUT_MAIN, 1 },
> +	{ P_GPLL0_OUT_EVEN, 6 },
> +	{ P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_0[] = {
> +	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
> +	{ .hw = &gpll0.clkr.hw },
> +	{ .hw = &gpll0_out_even.clkr.hw },
> +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },

This is legacy test, so we would want only fw_name being there

> +static struct clk_branch gcc_camera_ahb_clk = {
> +	.halt_reg = 0xb008,
> +	.halt_check = BRANCH_HALT,
> +	.hwcg_reg = 0xb008,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0xb008,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_camera_ahb_clk",
> +			.flags = CLK_IS_CRITICAL,

It would help to explain why this clk is critical

> +static struct clk_branch gcc_disp_gpll0_div_clk_src = {
> +	.halt_check = BRANCH_HALT_DELAY,

And why this needs a delay
-- 
~Vinod
