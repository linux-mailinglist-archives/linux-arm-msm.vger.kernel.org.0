Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6694EFF415
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2019 17:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbfKPQvy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Nov 2019 11:51:54 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:46577 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727949AbfKPQvy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Nov 2019 11:51:54 -0500
Received: by mail-pj1-f66.google.com with SMTP id a16so373978pjs.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Nov 2019 08:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qMrORyW5nMBpE9AKOmWgk4rweWdkIqw2wY8VYo1ZNuw=;
        b=FWLT9g4UFegz5m0n49tzVHJELmdKRgGFBqeSyhH9+FGXPuU/C8e/gyZWv7yn1tANhK
         VKM2LufO6BnJJJlwaa/d3biZEHAZC6y0q+kz7alcmYmISgt3Z1iG5CVQTS9ZMXR4EQaJ
         4BUD1Z1B1URfSHVby2nSxdFlqc3D7Wh7d2VMkoLy8h5znZJNtTYN00Hgtqw8/2i5t/rG
         OXR1OkK+OeH8Jc2DB+8ujlZmyy6XdgGLti2bk5U/wnG890y8edvyIt34wLjl3d3GUkeG
         bwH5o1LIMSvXqysFyr2A3cLDbYpUGZohilzecher/Mpb/pYMo1Ojuq38aCBUjayT+OQA
         iFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qMrORyW5nMBpE9AKOmWgk4rweWdkIqw2wY8VYo1ZNuw=;
        b=VwxyM6C8nex0DNHCSvreewhz4xkdoLe1UY4qdvJM4E6kol/zfaKrha+JNvfE+ln95g
         Icf6WpdApjViQtOf4uQJ589QDl1K27Q2XswINYWI+pOqlv3wBIJY0Vvs9gunc8O/bv+W
         3BA7bKiWPMwMb2mKhLtsIehsOJBskNdyK03BjDWdV1EHWBn7ofWFNP+e3z2aJA63Ow2N
         iTjG+w37QPWBjRs4uNzLk3JoMUTeWMsMBmCXORYS8bnz8pQ30I1YtlZF32fc0nOtMhB+
         LB9XcHcAZgqPborEy08eGmqbvGxqOHp2ZqGYVkiHXmedUqI9ZxbB0YOXGj8xCmDuCb40
         RDHw==
X-Gm-Message-State: APjAAAXHlB1a5JWcGqtGIXoV3jOQT3z0einVh8sEFB6RXkHEzUAeGzdR
        LWwapRWIBVskLpJQhMDYnTwQLQ==
X-Google-Smtp-Source: APXvYqxJB5qRcG+X9uSTKdLLV9ptpXEDL2uxLwsGNWjwy+IdDODv15+CLgU5miYSqIeiizqzRyaSOA==
X-Received: by 2002:a17:90a:a40f:: with SMTP id y15mr28378509pjp.106.1573923113464;
        Sat, 16 Nov 2019 08:51:53 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x12sm14425032pfm.130.2019.11.16.08.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2019 08:51:52 -0800 (PST)
Date:   Sat, 16 Nov 2019 08:51:50 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, jonathan@marek.ca
Subject: Re: [PATCH] clk: qcom: mmcc8974: move gfx3d_clk_src from the mmcc to
 rpm
Message-ID: <20191116165150.GB25371@yoga>
References: <20191115123931.18919-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115123931.18919-1-masneyb@onstation.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 15 Nov 04:39 PST 2019, Brian Masney wrote:

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

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

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
> -- 
> 2.21.0
> 
