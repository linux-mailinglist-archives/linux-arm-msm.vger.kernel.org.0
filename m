Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB932A79A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 09:51:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725320AbgKEIv5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 03:51:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbgKEIv4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 03:51:56 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0611C0613D2
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 00:51:56 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id j5so457629plk.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 00:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=U86zsRZz8d5Flk+rPp0LVqAujZ6VjSA2pha2tzioGvk=;
        b=rEez1yKcQYQhkZORMRIkrTy3RK+jbRX4lyJHrib74Ug42FO/TezyN5+uoFqBgzHZrn
         K7NQevHN1tIN6chpeMbT5fEQ42ZbjlxTPpg6CrWmVv7nR93OiXosyZ3y6WdM08aPb97K
         cBun1cZu2wFKJSnjRYJFNrK0vbPLKuOYyC7T8mEGUlNAQIJR/Pz3YM6Qt9+45Nz0tMzT
         wRevH1/v2pAnuDg46g0uklXvdKnEXSqiKsGWarD+HGLNXCm7R16IzfmRi+L4S0+791Aq
         sW2lhZ0sPbjNu+jWTg1U89kFlLtemVHO15wzH77g51Sv/twXMzyfMz2nfsFcGTD73xaY
         Ko2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=U86zsRZz8d5Flk+rPp0LVqAujZ6VjSA2pha2tzioGvk=;
        b=IDc7dG1V30+68VoWx9uBpaa5kVR1QBepeTLeKy/ksX3mI0PvhFVZf+FTedspBfZMRM
         jw60XItES6wvY4cX8h1jx5CrbgxrKDOUhyztHgzpTujiNYkr6lfEOBGChOY9TRX+tvrB
         PhewFlIncJLWQocD6wGLYqNqeQdumfV/ETFhrzMaXiithNV+rulhGxBhixRrSBRuuerU
         1OFPvgRi5JkWQBbT1KfmVe24MTzw87meChwlA/wTkzBsgqxITQK2EidpSBJHtMNYHG7L
         n4MQqEynlhVICA1ujzSre6hWF2VhG0GWWgUijYZliEqYKhC/kRqkt22seFUoscHBN8J7
         YrhA==
X-Gm-Message-State: AOAM532ObbGl+vHMWnjLmF96a5P1/HO0XuhQLdXHtqslE+zZsgyuJ+92
        xpqd7uYkK2SB2WyumUOSFjpt
X-Google-Smtp-Source: ABdhPJzCIYYo7BNJGhfadLXCeNuuF+K4SlRBiuje284Tx9XMXq7Un6Yd5U8LCBR/ZwWKbFO1Sbczfw==
X-Received: by 2002:a17:902:780f:b029:d6:3413:9fe8 with SMTP id p15-20020a170902780fb02900d634139fe8mr1410668pll.46.1604566315717;
        Thu, 05 Nov 2020 00:51:55 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id d18sm1524148pfo.133.2020.11.05.00.51.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Nov 2020 00:51:54 -0800 (PST)
Date:   Thu, 5 Nov 2020 14:21:48 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naveen Yadav <naveenky@codeaurora.org>
Subject: Re: [PATCH 2/4] clk: qcom: Add SDX55 GCC support
Message-ID: <20201105085148.GA7308@work>
References: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org>
 <20201028074232.22922-3-manivannan.sadhasivam@linaro.org>
 <160454301723.3965362.9504622582275389041@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160454301723.3965362.9504622582275389041@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 04, 2020 at 06:23:37PM -0800, Stephen Boyd wrote:
