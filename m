Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3265D3460C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 15:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbhCWOA0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 10:00:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50998 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231765AbhCWOAA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 10:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616507999;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2lekG7NgRMHTk/OT5t4tKJuQvkMGK4bl8xn8GPAaTdY=;
        b=PJdCRWY4toN+hmJVF2zyQ9xhAnYQmzrZgYDfQu55kyvN0lEud+H1B6E6/A24p+ZdZW3qNa
        D/6BqblC+ZuNKEyB+pRfFXZylS5MdYzj4qwygTmNgUek8HfaiK/LWqzU6dzv6+ilISdRza
        a4U+ciFIeyjj5THZJ+KMBT1hcrlHVBg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-RDelXy6IMXiSRg1orV5dFA-1; Tue, 23 Mar 2021 09:59:56 -0400
X-MC-Unique: RDelXy6IMXiSRg1orV5dFA-1
Received: by mail-ed1-f71.google.com with SMTP id f9so991706edd.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 06:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2lekG7NgRMHTk/OT5t4tKJuQvkMGK4bl8xn8GPAaTdY=;
        b=czOt2JzX1KYBsBsbfa7GMOKpPDv+exQVj/o6Ww05A6Ec+GXbxaqElrKzxiadIRMCrx
         qA2oCtE3yGd004bpluQgUAU0OpqZ07Apu93j/EEzYWAE9IegZbAfm+DwE5Kr/w0LUjdW
         ztTLRBgZmgQbnCLOg4oFk322wkcgtLrerVcgzlIs8WPk+9iE7l8AZaKyL9Ec3pMYMZJY
         +ttTz5rpWSJ99pSIa+asW9sZ1HWC5J6krYmTVsUP+Bz5UkjG/Qzu2dBZc4jNgxAiPbh3
         Ne5w+35B6dAkJYs4po8kQ2kypId27TgYLBPr5zs+/vNqZHkjFNBpGh7RSRXmLv4ptxM2
         XPww==
X-Gm-Message-State: AOAM532j+cWlEgJ4Ebk2lYEe8FS+MOZTjKabSRmIueZRNrrn1tNf8wqQ
        LG/PjKuQgED+AZUpG50wLCBgNAbzbfjCYXTxX3zdT2OHSGzOhfYOj3hfiV5UWf1gzxLr/ceyqLq
        zylmim0Qj86rMtffKpKBr5iFlUA==
X-Received: by 2002:aa7:d44a:: with SMTP id q10mr4678417edr.278.1616507995293;
        Tue, 23 Mar 2021 06:59:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxz3ZsKdA9qJFFz7bZq+ErMPrU2BsaMwM63blvJe5D9JBx3dDTEGFPGeggpJsYMlaUbnQaE8Q==
X-Received: by 2002:aa7:d44a:: with SMTP id q10mr4678402edr.278.1616507995105;
        Tue, 23 Mar 2021 06:59:55 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id p3sm11180036ejd.7.2021.03.23.06.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 06:59:54 -0700 (PDT)
Subject: Re: [PATCH v3 3/8] extconn: Clean-up few drivers by using managed
 work init
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Gross <mgross@linux.intel.com>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <cover.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
 <b1030eddbf0069f2d39e951be1d8e40d6413aeeb.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1dfcca10-02a4-3a50-1611-76c780b6647f@redhat.com>
Date:   Tue, 23 Mar 2021 14:59:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b1030eddbf0069f2d39e951be1d8e40d6413aeeb.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/23/21 2:57 PM, Matti Vaittinen wrote:
> Few drivers implement remove call-back only for ensuring a delayed
> work gets cancelled prior driver removal. Clean-up these by switching
> to use devm_delayed_work_autocancel() instead.
> 
> Additionally, this helps avoiding mixing devm and manual resource
> management and cleans up a (theoretical?) bug from extconn-palmas.c
> and extcon-qcom-spmi-misc.c where (devm managed)IRQ might schedule
> new work item after wq was cleaned at remove().
> 
> This change is compile-tested only. All testing is appreciated.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Note that this is not just a cleanup, it also actually fixes a
couple of driver-unbind races where the work was stopped before
the IRQ is free-ed, so there is a race where the work can be
restarted.

