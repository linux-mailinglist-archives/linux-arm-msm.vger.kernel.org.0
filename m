Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2740AADDD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 23:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390863AbfIEVeI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 17:34:08 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46036 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731418AbfIEVeI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 17:34:08 -0400
Received: by mail-wr1-f68.google.com with SMTP id l16so4345236wrv.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2019 14:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V4w6sga0FIOl7Szr7q6ctpLCXiFJjLRqtuSSCXE+qjA=;
        b=H+Pa0GornKzpQpcL73cJnsE8BV5Xp412v0HAM9zlxElU5LQ0oYHBxMgwMc7DsrBEhx
         wJfl7Br2X3mNNnrXooPc0bj1uXnki/XI6CmSL1yJhuJIpC3RC/rFygle1MBTyw539vHU
         ov95M3lrK+7INmQcOKYMtV+UDZ2dKXcBiDr7a7QGXPx2asoFJQkHojcHaShr8zw/eqsg
         6RqH4gXsxzYxwrnWYcT9YQdkW2oPhs4t04VeDva48C1k2Bn7kKf4Q7Ng8NQuJv+dE4/N
         Hzc11JA9dEMUnpGAj7dURcWQurAYiVpaDf/OLeTihWGQH26qhkTKUvqAznE5Fls2lMMx
         iuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V4w6sga0FIOl7Szr7q6ctpLCXiFJjLRqtuSSCXE+qjA=;
        b=etP11F0EPNcJljcL3gw0UyqFjDw6ueb2Un2+TdpJpP0Nij+/Upmsgda2Oara43lHwB
         bAi1Y7ojXFVoUpxGobglNuNeWtM9xO+SjDAAdWoQjavohC+m21xlDULRNy1Q+adRtfVh
         xpoE9jjiCZRBjPuRHVilxTsg0ykI+zURqxcgRWmQWE4i7QJC6fJSxBMfnI+oaxq40VGi
         WwpP1fk3dhIM6WiBjuYMxBAjtKUxUDIUqgp5BNjHbB2jMQryDI46mkAvJp/h2/M/Prk7
         xGQteIWfvvXY81zPB+tXTLXGc+fEodrdIO72rKB/Hjbw2Zc7pMmJALL9ZklL8XcI9z7M
         qiBg==
X-Gm-Message-State: APjAAAXTMLS6n9xB8ev7yM52MKJ/H3PGxaF/IyVHwBKCDDc2HiLzQJFH
        1RgdU4D8ksQFoElaWb07pzddjg==
X-Google-Smtp-Source: APXvYqxehoMcp42BMx4NU36PzZo9MQM9r0cs4sI0+/gPlgLXiabiYd1OQJ7khBaf0w2SBvHgTbl0Fg==
X-Received: by 2002:a5d:560f:: with SMTP id l15mr4447006wrv.64.1567719245092;
        Thu, 05 Sep 2019 14:34:05 -0700 (PDT)
