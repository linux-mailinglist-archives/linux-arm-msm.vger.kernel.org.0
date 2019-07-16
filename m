Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A65B6A137
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2019 06:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfGPEKk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jul 2019 00:10:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:47282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726431AbfGPEKk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jul 2019 00:10:40 -0400
Received: from localhost (unknown [122.178.232.136])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6943420880;
        Tue, 16 Jul 2019 04:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563250238;
        bh=ce0l69Vib0qb8sOVdUFH1gN8HsfLaPLMAq6SklDqDcc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o6zfrofUCgF/vKqeZknzUeBl3TYeXuMD1DZn145KIkkdYm+dOqDGITnSM5YDrZogr
         EXSMRyt2sk9KqPFxdpRneWYWsaEGfMfQP904MUGyQQaxbe2c45A7G24+JzqliqGkb/
         NYR4h/GQkNGCVzlPMNgVvo8ysZD1GvpYnVKely8g=
Date:   Tue, 16 Jul 2019 09:37:28 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v3 3/3] clk: qcom: gcc: Add global clock controller
 driver for SM8150
Message-ID: <20190716040728.GA12733@vkoul-mobl.Dlink>
References: <20190625063140.17106-1-vkoul@kernel.org>
 <20190625063140.17106-4-vkoul@kernel.org>
 <20190627213151.B94FA20B7C@mail.kernel.org>
 <20190629135119.GF2911@vkoul-mobl>
 <20190715230129.CBE4220693@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190715230129.CBE4220693@mail.kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-07-19, 16:01, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-06-29 06:51:19)
> > On 27-06-19, 14:31, Stephen Boyd wrote:
> > > Quoting Vinod Koul (2019-06-24 23:31:40)
> > > > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > > > index 18bdf34d5e64..076872d195fd 100644
> > > > --- a/drivers/clk/qcom/Kconfig
> > > > +++ b/drivers/clk/qcom/Kconfig
> > > > @@ -291,6 +291,13 @@ config SDM_LPASSCC_845
> > > >           Say Y if you want to use the LPASS branch clocks of the LPASS clock
> > > >           controller to reset the LPASS subsystem.
> > > >  
> > > > +config SM_GCC_8150
> > > > +       tristate "SM8150 Global Clock Controller"
> > > > +       help
> > > > +         Support for the global clock controller on SM8150 devices.
> > > > +         Say Y if you want to use peripheral devices such as UART,
> > > > +         SPI, I2C, USB, SD/eMMC, PCIe etc.
> > > 
> > > Is there eMMC support?
> 
> I guess no?

Nope, copy paste error, have fixed it up :)

> 
> > > > diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> > > > index f0768fb1f037..4a813b4055d0 100644
> > > > --- a/drivers/clk/qcom/Makefile
> > > > +++ b/drivers/clk/qcom/Makefile
> > > > @@ -50,6 +50,7 @@ obj-$(CONFIG_SDM_GCC_845) += gcc-sdm845.o
> > > >  obj-$(CONFIG_SDM_GPUCC_845) += gpucc-sdm845.o
> > > >  obj-$(CONFIG_SDM_LPASSCC_845) += lpasscc-sdm845.o
> > > >  obj-$(CONFIG_SDM_VIDEOCC_845) += videocc-sdm845.o
> > > > +obj-$(CONFIG_SM_GCC_8150) += gcc-sm8150.o
> > > >  obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
> > > >  obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
> > > >  obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
> > > > diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> > > > new file mode 100644
> > > > index 000000000000..11cd9e19f18d
> > > > --- /dev/null
> > > > +++ b/drivers/clk/qcom/gcc-sm8150.c
> > > > +static const struct clk_parent_data gcc_parents_5[] = {
> > > > +       { .fw_name = "bi_tcxo", .name = "bi_tcxo" },
> > > > +       { .fw_name = "gpll0", .name = "gpll0" },
> > > > +       { .fw_name = "gpll7", .name = "gpll7" },
> > > > +       { .fw_name = "gpll0_out_even", .name = "gpll0_out_even" },
> > > 
> > > Aren't these gplls all created in this file? They shouldn't be listed in
> > > DT so I'm confused why we have .fw_name for them.
> > 
> > Yes they are and the DT doesnt provide these clock. From what I
> > understood from the name conversion to new schema was we should add it
> > like above, let me know if I missed something
> > 
> 
> Yes, you should use the direct clk_hw pointer part of the
> clk_parent_data structure instead of having a .fw_name or .name member
> in these rows. Any clk inside of the clk controller shouldn't be exposed
> into DT just so that we can find it again through string comparisons.

Thanks, I think I have fixed it up. The parent clk in DT would be cxo
and sleep_clk and creating bi_tcxo,  gpll0, gpll7 etc in driver

I have updated the patchset and will post shortly

Thanks
-- 
~Vinod
