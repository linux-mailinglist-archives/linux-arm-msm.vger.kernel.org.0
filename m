Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCB0164F9A4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 16:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbiLQPIa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Dec 2022 10:08:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiLQPI3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Dec 2022 10:08:29 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D5FE1408E
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:08:27 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id p36so7679339lfa.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZFlgm8dLAZr4zybqwhTCtV9PL8PVKFLtxoAOe0zu1/Y=;
        b=XLuJRNfQD/lpYxbxTNYK17IB9jB83z1dSErj0SRYCMuLVix7nRvvYJAxfUVDDgl2dV
         ytjgj4sRcefoQcrofn58LiY8/DiOwf4aQS96u0i3m3rzhOm1uoYTSJqCi4/bOakrFoTd
         G48whgmLn2W54tC9hvk8Uy2SMcESDkKF7QZ21+JKP/6c+fpslqcZ0NaWrosLF/u1Dtb8
         xR2J3Luo7apZol10nJvV8HnSjEiUgYJCXaaj8B00T9r0uOKe/tMzGsoVvesECuVFCH28
         OLZGuWFv7GpVZrk25NnuDMnxfl0KqK4beDwYpjHwtp4Lb8i+myinu1g53kwfTzjfxh7c
         5FGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFlgm8dLAZr4zybqwhTCtV9PL8PVKFLtxoAOe0zu1/Y=;
        b=chvwak5v4Sc2y2cdmQlf1O5p5bbOuzhhhnv3cJQa12uRponHk08mMC1L+Ip346C9fj
         F/UTqV0+GJqEuA//g/4hi4Uv8MjyH7AiXfOB/VBJlirP+6fZeJpq1f3O2KPYl+ntOHnh
         vkFMDDsWy7W+Zuk783LciTSFTC8giO3vaRKwHrdateuvSfkSdh8nKqXJAFt48rr5E+fX
         g1v2HE+hk/yNhjxr9pkKqXnoZ5JtnoVLwhMvUAvivCqtUr98hzrSYnb2j1+d0nzlOkaq
         O3ihc5nWCGX0U6nNHdZILnR8sWYP0PYdMyYMU0lWRr3zjNGyg1iIMERGk/jr1fWeVakg
         yjug==
X-Gm-Message-State: ANoB5pnrQoLIZlDXfPeVLjBIG1ms03rXXQBDUxSVq/o6t3v8w0WL2T7w
        90kt+CvpbdTGNuWaudDANSV4Mw==
X-Google-Smtp-Source: AA0mqf4qCEag+4aoBR0AU/MENAHAvHPv1oNUVhiN4TNBaMq0QabRPcZaOSa/CNen0CL1ozK7GlUgkQ==
X-Received: by 2002:ac2:4c51:0:b0:4a4:8a04:4b37 with SMTP id o17-20020ac24c51000000b004a48a044b37mr13790055lfk.32.1671289705910;
        Sat, 17 Dec 2022 07:08:25 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id z14-20020a056512370e00b004a0589786ddsm534448lfr.69.2022.12.17.07.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:08:25 -0800 (PST)
Message-ID: <744cdde3-f43f-6545-fb83-a4474a84b84c@linaro.org>
Date:   Sat, 17 Dec 2022 16:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 05/15] clk: qcom: gcc-qcs404: disable gpll[04]_out_aux
 parents
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
 <20221217001730.540502-6-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217001730.540502-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.12.2022 01:17, Dmitry Baryshkov wrote:
> On the QCS404 platform the driver for the Global Clock Controller
> doens't define gpll0_out_aux and gpll4_out_aux clocks, so it's not
> possible to use them as parents. Comment out entries for these clocks.
> 
> Note: backporting this patch to earlier kernels would also require a
> previous patch which switches the gcc driver to use ARRAY_SIZE for
> parent data arrays.
> 
> Fixes: 652f1813c113 ("clk: qcom: gcc: Add global clock controller driver for QCS404")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Perhaps one could just remove them then?

