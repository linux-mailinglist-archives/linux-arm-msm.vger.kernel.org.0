Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DEAD62017D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 22:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbiKGVzi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 16:55:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbiKGVzh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 16:55:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A243F018;
        Mon,  7 Nov 2022 13:55:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C72746132A;
        Mon,  7 Nov 2022 21:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAEFC433D6;
        Mon,  7 Nov 2022 21:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667858133;
        bh=HC0sAuz1bqiWD4TGmx5MJrj50s6QQeylFguLgAXhktc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dLVM9LAQDL5hkFjg/XcwAneKtCjorj+1KaHoS1F6Cf+Zgk1gRrP/NB8FDGfUDvkaK
         EoeSJVrs2Nw5r85KEKCW0VYdoxV16qtwfp1WYikJAGW/JFRB+gSVf9QUz3bCgjCay9
         ezTG1EhxnsG49m70sBjEgwYbHgC2bgToSKpHaUw4EMHf3eOX55bgwyzp3OUGLcF5Pr
         EBsAvtNF5yEXBY2Wyln0qHUaMDP1qiHDUKIjfW6MzsLMC9Y/MGpsWuh2DNpdbHEb+2
         4i23Xt/QLnRVZqy6g9SN2RrafA7yMtbH9I4VifOFoJULWJzOdVD9CaSOwvdgB7fo4F
         fn7VAP0RXAGFg==
Date:   Mon, 7 Nov 2022 15:55:30 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 08/11] clk: qcom: mmcc-msm8974: use parent_hws/_data
 instead of parent_names
Message-ID: <20221107215530.d7fkljbtgahtddh7@builder.lan>
References: <20221030155520.91629-1-dmitry.baryshkov@linaro.org>
 <20221030155520.91629-9-dmitry.baryshkov@linaro.org>
 <7a2b143d-0adb-98f3-f4e8-2a845fd7726a@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a2b143d-0adb-98f3-f4e8-2a845fd7726a@somainline.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 31, 2022 at 10:09:23PM +0100, Konrad Dybcio wrote:
> 
> 
> On 30.10.2022 16:55, Dmitry Baryshkov wrote:
> > Convert the clock driver to specify parent data rather than parent
> > names, to actually bind using 'clock-names' specified in the DTS rather
> > than global clock names. Use parent_hws where possible to refer parent
> > clocks directly, skipping the lookup.
> > 
> > Note, the system names for xo clocks were changed from "xo" to
> > "xo_board" to follow the example of other platforms.
> I think it should be reverse - look for "xo" and pass "xo_board" through DT.
> 

We have a clock with the global name "xo_board", so .name = "xo_board"
should work just fine. Relying on the .name = "xo" would make us use the
board-clock registered in gcc_msm8974_probe(), but with this we should
be able to drop that.

We also don't have any clocks in the DT node, so picking "xo" for that
would work fine as well.


Please let me know if I'm missing something here.

Regards,
Bjorn

