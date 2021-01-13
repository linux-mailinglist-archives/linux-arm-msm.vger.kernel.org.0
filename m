Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA4BC2F4682
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 09:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbhAMIaG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 03:30:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbhAMIaF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 03:30:05 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C9EC061786
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 00:29:25 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 15so1029031pgx.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 00:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l1GKa3x7ZNgVpRkmStUdrHjbkYZ9SQFyhIcPJwTf7mQ=;
        b=mkqpTDKsvFlyxfobrl3O59d7IIHahU3PS8A71e5YzOZlHDWbI3MZUbGb7SzszcCOyu
         ra2rQP1FSmDItU3qJfiNzVtBotM4pk1nDOdIWiocpHRFBWI+S0aBNwxNh1RwdCZZ+Rwp
         vJpkXqohwYvayJKj2IWCmXCkacrtPqGcL2BHppSgchlP96jHviCQysvI7Xz+pku+moTs
         atreTPYdyRmAfTwx9WIMJwNvu78nuz7zE27UOtTVp2scjPLS4OWyMWhXb7c69SVWsYrO
         U2xkipy3HDuKbaGqqSaXPSGjU5KWEkqeeEva2ELwpPdqkTgVnAk9wEOkVC+9SXeY8dWj
         nQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l1GKa3x7ZNgVpRkmStUdrHjbkYZ9SQFyhIcPJwTf7mQ=;
        b=MEmItTZSq2JJGsQdBJWCXfqrhojjdx2yVGGnhE7w64VT0II4szvJpxNa17jb91ZdnX
         Gopzp4gIK+4A+tf7+q3jGqJvBxxNcL0Gdv03if7xsZSulpF6yNH/FeBX+nR9lQzrHHcg
         +7bYAuWoBcV1XK6ZW4nbvc0/bhjt1VJ+zuP0c7DUnwD/sOGJKV4IIvgHWlcnHdHlLj50
         LU7H43jAW4wDt6qATXuFIP+fc9iR9dOQj1sTq/Ijyf7A94LF1o2huj2s1UgHheD4bKsr
         NDCGr8qPYqBMx98DZoEWj9SApGpzsVf9ortYj795Jpq4/swAr3iBcQ7yX/fiiRYn1WDS
         eHPg==
X-Gm-Message-State: AOAM5305UbC4OQ4q2voNLfAMbfYodfZkjfZ2KZorzmPX5F1FXXhOT8j1
        fY9BzXCoZosovhiDMNQj0hN1hwQ6CdRG
X-Google-Smtp-Source: ABdhPJzhbChFX7E4odlTkqAVRn4oQYVX+m5ZecCHfZJcCca/kNL2kle2MNutGtYW7mRpy6pztpTV/w==
X-Received: by 2002:a63:ef14:: with SMTP id u20mr1076416pgh.93.1610526565041;
        Wed, 13 Jan 2021 00:29:25 -0800 (PST)
Received: from thinkpad ([2409:4072:6199:4cc7:6c7e:de01:2568:5545])
        by smtp.gmail.com with ESMTPSA id p15sm1705977pgl.19.2021.01.13.00.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 00:29:24 -0800 (PST)
Date:   Wed, 13 Jan 2021 13:59:15 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     jassisinghbrar@gmail.com, mturquette@baylibre.com,
        robh+dt@kernel.org, viresh.kumar@linaro.org,
        ulf.hansson@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/5] clk: qcom: Add SDX55 APCS clock controller support
Message-ID: <20210113082915.GB3763@thinkpad>
References: <20210108113233.75418-1-manivannan.sadhasivam@linaro.org>
 <20210108113233.75418-6-manivannan.sadhasivam@linaro.org>
 <161052342416.3661239.16154742996506371048@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161052342416.3661239.16154742996506371048@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 12, 2021 at 11:37:04PM -0800, Stephen Boyd wrote:
