Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77C3B4808CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 12:26:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbhL1L0k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Dec 2021 06:26:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbhL1L0j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Dec 2021 06:26:39 -0500
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4158C061574;
        Tue, 28 Dec 2021 03:26:37 -0800 (PST)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 3C5E01F3EF;
        Tue, 28 Dec 2021 12:26:34 +0100 (CET)
Date:   Tue, 28 Dec 2021 12:26:27 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 09/16] clk: qcom: camcc-sdm845: move clock parent
 tables down
Message-ID: <20211228112627.hup5sbxkddjje534@SoMainline.org>
References: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
 <20211228045415.20543-10-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211228045415.20543-10-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-12-28 07:54:08, Dmitry Baryshkov wrote:
> Move clock parent tables down, after the PLL declrataions, so that we
> can use pll hw clock fields in the next commit.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

From https://lore.kernel.org/linux-arm-msm/20211215202432.hdjntlglgolld6nw@SoMainline.org/:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

(And also Stephen)

> ---
>  drivers/clk/qcom/camcc-sdm845.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
> index 6210b0fb7eac..fd01ea53a07f 100644
> --- a/drivers/clk/qcom/camcc-sdm845.c
> +++ b/drivers/clk/qcom/camcc-sdm845.c
> @@ -25,22 +25,6 @@ enum {
>  	P_CAM_CC_PLL3_OUT_EVEN,
>  };
>  
> -static const struct parent_map cam_cc_parent_map_0[] = {
> -	{ P_BI_TCXO, 0 },
> -	{ P_CAM_CC_PLL2_OUT_EVEN, 1 },
> -	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
> -	{ P_CAM_CC_PLL3_OUT_EVEN, 5 },
> -	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
> -};
> -
> -static const char * const cam_cc_parent_names_0[] = {
> -	"bi_tcxo",
> -	"cam_cc_pll2_out_even",
> -	"cam_cc_pll1_out_even",
> -	"cam_cc_pll3_out_even",
> -	"cam_cc_pll0_out_even",
> -};
> -
>  static struct clk_alpha_pll cam_cc_pll0 = {
>  	.offset = 0x0,
>  	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
> @@ -159,6 +143,22 @@ static struct clk_alpha_pll_postdiv cam_cc_pll3_out_even = {
>  	},
>  };
>  
> +static const struct parent_map cam_cc_parent_map_0[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL2_OUT_EVEN, 1 },
> +	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
> +	{ P_CAM_CC_PLL3_OUT_EVEN, 5 },
> +	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
> +};
> +
> +static const char * const cam_cc_parent_names_0[] = {
> +	"bi_tcxo",
> +	"cam_cc_pll2_out_even",
> +	"cam_cc_pll1_out_even",
> +	"cam_cc_pll3_out_even",
> +	"cam_cc_pll0_out_even",
> +};
> +
>  static const struct freq_tbl ftbl_cam_cc_bps_clk_src[] = {
>  	F(19200000, P_BI_TCXO, 1, 0, 0),
>  	F(100000000, P_CAM_CC_PLL0_OUT_EVEN, 6, 0, 0),
> -- 
> 2.34.1
> 
