Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 375C2613F87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 22:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbiJaVKg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 17:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiJaVKf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 17:10:35 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0BDD14018
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 14:10:33 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.156.neoplus.adsl.tpnet.pl [95.49.29.156])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 927B93EBDA;
        Mon, 31 Oct 2022 22:10:31 +0100 (CET)
Message-ID: <79971410-bfab-2109-5368-e87d93748171@somainline.org>
Date:   Mon, 31 Oct 2022 22:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 03/11] clk: qcom: gcc-msm8974: use ARRAY_SIZE instead
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
 <20221030155520.91629-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221030155520.91629-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=ham
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
>  drivers/clk/qcom/gcc-msm8974.c | 110 ++++++++++++++++-----------------
>  1 file changed, 55 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
> index bf305fa9e522..b847ce852ef8 100644
> --- a/drivers/clk/qcom/gcc-msm8974.c
> +++ b/drivers/clk/qcom/gcc-msm8974.c
> @@ -88,7 +88,7 @@ static struct clk_rcg2 config_noc_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "config_noc_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -100,7 +100,7 @@ static struct clk_rcg2 periph_noc_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "periph_noc_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -112,7 +112,7 @@ static struct clk_rcg2 system_noc_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "system_noc_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -185,7 +185,7 @@ static struct clk_rcg2 usb30_master_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "usb30_master_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -205,7 +205,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup1_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -230,7 +230,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup1_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -243,7 +243,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup2_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -257,7 +257,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup2_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -270,7 +270,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup3_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -284,7 +284,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup3_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -297,7 +297,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup4_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -311,7 +311,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup4_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -324,7 +324,7 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup5_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -338,7 +338,7 @@ static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup5_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -351,7 +351,7 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup6_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -365,7 +365,7 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup6_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -398,7 +398,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart1_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -412,7 +412,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart2_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -426,7 +426,7 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart3_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -440,7 +440,7 @@ static struct clk_rcg2 blsp1_uart4_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart4_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -454,7 +454,7 @@ static struct clk_rcg2 blsp1_uart5_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart5_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -468,7 +468,7 @@ static struct clk_rcg2 blsp1_uart6_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart6_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -481,7 +481,7 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup1_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -495,7 +495,7 @@ static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup1_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -508,7 +508,7 @@ static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup2_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -522,7 +522,7 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup2_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -535,7 +535,7 @@ static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup3_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -549,7 +549,7 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup3_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -562,7 +562,7 @@ static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup4_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -576,7 +576,7 @@ static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup4_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -589,7 +589,7 @@ static struct clk_rcg2 blsp2_qup5_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup5_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -603,7 +603,7 @@ static struct clk_rcg2 blsp2_qup5_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup5_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -616,7 +616,7 @@ static struct clk_rcg2 blsp2_qup6_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup6_i2c_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -630,7 +630,7 @@ static struct clk_rcg2 blsp2_qup6_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup6_spi_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -644,7 +644,7 @@ static struct clk_rcg2 blsp2_uart1_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_uart1_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -658,7 +658,7 @@ static struct clk_rcg2 blsp2_uart2_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_uart2_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -672,7 +672,7 @@ static struct clk_rcg2 blsp2_uart3_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_uart3_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -686,7 +686,7 @@ static struct clk_rcg2 blsp2_uart4_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_uart4_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -700,7 +700,7 @@ static struct clk_rcg2 blsp2_uart5_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_uart5_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -714,7 +714,7 @@ static struct clk_rcg2 blsp2_uart6_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_uart6_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -741,7 +741,7 @@ static struct clk_rcg2 ce1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "ce1_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -762,7 +762,7 @@ static struct clk_rcg2 ce2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "ce2_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -794,7 +794,7 @@ static struct clk_rcg2 gp1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gp1_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -808,7 +808,7 @@ static struct clk_rcg2 gp2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gp2_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -822,7 +822,7 @@ static struct clk_rcg2 gp3_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gp3_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -840,7 +840,7 @@ static struct clk_rcg2 pdm2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "pdm2_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -872,7 +872,7 @@ static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk_pro[] = {
>  static struct clk_init_data sdcc1_apps_clk_src_init = {
>  	.name = "sdcc1_apps_clk_src",
>  	.parent_names = gcc_xo_gpll0,
> -	.num_parents = 2,
> +	.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  	.ops = &clk_rcg2_floor_ops,
>  };
>  
> @@ -894,7 +894,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "sdcc2_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
> @@ -908,7 +908,7 @@ static struct clk_rcg2 sdcc3_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "sdcc3_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
> @@ -922,7 +922,7 @@ static struct clk_rcg2 sdcc4_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "sdcc4_apps_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
> @@ -941,7 +941,7 @@ static struct clk_rcg2 tsif_ref_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "tsif_ref_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -959,7 +959,7 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "usb30_mock_utmi_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -978,7 +978,7 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "usb_hs_system_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1022,7 +1022,7 @@ static struct clk_rcg2 usb_hsic_io_cal_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "usb_hsic_io_cal_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 1,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
It differs! I wonder if that's gonna fix anything :D

Anyway,

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1041,7 +1041,7 @@ static struct clk_rcg2 usb_hsic_system_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "usb_hsic_system_clk_src",
>  		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
