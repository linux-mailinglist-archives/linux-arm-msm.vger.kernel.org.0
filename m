Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C65831ABA8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Feb 2021 14:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhBMNVH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Feb 2021 08:21:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50522 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229928AbhBMNTm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Feb 2021 08:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613222292;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vgiqMjpzHYHVEasZe+x67kEYom/P4PxutLMaV2cpHvo=;
        b=al/i6ai+Z03wngRKbzeVaMt7VbceFso9foerD1lL5JGSgBNiBYIB1bSQsS7dgnCKcr2UtA
        zIcy8y8M0ipWASlOvuJwacFjlfNHtzHtu2XevhtIMwG2AbbaqXtgSMU+cfWTWi/uK+LD+N
        ud64VgoL8trMi3IfzwjfmsCyXZEulaM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-M90JJdUTOKqmzcmB1-RKWw-1; Sat, 13 Feb 2021 08:18:10 -0500
X-MC-Unique: M90JJdUTOKqmzcmB1-RKWw-1
Received: by mail-ed1-f69.google.com with SMTP id l23so2121061edt.23
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Feb 2021 05:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vgiqMjpzHYHVEasZe+x67kEYom/P4PxutLMaV2cpHvo=;
        b=Nd2dkaogC7pBlrnsPpICdqB3X/OKYsQtZIRbWcN46HUoCBgz7XZrw8+y9e3RfCCP1H
         RrYwvRc7DtiI71aZ9DArGaTGxDitnuuvnjAUB2Dq7s7y1ZZTqgP2TUN7IAdQvZWvHZpi
         znSAlpu2gawKf2rI3L8GGbKaEdY6cAm6EZkAjwjZ2roRSnYv2tPCYR6DmfmwuoVeUlnP
         X/YGB7AbYW184rXuScSx0aCurFFeLf7tRYOKjhXX4LzMZfLlYLsVXx/tmLDfu/q2wzca
         Qm7KaQKiBMEcBg7jC7yXZNwNvKUB8hZMfVT5heMArl6l+a3CjvkHTt66jvFQcIu2iDef
         P9tg==
X-Gm-Message-State: AOAM530N6yTsTYuwH6odsJnOGKmPwqXEvaMgCPuqXZ9HEJwPgHEC/z4M
        nsTsNZFdkqt+4rITKUSfs9tMF497dwK/QvMxnHuLrZqvexhDxEgy1vjWzl9+HOQ5zo7JUZv5rxA
        WS4rY2NXcdXYcUpraeFLCvOjmhA==
X-Received: by 2002:a17:906:2b11:: with SMTP id a17mr7384210ejg.203.1613222288347;
        Sat, 13 Feb 2021 05:18:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpzKb8+HCPJlB/ho0Uo1ye3Om23RvrJkMpdFxSS5OYeOpr6Yepci5ANEldPnELy4Q9CCxeNw==
X-Received: by 2002:a17:906:2b11:: with SMTP id a17mr7384181ejg.203.1613222288104;
        Sat, 13 Feb 2021 05:18:08 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id r16sm7674341ejc.112.2021.02.13.05.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Feb 2021 05:18:07 -0800 (PST)
Subject: Re: [RFC PATCH 1/7] drivers: base: Add resource managed version of
 delayed work init
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, "Rafael J. Wysocki" <rafael@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Gross <mgross@linux.intel.com>,
        Sebastian Reichel <sre@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Saravana Kannan <saravanak@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <jroedel@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <cover.1613216412.git.matti.vaittinen@fi.rohmeurope.com>
 <1230b0d2ba99ad546d72ab079e76cb1b3df32afb.1613216412.git.matti.vaittinen@fi.rohmeurope.com>
 <YCfDAly9b0zHMpJT@kroah.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <284d4a13-5cc8-e23c-7e99-c03db5415bf1@redhat.com>
Date:   Sat, 13 Feb 2021 14:18:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YCfDAly9b0zHMpJT@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 2/13/21 1:16 PM, Greg Kroah-Hartman wrote:
> On Sat, Feb 13, 2021 at 01:58:44PM +0200, Matti Vaittinen wrote:
>> A few drivers which need a delayed work-queue must cancel work at exit.
>> Some of those implement remove solely for this purpose. Help drivers
>> to avoid unnecessary remove and error-branch implementation by adding
>> managed verision of delayed work initialization
>>
>> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> 
> That's not a good idea.  As this would kick in when the device is
> removed from the system, not when it is unbound from the driver, right?

Erm, no devm managed resources get released when the driver is detached:
drivers/base/dd.c: __device_release_driver() calls devres_release_all(dev);


