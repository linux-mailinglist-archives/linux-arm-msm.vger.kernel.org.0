Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0C1D31ACC9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Feb 2021 17:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhBMQBK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Feb 2021 11:01:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52471 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229531AbhBMQBG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Feb 2021 11:01:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613231980;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FXggbj+8y1Ofgfpz7InHjYBqltBMGpvkXr1bSLy2fGA=;
        b=YvNaYsr1eN4bI4nOzUqCKaYzUNMA0LpIe8H/mLnDdO1rR41d5WAgJdKi+yKyn73dmd3lxz
        doiGI6J+besgBZ349NC6mimc4wZc8g8GFIA6jNY5d/jmkltbpSRojiS/joTJz/ZSMt69DE
        ykw22bU5U4k58zzQxG070JLrl7o1HwA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-svZcp0-OMJK5RSYQuMjmgg-1; Sat, 13 Feb 2021 10:59:39 -0500
X-MC-Unique: svZcp0-OMJK5RSYQuMjmgg-1
Received: by mail-ed1-f69.google.com with SMTP id e17so2273854eds.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Feb 2021 07:59:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FXggbj+8y1Ofgfpz7InHjYBqltBMGpvkXr1bSLy2fGA=;
        b=cacb20bEh3F4Z6B0IbzQb/OILrZ0VugmM8aXB04t+dmqmhPhvYCBpbwnOKjyTViXr1
         Tl6d3slPbijvRct5KhQSjYMXeW1Z59iByoaaU5erh12y/ywyCK6N4zwTyRTVcfo6UFnL
         LM2Ve7O5OLfLX1xVnFQSUXWSdQ5wsWVV4Kr/VyqSKd5AUZsCAV6W1iMIRc7LC6FcJ1/u
         um8tn+cp6suN8j8E8A7XqaCzvmoy/3l+WYEgTple7RiTA8+Nn2FcayKoX/zzJAtZxU3H
         PVj9YiWDAoKYdrSLMaDQcULIIhYOAoBZfXkRygeGQr42VqA7XY57r0ttfAItFu7nWAN8
         7X3Q==
X-Gm-Message-State: AOAM532w/iLGdQC6ZYQdhYMiknrwjP/xtKpmYoy2YbCv3qW0H9udFb+o
        8e3DBz3lze0YG6CZDFxb5vqITSinrCp6HZdpUEVJbpnU6V1DsyN5E6a4GawSjTj0gJaX1BN5lrn
        PRdPVInmbvJ9b9EY8HinjoiKx0Q==
X-Received: by 2002:a17:906:fac4:: with SMTP id lu4mr6945493ejb.202.1613231977883;
        Sat, 13 Feb 2021 07:59:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxUwxZNF6Wq4CzD+FidZQWOwT5L2B4wwIuDjp/31XIy7RZk7xNBf2bDkl7iDK6Vm+5g+/bFw==
X-Received: by 2002:a17:906:fac4:: with SMTP id lu4mr6945464ejb.202.1613231977649;
        Sat, 13 Feb 2021 07:59:37 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id z13sm7322713edc.73.2021.02.13.07.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Feb 2021 07:59:37 -0800 (PST)
Subject: Re: [RFC PATCH 1/7] drivers: base: Add resource managed version of
 delayed work init
To:     Guenter Roeck <linux@roeck-us.net>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
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
 <2fb4b305-a93f-f91e-3001-dab5057e39cc@redhat.com>
 <084893a3-0071-13e9-5ce6-b7b027e6cd2a@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <16140f5b-c504-1c07-9f0c-3813d686d157@redhat.com>
Date:   Sat, 13 Feb 2021 16:59:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <084893a3-0071-13e9-5ce6-b7b027e6cd2a@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 2/13/21 4:27 PM, Guenter Roeck wrote:
> On 2/13/21 7:03 AM, Hans de Goede wrote:
> [ ... ]
>>
>> I think something like this should work:
>>
>> static int devm_delayed_work_autocancel(struct device *dev, struct delayed_work *w,
>> 					void (*worker)(struct work_struct *work)) {
>> 	INIT_DELAYED_WORK(w, worker);
>> 	return devm_add_action(dev, (void (*action)(void *))cancel_delayed_work_sync, w);
>> }
>>
>> I'm not sure about the cast, that may need something like this instead:
>>
>> typedef void (*devm_action_func)(void *);
>>
>> static int devm_delayed_work_autocancel(struct device *dev, struct delayed_work *w,
>> 					void (*worker)(struct work_struct *work)) {
>> 	INIT_DELAYED_WORK(w, worker);
>> 	return devm_add_action(dev, (devm_action_func)cancel_delayed_work_sync, w);
> 
> Unfortunately, you can not type cast function pointers in C. It is against the C ABI.
> I am sure it is done in a few places in the kernel anyway, but those are wrong.

I see, bummer.

> This is the reason why many calls to devm_add_action() point to functions such as
> 
> static void visconti_clk_disable_unprepare(void *data)
> {
>         clk_disable_unprepare(data);
> }
> 
> which could otherwise be handled using typecasts.

Hmm, wouldn't something like this be a candidate for adding a:

devm_clk_prepare_enable() helper?

This seems better then having the driver(s) make + error check separate
clk_prepare_enable() + devm_add_action_or_reset() calls ?

I must admit I'm guilty myself of just using devm_add_action() sometimes
when a specific devm helper is missing, but this whole discussion makes
me think that it would be good to have some extra devm helpers for
common cases / driver cleanup patterns.

If we add a devm_clk_prepare_enable() helper that should probably be added
to drivers/clk/clk-devres.c and not to drivers/base/devres.c .

I also still wonder if we cannot find a better place for this new
devm_delayed_work_autocancel() helper but nothing comes to mind.

Regards,

Hans

