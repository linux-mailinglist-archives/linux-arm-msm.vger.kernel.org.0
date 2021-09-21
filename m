Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD7E413AFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 21:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbhIUTvI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 15:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbhIUTvI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 15:51:08 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E23BC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 12:49:39 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so70396otq.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 12:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VHde+Z8t26uFITFPoKY2bMQ3Dm1wYLY2z2EvcHcAJ4s=;
        b=iTkfr/b5+uvqjo+MYmQ8eM1zYcx0x1YH1BaXsQbYfPtGQLJqiB1pJV0tSC61Vk3noE
         gCTUjVA+9GiqsVqGm+sSqoQucwC96oRZgQOcBPMgBC7VtWGggM3wMOx/XEHTItbtOSKl
         UIi+I9v9flpBjyYw5ZAsYjfjsKUahZuYDb5jXcsJz4v2wFzBcZII0WSqPfKxzKEXcCSs
         dNdqriCFSRiu7CC1iLpew2oooj/6DNsQQLWM4DI7EwfV5XffwLfe+l4iHH+HLyPcnVqf
         cbkK682jeK8lZJn/05iqad2xkyV3gMU1lyaQprSw2rmYlDwrYM1benhqGn1yJnn6S1LZ
         czyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VHde+Z8t26uFITFPoKY2bMQ3Dm1wYLY2z2EvcHcAJ4s=;
        b=VChbq4pTFU+9Eed8QQB2SPMoJG6IogsDWkZq3Ydt8RaIKSeGFV1sVRXXmZLG8DkOxK
         uIvbYYMKNfsZ1jLnw12yJhAV+/wp6UVwvl2t1izr+vxRWgF4EYlz7oH6uNt6zATBHZ+P
         hYmuUci1txNC0yC/zHZVGsBziJz7dnJVoZ+NrnJXFbFDpCb2ARXYzENw6CxY5CxqXof0
         r3FyIj0wjNZsshm1Ox546ljAo6OcRgr4P2eo9yDeL1wmg/o/ZdEL5/OBLKTK9J3cEdui
         KamcKJEEiKz8z+5RQOGYdsDeFFa83449qvQ4AbeMJzHgNSKGPNN7nClvTssOtt1YymMX
         xc/Q==
X-Gm-Message-State: AOAM530QuNWET3c6mWIK1CIBhyEBvT4WJFpUcMR72+l9SHqqSda85VOf
        ybyBqZaBk/ccTTb6foswfdrh6A==
X-Google-Smtp-Source: ABdhPJxz+q53AQ7BCCAXjiFRdSnqdb0ZSyOVaziSEZVJ7XNPz4zPUEL4EDu9wPOQP4VXCGG587IrSQ==
X-Received: by 2002:a9d:6f10:: with SMTP id n16mr27354820otq.150.1632253778664;
        Tue, 21 Sep 2021 12:49:38 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y9sm3002ooe.10.2021.09.21.12.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 12:49:38 -0700 (PDT)
Date:   Tue, 21 Sep 2021 14:49:36 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] mfd: qcom-pm8xxx: switch away from using chained IRQ
 handlers
Message-ID: <YUo3UGfbdbuXrOyy@builder.lan>
References: <20210921162433.1858296-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921162433.1858296-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 21 Sep 11:24 CDT 2021, Dmitry Baryshkov wrote:

> PM8xxx PMIC family uses GPIO as parent IRQ. Using it together with the
> irq_set_chained_handler_and_data() results in warnings from the GPIOLIB
> as in this path the IRQ resources are not allocated (and thus the
> corresponding GPIO is not marked as used for the IRQ. Use request_irq so
> that the IRQ resources are proprely setup.
> 

It's been a while since I booted a platform with ssbi PMIC (i.e. 8064
and older), but I don't remember ever seeing a warning.

Can you please include in the commit message what warning this is and
perhaps a reference to what in GPIOLIB changed to introduce this - in
particular so that this fix can be found when people are searching the
archive looking for similar issues.


And I think it would be nice to Cc Linus Walleij.


