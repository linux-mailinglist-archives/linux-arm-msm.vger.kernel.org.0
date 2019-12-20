Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B58E6128153
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 18:22:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbfLTRWR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 12:22:17 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38741 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727362AbfLTRWR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 12:22:17 -0500
Received: by mail-pl1-f193.google.com with SMTP id f20so4372797plj.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2019 09:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/2DfzHUs0wsHD/N2W+XhWHO23KTYPn9e2s28qhRJzhQ=;
        b=XjJXAYPUZ8YdDmf+jaUqlJRjgwtOxi6VMYlNPJ0TfWrt/80WfT0Y3L48ZzNOY/MWln
         N/K8E43vURX8cw47TlbrPiDraNNiygcW3fgUCCBT6COyXamPgc2aRq0S7NVcgq31Ib8h
         2BnBK804e2tsDcubk2Mm/zs6n9F/MFTOuGSfnLkZGKWUEKGnoJ9azGu1i4DjwQFIzayx
         zVlAxETeneD0V5NyJ0NURbZVrYMDXW+DaUr7yDi77bVZISgUuEyZMNdKdvjJHnDbh9R1
         ZZBqzpxjNALx+HhVBQCgthKpnXIYVa9HhRWNc0m57OlWZHY7OtwX+16kCBF7SeZVLDhD
         L8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/2DfzHUs0wsHD/N2W+XhWHO23KTYPn9e2s28qhRJzhQ=;
        b=CtldeRDodHPkL+ihNufnATfJ07VbRR6a4pXZe3cRuYXiSUGRalM1lKWtV9U/SxDDCS
         C8PHcr8QeuXlK+rHUN7gquiv2yCbs84rNtQJq++oZpw6Ur1ph5Y8hPZcqlvCOcOAZAbj
         rJyJNF3CAX0qQhx6XmSqCg5Xct0BzucaF7JGvolUeOMqyBR+D5TlWv7224s23HBYZ5h8
         mMzff6AMgktvTRqvZHdgIeIf00i4y+OFKBj5eyKj/qmFFt7mftNSON/YyS/NV3uPL5xx
         NSfZjXQWM8kQrdTh0ABypfTfWlijsTi/r7IxzE1YmmjbfAA7GJ3Hyn7qtvhlqYAvEeLZ
         Vo5g==
X-Gm-Message-State: APjAAAVE5Y5u2h11V+8aq9LiqzhhItGvyulQXGAoT33LR6Mfv8HH4ItI
        gtdiR25VZf9EHo6vDvNlxi1doQ==
X-Google-Smtp-Source: APXvYqy1FpD2j/oQp4717WQbUxL5P6k3OuBWeZGZGtqNIeNYxUs8xcXL64DHhVRvlC21gva151JhIw==
X-Received: by 2002:a17:902:b496:: with SMTP id y22mr16764859plr.158.1576862536707;
        Fri, 20 Dec 2019 09:22:16 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e9sm12572878pgn.49.2019.12.20.09.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 09:22:16 -0800 (PST)
Date:   Fri, 20 Dec 2019 09:22:06 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] clk: qcom: apcs-msm8916: use clk_parent_data to
 specify the parent
Message-ID: <20191220172206.GB1908628@ripper>
References: <20191125135910.679310-1-niklas.cassel@linaro.org>
 <20191125135910.679310-8-niklas.cassel@linaro.org>
 <20191219062339.DC0DE21582@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191219062339.DC0DE21582@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 18 Dec 22:23 PST 2019, Stephen Boyd wrote:

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
> 

Yeah, we shouldn't have two struct device with the same of_node in the
system, and your suggestion looks quite reasonable. Do you mind spinning
a patch out of it and we can drop above chunk from Niklas' patch - and
afaict merge all the remaining patches to enable CPR on our first
target!

Thanks,
Bjorn

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
