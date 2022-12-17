Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8356464F9AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 16:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbiLQPJl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Dec 2022 10:09:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiLQPJj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Dec 2022 10:09:39 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBEB011810
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:09:37 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id c1so7718785lfi.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dntwg6Jdp/0KhZ+iETUx+XKRTCS0+OPOoS0hSeztemI=;
        b=iF98Hbx8P5ErTEtN/R86qZQb20SN4SalkVil9O1Lt0KrFtCyUG9uoQ41zXCof6nc8/
         z3YT9zb6zV11z8/TeyhLTBLKTRcfoyjkSiCDPpupuAyOV7tORSqcPkEO6vn3nZhCeOnG
         0kLJLRPXkE1MPWdd0Qx8VoZLvEqXAoCqZFC8IVg4vJYo3Prk9I1BRyEGNAuJm6NxVtGL
         rctYDlxjHOLrfMwnl60n3uSf2rCb9/Yn5xbACcwFAt4m2NNxNnMbqr9ifxvUKJA2PCU+
         NpxORFrK0B6VEN3CedHK9wizKADdyOJZjL24iZSZlpU8czUIFpr4rSipRgpVuv3rCg/t
         W9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dntwg6Jdp/0KhZ+iETUx+XKRTCS0+OPOoS0hSeztemI=;
        b=X0agtkB3dJtcZ+LoInRRiRGbT82Yq6hz42+UcEb4WMBDZvkJUKJK0NnLEkWSGpLHNB
         rlfMZELXVvXOD/WcvkmDisXaKZcc64n6eNHdov5YrbvpDq1o5KZxysQ9sEYoD5KoHgPQ
         xfOXEG8PoeFVRGYBqRSwOdWgSCrS7mA2uuaq10AaWvMvYCZAB+k3POwE5AjEMzjUPlUo
         LL4gTltJdxHgEu4bVT2SLN3vo3VxbP6D3XFB1A0VshbTcYFWIqYWMU+gv3gwbfRKBRLp
         roGsUzlwGC8fhEESquhRs/kN+O6FuhJ/43idyC4t2ywedjSUvZny4wsA46ZQDWe9xtLe
         2EMw==
X-Gm-Message-State: ANoB5pmJjiHKlI6t9/WzVk2Nw5PJWmHHmKvj6adbZEjj8aM4t8o+7Pud
        Xo++SPru9d4H4wHse4n9xQD9Gw==
X-Google-Smtp-Source: AA0mqf4asjeO+5XBVvnnBvBPHfHQlST20j7cMVLIp6Gz6TJQO2pFKFwhUqyUmsHIl8DpxDI59QMviQ==
X-Received: by 2002:a05:6512:3b0c:b0:4b5:7aad:2690 with SMTP id f12-20020a0565123b0c00b004b57aad2690mr13230977lfv.12.1671289776981;
        Sat, 17 Dec 2022 07:09:36 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id z14-20020a2eb52e000000b0026dcb07122csm371477ljm.117.2022.12.17.07.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:09:36 -0800 (PST)
