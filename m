Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9AC346F15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 02:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231794AbhCXBxY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 21:53:24 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:10204 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231982AbhCXBws (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 21:52:48 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210324015243epoutp0462d90b3a875ab2e0794dbb7eb91ea457~vJFrco7If3046230462epoutp04w
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 01:52:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210324015243epoutp0462d90b3a875ab2e0794dbb7eb91ea457~vJFrco7If3046230462epoutp04w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1616550763;
        bh=rjcSngjOYUlGxFd2EY7CieXHg2kcp8T3qJiHhIYExy8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=ffczO4vIcxnwWj7Ok9bTwbL2+3s3+WaJOI994YBHmbLLmF3FPvNXwNRbVlh6jyT6x
         uHfYYoy2kLYwN5EU7pb0xuT6yZGi8iBtOufvNWoj83yHmuS3SirX94gTqOMdLpCX1l
         NesExUmCgS+dvwsaGjWa7V3ByXzL+p99KP4w9omk=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20210324015242epcas1p429dab6e44bb644057f5ae1df942217be~vJFqX1Q-92320123201epcas1p4k;
        Wed, 24 Mar 2021 01:52:42 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.152]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4F4rpc27S7z4x9Pp; Wed, 24 Mar
        2021 01:52:40 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        77.F0.07927.86B9A506; Wed, 24 Mar 2021 10:52:40 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210324015239epcas1p1cd5f08a096951765130f3b7c137e3d64~vJFnd56lI3172231722epcas1p1k;
        Wed, 24 Mar 2021 01:52:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210324015239epsmtrp20176485648a591d5494775792f10c7c5~vJFnc_Tdt2666426664epsmtrp2G;
        Wed, 24 Mar 2021 01:52:39 +0000 (GMT)
X-AuditID: b6c32a35-9a5ff70000011ef7-62-605a9b6835c6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        58.FD.33967.76B9A506; Wed, 24 Mar 2021 10:52:39 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210324015239epsmtip2389d077b9e5c66299afcfa1300707eac~vJFnHNm583186831868epsmtip2g;
        Wed, 24 Mar 2021 01:52:39 +0000 (GMT)
