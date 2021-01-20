Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB582FDE0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 01:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbhAUAbB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 19:31:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403942AbhATXV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 18:21:57 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0340AC0617A9
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 14:40:43 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id a109so25034138otc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 14:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N0ikIRODAHgwzg5TM1HT6ZnRLm2FIQf9CYmGIK25T6w=;
        b=KQ1jsn/I1essLHW70M6MBpsmFwLFQqgLosGVhpaT0uLA7nnt4bFyYsMBk1OD4xgO5b
         SRRqFj69QI/ZFyhj67466muPotunnkZyun6hz6ZKTGDcmgq6VvpVY2men6KmNHAohxYI
         N+BYsRt5LoEdcfOjz6uEqyRaX+QSwdpMbqXCxuzahixkY1w7J/3R+d9Qt2s53G7Wxsmx
         w920G2Krt8tW3DyiJynyoiVVLdoilo/d1AqDM4qmm2iwel3M7tLYpV0ajN+dlgBK/LCL
         VHRtDpCof7DIPofChpCJ76N2z9Gq3JxzXixLND72mulltdMeLgWqsiFKdPVeUWom0c59
         FJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N0ikIRODAHgwzg5TM1HT6ZnRLm2FIQf9CYmGIK25T6w=;
        b=ew2JCp9uvQZaDEouCKv4uYZwCIrFxf0ActOL87V546wl3r9Rvgvb2qATm+Y0pfiML0
         AOXWJ0TMo/f9HsrR1rpJNSOQ6Z1+wlIXBZuAwZ5KugeSypeNZ3UzA/weor+UpzU4dBML
         l3TakIKkreuHC8bZBlv6Cb+W87B38vXwX2DHZWw00jnlz5sXs3Jg2oVBPcmwHqlqAdxw
         liH0kW+Q40pXLzHKjeabZMlRyyN8pDl6MZkmu7Y2c0P4qsFdEEs1eYpGC5w0rRgzU3Jm
         sbk1wg+DLksh6GbfdT6oOYGdKuyOzDWKwFQOo2KlYB03r/0v2XjuQvF6JcjdVXt58XnQ
         0/aA==
X-Gm-Message-State: AOAM533aG6V/jMEe4SOYeHExmuaPK9Bd2kNjiiGqzcduq770IC6AuWc6
        Ir5PsrPc2bsZcqM4xM9+9etbaw==
X-Google-Smtp-Source: ABdhPJwsr2cgr0QT6mIy0RJN43jymeoZ6Wl/xM4K83iEZuDe4nI45HO3piUIMase3XvmXirjIqH5Dg==
X-Received: by 2002:a9d:7304:: with SMTP id e4mr8490305otk.228.1611182443270;
        Wed, 20 Jan 2021 14:40:43 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n11sm681000oij.37.2021.01.20.14.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 14:40:42 -0800 (PST)
Date:   Wed, 20 Jan 2021 16:40:40 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette ? <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1] clk: qcom: gcc-sc7180: Mark the MM XO clocks to be
 always ON
Message-ID: <YAixaN6fta27XDnO@builder.lan>
References: <1611128871-5898-1-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611128871-5898-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 20 Jan 01:47 CST 2021, Taniya Das wrote:

> There are intermittent GDSC power-up failures observed for titan top
> gdsc, which requires the XO clock. Thus mark all the MM XO clocks always
> enabled from probe.
> 

But if this is the reason for keeping all these {ahb,xo}_clks critical
(or upstream just a bunch of hard coded regmap_update_bits()) why don't
we properly describe them as dependencies for the clock controller/gdsc?
I.e. by the use of pm_clk_add()?

Regards,
Bjorn

