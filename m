Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F28A2FCE51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 11:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbhATKZI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 05:25:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731025AbhATJRD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 04:17:03 -0500
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2820C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 01:16:22 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 919761F63C;
        Wed, 20 Jan 2021 10:16:17 +0100 (CET)
Subject: Re: [PATCH V1] clk: qcom: gcc-sc7180: Mark the MM XO clocks to be
 always ON
To:     Taniya Das <tdas@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1611128871-5898-1-git-send-email-tdas@codeaurora.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <e6843147-514b-8901-a04c-b1d6e3ebf1c2@somainline.org>
Date:   Wed, 20 Jan 2021 10:16:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1611128871-5898-1-git-send-email-tdas@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 20/01/21 08:47, Taniya Das ha scritto:
> There are intermittent GDSC power-up failures observed for titan top
> gdsc, which requires the XO clock. Thus mark all the MM XO clocks always
> enabled from probe.
> 

Hello Tanya,

> Fixes: 8d4025943e13 ("clk: qcom: camcc-sc7180: Use runtime PM ops instead of clk ones")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>   drivers/clk/qcom/gcc-sc7180.c | 47 ++++---------------------------------------
>   1 file changed, 4 insertions(+), 43 deletions(-)
> 
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
> 
> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
> index b05901b..88e896a 100644
> --- a/drivers/clk/qcom/gcc-sc7180.c
> +++ b/drivers/clk/qcom/gcc-sc7180.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2019-2021, The Linux Foundation. All rights reserved.
>    */
> 
>   #include <linux/clk-provider.h>
> @@ -919,19 +919,6 @@ static struct clk_branch gcc_camera_throttle_hf_axi_clk = {
>   	},
>   };
> 
> -static struct clk_branch gcc_camera_xo_clk = {
> -	.halt_reg = 0xb02c,
> -	.halt_check = BRANCH_HALT,
> -	.clkr = {
> -		.enable_reg = 0xb02c,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gcc_camera_xo_clk",
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -

Why are you avoiding to register these clocks entirely?
If this is needed by the Titan GDSC, this clock "does indeed exist".

If these clocks shall never be turned off, then you should add the
CLK_IS_CRITICAL flag and perhaps add a comment explaining why.

>   static struct clk_branch gcc_ce1_ahb_clk = {
>   	.halt_reg = 0x4100c,
>   	.halt_check = BRANCH_HALT_VOTED,
> @@ -1096,19 +1083,6 @@ static struct clk_branch gcc_disp_throttle_hf_axi_clk = {
>   	},
>   };
> 
> -static struct clk_branch gcc_disp_xo_clk = {
> -	.halt_reg = 0xb030,
> -	.halt_check = BRANCH_HALT,
> -	.clkr = {
> -		.enable_reg = 0xb030,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gcc_disp_xo_clk",
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -

Same here.

>   static struct clk_branch gcc_gp1_clk = {
>   	.halt_reg = 0x64000,
>   	.halt_check = BRANCH_HALT,
> @@ -2159,19 +2133,6 @@ static struct clk_branch gcc_video_throttle_axi_clk = {
>   	},
>   };
> 
> -static struct clk_branch gcc_video_xo_clk = {
> -	.halt_reg = 0xb028,
> -	.halt_check = BRANCH_HALT,
> -	.clkr = {
> -		.enable_reg = 0xb028,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gcc_video_xo_clk",
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -

...and here.

>   static struct clk_branch gcc_mss_cfg_ahb_clk = {
>   	.halt_reg = 0x8a000,
>   	.halt_check = BRANCH_HALT,
> @@ -2304,7 +2265,6 @@ static struct clk_regmap *gcc_sc7180_clocks[] = {
>   	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
>   	[GCC_CAMERA_HF_AXI_CLK] = &gcc_camera_hf_axi_clk.clkr,
>   	[GCC_CAMERA_THROTTLE_HF_AXI_CLK] = &gcc_camera_throttle_hf_axi_clk.clkr,
> -	[GCC_CAMERA_XO_CLK] = &gcc_camera_xo_clk.clkr,
>   	[GCC_CE1_AHB_CLK] = &gcc_ce1_ahb_clk.clkr,
>   	[GCC_CE1_AXI_CLK] = &gcc_ce1_axi_clk.clkr,
>   	[GCC_CE1_CLK] = &gcc_ce1_clk.clkr,
> @@ -2317,7 +2277,6 @@ static struct clk_regmap *gcc_sc7180_clocks[] = {
>   	[GCC_DISP_GPLL0_DIV_CLK_SRC] = &gcc_disp_gpll0_div_clk_src.clkr,
>   	[GCC_DISP_HF_AXI_CLK] = &gcc_disp_hf_axi_clk.clkr,
>   	[GCC_DISP_THROTTLE_HF_AXI_CLK] = &gcc_disp_throttle_hf_axi_clk.clkr,
> -	[GCC_DISP_XO_CLK] = &gcc_disp_xo_clk.clkr,
>   	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
>   	[GCC_GP1_CLK_SRC] = &gcc_gp1_clk_src.clkr,
>   	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
> @@ -2413,7 +2372,6 @@ static struct clk_regmap *gcc_sc7180_clocks[] = {
>   	[GCC_VIDEO_AXI_CLK] = &gcc_video_axi_clk.clkr,
>   	[GCC_VIDEO_GPLL0_DIV_CLK_SRC] = &gcc_video_gpll0_div_clk_src.clkr,
>   	[GCC_VIDEO_THROTTLE_AXI_CLK] = &gcc_video_throttle_axi_clk.clkr,
> -	[GCC_VIDEO_XO_CLK] = &gcc_video_xo_clk.clkr,
>   	[GPLL0] = &gpll0.clkr,
>   	[GPLL0_OUT_EVEN] = &gpll0_out_even.clkr,
>   	[GPLL6] = &gpll6.clkr,
> @@ -2510,6 +2468,9 @@ static int gcc_sc7180_probe(struct platform_device *pdev)
>   	regmap_update_bits(regmap, 0x0b004, BIT(0), BIT(0));
>   	regmap_update_bits(regmap, 0x0b008, BIT(0), BIT(0));
>   	regmap_update_bits(regmap, 0x0b00c, BIT(0), BIT(0));
> +	regmap_update_bits(regmap, 0x0b02c, BIT(0), BIT(0));
> +	regmap_update_bits(regmap, 0x0b028, BIT(0), BIT(0));
> +	regmap_update_bits(regmap, 0x0b030, BIT(0), BIT(0));

IMO, "Magic" regmap writes like these ones, even if documented, should
be avoided in this specific case, since the clocks framework accounts
for clocks that should be always-on, if provided with the right flags.

>   	regmap_update_bits(regmap, 0x71004, BIT(0), BIT(0));
> 
>   	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
> 