Change looks good though, so please update the commit message and add
my:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/mfd/qcom-pm8xxx.c | 39 ++++++++++++++++-----------------------
>  1 file changed, 16 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
> index ec18a04de355..2f2734ba5273 100644
> --- a/drivers/mfd/qcom-pm8xxx.c
> +++ b/drivers/mfd/qcom-pm8xxx.c
> @@ -65,7 +65,7 @@
>  struct pm_irq_data {
>  	int num_irqs;
>  	struct irq_chip *irq_chip;
> -	void (*irq_handler)(struct irq_desc *desc);
> +	irq_handler_t irq_handler;
>  };
>  
>  struct pm_irq_chip {
> @@ -169,19 +169,16 @@ static int pm8xxx_irq_master_handler(struct pm_irq_chip *chip, int master)
>  	return ret;
>  }
>  
> -static void pm8xxx_irq_handler(struct irq_desc *desc)
> +static irqreturn_t pm8xxx_irq_handler(int irq, void *data)
>  {
> -	struct pm_irq_chip *chip = irq_desc_get_handler_data(desc);
> -	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
> +	struct pm_irq_chip *chip = data;
>  	unsigned int root;
>  	int	i, ret, masters = 0;
>  
> -	chained_irq_enter(irq_chip, desc);
> -
>  	ret = regmap_read(chip->regmap, SSBI_REG_ADDR_IRQ_ROOT, &root);
>  	if (ret) {
>  		pr_err("Can't read root status ret=%d\n", ret);
> -		return;
> +		return IRQ_NONE;
>  	}
>  
>  	/* on pm8xxx series masters start from bit 1 of the root */
> @@ -192,7 +189,7 @@ static void pm8xxx_irq_handler(struct irq_desc *desc)
>  		if (masters & (1 << i))
>  			pm8xxx_irq_master_handler(chip, i);
>  
> -	chained_irq_exit(irq_chip, desc);
> +	return IRQ_HANDLED;
>  }
>  
>  static void pm8821_irq_block_handler(struct pm_irq_chip *chip,
> @@ -230,19 +227,17 @@ static inline void pm8821_irq_master_handler(struct pm_irq_chip *chip,
>  			pm8821_irq_block_handler(chip, master, block);
>  }
>  
> -static void pm8821_irq_handler(struct irq_desc *desc)
> +static irqreturn_t pm8821_irq_handler(int irq, void *data)
>  {
> -	struct pm_irq_chip *chip = irq_desc_get_handler_data(desc);
> -	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
> +	struct pm_irq_chip *chip = data;
>  	unsigned int master;
>  	int ret;
>  
> -	chained_irq_enter(irq_chip, desc);
>  	ret = regmap_read(chip->regmap,
>  			  PM8821_SSBI_REG_ADDR_IRQ_MASTER0, &master);
>  	if (ret) {
>  		pr_err("Failed to read master 0 ret=%d\n", ret);
> -		goto done;
> +		return IRQ_NONE;
>  	}
>  
>  	/* bits 1 through 7 marks the first 7 blocks in master 0 */
> @@ -251,19 +246,18 @@ static void pm8821_irq_handler(struct irq_desc *desc)
>  
>  	/* bit 0 marks if master 1 contains any bits */
>  	if (!(master & BIT(0)))
> -		goto done;
> +		return IRQ_NONE;
>  
>  	ret = regmap_read(chip->regmap,
>  			  PM8821_SSBI_REG_ADDR_IRQ_MASTER1, &master);
>  	if (ret) {
>  		pr_err("Failed to read master 1 ret=%d\n", ret);
> -		goto done;
> +		return IRQ_NONE;
>  	}
>  
>  	pm8821_irq_master_handler(chip, 1, master);
>  
> -done:
> -	chained_irq_exit(irq_chip, desc);
> +	return IRQ_HANDLED;
>  }
>  
>  static void pm8xxx_irq_mask_ack(struct irq_data *d)
> @@ -574,14 +568,15 @@ static int pm8xxx_probe(struct platform_device *pdev)
>  	if (!chip->irqdomain)
>  		return -ENODEV;
>  
> -	irq_set_chained_handler_and_data(irq, data->irq_handler, chip);
> +	rc = devm_request_irq(&pdev->dev, irq, data->irq_handler, 0, dev_name(&pdev->dev), chip);
> +	if (rc)
> +		return rc;
> +
>  	irq_set_irq_wake(irq, 1);
>  
>  	rc = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> -	if (rc) {
> -		irq_set_chained_handler_and_data(irq, NULL, NULL);
> +	if (rc)
>  		irq_domain_remove(chip->irqdomain);
> -	}
>  
>  	return rc;
>  }
> @@ -594,11 +589,9 @@ static int pm8xxx_remove_child(struct device *dev, void *unused)
>  
>  static int pm8xxx_remove(struct platform_device *pdev)
>  {
> -	int irq = platform_get_irq(pdev, 0);
>  	struct pm_irq_chip *chip = platform_get_drvdata(pdev);
>  
>  	device_for_each_child(&pdev->dev, NULL, pm8xxx_remove_child);
> -	irq_set_chained_handler_and_data(irq, NULL, NULL);
>  	irq_domain_remove(chip->irqdomain);
>  
>  	return 0;
> -- 
> 2.30.2
> 