> Quoting Manivannan Sadhasivam (2020-10-28 00:42:30)
> > From: Naveen Yadav <naveenky@codeaurora.org>
> > 
> > Add Global Clock Controller (GCC) support for SDX55 SoCs from Qualcomm.
> > 
> > Signed-off-by: Naveen Yadav <naveenky@codeaurora.org>
> > [mani: converted to parent_data, commented critical clocks, cleanups]
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/clk/qcom/Kconfig     |    8 +
> >  drivers/clk/qcom/Makefile    |    1 +
> >  drivers/clk/qcom/gcc-sdx55.c | 1667 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 1676 insertions(+)
> >  create mode 100644 drivers/clk/qcom/gcc-sdx55.c
> > 
> > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > index 3a965bd326d5..dbca8debc06f 100644
> > --- a/drivers/clk/qcom/Kconfig
> > +++ b/drivers/clk/qcom/Kconfig
> > @@ -502,4 +502,12 @@ config KRAITCC
> >           Support for the Krait CPU clocks on Qualcomm devices.
> >           Say Y if you want to support CPU frequency scaling.
> >  
> > +config GCC_SDX55
> 
> Please sort instead of add at end.
> 
> > +       tristate "SDX55 Global Clock Controller"
> > +       depends on ARM
> 
> Why?
> 

Not needed, will remove.

> > +       help
> > +         Support for the global clock controller on SDX55 devices.
> > +         Say Y if you want to use peripheral devices such as UART,
> > +         SPI, I2C, USB, SD/UFS, PCIe etc.
> > +
> >  endif
> > diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> > index 11ae86febe87..3e27d67f95aa 100644
> > --- a/drivers/clk/qcom/Makefile
> > +++ b/drivers/clk/qcom/Makefile
> > @@ -75,3 +75,4 @@ obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
> >  obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
> >  obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
> >  obj-$(CONFIG_KRAITCC) += krait-cc.o
> > +obj-$(CONFIG_GCC_SDX55) += gcc-sdx55.o
> 
> Please sort this instead of add at end.
> 
> > diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
> > new file mode 100644
> > index 000000000000..75831c829202
> > --- /dev/null
> > +++ b/drivers/clk/qcom/gcc-sdx55.c
> > @@ -0,0 +1,1667 @@
> > +

[...]

> > +static const struct clk_div_table post_div_table_lucid_even[] = {
> > +       { 0x0, 1 },
> > +       { 0x1, 2 },
> > +       { 0x3, 4 },
> > +       { 0x7, 8 },
> > +       { }
> > +};
> 
> I think this table is common to all lucid plls? Maybe we can push it
> into the clk_ops somehow and stop duplicating it here?
> 

Are you referring to lucid plls in this driver? Because, this table is
not common for other SoCs. And I don't think having this way introduces
any overhead, so I'd prefer keeping it as it is.

> > +
> > +static struct clk_alpha_pll_postdiv gpll0_out_even = {
> > +       .offset = 0x0,
> > +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> > +       .post_div_shift = 8,
> > +       .post_div_table = post_div_table_lucid_even,
> > +       .num_post_div = ARRAY_SIZE(post_div_table_lucid_even),
> > +       .width = 4,
> > +       .clkr.hw.init = &(struct clk_init_data){
> > +               .name = "gpll0_out_even",
> > +               .parent_data = &(const struct clk_parent_data){
> > +                       .fw_name = "gpll0",
> > +               },
> 
> If this is gpll0 in this file, then this should be a clk_hws pointer
> instead and directly pointing to the parent.
> 

Ack

> > +               .num_parents = 1,
> > +               .ops = &clk_alpha_pll_postdiv_lucid_ops,
> > +       },
> > +};
> > +
> > +static struct clk_alpha_pll gpll4 = {
> > +       .offset = 0x76000,
> > +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> > +       .vco_table = lucid_vco,
> > +       .num_vco = ARRAY_SIZE(lucid_vco),
> > +       .clkr = {
> > +               .enable_reg = 0x6d000,
> > +               .enable_mask = BIT(4),
> > +               .hw.init = &(struct clk_init_data){
> > +                       .name = "gpll4",
> > +                       .parent_data = &(const struct clk_parent_data){
> > +                               .fw_name = "bi_tcxo",
> > +                       },
> > +                       .num_parents = 1,
> > +                       .ops = &clk_alpha_pll_fixed_lucid_ops,
> > +               },
> > +       },
> > +};
> > +
> > +static struct clk_alpha_pll_postdiv gpll4_out_even = {
> > +       .offset = 0x76000,
> > +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> > +       .post_div_shift = 8,
> > +       .post_div_table = post_div_table_lucid_even,
> > +       .num_post_div = ARRAY_SIZE(post_div_table_lucid_even),
> > +       .width = 4,
> > +       .clkr.hw.init = &(struct clk_init_data){
> > +               .name = "gpll4_out_even",
> > +               .parent_data = &(const struct clk_parent_data){
> > +                       .fw_name = "gpll4",
> 
> If this is gpll4 in this file, then this should be a clk_hws pointer
> instead and directly pointing to the parent.
> 

Ack

> > +               },
> > +               .num_parents = 1,
> > +               .ops = &clk_alpha_pll_postdiv_lucid_ops,
> > +       },
> > +};
> > +

