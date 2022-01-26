Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 823D249C22E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 04:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbiAZDgo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jan 2022 22:36:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbiAZDgo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jan 2022 22:36:44 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E214C06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 19:36:43 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id p203so18760759oih.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 19:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VG/REmNYFs8bhsKXCSAuBru7SObV38RHtdJqUNmAFro=;
        b=NsBN3Gaw761RJyAafRSwP5L617daZObcfY/EQgQeoHX//pIpR4UYR9gi7tdO8ub9Bw
         UiV7V40wzvDctD+g3GIhI7e0To5S5Yx3Re5iVMcX7puwxC2fQoKE4emJh/8S/KrsuW3t
         nEN+haKx8sB2+YbJtmEa6sd1I2/opzs+MMwfxyNjrdf5cgM5Gfpw1kWzZRD7zq6dqTMU
         KAVPtCSe/XEnlgIWKUYn4PsZqh3ZiZEFl2WqwcKKIm0Bby8uwj8ZsHPANg63SOeFP2E1
         maE4tbbc9VwRbQhLzi1Kucm7/lNzEy6Mf1CeS7R9LfMjFcDiQdyMRR7yGhsWV8QOH1ro
         DxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VG/REmNYFs8bhsKXCSAuBru7SObV38RHtdJqUNmAFro=;
        b=OsP5c+TEeZ/7fKGQaSwKPnQ33cxZ0JGJdCk5b3HMThvxO06vgZUt0XyMERebDDqM5T
         73kLxlW4FtE6OllbAF4OM71QRHPyS0cFN1MtEVRgZ9IfKr8g6QkpH+Mz7JAJ+jts6gb5
         ybe3D8kBzRntIfAbEBKEUYFYLUOsFJcNuEarIhIiTYkpVdswTOD+XUy6KYC1owBqCZi6
         c78mxrnNdawgr00NoHM7TgtXbYjlBKgh4JmpdradAS0LTTTzU1OM+HLVbDjvKdDL6tP2
         0jcesyb9E3hZHp7YBs0YQpbf28Km6FIxab2yC0hQSopYV2M+MLZDeqkj20rw6ZPxfRXZ
         E5rw==
X-Gm-Message-State: AOAM531D0o5RMTt474jA9UGKGUQign1fy6eYei37ukr3K96RG09/eyuR
        i1tGwKmEFY05mZnm7ZxFhoVQVQ==
X-Google-Smtp-Source: ABdhPJyvcAS1QUxOmNKXtl9N9GHgH4+9eZ/3YKrSkHRUslMb2r2IzXejM4aw3Fp3vP0NrdW8xGQawQ==
X-Received: by 2002:a05:6808:1485:: with SMTP id e5mr2896160oiw.214.1643168202502;
        Tue, 25 Jan 2022 19:36:42 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id i81sm6087180oih.22.2022.01.25.19.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 19:36:41 -0800 (PST)
Date:   Tue, 25 Jan 2022 21:36:40 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     michael.srba@seznam.cz
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/5] clk: qcom: gcc-msm8998: add SSC-related clocks
Message-ID: <YfDByGjf90xDUuly@builder.lan>
References: <20220124121853.23600-1-michael.srba@seznam.cz>
 <20220124121853.23600-2-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124121853.23600-2-michael.srba@seznam.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 24 Jan 06:18 CST 2022, michael.srba@seznam.cz wrote:

> From: Michael Srba <Michael.Srba@seznam.cz>
> 
>  This patch adds four clocks which need to be manipulated in order to

Please skip the space on the start of each line here.

>  initialize the AHB bus which exposes the SCC block in the global address
>  space.
> 
>  Care should be taken not to write to these registers unless the device is
>  known to be configured such that writing to these registers from Linux
>  is permitted.

Does this imply that applying this will break the existing devices and
care _must_ be taken, presumably before we can apply the patch?

Regards,
Bjorn

> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
>  CHANGES:
>  - v2: none
>  - v3: none
> ---
>  drivers/clk/qcom/gcc-msm8998.c | 56 ++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
> index 407e2c5caea4..2d14c3d672fc 100644
> --- a/drivers/clk/qcom/gcc-msm8998.c
> +++ b/drivers/clk/qcom/gcc-msm8998.c
> @@ -2833,6 +2833,58 @@ static struct clk_branch gcc_rx1_usb2_clkref_clk = {
>  	},
>  };
>  
> +static struct clk_branch gcc_im_sleep_clk = {
> +	.halt_reg = 0x4300C,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x4300C,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_im_sleep_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch aggre2_snoc_north_axi_clk = {
> +	.halt_reg = 0x83010,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x83010,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "aggre2_snoc_north_axi_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch ssc_xo_clk = {
> +	.halt_reg = 0x63018,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x63018,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "ssc_xo_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch ssc_cnoc_ahbs_clk = {
> +	.halt_reg = 0x6300C,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x6300C,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "ssc_cnoc_ahbs_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>  static struct gdsc pcie_0_gdsc = {
>  	.gdscr = 0x6b004,
>  	.gds_hw_ctrl = 0x0,
> @@ -3036,6 +3088,10 @@ static struct clk_regmap *gcc_msm8998_clocks[] = {
>  	[GCC_MSS_MNOC_BIMC_AXI_CLK] = &gcc_mss_mnoc_bimc_axi_clk.clkr,
>  	[GCC_MMSS_GPLL0_CLK] = &gcc_mmss_gpll0_clk.clkr,
>  	[HMSS_GPLL0_CLK_SRC] = &hmss_gpll0_clk_src.clkr,
> +	[GCC_IM_SLEEP] = &gcc_im_sleep_clk.clkr,
> +	[AGGRE2_SNOC_NORTH_AXI] = &aggre2_snoc_north_axi_clk.clkr,
> +	[SSC_XO] = &ssc_xo_clk.clkr,
> +	[SSC_CNOC_AHBS_CLK] = &ssc_cnoc_ahbs_clk.clkr,
>  };
>  
>  static struct gdsc *gcc_msm8998_gdscs[] = {
> -- 
> 2.34.1
> 
