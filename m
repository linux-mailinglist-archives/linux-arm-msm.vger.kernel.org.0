Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 316CB475502
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 10:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236364AbhLOJSo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 04:18:44 -0500
Received: from relay04.th.seeweb.it ([5.144.164.165]:45899 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236347AbhLOJSo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 04:18:44 -0500
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0CB4320379;
        Wed, 15 Dec 2021 10:18:43 +0100 (CET)
Date:   Wed, 15 Dec 2021 10:18:41 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 02/15] clk: qcom: gpucc-sdm660: get rid of the test
 clock
Message-ID: <20211215091841.r3fahl5stxacuzey@SoMainline.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
 <20211215005423.2114261-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215005423.2114261-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-12-15 03:54:10, Dmitry Baryshkov wrote:
> The test clock isn't in the bindings and apparently it's not used by
> anyone upstream.  Remove it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

Fair enough, the test clock doesn't even exist in this driver: it's
merely an unused enum variant.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/clk/qcom/gpucc-sdm660.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
> index 7c07b0979aea..71a1ee05e822 100644
> --- a/drivers/clk/qcom/gpucc-sdm660.c
> +++ b/drivers/clk/qcom/gpucc-sdm660.c
> @@ -29,7 +29,6 @@
>  
>  enum {
>  	P_GPU_XO,
> -	P_CORE_BI_PLL_TEST_SE,
>  	P_GPLL0_OUT_MAIN,
>  	P_GPLL0_OUT_MAIN_DIV,
>  	P_GPU_PLL0_PLL_OUT_MAIN,
> -- 
> 2.33.0
> 