> Konrad
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/clk/qcom/mmcc-msm8974.c | 516 ++++++++++++++++----------------
> >  1 file changed, 264 insertions(+), 252 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
> > index 57f1a351c8f6..4273fce9a4a4 100644
> > --- a/drivers/clk/qcom/mmcc-msm8974.c
> > +++ b/drivers/clk/qcom/mmcc-msm8974.c
> > @@ -52,7 +52,9 @@ static struct clk_pll mmpll0 = {
> >  	.status_bit = 17,
> >          .clkr.hw.init = &(struct clk_init_data){
> >                  .name = "mmpll0",
> > -                .parent_names = (const char *[]){ "xo" },
> > +                .parent_data = (const struct clk_parent_data[]){
> > +			{ .fw_name = "xo", .name = "xo_board" },
> > +		},
> >                  .num_parents = 1,
> >                  .ops = &clk_pll_ops,
> >          },
> > @@ -63,7 +65,9 @@ static struct clk_regmap mmpll0_vote = {
> >  	.enable_mask = BIT(0),
> >  	.hw.init = &(struct clk_init_data){
> >  		.name = "mmpll0_vote",
> > -		.parent_names = (const char *[]){ "mmpll0" },
> > +		.parent_hws = (const struct clk_hw*[]){
> > +			&mmpll0.clkr.hw
> > +		},
> >  		.num_parents = 1,
> >  		.ops = &clk_pll_vote_ops,
> >  	},
> > @@ -79,7 +83,9 @@ static struct clk_pll mmpll1 = {
> >  	.status_bit = 17,
> >          .clkr.hw.init = &(struct clk_init_data){
> >                  .name = "mmpll1",
> > -                .parent_names = (const char *[]){ "xo" },
> > +                .parent_data = (const struct clk_parent_data[]){
> > +			{ .fw_name = "xo", .name = "xo_board" },
> > +		},
> >                  .num_parents = 1,
> >                  .ops = &clk_pll_ops,
> >          },
> > @@ -90,7 +96,9 @@ static struct clk_regmap mmpll1_vote = {
> >  	.enable_mask = BIT(1),
> >  	.hw.init = &(struct clk_init_data){
> >  		.name = "mmpll1_vote",
> > -		.parent_names = (const char *[]){ "mmpll1" },
> > +		.parent_hws = (const struct clk_hw*[]){
> > +			&mmpll1.clkr.hw
> > +		},
> >  		.num_parents = 1,
> >  		.ops = &clk_pll_vote_ops,
> >  	},
> > @@ -105,7 +113,9 @@ static struct clk_pll mmpll2 = {
> >  	.status_reg = 0x411c,
> >          .clkr.hw.init = &(struct clk_init_data){
> >                  .name = "mmpll2",
> > -                .parent_names = (const char *[]){ "xo" },
> > +                .parent_data = (const struct clk_parent_data[]){
> > +			{ .fw_name = "xo", .name = "xo_board" },
> > +		},
> >                  .num_parents = 1,
> >                  .ops = &clk_pll_ops,
> >          },
> > @@ -121,7 +131,9 @@ static struct clk_pll mmpll3 = {
> >  	.status_bit = 17,
> >          .clkr.hw.init = &(struct clk_init_data){
> >                  .name = "mmpll3",
> > -                .parent_names = (const char *[]){ "xo" },
> > +                .parent_data = (const struct clk_parent_data[]){
> > +			{ .fw_name = "xo", .name = "xo_board" },
> > +		},
> >                  .num_parents = 1,
> >                  .ops = &clk_pll_ops,
> >          },
> > @@ -134,11 +146,11 @@ static const struct parent_map mmcc_xo_mmpll0_mmpll1_gpll0_map[] = {
> >  	{ P_GPLL0, 5 }
> >  };
> >  
> > -static const char * const mmcc_xo_mmpll0_mmpll1_gpll0[] = {
> > -	"xo",
> > -	"mmpll0_vote",
> > -	"mmpll1_vote",
> > -	"mmss_gpll0_vote",
> > +static const struct clk_parent_data mmcc_xo_mmpll0_mmpll1_gpll0[] = {
> > +	{ .fw_name = "xo", .name = "xo_board" },
> > +	{ .hw = &mmpll0_vote.hw },
> > +	{ .hw = &mmpll1_vote.hw },
> > +	{ .fw_name = "mmss_gpll0_vote", .name = "mmss_gpll0_vote" },
> >  };
> >  
> >  static const struct parent_map mmcc_xo_mmpll0_dsi_hdmi_gpll0_map[] = {
> > @@ -150,13 +162,13 @@ static const struct parent_map mmcc_xo_mmpll0_dsi_hdmi_gpll0_map[] = {
> >  	{ P_DSI1PLL, 3 }
> >  };
> >  
> > -static const char * const mmcc_xo_mmpll0_dsi_hdmi_gpll0[] = {
> > -	"xo",
> > -	"mmpll0_vote",
> > -	"hdmipll",
> > -	"mmss_gpll0_vote",
> > -	"dsi0pll",
> > -	"dsi1pll",
> > +static const struct clk_parent_data mmcc_xo_mmpll0_dsi_hdmi_gpll0[] = {
> > +	{ .fw_name = "xo", .name = "xo_board" },
> > +	{ .hw = &mmpll0_vote.hw },
> > +	{ .fw_name = "hdmipll", .name = "hdmipll" },
> > +	{ .fw_name = "mmss_gpll0_vote", .name = "mmss_gpll0_vote" },
> > +	{ .fw_name = "dsi0pll", .name = "dsi0pll" },
> > +	{ .fw_name = "dsi1pll", .name = "dsi1pll" },
> >  };
> >  
> >  static const struct parent_map mmcc_xo_mmpll0_1_3_gpll0_map[] = {
> > @@ -167,12 +179,12 @@ static const struct parent_map mmcc_xo_mmpll0_1_3_gpll0_map[] = {
> >  	{ P_MMPLL3, 3 }
> >  };
> >  
> > -static const char * const mmcc_xo_mmpll0_1_3_gpll0[] = {
> > -	"xo",
> > -	"mmpll0_vote",
> > -	"mmpll1_vote",
> > -	"mmss_gpll0_vote",
> > -	"mmpll3",
> > +static const struct clk_parent_data mmcc_xo_mmpll0_1_3_gpll0[] = {
> > +	{ .fw_name = "xo", .name = "xo_board" },
> > +	{ .hw = &mmpll0_vote.hw },
> > +	{ .hw = &mmpll1_vote.hw },
> > +	{ .fw_name = "mmss_gpll0_vote", .name = "mmss_gpll0_vote" },
> > +	{ .hw = &mmpll3.clkr.hw },
> >  };
> >  
> >  static const struct parent_map mmcc_xo_mmpll0_1_gpll1_0_map[] = {
> > @@ -183,12 +195,12 @@ static const struct parent_map mmcc_xo_mmpll0_1_gpll1_0_map[] = {
> >  	{ P_GPLL1, 4 }
> >  };
> >  
> > -static const char * const mmcc_xo_mmpll0_1_gpll1_0[] = {
> > -	"xo",
> > -	"mmpll0_vote",
> > -	"mmpll1_vote",
> > -	"mmss_gpll0_vote",
> > -	"gpll1_vote",
> > +static const struct clk_parent_data mmcc_xo_mmpll0_1_gpll1_0[] = {
> > +	{ .fw_name = "xo", .name = "xo_board" },
> > +	{ .hw = &mmpll0_vote.hw },
> > +	{ .hw = &mmpll1_vote.hw },
> > +	{ .fw_name = "mmss_gpll0_vote", .name = "mmss_gpll0_vote" },
> > +	{ .fw_name = "gpll1_vote", .name = "gpll1_vote" },
> >  };
> >  
> >  static const struct parent_map mmcc_xo_dsi_hdmi_edp_map[] = {
> > @@ -200,13 +212,13 @@ static const struct parent_map mmcc_xo_dsi_hdmi_edp_map[] = {
> >  	{ P_DSI1PLL, 2 }
> >  };
> >  
> > -static const char * const mmcc_xo_dsi_hdmi_edp[] = {
> > -	"xo",
> > -	"edp_link_clk",
> > -	"hdmipll",
> > -	"edp_vco_div",
> > -	"dsi0pll",
> > -	"dsi1pll",
> > +static const struct clk_parent_data mmcc_xo_dsi_hdmi_edp[] = {
> > +	{ .fw_name = "xo", .name = "xo_board" },
> > +	{ .fw_name = "edp_link_clk", .name = "edp_link_clk" },
> > +	{ .fw_name = "hdmipll", .name = "hdmipll" },
> > +	{ .fw_name = "edp_vco_div", .name = "edp_vco_div" },
> > +	{ .fw_name = "dsi0pll", .name = "dsi0pll" },
> > +	{ .fw_name = "dsi1pll", .name = "dsi1pll" },
> >  };
> >  
> >  static const struct parent_map mmcc_xo_dsi_hdmi_edp_gpll0_map[] = {
> > @@ -218,13 +230,13 @@ static const struct parent_map mmcc_xo_dsi_hdmi_edp_gpll0_map[] = {
> >  	{ P_DSI1PLL, 2 }
> >  };
> >  
> > -static const char * const mmcc_xo_dsi_hdmi_edp_gpll0[] = {
> > -	"xo",
> > -	"edp_link_clk",
> > -	"hdmipll",
> > -	"gpll0_vote",
> > -	"dsi0pll",
> > -	"dsi1pll",
> > +static const struct clk_parent_data mmcc_xo_dsi_hdmi_edp_gpll0[] = {
> > +	{ .fw_name = "xo", .name = "xo_board" },
> > +	{ .fw_name = "edp_link_clk", .name = "edp_link_clk" },
> > +	{ .fw_name = "hdmipll", .name = "hdmipll" },
> > +	{ .fw_name = "gpll0_vote", .name = "gpll0_vote" },
> > +	{ .fw_name = "dsi0pll", .name = "dsi0pll" },
> > +	{ .fw_name = "dsi1pll", .name = "dsi1pll" },
> >  };
> >  
> >  static const struct parent_map mmcc_xo_dsibyte_hdmi_edp_gpll0_map[] = {
> > @@ -236,13 +248,13 @@ static const struct parent_map mmcc_xo_dsibyte_hdmi_edp_gpll0_map[] = {
> >  	{ P_DSI1PLL_BYTE, 2 }
> >  };
> >  
> > -static const char * const mmcc_xo_dsibyte_hdmi_edp_gpll0[] = {
> > -	"xo",
> > -	"edp_link_clk",
> > -	"hdmipll",
> > -	"gpll0_vote",
> > -	"dsi0pllbyte",
> > -	"dsi1pllbyte",
> > +static const struct clk_parent_data mmcc_xo_dsibyte_hdmi_edp_gpll0[] = {
> > +	{ .fw_name = "xo", .name = "xo_board" },
> > +	{ .fw_name = "edp_link_clk", .name = "edp_link_clk" },
> > +	{ .fw_name = "hdmipll", .name = "hdmipll" },
> > +	{ .fw_name = "gpll0_vote", .name = "gpll0_vote" },
> > +	{ .fw_name = "dsi0pllbyte", .name = "dsi0pllbyte" },
> > +	{ .fw_name = "dsi1pllbyte", .name = "dsi1pllbyte" },
> >  };
> >  
> >  static struct clk_rcg2 mmss_ahb_clk_src = {
> > @@ -251,7 +263,7 @@ static struct clk_rcg2 mmss_ahb_clk_src = {
> >  	.parent_map = mmcc_xo_mmpll0_mmpll1_gpll0_map,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "mmss_ahb_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -288,7 +300,7 @@ static struct clk_rcg2 mmss_axi_clk_src = {
> >  	.freq_tbl = ftbl_mmss_axi_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "mmss_axi_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -312,7 +324,7 @@ static struct clk_rcg2 ocmemnoc_clk_src = {
> >  	.freq_tbl = ftbl_ocmemnoc_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "ocmemnoc_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -331,7 +343,7 @@ static struct clk_rcg2 csi0_clk_src = {
> >  	.freq_tbl = ftbl_camss_csi0_3_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "csi0_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -344,7 +356,7 @@ static struct clk_rcg2 csi1_clk_src = {
> >  	.freq_tbl = ftbl_camss_csi0_3_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "csi1_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -357,7 +369,7 @@ static struct clk_rcg2 csi2_clk_src = {
> >  	.freq_tbl = ftbl_camss_csi0_3_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "csi2_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -370,7 +382,7 @@ static struct clk_rcg2 csi3_clk_src = {
> >  	.freq_tbl = ftbl_camss_csi0_3_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "csi3_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -417,7 +429,7 @@ static struct clk_rcg2 vfe0_clk_src = {
> >  	.freq_tbl = ftbl_camss_vfe_vfe0_1_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "vfe0_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -430,7 +442,7 @@ static struct clk_rcg2 vfe1_clk_src = {
> >  	.freq_tbl = ftbl_camss_vfe_vfe0_1_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "vfe1_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -471,7 +483,7 @@ static struct clk_rcg2 mdp_clk_src = {
> >  	.freq_tbl = ftbl_mdss_mdp_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "mdp_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_dsi_hdmi_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_dsi_hdmi_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_dsi_hdmi_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -494,7 +506,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
> >  	.freq_tbl = ftbl_camss_jpeg_jpeg0_2_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "jpeg0_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -507,7 +519,7 @@ static struct clk_rcg2 jpeg1_clk_src = {
> >  	.freq_tbl = ftbl_camss_jpeg_jpeg0_2_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "jpeg1_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -520,7 +532,7 @@ static struct clk_rcg2 jpeg2_clk_src = {
> >  	.freq_tbl = ftbl_camss_jpeg_jpeg0_2_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "jpeg2_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -533,7 +545,7 @@ static struct clk_rcg2 pclk0_clk_src = {
> >  	.parent_map = mmcc_xo_dsi_hdmi_edp_gpll0_map,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "pclk0_clk_src",
> > -		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
> > +		.parent_data = mmcc_xo_dsi_hdmi_edp_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
> >  		.ops = &clk_pixel_ops,
> >  		.flags = CLK_SET_RATE_PARENT,
> > @@ -547,7 +559,7 @@ static struct clk_rcg2 pclk1_clk_src = {
> >  	.parent_map = mmcc_xo_dsi_hdmi_edp_gpll0_map,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "pclk1_clk_src",
> > -		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
> > +		.parent_data = mmcc_xo_dsi_hdmi_edp_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
> >  		.ops = &clk_pixel_ops,
> >  		.flags = CLK_SET_RATE_PARENT,
> > @@ -580,7 +592,7 @@ static struct clk_rcg2 vcodec0_clk_src = {
> >  	.freq_tbl = ftbl_venus0_vcodec0_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "vcodec0_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_1_3_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_1_3_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_3_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -598,7 +610,7 @@ static struct clk_rcg2 cci_clk_src = {
> >  	.freq_tbl = ftbl_camss_cci_cci_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "cci_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -622,7 +634,7 @@ static struct clk_rcg2 camss_gp0_clk_src = {
> >  	.freq_tbl = ftbl_camss_gp0_1_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "camss_gp0_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_1_gpll1_0,
> > +		.parent_data = mmcc_xo_mmpll0_1_gpll1_0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_gpll1_0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -636,7 +648,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
> >  	.freq_tbl = ftbl_camss_gp0_1_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "camss_gp1_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_1_gpll1_0,
> > +		.parent_data = mmcc_xo_mmpll0_1_gpll1_0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_gpll1_0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -671,7 +683,7 @@ static struct clk_rcg2 mclk0_clk_src = {
> >  	.freq_tbl = ftbl_camss_mclk0_3_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "mclk0_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -684,7 +696,7 @@ static struct clk_rcg2 mclk1_clk_src = {
> >  	.freq_tbl = ftbl_camss_mclk0_3_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "mclk1_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -697,7 +709,7 @@ static struct clk_rcg2 mclk2_clk_src = {
> >  	.freq_tbl = ftbl_camss_mclk0_3_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "mclk2_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -710,7 +722,7 @@ static struct clk_rcg2 mclk3_clk_src = {
> >  	.freq_tbl = ftbl_camss_mclk0_3_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "mclk3_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -729,7 +741,7 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
> >  	.freq_tbl = ftbl_camss_phy0_2_csi0_2phytimer_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "csi0phytimer_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -742,7 +754,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
> >  	.freq_tbl = ftbl_camss_phy0_2_csi0_2phytimer_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "csi1phytimer_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -755,7 +767,7 @@ static struct clk_rcg2 csi2phytimer_clk_src = {
> >  	.freq_tbl = ftbl_camss_phy0_2_csi0_2phytimer_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "csi2phytimer_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -786,7 +798,7 @@ static struct clk_rcg2 cpp_clk_src = {
> >  	.freq_tbl = ftbl_camss_vfe_cpp_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "cpp_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -804,7 +816,7 @@ static struct clk_rcg2 byte0_clk_src = {
> >  	.freq_tbl = byte_freq_tbl,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "byte0_clk_src",
> > -		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
> > +		.parent_data = mmcc_xo_dsibyte_hdmi_edp_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
> >  		.ops = &clk_byte2_ops,
> >  		.flags = CLK_SET_RATE_PARENT,
> > @@ -818,7 +830,7 @@ static struct clk_rcg2 byte1_clk_src = {
> >  	.freq_tbl = byte_freq_tbl,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "byte1_clk_src",
> > -		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
> > +		.parent_data = mmcc_xo_dsibyte_hdmi_edp_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
> >  		.ops = &clk_byte2_ops,
> >  		.flags = CLK_SET_RATE_PARENT,
> > @@ -837,7 +849,7 @@ static struct clk_rcg2 edpaux_clk_src = {
> >  	.freq_tbl = ftbl_mdss_edpaux_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "edpaux_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -856,7 +868,7 @@ static struct clk_rcg2 edplink_clk_src = {
> >  	.freq_tbl = ftbl_mdss_edplink_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "edplink_clk_src",
> > -		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
> > +		.parent_data = mmcc_xo_dsi_hdmi_edp_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  		.flags = CLK_SET_RATE_PARENT,
> > @@ -876,7 +888,7 @@ static struct clk_rcg2 edppixel_clk_src = {
> >  	.freq_tbl = edp_pixel_freq_tbl,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "edppixel_clk_src",
> > -		.parent_names = mmcc_xo_dsi_hdmi_edp,
> > +		.parent_data = mmcc_xo_dsi_hdmi_edp,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp),
> >  		.ops = &clk_edp_pixel_ops,
> >  	},
> > @@ -894,7 +906,7 @@ static struct clk_rcg2 esc0_clk_src = {
> >  	.freq_tbl = ftbl_mdss_esc0_1_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "esc0_clk_src",
> > -		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
> > +		.parent_data = mmcc_xo_dsibyte_hdmi_edp_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -907,7 +919,7 @@ static struct clk_rcg2 esc1_clk_src = {
> >  	.freq_tbl = ftbl_mdss_esc0_1_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "esc1_clk_src",
> > -		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
> > +		.parent_data = mmcc_xo_dsibyte_hdmi_edp_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -925,7 +937,7 @@ static struct clk_rcg2 extpclk_clk_src = {
> >  	.freq_tbl = extpclk_freq_tbl,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "extpclk_clk_src",
> > -		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
> > +		.parent_data = mmcc_xo_dsi_hdmi_edp_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
> >  		.ops = &clk_byte_ops,
> >  		.flags = CLK_SET_RATE_PARENT,
> > @@ -944,7 +956,7 @@ static struct clk_rcg2 hdmi_clk_src = {
> >  	.freq_tbl = ftbl_mdss_hdmi_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "hdmi_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -962,7 +974,7 @@ static struct clk_rcg2 vsync_clk_src = {
> >  	.freq_tbl = ftbl_mdss_vsync_clk,
> >  	.clkr.hw.init = &(struct clk_init_data){
> >  		.name = "vsync_clk_src",
> > -		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> > +		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
> >  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
> >  		.ops = &clk_rcg2_ops,
> >  	},
> > @@ -975,8 +987,8 @@ static struct clk_branch camss_cci_cci_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_cci_cci_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -991,8 +1003,8 @@ static struct clk_branch camss_cci_cci_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_cci_cci_clk",
> > -			.parent_names = (const char *[]){
> > -				"cci_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&cci_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1008,8 +1020,8 @@ static struct clk_branch camss_csi0_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi0_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -1024,8 +1036,8 @@ static struct clk_branch camss_csi0_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi0_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi0_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi0_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1041,8 +1053,8 @@ static struct clk_branch camss_csi0phy_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi0phy_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi0_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi0_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1058,8 +1070,8 @@ static struct clk_branch camss_csi0pix_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi0pix_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi0_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi0_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1075,8 +1087,8 @@ static struct clk_branch camss_csi0rdi_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi0rdi_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi0_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi0_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1092,8 +1104,8 @@ static struct clk_branch camss_csi1_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi1_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -1108,8 +1120,8 @@ static struct clk_branch camss_csi1_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi1_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi1_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi1_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1125,8 +1137,8 @@ static struct clk_branch camss_csi1phy_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi1phy_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi1_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi1_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1142,8 +1154,8 @@ static struct clk_branch camss_csi1pix_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi1pix_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi1_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi1_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1159,8 +1171,8 @@ static struct clk_branch camss_csi1rdi_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi1rdi_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi1_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi1_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1176,8 +1188,8 @@ static struct clk_branch camss_csi2_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi2_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -1192,8 +1204,8 @@ static struct clk_branch camss_csi2_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi2_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi2_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi2_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1209,8 +1221,8 @@ static struct clk_branch camss_csi2phy_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi2phy_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi2_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi2_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1226,8 +1238,8 @@ static struct clk_branch camss_csi2pix_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi2pix_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi2_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi2_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1243,8 +1255,8 @@ static struct clk_branch camss_csi2rdi_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi2rdi_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi2_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi2_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1260,8 +1272,8 @@ static struct clk_branch camss_csi3_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi3_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -1276,8 +1288,8 @@ static struct clk_branch camss_csi3_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi3_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi3_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi3_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1293,8 +1305,8 @@ static struct clk_branch camss_csi3phy_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi3phy_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi3_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi3_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1310,8 +1322,8 @@ static struct clk_branch camss_csi3pix_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi3pix_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi3_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi3_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1327,8 +1339,8 @@ static struct clk_branch camss_csi3rdi_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi3rdi_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi3_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi3_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1344,8 +1356,8 @@ static struct clk_branch camss_csi_vfe0_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi_vfe0_clk",
> > -			.parent_names = (const char *[]){
> > -				"vfe0_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&vfe0_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1361,8 +1373,8 @@ static struct clk_branch camss_csi_vfe1_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_csi_vfe1_clk",
> > -			.parent_names = (const char *[]){
> > -				"vfe1_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&vfe1_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1378,8 +1390,8 @@ static struct clk_branch camss_gp0_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_gp0_clk",
> > -			.parent_names = (const char *[]){
> > -				"camss_gp0_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&camss_gp0_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1395,8 +1407,8 @@ static struct clk_branch camss_gp1_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_gp1_clk",
> > -			.parent_names = (const char *[]){
> > -				"camss_gp1_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&camss_gp1_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1412,8 +1424,8 @@ static struct clk_branch camss_ispif_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_ispif_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -1428,8 +1440,8 @@ static struct clk_branch camss_jpeg_jpeg0_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_jpeg_jpeg0_clk",
> > -			.parent_names = (const char *[]){
> > -				"jpeg0_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&jpeg0_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1445,8 +1457,8 @@ static struct clk_branch camss_jpeg_jpeg1_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_jpeg_jpeg1_clk",
> > -			.parent_names = (const char *[]){
> > -				"jpeg1_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&jpeg1_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1462,8 +1474,8 @@ static struct clk_branch camss_jpeg_jpeg2_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_jpeg_jpeg2_clk",
> > -			.parent_names = (const char *[]){
> > -				"jpeg2_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&jpeg2_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1479,8 +1491,8 @@ static struct clk_branch camss_jpeg_jpeg_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_jpeg_jpeg_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -1495,8 +1507,8 @@ static struct clk_branch camss_jpeg_jpeg_axi_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_jpeg_jpeg_axi_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_axi_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_axi_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -1511,8 +1523,8 @@ static struct clk_branch camss_jpeg_jpeg_ocmemnoc_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_jpeg_jpeg_ocmemnoc_clk",
> > -			.parent_names = (const char *[]){
> > -				"ocmemnoc_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&ocmemnoc_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1528,8 +1540,8 @@ static struct clk_branch camss_mclk0_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_mclk0_clk",
> > -			.parent_names = (const char *[]){
> > -				"mclk0_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mclk0_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1545,8 +1557,8 @@ static struct clk_branch camss_mclk1_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_mclk1_clk",
> > -			.parent_names = (const char *[]){
> > -				"mclk1_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mclk1_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1562,8 +1574,8 @@ static struct clk_branch camss_mclk2_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_mclk2_clk",
> > -			.parent_names = (const char *[]){
> > -				"mclk2_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mclk2_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1579,8 +1591,8 @@ static struct clk_branch camss_mclk3_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_mclk3_clk",
> > -			.parent_names = (const char *[]){
> > -				"mclk3_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mclk3_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1596,8 +1608,8 @@ static struct clk_branch camss_micro_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_micro_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -1612,8 +1624,8 @@ static struct clk_branch camss_phy0_csi0phytimer_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_phy0_csi0phytimer_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi0phytimer_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi0phytimer_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1629,8 +1641,8 @@ static struct clk_branch camss_phy1_csi1phytimer_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_phy1_csi1phytimer_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi1phytimer_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi1phytimer_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1646,8 +1658,8 @@ static struct clk_branch camss_phy2_csi2phytimer_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_phy2_csi2phytimer_clk",
> > -			.parent_names = (const char *[]){
> > -				"csi2phytimer_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&csi2phytimer_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1663,8 +1675,8 @@ static struct clk_branch camss_top_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_top_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -1679,8 +1691,8 @@ static struct clk_branch camss_vfe_cpp_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_vfe_cpp_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -1695,8 +1707,8 @@ static struct clk_branch camss_vfe_cpp_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_vfe_cpp_clk",
> > -			.parent_names = (const char *[]){
> > -				"cpp_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&cpp_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1712,8 +1724,8 @@ static struct clk_branch camss_vfe_vfe0_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_vfe_vfe0_clk",
> > -			.parent_names = (const char *[]){
> > -				"vfe0_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&vfe0_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1729,8 +1741,8 @@ static struct clk_branch camss_vfe_vfe1_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_vfe_vfe1_clk",
> > -			.parent_names = (const char *[]){
> > -				"vfe1_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&vfe1_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1746,8 +1758,8 @@ static struct clk_branch camss_vfe_vfe_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_vfe_vfe_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -1762,8 +1774,8 @@ static struct clk_branch camss_vfe_vfe_axi_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_vfe_vfe_axi_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_axi_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_axi_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -1778,8 +1790,8 @@ static struct clk_branch camss_vfe_vfe_ocmemnoc_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "camss_vfe_vfe_ocmemnoc_clk",
> > -			.parent_names = (const char *[]){
> > -				"ocmemnoc_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&ocmemnoc_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1795,8 +1807,8 @@ static struct clk_branch mdss_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mdss_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -1811,8 +1823,8 @@ static struct clk_branch mdss_axi_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mdss_axi_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_axi_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_axi_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1828,8 +1840,8 @@ static struct clk_branch mdss_byte0_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mdss_byte0_clk",
> > -			.parent_names = (const char *[]){
> > -				"byte0_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&byte0_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1845,8 +1857,8 @@ static struct clk_branch mdss_byte1_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mdss_byte1_clk",
> > -			.parent_names = (const char *[]){
> > -				"byte1_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&byte1_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1862,8 +1874,8 @@ static struct clk_branch mdss_edpaux_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mdss_edpaux_clk",
> > -			.parent_names = (const char *[]){
> > -				"edpaux_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&edpaux_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1879,8 +1891,8 @@ static struct clk_branch mdss_edplink_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mdss_edplink_clk",
> > -			.parent_names = (const char *[]){
> > -				"edplink_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&edplink_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1896,8 +1908,8 @@ static struct clk_branch mdss_edppixel_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mdss_edppixel_clk",
> > -			.parent_names = (const char *[]){
> > -				"edppixel_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&edppixel_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1913,8 +1925,8 @@ static struct clk_branch mdss_esc0_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mdss_esc0_clk",
> > -			.parent_names = (const char *[]){
> > -				"esc0_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&esc0_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1930,8 +1942,8 @@ static struct clk_branch mdss_esc1_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mdss_esc1_clk",
> > -			.parent_names = (const char *[]){
> > -				"esc1_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&esc1_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1947,8 +1959,8 @@ static struct clk_branch mdss_extpclk_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mdss_extpclk_clk",
> > -			.parent_names = (const char *[]){
> > -				"extpclk_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&extpclk_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1964,8 +1976,8 @@ static struct clk_branch mdss_hdmi_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mdss_hdmi_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -1980,8 +1992,8 @@ static struct clk_branch mdss_hdmi_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mdss_hdmi_clk",
> > -			.parent_names = (const char *[]){
> > -				"hdmi_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&hdmi_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -1997,8 +2009,8 @@ static struct clk_branch mdss_mdp_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mdss_mdp_clk",
> > -			.parent_names = (const char *[]){
> > -				"mdp_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mdp_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -2014,8 +2026,8 @@ static struct clk_branch mdss_mdp_lut_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mdss_mdp_lut_clk",
> > -			.parent_names = (const char *[]){
> > -				"mdp_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mdp_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -2031,8 +2043,8 @@ static struct clk_branch mdss_pclk0_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mdss_pclk0_clk",
> > -			.parent_names = (const char *[]){
> > -				"pclk0_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&pclk0_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -2048,8 +2060,8 @@ static struct clk_branch mdss_pclk1_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mdss_pclk1_clk",
> > -			.parent_names = (const char *[]){
> > -				"pclk1_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&pclk1_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -2065,8 +2077,8 @@ static struct clk_branch mdss_vsync_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mdss_vsync_clk",
> > -			.parent_names = (const char *[]){
> > -				"vsync_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&vsync_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -2082,8 +2094,8 @@ static struct clk_branch mmss_misc_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mmss_misc_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -2098,8 +2110,8 @@ static struct clk_branch mmss_mmssnoc_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mmss_mmssnoc_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -2115,8 +2127,8 @@ static struct clk_branch mmss_mmssnoc_bto_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mmss_mmssnoc_bto_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -2132,8 +2144,8 @@ static struct clk_branch mmss_mmssnoc_axi_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mmss_mmssnoc_axi_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_axi_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_axi_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> > @@ -2149,8 +2161,8 @@ static struct clk_branch mmss_s0_axi_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "mmss_s0_axi_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_axi_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_axi_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -2166,8 +2178,8 @@ static struct clk_branch ocmemcx_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "ocmemcx_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -2182,8 +2194,8 @@ static struct clk_branch ocmemcx_ocmemnoc_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "ocmemcx_ocmemnoc_clk",
> > -			.parent_names = (const char *[]){
> > -				"ocmemnoc_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&ocmemnoc_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -2199,8 +2211,8 @@ static struct clk_branch oxili_ocmemgx_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "oxili_ocmemgx_clk",
> > -			.parent_names = (const char *[]){
> > -				"gfx3d_clk_src",
> > +			.parent_data = (const struct clk_parent_data[]){
> > +				{ .fw_name = "gfx3d_clk_src", .name = "gfx3d_clk_src" },
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -2216,8 +2228,8 @@ static struct clk_branch ocmemnoc_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "ocmemnoc_clk",
> > -			.parent_names = (const char *[]){
> > -				"ocmemnoc_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&ocmemnoc_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -2233,8 +2245,8 @@ static struct clk_branch oxili_gfx3d_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "oxili_gfx3d_clk",
> > -			.parent_names = (const char *[]){
> > -				"gfx3d_clk_src",
> > +			.parent_data = (const struct clk_parent_data[]){
> > +				{ .fw_name = "gfx3d_clk_src", .name = "gfx3d_clk_src" },
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -2250,8 +2262,8 @@ static struct clk_branch oxilicx_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "oxilicx_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -2266,8 +2278,8 @@ static struct clk_branch oxilicx_axi_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "oxilicx_axi_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_axi_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_axi_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -2282,8 +2294,8 @@ static struct clk_branch venus0_ahb_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "venus0_ahb_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_ahb_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_ahb_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -2298,8 +2310,8 @@ static struct clk_branch venus0_axi_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "venus0_axi_clk",
> > -			.parent_names = (const char *[]){
> > -				"mmss_axi_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&mmss_axi_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.ops = &clk_branch2_ops,
> > @@ -2314,8 +2326,8 @@ static struct clk_branch venus0_ocmemnoc_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "venus0_ocmemnoc_clk",
> > -			.parent_names = (const char *[]){
> > -				"ocmemnoc_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&ocmemnoc_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
> > @@ -2331,8 +2343,8 @@ static struct clk_branch venus0_vcodec0_clk = {
> >  		.enable_mask = BIT(0),
> >  		.hw.init = &(struct clk_init_data){
> >  			.name = "venus0_vcodec0_clk",
> > -			.parent_names = (const char *[]){
> > -				"vcodec0_clk_src",
> > +			.parent_hws = (const struct clk_hw*[]){
> > +				&vcodec0_clk_src.clkr.hw
> >  			},
> >  			.num_parents = 1,
> >  			.flags = CLK_SET_RATE_PARENT,
