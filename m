Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4005B656A6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 13:04:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbiL0MED (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 07:04:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbiL0MDn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 07:03:43 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD7FA19A
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 04:01:25 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id cf42so19351538lfb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 04:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MwY2Osf8gAjyTQ54zF0/ru5BOaKa7Q1vQ8GphFoVv/k=;
        b=q1fXJx/HYAhNxd2blkGEkfk0+HlDp1XQwiFoiyglKjLUrHvcApagt0wGLg/d+SF5ji
         2atTmjIvJXT5m2bpHav4i7DHgGZQSrX9f69F+sooaR3maCpILhHiq9TCur1yVrX9pP7c
         Z7BDYZPePnpAcLr7NycLkgC34Eghp5yop3VKnLLDouMMPRD5lMUgs4B7qSbBwwMeqb7C
         4Yoze+lGBftvjdXB2qorAimpLkK7sJ652bZ8gway9PzXkxbKJ29aTE9uhYPZ+7lwjMY6
         PUBPd67KFscJVVu4I5MNKkUBHRoEhM1GyU7r3Kn3FSO+Ravk5XhqJJemO49dqvGa1jvL
         1L/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MwY2Osf8gAjyTQ54zF0/ru5BOaKa7Q1vQ8GphFoVv/k=;
        b=QCDag/HG0Bqh6Gct/2wTx6vwrnbtnI42lY54MkvAEn8XrjOcGyTp5K67OU3LNzg2ax
         5lAkEjIPrFxfFe4nBjoVPDtCpUkP3akeKxEAOzxtuAzUiTDHWyZtr+WIsVMXcfpjXdMy
         QeZ/+qm2DEyN2eqHBO10tp76/1BW9rD+IT7U7KWYnXOBsT2emB7OAqhFfk+RPCX9C51Y
         8XpOPyu7bFIbYozgFb5dv0G5s5cZVCoOQOwdI0JHXeuJqhGZi5jZdLx2HEyyI1tmHsOo
         nktHZrCejH+6j0ablD+pqeAubFWMelBhrcQe+shYuYiUsSfMlwC8xVvmWwOOWIy37ETa
         pJBA==
X-Gm-Message-State: AFqh2kpotcL8JBczf63GMkozz7/EuwGI2boPo9N6CzPUfW/7puq78Jqy
        wNKgA4dTfLUmW3wIz1e/83dxpg==
X-Google-Smtp-Source: AMrXdXu8aaq+KUBSXMQIk0jC+M68spnQIeEHi19c3VUTpa8zTBqRs46My97c8zuItLFiUFGf8t57Bw==
X-Received: by 2002:ac2:5394:0:b0:4b4:e2c9:9b25 with SMTP id g20-20020ac25394000000b004b4e2c99b25mr5635279lfh.44.1672142459061;
        Tue, 27 Dec 2022 04:00:59 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id c2-20020a056512324200b004cafa5f5ae3sm1767574lfr.42.2022.12.27.04.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 04:00:58 -0800 (PST)
Message-ID: <6b294284-03a2-f109-ed5f-5e0f3fbc00a0@linaro.org>
Date:   Tue, 27 Dec 2022 13:00:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 09/12] clk: qcom: mmcc-apq8084: move clock parent
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
        devicetree@vger.kernel.org
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
 <20221227013225.2847382-10-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221227013225.2847382-10-dmitry.baryshkov@linaro.org>
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
> Move clock parent tables down, after the PLL declrataions, so that we
> can use pll hw clock fields in the next commit.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/mmcc-apq8084.c | 200 ++++++++++++++++----------------
>  1 file changed, 100 insertions(+), 100 deletions(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
> index 4acbcb43927f..fee7c767132d 100644
> --- a/drivers/clk/qcom/mmcc-apq8084.c
> +++ b/drivers/clk/qcom/mmcc-apq8084.c
> @@ -40,6 +40,106 @@ enum {
>  	P_MMSLEEP,
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
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "mmpll0",
> +		.parent_names = (const char *[]){ "xo" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_ops,
> +	},
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
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "mmpll1",
> +		.parent_names = (const char *[]){ "xo" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_ops,
> +	},
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
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "mmpll2",
> +		.parent_names = (const char *[]){ "xo" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_ops,
> +	},
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
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "mmpll3",
> +		.parent_names = (const char *[]){ "xo" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_ops,
> +	},
> +};
> +
> +static struct clk_pll mmpll4 = {
> +	.l_reg = 0x00a4,
> +	.m_reg = 0x00a8,
> +	.n_reg = 0x00ac,
> +	.config_reg = 0x00b0,
> +	.mode_reg = 0x0080,
> +	.status_reg = 0x00bc,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "mmpll4",
> +		.parent_names = (const char *[]){ "xo" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_ops,
> +	},
> +};
> +
>  static const struct parent_map mmcc_xo_mmpll0_mmpll1_gpll0_map[] = {
>  	{ P_XO, 0 },
>  	{ P_MMPLL0, 1 },
> @@ -212,106 +312,6 @@ static const char * const mmcc_xo_mmpll0_1_4_gpll1_0_sleep[] = {
>  	"sleep_clk_src",
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
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "mmpll0",
> -		.parent_names = (const char *[]){ "xo" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_ops,
> -	},
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
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "mmpll1",
> -		.parent_names = (const char *[]){ "xo" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_ops,
> -	},
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
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "mmpll2",
> -		.parent_names = (const char *[]){ "xo" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_ops,
> -	},
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
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "mmpll3",
> -		.parent_names = (const char *[]){ "xo" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_ops,
> -	},
> -};
> -
> -static struct clk_pll mmpll4 = {
> -	.l_reg = 0x00a4,
> -	.m_reg = 0x00a8,
> -	.n_reg = 0x00ac,
> -	.config_reg = 0x00b0,
> -	.mode_reg = 0x0080,
> -	.status_reg = 0x00bc,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "mmpll4",
> -		.parent_names = (const char *[]){ "xo" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_ops,
> -	},
> -};
> -
>  static struct clk_rcg2 mmss_ahb_clk_src = {
>  	.cmd_rcgr = 0x5000,
>  	.hid_width = 5,