> 
>> ---
>>  drivers/base/devres.c  | 33 +++++++++++++++++++++++++++++++++
>>  include/linux/device.h |  5 +++++
>>  2 files changed, 38 insertions(+)
>>
>> diff --git a/drivers/base/devres.c b/drivers/base/devres.c
>> index fb9d5289a620..2879595bb5a4 100644
>> --- a/drivers/base/devres.c
>> +++ b/drivers/base/devres.c
>> @@ -1231,3 +1231,36 @@ void devm_free_percpu(struct device *dev, void __percpu *pdata)
>>  			       (void *)pdata));
>>  }
>>  EXPORT_SYMBOL_GPL(devm_free_percpu);
>> +
>> +static void dev_delayed_work_drop(struct device *dev, void *res)
>> +{
>> +	cancel_delayed_work_sync(*(struct delayed_work **)res);
>> +}
>> +
>> +/**
>> + * devm_delayed_work_autocancel - Resource-managed work allocation
>> + * @dev: Device which lifetime work is bound to
>> + * @pdata: work to be cancelled when device exits
>> + *
>> + * Initialize work which is automatically cancelled when device exits.
> 
> There is no such thing in the driver model as "when device exits".
> Please use the proper terminology as I do not understand what you think
> this is doing here...

I agree that this needs better wording I always talk about driver-unbinding
because sysfs has /sys/bus/*/drivers/*/bind and /sys/bus/*/drivers/*/unbind
attributes. But I see that the relevant driver-core functions all call it
driver detaching, so lets be consistent and use that here too.

> 
>> + * A few drivers need delayed work which must be cancelled before driver
>> + * is unload to avoid accessing removed resources.
>> + * devm_delayed_work_autocancel() can be used to omit the explicit
>> + * cancelleation when driver is unload.
>> + */
>> +int devm_delayed_work_autocancel(struct device *dev, struct delayed_work *w,
>> +				 void (*worker)(struct work_struct *work))
>> +{
>> +	struct delayed_work **ptr;
>> +
>> +	ptr = devres_alloc(dev_delayed_work_drop, sizeof(*ptr), GFP_KERNEL);
>> +	if (!ptr)
>> +		return -ENOMEM;
>> +
>> +	INIT_DELAYED_WORK(w, worker);
>> +	*ptr = w;
>> +	devres_add(dev, ptr);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(devm_delayed_work_autocancel);
>> diff --git a/include/linux/device.h b/include/linux/device.h
>> index 1779f90eeb4c..192456198de7 100644
>> --- a/include/linux/device.h
>> +++ b/include/linux/device.h
>> @@ -27,6 +27,7 @@
>>  #include <linux/uidgid.h>
>>  #include <linux/gfp.h>
>>  #include <linux/overflow.h>
>> +#include <linux/workqueue.h>
>>  #include <linux/device/bus.h>
>>  #include <linux/device/class.h>
>>  #include <linux/device/driver.h>
>> @@ -249,6 +250,10 @@ void __iomem *devm_of_iomap(struct device *dev,
>>  			    struct device_node *node, int index,
>>  			    resource_size_t *size);
>>  
>> +/* delayed work which is cancelled when driver exits */
> 
> Not when the "driver exits".

Right this should be detached not exits.

> There is two different lifespans here (well 3).  Code and data*2.  Don't
> confuse them as that will just cause lots of problems.
> 
> The move toward more and more "devm" functions is not the way to go as
> they just more and more make things easier to get wrong.
> 
> APIs should be impossible to get wrong, this one is going to be almost
> impossible to get right.

I have to disagree here devm generally makes it easier to get things right,
it is when some devm functions are missing and devm and non devm resources
are mixed that things get tricky.

Lets look for example at the drivers/extcon/extcon-intel-int3496.c code
from patch 2/7 from this set. The removed driver-remove function looks like
this:

-static int int3496_remove(struct platform_device *pdev)
-{
-	struct int3496_data *data = platform_get_drvdata(pdev);
-
-	devm_free_irq(&pdev->dev, data->usb_id_irq, data);
-	cancel_delayed_work_sync(&data->work);
-
-	return 0;
-}
-

This is a good example where the mix of devm and non devm (the workqueue)
resources makes things tricky. The IRQ must be freed first to avoid the
work potentially getting re-queued after the sync cancel.

In this case using devm for the IRQ may cause the driver author to forget
about this, leaving a race.

Bit with the new proposed devm_delayed_work_autocancel() function things
will just work.

This work gets queued by the IRQ handler, so the work must be initialized (1)
*before* devm_request_irq() gets called. Any different order would be a
bug in the probe function since then the IRQ might run before the work
is initialized.

Since devm unrolls / releases resources in reverse order, this means that
it will automatically free the IRQ (which was requested later) before
cancelling the work.

So by switching to the new devm_delayed_work_autocancel() function we avoid
a case where a driver author can cause a race on driver detach because it is
relying on devm to free the IRQ, which may cause it to requeue a just
cancelled work.

IOW introducing this function (and using it where appropriate) actually
removes a possible class of bugs.

patch 2/7 actually has a nice example of this, drivers/extcon/extcon-gpio.c
also uses a delayed work queued by an interrupt, together with devm managing
the interrupt, yet the removed driver_remove callback:

-static int gpio_extcon_remove(struct platform_device *pdev)
-{
-	struct gpio_extcon_data *data = platform_get_drvdata(pdev);
-
-	cancel_delayed_work_sync(&data->work);
-
-	return 0;
-}
-

Is missing the explicit free on the IRQ which is necessary to avoid
the race. One the one hand this illustrates your (Greg's) argument that
devm managed IRQs may be a bad idea.

OTOH it shows that if we have devm managed IRQs anyways that then also
having devm managed autocancel works is a good idea, since this RFC patch-set
not only results in some cleanup, but is actually fixing at least 1 driver
detach race condition.

Regards,

Hans



1) devm_delayed_work_autocancel() replaces INIT_DELAYED_WORK()

