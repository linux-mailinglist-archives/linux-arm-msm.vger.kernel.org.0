Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C72003C3238
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 05:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhGJD3E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 23:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbhGJD3C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 23:29:02 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD97C0613E8
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 20:26:16 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso11535212otu.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 20:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ra+xJSbhXXgWkLoADeex1V1YtnKaTSQCmputOIAQhfQ=;
        b=Eck1KL7jpfg2umMyDm8NwL5PeYhA4XVRCFT0ZWOcqsPGiJFy0DBjzklcvWBA7SQbCL
         pyz2YnnP+ianjQWb4OsAERXRf5aAUoAgfcOpOAt5b+bFkaasKd4X0PSd2FGEfuJzr8Du
         ZS9xRX5HWdXrXOrw/7XstKtMKcQXaX2hSSPfmuvQibizs27TmYS/aSAvFBeU1vC2kJs0
         bm1iA29MgEuNRsgrZpuoTNMJ8JTa7bN9eIWiFg6IIDS3w2YQPDGWv7/tw3uS7wzyM+za
         VVwVCOsiroZh8sjpXlQ50BwDyZv97ZLDQzy5JwM7BsbQ6twTHK+Wbi5xOJI/FocUFADW
         iIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ra+xJSbhXXgWkLoADeex1V1YtnKaTSQCmputOIAQhfQ=;
        b=YLv4ufxipweoJlJEHjNXBjBDeFPFKlF3s3pPP44tr5MEJEP7wNW6iveRRBA89ZXH9u
         waRVGk2IdK5r/t3g98zOiehvVkCQ39znlDakar9c6+IbNbEkYUkxdQrVQJ3OqPw70SAz
         f8sghoyY0cNAALssnDhDz0wqtjYbNTRTbikPLcyocm1hQkPzKB/4GGrYIdNZH6VrqqKN
         Fbp/5tB++cJFUwMunaBvT4hhAs5DGA3xxu1cWkggCWNVOVF8NACkNlx+TzY3h5d4Elru
         oJWGbP3nOWUVJyPBT7BbDu/sheteTzVTV1jB/3jFWlcVTabhNWe0V4PD6NNExI3hqGiv
         jC2Q==
X-Gm-Message-State: AOAM5308Yn95fw1jlFohYODYxTk5xsd5suQItEM7D16lUlnZzovHF9mS
        dqdR9NVxkhkzyT45QkHZuN/Zow==
X-Google-Smtp-Source: ABdhPJx+p2RJQqhOjRDzM7fJYiEOT65Txi3qwcRbnLzDvEiuyEWIGzz8Mc9mi3ULW/j2jkW7PNy7gA==
X-Received: by 2002:a9d:7f0b:: with SMTP id j11mr30439496otq.369.1625887576101;
        Fri, 09 Jul 2021 20:26:16 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i133sm1632307oia.2.2021.07.09.20.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:26:15 -0700 (PDT)
Date:   Fri, 9 Jul 2021 22:26:13 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH 2/5] clk: qcom: Add SDX65 GCC support
Message-ID: <YOkTVXcZpSRUE+Wy@yoga>
References: <20210709200339.17638-1-quic_vamslank@quicinc.com>
 <20210709200339.17638-3-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709200339.17638-3-quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 09 Jul 15:03 CDT 2021, quic_vamslank@quicinc.com wrote:

> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add Global Clock Controller (GCC) support for SDX65 SoCs from Qualcomm.
> 

This doesn't mention the fact that you add a new PLL type. I do however
think you should do that in a separate commit, preceding the gcc driver
patch.

> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig         |    8 +
>  drivers/clk/qcom/Makefile        |    1 +
>  drivers/clk/qcom/clk-alpha-pll.c |  170 +++
>  drivers/clk/qcom/clk-alpha-pll.h |    4 +
>  drivers/clk/qcom/clk-rcg.h       |    4 +
>  drivers/clk/qcom/gcc-sdx65.c     | 1648 ++++++++++++++++++++++++++++++
>  6 files changed, 1835 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-sdx65.c
[..]
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index 99efcc7f8d88..33a7fe992207 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -149,6 +149,10 @@ struct clk_rcg2 {
>  	const struct freq_tbl	*freq_tbl;
>  	struct clk_regmap	clkr;
>  	u8			cfg_off;
> +	u8                      flags;
> +#define FORCE_ENABLE_RCG        BIT(0)

Unused.

> +#define HW_CLK_CTRL_MODE        BIT(1)

We don't implement HW_CLK_CTRL_MODE upstream yet, so you shouldn't
specify it for your clocks - or just add the definefor it.

> +#define DFS_SUPPORT             BIT(2)

Unused.

>  };
>  
>  #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
> diff --git a/drivers/clk/qcom/gcc-sdx65.c b/drivers/clk/qcom/gcc-sdx65.c
[..]
> +static struct clk_alpha_pll_postdiv gpll0_out_even = {
> +	.offset = 0x0,
> +	.post_div_shift = 10,
> +	.post_div_table = post_div_table_gpll0_out_even,
> +	.num_post_div = ARRAY_SIZE(post_div_table_gpll0_out_even),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "gpll0_out_even",
> +		.parent_data = &(const struct clk_parent_data){

A parent_data with a single .hw is better specified using parent_hws.

> +			.hw = &gpll0.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
> +	},
> +};
> +
> +static const struct parent_map gcc_parent_map_0[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_GPLL0_OUT_MAIN, 1 },
> +	{ P_GPLL0_OUT_EVEN, 6 },
> +	{ P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_0[] = {
> +	{ .fw_name = "bi_tcxo" },
> +	{ .hw = &gpll0.clkr.hw },
> +	{ .hw = &gpll0_out_even.clkr.hw },
> +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> +};

Nice to see that you use clk_parent_data, fw_name and hw right from the
start.

We typically remove core_bi_pll_test_se from the various parent lists,
as this is not something that's expected to be ever used. Please do the
same.

> +
> +static const struct clk_parent_data gcc_parent_data_0_ao[] = {
> +	{ .fw_name = "bi_tcxo_ao" },
> +	{ .hw = &gpll0.clkr.hw },
> +	{ .hw = &gpll0_out_even.clkr.hw },
> +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> +};
[..]
> +static struct clk_regmap *gcc_sdx65_clocks[] = {
> +	[GCC_AHB_PCIE_LINK_CLK] = &gcc_ahb_pcie_link_clk.clkr,
> +	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
> +	[GCC_BLSP1_QUP1_I2C_APPS_CLK] = &gcc_blsp1_qup1_i2c_apps_clk.clkr,
> +	[GCC_BLSP1_QUP1_I2C_APPS_CLK_SRC] =
> +		&gcc_blsp1_qup1_i2c_apps_clk_src.clkr,

Skip the line wrap.

> +	[GCC_BLSP1_QUP1_SPI_APPS_CLK] = &gcc_blsp1_qup1_spi_apps_clk.clkr,
> +	[GCC_BLSP1_QUP1_SPI_APPS_CLK_SRC] =
> +		&gcc_blsp1_qup1_spi_apps_clk_src.clkr,
> +	[GCC_BLSP1_QUP2_I2C_APPS_CLK] = &gcc_blsp1_qup2_i2c_apps_clk.clkr,
> +	[GCC_BLSP1_QUP2_I2C_APPS_CLK_SRC] =
> +		&gcc_blsp1_qup2_i2c_apps_clk_src.clkr,
> +	[GCC_BLSP1_QUP2_SPI_APPS_CLK] = &gcc_blsp1_qup2_spi_apps_clk.clkr,
> +	[GCC_BLSP1_QUP2_SPI_APPS_CLK_SRC] =
[..]
> +static int gcc_sdx65_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +	int ret;
> +
> +	regmap = qcom_cc_map(pdev, &gcc_sdx65_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +	/*
> +	 * Keep the clocks always-ON as they are critical to the functioning
> +	 * of the system:
> +	 * GCC_SYS_NOC_CPUSS_AHB_CLK, GCC_CPUSS_AHB_CLK, GCC_CPUSS_GNOC_CLK
> +	 */
> +	regmap_update_bits(regmap, 0x6d008, BIT(0), BIT(0));
> +	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21));
> +	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22));
> +
> +	ret = qcom_cc_really_probe(pdev, &gcc_sdx65_desc, regmap);

Just "return qcom_cc_really_probe()"

Thanks,
Bjorn