> Quoting Manivannan Sadhasivam (2021-01-08 03:32:33)
> > Add a driver for the SDX55 APCS clock controller. It is part of the APCS
> > hardware block, which among other things implements also a combined mux
> > and half integer divider functionality. The APCS clock controller has 3
> > parent clocks:
> > 
> > 1. Board XO
> > 2. Fixed rate GPLL0
> > 3. A7 PLL
> > 
> > The source and the divider can be set both at the same time.
> 
> I don't understand what that means. Presumably it's a mux/divider
> combined?
> 

Yeah, will make it clear.

> > 
> > This is required for enabling CPU frequency scaling on SDX55-based
> > platforms.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/clk/qcom/Kconfig      |   9 ++
> >  drivers/clk/qcom/Makefile     |   1 +
> >  drivers/clk/qcom/apcs-sdx55.c | 149 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 159 insertions(+)
> >  create mode 100644 drivers/clk/qcom/apcs-sdx55.c
> > 
> > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > index d6f4aee4427a..2c67fdfae913 100644
> > --- a/drivers/clk/qcom/Kconfig
> > +++ b/drivers/clk/qcom/Kconfig
> > @@ -45,6 +45,15 @@ config QCOM_CLK_APCS_MSM8916
> >           Say Y if you want to support CPU frequency scaling on devices
> >           such as msm8916.
> >  
> > +config QCOM_CLK_APCS_SDX55
> 
> APCC comes before APCS
> 

Okay

> > +       tristate "SDX55 APCS Clock Controller"
> > +       depends on QCOM_APCS_IPC || COMPILE_TEST
> > +       help
> > +         Support for the APCS Clock Controller on SDX55 platform. The
> > +         APCS is managing the mux and divider which feeds the CPUs.
> > +         Say Y if you want to support CPU frequency scaling on devices
> > +         such as SDX55.
> > +
> >  config QCOM_CLK_APCC_MSM8996
> >         tristate "MSM8996 CPU Clock Controller"
> >         select QCOM_KRYO_L2_ACCESSORS
> > diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> > index e7e0ac382176..a9271f40916c 100644
> > --- a/drivers/clk/qcom/Makefile
> > +++ b/drivers/clk/qcom/Makefile
> > @@ -46,6 +46,7 @@ obj-$(CONFIG_MSM_MMCC_8998) += mmcc-msm8998.o
> >  obj-$(CONFIG_QCOM_A53PLL) += a53-pll.o
> >  obj-$(CONFIG_QCOM_A7PLL) += a7-pll.o
> >  obj-$(CONFIG_QCOM_CLK_APCS_MSM8916) += apcs-msm8916.o
> > +obj-$(CONFIG_QCOM_CLK_APCS_SDX55) += apcs-sdx55.o
> >  obj-$(CONFIG_QCOM_CLK_APCC_MSM8996) += clk-cpu-8996.o
> >  obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
> >  obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
> > diff --git a/drivers/clk/qcom/apcs-sdx55.c b/drivers/clk/qcom/apcs-sdx55.c
> > new file mode 100644
> > index 000000000000..14413c957d83
> > --- /dev/null
> > +++ b/drivers/clk/qcom/apcs-sdx55.c
> > @@ -0,0 +1,149 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Qualcomm SDX55 APCS clock controller driver
> > + *
> > + * Copyright (c) 2020, Linaro Limited
> > + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/cpu.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_domain.h>
> > +#include <linux/regmap.h>
> > +#include <linux/slab.h>
> > +
> > +#include "clk-regmap.h"
> > +#include "clk-regmap-mux-div.h"
> > +#include "common.h"
> 
> Curious what common is needed for?
> 

Not needed, will remove.