Received: from [192.168.1.6] (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id 5sm2535842wmg.42.2019.09.05.14.34.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 14:34:04 -0700 (PDT)
Subject: Re: [PATCH v4] watchdog: qcom: support pre-timeout when the bark irq
 is available
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     agross@kernel.org, wim@linux-watchdog.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190905210035.9985-1-jorge.ramirez-ortiz@linaro.org>
 <20190905211913.GA31094@roeck-us.net>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <68ca07e6-efa2-d5bd-111b-faaa86808192@linaro.org>
Date:   Thu, 5 Sep 2019 23:34:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905211913.GA31094@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/5/19 23:19, Guenter Roeck wrote:
> On Thu, Sep 05, 2019 at 11:00:35PM +0200, Jorge Ramirez-Ortiz wrote:
>> Use the bark interrupt as the pre-timeout notifier whenever this
>> interrupt is available.
>>
>> By default, the pretimeout notification shall occur one second earlier
>> than the timeout.
>>
>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>> ---
>>  v4:
>>      address Guenter Roeck comments as follows:
>>        remove unnecessary include and private variable
>>        provide macro for WDT EN register values
>>        use pretimeout as per its API intent
>>        handle EPROBE_DEFER on get_irq
>>      also:
>>        handle the irq registration as done in pm8916_wdt.c
>>  v3:
>>     remove unnecesary variable added to private.
>>
>>  v2:
>>     register the pre-timeout notifier instead.
>>
>>  v1:
>>  drivers/watchdog/qcom-wdt.c | 64 ++++++++++++++++++++++++++++++++++---
>>  1 file changed, 59 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
>> index 7be7f87be28f..0f1d29eeb81d 100644
>> --- a/drivers/watchdog/qcom-wdt.c
>> +++ b/drivers/watchdog/qcom-wdt.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/watchdog.h>
>>  #include <linux/of_device.h>
>> +#include <linux/interrupt.h>
>>  
>>  enum wdt_reg {
>>  	WDT_RST,
>> @@ -19,6 +20,9 @@ enum wdt_reg {
>>  	WDT_BITE_TIME,
>>  };
>>  
>> +#define QCOM_WDT_ENABLE		BIT(0)
>> +#define QCOM_WDT_ENABLE_IRQ	BIT(1)
>> +
> 
> Using BIT() requires "#include <linux/bits.h>".

do you want it explicitly in the file even if it builds?

> 
>>  static const u32 reg_offset_data_apcs_tmr[] = {
>>  	[WDT_RST] = 0x38,
>>  	[WDT_EN] = 0x40,
>> @@ -54,15 +58,38 @@ struct qcom_wdt *to_qcom_wdt(struct watchdog_device *wdd)
>>  	return container_of(wdd, struct qcom_wdt, wdd);
>>  }
>>  
>> +static inline int qcom_get_enable(struct watchdog_device *wdd)
>> +{
>> +	int enable = QCOM_WDT_ENABLE;
>> +
>> +	if (wdd->info->options & WDIOF_PRETIMEOUT)
>> +		enable |= QCOM_WDT_ENABLE_IRQ;
>> +
> 
> Again, the condition needs to be that pretimeout != 0,
> not that it is supported.

no I dont think so. doing that would propagate a possible error in some
pretimeout setup code which would end up enabling an interrupt when it
shouldnt. so I dont think that doing that would be correct.

The interrupt should only be enabled if WDIOF_PRETIMEOUT is configured
(independently of the pretimeout value); as a matter of fact, if
pretimeout is 0, the interrupt will trigger at the same time than bark
(which is what the original code used to do).

so I'd rather keep this condition unless you strongly oppose to it.

> 
>> +	return enable;
>> +}
>> +
>> +static irqreturn_t qcom_wdt_isr(int irq, void *arg)
>> +{
>> +	struct watchdog_device *wdd = arg;
>> +
>> +	watchdog_notify_pretimeout(wdd);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>>  static int qcom_wdt_start(struct watchdog_device *wdd)
>>  {
>>  	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
>> +	unsigned int bark = wdd->timeout;
>> +
>> +	if (wdd->pretimeout)
>> +		bark = bark - wdd->pretimeout;
> 
> The if() just adds code and doesn't otherwise do any good.

yeah, was just for clarity and it is surely removed by the compiler. but
sure will remove

> 
>>  
>>  	writel(0, wdt_addr(wdt, WDT_EN));
>>  	writel(1, wdt_addr(wdt, WDT_RST));
>> -	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
>> +	writel(bark * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
>>  	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BITE_TIME));
>> -	writel(1, wdt_addr(wdt, WDT_EN));
>> +	writel(qcom_get_enable(wdd), wdt_addr(wdt, WDT_EN));
>>  	return 0;
>>  }
>>  
>> @@ -89,6 +116,13 @@ static int qcom_wdt_set_timeout(struct watchdog_device *wdd,
>>  	return qcom_wdt_start(wdd);
>>  }
>>  
>> +static int qcom_wdt_set_pretimeout(struct watchdog_device *wdd,
>> +				   unsigned int timeout)
>> +{
>> +	wdd->pretimeout = timeout;
>> +	return qcom_wdt_start(wdd);
>> +}
>> +
>>  static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>>  			    void *data)
>>  {
>> @@ -105,7 +139,7 @@ static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>>  	writel(1, wdt_addr(wdt, WDT_RST));
>>  	writel(timeout, wdt_addr(wdt, WDT_BARK_TIME));
>>  	writel(timeout, wdt_addr(wdt, WDT_BITE_TIME));
>> -	writel(1, wdt_addr(wdt, WDT_EN));
>> +	writel(qcom_get_enable(wdd), wdt_addr(wdt, WDT_EN));
>>  
>>  	/*
>>  	 * Actually make sure the above sequence hits hardware before sleeping.
>> @@ -121,6 +155,7 @@ static const struct watchdog_ops qcom_wdt_ops = {
>>  	.stop		= qcom_wdt_stop,
>>  	.ping		= qcom_wdt_ping,
>>  	.set_timeout	= qcom_wdt_set_timeout,
>> +	.set_pretimeout	= qcom_wdt_set_pretimeout,
>>  	.restart        = qcom_wdt_restart,
>>  	.owner		= THIS_MODULE,
>>  };
>> @@ -133,6 +168,15 @@ static const struct watchdog_info qcom_wdt_info = {
>>  	.identity	= KBUILD_MODNAME,
>>  };
>>  
>> +static const struct watchdog_info qcom_wdt_pt_info = {
>> +	.options	= WDIOF_KEEPALIVEPING
>> +			| WDIOF_MAGICCLOSE
>> +			| WDIOF_SETTIMEOUT
>> +			| WDIOF_PRETIMEOUT
>> +			| WDIOF_CARDRESET,
>> +	.identity	= KBUILD_MODNAME,
>> +};
>> +
>>  static void qcom_clk_disable_unprepare(void *data)
>>  {
>>  	clk_disable_unprepare(data);
>> @@ -146,7 +190,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>>  	struct device_node *np = dev->of_node;
>>  	const u32 *regs;
>>  	u32 percpu_offset;
>> -	int ret;
>> +	int irq, ret;
>>  
>>  	regs = of_device_get_match_data(dev);
>>  	if (!regs) {
>> @@ -204,7 +248,17 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>>  		return -EINVAL;
>>  	}
>>  
>> -	wdt->wdd.info = &qcom_wdt_info;
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (irq > 0) {
>> +		if (devm_request_irq(dev, irq, qcom_wdt_isr,
>> +				     IRQF_TRIGGER_RISING, "wdt_bark",
>> +				     &wdt->wdd))
>> +			irq = 0;
>> +	} else if (irq == -EPROBE_DEFER)
>> +		return -EPROBE_DEFER;
>> +
>> +	wdt->wdd.info = irq > 0 ? &qcom_wdt_pt_info : &qcom_wdt_info;
>> +	wdt->wdd.pretimeout = irq > 0 ? 1 : 0;
> 
> Why repeat the conditional ? It seems to me that something like
> 
> 	wdt->wdd.info = &qcom_wdt_info;
> 	...
> 	if (irq > 0) {
> 		wdt->wdd.info = &qcom_wdt_pt_info;
> 		wdt->wdd.pretimeout = 1;
> 		...
> 	}
> 
> would be much easier and avoid the repeated conditionals.

I agree. will change.

> 
>>  	wdt->wdd.ops = &qcom_wdt_ops;
>>  	wdt->wdd.min_timeout = 1;
>>  	wdt->wdd.max_timeout = 0x10000000U / wdt->rate;
>> -- 
>> 2.23.0
>>
> 

