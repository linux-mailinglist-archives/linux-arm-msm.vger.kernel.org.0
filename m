Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 703F214AF3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 06:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725844AbgA1Fxv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 00:53:51 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:15590 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725776AbgA1Fxv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 00:53:51 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580190830; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=X3kHMnYi5p9NsrX0pm8Pjhgyo6Dck8w6nOS+KLJtcPI=; b=FpVMB2haj9h90TiEGM4owkaJTOVAjyuAUGpGYOJKxRFpzONHyHxDUKFOwlG+YZbtmIa+olEy
 iV9rIrnUdvTHRRQac7pvPjFXp1WIMHWWwsk3In+e2jgOPLx+qDaE9AFEZLVLJxiztW6gBY/O
 QvdADtAmgy5MZ0TvnMws+AXtlFM=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2fcc6c.7f0607407df8-smtp-out-n01;
 Tue, 28 Jan 2020 05:53:48 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9FDE5C433A2; Tue, 28 Jan 2020 05:53:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C0492C43383;
        Tue, 28 Jan 2020 05:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C0492C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 05/10] clk: qcom: Fix sc7180 dispcc parent data
To:     Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        mka@chromium.org, kalyan_t@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        hoegsberg@chromium.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
References: <20200124224225.22547-1-dianders@chromium.org>
 <20200124144154.v2.5.If590c468722d2985cea63adf60c0d2b3098f37d9@changeid>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <149394fe-b726-15da-1c6f-a223d57a009f@codeaurora.org>
Date:   Tue, 28 Jan 2020 11:23:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200124144154.v2.5.If590c468722d2985cea63adf60c0d2b3098f37d9@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

Thanks for the patch.