Message-ID: <8ffa5929-e48e-a7ff-bdf6-71d4fa699fd7@linaro.org>
Date:   Sat, 17 Dec 2022 16:09:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 08/15] clk: qcom: gcc-qcs404: get rid of the test clock
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
        devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
 <20221217001730.540502-9-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217001730.540502-9-dmitry.baryshkov@linaro.org>
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
> The test clock isn't in the bindings and apparently it's not used by
> anyone upstream.  Remove it.
> 
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-qcs404.c | 34 ----------------------------------
>  1 file changed, 34 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index 5636c6524d0f..fb94c57a00af 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -22,7 +22,6 @@
>  #include "reset.h"
>  
>  enum {
> -	P_CORE_BI_PLL_TEST_SE,
>  	P_DSI0_PHY_PLL_OUT_BYTECLK,
>  	P_DSI0_PHY_PLL_OUT_DSICLK,
>  	/* P_GPLL0_OUT_AUX, */
> @@ -41,29 +40,24 @@ enum {
>  static const struct parent_map gcc_parent_map_0[] = {
>  	{ P_XO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_0[] = {
>  	"cxo",
>  	"gpll0_out_main",
> -	"core_bi_pll_test_se",
>  };
>  
>  static const char * const gcc_parent_names_ao_0[] = {
>  	"cxo",
>  	"gpll0_ao_out_main",
> -	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_1[] = {
>  	{ P_XO, 0 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_1[] = {
>  	"cxo",
> -	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_2[] = {
> @@ -84,54 +78,46 @@ static const struct parent_map gcc_parent_map_3[] = {
>  	{ P_XO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_GPLL6_OUT_AUX, 2 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_3[] = {
>  	"cxo",
>  	"gpll0_out_main",
>  	"gpll6_out_aux",
> -	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_4[] = {
>  	{ P_XO, 0 },
>  	{ P_GPLL1_OUT_MAIN, 1 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_4[] = {
>  	"cxo",
>  	"gpll1_out_main",
> -	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_5[] = {
>  	{ P_XO, 0 },
>  	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
>  	/* { P_GPLL0_OUT_AUX, 2 }, */
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_5[] = {
>  	"cxo",
>  	"dsi0pllbyte",
>  	/* "gpll0_out_aux", */
> -	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_6[] = {
>  	{ P_XO, 0 },
>  	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
>  	/* { P_GPLL0_OUT_AUX, 3 }, */
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_6[] = {
>  	"cxo",
>  	"dsi0pllbyte",
>  	/* "gpll0_out_aux", */
> -	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_7[] = {
> @@ -140,7 +126,6 @@ static const struct parent_map gcc_parent_map_7[] = {
>  	{ P_GPLL3_OUT_MAIN, 2 },
>  	{ P_GPLL6_OUT_AUX, 3 },
>  	/* { P_GPLL4_OUT_AUX, 4 }, */
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_7[] = {
> @@ -149,19 +134,16 @@ static const char * const gcc_parent_names_7[] = {
>  	"gpll3_out_main",
>  	"gpll6_out_aux",
>  	/* "gpll4_out_aux", */
> -	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_8[] = {
>  	{ P_XO, 0 },
>  	{ P_HDMI_PHY_PLL_CLK, 1 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_8[] = {
>  	"cxo",
>  	"hdmi_pll",
> -	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_9[] = {
> @@ -169,7 +151,6 @@ static const struct parent_map gcc_parent_map_9[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_DSI0_PHY_PLL_OUT_DSICLK, 2 },
>  	{ P_GPLL6_OUT_AUX, 3 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_9[] = {
> @@ -177,45 +158,38 @@ static const char * const gcc_parent_names_9[] = {
>  	"gpll0_out_main",
>  	"dsi0pll",
>  	"gpll6_out_aux",
> -	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_10[] = {
>  	{ P_XO, 0 },
>  	{ P_SLEEP_CLK, 1 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_10[] = {
>  	"cxo",
>  	"sleep_clk",
> -	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_11[] = {
>  	{ P_XO, 0 },
>  	{ P_PCIE_0_PIPE_CLK, 1 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_11[] = {
>  	"cxo",
>  	"pcie_0_pipe_clk",
> -	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_12[] = {
>  	{ P_XO, 0 },
>  	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
>  	/* { P_GPLL0_OUT_AUX, 2 }, */
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_12[] = {
>  	"cxo",
>  	"dsi0pll",
>  	/* "gpll0_out_aux", */
> -	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_13[] = {
> @@ -223,7 +197,6 @@ static const struct parent_map gcc_parent_map_13[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_GPLL4_OUT_MAIN, 2 },
>  	{ P_GPLL6_OUT_AUX, 3 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_13[] = {
> @@ -231,47 +204,40 @@ static const char * const gcc_parent_names_13[] = {
>  	"gpll0_out_main",
>  	"gpll4_out_main",
>  	"gpll6_out_aux",
> -	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_14[] = {
>  	{ P_XO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	/* { P_GPLL4_OUT_AUX, 2 }, */
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_14[] = {
>  	"cxo",
>  	"gpll0_out_main",
>  	/* "gpll4_out_aux", */
> -	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_15[] = {
>  	{ P_XO, 0 },
>  	/* { P_GPLL0_OUT_AUX, 2 }, */
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_15[] = {
>  	"cxo",
>  	/* "gpll0_out_aux", */
> -	"core_bi_pll_test_se",
>  };
>  
>  static const struct parent_map gcc_parent_map_16[] = {
>  	{ P_XO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	/* { P_GPLL0_OUT_AUX, 2 }, */
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const gcc_parent_names_16[] = {
>  	"cxo",
>  	"gpll0_out_main",
>  	/* "gpll0_out_aux", */
> -	"core_bi_pll_test_se",
>  };
>  
>  static struct clk_fixed_factor cxo = {
