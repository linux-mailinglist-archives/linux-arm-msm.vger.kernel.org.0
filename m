Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43C2E4BC05E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Feb 2022 20:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236834AbiBRTnY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 14:43:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbiBRTnX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 14:43:23 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4CFFD5543;
        Fri, 18 Feb 2022 11:43:05 -0800 (PST)
Received: from [192.168.1.101] (abxk63.neoplus.adsl.tpnet.pl [83.9.4.63])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E5A433F941;
        Fri, 18 Feb 2022 20:42:58 +0100 (CET)
Message-ID: <b0ec7470-29f9-255b-1789-d4bd69ff34c1@somainline.org>
Date:   Fri, 18 Feb 2022 20:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v7 2/5] clk: qcom: gcc-msm8998: add SSC-related clocks
Content-Language: en-US
To:     michael.srba@seznam.cz, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220218100933.32736-1-michael.srba@seznam.cz>
 <20220218100933.32736-2-michael.srba@seznam.cz>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220218100933.32736-2-michael.srba@seznam.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18.02.2022 11:09, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> Add four clocks which need to be manipulated in order to initialize the AHB
> bus which exposes the SCC block in the global address space.
> 
> If a device is known to be configured such that writing to these
> registers from Linux is not permitted, the 'protected-clocks'
> device tree property must be used to denote that fact.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
>  CHANGES:
>  - v2: none
>  - v3: none
>  - v4: reword the commit message
>  - v5: none
>  - v6: none
>  - v7: change 'struct clk_init_data' to 'const struct clk_init_data', use imperative in commit message
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
Please use lowercase hex to keep things consistent.


> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x4300C,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data){
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
> +		.hw.init = &(const struct clk_init_data){
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
> +		.hw.init = &(const struct clk_init_data){
> +			.name = "ssc_xo_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch ssc_cnoc_ahbs_clk = {
> +	.halt_reg = 0x6300C,
And here too.


> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x6300C,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data){
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
> 
