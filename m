Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0209C649067
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 20:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiLJTc3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 14:32:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbiLJTc3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 14:32:29 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39BD167D3
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:32:26 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id q6so2107288lfm.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=16s8WVRIRUcU9STTje3K9QUJXsGuOzGkI6Loj0x1KSY=;
        b=JTEaaxqsrqaW4yDE2gAYTGV26M4P5xqBeuYKiX2lgQRKMF3o3PH93Y/t180oTHA+L1
         2a+yZB4feTeGM2d1BVHXXSAuF4O9bBV3AqzILA5w201wx+VWtDNrWkILh0j6ZdymFzn6
         Ud2XLgciewz/jaZ+VASQ8e+iTclJUgUGtLT9UhTKG/6Xgh6Cf5Mux/92nMFlX9AS+sXw
         M5OOspNM639b1IwCR1xGPfD8JTxsvlO04XKNdM71TWBRoq+hnzY811TdDQRw7h1m9Srp
         +yadMrPggYIR1nUcNrNr1IUjdyBVP0dyHQJmzbCIqhRCu9M0qWP/C0ikOm9TCuApXimx
         6h9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=16s8WVRIRUcU9STTje3K9QUJXsGuOzGkI6Loj0x1KSY=;
        b=gBreiKPiT5PibXaO6CRr3PR/4il4BZMpUmdmBTixG4GtKtlmyWo6xt1t4qw1c8lmzZ
         kfzLeOY8dbO5TpJ2bmqe0epvbeZdTjzg2BdRQaVUkgQ3N1xiY8UfJJu+pMXsCqfQxJlm
         NVRgtEjPRo9jW2VyyyGZHhznW8gk5ZVP2dySEjtLdZtlxAy235IcwAFEUT4XEDPFSuv8
         lP7yD9aruEcInDOYm8Go7KXZzWmOyBymlkBD/ILei9g09qYDJSRXGIH3a0H/qxqejf8H
         iu801sgTkpmI3hZWdLHOk/R4GQlkPBRy8kDBVsLwQWWXPn27bxMLjxv7T8/YPqXR9vI8
         xauA==
X-Gm-Message-State: ANoB5pm3HfNYcOc+7IZvScsS0du2i2HuSeLx+GktmJ9vJ5xrZD1SVlKA
        BSggc/o6dm5wc5a32ZEvXAAy7Q==
X-Google-Smtp-Source: AA0mqf4Rh8b87pf6YMNAZ/mkTOze2ZcBF3ByhIeHqYVdXR94160nLe/boR2LlDQCr8v7YoV8rdSPpA==
X-Received: by 2002:ac2:5310:0:b0:4b5:b46d:e52 with SMTP id c16-20020ac25310000000b004b5b46d0e52mr1559343lfh.50.1670700744965;
        Sat, 10 Dec 2022 11:32:24 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id m20-20020a05651202f400b004994117b0fdsm828149lfq.281.2022.12.10.11.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Dec 2022 11:32:24 -0800 (PST)
Message-ID: <f56b7014-de3c-f042-9d6a-17bc9d3ce499@linaro.org>
Date:   Sat, 10 Dec 2022 20:32:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 3/3] clk: qcom: gcc-sm6375: use parent_hws where
 possible
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221210190712.451247-1-dmitry.baryshkov@linaro.org>
 <20221210190712.451247-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221210190712.451247-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10.12.2022 20:07, Dmitry Baryshkov wrote:
> Change several parent_data entries with only .hw entries to parent_hws
> instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-sm6375.c | 252 +++++++++++++++++-----------------
>  1 file changed, 126 insertions(+), 126 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
> index 6d75f735a7a6..ad3c4833990d 100644
> --- a/drivers/clk/qcom/gcc-sm6375.c
> +++ b/drivers/clk/qcom/gcc-sm6375.c
> @@ -1766,8 +1766,8 @@ static struct clk_branch gcc_camss_axi_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_axi_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_axi_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_axi_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1784,8 +1784,8 @@ static struct clk_branch gcc_camss_cci_0_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_cci_0_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_cci_0_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_cci_0_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1802,8 +1802,8 @@ static struct clk_branch gcc_camss_cci_1_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_cci_1_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_cci_1_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_cci_1_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1820,8 +1820,8 @@ static struct clk_branch gcc_camss_cphy_0_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_cphy_0_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1838,8 +1838,8 @@ static struct clk_branch gcc_camss_cphy_1_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_cphy_1_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1856,8 +1856,8 @@ static struct clk_branch gcc_camss_cphy_2_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_cphy_2_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1874,8 +1874,8 @@ static struct clk_branch gcc_camss_cphy_3_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_cphy_3_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1892,8 +1892,8 @@ static struct clk_branch gcc_camss_csi0phytimer_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_csi0phytimer_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_csi0phytimer_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_csi0phytimer_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1910,8 +1910,8 @@ static struct clk_branch gcc_camss_csi1phytimer_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_csi1phytimer_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_csi1phytimer_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_csi1phytimer_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1928,8 +1928,8 @@ static struct clk_branch gcc_camss_csi2phytimer_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_csi2phytimer_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_csi2phytimer_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_csi2phytimer_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1946,8 +1946,8 @@ static struct clk_branch gcc_camss_csi3phytimer_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_csi3phytimer_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_csi3phytimer_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_csi3phytimer_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1964,8 +1964,8 @@ static struct clk_branch gcc_camss_mclk0_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_mclk0_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_mclk0_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_mclk0_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1982,8 +1982,8 @@ static struct clk_branch gcc_camss_mclk1_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_mclk1_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_mclk1_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_mclk1_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2000,8 +2000,8 @@ static struct clk_branch gcc_camss_mclk2_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_mclk2_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_mclk2_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_mclk2_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2018,8 +2018,8 @@ static struct clk_branch gcc_camss_mclk3_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_mclk3_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_mclk3_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_mclk3_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2036,8 +2036,8 @@ static struct clk_branch gcc_camss_mclk4_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_mclk4_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_mclk4_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_mclk4_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2067,8 +2067,8 @@ static struct clk_branch gcc_camss_ope_ahb_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_ope_ahb_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_ope_ahb_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_ope_ahb_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2085,8 +2085,8 @@ static struct clk_branch gcc_camss_ope_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_ope_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_ope_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_ope_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2116,8 +2116,8 @@ static struct clk_branch gcc_camss_tfe_0_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_tfe_0_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_tfe_0_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_tfe_0_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2134,8 +2134,8 @@ static struct clk_branch gcc_camss_tfe_0_cphy_rx_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_tfe_0_cphy_rx_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2152,8 +2152,8 @@ static struct clk_branch gcc_camss_tfe_0_csid_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_tfe_0_csid_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_tfe_0_csid_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_tfe_0_csid_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2170,8 +2170,8 @@ static struct clk_branch gcc_camss_tfe_1_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_tfe_1_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_tfe_1_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_tfe_1_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2188,8 +2188,8 @@ static struct clk_branch gcc_camss_tfe_1_cphy_rx_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_tfe_1_cphy_rx_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2206,8 +2206,8 @@ static struct clk_branch gcc_camss_tfe_1_csid_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_tfe_1_csid_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_tfe_1_csid_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_tfe_1_csid_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2224,8 +2224,8 @@ static struct clk_branch gcc_camss_tfe_2_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_tfe_2_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_tfe_2_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_tfe_2_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2242,8 +2242,8 @@ static struct clk_branch gcc_camss_tfe_2_cphy_rx_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_tfe_2_cphy_rx_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2260,8 +2260,8 @@ static struct clk_branch gcc_camss_tfe_2_csid_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_tfe_2_csid_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_tfe_2_csid_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_tfe_2_csid_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2278,8 +2278,8 @@ static struct clk_branch gcc_camss_top_ahb_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_camss_top_ahb_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_camss_top_ahb_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_camss_top_ahb_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2298,8 +2298,8 @@ static struct clk_branch gcc_cfg_noc_usb3_prim_axi_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_cfg_noc_usb3_prim_axi_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_usb30_prim_master_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2345,8 +2345,8 @@ static struct clk_branch gcc_disp_gpll0_div_clk_src = {
>  		.enable_mask = BIT(20),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_disp_gpll0_div_clk_src",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_disp_gpll0_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_disp_gpll0_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2408,8 +2408,8 @@ static struct clk_branch gcc_gp1_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_gp1_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_gp1_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_gp1_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2426,8 +2426,8 @@ static struct clk_branch gcc_gp2_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_gp2_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_gp2_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_gp2_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2444,8 +2444,8 @@ static struct clk_branch gcc_gp3_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_gp3_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_gp3_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_gp3_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2477,8 +2477,8 @@ static struct clk_branch gcc_gpu_gpll0_clk_src = {
>  		.enable_mask = BIT(15),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_gpu_gpll0_clk_src",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gpll0.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gpll0.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2494,8 +2494,8 @@ static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
>  		.enable_mask = BIT(16),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_gpu_gpll0_div_clk_src",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gpll0_out_even.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gpll0_out_even.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2555,8 +2555,8 @@ static struct clk_branch gcc_pdm2_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_pdm2_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_pdm2_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_pdm2_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2717,8 +2717,8 @@ static struct clk_branch gcc_qupv3_wrap0_s0_clk = {
>  		.enable_mask = BIT(10),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap0_s0_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_qupv3_wrap0_s0_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_qupv3_wrap0_s0_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2735,8 +2735,8 @@ static struct clk_branch gcc_qupv3_wrap0_s1_clk = {
>  		.enable_mask = BIT(11),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap0_s1_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_qupv3_wrap0_s1_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_qupv3_wrap0_s1_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2753,8 +2753,8 @@ static struct clk_branch gcc_qupv3_wrap0_s2_clk = {
>  		.enable_mask = BIT(12),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap0_s2_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_qupv3_wrap0_s2_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_qupv3_wrap0_s2_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2771,8 +2771,8 @@ static struct clk_branch gcc_qupv3_wrap0_s3_clk = {
>  		.enable_mask = BIT(13),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap0_s3_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_qupv3_wrap0_s3_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_qupv3_wrap0_s3_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2789,8 +2789,8 @@ static struct clk_branch gcc_qupv3_wrap0_s4_clk = {
>  		.enable_mask = BIT(14),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap0_s4_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_qupv3_wrap0_s4_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_qupv3_wrap0_s4_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2807,8 +2807,8 @@ static struct clk_branch gcc_qupv3_wrap0_s5_clk = {
>  		.enable_mask = BIT(15),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap0_s5_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_qupv3_wrap0_s5_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_qupv3_wrap0_s5_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2851,8 +2851,8 @@ static struct clk_branch gcc_qupv3_wrap1_s0_clk = {
>  		.enable_mask = BIT(21),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap1_s0_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_qupv3_wrap1_s0_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_qupv3_wrap1_s0_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2869,8 +2869,8 @@ static struct clk_branch gcc_qupv3_wrap1_s1_clk = {
>  		.enable_mask = BIT(22),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap1_s1_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_qupv3_wrap1_s1_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_qupv3_wrap1_s1_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2887,8 +2887,8 @@ static struct clk_branch gcc_qupv3_wrap1_s2_clk = {
>  		.enable_mask = BIT(23),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap1_s2_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_qupv3_wrap1_s2_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_qupv3_wrap1_s2_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2905,8 +2905,8 @@ static struct clk_branch gcc_qupv3_wrap1_s3_clk = {
>  		.enable_mask = BIT(24),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap1_s3_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_qupv3_wrap1_s3_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_qupv3_wrap1_s3_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2923,8 +2923,8 @@ static struct clk_branch gcc_qupv3_wrap1_s4_clk = {
>  		.enable_mask = BIT(25),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap1_s4_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_qupv3_wrap1_s4_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_qupv3_wrap1_s4_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2941,8 +2941,8 @@ static struct clk_branch gcc_qupv3_wrap1_s5_clk = {
>  		.enable_mask = BIT(26),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_qupv3_wrap1_s5_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3032,8 +3032,8 @@ static struct clk_branch gcc_sdcc1_apps_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_sdcc1_apps_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_sdcc1_apps_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_sdcc1_apps_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3052,8 +3052,8 @@ static struct clk_branch gcc_sdcc1_ice_core_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_sdcc1_ice_core_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_sdcc1_ice_core_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_sdcc1_ice_core_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3083,8 +3083,8 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_sdcc2_apps_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_sdcc2_apps_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_sdcc2_apps_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3103,8 +3103,8 @@ static struct clk_branch gcc_sys_noc_cpuss_ahb_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_sys_noc_cpuss_ahb_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_cpuss_ahb_postdiv_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_cpuss_ahb_postdiv_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
> @@ -3121,8 +3121,8 @@ static struct clk_branch gcc_sys_noc_ufs_phy_axi_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_sys_noc_ufs_phy_axi_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_ufs_phy_axi_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_ufs_phy_axi_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3141,8 +3141,8 @@ static struct clk_branch gcc_sys_noc_usb3_prim_axi_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_sys_noc_usb3_prim_axi_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_usb30_prim_master_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3176,8 +3176,8 @@ static struct clk_branch gcc_ufs_phy_axi_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_ufs_phy_axi_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_ufs_phy_axi_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_ufs_phy_axi_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3196,8 +3196,8 @@ static struct clk_branch gcc_ufs_phy_ice_core_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_ufs_phy_ice_core_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_ufs_phy_ice_core_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_ufs_phy_ice_core_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3216,8 +3216,8 @@ static struct clk_branch gcc_ufs_phy_phy_aux_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_ufs_phy_phy_aux_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_ufs_phy_phy_aux_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_ufs_phy_phy_aux_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3262,8 +3262,8 @@ static struct clk_branch gcc_ufs_phy_unipro_core_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_ufs_phy_unipro_core_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_ufs_phy_unipro_core_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_ufs_phy_unipro_core_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3280,8 +3280,8 @@ static struct clk_branch gcc_usb30_prim_master_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_usb30_prim_master_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_usb30_prim_master_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3298,8 +3298,8 @@ static struct clk_branch gcc_usb30_prim_mock_utmi_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_usb30_prim_mock_utmi_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_usb30_prim_mock_utmi_postdiv_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_usb30_prim_mock_utmi_postdiv_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3368,8 +3368,8 @@ static struct clk_branch gcc_usb3_prim_phy_com_aux_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_usb3_prim_phy_com_aux_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3488,8 +3488,8 @@ static struct clk_branch gcc_video_vcodec0_sys_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_video_vcodec0_sys_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_video_venus_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_video_venus_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -3506,8 +3506,8 @@ static struct clk_branch gcc_video_venus_ctl_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gcc_video_venus_ctl_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &gcc_video_venus_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&gcc_video_venus_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
