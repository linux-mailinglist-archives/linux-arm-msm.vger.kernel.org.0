Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBC37571A3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231852AbiGLMoz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiGLMox (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:44:53 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE11632EE3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:44:52 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id j1-20020a17090aeb0100b001ef777a7befso1449158pjz.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QYL0SRgLUmg8BnK5Yo3lzlJ4c0o1vhFy27q1BHms55E=;
        b=M9ZOyqVnnUe1kQ1lYFItGrYNc078kUr6Am55NLN0d1kC3kIbA+ABERmQoje+GHES78
         AlnIcs/g2MpFEwNW6yLzuJipMD3yEPQs7stbk8+q8MBWP02Qgz+ZyINb8gTS8mPiiW+m
         duREQLrPy3kHmKzqDU3zfNEvKbJwvVnnsGCMPiDOxTfzNysdXYCWGhpyXyi+cj8nRbhS
         SzNwVQ+n5xTqUPo/Caxl7D/FnnVPEa5lZm5c0RCZPkpiLQzPrSkKKmwFsr3OIqRJcCxm
         nxPO1jpXd+n4kbNBbR+9KmnWfeiV3c+vEbi313WP3dPYB2DZO0tGPYywVH3wS1NsXIpi
         fjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QYL0SRgLUmg8BnK5Yo3lzlJ4c0o1vhFy27q1BHms55E=;
        b=tCPpQ2Em2SHP9ts5Yq1HxmkY7QsghJ1Q7hyDXeqjWoMC+Hq1NHPEhEf4AD0oUR/cBg
         ZEZs4Rt2pTQrNVENjYa2hjB+KESK7WP/Nevp8mK3r3EDku8u5nBEeWJcmCqAdKLFZUpo
         dAJH77pyjPUL8LOVEy2nDr9cKDJmMn7vUJsCBCcpafrXGGJ6qSo+toKzg0g2VlGZ/h+9
         UxxXa7egjdOzjrIJytIivrLInwsswuYf5q0JBVXEUjMIc4z0iTiUdFUd5jG0JhxZPJPS
         A9onGWQnsI/brp2ZhHUIrHkPzzEG9XhNBa/Bn5aEh92x6jeEaCKRGlzgov/SzCZSTXCJ
         nOaQ==
X-Gm-Message-State: AJIora8qj0SbBynGnz4Kd+3H3whEaj7pCpSK5lklirD48oxnTKTqXufS
        NgIkpC1L91N9Ft5DrOhrl263
X-Google-Smtp-Source: AGRyM1v+M5lV7lgNVXXA7ep5lugVxUMn5AWgMFlKRyd/tc8Cbi7QwigHgSxgIwlOdFq966IerhvE4g==
X-Received: by 2002:a17:90b:4c91:b0:1ef:f85b:6342 with SMTP id my17-20020a17090b4c9100b001eff85b6342mr4254301pjb.75.1657629892302;
        Tue, 12 Jul 2022 05:44:52 -0700 (PDT)
Received: from workstation ([117.207.31.14])
        by smtp.gmail.com with ESMTPSA id pi4-20020a17090b1e4400b001df264610c4sm3212648pjb.0.2022.07.12.05.44.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 05:44:51 -0700 (PDT)
Date:   Tue, 12 Jul 2022 18:14:45 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Robert Marko <robimarko@gmail.com>, bjorn.andersson@linaro.org,
        agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: make the irqchip immutable
Message-ID: <20220712124445.GC21746@workstation>
References: <20220624195112.894916-1-robimarko@gmail.com>
 <87edyq1ujr.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edyq1ujr.wl-maz@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 12, 2022 at 11:42:32AM +0100, Marc Zyngier wrote:
> On Fri, 24 Jun 2022 20:51:12 +0100,
> Robert Marko <robimarko@gmail.com> wrote:
> > 
> > Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> > immutable") added a warning to indicate if the gpiolib is altering the
> > internals of irqchips.
> > 
> > Following this change the following warning is now observed for the SPMI
> > PMIC pinctrl driver:
> > gpio gpiochip1: (200f000.spmi:pmic@0:gpio@c000): not an immutable chip, please consider fixing it!
> > 
> > Fix this by making the irqchip in the SPMI PMIC pinctrl driver immutable.
> > 
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > ---
> >  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > index c3255b0bece4..406ee0933d0b 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > @@ -171,7 +171,6 @@ struct pmic_gpio_state {
> >  	struct regmap	*map;
> >  	struct pinctrl_dev *ctrl;
> >  	struct gpio_chip chip;
> > -	struct irq_chip irq;
> >  	u8 usid;
> >  	u8 pid_base;
> >  };
> > @@ -988,6 +987,17 @@ static void *pmic_gpio_populate_parent_fwspec(struct gpio_chip *chip,
> >  	return fwspec;
> >  }
> >  
> > +static const struct irq_chip spmi_gpio_irq_chip = {
> > +	.name		= "spmi-gpio",
> > +	.irq_ack	= irq_chip_ack_parent,
> > +	.irq_mask	= irq_chip_mask_parent,
> > +	.irq_unmask	= irq_chip_unmask_parent,
> 
> No, this is wrong. Please look at the documentation to see how you
> must now directly call into the gpiolib helpers for these two
> callbacks.
> 

IIUC, you are referring to gpiochip_disable_irq() and
gpiochip_enable_irq() APIs. These APIs are supposed to let the gpiolib
know about that the IRQ usage of these GPIOs. But for the case of hierarchial
IRQ domain, isn't the parent is going to do that?

Please correct me if I'm wrong.

Thanks,
Mani

> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
