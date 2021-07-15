Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9063CA627
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 20:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238100AbhGOSq0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 14:46:26 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:19137 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232446AbhGOSqW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 14:46:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1626374609; x=1657910609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0dW3JI9H5NrM0sEPW8A4NOrg3d3/Nq08RmFURzLYfdI=;
  b=OB5W9WFvygSTxycss/n4WuMCDTzCtN43gCHOOiM12D+aXDzkwB8GIzW2
   uzT+g7spqH73J1y2U87530/Xqqb+29CwHYDFC7LNrHIkLTvbzDStTUb6g
   Ph2fznXkvNrh5F9+kcADBdSCSIPBcEfA0UDpaaaKvqdtkcXy6Da2LRWl1
   g=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 15 Jul 2021 11:43:28 -0700
X-QCInternal: smtphost
Received: from nalasexr03e.na.qualcomm.com ([10.49.195.114])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 15 Jul 2021 11:43:27 -0700
Received: from quicinc.com (10.80.80.8) by nalasexr03e.na.qualcomm.com
 (10.49.195.114) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 15 Jul
 2021 11:43:26 -0700
Date:   Thu, 15 Jul 2021 11:43:25 -0700
From:   Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <agross@kernel.org>, <linus.walleij@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 2/5] clk: qcom: Add SDX65 GCC support
Message-ID: <20210715184325.GB6897@quicinc.com>
References: <20210709200339.17638-1-quic_vamslank@quicinc.com>
 <20210709200339.17638-3-quic_vamslank@quicinc.com>
 <YOkTVXcZpSRUE+Wy@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YOkTVXcZpSRUE+Wy@yoga>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03a.na.qualcomm.com (10.85.0.103) To
 nalasexr03e.na.qualcomm.com (10.49.195.114)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 09, 2021 at 10:26:13PM -0500, Bjorn Andersson wrote:
> On Fri 09 Jul 15:03 CDT 2021, quic_vamslank@quicinc.com wrote:
> 
> > From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> > 
> > Add Global Clock Controller (GCC) support for SDX65 SoCs from Qualcomm.
> > 
> 
> This doesn't mention the fact that you add a new PLL type. I do however
> think you should do that in a separate commit, preceding the gcc driver
> patch.

Sure, will do.

> 
> > Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> > ---
> >  drivers/clk/qcom/Kconfig         |    8 +
> >  drivers/clk/qcom/Makefile        |    1 +
> >  drivers/clk/qcom/clk-alpha-pll.c |  170 +++
> >  drivers/clk/qcom/clk-alpha-pll.h |    4 +
> >  drivers/clk/qcom/clk-rcg.h       |    4 +
> >  drivers/clk/qcom/gcc-sdx65.c     | 1648 ++++++++++++++++++++++++++++++
> >  6 files changed, 1835 insertions(+)
> >  create mode 100644 drivers/clk/qcom/gcc-sdx65.c
> [..]
> > diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> > index 99efcc7f8d88..33a7fe992207 100644
> > --- a/drivers/clk/qcom/clk-rcg.h
> > +++ b/drivers/clk/qcom/clk-rcg.h
> > @@ -149,6 +149,10 @@ struct clk_rcg2 {
> >  	const struct freq_tbl	*freq_tbl;
> >  	struct clk_regmap	clkr;
> >  	u8			cfg_off;
> > +	u8                      flags;
> > +#define FORCE_ENABLE_RCG        BIT(0)
> 
> Unused.

Will remove.

> 
> > +#define HW_CLK_CTRL_MODE        BIT(1)
> 
> We don't implement HW_CLK_CTRL_MODE upstream yet, so you shouldn't
> specify it for your clocks - or just add the definefor it.
> 
> > +#define DFS_SUPPORT             BIT(2)
> 
> Unused.

Will remove.

> 
> >  };
> >  
> >  #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
> > diff --git a/drivers/clk/qcom/gcc-sdx65.c b/drivers/clk/qcom/gcc-sdx65.c
> [..]
> > +static struct clk_alpha_pll_postdiv gpll0_out_even = {
> > +	.offset = 0x0,
> > +	.post_div_shift = 10,
> > +	.post_div_table = post_div_table_gpll0_out_even,
> > +	.num_post_div = ARRAY_SIZE(post_div_table_gpll0_out_even),
> > +	.width = 4,
> > +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> > +	.clkr.hw.init = &(struct clk_init_data){
> > +		.name = "gpll0_out_even",
> > +		.parent_data = &(const struct clk_parent_data){
> 
> A parent_data with a single .hw is better specified using parent_hws.

Sure, will use parent_hws.

> 
> > +			.hw = &gpll0.clkr.hw,
> > +		},
> > +		.num_parents = 1,
> > +		.ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
> > +	},
> > +};
> > +
> > +static const struct parent_map gcc_parent_map_0[] = {
> > +	{ P_BI_TCXO, 0 },
> > +	{ P_GPLL0_OUT_MAIN, 1 },
> > +	{ P_GPLL0_OUT_EVEN, 6 },
> > +	{ P_CORE_BI_PLL_TEST_SE, 7 },
> > +};
> > +
> > +static const struct clk_parent_data gcc_parent_data_0[] = {
> > +	{ .fw_name = "bi_tcxo" },
> > +	{ .hw = &gpll0.clkr.hw },
> > +	{ .hw = &gpll0_out_even.clkr.hw },
> > +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> > +};
> 
> Nice to see that you use clk_parent_data, fw_name and hw right from the
> start.
> 
> We typically remove core_bi_pll_test_se from the various parent lists,
> as this is not something that's expected to be ever used. Please do the
> same.

