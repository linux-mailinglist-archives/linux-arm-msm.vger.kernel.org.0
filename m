Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0556031AC7D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Feb 2021 16:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhBMPFd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Feb 2021 10:05:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39596 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229647AbhBMPFW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Feb 2021 10:05:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613228635;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IbRDXnVkgokeWfj3+Tz6V/zFRi6EhFaMmZsqs9gupxU=;
        b=AZhI22OzvcdGn7FO+apUupZhKHYgIFimEpAygiBoohKr3tO59DqZRyt/komCSBsthk/4o/
        gjzhe22ZjBtTY8kkN+vwukg7ARTQo4WLhGu/yG0Rb65zz7OiQfPXKtmQ98izuXi0wDYvd/
        uqc6a2foAZAXjUWvB9MRFyQjOPnNmRg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-5wn2CcYnMsuO1xi0Xbv7yw-1; Sat, 13 Feb 2021 10:03:53 -0500
X-MC-Unique: 5wn2CcYnMsuO1xi0Xbv7yw-1
Received: by mail-ej1-f71.google.com with SMTP id p1so2362916ejo.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Feb 2021 07:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IbRDXnVkgokeWfj3+Tz6V/zFRi6EhFaMmZsqs9gupxU=;
        b=QThD6ApGB4PRkpjMrOTXCgJ0Bbj8euYd0mPUwiYHibHcxVkPRs5A4Q2IiEDgp24kSP
         JhuMdPmsHNfgZcc7+4CR2cKT/8vpREkg8GqBikLDx8lQgbNAwJPZVVWa8kMNoQYoUq1M
         IRTehQPhRiPtTrzLG0bDyOWID5zuV+IUWnarKA7xwvxNGxa1iqWw1oEcaelSVB5b3dVg
         EyAdzvV8+RH9UqfOmpEf7sqMXuhJUxoUrkIog7mah3yeXEL0pvhC8Tvopqmr6p74++aJ
         IjdmxPBZYq2mAqobmvYVO3+LfQePax0z8KzHKI5n2aC895a6qweig12VnJd1irnCrN38
         IcEw==
X-Gm-Message-State: AOAM533IkWiG52cWhD4bUiMqyt1m4oL3r+ZCZJthhbKPVyinCbzO7ll0
        NVN6F7XpuwU6lla588rLzx+ILj7BhgP2u0XU8JxOfUr1kSVkYpLdRoQoKQhMDkdAJ40QAYc3/pj
        2CvtUSEOaXudRlmq5RBVO7phW+A==
X-Received: by 2002:a17:907:933:: with SMTP id au19mr7841003ejc.51.1613228631791;
        Sat, 13 Feb 2021 07:03:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQA3MDWp7v8eys+7/AkHpFQVgSaKlfsGAQwnsKfJRExVSbdJsT33N7b5HRBf683Jie9jfUBw==
X-Received: by 2002:a17:907:933:: with SMTP id au19mr7840959ejc.51.1613228631502;
        Sat, 13 Feb 2021 07:03:51 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k27sm7817070eje.67.2021.02.13.07.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Feb 2021 07:03:51 -0800 (PST)
Subject: Re: [RFC PATCH 1/7] drivers: base: Add resource managed version of
 delayed work init
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2fb4b305-a93f-f91e-3001-dab5057e39cc@redhat.com>
Date:   Sat, 13 Feb 2021 16:03:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1230b0d2ba99ad546d72ab079e76cb1b3df32afb.1613216412.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 2/13/21 12:58 PM, Matti Vaittinen wrote:
> A few drivers which need a delayed work-queue must cancel work at exit.
> Some of those implement remove solely for this purpose. Help drivers
> to avoid unnecessary remove and error-branch implementation by adding
> managed verision of delayed work initialization
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/base/devres.c  | 33 +++++++++++++++++++++++++++++++++
>  include/linux/device.h |  5 +++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/base/devres.c b/drivers/base/devres.c
> index fb9d5289a620..2879595bb5a4 100644
> --- a/drivers/base/devres.c
> +++ b/drivers/base/devres.c
> @@ -1231,3 +1231,36 @@ void devm_free_percpu(struct device *dev, void __percpu *pdata)
>  			       (void *)pdata));
>  }
>  EXPORT_SYMBOL_GPL(devm_free_percpu);
> +
> +static void dev_delayed_work_drop(struct device *dev, void *res)
> +{
> +	cancel_delayed_work_sync(*(struct delayed_work **)res);
> +}
> +
> +/**
> + * devm_delayed_work_autocancel - Resource-managed work allocation
> + * @dev: Device which lifetime work is bound to
> + * @pdata: work to be cancelled when device exits
> + *
> + * Initialize work which is automatically cancelled when device exits.
> + * A few drivers need delayed work which must be cancelled before driver
> + * is unload to avoid accessing removed resources.
> + * devm_delayed_work_autocancel() can be used to omit the explicit
> + * cancelleation when driver is unload.
> + */
> +int devm_delayed_work_autocancel(struct device *dev, struct delayed_work *w,
> +				 void (*worker)(struct work_struct *work))
> +{
> +	struct delayed_work **ptr;
> +
> +	ptr = devres_alloc(dev_delayed_work_drop, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	INIT_DELAYED_WORK(w, worker);
> +	*ptr = w;
> +	devres_add(dev, ptr);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(devm_delayed_work_autocancel);

This is a bit of a micro-optimization I must admit, but I think you can
just make this a static inline using devm_add_action, which would avoid
growing the base kernel image and avoid adding yet another symbol to
the exported symbols table.

I think something like this should work:

static int devm_delayed_work_autocancel(struct device *dev, struct delayed_work *w,
					void (*worker)(struct work_struct *work)) {
	INIT_DELAYED_WORK(w, worker);
	return devm_add_action(dev, (void (*action)(void *))cancel_delayed_work_sync, w);
}

I'm not sure about the cast, that may need something like this instead:

typedef void (*devm_action_func)(void *);

static int devm_delayed_work_autocancel(struct device *dev, struct delayed_work *w,
					void (*worker)(struct work_struct *work)) {
	INIT_DELAYED_WORK(w, worker);
	return devm_add_action(dev, (devm_action_func)cancel_delayed_work_sync, w);
}

As said this is a bit of a micro-optimization. But if we want to add others too,
say one for non delayed works, then at some point in time this is going to start
to add up (a bit) wrt symbol-table size and base kernel-image size.

And if you go the static inline route, I guess you could add this in

include/linux/workqueue.h

instead and putting workqueue devm cleanup helpers there seems better
then putting random devm cleanup helpers in include/linux/device.h .

Regards,

Hans






> diff --git a/include/linux/device.h b/include/linux/device.h
> index 1779f90eeb4c..192456198de7 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -27,6 +27,7 @@
>  #include <linux/uidgid.h>
>  #include <linux/gfp.h>
>  #include <linux/overflow.h>
> +#include <linux/workqueue.h>
>  #include <linux/device/bus.h>
>  #include <linux/device/class.h>
>  #include <linux/device/driver.h>
> @@ -249,6 +250,10 @@ void __iomem *devm_of_iomap(struct device *dev,
>  			    struct device_node *node, int index,
>  			    resource_size_t *size);
>  
> +/* delayed work which is cancelled when driver exits */
> +int devm_delayed_work_autocancel(struct device *dev, struct delayed_work *w,
> +				 void (*worker)(struct work_struct *work));
> +
>  /* allows to add/remove a custom action to devres stack */
>  int devm_add_action(struct device *dev, void (*action)(void *), void *data);
>  void devm_remove_action(struct device *dev, void (*action)(void *), void *data);
> 

