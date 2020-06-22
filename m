Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A61203E2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 19:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730038AbgFVRlg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 13:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729605AbgFVRlf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 13:41:35 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F67C061795
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 10:41:35 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id k15so13744996otp.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 10:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dp8vvD2CI6znDHHfd68Sf9CL9jtb/dkv5bravtbMg7A=;
        b=Wm31U41Y8LtB0XivKMN8OXczcrfTJ+xdbLxBxhT6nCXCHdV2c3QkPn8neJ5NSYfXlZ
         igvQSF8PjyoQ2Dq3PyQpGsyrGftMb40MlpdsiWJ8PTC+nSayXqDhervGxUet+8hk1eqf
         rEwrHjbbetFFr05CU4r57mPUTFJVo2HeXjCl4tz7I8ct3v7ybioFhg/IbqoXv1/990yT
         UVHl1EQaflUDsNMO640JWPcSxuzm5ZLYsUkU9Jo5RamkrF4DjRjD1MzZS2T9VYVBcL/W
         gFxu+1/c/jjfx5CL2TM4Cl2p9MQhOxYM5x1b+USeGyEl+Wp50VjhBkYfnQvUmLd+8X3F
         llHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dp8vvD2CI6znDHHfd68Sf9CL9jtb/dkv5bravtbMg7A=;
        b=fBFip4JZ3jSbERXLQoPKQCW8PcqQF5qYPu7+xWL5+RoHk5jhljNMznsx+lm5r9sJh6
         UwH85b+IzOskCnZKPPQ5aoY2+Izkq4ASMyrPEjWZ+FpX+sduUdNJiOZJ5hRanYfpTxid
         e8L2hp3IRSNEVq+Uvsz/k9pG9U1zdWxgIb6lLOUvCjfR+wOb98/sDACFqi4css/XrNfP
         p/NldOKoabXWtdfgOT5TxIARpgNq/BZOQWJuKUCiLiOJB1tZKJCHkC0jW+1iYFKaQyzC
         eC1hg69bHc3oiDDbMAJlzqvCO8gTMvUiZ4p6tZ8FE5vZtJcEUeAu1/VYrOLziddnueM4
         reZg==
X-Gm-Message-State: AOAM532oregE6kvH1hWWq02Hl16zVYWs03dBZ9VsOMx5/JUoQcKFJG+o
        Dc+mAX1oXXDy8ndTWAKaVj3dIEXO75Y=
X-Google-Smtp-Source: ABdhPJxU47N0XE/3K90NJgWY/Y5EeYU97hoLQGnqSmlFe+zILC8u6n0gXCC/3WKOYcliNydMfKml3g==
X-Received: by 2002:a05:6830:2004:: with SMTP id e4mr15096660otp.85.1592847693553;
        Mon, 22 Jun 2020 10:41:33 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j2sm3420573otk.61.2020.06.22.10.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:41:32 -0700 (PDT)
Date:   Mon, 22 Jun 2020 10:38:48 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/1] clk: qcom: gcc-msm8994: Add missing clocks,
 resets and GDSCs
Message-ID: <20200622173848.GF2421@builder.lan>
References: <20200622091843.57589-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622091843.57589-1-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 22 Jun 02:18 PDT 2020, Konrad Dybcio wrote:

> changes since v1:
> - refrain from reordering defines in the header

The changelog goes after '---' below.

