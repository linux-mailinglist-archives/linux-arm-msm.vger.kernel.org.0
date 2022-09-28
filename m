Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39E845EE036
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 17:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234662AbiI1PYm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 11:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233418AbiI1PYN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 11:24:13 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0500E5C35D
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:23:17 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id v28so7510259wrd.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=yMFI2DIqX+4nkFEOr+Uc7dBOvVGwkSeXJhn6aLPaMtI=;
        b=fPgVaNKsACvHkcW/th82y0J3XJcdLGEfc6EzViZLmHrI4zTPGjGrFheUaB0GKIkjBT
         bqNqV9nZFe6gSdSXnMiIOqEstHXRGBL8V2SS3f2RrXaaJUDvUzbsqDaL+CR0SYJZShpy
         x8rnawesQSMMrj2VMc+D5rmVWTK3Eehs8nxlQ4AQnhAemA4jPJSG9qwbJL58MWEtcXYx
         8Hk6fvBGOn5H8/9Pm3HBIWlHbwdHeyzO5rpqyvRBT4mzLPzMMmhDrvwR5NfK06PPcqi5
         /RIjxhp4f0nG0+UUDdgy5KhRpgFNX7DNprzkMGkuYl0nazslFQktBCB9e/RmfNvqVzQa
         56Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=yMFI2DIqX+4nkFEOr+Uc7dBOvVGwkSeXJhn6aLPaMtI=;
        b=R6EqAhh8mCMf/uDmeZdHTj7G21CS7RzkL25BFxexiEb6dhXtUvWQLbPRfptZl8DOd8
         SeFT/RcfTNEIxZfBv6JK4hBvfd7XR9dgDmENGnzYlLWd0Yj7INZTK2PxCKdoacv3oaIL
         GQEnH3qNB+IPBosRxa/fCHnAseGDum2+dJskoagDJUSbVYz8/zi0zKJZsDhISJEDxJhS
         410QCxfNNagqXKSH52HIdx28e+ijFD+B2IlkGH9UKDaB/hHjqYUsFQVmq5QZ2bgjqDgu
         CXPGrDwj5wn8ftsAdXZXbtj1plw3lx9JvV5004GhutbddNJiGs5I+F9G3f+bqfX9pguW
         FWRw==
X-Gm-Message-State: ACrzQf2CBqGx2W9Hd0Iyr9iBYIxiaeIV81eIQhrc1wOci1A8SIaCzG4p
        qdViGFesVRdJamHaZ9Dg+Walwg==
X-Google-Smtp-Source: AMsMyM4K1udAUVR/7X1AHL/bTtjWd1G1MoTKL/2vw4TrdV/Lp7QtZVVh0DRLXwA/3CHn0jaDXVL8bQ==
X-Received: by 2002:adf:d1e1:0:b0:22a:cd3e:e98b with SMTP id g1-20020adfd1e1000000b0022acd3ee98bmr21868916wrd.510.1664378595562;
        Wed, 28 Sep 2022 08:23:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:11d4:7c71:accf:6521? ([2a01:e0a:982:cbb0:11d4:7c71:accf:6521])
        by smtp.gmail.com with ESMTPSA id t20-20020a05600c199400b003b4fe03c881sm2021991wmq.48.2022.09.28.08.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 08:23:15 -0700 (PDT)