Konrad
>  drivers/clk/qcom/gcc-qcs404.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index f60a0ab42da1..c48326da1bb3 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -25,11 +25,11 @@ enum {
>  	P_CORE_BI_PLL_TEST_SE,
>  	P_DSI0_PHY_PLL_OUT_BYTECLK,
>  	P_DSI0_PHY_PLL_OUT_DSICLK,
> -	P_GPLL0_OUT_AUX,
> +	/* P_GPLL0_OUT_AUX, */
>  	P_GPLL0_OUT_MAIN,
>  	P_GPLL1_OUT_MAIN,
>  	P_GPLL3_OUT_MAIN,
> -	P_GPLL4_OUT_AUX,
> +	/* P_GPLL4_OUT_AUX, */
>  	P_GPLL4_OUT_MAIN,
>  	P_GPLL6_OUT_AUX,
>  	P_HDMI_PHY_PLL_CLK,
> @@ -109,28 +109,28 @@ static const char * const gcc_parent_names_4[] = {
>  static const struct parent_map gcc_parent_map_5[] = {
>  	{ P_XO, 0 },
>  	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
> -	{ P_GPLL0_OUT_AUX, 2 },
> +	/* { P_GPLL0_OUT_AUX, 2 }, */
>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_5[] = {
>  	"cxo",
>  	"dsi0pll_byteclk_src",
> -	"gpll0_out_aux",
> +	/* "gpll0_out_aux", */
>  	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_6[] = {
>  	{ P_XO, 0 },
>  	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
> -	{ P_GPLL0_OUT_AUX, 3 },
> +	/* { P_GPLL0_OUT_AUX, 3 }, */
>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_6[] = {
>  	"cxo",
>  	"dsi0_phy_pll_out_byteclk",
> -	"gpll0_out_aux",
> +	/* "gpll0_out_aux", */
>  	"core_bi_pll_test_se",
>  };
>  
> @@ -139,7 +139,7 @@ static const struct parent_map gcc_parent_map_7[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_GPLL3_OUT_MAIN, 2 },
>  	{ P_GPLL6_OUT_AUX, 3 },
> -	{ P_GPLL4_OUT_AUX, 4 },
> +	/* { P_GPLL4_OUT_AUX, 4 }, */
>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
> @@ -148,7 +148,7 @@ static const char * const gcc_parent_names_7[] = {
>  	"gpll0_out_main",
>  	"gpll3_out_main",
>  	"gpll6_out_aux",
> -	"gpll4_out_aux",
> +	/* "gpll4_out_aux", */
>  	"core_bi_pll_test_se",
>  };
>  
> @@ -207,14 +207,14 @@ static const char * const gcc_parent_names_11[] = {
>  static const struct parent_map gcc_parent_map_12[] = {
>  	{ P_XO, 0 },
>  	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
> -	{ P_GPLL0_OUT_AUX, 2 },
> +	/* { P_GPLL0_OUT_AUX, 2 }, */
>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_12[] = {
>  	"cxo",
>  	"dsi0pll_pclk_src",
> -	"gpll0_out_aux",
> +	/* "gpll0_out_aux", */
>  	"core_bi_pll_test_se",
>  };
>  
> @@ -237,40 +237,40 @@ static const char * const gcc_parent_names_13[] = {
>  static const struct parent_map gcc_parent_map_14[] = {
>  	{ P_XO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
> -	{ P_GPLL4_OUT_AUX, 2 },
> +	/* { P_GPLL4_OUT_AUX, 2 }, */
>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_14[] = {
>  	"cxo",
>  	"gpll0_out_main",
> -	"gpll4_out_aux",
> +	/* "gpll4_out_aux", */
>  	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_15[] = {
>  	{ P_XO, 0 },
> -	{ P_GPLL0_OUT_AUX, 2 },
> +	/* { P_GPLL0_OUT_AUX, 2 }, */
>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_15[] = {
>  	"cxo",
> -	"gpll0_out_aux",
> +	/* "gpll0_out_aux", */
>  	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_16[] = {
>  	{ P_XO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
> -	{ P_GPLL0_OUT_AUX, 2 },
> +	/* { P_GPLL0_OUT_AUX, 2 }, */
>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_16[] = {
>  	"cxo",
>  	"gpll0_out_main",
> -	"gpll0_out_aux",
> +	/* "gpll0_out_aux", */
>  	"core_bi_pll_test_se",
>  };
>  
