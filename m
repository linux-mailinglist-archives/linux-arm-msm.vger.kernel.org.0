Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D80D46DEB8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 23:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240776AbhLHW5Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 17:57:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbhLHW5Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 17:57:24 -0500
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3758C061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 14:53:51 -0800 (PST)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A3A5D3F1E3;
        Wed,  8 Dec 2021 23:53:49 +0100 (CET)
Date:   Wed, 8 Dec 2021 23:53:48 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 07/11] clk: qcom: videocc-sc7180: use parent_hws instead
 of parent_data
Message-ID: <20211208225348.rk5tujy3qh2yhhob@SoMainline.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
 <20211208175430.1333594-8-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208175430.1333594-8-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-12-08 20:54:26, Dmitry Baryshkov wrote:
> If all parents are specified as clk_hw, we can use parent_hws instead of
> parent_data.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/clk/qcom/videocc-sc7180.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
> index ed57bbb19f88..5b9b54f616b8 100644
> --- a/drivers/clk/qcom/videocc-sc7180.c
> +++ b/drivers/clk/qcom/videocc-sc7180.c
> @@ -99,8 +99,8 @@ static struct clk_branch video_cc_vcodec0_core_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "video_cc_vcodec0_core_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &video_cc_venus_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&video_cc_venus_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -143,8 +143,8 @@ static struct clk_branch video_cc_venus_ctl_core_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "video_cc_venus_ctl_core_clk",
> -			.parent_data = &(const struct clk_parent_data){
> -				.hw = &video_cc_venus_clk_src.clkr.hw,
> +			.parent_hws = (const struct clk_hw*[]){
> +				&video_cc_venus_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> -- 
> 2.33.0
> 