Sorry, I couldn't completely follow. Should I remove core_bi_pll_test_se from
both fw_name and name ? 

> 
> > +
> > +static const struct clk_parent_data gcc_parent_data_0_ao[] = {
> > +	{ .fw_name = "bi_tcxo_ao" },
> > +	{ .hw = &gpll0.clkr.hw },
> > +	{ .hw = &gpll0_out_even.clkr.hw },
> > +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> > +};
> [..]
> > +static struct clk_regmap *gcc_sdx65_clocks[] = {
> > +	[GCC_AHB_PCIE_LINK_CLK] = &gcc_ahb_pcie_link_clk.clkr,
> > +	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
> > +	[GCC_BLSP1_QUP1_I2C_APPS_CLK] = &gcc_blsp1_qup1_i2c_apps_clk.clkr,
> > +	[GCC_BLSP1_QUP1_I2C_APPS_CLK_SRC] =
> > +		&gcc_blsp1_qup1_i2c_apps_clk_src.clkr,
> 
> Skip the line wrap.

Done.

> 
> > +	[GCC_BLSP1_QUP1_SPI_APPS_CLK] = &gcc_blsp1_qup1_spi_apps_clk.clkr,
> > +	[GCC_BLSP1_QUP1_SPI_APPS_CLK_SRC] =
> > +		&gcc_blsp1_qup1_spi_apps_clk_src.clkr,
> > +	[GCC_BLSP1_QUP2_I2C_APPS_CLK] = &gcc_blsp1_qup2_i2c_apps_clk.clkr,
> > +	[GCC_BLSP1_QUP2_I2C_APPS_CLK_SRC] =
> > +		&gcc_blsp1_qup2_i2c_apps_clk_src.clkr,
> > +	[GCC_BLSP1_QUP2_SPI_APPS_CLK] = &gcc_blsp1_qup2_spi_apps_clk.clkr,
> > +	[GCC_BLSP1_QUP2_SPI_APPS_CLK_SRC] =
> [..]
> > +static int gcc_sdx65_probe(struct platform_device *pdev)
> > +{
> > +	struct regmap *regmap;
> > +	int ret;
> > +
> > +	regmap = qcom_cc_map(pdev, &gcc_sdx65_desc);
> > +	if (IS_ERR(regmap))
> > +		return PTR_ERR(regmap);
> > +	/*
> > +	 * Keep the clocks always-ON as they are critical to the functioning
> > +	 * of the system:
> > +	 * GCC_SYS_NOC_CPUSS_AHB_CLK, GCC_CPUSS_AHB_CLK, GCC_CPUSS_GNOC_CLK
> > +	 */
> > +	regmap_update_bits(regmap, 0x6d008, BIT(0), BIT(0));
> > +	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21));
> > +	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22));
> > +
> > +	ret = qcom_cc_really_probe(pdev, &gcc_sdx65_desc, regmap);
> 
> Just "return qcom_cc_really_probe()"

Done.

