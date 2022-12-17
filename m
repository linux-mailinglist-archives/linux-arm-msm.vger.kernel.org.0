Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6BE64F9B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 16:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbiLQPK1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Dec 2022 10:10:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbiLQPK0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Dec 2022 10:10:26 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55163140A2
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:10:24 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id a19so5061746ljk.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3tE0ud63pAijts+MSlgmI/hfGG0FcVK+oXwysksKiPs=;
        b=l7BNZ761buqWSs1IDriJbqbrAhwwvs/mIO0Tn4UYj3MgjDsnMhSX2j/JMre2tLiNQn
         4iVzkfs4O4Mxk6CQbDbcmmWOmo43FXzCScst2Z6x003rDnPx7phaop/9ZjX80QSU5vWj
         RjJRJN9VK26Fh2iNovUBRvzO8m1rrdk9jwCmzPzjBBbl27xupRL9Mu6e5AcrLjfLidKl
         qA99VYEaO0PXs+enR5n3BJ1lwvhcNZVI/gRLyzG7nY/3LbajjDZAxrOymEUCIYizzO3v
         VL0CDYXDvk4KpnhC1onB4d8TTLllfDQ+XXvERL9Fzn5OPlQzBu1KN72aakIl4BsPwac/
         CqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3tE0ud63pAijts+MSlgmI/hfGG0FcVK+oXwysksKiPs=;
        b=ZPaNjEMLDonKm6uhcQZsSoWhfUp63aVWi3WWl+gjtz7ym9usvRCuIYYPg3MJAHOJz7
         0oEWuCPBQgXhoYsu7OCHbS0EyrcKIAuJF8Qn7LnjJU9Gw8DC23Xh4H3R2GdX5g3p9dAQ
         2oKiBbsDbfGV5+f6j6+ilWBnXQy7BGSIF1t8w7AW8rEUjoTyuMh9G+zriHBwIQVvK4S/
         gvPKq7GUXy0cSw77VZrHsooYy+d3Cb0mZRP0NOUZYkJTgURW8dajzdOT/RO7KF27RdkW
         eEk6KgUeUPSBBnPP9/fbfUGKlNUkjBfm1L8XIk8WqX9ZQkuIYy6M5wAin8I0qO01r/xK
         85Eg==
X-Gm-Message-State: AFqh2koxcvyF1QZbrApYTR40m9dmoP+iwfz9365xVHF4g7IXdt4EKTUN
        wajMnKKrwXkFezZLWy2GLgb37w==
X-Google-Smtp-Source: AMrXdXv3XC4sXCAwnE5w0OwpmnIP+qiWAzNxKGDnulwPIpjcqj3yUUhbSYnwySp6/qXveP9t6wYxEA==
X-Received: by 2002:a05:651c:124b:b0:27f:7190:5ae3 with SMTP id h11-20020a05651c124b00b0027f71905ae3mr649507ljh.11.1671289822651;
        Sat, 17 Dec 2022 07:10:22 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id s28-20020a05651c201c00b00279a5b85791sm368903ljo.88.2022.12.17.07.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:10:22 -0800 (PST)
Message-ID: <41746d9c-7179-5022-b68d-55e74cb07c3a@linaro.org>
Date:   Sat, 17 Dec 2022 16:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 09/15] clk: qcom: gcc-qcs404: move PLL clocks up
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
        devicetree@vger.kernel.org
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
 <20221217001730.540502-10-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217001730.540502-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.12.2022 01:17, Dmitry Baryshkov wrote:
