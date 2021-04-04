Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0AD4353884
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Apr 2021 16:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbhDDOx3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 10:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbhDDOx3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 10:53:29 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8A7C061788
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Apr 2021 07:53:24 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id i81so9540685oif.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Apr 2021 07:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KTVH/Ci3fS+A8n5qxsXtDC3bDEMfkfXTlKdOJBAhOW8=;
        b=CBRofYnoHqnMmKsXRw/rCLJaYCIkorZ9xMzivMDqf7LyqxPxYbU5EAgbhHae1Nwmeb
         l01qqYENxpkVrU1OlLmz+wj0e1bqEyZ57lwc0gVHl/umMlgktQgwZWLp2xPT1MNThTwv
         Zu87dVBtF8LFplMPruhH/CykjPRimfH1JHU1dscSX/gA0pp6EIVBFoDHH1GktcUEKoUc
         +Sd4OFYg5t9MCaaky4nSr7anziNd7QcGFS3pMnqSp7vqtCuq16GxhsB6kFujdSlsT/Uq
         NxgAZrmLqY7wicyvZt9PKCVbmrRFqPq4gqXVc3ffdyg/FMa6iQ09uvdic9WMgs/ktzrD
         ysKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KTVH/Ci3fS+A8n5qxsXtDC3bDEMfkfXTlKdOJBAhOW8=;
        b=m8rEt4zg35A8A9Z0kqoG0f5d0KCDqir2iR0sHmIHT9IEp3K7POBm3Kp4AluCd7kmF5
         NHSPozabCYC6Ogw3Umd5hIQbQbp7ibrFbBCj4art0Uq0tBTMBNy7/P+kHYyrJ0Vn5wp+
         UXlMNQdpap4CZNMjnOSqxrcOU9/mqa6840UmlSgRSGgXxIEVdv55KaNbQPuGYGITUlua
         UY0IPErXvmD758P+rxPWFM0Sy7gMeuBTFftXN4sjXdqOSE9ZNCWCm43MagLy7+gPXCE7
         Q/2nlaOtPsw8NUO2TM3IkJ6yQQYTaBtMWPt0bhsM+oIHVJI6thIZep1Pu4regQzgeJjk
         Nq9g==
X-Gm-Message-State: AOAM531WTtpmiIuEyzpHrAGG7mPzq8cGCm15ju21bWacx4WtEewT/UsA
        kNj5sYFJvMRFkAm82fTvXsOH7w==
X-Google-Smtp-Source: ABdhPJwk3wzj2p5QKqQqzA+ebkgDBrFfg2LdpgT0vQan5vC1C8DkPB6Nuo7UE4GmsOYmDrMXMTMkvg==
X-Received: by 2002:aca:db41:: with SMTP id s62mr15631531oig.54.1617548004096;
        Sun, 04 Apr 2021 07:53:24 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e34sm3329357ote.70.2021.04.04.07.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:53:23 -0700 (PDT)
Date:   Sun, 4 Apr 2021 09:53:21 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v1 3/4] clk: qcom: gcc-sdm845: get rid of the test clock
Message-ID: <20210404145321.GX904837@yoga>
References: <20210402233944.273275-1-dmitry.baryshkov@linaro.org>
 <20210402233944.273275-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210402233944.273275-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 02 Apr 18:39 CDT 2021, Dmitry Baryshkov wrote:

