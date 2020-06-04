Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6111EDCD3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 07:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgFDF7I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 01:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgFDF7G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 01:59:06 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 339E1C05BD43
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 22:59:06 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x11so1746287plv.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 22:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=By+Ck34N0juDcsNjVQjcVB/W81woPkNbqxwa+46XLSY=;
        b=OOqP5FVhVMo3SomJAuv8JvADgc2eXlcDFEmFY6zF6MToCByEXk8otH9JbBVBikNQYJ
         z7okGV09MZ2r2y1L0ZTdsGEHqJz4xD+0kT1Ao89YgBs4Pca580YBleh8dIlufFYpehdi
         hw+/gMEYN3MZLVDPYpgwXhqrl+7Jqc8geIRWccWa/VG8TzWuvmkQq9d/W6rgt4Kp2E9f
         euxIzsQu8ZBT4gZzXIHx/In/+otaBCaada/yP+Bg+pq87J53qrIH/zALR1OfAffYhJlE
         6hOir++6qpU9ehf8TwouMX4LDNguO7jFf2Cxh6QtlnPwo0qZl+3uaTajLadexOkUdBbT
         oOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=By+Ck34N0juDcsNjVQjcVB/W81woPkNbqxwa+46XLSY=;
        b=YlhQKkGgxNaFlB4vQWX0u9ic4BCWCGOuqtEsBVdJW/kB3u4rcZzrgNcwj/X3xLsz4p
         8+TeS1vUQrYIKiJ9zT+hY7cQf4HhXppg8TjV7mi/yU+X76Hoy9+chEOJcArOAkM6qV+w
         hkA1x/OjidKwTnn1tNLqUexs/7bTPPZbztKAEQNSw2Gmh/5VVZ0X8sZ/SfeEpT985th5
         3yu+lNN/QbI3v5k8zXs4rZt+VKp87fmVcBeLEwLNw2MrfktCsjALiqvE38bN0fjB+3aH
         blqxaJeDReGKZr8+lE8/e6wHKA/hY8xC3f3S/a53jdueTtYcG0g4deca8BUsBGpwgO9S
         ZGGw==
X-Gm-Message-State: AOAM530f8F8FsedA7VzPExTxKusHLdA3LatKZOVvyjNld9MVSMzpxMXv
        FVIXedl5vyDjIWhKzNvHNWab/sRY5w==
X-Google-Smtp-Source: ABdhPJysW9E7iGx+3UnXD1D+/8TRwPDtQ79KQc4ECiPVS7KT2m1vzuf1wg9bjAIEoeAvIWgjIeo/XQ==
X-Received: by 2002:a17:90b:91:: with SMTP id bb17mr4039465pjb.110.1591250345618;
        Wed, 03 Jun 2020 22:59:05 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e90:f3d4:c404:4d38:8396:d1ee])
        by smtp.gmail.com with ESMTPSA id w186sm3564691pff.83.2020.06.03.22.58.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 22:59:04 -0700 (PDT)
Date:   Thu, 4 Jun 2020 11:28:56 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, patches@linaro.org,
        linaro-kernel@lists.linaro.org
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: fix warning about irq chip
 reusage
Message-ID: <20200604055856.GA16719@Mani-XPS-13-9360>
References: <20200604002817.667160-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604002817.667160-1-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 04, 2020 at 03:28:17AM +0300, Dmitry Baryshkov wrote:
> Fix the following warnings caused by reusage of the same irq_chip
> instance for all spmi-gpio gpio_irq_chip instances. Instead embed
> irq_chip into pmic_gpio_state struct.
> 
> gpio gpiochip2: (c440000.qcom,spmi:pmic@2:gpio@c000): detected irqchip that is shared with multiple gpiochips: please fix the driver.
> gpio gpiochip3: (c440000.qcom,spmi:pmic@4:gpio@c000): detected irqchip that is shared with multiple gpiochips: please fix the driver.
> gpio gpiochip4: (c440000.qcom,spmi:pmic@a:gpio@c000): detected irqchip that is shared with multiple gpiochips: please fix the driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index fe0be8a6ebb7..092a48e4dff5 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -170,6 +170,7 @@ struct pmic_gpio_state {
>  	struct regmap	*map;
>  	struct pinctrl_dev *ctrl;
>  	struct gpio_chip chip;
> +	struct irq_chip irq;
>  };
>  
>  static const struct pinconf_generic_params pmic_gpio_bindings[] = {
> @@ -917,16 +918,6 @@ static int pmic_gpio_populate(struct pmic_gpio_state *state,
>  	return 0;
>  }
>  
> -static struct irq_chip pmic_gpio_irq_chip = {
> -	.name = "spmi-gpio",
> -	.irq_ack = irq_chip_ack_parent,
> -	.irq_mask = irq_chip_mask_parent,
> -	.irq_unmask = irq_chip_unmask_parent,
> -	.irq_set_type = irq_chip_set_type_parent,
> -	.irq_set_wake = irq_chip_set_wake_parent,
> -	.flags = IRQCHIP_MASK_ON_SUSPEND,
> -};
> -
>  static int pmic_gpio_domain_translate(struct irq_domain *domain,
>  				      struct irq_fwspec *fwspec,
>  				      unsigned long *hwirq,
> @@ -1053,8 +1044,16 @@ static int pmic_gpio_probe(struct platform_device *pdev)
>  	if (!parent_domain)
>  		return -ENXIO;
>  
> +	state->irq.name = "spmi-gpio",
> +	state->irq.irq_ack = irq_chip_ack_parent,
> +	state->irq.irq_mask = irq_chip_mask_parent,
> +	state->irq.irq_unmask = irq_chip_unmask_parent,
> +	state->irq.irq_set_type = irq_chip_set_type_parent,
> +	state->irq.irq_set_wake = irq_chip_set_wake_parent,
> +	state->irq.flags = IRQCHIP_MASK_ON_SUSPEND,
> +
>  	girq = &state->chip.irq;
> -	girq->chip = &pmic_gpio_irq_chip;
> +	girq->chip = &state->irq;
>  	girq->default_type = IRQ_TYPE_NONE;
>  	girq->handler = handle_level_irq;
>  	girq->fwnode = of_node_to_fwnode(state->dev->of_node);
> -- 
> 2.26.2
> 
