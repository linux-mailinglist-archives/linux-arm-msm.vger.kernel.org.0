Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98D23613F89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 22:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiJaVKy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 17:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiJaVKx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 17:10:53 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F4E1401A;
        Mon, 31 Oct 2022 14:10:52 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.156.neoplus.adsl.tpnet.pl [95.49.29.156])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 18DCF3EBDD;
        Mon, 31 Oct 2022 22:10:50 +0100 (CET)
Message-ID: <12a2ec66-61fd-d3ce-aaf4-1ec28a2d4276@somainline.org>
Date:   Mon, 31 Oct 2022 22:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 04/11] clk: qcom: gcc-msm8974: move clock parent tables
 down
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
 <20221030155520.91629-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221030155520.91629-5-dmitry.baryshkov@linaro.org>
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
> Rearrage clock parent tables and PLL declarations (pull parents down
> and gpll4 up), so that we can use pll hw clock fields in the next
> commit.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  drivers/clk/qcom/gcc-msm8974.c | 98 +++++++++++++++++-----------------
>  1 file changed, 49 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
> index b847ce852ef8..77f3497265a0 100644
> --- a/drivers/clk/qcom/gcc-msm8974.c
> +++ b/drivers/clk/qcom/gcc-msm8974.c
> @@ -32,28 +32,6 @@ enum {
>  	P_GPLL4,
>  };
>  
> -static const struct parent_map gcc_xo_gpll0_map[] = {
> -	{ P_XO, 0 },
> -	{ P_GPLL0, 1 }
> -};
> -
> -static const char * const gcc_xo_gpll0[] = {
> -	"xo",
> -	"gpll0_vote",
> -};
> -
> -static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
> -	{ P_XO, 0 },
> -	{ P_GPLL0, 1 },
> -	{ P_GPLL4, 5 }
> -};
> -
> -static const char * const gcc_xo_gpll0_gpll4[] = {
> -	"xo",
> -	"gpll0_vote",
> -	"gpll4_vote",
> -};
> -
>  static struct clk_pll gpll0 = {
>  	.l_reg = 0x0004,
>  	.m_reg = 0x0008,
> @@ -81,6 +59,55 @@ static struct clk_regmap gpll0_vote = {
>  	},
>  };
>  
> +static struct clk_pll gpll4 = {
> +	.l_reg = 0x1dc4,
> +	.m_reg = 0x1dc8,
> +	.n_reg = 0x1dcc,
> +	.config_reg = 0x1dd4,
> +	.mode_reg = 0x1dc0,
> +	.status_reg = 0x1ddc,
> +	.status_bit = 17,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "gpll4",
> +		.parent_names = (const char *[]){ "xo" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_ops,
> +	},
> +};
> +
> +static struct clk_regmap gpll4_vote = {
> +	.enable_reg = 0x1480,
> +	.enable_mask = BIT(4),
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gpll4_vote",
> +		.parent_names = (const char *[]){ "gpll4" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_vote_ops,
> +	},
> +};
> +
> +static const struct parent_map gcc_xo_gpll0_map[] = {
> +	{ P_XO, 0 },
> +	{ P_GPLL0, 1 }
> +};
> +
> +static const char * const gcc_xo_gpll0[] = {
> +	"xo",
> +	"gpll0_vote",
> +};
> +
> +static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
> +	{ P_XO, 0 },
> +	{ P_GPLL0, 1 },
> +	{ P_GPLL4, 5 }
> +};
> +
> +static const char * const gcc_xo_gpll0_gpll4[] = {
> +	"xo",
> +	"gpll0_vote",
> +	"gpll4_vote",
> +};
> +
>  static struct clk_rcg2 config_noc_clk_src = {
>  	.cmd_rcgr = 0x0150,
>  	.hid_width = 5,
> @@ -144,33 +171,6 @@ static struct clk_regmap gpll1_vote = {
>  	},
>  };
>  
> -static struct clk_pll gpll4 = {
> -	.l_reg = 0x1dc4,
> -	.m_reg = 0x1dc8,
> -	.n_reg = 0x1dcc,
> -	.config_reg = 0x1dd4,
> -	.mode_reg = 0x1dc0,
> -	.status_reg = 0x1ddc,
> -	.status_bit = 17,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gpll4",
> -		.parent_names = (const char *[]){ "xo" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_ops,
> -	},
> -};
> -
> -static struct clk_regmap gpll4_vote = {
> -	.enable_reg = 0x1480,
> -	.enable_mask = BIT(4),
> -	.hw.init = &(struct clk_init_data){
> -		.name = "gpll4_vote",
> -		.parent_names = (const char *[]){ "gpll4" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_vote_ops,
> -	},
> -};
> -
>  static const struct freq_tbl ftbl_gcc_usb30_master_clk[] = {
>  	F(125000000, P_GPLL0, 1, 5, 24),
>  	{ }
