Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94859413BB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 22:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235089AbhIUUtZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 16:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234573AbhIUUtY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 16:49:24 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4540C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 13:47:55 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x27so2680363lfu.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 13:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A6SimGPLO0eF0tBW1cYNDIiHY5oAsat7UrLgXNJKYcQ=;
        b=HAXRl0YfmuQSP6AGwCsq65LxqKpv9khlh85IfMdB1ZMR2UiAl/YufwRpl8vXWCYOpg
         UnHBM9BrgzMmGS7TShKph32jTOqQnohcGPYrc6A5S5lbMV0Kh8oUT9aqaXQO06m4aXof
         JwzBtPpQIV6sjxjOJvfA8xTk4A1TjG7w0r3qy6iVKfxOV3kWRL1el8VPeFZXOazgikSB
         jpAIUSp6NVnwefZfuBka0JbylCIE/K7cVKPcSSef4hKVWn1IRMIrASLRSqtZKL72XkHL
         LyzrgJFLnjD9lrJtNSe/6khXaB4hjdO/EglWMjvYhE+jTSsa1UqYxansra5EZdTo1ZtX
         zagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A6SimGPLO0eF0tBW1cYNDIiHY5oAsat7UrLgXNJKYcQ=;
        b=5pdzxRBsVa84jDr4eCWsW7NzKrD+5qZqYxwX++Nhah8zwB2r6c5RLdjGzZ/WAYxpTA
         eotDA44Zo2FG3lYyvhONq4W2N2AE3vqmxCAH7SPLB406pE9kgXMQjL3AT4Dqqe+xG09w
         YSvuJ5whpzJ8k1HiBZu83x6REh9BSKjPzcVtytPCEiGwXxUbyqNWuL1MrdCba7PjkxNU
         RHvRLqvu+slZbpWbhY9XweFCC3LmhUkHOrxFvmZhCq+k5h3V1S5eVfcNQjrZTYa6J7hP
         ofnfFVavlR2FYntWScd6KPFueDUwr/y6O1b8uLxAQ/6g2nxXogLRkSVDcUYxDnlcM7Tp
         YJxg==
X-Gm-Message-State: AOAM531TXrABfflb46N0O5K+4LYKGgUe7Wgc3oVILMjw5WdOdvPjx0L7
        Glro7W7S2WAfFvREuZvQvkoovA==
X-Google-Smtp-Source: ABdhPJy6qhNcR9/9rNjs53yROXBdqPPVJCt6KMI9YSb6UYbho0uJSvK8mv8/EMdJQWwONuCesjYlUg==
X-Received: by 2002:a2e:9a98:: with SMTP id p24mr12181692lji.55.1632257274298;
        Tue, 21 Sep 2021 13:47:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n14sm6370lfq.209.2021.09.21.13.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 13:47:53 -0700 (PDT)
Subject: Re: [PATCH] mfd: qcom-pm8xxx: switch away from using chained IRQ
 handlers
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
References: <20210921162433.1858296-1-dmitry.baryshkov@linaro.org>
 <YUo3UGfbdbuXrOyy@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <c1988694-9499-a7c4-1156-99699e20eba0@linaro.org>
Date:   Tue, 21 Sep 2021 23:47:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUo3UGfbdbuXrOyy@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2021 22:49, Bjorn Andersson wrote:
> On Tue 21 Sep 11:24 CDT 2021, Dmitry Baryshkov wrote:
> 
>> PM8xxx PMIC family uses GPIO as parent IRQ. Using it together with the
>> irq_set_chained_handler_and_data() results in warnings from the GPIOLIB
>> as in this path the IRQ resources are not allocated (and thus the
>> corresponding GPIO is not marked as used for the IRQ. Use request_irq so
>> that the IRQ resources are proprely setup.
>>
> 
> It's been a while since I booted a platform with ssbi PMIC (i.e. 8064
> and older), but I don't remember ever seeing a warning.

I've got Nexus 7 as an example of MDP4 hardware. The warning is more or 
less recent: from 2019 if I remember correctly.

> 
> Can you please include in the commit message what warning this is and
> perhaps a reference to what in GPIOLIB changed to introduce this - in
> particular so that this fix can be found when people are searching the
> archive looking for similar issues.

Ack.

> And I think it would be nice to Cc Linus Walleij.

Ack.

