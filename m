Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F10742F6A89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 20:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728963AbhANTIP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 14:08:15 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:40722 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbhANTIO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 14:08:14 -0500
Received: by mail-ot1-f53.google.com with SMTP id j12so6196937ota.7;
        Thu, 14 Jan 2021 11:07:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mZwsgvKSWJZAJ4CH2N/UlUigQHip7rxk7Ry0cLMON8M=;
        b=IcqL8uD0EaRUr4G9RV/R5EC1qEGDA4Z1Z0aX47caiSEQGER7sFOohi9H9x+Kng1YDo
         Ioq3GcOWDFLL+/ZP2y+BgwRhotNWmNHoREAPNWJ7yksoiW3MlZjqcjFVXjG90aSlzmtY
         aCJERUB/HWQQBBzPJmYdomsswDpkVKmJ/ObfCNAZS8VVmPYis1A6Ft6zQiqosPx1EiDq
         UWrh8fWSudKqpORIZN+VnoQ8xd7TPwRO01OAc/kLv1fllLLW/nLKjnAzVD8qNterLTG2
         MtgHzHsC4Au2TCn2NUVMCbwtO50MHT/xl9bRRM5FFpyQ8pmgy/g7W3z0SA4Du2XlR0W4
         darg==
X-Gm-Message-State: AOAM531PzftmyhqqFwa3NL+/plqBNeE+fOBQe0kOqPRRAYOvI8FNSkfy
        dDToQt6sz2pTos/3DYCzaEEuGgU+6A==
X-Google-Smtp-Source: ABdhPJw+9TEDn4HpbdJVryEihHOZfKukSA/Wmx3kcWOtdOpv2HTYrt7Zs+pKSXCPkEoTMAo+7MkJIg==
X-Received: by 2002:a9d:f66:: with SMTP id 93mr5434307ott.289.1610651253224;
        Thu, 14 Jan 2021 11:07:33 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g12sm1274999oos.8.2021.01.14.11.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 11:07:31 -0800 (PST)
Received: (nullmailer pid 3386229 invoked by uid 1000);
        Thu, 14 Jan 2021 19:07:30 -0000
Date:   Thu, 14 Jan 2021 13:07:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/9] clk: qcom: gcc-msm8998: Wire up gcc_mmss_gpll0 clock
Message-ID: <20210114190730.GA3384844@robh.at.kernel.org>
References: <20210109134617.146275-1-angelogioacchino.delregno@somainline.org>
 <20210109134617.146275-2-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210109134617.146275-2-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jan 09, 2021 at 02:46:09PM +0100, AngeloGioacchino Del Regno wrote:
> This clock enables the GPLL0 output to the multimedia subsystem
> clock controller.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/clk/qcom/gcc-msm8998.c               | 17 +++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-msm8998.h |  1 +

Please put all the dt header changes in their own patch.

>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
> index 9d7016bcd680..d51c556851ca 100644
> --- a/drivers/clk/qcom/gcc-msm8998.c
> +++ b/drivers/clk/qcom/gcc-msm8998.c
> @@ -1341,6 +1341,22 @@ static struct clk_branch gcc_boot_rom_ahb_clk = {
>  	},
>  };
>  
> +static struct clk_branch gcc_mmss_gpll0_clk = {
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x5200c,
> +		.enable_mask = BIT(1),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_mmss_gpll0_clk",
> +			.parent_names = (const char *[]){
> +				"gpll0_out_main",
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_branch gcc_mss_gpll0_div_clk_src = {
>  	.halt_check = BRANCH_HALT_DELAY,
>  	.clkr = {
> @@ -2944,6 +2960,7 @@ static struct clk_regmap *gcc_msm8998_clocks[] = {
>  	[GCC_MSS_GPLL0_DIV_CLK_SRC] = &gcc_mss_gpll0_div_clk_src.clkr,
>  	[GCC_MSS_SNOC_AXI_CLK] = &gcc_mss_snoc_axi_clk.clkr,
>  	[GCC_MSS_MNOC_BIMC_AXI_CLK] = &gcc_mss_mnoc_bimc_axi_clk.clkr,
> +	[GCC_MMSS_GPLL0_CLK] = &gcc_mmss_gpll0_clk.clkr,
>  };
>  
>  static struct gdsc *gcc_msm8998_gdscs[] = {
> diff --git a/include/dt-bindings/clock/qcom,gcc-msm8998.h b/include/dt-bindings/clock/qcom,gcc-msm8998.h
> index 6a73a174f049..47ca17df780b 100644
> --- a/include/dt-bindings/clock/qcom,gcc-msm8998.h
> +++ b/include/dt-bindings/clock/qcom,gcc-msm8998.h
> @@ -184,6 +184,7 @@
>  #define GCC_MSS_MNOC_BIMC_AXI_CLK				175
>  #define GCC_BIMC_GFX_CLK					176
>  #define UFS_UNIPRO_CORE_CLK_SRC					177
> +#define GCC_MMSS_GPLL0_CLK					178
>  
>  #define PCIE_0_GDSC						0
>  #define UFS_GDSC						1
> -- 
> 2.29.2
> 