> The test clock isn't in the bindings and apparently it's not used by
> anyone upstream.  Remove it.
> 
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/gcc-sdm845.c | 99 +++++++++++++++--------------------
>  1 file changed, 42 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index 74800ed3c34a..61ef32622818 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -28,7 +28,6 @@
>  enum {
>  	P_BI_TCXO,
>  	P_AUD_REF_CLK,
> -	P_CORE_BI_PLL_TEST_SE,
>  	P_GPLL0_OUT_EVEN,
>  	P_GPLL0_OUT_MAIN,
>  	P_GPLL4_OUT_MAIN,
> @@ -98,14 +97,12 @@ static const struct parent_map gcc_parent_map_0[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_0[] = {
>  	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_1[] = {
> @@ -113,7 +110,6 @@ static const struct parent_map gcc_parent_map_1[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_SLEEP_CLK, 5 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_1[] = {
> @@ -121,41 +117,34 @@ static const struct clk_parent_data gcc_parent_data_1[] = {
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .fw_name = "sleep_clk", .name = "core_pi_sleep_clk" },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_2[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_SLEEP_CLK, 5 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_2[] = {
>  	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>  	{ .fw_name = "sleep_clk", .name = "core_pi_sleep_clk" },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_3[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_3[] = {
>  	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>  	{ .hw = &gpll0.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_4[] = {
>  	{ P_BI_TCXO, 0 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_4[] = {
>  	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_6[] = {
> @@ -163,7 +152,6 @@ static const struct parent_map gcc_parent_map_6[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_AUD_REF_CLK, 2 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_6[] = {
> @@ -171,7 +159,6 @@ static const struct clk_parent_data gcc_parent_data_6[] = {
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .fw_name = "aud_ref_clk", .name = "aud_ref_clk" },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_7_ao[] = {
> @@ -198,7 +185,6 @@ static const struct parent_map gcc_parent_map_10[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_GPLL4_OUT_MAIN, 5 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_10[] = {
> @@ -206,7 +192,6 @@ static const struct clk_parent_data gcc_parent_data_10[] = {
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll4.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  
> @@ -266,7 +251,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_gp1_clk_src",
>  		.parent_data = gcc_parent_data_1,
> -		.num_parents = 5,
> +		.num_parents = 4,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -280,7 +265,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_gp2_clk_src",
>  		.parent_data = gcc_parent_data_1,
> -		.num_parents = 5,
> +		.num_parents = 4,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -294,7 +279,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_gp3_clk_src",
>  		.parent_data = gcc_parent_data_1,
> -		.num_parents = 5,
> +		.num_parents = 4,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -314,7 +299,7 @@ static struct clk_rcg2 gcc_pcie_0_aux_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_pcie_0_aux_clk_src",
>  		.parent_data = gcc_parent_data_2,
> -		.num_parents = 3,
> +		.num_parents = 2,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -328,7 +313,7 @@ static struct clk_rcg2 gcc_pcie_1_aux_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_pcie_1_aux_clk_src",
>  		.parent_data = gcc_parent_data_2,
> -		.num_parents = 3,
> +		.num_parents = 2,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -348,7 +333,7 @@ static struct clk_rcg2 gcc_pcie_phy_refgen_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_pcie_phy_refgen_clk_src",
>  		.parent_data = gcc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = 3,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -370,7 +355,7 @@ static struct clk_rcg2 gcc_qspi_core_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_qspi_core_clk_src",
>  		.parent_data = gcc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = 3,
>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
> @@ -391,7 +376,7 @@ static struct clk_rcg2 gcc_pdm2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_pdm2_clk_src",
>  		.parent_data = gcc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = 3,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -418,7 +403,7 @@ static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s0_clk_src[] = {
>  static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
>  	.name = "gcc_qupv3_wrap0_s0_clk_src",
>  	.parent_data = gcc_parent_data_0,
> -	.num_parents = 4,
> +	.num_parents = 3,
>  	.ops = &clk_rcg2_shared_ops,
>  };
>  
> @@ -434,7 +419,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
>  static struct clk_init_data gcc_qupv3_wrap0_s1_clk_src_init = {
>  	.name = "gcc_qupv3_wrap0_s1_clk_src",
>  	.parent_data = gcc_parent_data_0,
> -	.num_parents = 4,
> +	.num_parents = 3,
>  	.ops = &clk_rcg2_shared_ops,
>  };
>  
> @@ -450,7 +435,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
>  static struct clk_init_data gcc_qupv3_wrap0_s2_clk_src_init = {
>  	.name = "gcc_qupv3_wrap0_s2_clk_src",
>  	.parent_data = gcc_parent_data_0,
> -	.num_parents = 4,
> +	.num_parents = 3,
>  	.ops = &clk_rcg2_shared_ops,
>  };
>  
> @@ -466,7 +451,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
>  static struct clk_init_data gcc_qupv3_wrap0_s3_clk_src_init = {
>  	.name = "gcc_qupv3_wrap0_s3_clk_src",
>  	.parent_data = gcc_parent_data_0,
> -	.num_parents = 4,
> +	.num_parents = 3,
>  	.ops = &clk_rcg2_shared_ops,
>  };
>  
> @@ -482,7 +467,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
>  static struct clk_init_data gcc_qupv3_wrap0_s4_clk_src_init = {
>  	.name = "gcc_qupv3_wrap0_s4_clk_src",
>  	.parent_data = gcc_parent_data_0,
> -	.num_parents = 4,
> +	.num_parents = 3,
>  	.ops = &clk_rcg2_shared_ops,
>  };
>  
> @@ -498,7 +483,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
>  static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init = {
>  	.name = "gcc_qupv3_wrap0_s5_clk_src",
>  	.parent_data = gcc_parent_data_0,
> -	.num_parents = 4,
> +	.num_parents = 3,
>  	.ops = &clk_rcg2_shared_ops,
>  };
>  
> @@ -514,7 +499,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
>  static struct clk_init_data gcc_qupv3_wrap0_s6_clk_src_init = {
>  	.name = "gcc_qupv3_wrap0_s6_clk_src",
>  	.parent_data = gcc_parent_data_0,
> -	.num_parents = 4,
> +	.num_parents = 3,
>  	.ops = &clk_rcg2_shared_ops,
>  };
>  
> @@ -530,7 +515,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
>  static struct clk_init_data gcc_qupv3_wrap0_s7_clk_src_init = {
>  	.name = "gcc_qupv3_wrap0_s7_clk_src",
>  	.parent_data = gcc_parent_data_0,
> -	.num_parents = 4,
> +	.num_parents = 3,
>  	.ops = &clk_rcg2_shared_ops,
>  };
>  
> @@ -546,7 +531,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src = {
>  static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
>  	.name = "gcc_qupv3_wrap1_s0_clk_src",
>  	.parent_data = gcc_parent_data_0,
> -	.num_parents = 4,
> +	.num_parents = 3,
>  	.ops = &clk_rcg2_shared_ops,
>  };
>  
> @@ -562,7 +547,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
>  static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
>  	.name = "gcc_qupv3_wrap1_s1_clk_src",
>  	.parent_data = gcc_parent_data_0,
> -	.num_parents = 4,
> +	.num_parents = 3,
>  	.ops = &clk_rcg2_shared_ops,
>  };
>  
> @@ -578,7 +563,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
>  static struct clk_init_data gcc_qupv3_wrap1_s2_clk_src_init = {
>  	.name = "gcc_qupv3_wrap1_s2_clk_src",
>  	.parent_data = gcc_parent_data_0,
> -	.num_parents = 4,
> +	.num_parents = 3,
>  	.ops = &clk_rcg2_shared_ops,
>  };
>  
> @@ -594,7 +579,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
>  static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
>  	.name = "gcc_qupv3_wrap1_s3_clk_src",
>  	.parent_data = gcc_parent_data_0,
> -	.num_parents = 4,
> +	.num_parents = 3,
>  	.ops = &clk_rcg2_shared_ops,
>  };
>  
> @@ -610,7 +595,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
>  static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
>  	.name = "gcc_qupv3_wrap1_s4_clk_src",
>  	.parent_data = gcc_parent_data_0,
> -	.num_parents = 4,
> +	.num_parents = 3,
>  	.ops = &clk_rcg2_shared_ops,
>  };
>  
> @@ -626,7 +611,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
>  static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
>  	.name = "gcc_qupv3_wrap1_s5_clk_src",
>  	.parent_data = gcc_parent_data_0,
> -	.num_parents = 4,
> +	.num_parents = 3,
>  	.ops = &clk_rcg2_shared_ops,
>  };
>  
> @@ -642,7 +627,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
>  static struct clk_init_data gcc_qupv3_wrap1_s6_clk_src_init = {
>  	.name = "gcc_qupv3_wrap1_s6_clk_src",
>  	.parent_data = gcc_parent_data_0,
> -	.num_parents = 4,
> +	.num_parents = 3,
>  	.ops = &clk_rcg2_shared_ops,
>  };
>  
> @@ -658,7 +643,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
>  static struct clk_init_data gcc_qupv3_wrap1_s7_clk_src_init = {
>  	.name = "gcc_qupv3_wrap1_s7_clk_src",
>  	.parent_data = gcc_parent_data_0,
> -	.num_parents = 4,
> +	.num_parents = 3,
>  	.ops = &clk_rcg2_shared_ops,
>  };
>  
> @@ -691,7 +676,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_sdcc2_apps_clk_src",
>  		.parent_data = gcc_parent_data_10,
> -		.num_parents = 5,
> +		.num_parents = 4,
>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
> @@ -715,7 +700,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_sdcc4_apps_clk_src",
>  		.parent_data = gcc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = 3,
>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
> @@ -734,7 +719,7 @@ static struct clk_rcg2 gcc_tsif_ref_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_tsif_ref_clk_src",
>  		.parent_data = gcc_parent_data_6,
> -		.num_parents = 5,
> +		.num_parents = 4,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -757,7 +742,7 @@ static struct clk_rcg2 gcc_ufs_card_axi_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_ufs_card_axi_clk_src",
>  		.parent_data = gcc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = 3,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -779,7 +764,7 @@ static struct clk_rcg2 gcc_ufs_card_ice_core_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_ufs_card_ice_core_clk_src",
>  		.parent_data = gcc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = 3,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -793,7 +778,7 @@ static struct clk_rcg2 gcc_ufs_card_phy_aux_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_ufs_card_phy_aux_clk_src",
>  		.parent_data = gcc_parent_data_4,
> -		.num_parents = 2,
> +		.num_parents = 1,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -814,7 +799,7 @@ static struct clk_rcg2 gcc_ufs_card_unipro_core_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_ufs_card_unipro_core_clk_src",
>  		.parent_data = gcc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = 3,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -837,7 +822,7 @@ static struct clk_rcg2 gcc_ufs_phy_axi_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_ufs_phy_axi_clk_src",
>  		.parent_data = gcc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = 3,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -851,7 +836,7 @@ static struct clk_rcg2 gcc_ufs_phy_ice_core_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_ufs_phy_ice_core_clk_src",
>  		.parent_data = gcc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = 3,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -865,7 +850,7 @@ static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_ufs_phy_phy_aux_clk_src",
>  		.parent_data = gcc_parent_data_4,
> -		.num_parents = 2,
> +		.num_parents = 1,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -879,7 +864,7 @@ static struct clk_rcg2 gcc_ufs_phy_unipro_core_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_ufs_phy_unipro_core_clk_src",
>  		.parent_data = gcc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = 3,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -902,7 +887,7 @@ static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_usb30_prim_master_clk_src",
>  		.parent_data = gcc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = 3,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -924,7 +909,7 @@ static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_usb30_prim_mock_utmi_clk_src",
>  		.parent_data = gcc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = 3,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -938,7 +923,7 @@ static struct clk_rcg2 gcc_usb30_sec_master_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_usb30_sec_master_clk_src",
>  		.parent_data = gcc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = 3,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -952,7 +937,7 @@ static struct clk_rcg2 gcc_usb30_sec_mock_utmi_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_usb30_sec_mock_utmi_clk_src",
>  		.parent_data = gcc_parent_data_0,
> -		.num_parents = 4,
> +		.num_parents = 3,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -966,7 +951,7 @@ static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_usb3_prim_phy_aux_clk_src",
>  		.parent_data = gcc_parent_data_2,
> -		.num_parents = 3,
> +		.num_parents = 2,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -980,7 +965,7 @@ static struct clk_rcg2 gcc_usb3_sec_phy_aux_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_usb3_sec_phy_aux_clk_src",
>  		.parent_data = gcc_parent_data_2,
> -		.num_parents = 3,
> +		.num_parents = 2,
>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> @@ -994,7 +979,7 @@ static struct clk_rcg2 gcc_vs_ctrl_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gcc_vs_ctrl_clk_src",
>  		.parent_data = gcc_parent_data_3,
> -		.num_parents = 3,
> +		.num_parents = 2,
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> -- 
> 2.30.2
> 