> Fixes: 8d4025943e13 ("clk: qcom: camcc-sc7180: Use runtime PM ops instead of clk ones")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/gcc-sc7180.c | 47 ++++---------------------------------------
>  1 file changed, 4 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
> index b05901b..88e896a 100644
> --- a/drivers/clk/qcom/gcc-sc7180.c
> +++ b/drivers/clk/qcom/gcc-sc7180.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2019-2021, The Linux Foundation. All rights reserved.
>   */
> 
>  #include <linux/clk-provider.h>
> @@ -919,19 +919,6 @@ static struct clk_branch gcc_camera_throttle_hf_axi_clk = {
>  	},
>  };
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
>  static struct clk_branch gcc_ce1_ahb_clk = {
>  	.halt_reg = 0x4100c,
>  	.halt_check = BRANCH_HALT_VOTED,
> @@ -1096,19 +1083,6 @@ static struct clk_branch gcc_disp_throttle_hf_axi_clk = {
>  	},
>  };
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
>  static struct clk_branch gcc_gp1_clk = {
>  	.halt_reg = 0x64000,
>  	.halt_check = BRANCH_HALT,
> @@ -2159,19 +2133,6 @@ static struct clk_branch gcc_video_throttle_axi_clk = {
>  	},
>  };
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
>  static struct clk_branch gcc_mss_cfg_ahb_clk = {
>  	.halt_reg = 0x8a000,
>  	.halt_check = BRANCH_HALT,
> @@ -2304,7 +2265,6 @@ static struct clk_regmap *gcc_sc7180_clocks[] = {
>  	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
>  	[GCC_CAMERA_HF_AXI_CLK] = &gcc_camera_hf_axi_clk.clkr,
>  	[GCC_CAMERA_THROTTLE_HF_AXI_CLK] = &gcc_camera_throttle_hf_axi_clk.clkr,
> -	[GCC_CAMERA_XO_CLK] = &gcc_camera_xo_clk.clkr,
>  	[GCC_CE1_AHB_CLK] = &gcc_ce1_ahb_clk.clkr,
>  	[GCC_CE1_AXI_CLK] = &gcc_ce1_axi_clk.clkr,
>  	[GCC_CE1_CLK] = &gcc_ce1_clk.clkr,
> @@ -2317,7 +2277,6 @@ static struct clk_regmap *gcc_sc7180_clocks[] = {
>  	[GCC_DISP_GPLL0_DIV_CLK_SRC] = &gcc_disp_gpll0_div_clk_src.clkr,
>  	[GCC_DISP_HF_AXI_CLK] = &gcc_disp_hf_axi_clk.clkr,
>  	[GCC_DISP_THROTTLE_HF_AXI_CLK] = &gcc_disp_throttle_hf_axi_clk.clkr,
> -	[GCC_DISP_XO_CLK] = &gcc_disp_xo_clk.clkr,
>  	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
>  	[GCC_GP1_CLK_SRC] = &gcc_gp1_clk_src.clkr,
>  	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
> @@ -2413,7 +2372,6 @@ static struct clk_regmap *gcc_sc7180_clocks[] = {
>  	[GCC_VIDEO_AXI_CLK] = &gcc_video_axi_clk.clkr,
>  	[GCC_VIDEO_GPLL0_DIV_CLK_SRC] = &gcc_video_gpll0_div_clk_src.clkr,
>  	[GCC_VIDEO_THROTTLE_AXI_CLK] = &gcc_video_throttle_axi_clk.clkr,
> -	[GCC_VIDEO_XO_CLK] = &gcc_video_xo_clk.clkr,
>  	[GPLL0] = &gpll0.clkr,
>  	[GPLL0_OUT_EVEN] = &gpll0_out_even.clkr,
>  	[GPLL6] = &gpll6.clkr,
> @@ -2510,6 +2468,9 @@ static int gcc_sc7180_probe(struct platform_device *pdev)
>  	regmap_update_bits(regmap, 0x0b004, BIT(0), BIT(0));
>  	regmap_update_bits(regmap, 0x0b008, BIT(0), BIT(0));
>  	regmap_update_bits(regmap, 0x0b00c, BIT(0), BIT(0));
> +	regmap_update_bits(regmap, 0x0b02c, BIT(0), BIT(0));
> +	regmap_update_bits(regmap, 0x0b028, BIT(0), BIT(0));
> +	regmap_update_bits(regmap, 0x0b030, BIT(0), BIT(0));
>  	regmap_update_bits(regmap, 0x71004, BIT(0), BIT(0));
> 
>  	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
> 
