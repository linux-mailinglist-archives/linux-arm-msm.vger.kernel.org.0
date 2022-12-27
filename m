Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC6B4656A09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 12:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbiL0Lta (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 06:49:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbiL0Lt3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 06:49:29 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D624E65C3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 03:49:27 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bt23so2637997lfb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 03:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZi33gAVkMsG+CNVyVVNShHOEA7rayJIu4Nizhsn+RA=;
        b=QnC0Haq4sXSCdsRYi1mlcMgOCAj9jsZVaMXYpAb/H5Ph58XUuRCFbYXfRgS4ASPFc9
         YjTWe/lBMMREjOWZC+pLIVZGEDN93o0QML3zn73PPp2iq2wp7lOzRpBb4uybrtMgZjdW
         qOfrS9aKnr6WL5N5kO1PekPodaRoeB6mzvosrQ4vF+CBPieaCQMmOCBii3Basa9Vjenq
         szQ1Zkfev/jJQKbv6yKtxJEp33LwnVQLoi/3ANK52SriPyQ3E5leebW4z33CcjAohfjl
         FJLMLVtX02xpPlzTYpmk9CEgoiLhi8tARtY67PPnFoM3+6/IQNGgRlOF6USSD24LSqmV
         WylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZi33gAVkMsG+CNVyVVNShHOEA7rayJIu4Nizhsn+RA=;
        b=o9knQrCzu1xU341U0FY4lJpB3TOf4pcv0D/3+B5aqWvQSlz7ZdE/MkBTtcr1kZdrjG
         SA8qb0d2OWYKQfwDal48IRbZic71Chgsb9BHJ/EU6uxlzS+uxUlviZEK45cyVPdKe6Ze
         Vg8W8rrfAq/8m20QYt0yQubtpQbxcfvgMv4UORpxVvP70yuET7zVE5iocnbzyM/xONPn
         nLx2F+SBfWJ4zGhQoJqywUIAnFMTgSR6cUeQt8K3dAEcYnPZVnh8+2ASEaQ9s32LpKyf
         wJO07NPcknZoSH6ZaImqKTfYgxbRj3s8k7c9co7e5e97B+AISQnVHGt3FUZVU/7rVud1
         dk+g==
X-Gm-Message-State: AFqh2kpuXLlkEgH1DwfeJ3JuaIU+CbqvKXZJD1mc4WO6FuClZ2zlDkIV
        Vdo6yGqCdJcF3soH7JPdNPcWqw==
X-Google-Smtp-Source: AMrXdXvGlG/AJvZEFtj+v4QfVukB31IBelwWPo489Ot4hmvSn5rTQo3q0bz/oddxgBIqjP6YzCWcFg==
X-Received: by 2002:a05:6512:3d9e:b0:4c0:2b07:e6e7 with SMTP id k30-20020a0565123d9e00b004c02b07e6e7mr7627486lfv.58.1672141766264;
        Tue, 27 Dec 2022 03:49:26 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id s4-20020a056512202400b004b5979f9ba8sm2216956lfs.210.2022.12.27.03.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 03:49:25 -0800 (PST)
Message-ID: <cb23546a-3f05-b509-d549-7b69499aa2c6@linaro.org>
Date:   Tue, 27 Dec 2022 12:49:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 05/12] clk: qcom: gcc-apq8084: move PLL clocks up
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
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
 <20221227013225.2847382-6-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221227013225.2847382-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27.12.2022 02:32, Dmitry Baryshkov wrote:
> Move PLL clock declarations up, before clock parent tables, so that we
> can use pll hw clock fields in the next commit.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-apq8084.c | 162 ++++++++++++++++-----------------
>  1 file changed, 81 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
> index b41f55b289ae..05a68f645115 100644
> --- a/drivers/clk/qcom/gcc-apq8084.c
> +++ b/drivers/clk/qcom/gcc-apq8084.c
> @@ -36,6 +36,87 @@ enum {
>  	P_SLEEP_CLK,
>  };
>  
> +static struct clk_pll gpll0 = {
> +	.l_reg = 0x0004,
> +	.m_reg = 0x0008,
> +	.n_reg = 0x000c,
> +	.config_reg = 0x0014,
> +	.mode_reg = 0x0000,
> +	.status_reg = 0x001c,
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
> +	.enable_reg = 0x1480,
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
> +	.l_reg = 0x0044,
> +	.m_reg = 0x0048,
> +	.n_reg = 0x004c,
> +	.config_reg = 0x0054,
> +	.mode_reg = 0x0040,
> +	.status_reg = 0x005c,
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
> +	.enable_reg = 0x1480,
> +	.enable_mask = BIT(1),
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gpll1_vote",
> +		.parent_names = (const char *[]){ "gpll1" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_vote_ops,
> +	},
> +};
> +
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
>  static const struct parent_map gcc_xo_gpll0_map[] = {
>  	{ P_XO, 0 },
>  	{ P_GPLL0, 1 }
> @@ -98,33 +179,6 @@ static const char * const gcc_xo_pcie_sleep[] = {
>  	"sleep_clk_src",
>  };
>  
> -static struct clk_pll gpll0 = {
> -	.l_reg = 0x0004,
> -	.m_reg = 0x0008,
> -	.n_reg = 0x000c,
> -	.config_reg = 0x0014,
> -	.mode_reg = 0x0000,
> -	.status_reg = 0x001c,
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
> -	.enable_reg = 0x1480,
> -	.enable_mask = BIT(0),
> -	.hw.init = &(struct clk_init_data){
> -		.name = "gpll0_vote",
> -		.parent_names = (const char *[]){ "gpll0" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_vote_ops,
> -	},
> -};
> -
>  static struct clk_rcg2 config_noc_clk_src = {
>  	.cmd_rcgr = 0x0150,
>  	.hid_width = 5,
> @@ -161,60 +215,6 @@ static struct clk_rcg2 system_noc_clk_src = {
>  	},
>  };
>  
> -static struct clk_pll gpll1 = {
> -	.l_reg = 0x0044,
> -	.m_reg = 0x0048,
> -	.n_reg = 0x004c,
> -	.config_reg = 0x0054,
> -	.mode_reg = 0x0040,
> -	.status_reg = 0x005c,
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
> -	.enable_reg = 0x1480,
> -	.enable_mask = BIT(1),
> -	.hw.init = &(struct clk_init_data){
> -		.name = "gpll1_vote",
> -		.parent_names = (const char *[]){ "gpll1" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_vote_ops,
> -	},
> -};
> -
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
>  static const struct freq_tbl ftbl_gcc_ufs_axi_clk[] = {
>  	F(100000000, P_GPLL0, 6, 0, 0),
>  	F(200000000, P_GPLL0, 3, 0, 0),
