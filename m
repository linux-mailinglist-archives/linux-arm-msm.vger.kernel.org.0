Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD86FF4CB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2019 19:55:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfKPSzB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Nov 2019 13:55:01 -0500
Received: from onstation.org ([52.200.56.107]:36748 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727720AbfKPSzB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Nov 2019 13:55:01 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 320733E994;
        Sat, 16 Nov 2019 18:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1573930500;
        bh=9mscJ6qmnyqNwM3Mx2DhzguwKVjc/aV7VY70d5lPAKk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nCbhIiopYIKNUGA8zald24TKAKmemZCLxvtgNHTVANOHoRFQxYZqVI0wkh0vdGzWK
         eDIa0FstSiFmLMiaTmESyZRdjpKuA4Fg9REaRltjyJppqEB8ddamY5PArIkjlLyhN/
         mhHlaScTYZPc83OLigHvGDEiLxSh4a+mAEcteVwA=
Date:   Sat, 16 Nov 2019 13:54:57 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     sboyd@kernel.org
Cc:     mturquette@baylibre.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        jonathan@marek.ca
Subject: Re: [PATCH] clk: qcom: mmcc8974: move gfx3d_clk_src from the mmcc to
 rpm
Message-ID: <20191116185457.GA11601@onstation.org>
References: <20191115123931.18919-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115123931.18919-1-masneyb@onstation.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 15, 2019 at 07:39:31AM -0500, Brian Masney wrote:
> gfx3d_clk_src for msm8974 was introduced into the MMCC by
> commit d8b212014e69 ("clk: qcom: Add support for MSM8974's multimedia
> clock controller (MMCC)") to ensure that all of the clocks for
> this platform are documented upstream. This clock actually belongs
> on the RPM. Since then, commit 685dc94b7d8f ("clk: qcom: smd-rpmcc:
> Add msm8974 clocks") was introduced, which contains the proper
> definition for gfx3d_clk_src. Let's drop the definition from the
> mmcc and register the clock with the rpm instead.
> 
> This change was tested on a Nexus 5 (hammerhead) phone.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c  |  2 ++
>  drivers/clk/qcom/mmcc-msm8974.c | 13 -------------
>  2 files changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 60aae7543608..2db31dbe47e9 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -486,6 +486,8 @@ static struct clk_smd_rpm *msm8974_clks[] = {
>  	[RPM_SMD_MMSSNOC_AHB_CLK]	= &msm8974_mmssnoc_ahb_clk,
>  	[RPM_SMD_MMSSNOC_AHB_A_CLK]	= &msm8974_mmssnoc_ahb_a_clk,
>  	[RPM_SMD_BIMC_CLK]		= &msm8974_bimc_clk,
> +	[RPM_SMD_GFX3D_CLK_SRC]		= &msm8974_gfx3d_clk_src,
> +	[RPM_SMD_GFX3D_A_CLK_SRC]	= &msm8974_gfx3d_a_clk_src,
>  	[RPM_SMD_BIMC_A_CLK]		= &msm8974_bimc_a_clk,
>  	[RPM_SMD_OCMEMGX_CLK]		= &msm8974_ocmemgx_clk,
>  	[RPM_SMD_OCMEMGX_A_CLK]		= &msm8974_ocmemgx_a_clk,
> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
> index bcb0a397ef91..015426262d08 100644
> --- a/drivers/clk/qcom/mmcc-msm8974.c
> +++ b/drivers/clk/qcom/mmcc-msm8974.c
> @@ -452,18 +452,6 @@ static struct clk_rcg2 mdp_clk_src = {
>  	},
>  };
>  
> -static struct clk_rcg2 gfx3d_clk_src = {
> -	.cmd_rcgr = 0x4000,
> -	.hid_width = 5,
> -	.parent_map = mmcc_xo_mmpll0_1_2_gpll0_map,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gfx3d_clk_src",
> -		.parent_names = mmcc_xo_mmpll0_1_2_gpll0,
> -		.num_parents = 5,
> -		.ops = &clk_rcg2_ops,
> -	},
> -};
> -
>  static struct freq_tbl ftbl_camss_jpeg_jpeg0_2_clk[] = {
>  	F(75000000, P_GPLL0, 8, 0, 0),
>  	F(133330000, P_GPLL0, 4.5, 0, 0),
> @@ -2411,7 +2399,6 @@ static struct clk_regmap *mmcc_msm8974_clocks[] = {
>  	[VFE0_CLK_SRC] = &vfe0_clk_src.clkr,
>  	[VFE1_CLK_SRC] = &vfe1_clk_src.clkr,
>  	[MDP_CLK_SRC] = &mdp_clk_src.clkr,
> -	[GFX3D_CLK_SRC] = &gfx3d_clk_src.clkr,
>  	[JPEG0_CLK_SRC] = &jpeg0_clk_src.clkr,
>  	[JPEG1_CLK_SRC] = &jpeg1_clk_src.clkr,
>  	[JPEG2_CLK_SRC] = &jpeg2_clk_src.clkr,

I just realized that I also need to remove the GFX3D_CLK_SRC #define
from include/dt-bindings/clock/qcom,mmcc-msm8974.h. I'll send out a v2
tomorrow evening.

Brian
