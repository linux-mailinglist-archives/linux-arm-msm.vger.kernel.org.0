Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6FA475519
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 10:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241142AbhLOJXy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 04:23:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236355AbhLOJXy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 04:23:54 -0500
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4810EC06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 01:23:53 -0800 (PST)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 00F1620379;
        Wed, 15 Dec 2021 10:23:51 +0100 (CET)
Date:   Wed, 15 Dec 2021 10:23:50 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 07/15] clk: qcom: camcc-sdm845: get rid of the test
 clock
Message-ID: <20211215092350.hripuu2ud6fs5hhl@SoMainline.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
 <20211215005423.2114261-8-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215005423.2114261-8-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-12-15 03:54:15, Dmitry Baryshkov wrote:
> The test clock isn't in the bindings and apparently it's not used by
> anyone upstream.  Remove it.
> 
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

As with the other SoC patches in this series, you should move:

    [PATCH v2 09/15] clk: qcom: camcc-sdm845: use ARRAY_SIZE instead of specifying num_parents

Before this patch (07/15).  Otherwise num_parents for all the clocks
using parent_map/names_0 will have to temporarily be changed from 6 down
to 5 to make this bisectable.

- Marijn

> ---
>  drivers/clk/qcom/camcc-sdm845.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
> index 1b2cefef7431..545c288a7f98 100644
> --- a/drivers/clk/qcom/camcc-sdm845.c
> +++ b/drivers/clk/qcom/camcc-sdm845.c
> @@ -23,7 +23,6 @@ enum {
>  	P_CAM_CC_PLL1_OUT_EVEN,
>  	P_CAM_CC_PLL2_OUT_EVEN,
>  	P_CAM_CC_PLL3_OUT_EVEN,
> -	P_CORE_BI_PLL_TEST_SE,
>  };
>  
>  static const struct parent_map cam_cc_parent_map_0[] = {
> @@ -32,7 +31,6 @@ static const struct parent_map cam_cc_parent_map_0[] = {
>  	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
>  	{ P_CAM_CC_PLL3_OUT_EVEN, 5 },
>  	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const char * const cam_cc_parent_names_0[] = {
> @@ -41,7 +39,6 @@ static const char * const cam_cc_parent_names_0[] = {
>  	"cam_cc_pll1_out_even",
>  	"cam_cc_pll3_out_even",
>  	"cam_cc_pll0_out_even",
> -	"core_bi_pll_test_se",
>  };
>  
>  static struct clk_alpha_pll cam_cc_pll0 = {
> -- 
> 2.33.0
> 
