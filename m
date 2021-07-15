Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFE23CAD81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 22:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242291AbhGOUFK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 16:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239621AbhGOUFD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 16:05:03 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343A1C0613EF
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jul 2021 12:50:05 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 75-20020a9d08510000b02904acfe6bcccaso7391339oty.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jul 2021 12:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1YLndUxOOPY8Sr1BrjsF6xRwJEfXRqU5cb5ChMJ5I0o=;
        b=ilM60R3oL3fDNSoPOqAJo5H35jI1pAxERRGZ5FINwozVhTWmMylm937FoNsNZTIjiS
         30eNAyBpalxY4OOTjNnkD99GOF/6FWeBndVDgRvCR2xzb9sTVCjQGhbGAlf+/DCCGc0W
         NvPxl0gogn2ggL2LlYKjxdhLbhm14N78sa2wv+kc0J/ch7Eao8UME4PAEC+cMPxlaP42
         khyDc356azAy6rU8fsgmnmijQCNRd53mEEWVNZSVBwyIV/KNgP+jfFaYYXA5vFiuWn6T
         ms8Dr4nZmkCotxEFSfFDLU8OJOSa3Vc/J4dYsfv/bjCfqZp5bIv2SnMGn5xSMQaaGxJx
         6Y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1YLndUxOOPY8Sr1BrjsF6xRwJEfXRqU5cb5ChMJ5I0o=;
        b=QpzZXwtxYGaX2CCgswSVKEmpH6qXp9k+GbXs2eQk4ijz/A2uuWSbVYJjXlOy+FFoLm
         0cAfPOfDZ/zOXhin/A7s18RiXluGVOkdBLWVZiTSi+lF66kfPdYeHeLDk7meYtUNW1LO
         Z2tvMN2XXGKYkNGT/Xiejr7Ngnh1KPvbWWNWmI7nmxCEgd2JQC7iOqlC6suOsVdh7wJF
         eoow5MqLnDISr2E2ohBGXxkUpMmbyDYcoJ94lO2Y1GZ4oa+A0dLcM3BiroFLUrgGRgWz
         KZMtuBUqmme3VsB+Fj6Auag4axYn5o5NhnK1UKWnmEE0fU1B/BC7EUO5zT83Z94j1EwV
         8URg==
X-Gm-Message-State: AOAM532My9h0Tj/tPZjP0UPNhaHL43CFaxVFpWwhtL3ecvwGYH3eo/Fo
        j9u1VnrdumJOmThOH6PK28hGTg==
X-Google-Smtp-Source: ABdhPJyZwjUMocwsEorC/bB3r5mo2VUVVLxjfj5HSITW72ekMa51Ktj/ONyzjy5RdWjjIN7e3VghaQ==
X-Received: by 2002:a05:6830:2366:: with SMTP id r6mr5013660oth.188.1626378604584;
        Thu, 15 Jul 2021 12:50:04 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c11sm1279191oot.25.2021.07.15.12.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:50:04 -0700 (PDT)
Date:   Thu, 15 Jul 2021 14:50:01 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH 2/5] clk: qcom: Add SDX65 GCC support
Message-ID: <YPCRadKzQRZdtOfO@yoga>
References: <20210709200339.17638-1-quic_vamslank@quicinc.com>
 <20210709200339.17638-3-quic_vamslank@quicinc.com>
 <YOkTVXcZpSRUE+Wy@yoga>
 <20210715184325.GB6897@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715184325.GB6897@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 15 Jul 13:43 CDT 2021, Vamsi Krishna Lanka wrote:

> On Fri, Jul 09, 2021 at 10:26:13PM -0500, Bjorn Andersson wrote:
> > On Fri 09 Jul 15:03 CDT 2021, quic_vamslank@quicinc.com wrote:
> > 
> > > From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> > > 
> > > Add Global Clock Controller (GCC) support for SDX65 SoCs from Qualcomm.
> > > 
> > 
> > This doesn't mention the fact that you add a new PLL type. I do however
> > think you should do that in a separate commit, preceding the gcc driver
> > patch.
> 
> Sure, will do.
> 
> > 
> > > Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> > > ---
> > >  drivers/clk/qcom/Kconfig         |    8 +
> > >  drivers/clk/qcom/Makefile        |    1 +
> > >  drivers/clk/qcom/clk-alpha-pll.c |  170 +++
> > >  drivers/clk/qcom/clk-alpha-pll.h |    4 +
> > >  drivers/clk/qcom/clk-rcg.h       |    4 +
> > >  drivers/clk/qcom/gcc-sdx65.c     | 1648 ++++++++++++++++++++++++++++++
> > >  6 files changed, 1835 insertions(+)
> > >  create mode 100644 drivers/clk/qcom/gcc-sdx65.c
> > [..]
> > > diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> > > index 99efcc7f8d88..33a7fe992207 100644
> > > --- a/drivers/clk/qcom/clk-rcg.h
> > > +++ b/drivers/clk/qcom/clk-rcg.h
> > > @@ -149,6 +149,10 @@ struct clk_rcg2 {
> > >  	const struct freq_tbl	*freq_tbl;
> > >  	struct clk_regmap	clkr;
> > >  	u8			cfg_off;
> > > +	u8                      flags;
> > > +#define FORCE_ENABLE_RCG        BIT(0)
> > 
> > Unused.
> 
> Will remove.
> 
> > 
> > > +#define HW_CLK_CTRL_MODE        BIT(1)
> > 
> > We don't implement HW_CLK_CTRL_MODE upstream yet, so you shouldn't
> > specify it for your clocks - or just add the definefor it.
> > 
> > > +#define DFS_SUPPORT             BIT(2)
> > 
> > Unused.
> 
> Will remove.
> 
> > 
> > >  };
> > >  
> > >  #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
> > > diff --git a/drivers/clk/qcom/gcc-sdx65.c b/drivers/clk/qcom/gcc-sdx65.c
> > [..]
> > > +static struct clk_alpha_pll_postdiv gpll0_out_even = {
> > > +	.offset = 0x0,
> > > +	.post_div_shift = 10,
> > > +	.post_div_table = post_div_table_gpll0_out_even,
> > > +	.num_post_div = ARRAY_SIZE(post_div_table_gpll0_out_even),
> > > +	.width = 4,
> > > +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> > > +	.clkr.hw.init = &(struct clk_init_data){
> > > +		.name = "gpll0_out_even",
> > > +		.parent_data = &(const struct clk_parent_data){
> > 
> > A parent_data with a single .hw is better specified using parent_hws.
> 
> Sure, will use parent_hws.
> 
> > 
> > > +			.hw = &gpll0.clkr.hw,
> > > +		},
> > > +		.num_parents = 1,
> > > +		.ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
> > > +	},
> > > +};
> > > +
> > > +static const struct parent_map gcc_parent_map_0[] = {
> > > +	{ P_BI_TCXO, 0 },
> > > +	{ P_GPLL0_OUT_MAIN, 1 },
> > > +	{ P_GPLL0_OUT_EVEN, 6 },
> > > +	{ P_CORE_BI_PLL_TEST_SE, 7 },
> > > +};
> > > +
> > > +static const struct clk_parent_data gcc_parent_data_0[] = {
> > > +	{ .fw_name = "bi_tcxo" },
> > > +	{ .hw = &gpll0.clkr.hw },
> > > +	{ .hw = &gpll0_out_even.clkr.hw },
> > > +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> > > +};
> > 
> > Nice to see that you use clk_parent_data, fw_name and hw right from the
> > start.
> > 
> > We typically remove core_bi_pll_test_se from the various parent lists,
> > as this is not something that's expected to be ever used. Please do the
> > same.
> 
> Sorry, I couldn't completely follow. Should I remove core_bi_pll_test_se from
> both fw_name and name ? 
> 

Yes, please drop "core_bi_pll_test_se" (and hence P_CORE_BI_PLL_TEST_SE)
throughout the driver.

Thanks,
Bjorn

> > 
> > > +
> > > +static const struct clk_parent_data gcc_parent_data_0_ao[] = {
> > > +	{ .fw_name = "bi_tcxo_ao" },
> > > +	{ .hw = &gpll0.clkr.hw },
> > > +	{ .hw = &gpll0_out_even.clkr.hw },
> > > +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> > > +};
> > [..]
> > > +static struct clk_regmap *gcc_sdx65_clocks[] = {
> > > +	[GCC_AHB_PCIE_LINK_CLK] = &gcc_ahb_pcie_link_clk.clkr,
> > > +	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
> > > +	[GCC_BLSP1_QUP1_I2C_APPS_CLK] = &gcc_blsp1_qup1_i2c_apps_clk.clkr,
> > > +	[GCC_BLSP1_QUP1_I2C_APPS_CLK_SRC] =
> > > +		&gcc_blsp1_qup1_i2c_apps_clk_src.clkr,
> > 
> > Skip the line wrap.
> 
> Done.
> 
> > 
> > > +	[GCC_BLSP1_QUP1_SPI_APPS_CLK] = &gcc_blsp1_qup1_spi_apps_clk.clkr,
> > > +	[GCC_BLSP1_QUP1_SPI_APPS_CLK_SRC] =
> > > +		&gcc_blsp1_qup1_spi_apps_clk_src.clkr,
> > > +	[GCC_BLSP1_QUP2_I2C_APPS_CLK] = &gcc_blsp1_qup2_i2c_apps_clk.clkr,
> > > +	[GCC_BLSP1_QUP2_I2C_APPS_CLK_SRC] =
> > > +		&gcc_blsp1_qup2_i2c_apps_clk_src.clkr,
> > > +	[GCC_BLSP1_QUP2_SPI_APPS_CLK] = &gcc_blsp1_qup2_spi_apps_clk.clkr,
> > > +	[GCC_BLSP1_QUP2_SPI_APPS_CLK_SRC] =
> > [..]
> > > +static int gcc_sdx65_probe(struct platform_device *pdev)
> > > +{
> > > +	struct regmap *regmap;
> > > +	int ret;
> > > +
> > > +	regmap = qcom_cc_map(pdev, &gcc_sdx65_desc);
> > > +	if (IS_ERR(regmap))
> > > +		return PTR_ERR(regmap);
> > > +	/*
> > > +	 * Keep the clocks always-ON as they are critical to the functioning
> > > +	 * of the system:
> > > +	 * GCC_SYS_NOC_CPUSS_AHB_CLK, GCC_CPUSS_AHB_CLK, GCC_CPUSS_GNOC_CLK
> > > +	 */
> > > +	regmap_update_bits(regmap, 0x6d008, BIT(0), BIT(0));
> > > +	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21));
> > > +	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22));
> > > +
> > > +	ret = qcom_cc_really_probe(pdev, &gcc_sdx65_desc, regmap);
> > 
> > Just "return qcom_cc_really_probe()"
> 
> Done.
> 
