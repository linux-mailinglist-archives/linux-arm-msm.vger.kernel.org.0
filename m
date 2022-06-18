Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6CAF550792
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jun 2022 01:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbiFRXut (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Jun 2022 19:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbiFRXut (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Jun 2022 19:50:49 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FB3B7E8
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jun 2022 16:50:47 -0700 (PDT)
Received: from [192.168.1.101] (abxh227.neoplus.adsl.tpnet.pl [83.9.1.227])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1E20220572;
        Sun, 19 Jun 2022 01:50:45 +0200 (CEST)
Message-ID: <44fb0795-605e-1870-6118-c770ba7bb385@somainline.org>
Date:   Sun, 19 Jun 2022 01:50:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/6] clk: qcom: mmcc-msm8996: move clock parent tables
 down
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
 <20220617122922.769562-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220617122922.769562-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.06.2022 14:29, Dmitry Baryshkov wrote:
> Move clock parent tables down, after the MMPLL declrataions, so that we
> can use gpll hw clock fields in the next commit.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  drivers/clk/qcom/mmcc-msm8996.c | 364 ++++++++++++++++----------------
>  1 file changed, 182 insertions(+), 182 deletions(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
> index bf0f8eb78989..27c92818c49c 100644
> --- a/drivers/clk/qcom/mmcc-msm8996.c
> +++ b/drivers/clk/qcom/mmcc-msm8996.c
> @@ -45,188 +45,6 @@ enum {
>  	P_MMPLL4,
>  };
>  
> -static const struct parent_map mmss_xo_hdmi_map[] = {
> -	{ P_XO, 0 },
> -	{ P_HDMIPLL, 1 }
> -};
> -
> -static const char * const mmss_xo_hdmi[] = {
> -	"xo",
> -	"hdmipll"
> -};
> -
> -static const struct parent_map mmss_xo_dsi0pll_dsi1pll_map[] = {
> -	{ P_XO, 0 },
> -	{ P_DSI0PLL, 1 },
> -	{ P_DSI1PLL, 2 }
> -};
> -
> -static const char * const mmss_xo_dsi0pll_dsi1pll[] = {
> -	"xo",
> -	"dsi0pll",
> -	"dsi1pll"
> -};
> -
> -static const struct parent_map mmss_xo_gpll0_gpll0_div_map[] = {
> -	{ P_XO, 0 },
> -	{ P_GPLL0, 5 },
> -	{ P_GPLL0_DIV, 6 }
> -};
> -
> -static const char * const mmss_xo_gpll0_gpll0_div[] = {
> -	"xo",
> -	"gpll0",
> -	"gpll0_div"
> -};
> -
> -static const struct parent_map mmss_xo_dsibyte_map[] = {
> -	{ P_XO, 0 },
> -	{ P_DSI0PLL_BYTE, 1 },
> -	{ P_DSI1PLL_BYTE, 2 }
> -};
> -
> -static const char * const mmss_xo_dsibyte[] = {
> -	"xo",
> -	"dsi0pllbyte",
> -	"dsi1pllbyte"
> -};
> -
> -static const struct parent_map mmss_xo_mmpll0_gpll0_gpll0_div_map[] = {
> -	{ P_XO, 0 },
> -	{ P_MMPLL0, 1 },
> -	{ P_GPLL0, 5 },
> -	{ P_GPLL0_DIV, 6 }
> -};
> -
> -static const char * const mmss_xo_mmpll0_gpll0_gpll0_div[] = {
> -	"xo",
> -	"mmpll0",
> -	"gpll0",
> -	"gpll0_div"
> -};
> -
> -static const struct parent_map mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div_map[] = {
> -	{ P_XO, 0 },
> -	{ P_MMPLL0, 1 },
> -	{ P_MMPLL1, 2 },
> -	{ P_GPLL0, 5 },
> -	{ P_GPLL0_DIV, 6 }
> -};
> -
> -static const char * const mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div[] = {
> -	"xo",
> -	"mmpll0",
> -	"mmpll1",
> -	"gpll0",
> -	"gpll0_div"
> -};
> -
> -static const struct parent_map mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div_map[] = {
> -	{ P_XO, 0 },
> -	{ P_MMPLL0, 1 },
> -	{ P_MMPLL3, 3 },
> -	{ P_GPLL0, 5 },
> -	{ P_GPLL0_DIV, 6 }
> -};
> -
> -static const char * const mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div[] = {
> -	"xo",
> -	"mmpll0",
> -	"mmpll3",
> -	"gpll0",
> -	"gpll0_div"
> -};
> -
> -static const struct parent_map mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div_map[] = {
> -	{ P_XO, 0 },
> -	{ P_MMPLL0, 1 },
> -	{ P_MMPLL5, 2 },
> -	{ P_GPLL0, 5 },
> -	{ P_GPLL0_DIV, 6 }
> -};
> -
> -static const char * const mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div[] = {
> -	"xo",
> -	"mmpll0",
> -	"mmpll5",
> -	"gpll0",
> -	"gpll0_div"
> -};
> -
> -static const struct parent_map mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div_map[] = {
> -	{ P_XO, 0 },
> -	{ P_MMPLL0, 1 },
> -	{ P_MMPLL4, 3 },
> -	{ P_GPLL0, 5 },
> -	{ P_GPLL0_DIV, 6 }
> -};
> -
> -static const char * const mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div[] = {
> -	"xo",
> -	"mmpll0",
> -	"mmpll4",
> -	"gpll0",
> -	"gpll0_div"
> -};
> -
> -static const struct parent_map mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_map[] = {
> -	{ P_XO, 0 },
> -	{ P_MMPLL0, 1 },
> -	{ P_MMPLL9, 2 },
> -	{ P_MMPLL2, 3 },
> -	{ P_MMPLL8, 4 },
> -	{ P_GPLL0, 5 }
> -};
> -
> -static const char * const mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0[] = {
> -	"xo",
> -	"mmpll0",
> -	"mmpll9",
> -	"mmpll2",
> -	"mmpll8",
> -	"gpll0"
> -};
> -
> -static const struct parent_map mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_div_map[] = {
> -	{ P_XO, 0 },
> -	{ P_MMPLL0, 1 },
> -	{ P_MMPLL9, 2 },
> -	{ P_MMPLL2, 3 },
> -	{ P_MMPLL8, 4 },
> -	{ P_GPLL0, 5 },
> -	{ P_GPLL0_DIV, 6 }
> -};
> -
> -static const char * const mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_div[] = {
> -	"xo",
> -	"mmpll0",
> -	"mmpll9",
> -	"mmpll2",
> -	"mmpll8",
> -	"gpll0",
> -	"gpll0_div"
> -};
> -
> -static const struct parent_map mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div_map[] = {
> -	{ P_XO, 0 },
> -	{ P_MMPLL0, 1 },
> -	{ P_MMPLL1, 2 },
> -	{ P_MMPLL4, 3 },
> -	{ P_MMPLL3, 4 },
> -	{ P_GPLL0, 5 },
> -	{ P_GPLL0_DIV, 6 }
> -};
> -
> -static const char * const mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div[] = {
> -	"xo",
> -	"mmpll0",
> -	"mmpll1",
> -	"mmpll4",
> -	"mmpll3",
> -	"gpll0",
> -	"gpll0_div"
> -};
> -
>  static struct clk_fixed_factor gpll0_div = {
>  	.mult = 1,
>  	.div = 2,
> @@ -471,6 +289,188 @@ static struct clk_alpha_pll_postdiv mmpll9 = {
>  	},
>  };
>  
> +static const struct parent_map mmss_xo_hdmi_map[] = {
> +	{ P_XO, 0 },
> +	{ P_HDMIPLL, 1 }
> +};
> +
> +static const char * const mmss_xo_hdmi[] = {
> +	"xo",
> +	"hdmipll"
> +};
> +
> +static const struct parent_map mmss_xo_dsi0pll_dsi1pll_map[] = {
> +	{ P_XO, 0 },
> +	{ P_DSI0PLL, 1 },
> +	{ P_DSI1PLL, 2 }
> +};
> +
> +static const char * const mmss_xo_dsi0pll_dsi1pll[] = {
> +	"xo",
> +	"dsi0pll",
> +	"dsi1pll"
> +};
> +
> +static const struct parent_map mmss_xo_gpll0_gpll0_div_map[] = {
> +	{ P_XO, 0 },
> +	{ P_GPLL0, 5 },
> +	{ P_GPLL0_DIV, 6 }
> +};
> +
> +static const char * const mmss_xo_gpll0_gpll0_div[] = {
> +	"xo",
> +	"gpll0",
> +	"gpll0_div"
> +};
> +
> +static const struct parent_map mmss_xo_dsibyte_map[] = {
> +	{ P_XO, 0 },
> +	{ P_DSI0PLL_BYTE, 1 },
> +	{ P_DSI1PLL_BYTE, 2 }
> +};
> +
> +static const char * const mmss_xo_dsibyte[] = {
> +	"xo",
> +	"dsi0pllbyte",
> +	"dsi1pllbyte"
> +};
> +
> +static const struct parent_map mmss_xo_mmpll0_gpll0_gpll0_div_map[] = {
> +	{ P_XO, 0 },
> +	{ P_MMPLL0, 1 },
> +	{ P_GPLL0, 5 },
> +	{ P_GPLL0_DIV, 6 }
> +};
> +
> +static const char * const mmss_xo_mmpll0_gpll0_gpll0_div[] = {
> +	"xo",
> +	"mmpll0",
> +	"gpll0",
> +	"gpll0_div"
> +};
> +
> +static const struct parent_map mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div_map[] = {
> +	{ P_XO, 0 },
> +	{ P_MMPLL0, 1 },
> +	{ P_MMPLL1, 2 },
> +	{ P_GPLL0, 5 },
> +	{ P_GPLL0_DIV, 6 }
> +};
> +
> +static const char * const mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div[] = {
> +	"xo",
> +	"mmpll0",
> +	"mmpll1",
> +	"gpll0",
> +	"gpll0_div"
> +};
> +
> +static const struct parent_map mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div_map[] = {
> +	{ P_XO, 0 },
> +	{ P_MMPLL0, 1 },
> +	{ P_MMPLL3, 3 },
> +	{ P_GPLL0, 5 },
> +	{ P_GPLL0_DIV, 6 }
> +};
> +
> +static const char * const mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div[] = {
> +	"xo",
> +	"mmpll0",
> +	"mmpll3",
> +	"gpll0",
> +	"gpll0_div"
> +};
> +
> +static const struct parent_map mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div_map[] = {
> +	{ P_XO, 0 },
> +	{ P_MMPLL0, 1 },
> +	{ P_MMPLL5, 2 },
> +	{ P_GPLL0, 5 },
> +	{ P_GPLL0_DIV, 6 }
> +};
> +
> +static const char * const mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div[] = {
> +	"xo",
> +	"mmpll0",
> +	"mmpll5",
> +	"gpll0",
> +	"gpll0_div"
> +};
> +
> +static const struct parent_map mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div_map[] = {
> +	{ P_XO, 0 },
> +	{ P_MMPLL0, 1 },
> +	{ P_MMPLL4, 3 },
> +	{ P_GPLL0, 5 },
> +	{ P_GPLL0_DIV, 6 }
> +};
> +
> +static const char * const mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div[] = {
> +	"xo",
> +	"mmpll0",
> +	"mmpll4",
> +	"gpll0",
> +	"gpll0_div"
> +};
> +
> +static const struct parent_map mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_map[] = {
> +	{ P_XO, 0 },
> +	{ P_MMPLL0, 1 },
> +	{ P_MMPLL9, 2 },
> +	{ P_MMPLL2, 3 },
> +	{ P_MMPLL8, 4 },
> +	{ P_GPLL0, 5 }
> +};
> +
> +static const char * const mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0[] = {
> +	"xo",
> +	"mmpll0",
> +	"mmpll9",
> +	"mmpll2",
> +	"mmpll8",
> +	"gpll0"
> +};
> +
> +static const struct parent_map mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_div_map[] = {
> +	{ P_XO, 0 },
> +	{ P_MMPLL0, 1 },
> +	{ P_MMPLL9, 2 },
> +	{ P_MMPLL2, 3 },
> +	{ P_MMPLL8, 4 },
> +	{ P_GPLL0, 5 },
> +	{ P_GPLL0_DIV, 6 }
> +};
> +
> +static const char * const mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_div[] = {
> +	"xo",
> +	"mmpll0",
> +	"mmpll9",
> +	"mmpll2",
> +	"mmpll8",
> +	"gpll0",
> +	"gpll0_div"
> +};
> +
> +static const struct parent_map mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div_map[] = {
> +	{ P_XO, 0 },
> +	{ P_MMPLL0, 1 },
> +	{ P_MMPLL1, 2 },
> +	{ P_MMPLL4, 3 },
> +	{ P_MMPLL3, 4 },
> +	{ P_GPLL0, 5 },
> +	{ P_GPLL0_DIV, 6 }
> +};
> +
> +static const char * const mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div[] = {
> +	"xo",
> +	"mmpll0",
> +	"mmpll1",
> +	"mmpll4",
> +	"mmpll3",
> +	"gpll0",
> +	"gpll0_div"
> +};
> +
>  static const struct freq_tbl ftbl_ahb_clk_src[] = {
>  	F(19200000, P_XO, 1, 0, 0),
>  	F(40000000, P_GPLL0_DIV, 7.5, 0, 0),
> 