[...]

> > +/* For CPUSS functionality the SYS NOC clock needs to be left enabled */
> > +static struct clk_branch gcc_sys_noc_cpuss_ahb_clk = {
> > +       .halt_reg = 0x4010,
> > +       .halt_check = BRANCH_HALT_VOTED,
> > +       .clkr = {
> > +               .enable_reg = 0x6d008,
> > +               .enable_mask = BIT(0),
> > +               .hw.init = &(struct clk_init_data){
> > +                       .name = "gcc_sys_noc_cpuss_ahb_clk",
> > +                       .parent_hws = (const struct clk_hw *[]){
> > +                               &gcc_cpuss_ahb_clk_src.clkr.hw },
> > +                       .num_parents = 1,
> > +                       .flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
> 
> These CLK_IS_CRITICAL clks can't be set once at driver probe time and
> forgotten about? It would be nice to not allocate memory for things that
> never matter.
> 

Makes sense! But are we moving into the direction of deprecating the use
of CLK_IS_CRITICAL?

> > +                       .ops = &clk_branch2_ops,
> > +               },
> > +       },
> > +};
> > +
> > +static struct clk_branch gcc_usb30_master_clk = {
> > +       .halt_reg = 0xb010,
> > +       .halt_check = BRANCH_HALT,
> > +       .clkr = {
> > +               .enable_reg = 0xb010,
> > +               .enable_mask = BIT(0),
> > +               .hw.init = &(struct clk_init_data){
> > +                       .name = "gcc_usb30_master_clk",
> > +                       .parent_hws = (const struct clk_hw *[]){
> > +                               &gcc_usb30_master_clk_src.clkr.hw },
> > +                       .num_parents = 1,
> > +                       .flags = CLK_SET_RATE_PARENT,
> > +                       .ops = &clk_branch2_ops,
> [...]
> > +
> > +static const struct qcom_cc_desc gcc_sdx55_desc = {
> > +       .config = &gcc_sdx55_regmap_config,
> > +       .clks = gcc_sdx55_clocks,
> > +       .num_clks = ARRAY_SIZE(gcc_sdx55_clocks),
> > +       .resets = gcc_sdx55_resets,
> > +       .num_resets = ARRAY_SIZE(gcc_sdx55_resets),
> 
> No gdscs?
> 

This will come at later point.

> > +};
> > +
> > +static const struct of_device_id gcc_sdx55_match_table[] = {
> > +       { .compatible = "qcom,gcc-sdx55" },
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(of, gcc_sdx55_match_table);
> > +
> > +static int gcc_sdx55_probe(struct platform_device *pdev)
> > +{
> > +       return qcom_cc_probe(pdev, &gcc_sdx55_desc);
> 
> Wow haven't seen this in some time. There isn't some sort of PLL that
> needs configuring or some clks that need to be slammed on with a couple
> register writes?
> 

Nothing as per the downstream driver. Actually the downstream just sets
the rate of few clocks but I don't find them useful at the moment. So,
dropped the change.

Thanks,
Mani

> > +}
> > +
