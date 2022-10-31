Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D069F613F8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 22:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbiJaVLo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 17:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiJaVLo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 17:11:44 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09D514018
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 14:11:40 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.156.neoplus.adsl.tpnet.pl [95.49.29.156])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3322A3EBDD;
        Mon, 31 Oct 2022 22:11:38 +0100 (CET)
Message-ID: <be4da650-27ac-fcd7-b71d-1531f421d030@somainline.org>
Date:   Mon, 31 Oct 2022 22:11:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 06/11] clk: qcom: mmcc-msm8974: use ARRAY_SIZE instead
 of specifying num_parents
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20221030155520.91629-1-dmitry.baryshkov@linaro.org>
 <20221030155520.91629-7-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221030155520.91629-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30.10.2022 16:55, Dmitry Baryshkov wrote:
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  drivers/clk/qcom/mmcc-msm8974.c | 74 ++++++++++++++++-----------------
>  1 file changed, 37 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
> index f74662925a58..9008df2305df 100644
> --- a/drivers/clk/qcom/mmcc-msm8974.c
> +++ b/drivers/clk/qcom/mmcc-msm8974.c
> @@ -252,7 +252,7 @@ static struct clk_rcg2 mmss_ahb_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mmss_ahb_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -289,7 +289,7 @@ static struct clk_rcg2 mmss_axi_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mmss_axi_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -313,7 +313,7 @@ static struct clk_rcg2 ocmemnoc_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "ocmemnoc_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -332,7 +332,7 @@ static struct clk_rcg2 csi0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi0_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -345,7 +345,7 @@ static struct clk_rcg2 csi1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi1_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -358,7 +358,7 @@ static struct clk_rcg2 csi2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi2_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -371,7 +371,7 @@ static struct clk_rcg2 csi3_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi3_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -418,7 +418,7 @@ static struct clk_rcg2 vfe0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "vfe0_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -431,7 +431,7 @@ static struct clk_rcg2 vfe1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "vfe1_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -472,7 +472,7 @@ static struct clk_rcg2 mdp_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mdp_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_dsi_hdmi_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_dsi_hdmi_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -495,7 +495,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "jpeg0_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -508,7 +508,7 @@ static struct clk_rcg2 jpeg1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "jpeg1_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -521,7 +521,7 @@ static struct clk_rcg2 jpeg2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "jpeg2_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -534,7 +534,7 @@ static struct clk_rcg2 pclk0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "pclk0_clk_src",
>  		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
>  		.ops = &clk_pixel_ops,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
> @@ -548,7 +548,7 @@ static struct clk_rcg2 pclk1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "pclk1_clk_src",
>  		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
>  		.ops = &clk_pixel_ops,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
> @@ -581,7 +581,7 @@ static struct clk_rcg2 vcodec0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "vcodec0_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_3_gpll0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_3_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -599,7 +599,7 @@ static struct clk_rcg2 cci_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cci_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -623,7 +623,7 @@ static struct clk_rcg2 camss_gp0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "camss_gp0_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_gpll1_0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_gpll1_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -637,7 +637,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "camss_gp1_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_gpll1_0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_gpll1_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -672,7 +672,7 @@ static struct clk_rcg2 mclk0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mclk0_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -685,7 +685,7 @@ static struct clk_rcg2 mclk1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mclk1_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -698,7 +698,7 @@ static struct clk_rcg2 mclk2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mclk2_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -711,7 +711,7 @@ static struct clk_rcg2 mclk3_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mclk3_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -730,7 +730,7 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi0phytimer_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -743,7 +743,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi1phytimer_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -756,7 +756,7 @@ static struct clk_rcg2 csi2phytimer_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi2phytimer_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -787,7 +787,7 @@ static struct clk_rcg2 cpp_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cpp_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -805,7 +805,7 @@ static struct clk_rcg2 byte0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "byte0_clk_src",
>  		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
>  		.ops = &clk_byte2_ops,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
> @@ -819,7 +819,7 @@ static struct clk_rcg2 byte1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "byte1_clk_src",
>  		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
>  		.ops = &clk_byte2_ops,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
> @@ -838,7 +838,7 @@ static struct clk_rcg2 edpaux_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "edpaux_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -857,7 +857,7 @@ static struct clk_rcg2 edplink_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "edplink_clk_src",
>  		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
>  		.ops = &clk_rcg2_ops,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
> @@ -877,7 +877,7 @@ static struct clk_rcg2 edppixel_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "edppixel_clk_src",
>  		.parent_names = mmcc_xo_dsi_hdmi_edp,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp),
>  		.ops = &clk_edp_pixel_ops,
>  	},
>  };
> @@ -895,7 +895,7 @@ static struct clk_rcg2 esc0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "esc0_clk_src",
>  		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -908,7 +908,7 @@ static struct clk_rcg2 esc1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "esc1_clk_src",
>  		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -926,7 +926,7 @@ static struct clk_rcg2 extpclk_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "extpclk_clk_src",
>  		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
>  		.ops = &clk_byte_ops,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
> @@ -945,7 +945,7 @@ static struct clk_rcg2 hdmi_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "hdmi_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -963,7 +963,7 @@ static struct clk_rcg2 vsync_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "vsync_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