> Move PLL clock declarations up, before clock parent tables, so that we
> can use pll hw clock fields in the next commit.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/gcc-qcs404.c | 298 +++++++++++++++++-----------------
>  1 file changed, 149 insertions(+), 149 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index fb94c57a00af..5ae7a6b2a326 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -37,6 +37,155 @@ enum {
>  	P_XO,
>  };
>  
> +static struct clk_fixed_factor cxo = {
> +	.mult = 1,
> +	.div = 1,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cxo",
> +		.parent_names = (const char *[]){ "xo-board" },
> +		.num_parents = 1,
> +		.ops = &clk_fixed_factor_ops,
> +	},
> +};
> +
> +static struct clk_alpha_pll gpll0_sleep_clk_src = {
> +	.offset = 0x21000,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> +	.clkr = {
> +		.enable_reg = 0x45008,
> +		.enable_mask = BIT(23),
> +		.enable_is_inverted = true,
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gpll0_sleep_clk_src",
> +			.parent_names = (const char *[]){ "cxo" },
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_alpha_pll gpll0_out_main = {
> +	.offset = 0x21000,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> +	.flags = SUPPORTS_FSM_MODE,
> +	.clkr = {
> +		.enable_reg = 0x45000,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gpll0_out_main",
> +			.parent_names = (const char *[])
> +					{ "cxo" },
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_alpha_pll gpll0_ao_out_main = {
> +	.offset = 0x21000,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> +	.flags = SUPPORTS_FSM_MODE,
> +	.clkr = {
> +		.enable_reg = 0x45000,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gpll0_ao_out_main",
> +			.parent_names = (const char *[]){ "cxo" },
> +			.num_parents = 1,
> +			.flags = CLK_IS_CRITICAL,
> +			.ops = &clk_alpha_pll_fixed_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_alpha_pll gpll1_out_main = {
> +	.offset = 0x20000,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> +	.clkr = {
> +		.enable_reg = 0x45000,
> +		.enable_mask = BIT(1),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gpll1_out_main",
> +			.parent_names = (const char *[]){ "cxo" },
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_ops,
> +		},
> +	},
> +};
> +
> +/* 930MHz configuration */
> +static const struct alpha_pll_config gpll3_config = {
> +	.l = 48,
> +	.alpha = 0x0,
> +	.alpha_en_mask = BIT(24),
> +	.post_div_mask = 0xf << 8,
> +	.post_div_val = 0x1 << 8,
> +	.vco_mask = 0x3 << 20,
> +	.main_output_mask = 0x1,
> +	.config_ctl_val = 0x4001055b,
> +};
> +
> +static const struct pll_vco gpll3_vco[] = {
> +	{ 700000000, 1400000000, 0 },
> +};
> +
> +static struct clk_alpha_pll gpll3_out_main = {
> +	.offset = 0x22000,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> +	.vco_table = gpll3_vco,
> +	.num_vco = ARRAY_SIZE(gpll3_vco),
> +	.clkr = {
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gpll3_out_main",
> +			.parent_names = (const char *[]){ "cxo" },
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_alpha_pll gpll4_out_main = {
> +	.offset = 0x24000,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> +	.clkr = {
> +		.enable_reg = 0x45000,
> +		.enable_mask = BIT(5),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gpll4_out_main",
> +			.parent_names = (const char *[]){ "cxo" },
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_pll gpll6 = {
> +	.l_reg = 0x37004,
> +	.m_reg = 0x37008,
> +	.n_reg = 0x3700C,
> +	.config_reg = 0x37014,
> +	.mode_reg = 0x37000,
> +	.status_reg = 0x3701C,
Getting rid of uppercase hex would be nice too!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +	.status_bit = 17,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "gpll6",
> +		.parent_names = (const char *[]){ "cxo" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_ops,
> +	},
> +};
> +
> +static struct clk_regmap gpll6_out_aux = {
> +	.enable_reg = 0x45000,
> +	.enable_mask = BIT(7),
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gpll6_out_aux",
> +		.parent_names = (const char *[]){ "gpll6" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_vote_ops,
> +	},
> +};
> +
>  static const struct parent_map gcc_parent_map_0[] = {
>  	{ P_XO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
> @@ -240,155 +389,6 @@ static const char * const gcc_parent_names_16[] = {
>  	/* "gpll0_out_aux", */
>  };
>  
> -static struct clk_fixed_factor cxo = {
> -	.mult = 1,
> -	.div = 1,
> -	.hw.init = &(struct clk_init_data){
> -		.name = "cxo",
> -		.parent_names = (const char *[]){ "xo-board" },
> -		.num_parents = 1,
> -		.ops = &clk_fixed_factor_ops,
> -	},
> -};
> -
> -static struct clk_alpha_pll gpll0_sleep_clk_src = {
> -	.offset = 0x21000,
> -	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> -	.clkr = {
> -		.enable_reg = 0x45008,
> -		.enable_mask = BIT(23),
> -		.enable_is_inverted = true,
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gpll0_sleep_clk_src",
> -			.parent_names = (const char *[]){ "cxo" },
> -			.num_parents = 1,
> -			.ops = &clk_alpha_pll_ops,
> -		},
> -	},
> -};
> -
> -static struct clk_alpha_pll gpll0_out_main = {
> -	.offset = 0x21000,
> -	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> -	.flags = SUPPORTS_FSM_MODE,
> -	.clkr = {
> -		.enable_reg = 0x45000,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gpll0_out_main",
> -			.parent_names = (const char *[])
> -					{ "cxo" },
> -			.num_parents = 1,
> -			.ops = &clk_alpha_pll_ops,
> -		},
> -	},
> -};
> -
> -static struct clk_alpha_pll gpll0_ao_out_main = {
> -	.offset = 0x21000,
> -	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> -	.flags = SUPPORTS_FSM_MODE,
> -	.clkr = {
> -		.enable_reg = 0x45000,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gpll0_ao_out_main",
> -			.parent_names = (const char *[]){ "cxo" },
> -			.num_parents = 1,
> -			.flags = CLK_IS_CRITICAL,
> -			.ops = &clk_alpha_pll_fixed_ops,
> -		},
> -	},
> -};
> -
> -static struct clk_alpha_pll gpll1_out_main = {
> -	.offset = 0x20000,
> -	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> -	.clkr = {
> -		.enable_reg = 0x45000,
> -		.enable_mask = BIT(1),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gpll1_out_main",
> -			.parent_names = (const char *[]){ "cxo" },
> -			.num_parents = 1,
> -			.ops = &clk_alpha_pll_ops,
> -		},
> -	},
> -};
> -
> -/* 930MHz configuration */
> -static const struct alpha_pll_config gpll3_config = {
> -	.l = 48,
> -	.alpha = 0x0,
> -	.alpha_en_mask = BIT(24),
> -	.post_div_mask = 0xf << 8,
> -	.post_div_val = 0x1 << 8,
> -	.vco_mask = 0x3 << 20,
> -	.main_output_mask = 0x1,
> -	.config_ctl_val = 0x4001055b,
> -};
> -
> -static const struct pll_vco gpll3_vco[] = {
> -	{ 700000000, 1400000000, 0 },
> -};
> -
> -static struct clk_alpha_pll gpll3_out_main = {
> -	.offset = 0x22000,
> -	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> -	.vco_table = gpll3_vco,
> -	.num_vco = ARRAY_SIZE(gpll3_vco),
> -	.clkr = {
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gpll3_out_main",
> -			.parent_names = (const char *[]){ "cxo" },
> -			.num_parents = 1,
> -			.ops = &clk_alpha_pll_ops,
> -		},
> -	},
> -};
> -
> -static struct clk_alpha_pll gpll4_out_main = {
> -	.offset = 0x24000,
> -	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> -	.clkr = {
> -		.enable_reg = 0x45000,
> -		.enable_mask = BIT(5),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gpll4_out_main",
> -			.parent_names = (const char *[]){ "cxo" },
> -			.num_parents = 1,
> -			.ops = &clk_alpha_pll_ops,
> -		},
> -	},
> -};
> -
> -static struct clk_pll gpll6 = {
> -	.l_reg = 0x37004,
> -	.m_reg = 0x37008,
> -	.n_reg = 0x3700C,
> -	.config_reg = 0x37014,
> -	.mode_reg = 0x37000,
> -	.status_reg = 0x3701C,
> -	.status_bit = 17,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gpll6",
> -		.parent_names = (const char *[]){ "cxo" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_ops,
> -	},
> -};
> -
> -static struct clk_regmap gpll6_out_aux = {
> -	.enable_reg = 0x45000,
> -	.enable_mask = BIT(7),
> -	.hw.init = &(struct clk_init_data){
> -		.name = "gpll6_out_aux",
> -		.parent_names = (const char *[]){ "gpll6" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_vote_ops,
> -	},
> -};
> -
>  static const struct freq_tbl ftbl_apss_ahb_clk_src[] = {
>  	F(19200000, P_XO, 1, 0, 0),
>  	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
