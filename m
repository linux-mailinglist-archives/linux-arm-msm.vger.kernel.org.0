Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0DF11281B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 18:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbfLTR4W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 12:56:22 -0500
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:37590 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727413AbfLTR4W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 12:56:22 -0500
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 28CC93F4AC;
        Fri, 20 Dec 2019 18:56:19 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=flawful.org header.i=@flawful.org header.b="PDKt/T2C";
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Ae1RvXHghbKa; Fri, 20 Dec 2019 18:56:18 +0100 (CET)
Received: from flawful.org (ua-84-217-220-205.bbcust.telenor.se [84.217.220.205])
        (Authenticated sender: mb274189)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 8BF2C3F368;
        Fri, 20 Dec 2019 18:56:17 +0100 (CET)
Received: by flawful.org (Postfix, from userid 1001)
        id A1258778; Fri, 20 Dec 2019 18:56:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flawful.org; s=mail;
        t=1576864576; bh=8sfDuMtRxJ8hPMJm3nR5BkYWmVNNN3yvCkmGXMpZi9s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PDKt/T2CXsxsVk/B7xteB3rEODwWfnt1Z3AQQ8VW5CW56tAsjMG3UX7xHLBSSesga
         e22DOblEzyXbxayHv6vucp3pDon2WykIdXZut+D0Oz1QO+eJvBVNWono8Fh+MQLS46
         aTzaWCU6dQqT/ywzY1FZo4kng5SOZlKV6IK6s8yM=
Date:   Fri, 20 Dec 2019 18:56:16 +0100
From:   Niklas Cassel <nks@flawful.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] clk: qcom: apcs-msm8916: use clk_parent_data to
 specify the parent
Message-ID: <20191220175616.3wdslb7hm773zb22@flawful.org>
References: <20191125135910.679310-1-niklas.cassel@linaro.org>
 <20191125135910.679310-8-niklas.cassel@linaro.org>
 <20191219062339.DC0DE21582@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191219062339.DC0DE21582@mail.kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 18, 2019 at 10:23:39PM -0800, Stephen Boyd wrote:
> Quoting Niklas Cassel (2019-11-25 05:59:09)
> > diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
> > index 46061b3d230e..bb91644edc00 100644
> > --- a/drivers/clk/qcom/apcs-msm8916.c
> > +++ b/drivers/clk/qcom/apcs-msm8916.c
> > @@ -51,6 +51,19 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
> >         struct clk_init_data init = { };
> >         int ret = -ENODEV;
> >  
> > +       /*
> > +        * This driver is defined by the devicetree binding
> > +        * Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt,
> > +        * however, this driver is registered as a platform device by
> > +        * qcom-apcs-ipc-mailbox.c. Because of this, when this driver
> > +        * uses dev_get_regmap() and devm_clk_get(), it has to send the parent
> > +        * device as argument.
> > +        * When registering with the clock framework, we cannot use this trick,
> > +        * since the clock framework always looks at dev->of_node when it tries
> > +        * to find parent clock names using clk_parent_data.
> > +        */
> > +       dev->of_node = parent->of_node;
> 
> This is odd. The clks could be registered with of_clk_hw_register() but
> then we lose the device provider information. Maybe we should search up
> one level to the parent node and if that has a DT node but the
> clk controller device doesn't we should use that instead?

Hello Stephen,

Having this in the clk core is totally fine with me,
since it solves my problem.

Will you cook up a patch, or do you want me to do it?

Kind regards,
Niklas

> 
> ----8<-----
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index b68e200829f2..c8745c415c04 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3669,7 +3669,7 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
>  	if (dev && pm_runtime_enabled(dev))
>  		core->rpm_enabled = true;
>  	core->dev = dev;
> -	core->of_node = np;
> +	core->of_node = np ? : dev_of_node(dev->parent);
>  	if (dev && dev->driver)
>  		core->owner = dev->driver->owner;
>  	core->hw = hw;