Subject: Re: [PATCH v3 3/8] extconn: Clean-up few drivers by using managed
 work init
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <14800e19-da8c-81ba-48ee-cc51cc1925c9@samsung.com>
Date:   Wed, 24 Mar 2021 11:09:40 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <b1030eddbf0069f2d39e951be1d8e40d6413aeeb.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfUwbVQDPa8vdQaycZRuP4ibcQiJVWA8o3uRDjYRcgn8wTOa2TNsTTkoo
        bb0rIJtGBvvoKoMhEqGwscJQgWUgIuPTYodC3cQG3LIxWIYFs2x8yHBjjmXa9ljkv9977/fx
        fu8DE8suIXIsR29iOT2jI5AASffFSGWUtm6fRvl7dyA15l6TUJfsixKqtKkdoeZHvhRRlfZf
        UWqirx6hZm2XRdSFB38gVH3zqIRaMVdJqBuHvkGotoHb4tefodd+cqN0r3UapTtbjyP01NUB
        hD7t3EXbT51D6aUfriB072oxSpd3tQJ6pXNbesC+3EQty2SxXBirzzRk5eizk4i0t9VvqlXx
        SjKK3Em9QoTpmTw2iUh5Kz0qNUfn2TcRVsDo8j1T6QzPEzuSEzlDvokN0xp4UxLBGrN0xp3G
        aJ7J4/P12dGZhrxXSaUyRuUhanK1ZU0dfsbvEz9aaGlDi0ELaQH+GMTjYM2jJpEFBGAyvAfA
        Hw9NAGFwD0D3kfN+wuABgBU199GnktKmWlRYGASwt7hhXbIEYHOrFfGygvDdcG1lzs+LN+Es
        nPu8WuwlifElEezvH/JZIbgC2m9f8wkC8XB45aEbeLEUT4aLX1t8HAkeAUcnzT6jzR5TZ/fh
        dc5z0Fk7K/Fif1wLe4YGfT5iPBhOzjaIBPwCvLBQ7wuG+CwGr58eAkKHFLg6XSwScBC8M9K1
        3k0OVxYFI4gfhC3OYUQQmwHssrv8hIVYaG+u8ogxT0IkbO/bIUyHw961U0AIfhYu3i/z81Ig
        LoXmozKBsh1O3Jpejw2BTceOIycBYd1Qx7qhgnVDBev/YWeApBVsYY18XjbLk0Zy4313At+r
        Vqh6QOXCX9EOIMKAA0BMTGySHn5nj0YmzWKKDrCcQc3l61jeAVSeA64UyzdnGjzfQm9Sk6qY
        2NhYKo6MV5EkESx9X3lLLcOzGROby7JGlnuqE2H+8mKRNTqkunb+8Wt320bvfaL47kXHuwWO
        clvRG++lHL157aWVqoczVRHBMx80fCh79EX8yxGoPreivc4VWvRZcMKgc7DgyNlc3NV4I3J+
        97IjvKKjzlaCDt+tfiLtyUonXXufzzjzp/HfrkXLt7/VuZK45MJGKceFlsn/tlBTA5oEd+eJ
        mV+uoiWBeOix8WlX/cQ/C2jqckJ55ePCrZfH2rRTRdbtvaqAxDHCjNmC0oAttj+GO2Bxzo9f
        zNgzeT4kIz99+IR1dH9J9dwTTdfWk+dGGR2i2tXdFpm2xf7pwRrLtq9SV+NGlgs7zOMD12/6
        N859TP2suDNfGr33rI1WKi3u/X2EhNcypELM8cx/UL6YAV4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsWy7bCSvG767KgEg7mzZSzOPf7NYnF6/zsW
        i+bF69ks3hyfzmQxcf9ZdovLu+awWTxZeIbJYvu3R2wWc5aeYLH43DGZxeJ24wo2i9V7XjA7
        8Hj8PvqY3WPnrLvsHptWdbJ53Lm2h81j3slAj/1z17B7vN93lc1j5/cGdo++LasYPT5vkgvg
        iuKySUnNySxLLdK3S+DK6Fm8gbVgq03F25Wr2RsYVxp2MXJySAiYSDQvnskOYgsJ7GaUOLlX
        DCIuKTHt4lHmLkYOIFtY4vDh4i5GLqCSt4wS07YsZwGpERYIk/j9+SkrSI2IQKrEope5IDXM
        Au+ZJC7/ucYK0fCNUWLrymZWkAY2AS2J/S9usIHY/AKKEld/PGYEsXkF7CTeLe8CO4JFQFXi
        xK0OsHpRoAU7lzxmgqgRlDg58wnYYk6BDIkdB/aCzWEWUJf4M+8SM4QtLnHryXwmCFteYvvb
        OcwTGIVnIWmfhaRlFpKWWUhaFjCyrGKUTC0ozk3PLTYsMMxLLdcrTswtLs1L10vOz93ECI5X
        Lc0djNtXfdA7xMjEwXiIUYKDWUmEtyU8IkGINyWxsiq1KD++qDQntfgQozQHi5I474Wuk/FC
        AumJJanZqakFqUUwWSYOTqkGpugNbtOjRCtYFErfPq40Pxfz+nPLLI8Ao6+b08X9HTkmRa/S
        /XQihLvxxIuI9fcWHfdas+HWrau3pnRaKyvpqnydpJPQeJalleVUs1LCj7es+26Jrmlh4l4w
        +WrmVo4EbWMHxfW6VZMFk9Y7z1zKo9GgnDLFUynXuq62W36r/cqgnyqx3+1Wd6jFz1daGuIZ
        s5Vf8UJ4pelSKYeLoU46DqE/+W3XVk1b3as+j116w5dtuZkpnKqiHq6mMucf/+bkfDt7VU7f
        8TPmnqLOugubSrfuPap/+FuFst/jFdNPqDY5sCvvYZxd9L9QdJK64wU/ZwF/qZLjLzeyTO87
        Wh4677ea2tfZ3+VK6/+xHJusxFKckWioxVxUnAgAYXgw4kYDAAA=
X-CMS-MailID: 20210324015239epcas1p1cd5f08a096951765130f3b7c137e3d64
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210323135719epcas1p326dfbf8acd6c95703a30d832fb111879
References: <cover.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
        <CGME20210323135719epcas1p326dfbf8acd6c95703a30d832fb111879@epcas1p3.samsung.com>
        <b1030eddbf0069f2d39e951be1d8e40d6413aeeb.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Need to fix the work as following:
s/extconn/extcon

And I'd like you to use the more correct patch title like the following example:
"extcon: Use resource-managed function for delayed work"

Thanks,
Chanwoo Choi

On 3/23/21 10:57 PM, Matti Vaittinen wrote:
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

Need to add the error log as following:
	if (ret) {
		dev_err(dev, "Failed to initialize delayed_work");
		return ret;
	}	

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