Regards,

Hans



> ---
> Changelog from RFCv2:
>  - RFC dropped. No functional changes.
> 
>  drivers/extcon/extcon-gpio.c           | 15 ++++-----------
>  drivers/extcon/extcon-intel-int3496.c  | 16 ++++------------
>  drivers/extcon/extcon-palmas.c         | 17 ++++++-----------
>  drivers/extcon/extcon-qcom-spmi-misc.c | 17 ++++++-----------
>  4 files changed, 20 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
> index c211222f5d0c..4105df74f2b0 100644
> --- a/drivers/extcon/extcon-gpio.c
> +++ b/drivers/extcon/extcon-gpio.c
> @@ -9,6 +9,7 @@
>   * (originally switch class is supported)
>   */
>  
> +#include <linux/devm-helpers.h>
>  #include <linux/extcon-provider.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/init.h>
> @@ -112,7 +113,9 @@ static int gpio_extcon_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	INIT_DELAYED_WORK(&data->work, gpio_extcon_work);
> +	ret = devm_delayed_work_autocancel(dev, &data->work, gpio_extcon_work);
> +	if (ret)
> +		return ret;
>  
>  	/*
>  	 * Request the interrupt of gpio to detect whether external connector
> @@ -131,15 +134,6 @@ static int gpio_extcon_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int gpio_extcon_remove(struct platform_device *pdev)
> -{
> -	struct gpio_extcon_data *data = platform_get_drvdata(pdev);
> -
> -	cancel_delayed_work_sync(&data->work);
> -
> -	return 0;
> -}
> -
>  #ifdef CONFIG_PM_SLEEP
>  static int gpio_extcon_resume(struct device *dev)
>  {
> @@ -158,7 +152,6 @@ static SIMPLE_DEV_PM_OPS(gpio_extcon_pm_ops, NULL, gpio_extcon_resume);
>  
>  static struct platform_driver gpio_extcon_driver = {
>  	.probe		= gpio_extcon_probe,
> -	.remove		= gpio_extcon_remove,
>  	.driver		= {
>  		.name	= "extcon-gpio",
>  		.pm	= &gpio_extcon_pm_ops,
> diff --git a/drivers/extcon/extcon-intel-int3496.c b/drivers/extcon/extcon-intel-int3496.c
> index 80c9abcc3f97..fb527c23639e 100644
> --- a/drivers/extcon/extcon-intel-int3496.c
> +++ b/drivers/extcon/extcon-intel-int3496.c
> @@ -11,6 +11,7 @@
>   */
>  
>  #include <linux/acpi.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/extcon-provider.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
> @@ -101,7 +102,9 @@ static int int3496_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	data->dev = dev;
> -	INIT_DELAYED_WORK(&data->work, int3496_do_usb_id);
> +	ret = devm_delayed_work_autocancel(dev, &data->work, int3496_do_usb_id);
> +	if (ret)
> +		return ret;
>  
>  	data->gpio_usb_id = devm_gpiod_get(dev, "id", GPIOD_IN);
>  	if (IS_ERR(data->gpio_usb_id)) {
> @@ -155,16 +158,6 @@ static int int3496_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int int3496_remove(struct platform_device *pdev)
> -{
> -	struct int3496_data *data = platform_get_drvdata(pdev);
> -
> -	devm_free_irq(&pdev->dev, data->usb_id_irq, data);
> -	cancel_delayed_work_sync(&data->work);
> -
> -	return 0;
> -}
> -
>  static const struct acpi_device_id int3496_acpi_match[] = {
>  	{ "INT3496" },
>  	{ }
> @@ -177,7 +170,6 @@ static struct platform_driver int3496_driver = {
>  		.acpi_match_table = int3496_acpi_match,
>  	},
>  	.probe = int3496_probe,
> -	.remove = int3496_remove,
>  };
>  
>  module_platform_driver(int3496_driver);
> diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
> index a2852bcc5f0d..d2c1a8b89c08 100644
> --- a/drivers/extcon/extcon-palmas.c
> +++ b/drivers/extcon/extcon-palmas.c
> @@ -9,6 +9,7 @@
>   * Author: Hema HK <hemahk@ti.com>
>   */
>  
> +#include <linux/devm-helpers.h>
>  #include <linux/module.h>
>  #include <linux/interrupt.h>
>  #include <linux/platform_device.h>
> @@ -237,7 +238,11 @@ static int palmas_usb_probe(struct platform_device *pdev)
>  			palmas_usb->sw_debounce_jiffies = msecs_to_jiffies(debounce);
>  	}
>  
> -	INIT_DELAYED_WORK(&palmas_usb->wq_detectid, palmas_gpio_id_detect);
> +	status = devm_delayed_work_autocancel(&pdev->dev,
> +					      &palmas_usb->wq_detectid,
> +					      palmas_gpio_id_detect);
> +	if (status)
> +		return status;
>  
>  	palmas->usb = palmas_usb;
>  	palmas_usb->palmas = palmas;
> @@ -359,15 +364,6 @@ static int palmas_usb_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int palmas_usb_remove(struct platform_device *pdev)
> -{
> -	struct palmas_usb *palmas_usb = platform_get_drvdata(pdev);
> -
> -	cancel_delayed_work_sync(&palmas_usb->wq_detectid);
> -
> -	return 0;
> -}
> -
>  #ifdef CONFIG_PM_SLEEP
>  static int palmas_usb_suspend(struct device *dev)
>  {
> @@ -422,7 +418,6 @@ static const struct of_device_id of_palmas_match_tbl[] = {
>  
>  static struct platform_driver palmas_usb_driver = {
>  	.probe = palmas_usb_probe,
> -	.remove = palmas_usb_remove,
>  	.driver = {
>  		.name = "palmas-usb",
>  		.of_match_table = of_palmas_match_tbl,
> diff --git a/drivers/extcon/extcon-qcom-spmi-misc.c b/drivers/extcon/extcon-qcom-spmi-misc.c
> index 6b836ae62176..74d57d951b68 100644
> --- a/drivers/extcon/extcon-qcom-spmi-misc.c
> +++ b/drivers/extcon/extcon-qcom-spmi-misc.c
> @@ -7,6 +7,7 @@
>   * Stephen Boyd <stephen.boyd@linaro.org>
>   */
>  
> +#include <linux/devm-helpers.h>
>  #include <linux/extcon-provider.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
> @@ -80,7 +81,11 @@ static int qcom_usb_extcon_probe(struct platform_device *pdev)
>  	}
>  
>  	info->debounce_jiffies = msecs_to_jiffies(USB_ID_DEBOUNCE_MS);
> -	INIT_DELAYED_WORK(&info->wq_detcable, qcom_usb_extcon_detect_cable);
> +
> +	ret = devm_delayed_work_autocancel(dev, &info->wq_detcable,
> +					   qcom_usb_extcon_detect_cable);
> +	if (ret)
> +		return ret;
>  
>  	info->irq = platform_get_irq_byname(pdev, "usb_id");
>  	if (info->irq < 0)
> @@ -105,15 +110,6 @@ static int qcom_usb_extcon_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int qcom_usb_extcon_remove(struct platform_device *pdev)
> -{
> -	struct qcom_usb_extcon_info *info = platform_get_drvdata(pdev);
> -
> -	cancel_delayed_work_sync(&info->wq_detcable);
> -
> -	return 0;
> -}
> -
>  #ifdef CONFIG_PM_SLEEP
>  static int qcom_usb_extcon_suspend(struct device *dev)
>  {
> @@ -149,7 +145,6 @@ MODULE_DEVICE_TABLE(of, qcom_usb_extcon_dt_match);
>  
>  static struct platform_driver qcom_usb_extcon_driver = {
>  	.probe		= qcom_usb_extcon_probe,
> -	.remove		= qcom_usb_extcon_remove,
>  	.driver		= {
>  		.name	= "extcon-pm8941-misc",
>  		.pm	= &qcom_usb_extcon_pm_ops,
> 