> 
> 
> Change looks good though, so please update the commit message and add
> my:
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/mfd/qcom-pm8xxx.c | 39 ++++++++++++++++-----------------------
>>   1 file changed, 16 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
>> index ec18a04de355..2f2734ba5273 100644
>> --- a/drivers/mfd/qcom-pm8xxx.c
>> +++ b/drivers/mfd/qcom-pm8xxx.c
>> @@ -65,7 +65,7 @@
>>   struct pm_irq_data {
>>   	int num_irqs;
>>   	struct irq_chip *irq_chip;
>> -	void (*irq_handler)(struct irq_desc *desc);
>> +	irq_handler_t irq_handler;
>>   };
>>   
>>   struct pm_irq_chip {
>> @@ -169,19 +169,16 @@ static int pm8xxx_irq_master_handler(struct pm_irq_chip *chip, int master)
>>   	return ret;
>>   }
>>   
>> -static void pm8xxx_irq_handler(struct irq_desc *desc)
>> +static irqreturn_t pm8xxx_irq_handler(int irq, void *data)
>>   {
>> -	struct pm_irq_chip *chip = irq_desc_get_handler_data(desc);
>> -	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
>> +	struct pm_irq_chip *chip = data;
>>   	unsigned int root;
>>   	int	i, ret, masters = 0;
>>   
>> -	chained_irq_enter(irq_chip, desc);
>> -
>>   	ret = regmap_read(chip->regmap, SSBI_REG_ADDR_IRQ_ROOT, &root);
>>   	if (ret) {
>>   		pr_err("Can't read root status ret=%d\n", ret);
>> -		return;
>> +		return IRQ_NONE;
>>   	}
>>   
>>   	/* on pm8xxx series masters start from bit 1 of the root */
>> @@ -192,7 +189,7 @@ static void pm8xxx_irq_handler(struct irq_desc *desc)
>>   		if (masters & (1 << i))
>>   			pm8xxx_irq_master_handler(chip, i);
>>   
>> -	chained_irq_exit(irq_chip, desc);
>> +	return IRQ_HANDLED;
>>   }
>>   
>>   static void pm8821_irq_block_handler(struct pm_irq_chip *chip,
>> @@ -230,19 +227,17 @@ static inline void pm8821_irq_master_handler(struct pm_irq_chip *chip,
>>   			pm8821_irq_block_handler(chip, master, block);
>>   }
>>   
>> -static void pm8821_irq_handler(struct irq_desc *desc)
>> +static irqreturn_t pm8821_irq_handler(int irq, void *data)
>>   {
>> -	struct pm_irq_chip *chip = irq_desc_get_handler_data(desc);
>> -	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
>> +	struct pm_irq_chip *chip = data;
>>   	unsigned int master;
>>   	int ret;
>>   
>> -	chained_irq_enter(irq_chip, desc);
>>   	ret = regmap_read(chip->regmap,
>>   			  PM8821_SSBI_REG_ADDR_IRQ_MASTER0, &master);
>>   	if (ret) {
>>   		pr_err("Failed to read master 0 ret=%d\n", ret);
>> -		goto done;
>> +		return IRQ_NONE;
>>   	}
>>   
>>   	/* bits 1 through 7 marks the first 7 blocks in master 0 */
>> @@ -251,19 +246,18 @@ static void pm8821_irq_handler(struct irq_desc *desc)
>>   
>>   	/* bit 0 marks if master 1 contains any bits */
>>   	if (!(master & BIT(0)))
>> -		goto done;
>> +		return IRQ_NONE;
>>   
>>   	ret = regmap_read(chip->regmap,
>>   			  PM8821_SSBI_REG_ADDR_IRQ_MASTER1, &master);
>>   	if (ret) {
>>   		pr_err("Failed to read master 1 ret=%d\n", ret);
>> -		goto done;
>> +		return IRQ_NONE;
>>   	}
>>   
>>   	pm8821_irq_master_handler(chip, 1, master);
>>   
>> -done:
>> -	chained_irq_exit(irq_chip, desc);
>> +	return IRQ_HANDLED;
>>   }
>>   
>>   static void pm8xxx_irq_mask_ack(struct irq_data *d)
>> @@ -574,14 +568,15 @@ static int pm8xxx_probe(struct platform_device *pdev)
>>   	if (!chip->irqdomain)
>>   		return -ENODEV;
>>   
>> -	irq_set_chained_handler_and_data(irq, data->irq_handler, chip);
>> +	rc = devm_request_irq(&pdev->dev, irq, data->irq_handler, 0, dev_name(&pdev->dev), chip);
>> +	if (rc)
>> +		return rc;
>> +
>>   	irq_set_irq_wake(irq, 1);
>>   
>>   	rc = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
>> -	if (rc) {
>> -		irq_set_chained_handler_and_data(irq, NULL, NULL);
>> +	if (rc)
>>   		irq_domain_remove(chip->irqdomain);
>> -	}
>>   
>>   	return rc;
>>   }
>> @@ -594,11 +589,9 @@ static int pm8xxx_remove_child(struct device *dev, void *unused)
>>   
>>   static int pm8xxx_remove(struct platform_device *pdev)
>>   {
>> -	int irq = platform_get_irq(pdev, 0);
>>   	struct pm_irq_chip *chip = platform_get_drvdata(pdev);
>>   
>>   	device_for_each_child(&pdev->dev, NULL, pm8xxx_remove_child);
>> -	irq_set_chained_handler_and_data(irq, NULL, NULL);
>>   	irq_domain_remove(chip->irqdomain);
>>   
>>   	return 0;
>> -- 
>> 2.30.2
>>


-- 
With best wishes
Dmitry