> > +
> > +static const u32 apcs_mux_clk_parent_map[] = { 0, 1, 5 };
> > +
> > +static const struct clk_parent_data pdata[] = {
> > +       { .fw_name = "ref", .name = "bi_tcxo", },
> > +       { .fw_name = "aux", .name = "gpll0", },
> > +       { .fw_name = "pll", .name = "a7pll", },
> 
> Please remove name from here. It shouldn't be necessary if the DT
> describes things properly. Or there isn't DT for this device?
> 

Will remove.

> > +};
> > +
> > +/*
> > + * We use the notifier function for switching to a temporary safe configuration
> > + * (mux and divider), while the A7 PLL is reconfigured.
> > + */
> > +static int a7cc_notifier_cb(struct notifier_block *nb, unsigned long event,
> > +                           void *data)
> > +{
> > +       int ret = 0;
> > +       struct clk_regmap_mux_div *md = container_of(nb,
> > +                                                    struct clk_regmap_mux_div,
> > +                                                    clk_nb);
> > +       if (event == PRE_RATE_CHANGE)
> > +               /* set the mux and divider to safe frequency (400mhz) */
> > +               ret = mux_div_set_src_div(md, 1, 2);
> > +
> > +       return notifier_from_errno(ret);
> > +}
> > +
> > +static int qcom_apcs_sdx55_clk_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       struct device *parent = dev->parent;
> > +       struct device *cpu_dev;
> > +       struct clk_regmap_mux_div *a7cc;
> > +       struct regmap *regmap;
> > +       struct clk_init_data init = { };
> > +       int ret = -ENODEV;
> 
> Drop assignement..
> 
> > +
> > +       regmap = dev_get_regmap(parent, NULL);
> > +       if (!regmap) {
> > +               dev_err(dev, "Failed to get parent regmap: %d\n", ret);
> > +               return ret;
> 
> .. and Just return -ENODEV?
> 
> > +       }
> > +
> > +       a7cc = devm_kzalloc(dev, sizeof(*a7cc), GFP_KERNEL);
> > +       if (!a7cc)
> > +               return -ENOMEM;
> > +
> > +       init.name = "a7mux";
> > +       init.parent_data = pdata;
> > +       init.num_parents = ARRAY_SIZE(pdata);
> > +       init.ops = &clk_regmap_mux_div_ops;
> > +
> > +       a7cc->clkr.hw.init = &init;
> > +       a7cc->clkr.regmap = regmap;
> > +       a7cc->reg_offset = 0x8;
> > +       a7cc->hid_width = 5;
> > +       a7cc->hid_shift = 0;
> > +       a7cc->src_width = 3;
> > +       a7cc->src_shift = 8;
> > +       a7cc->parent_map = apcs_mux_clk_parent_map;
> > +
> > +       a7cc->pclk = devm_clk_get(parent, "pll");
> > +       if (IS_ERR(a7cc->pclk)) {
> > +               ret = PTR_ERR(a7cc->pclk);
> > +               if (ret != -EPROBE_DEFER)
> > +                       dev_err(dev, "Failed to get PLL clk: %d\n", ret);
> 
> Use dev_err_probe() please.
> 
> > +               return ret;
> > +       }
> > +
> > +       a7cc->clk_nb.notifier_call = a7cc_notifier_cb;
> > +       ret = clk_notifier_register(a7cc->pclk, &a7cc->clk_nb);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to register clock notifier: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       ret = devm_clk_register_regmap(dev, &a7cc->clkr);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to register regmap clock: %d\n", ret);
> > +               goto err;
> > +       }
> > +
> > +       ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
> > +                                         &a7cc->clkr.hw);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to add clock provider: %d\n", ret);
> > +               goto err;
> > +       }
> > +
> > +       platform_set_drvdata(pdev, a7cc);
> > +
> > +       /*
> > +        * Attach the power domain to cpudev. There seems to be no better place
> > +        * to do this, so do it here.
> > +        */
> > +       cpu_dev = get_cpu_device(0);
> > +       dev_pm_domain_attach(cpu_dev, true);
> 
> I guess this works given that we don't have CPU drivers. The comment
> says what the code is doing but doesn't say why it's doing it. Adding
> why may help understand in the future and would be a better comment.
> Why can't cpufreq-dt attach a power domain from DT for a cpu device? Is
> that a bad idea?
> 

Yeah, I talked with Viresh about using cpufreq-dt for attaching the power
domain but he said it isn't the appropriate place. Hence, I decided to use
this driver.

Will make the comment more elaborate.

Thanks,
Mani

> > +
> > +       return 0;
> > +
> > +err:
> > +       clk_notifier_unregister(a7cc->pclk, &a7cc->clk_nb);
> > +       return ret;
> > +}