Message-ID: <50374fb8-563f-6433-12c9-8ff77fa38e83@linaro.org>
Date:   Wed, 28 Sep 2022 17:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/11] clk: qcom: gcc-msm8974: use ARRAY_SIZE instead of
 specifying num_parents
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
 <20220928145958.376288-4-dmitry.baryshkov@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220928145958.376288-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 16:59, Dmitry Baryshkov wrote:
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/gcc-msm8974.c | 110 ++++++++++++++++-----------------
>   1 file changed, 55 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
> index bf305fa9e522..b847ce852ef8 100644
> --- a/drivers/clk/qcom/gcc-msm8974.c
> +++ b/drivers/clk/qcom/gcc-msm8974.c
> @@ -88,7 +88,7 @@ static struct clk_rcg2 config_noc_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "config_noc_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -100,7 +100,7 @@ static struct clk_rcg2 periph_noc_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "periph_noc_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -112,7 +112,7 @@ static struct clk_rcg2 system_noc_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "system_noc_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -185,7 +185,7 @@ static struct clk_rcg2 usb30_master_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "usb30_master_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -205,7 +205,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_qup1_i2c_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -230,7 +230,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_qup1_spi_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -243,7 +243,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_qup2_i2c_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -257,7 +257,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_qup2_spi_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -270,7 +270,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_qup3_i2c_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -284,7 +284,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_qup3_spi_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -297,7 +297,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_qup4_i2c_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -311,7 +311,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_qup4_spi_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -324,7 +324,7 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_qup5_i2c_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -338,7 +338,7 @@ static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_qup5_spi_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -351,7 +351,7 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_qup6_i2c_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -365,7 +365,7 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_qup6_spi_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -398,7 +398,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_uart1_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -412,7 +412,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_uart2_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -426,7 +426,7 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_uart3_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -440,7 +440,7 @@ static struct clk_rcg2 blsp1_uart4_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_uart4_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -454,7 +454,7 @@ static struct clk_rcg2 blsp1_uart5_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_uart5_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -468,7 +468,7 @@ static struct clk_rcg2 blsp1_uart6_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_uart6_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -481,7 +481,7 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_qup1_i2c_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -495,7 +495,7 @@ static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_qup1_spi_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -508,7 +508,7 @@ static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_qup2_i2c_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -522,7 +522,7 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_qup2_spi_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -535,7 +535,7 @@ static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_qup3_i2c_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -549,7 +549,7 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_qup3_spi_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -562,7 +562,7 @@ static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_qup4_i2c_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -576,7 +576,7 @@ static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_qup4_spi_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -589,7 +589,7 @@ static struct clk_rcg2 blsp2_qup5_i2c_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_qup5_i2c_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -603,7 +603,7 @@ static struct clk_rcg2 blsp2_qup5_spi_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_qup5_spi_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -616,7 +616,7 @@ static struct clk_rcg2 blsp2_qup6_i2c_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_qup6_i2c_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -630,7 +630,7 @@ static struct clk_rcg2 blsp2_qup6_spi_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_qup6_spi_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -644,7 +644,7 @@ static struct clk_rcg2 blsp2_uart1_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_uart1_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -658,7 +658,7 @@ static struct clk_rcg2 blsp2_uart2_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_uart2_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -672,7 +672,7 @@ static struct clk_rcg2 blsp2_uart3_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_uart3_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -686,7 +686,7 @@ static struct clk_rcg2 blsp2_uart4_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_uart4_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -700,7 +700,7 @@ static struct clk_rcg2 blsp2_uart5_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_uart5_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -714,7 +714,7 @@ static struct clk_rcg2 blsp2_uart6_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp2_uart6_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -741,7 +741,7 @@ static struct clk_rcg2 ce1_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "ce1_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -762,7 +762,7 @@ static struct clk_rcg2 ce2_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "ce2_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -794,7 +794,7 @@ static struct clk_rcg2 gp1_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "gp1_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -808,7 +808,7 @@ static struct clk_rcg2 gp2_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "gp2_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -822,7 +822,7 @@ static struct clk_rcg2 gp3_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "gp3_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -840,7 +840,7 @@ static struct clk_rcg2 pdm2_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "pdm2_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -872,7 +872,7 @@ static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk_pro[] = {
>   static struct clk_init_data sdcc1_apps_clk_src_init = {
>   	.name = "sdcc1_apps_clk_src",
>   	.parent_names = gcc_xo_gpll0,
> -	.num_parents = 2,
> +	.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   	.ops = &clk_rcg2_floor_ops,
>   };
>   
> @@ -894,7 +894,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "sdcc2_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_floor_ops,
>   	},
>   };
> @@ -908,7 +908,7 @@ static struct clk_rcg2 sdcc3_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "sdcc3_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_floor_ops,
>   	},
>   };
> @@ -922,7 +922,7 @@ static struct clk_rcg2 sdcc4_apps_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "sdcc4_apps_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_floor_ops,
>   	},
>   };
> @@ -941,7 +941,7 @@ static struct clk_rcg2 tsif_ref_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "tsif_ref_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -959,7 +959,7 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "usb30_mock_utmi_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -978,7 +978,7 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "usb_hs_system_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -1022,7 +1022,7 @@ static struct clk_rcg2 usb_hsic_io_cal_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "usb_hsic_io_cal_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 1,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };
> @@ -1041,7 +1041,7 @@ static struct clk_rcg2 usb_hsic_system_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "usb_hsic_system_clk_src",
>   		.parent_names = gcc_xo_gpll0,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