On 1/25/2020 4:12 AM, Douglas Anderson wrote:
> The bindings file (qcom,dispcc.yaml) says that the two clocks that
> dispcc is a client of are named "xo" and "gpll0".  That means we have
> to refer to them by those names.  We weren't referring to "xo"
> properly in the driver.
> 
> Then, in the patch ("dt-bindings: clock: Fix qcom,dispcc bindings for
> sdm845/sc7180") we clarify the names for all of the clocks that we are
> a client of.  Fix all those too, also getting rid of the "fallback"
> names for them.  Since sc7180 is still in infancy there is no reason
> to specify a fallback name.  People should just get the device tree
> right.
> 
> Since we didn't add the "test" clock to the bindings (apparently it's
> never used), kill it from the driver.  If someone has a use for it we
> should add it to the bindings and bring it back.
> 
> Instead of updating all of the sizes of the arrays now that the test
> clock is gone, switch to using the less error-prone ARRAY_SIZE.  Not
> sure why it didn't always use that.
> 
> Fixes: dd3d06622138 ("clk: qcom: Add display clock controller driver for SC7180")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v2:
> - Patch ("clk: qcom: Fix sc7180 dispcc parent data") new for v2.
> 
>   drivers/clk/qcom/dispcc-sc7180.c | 63 ++++++++++++--------------------
>   1 file changed, 24 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
> index 30c1e25d3edb..380eca3f847d 100644
> --- a/drivers/clk/qcom/dispcc-sc7180.c
> +++ b/drivers/clk/qcom/dispcc-sc7180.c
> @@ -43,7 +43,7 @@ static struct clk_alpha_pll disp_cc_pll0 = {
>   		.hw.init = &(struct clk_init_data){
>   			.name = "disp_cc_pll0",
>   			.parent_data = &(const struct clk_parent_data){
> -				.fw_name = "bi_tcxo",
> +				.fw_name = "xo",

These clock names are as per our HW design and we would not like to 
update them as they require lot of hand-coding. These codes are all 
auto-generated.

>   			},
>   			.num_parents = 1,
>   			.ops = &clk_alpha_pll_fabia_ops,
> @@ -76,40 +76,32 @@ static struct clk_alpha_pll_postdiv disp_cc_pll0_out_even = {
>   
>   static const struct parent_map disp_cc_parent_map_0[] = {
>   	{ P_BI_TCXO, 0 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>   };
>   
>   static const struct clk_parent_data disp_cc_parent_data_0[] = {
> -	{ .fw_name = "bi_tcxo" },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> +	{ .fw_name = "xo" },
>   };
>   
>   static const struct parent_map disp_cc_parent_map_1[] = {
>   	{ P_BI_TCXO, 0 },
>   	{ P_DP_PHY_PLL_LINK_CLK, 1 },
>   	{ P_DP_PHY_PLL_VCO_DIV_CLK, 2 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>   };
>   
>   static const struct clk_parent_data disp_cc_parent_data_1[] = {
> -	{ .fw_name = "bi_tcxo" },
> -	{ .fw_name = "dp_phy_pll_link_clk", .name = "dp_phy_pll_link_clk" },
> -	{ .fw_name = "dp_phy_pll_vco_div_clk",
> -				.name = "dp_phy_pll_vco_div_clk"},
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> +	{ .fw_name = "xo" },
> +	{ .fw_name = "dp_phy_pll_link" },
> +	{ .fw_name = "dp_phy_pll_vco_div" },

similar comments for these too. They would conflict with our HW design 
clock names.
>   };
>   
>   static const struct parent_map disp_cc_parent_map_2[] = {
>   	{ P_BI_TCXO, 0 },
>   	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>   };
>   
>   static const struct clk_parent_data disp_cc_parent_data_2[] = {
> -	{ .fw_name = "bi_tcxo" },
> -	{ .fw_name = "dsi0_phy_pll_out_byteclk",
> -				.name = "dsi0_phy_pll_out_byteclk" },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> +	{ .fw_name = "xo" },
> +	{ .fw_name = "dsi_phy_pll_byte" },
>   };
>   
>   static const struct parent_map disp_cc_parent_map_3[] = {
> @@ -117,40 +109,33 @@ static const struct parent_map disp_cc_parent_map_3[] = {
>   	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
>   	{ P_GPLL0_OUT_MAIN, 4 },
>   	{ P_DISP_CC_PLL0_OUT_EVEN, 5 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>   };
>   
>   static const struct clk_parent_data disp_cc_parent_data_3[] = {
> -	{ .fw_name = "bi_tcxo" },
> +	{ .fw_name = "xo" },
>   	{ .hw = &disp_cc_pll0.clkr.hw },
> -	{ .fw_name = "gcc_disp_gpll0_clk_src" },
> +	{ .fw_name = "gpll0" },

This is not the correct clock, we have a child/branch clock which 
requires to be turned ON "gcc_disp_gpll0_clk_src" when we switch to this 
source.

>   	{ .hw = &disp_cc_pll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>   };
>   
>   static const struct parent_map disp_cc_parent_map_4[] = {
>   	{ P_BI_TCXO, 0 },
>   	{ P_GPLL0_OUT_MAIN, 4 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>   };
>   
>   static const struct clk_parent_data disp_cc_parent_data_4[] = {
> -	{ .fw_name = "bi_tcxo" },
> -	{ .fw_name = "gcc_disp_gpll0_clk_src" },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> +	{ .fw_name = "xo" },
> +	{ .fw_name = "gpll0" },

same comment as above.

>   };
>   
>   static const struct parent_map disp_cc_parent_map_5[] = {
>   	{ P_BI_TCXO, 0 },
>   	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>   };
>   
>   static const struct clk_parent_data disp_cc_parent_data_5[] = {
> -	{ .fw_name = "bi_tcxo" },
> -	{ .fw_name = "dsi0_phy_pll_out_dsiclk",
> -				.name = "dsi0_phy_pll_out_dsiclk" },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> +	{ .fw_name = "xo" },
> +	{ .fw_name = "dsi_phy_pll_pixel" },
>   };
>   
>   static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
> @@ -169,7 +154,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "disp_cc_mdss_ahb_clk_src",
>   		.parent_data = disp_cc_parent_data_4,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
>   		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_rcg2_shared_ops,
>   	},
> @@ -183,7 +168,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "disp_cc_mdss_byte0_clk_src",
>   		.parent_data = disp_cc_parent_data_2,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
>   		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_byte2_ops,
>   	},
> @@ -203,7 +188,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "disp_cc_mdss_dp_aux_clk_src",
>   		.parent_data = disp_cc_parent_data_0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -216,7 +201,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "disp_cc_mdss_dp_crypto_clk_src",
>   		.parent_data = disp_cc_parent_data_1,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
>   		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_byte2_ops,
>   	},
> @@ -230,7 +215,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "disp_cc_mdss_dp_link_clk_src",
>   		.parent_data = disp_cc_parent_data_1,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
>   		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_byte2_ops,
>   	},
> @@ -244,7 +229,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_pixel_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "disp_cc_mdss_dp_pixel_clk_src",
>   		.parent_data = disp_cc_parent_data_1,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
>   		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_dp_ops,
>   	},
> @@ -259,7 +244,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "disp_cc_mdss_esc0_clk_src",
>   		.parent_data = disp_cc_parent_data_2,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -282,7 +267,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "disp_cc_mdss_mdp_clk_src",
>   		.parent_data = disp_cc_parent_data_3,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
>   		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
> @@ -295,7 +280,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "disp_cc_mdss_pclk0_clk_src",
>   		.parent_data = disp_cc_parent_data_5,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>   		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_pixel_ops,
>   	},
> @@ -310,7 +295,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "disp_cc_mdss_rot_clk_src",
>   		.parent_data = disp_cc_parent_data_3,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
>   		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
> @@ -324,7 +309,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "disp_cc_mdss_vsync_clk_src",
>   		.parent_data = disp_cc_parent_data_0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>   		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
> 

All the above code are auto-generated and we really do not want to 
hand-code.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
