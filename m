Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC92A551846
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 14:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241051AbiFTMJS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 08:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242546AbiFTMJP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 08:09:15 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4A413E08;
        Mon, 20 Jun 2022 05:09:13 -0700 (PDT)
Received: from [192.168.1.101] (abxh227.neoplus.adsl.tpnet.pl [83.9.1.227])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B1E0220139;
        Mon, 20 Jun 2022 14:09:10 +0200 (CEST)
Message-ID: <b654a636-2267-a441-f529-aae23aaa8632@somainline.org>
Date:   Mon, 20 Jun 2022 14:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 4/7] clk: qcom: gcc-msm8916: move clock parent tables
 down
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
References: <20220619212549.1240891-1-dmitry.baryshkov@linaro.org>
 <20220619212549.1240891-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220619212549.1240891-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19.06.2022 23:25, Dmitry Baryshkov wrote:
> Move clock parent tables down, after the GPLL declrataions, so that we
> can use gpll hw clock fields in the next commit.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  drivers/clk/qcom/gcc-msm8916.c | 216 ++++++++++++++++-----------------
>  1 file changed, 108 insertions(+), 108 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
> index 40c27ba6286f..7962edbdbcf6 100644
> --- a/drivers/clk/qcom/gcc-msm8916.c
> +++ b/drivers/clk/qcom/gcc-msm8916.c
> @@ -42,6 +42,114 @@ enum {
>  	P_EXT_MCLK,
>  };
>  
> +static struct clk_pll gpll0 = {
> +	.l_reg = 0x21004,
> +	.m_reg = 0x21008,
> +	.n_reg = 0x2100c,
> +	.config_reg = 0x21010,
> +	.mode_reg = 0x21000,
> +	.status_reg = 0x2101c,
> +	.status_bit = 17,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "gpll0",
> +		.parent_names = (const char *[]){ "xo" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_ops,
> +	},
> +};
> +
> +static struct clk_regmap gpll0_vote = {
> +	.enable_reg = 0x45000,
> +	.enable_mask = BIT(0),
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gpll0_vote",
> +		.parent_names = (const char *[]){ "gpll0" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_vote_ops,
> +	},
> +};
> +
> +static struct clk_pll gpll1 = {
> +	.l_reg = 0x20004,
> +	.m_reg = 0x20008,
> +	.n_reg = 0x2000c,
> +	.config_reg = 0x20010,
> +	.mode_reg = 0x20000,
> +	.status_reg = 0x2001c,
> +	.status_bit = 17,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "gpll1",
> +		.parent_names = (const char *[]){ "xo" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_ops,
> +	},
> +};
> +
> +static struct clk_regmap gpll1_vote = {
> +	.enable_reg = 0x45000,
> +	.enable_mask = BIT(1),
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gpll1_vote",
> +		.parent_names = (const char *[]){ "gpll1" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_vote_ops,
> +	},
> +};
> +
> +static struct clk_pll gpll2 = {
> +	.l_reg = 0x4a004,
> +	.m_reg = 0x4a008,
> +	.n_reg = 0x4a00c,
> +	.config_reg = 0x4a010,
> +	.mode_reg = 0x4a000,
> +	.status_reg = 0x4a01c,
> +	.status_bit = 17,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "gpll2",
> +		.parent_names = (const char *[]){ "xo" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_ops,
> +	},
> +};
> +
> +static struct clk_regmap gpll2_vote = {
> +	.enable_reg = 0x45000,
> +	.enable_mask = BIT(2),
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gpll2_vote",
> +		.parent_names = (const char *[]){ "gpll2" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_vote_ops,
> +	},
> +};
> +
> +static struct clk_pll bimc_pll = {
> +	.l_reg = 0x23004,
> +	.m_reg = 0x23008,
> +	.n_reg = 0x2300c,
> +	.config_reg = 0x23010,
> +	.mode_reg = 0x23000,
> +	.status_reg = 0x2301c,
> +	.status_bit = 17,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "bimc_pll",
> +		.parent_names = (const char *[]){ "xo" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_ops,
> +	},
> +};
> +
> +static struct clk_regmap bimc_pll_vote = {
> +	.enable_reg = 0x45000,
> +	.enable_mask = BIT(3),
> +	.hw.init = &(struct clk_init_data){
> +		.name = "bimc_pll_vote",
> +		.parent_names = (const char *[]){ "bimc_pll" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_vote_ops,
> +	},
> +};
> +
>  static const struct parent_map gcc_xo_gpll0_map[] = {
>  	{ P_XO, 0 },
>  	{ P_GPLL0, 1 },
> @@ -256,114 +364,6 @@ static const char * const gcc_xo_gpll1_emclk_sleep[] = {
>  	"sleep_clk",
>  };
>  
> -static struct clk_pll gpll0 = {
> -	.l_reg = 0x21004,
> -	.m_reg = 0x21008,
> -	.n_reg = 0x2100c,
> -	.config_reg = 0x21010,
> -	.mode_reg = 0x21000,
> -	.status_reg = 0x2101c,
> -	.status_bit = 17,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gpll0",
> -		.parent_names = (const char *[]){ "xo" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_ops,
> -	},
> -};
> -
> -static struct clk_regmap gpll0_vote = {
> -	.enable_reg = 0x45000,
> -	.enable_mask = BIT(0),
> -	.hw.init = &(struct clk_init_data){
> -		.name = "gpll0_vote",
> -		.parent_names = (const char *[]){ "gpll0" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_vote_ops,
> -	},
> -};
> -
> -static struct clk_pll gpll1 = {
> -	.l_reg = 0x20004,
> -	.m_reg = 0x20008,
> -	.n_reg = 0x2000c,
> -	.config_reg = 0x20010,
> -	.mode_reg = 0x20000,
> -	.status_reg = 0x2001c,
> -	.status_bit = 17,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gpll1",
> -		.parent_names = (const char *[]){ "xo" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_ops,
> -	},
> -};
> -
> -static struct clk_regmap gpll1_vote = {
> -	.enable_reg = 0x45000,
> -	.enable_mask = BIT(1),
> -	.hw.init = &(struct clk_init_data){
> -		.name = "gpll1_vote",
> -		.parent_names = (const char *[]){ "gpll1" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_vote_ops,
> -	},
> -};
> -
> -static struct clk_pll gpll2 = {
> -	.l_reg = 0x4a004,
> -	.m_reg = 0x4a008,
> -	.n_reg = 0x4a00c,
> -	.config_reg = 0x4a010,
> -	.mode_reg = 0x4a000,
> -	.status_reg = 0x4a01c,
> -	.status_bit = 17,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gpll2",
> -		.parent_names = (const char *[]){ "xo" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_ops,
> -	},
> -};
> -
> -static struct clk_regmap gpll2_vote = {
> -	.enable_reg = 0x45000,
> -	.enable_mask = BIT(2),
> -	.hw.init = &(struct clk_init_data){
> -		.name = "gpll2_vote",
> -		.parent_names = (const char *[]){ "gpll2" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_vote_ops,
> -	},
> -};
> -
> -static struct clk_pll bimc_pll = {
> -	.l_reg = 0x23004,
> -	.m_reg = 0x23008,
> -	.n_reg = 0x2300c,
> -	.config_reg = 0x23010,
> -	.mode_reg = 0x23000,
> -	.status_reg = 0x2301c,
> -	.status_bit = 17,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "bimc_pll",
> -		.parent_names = (const char *[]){ "xo" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_ops,
> -	},
> -};
> -
> -static struct clk_regmap bimc_pll_vote = {
> -	.enable_reg = 0x45000,
> -	.enable_mask = BIT(3),
> -	.hw.init = &(struct clk_init_data){
> -		.name = "bimc_pll_vote",
> -		.parent_names = (const char *[]){ "bimc_pll" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_vote_ops,
> -	},
> -};
> -
>  static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
>  	.cmd_rcgr = 0x27000,
>  	.hid_width = 5,