> 
> This change adds GDSCs, resets and most of the missing
> clocks to the msm8994 GCC driver. The remaining ones
> are of local_vote_clk and gate_clk type, which are not
> yet supported upstream. Also reorder them to match the
> original downstream driver.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  drivers/clk/qcom/gcc-msm8994.c               | 388 ++++++++++++++++++-
>  include/dt-bindings/clock/qcom,gcc-msm8994.h |  36 ++
>  2 files changed, 423 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
> index b7fc8c7ba195..144d2ba7a9be 100644
> --- a/drivers/clk/qcom/gcc-msm8994.c
> +++ b/drivers/clk/qcom/gcc-msm8994.c
> @@ -20,6 +20,7 @@
>  #include "clk-rcg.h"
>  #include "clk-branch.h"
>  #include "reset.h"
> +#include "gdsc.h"
>  
>  enum {
>  	P_XO,
> @@ -1772,6 +1773,32 @@ static struct clk_branch gcc_gp3_clk = {
>  	},
>  };
>  
> +static struct clk_branch gcc_lpass_q6_axi_clk = {
> +	.halt_reg = 0x0280,
> +	.clkr = {
> +		.enable_reg = 0x0280,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data)
> +		{
> +			.name = "gcc_lpass_q6_axi_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
> +	.halt_reg = 0x0284,
> +	.clkr = {
> +		.enable_reg = 0x0284,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data)
> +		{
> +			.name = "gcc_mss_q6_bimc_axi_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_branch gcc_pcie_0_aux_clk = {
>  	.halt_reg = 0x1ad4,
>  	.clkr = {
> @@ -1790,6 +1817,32 @@ static struct clk_branch gcc_pcie_0_aux_clk = {
>  	},
>  };
>  
> +static struct clk_branch gcc_pcie_0_cfg_ahb_clk = {
> +	.halt_reg = 0x1ad0,
> +	.clkr = {
> +		.enable_reg = 0x1ad0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data)
> +		{
> +			.name = "gcc_pcie_0_cfg_ahb_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_pcie_0_mstr_axi_clk = {
> +	.halt_reg = 0x1acc,
> +	.clkr = {
> +		.enable_reg = 0x1acc,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data)
> +		{
> +			.name = "gcc_pcie_0_mstr_axi_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_branch gcc_pcie_0_pipe_clk = {
>  	.halt_reg = 0x1ad8,
>  	.halt_check = BRANCH_HALT_DELAY,
> @@ -1809,6 +1862,20 @@ static struct clk_branch gcc_pcie_0_pipe_clk = {
>  	},
>  };
>  
> +static struct clk_branch gcc_pcie_0_slv_axi_clk = {
> +	.halt_reg = 0x1ac8,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x1ac8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data)
> +		{
> +			.name = "gcc_pcie_0_slv_axi_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_branch gcc_pcie_1_aux_clk = {
>  	.halt_reg = 0x1b54,
>  	.clkr = {
> @@ -1827,6 +1894,32 @@ static struct clk_branch gcc_pcie_1_aux_clk = {
>  	},
>  };
>  
> +static struct clk_branch gcc_pcie_1_cfg_ahb_clk = {
> +	.halt_reg = 0x1b54,
> +	.clkr = {
> +		.enable_reg = 0x1b54,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data)
> +		{
> +			.name = "gcc_pcie_1_cfg_ahb_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_pcie_1_mstr_axi_clk = {
> +	.halt_reg = 0x1b50,
> +	.clkr = {
> +		.enable_reg = 0x1b50,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data)
> +		{
> +			.name = "gcc_pcie_1_mstr_axi_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_branch gcc_pcie_1_pipe_clk = {
>  	.halt_reg = 0x1b58,
>  	.halt_check = BRANCH_HALT_DELAY,
> @@ -1846,6 +1939,19 @@ static struct clk_branch gcc_pcie_1_pipe_clk = {
>  	},
>  };
>  
> +static struct clk_branch gcc_pcie_1_slv_axi_clk = {
> +	.halt_reg = 0x1b48,
> +	.clkr = {
> +		.enable_reg = 0x1b48,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data)
> +		{
> +			.name = "gcc_pcie_1_slv_axi_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_branch gcc_pdm2_clk = {
>  	.halt_reg = 0x0ccc,
>  	.clkr = {
> @@ -1864,6 +1970,19 @@ static struct clk_branch gcc_pdm2_clk = {
>  	},
>  };
>  
> +static struct clk_branch gcc_pdm_ahb_clk = {
> +	.halt_reg = 0x0cc4,
> +	.clkr = {
> +		.enable_reg = 0x0cc4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data)
> +		{
> +			.name = "gcc_pdm_ahb_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_branch gcc_sdcc1_apps_clk = {
>  	.halt_reg = 0x04c4,
>  	.clkr = {
> @@ -1899,6 +2018,23 @@ static struct clk_branch gcc_sdcc1_ahb_clk = {
>  	},
>  };
>  
> +static struct clk_branch gcc_sdcc2_ahb_clk = {
> +	.halt_reg = 0x0508,
> +	.clkr = {
> +		.enable_reg = 0x0508,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data)
> +		{
> +			.name = "gcc_sdcc2_ahb_clk",
> +			.parent_names = (const char *[]){

Please convert these to use .parent_data instead.

Regards,
Bjorn
