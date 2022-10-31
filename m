Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86FD8613F8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 22:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbiJaVLx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 17:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiJaVLw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 17:11:52 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 261141401B;
        Mon, 31 Oct 2022 14:11:51 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.156.neoplus.adsl.tpnet.pl [95.49.29.156])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id EDD6F3EBDA;
        Mon, 31 Oct 2022 22:11:48 +0100 (CET)
Message-ID: <4340dd6a-c5f8-238a-c0a7-1baa68f0729e@somainline.org>
Date:   Mon, 31 Oct 2022 22:11:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 07/11] clk: qcom: mmcc-msm8974: move clock parent
 tables down
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
 <20221030155520.91629-8-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221030155520.91629-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30.10.2022 16:55, Dmitry Baryshkov wrote:
> Move clock parent tables down, after the PLL declarataions, so that we
> can use pll hw clock fields in the next commit.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  drivers/clk/qcom/mmcc-msm8974.c | 170 ++++++++++++++++----------------
>  1 file changed, 85 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
> index 9008df2305df..57f1a351c8f6 100644
> --- a/drivers/clk/qcom/mmcc-msm8974.c
> +++ b/drivers/clk/qcom/mmcc-msm8974.c
> @@ -42,6 +42,91 @@ enum {
>  	P_DSI1PLL_BYTE,
>  };
>  
> +static struct clk_pll mmpll0 = {
> +	.l_reg = 0x0004,
> +	.m_reg = 0x0008,
> +	.n_reg = 0x000c,
> +	.config_reg = 0x0014,
> +	.mode_reg = 0x0000,
> +	.status_reg = 0x001c,
> +	.status_bit = 17,
> +        .clkr.hw.init = &(struct clk_init_data){
> +                .name = "mmpll0",
> +                .parent_names = (const char *[]){ "xo" },
> +                .num_parents = 1,
> +                .ops = &clk_pll_ops,
> +        },
> +};
> +
> +static struct clk_regmap mmpll0_vote = {
> +	.enable_reg = 0x0100,
> +	.enable_mask = BIT(0),
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mmpll0_vote",
> +		.parent_names = (const char *[]){ "mmpll0" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_vote_ops,
> +	},
> +};
> +
> +static struct clk_pll mmpll1 = {
> +	.l_reg = 0x0044,
> +	.m_reg = 0x0048,
> +	.n_reg = 0x004c,
> +	.config_reg = 0x0050,
> +	.mode_reg = 0x0040,
> +	.status_reg = 0x005c,
> +	.status_bit = 17,
> +        .clkr.hw.init = &(struct clk_init_data){
> +                .name = "mmpll1",
> +                .parent_names = (const char *[]){ "xo" },
> +                .num_parents = 1,
> +                .ops = &clk_pll_ops,
> +        },
> +};
> +
> +static struct clk_regmap mmpll1_vote = {
> +	.enable_reg = 0x0100,
> +	.enable_mask = BIT(1),
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mmpll1_vote",
> +		.parent_names = (const char *[]){ "mmpll1" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_vote_ops,
> +	},
> +};
> +
> +static struct clk_pll mmpll2 = {
> +	.l_reg = 0x4104,
> +	.m_reg = 0x4108,
> +	.n_reg = 0x410c,
> +	.config_reg = 0x4110,
> +	.mode_reg = 0x4100,
> +	.status_reg = 0x411c,
> +        .clkr.hw.init = &(struct clk_init_data){
> +                .name = "mmpll2",
> +                .parent_names = (const char *[]){ "xo" },
> +                .num_parents = 1,
> +                .ops = &clk_pll_ops,
> +        },
> +};
> +
> +static struct clk_pll mmpll3 = {
> +	.l_reg = 0x0084,
> +	.m_reg = 0x0088,
> +	.n_reg = 0x008c,
> +	.config_reg = 0x0090,
> +	.mode_reg = 0x0080,
> +	.status_reg = 0x009c,
> +	.status_bit = 17,
> +        .clkr.hw.init = &(struct clk_init_data){
> +                .name = "mmpll3",
> +                .parent_names = (const char *[]){ "xo" },
> +                .num_parents = 1,
> +                .ops = &clk_pll_ops,
> +        },
> +};
> +
>  static const struct parent_map mmcc_xo_mmpll0_mmpll1_gpll0_map[] = {
>  	{ P_XO, 0 },
>  	{ P_MMPLL0, 1 },
> @@ -160,91 +245,6 @@ static const char * const mmcc_xo_dsibyte_hdmi_edp_gpll0[] = {
>  	"dsi1pllbyte",
>  };
>  
> -static struct clk_pll mmpll0 = {
> -	.l_reg = 0x0004,
> -	.m_reg = 0x0008,
> -	.n_reg = 0x000c,
> -	.config_reg = 0x0014,
> -	.mode_reg = 0x0000,
> -	.status_reg = 0x001c,
> -	.status_bit = 17,
> -        .clkr.hw.init = &(struct clk_init_data){
> -                .name = "mmpll0",
> -                .parent_names = (const char *[]){ "xo" },
> -                .num_parents = 1,
> -                .ops = &clk_pll_ops,
> -        },
> -};
> -
> -static struct clk_regmap mmpll0_vote = {
> -	.enable_reg = 0x0100,
> -	.enable_mask = BIT(0),
> -	.hw.init = &(struct clk_init_data){
> -		.name = "mmpll0_vote",
> -		.parent_names = (const char *[]){ "mmpll0" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_vote_ops,
> -	},
> -};
> -
> -static struct clk_pll mmpll1 = {
> -	.l_reg = 0x0044,
> -	.m_reg = 0x0048,
> -	.n_reg = 0x004c,
> -	.config_reg = 0x0050,
> -	.mode_reg = 0x0040,
> -	.status_reg = 0x005c,
> -	.status_bit = 17,
> -        .clkr.hw.init = &(struct clk_init_data){
> -                .name = "mmpll1",
> -                .parent_names = (const char *[]){ "xo" },
> -                .num_parents = 1,
> -                .ops = &clk_pll_ops,
> -        },
> -};
> -
> -static struct clk_regmap mmpll1_vote = {
> -	.enable_reg = 0x0100,
> -	.enable_mask = BIT(1),
> -	.hw.init = &(struct clk_init_data){
> -		.name = "mmpll1_vote",
> -		.parent_names = (const char *[]){ "mmpll1" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_vote_ops,
> -	},
> -};
> -
> -static struct clk_pll mmpll2 = {
> -	.l_reg = 0x4104,
> -	.m_reg = 0x4108,
> -	.n_reg = 0x410c,
> -	.config_reg = 0x4110,
> -	.mode_reg = 0x4100,
> -	.status_reg = 0x411c,
> -        .clkr.hw.init = &(struct clk_init_data){
> -                .name = "mmpll2",
> -                .parent_names = (const char *[]){ "xo" },
> -                .num_parents = 1,
> -                .ops = &clk_pll_ops,
> -        },
> -};
> -
> -static struct clk_pll mmpll3 = {
> -	.l_reg = 0x0084,
> -	.m_reg = 0x0088,
> -	.n_reg = 0x008c,
> -	.config_reg = 0x0090,
> -	.mode_reg = 0x0080,
> -	.status_reg = 0x009c,
> -	.status_bit = 17,
> -        .clkr.hw.init = &(struct clk_init_data){
> -                .name = "mmpll3",
> -                .parent_names = (const char *[]){ "xo" },
> -                .num_parents = 1,
> -                .ops = &clk_pll_ops,
> -        },
> -};
> -
>  static struct clk_rcg2 mmss_ahb_clk_src = {
>  	.cmd_rcgr = 0x5000,
>  	.hid_width = 5,
