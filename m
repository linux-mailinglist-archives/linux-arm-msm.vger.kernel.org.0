Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE26546DE8E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 23:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234579AbhLHWvz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 17:51:55 -0500
Received: from relay08.th.seeweb.it ([5.144.164.169]:49285 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240704AbhLHWvy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 17:51:54 -0500
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5F94D3EF05;
        Wed,  8 Dec 2021 23:48:20 +0100 (CET)
Date:   Wed, 8 Dec 2021 23:48:19 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 03/11] clk: qcom: camcc-sc7180: get rid of the test clock
Message-ID: <20211208224819.nnl6mhqhshqxa4d6@SoMainline.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
 <20211208175430.1333594-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208175430.1333594-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-12-08 20:54:22, Dmitry Baryshkov wrote:
> The test clock isn't in the bindings and apparently it's not used by
> anyone upstream.  Remove it.
> 
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sc7180.c | 65 +++++++++++++--------------------
>  1 file changed, 25 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
> index ce73ee9037cb..3c15e551419f 100644
> --- a/drivers/clk/qcom/camcc-sc7180.c
> +++ b/drivers/clk/qcom/camcc-sc7180.c
> [..]
> @@ -303,7 +288,7 @@ static struct clk_rcg2 cam_cc_bps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cam_cc_bps_clk_src",
>  		.parent_data = cam_cc_parent_data_2,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),

Perhaps it is more clear to perform this conversion in a separate patch,
before this patch that removes the test clock?  Otherwise this
transition to ARRAY_SIZE should probably at least be mentioned in the
title and commit body.

- Marijn

>  		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
> [..]
