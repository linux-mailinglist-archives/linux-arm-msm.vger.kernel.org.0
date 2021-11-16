Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52FA452CDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 09:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbhKPIgE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 03:36:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:41854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232144AbhKPIgE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 03:36:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62A8761104;
        Tue, 16 Nov 2021 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637051587;
        bh=815Kbc3zKvskUedozJdeNakdfBrmFEPbGS+tpaXNMZc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mkuN+v2TSJerwZ+iWmj0Yo1rMAqQxzk8uDXNs7HbZ5J01h7rJXQhpykk3zFr1sZtj
         2tvUy4zq4W9MyKdmQDsU2e07RqdQ1k0iK7WKSNZFdSbHSttE8W296Ls0+U+mCzPNmk
         A5mDsIc+V7YWW85j0m3Q/G/qWWv3xS/uEJqcxb1BJv3i77heJQFFEKbOSKJiMsb3pE
         vGX1ifcc5SREMLFGJYZGtS4z9An2ZjCG8mraLuZ76ipBZoq4hpfuQwA+4D+AUn2Jxg
         z7iTPpPwO2zMVS51DfB8kpbtrNyBAdYH0Fd6MIt4J4YQYamsCvQ582XBRh7vC2jBPl
         Zy772gTBbSR/w==
Date:   Tue, 16 Nov 2021 14:03:02 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        tglx@linutronix.de, maz@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 3/6] clk: qcom: Add SDX65 GCC support
Message-ID: <YZNsvjwp0/AX0Hdo@matsya>
References: <cover.1637047731.git.quic_vamslank@quicinc.com>
 <b61d16ad890bcf07057f8fbd83dfffaf9812cda6.1637047731.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b61d16ad890bcf07057f8fbd83dfffaf9812cda6.1637047731.git.quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-11-21, 23:38, quic_vamslank@quicinc.com wrote:
> From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add Global Clock Controller (GCC) support for SDX65 SoCs from Qualcomm.
> 
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> Reported-by: kernel test robot <lkp@intel.com>

Missing support reported ??

> +static struct clk_branch gcc_ahb_pcie_link_clk = {
> +	.halt_reg = 0x2e004,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2e004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_ahb_pcie_link_clk",
> +			.flags = CLK_IS_CRITICAL,
> +			.ops = &clk_branch2_ops,
> +		},

If this clk is critical then why model in linux, enable directly in probe
and leave it...?

> +static struct clk_branch gcc_pcie_0_clkref_en = {
> +	.halt_reg = 0x88004,
> +	.halt_check = BRANCH_HALT_DELAY,

Why delay, add a comment at least for that

> +	.clkr = {
> +		.enable_reg = 0x88004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_pcie_0_clkref_en",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_pcie_aux_clk = {
> +	.halt_reg = 0x43034,
> +	.halt_check = BRANCH_HALT_DELAY,

Here too

> +static struct clk_branch gcc_pcie_mstr_axi_clk = {
> +	.halt_reg = 0x43024,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x43024,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x6d010,
> +		.enable_mask = BIT(1),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_pcie_mstr_axi_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_pcie_pipe_clk = {
> +	.halt_reg = 0x4303c,
> +	.halt_check = BRANCH_HALT_DELAY,

here as well and few more places I guess

> +static struct clk_branch gcc_xo_pcie_link_clk = {
> +	.halt_reg = 0x2e008,
> +	.halt_check = BRANCH_HALT,
> +	.hwcg_reg = 0x2e008,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x2e008,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_xo_pcie_link_clk",
> +			.flags = CLK_IS_CRITICAL,

Here as well
-- 
~Vinod
