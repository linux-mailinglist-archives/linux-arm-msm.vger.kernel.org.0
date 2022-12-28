Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D91D1657754
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 14:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232939AbiL1Nju (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 08:39:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbiL1Njt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 08:39:49 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F16CDFCF4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:39:47 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bf43so23663097lfb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eivbSK/iggE609kMctsDa0t3SvfhXTo/TwRgMrcMZFg=;
        b=Oks7pXiC6qUVeemn/v839Rt/lL5d0+dpW7V5//V9fTgHM0F+TQk8VhMY/RPv2P39Lb
         R0eO5V2rw+d7TK8xJLau8DchNPeGTLolBqgbafOygs2YtBpCbp1ThuAmiqIQ80EqVdol
         Vga3XhjoJDwGjxpgNzwDbiuWmS0OqRTi896coKzyjiUv05XxbHIsjCYlpTaRjCDWmyIF
         znxoAUjsu+EWPgEiSEp7B+w/RFPaB4ti6ebz51P9vH+Huckps0gFv4cMaVEWfVFt5JGD
         s2+6WlzPDTNG3ZHDmPkKeyy7RTwBgw2/TmRxRXvUBi0MbBzK/18Nv3ZrsKBEOMVIHGbV
         5wFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eivbSK/iggE609kMctsDa0t3SvfhXTo/TwRgMrcMZFg=;
        b=0pzkflzIcWDP4gnBYGZ64QhCF7MB+Q7EK8XG6cmnyKz9TzeN0SjplNpTNV6I+379W6
         EEJbiieFlenEJV8T1n1bJNqotOjuNndCe0NQlGGo6GSZKRQXaa5S17COgMcr5XMh9wBK
         2ErBBIRbPrEP7a+UdWRvG9WpnJErz1GuzKz8SiRrYq9OYIVTVKNkLKwnPhoGP0swkhXq
         mmSLUpuNgVpbWVQaEw5VnTlImKEQR0xjGlCV+1vVwJcjgpPZ3MJmOFSwtU2HlkzIhv4u
         Cvb3h00SLtQwKczeCAWPGtqbjTLhrEnDGH/43nXgJ6JjK1Y4K1B/yz0FSnrqZ2sojvBJ
         BDBQ==
X-Gm-Message-State: AFqh2krl+KUcDAXkTtQoongTiPXNf86qxxPq21wCNHvjG2I6PBlgoUN9
        oXy/72ANQT0iff/L6+NvPDjG//31+kdAzga2
X-Google-Smtp-Source: AMrXdXvfhxQizm2dgNBqqEymbFkmBWtNN8ZdGdsPnNC7WrUaeLCdhGb3DFY0xYgMOfCjt2LITR/RmQ==
X-Received: by 2002:a05:6512:ac4:b0:4ca:5013:b0e7 with SMTP id n4-20020a0565120ac400b004ca5013b0e7mr10964106lfu.59.1672234786292;
        Wed, 28 Dec 2022 05:39:46 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id b3-20020ac25623000000b004b4bae1a05asm2625055lff.293.2022.12.28.05.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 05:39:45 -0800 (PST)
Message-ID: <aa0fba87-5ab6-4f0c-13a1-cf6d7b453758@linaro.org>
Date:   Wed, 28 Dec 2022 14:39:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 11/16] clk: qcom: gcc-sdx55: use ARRAY_SIZE instead of
 specifying num_parents
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
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
 <20221228133243.3052132-12-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221228133243.3052132-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28.12.2022 14:32, Dmitry Baryshkov wrote:
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data/names/hws easy and errorproof.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-sdx55.c | 52 ++++++++++++++++++------------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
> index 4fca19006a77..758b295e1bfa 100644
> --- a/drivers/clk/qcom/gcc-sdx55.c
> +++ b/drivers/clk/qcom/gcc-sdx55.c
> @@ -232,7 +232,7 @@ static struct clk_rcg2 gcc_blsp1_qup1_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_blsp1_qup1_i2c_apps_clk_src",
>  		.parent_data = gcc_parents_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -258,7 +258,7 @@ static struct clk_rcg2 gcc_blsp1_qup1_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_blsp1_qup1_spi_apps_clk_src",
>  		.parent_data = gcc_parents_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -272,7 +272,7 @@ static struct clk_rcg2 gcc_blsp1_qup2_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_blsp1_qup2_i2c_apps_clk_src",
>  		.parent_data = gcc_parents_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -286,7 +286,7 @@ static struct clk_rcg2 gcc_blsp1_qup2_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_blsp1_qup2_spi_apps_clk_src",
>  		.parent_data = gcc_parents_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -300,7 +300,7 @@ static struct clk_rcg2 gcc_blsp1_qup3_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_blsp1_qup3_i2c_apps_clk_src",
>  		.parent_data = gcc_parents_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -314,7 +314,7 @@ static struct clk_rcg2 gcc_blsp1_qup3_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_blsp1_qup3_spi_apps_clk_src",
>  		.parent_data = gcc_parents_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -328,7 +328,7 @@ static struct clk_rcg2 gcc_blsp1_qup4_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_blsp1_qup4_i2c_apps_clk_src",
>  		.parent_data = gcc_parents_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -342,7 +342,7 @@ static struct clk_rcg2 gcc_blsp1_qup4_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_blsp1_qup4_spi_apps_clk_src",
>  		.parent_data = gcc_parents_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -386,7 +386,7 @@ static struct clk_rcg2 gcc_blsp1_uart1_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_blsp1_uart1_apps_clk_src",
>  		.parent_data = gcc_parents_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -400,7 +400,7 @@ static struct clk_rcg2 gcc_blsp1_uart2_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_blsp1_uart2_apps_clk_src",
>  		.parent_data = gcc_parents_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -414,7 +414,7 @@ static struct clk_rcg2 gcc_blsp1_uart3_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_blsp1_uart3_apps_clk_src",
>  		.parent_data = gcc_parents_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -428,7 +428,7 @@ static struct clk_rcg2 gcc_blsp1_uart4_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_blsp1_uart4_apps_clk_src",
>  		.parent_data = gcc_parents_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -450,7 +450,7 @@ static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_cpuss_ahb_clk_src",
>  		.parent_data = gcc_parents_0_ao,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0_ao),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -469,7 +469,7 @@ static struct clk_rcg2 gcc_cpuss_rbcpr_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_cpuss_rbcpr_clk_src",
>  		.parent_data = gcc_parents_0_ao,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0_ao),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -493,7 +493,7 @@ static struct clk_rcg2 gcc_emac_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_emac_clk_src",
>  		.parent_data = gcc_parents_5,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(gcc_parents_5),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -514,7 +514,7 @@ static struct clk_rcg2 gcc_emac_ptp_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_emac_ptp_clk_src",
>  		.parent_data = gcc_parents_2,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(gcc_parents_2),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -537,7 +537,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_gp1_clk_src",
>  		.parent_data = gcc_parents_3,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(gcc_parents_3),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -551,7 +551,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_gp2_clk_src",
>  		.parent_data = gcc_parents_3,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(gcc_parents_3),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -565,7 +565,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_gp3_clk_src",
>  		.parent_data = gcc_parents_3,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(gcc_parents_3),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -579,7 +579,7 @@ static struct clk_rcg2 gcc_pcie_aux_phy_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_pcie_aux_phy_clk_src",
>  		.parent_data = gcc_parents_4,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parents_4),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -598,7 +598,7 @@ static struct clk_rcg2 gcc_pcie_rchng_phy_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_pcie_rchng_phy_clk_src",
>  		.parent_data = gcc_parents_3,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(gcc_parents_3),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -619,7 +619,7 @@ static struct clk_rcg2 gcc_pdm2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_pdm2_clk_src",
>  		.parent_data = gcc_parents_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -633,7 +633,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_sdcc1_apps_clk_src",
>  		.parent_data = gcc_parents_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -652,7 +652,7 @@ static struct clk_rcg2 gcc_usb30_master_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_usb30_master_clk_src",
>  		.parent_data = gcc_parents_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -671,7 +671,7 @@ static struct clk_rcg2 gcc_usb30_mock_utmi_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_usb30_mock_utmi_clk_src",
>  		.parent_data = gcc_parents_0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parents_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -691,7 +691,7 @@ static struct clk_rcg2 gcc_usb3_phy_aux_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_usb3_phy_aux_clk_src",
>  		.parent_data = gcc_parents_4,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parents_4),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
