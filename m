Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95C857C4F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 16:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbfGaOa6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 10:30:58 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34474 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726993AbfGaOa6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 10:30:58 -0400
Received: by mail-wm1-f65.google.com with SMTP id w9so1436896wmd.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2019 07:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MDnPbJodK/a6eTFi3yfzZVR2rm3ZSgLhYLWa+WneOcQ=;
        b=LObSE0fFJUw55SB99a92enfrZZUq30eu9bG2F/nsfWNxuzV9x2HmIAvxj0KJ9w0KTU
         qrIclXt78r1QBfee5k0HYdjVZ0gbj9fNSGTnKWLZ6ndr3dOMOX7Y3VDxa3DQq8RHuZm5
         /48OTXttWhRqrIZkeXdW6N77lLaaOtC6y8buit2VDJx/IGQ2OpeOYR2S+G8mfirEjQ7g
         NG0SSL/kykYLqhLsE7AUDUa3AqwG9sCxx+/LNHCTnGNh63e8AYQFw+tzeNt3Qzt+XsbL
         JU1G4bO3AWErvXFZ4ADhul3FeEJLOAWayBNWrKY7rYuU1Uxboou2Yj/gCmQ/Ty+MX81g
         igkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MDnPbJodK/a6eTFi3yfzZVR2rm3ZSgLhYLWa+WneOcQ=;
        b=WUxSjB0CVYT+ibxpScNEs2ARPxwjjDNTpmO7pU72P7mYYDCDMfuSyFgCzFKp4aDYN/
         xoDX+zLkjOKTlCuZQzuT5DqQ4LXtJVTvDx9ojRIKDveTvPB1E8r1bvCchRCo25DiBNAH
         6lZZXWKPOnJ0ukHIWFX+LoFjF7iZPOruTyy7jJt5sFZ8fGiu8OUA9VJVBqsBoWS9BeHH
         5bf8zGDE83pyzg4T+EgCnxEMBw/8oKHg2Wu8IDlR9r+WEiC1UneN6I7Cg76Po4cA13Sl
         faYuH3O0Tq7OcXkhOwk86mizCCWAcVz2NO4d9Rb2CJ1KbmHwk95XFbMVcDWMpam3hYPh
         al5w==
X-Gm-Message-State: APjAAAWcVvkC9wM6MPEHAIfxAZmwar+KEDCFv+CR66TBfzGVqP+h5exg
        qlz3w2rqWnCCMygBVOvHrXaQWw==
X-Google-Smtp-Source: APXvYqx/TyzoXLdTkhlTg/t7F+eHNs+DVxViJq91/dI341xTx6DKJZgNxhl4ivgKkc2HMYfOY6jBEw==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr110692820wmc.89.1564583455255;
        Wed, 31 Jul 2019 07:30:55 -0700 (PDT)
Received: from [192.168.1.6] (19.red-176-86-136.dynamicip.rima-tde.net. [176.86.136.19])
        by smtp.gmail.com with ESMTPSA id z6sm61429920wrw.2.2019.07.31.07.30.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 07:30:54 -0700 (PDT)
Subject: Re: [PATCH v3 08/14] clk: qcom: hfpll: CLK_IGNORE_UNUSED
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-9-jorge.ramirez-ortiz@linaro.org>
 <20190711151631.GI7234@tuxbook-pro>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <cd91801a-1be3-86fd-6e15-da7e82fddb53@linaro.org>
Date:   Wed, 31 Jul 2019 16:30:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190711151631.GI7234@tuxbook-pro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/11/19 17:16, Bjorn Andersson wrote:
> On Tue 25 Jun 09:47 PDT 2019, Jorge Ramirez-Ortiz wrote:
> 
>> When COMMON_CLK_DISABLED_UNUSED is set, in an effort to save power and
>> to keep the software model of the clock in line with reality, the
>> framework transverses the clock tree and disables those clocks that
>> were enabled by the firmware but have not been enabled by any device
>> driver.
>>
>> If CPUFREQ is enabled, early during the system boot, it might attempt
>> to change the CPU frequency ("set_rate"). If the HFPLL is selected as
>> a provider, it will then change the rate for this clock.
>>
>> As boot continues, clk_disable_unused_subtree will run. Since it wont
>> find a valid counter (enable_count) for a clock that is actually
>> enabled it will attempt to disable it which will cause the CPU to
>> stop.
> 
> But if CPUfreq has acquired the CPU clock and the hfpll is the currently
> selected input, why does the clock framework not know about this clock
> being used?

right, see the comment right below - maybe I should have been more
explicit at the time. sorry about it.

> 
>> Notice that in this driver, calls to check whether the clock is
>> enabled are routed via the is_enabled callback which queries the
>> hardware.

calls to check whether the clock is enabled dont use the usage counter
but a hardware read. IIRC the clock framework will check some counter to
know if the clock is being used.

>>
>> The following commit, rather than marking the clock critical and
>> forcing the clock to be always enabled, addresses the above scenario
>> making sure the clock is not disabled but it continues to rely on the
>> firmware to enable the clock.
>>
>> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
>> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> 
> 
> I can see that we have a real issue in the case where CPUfreq is not
> enabled and hence there are no clients, according to Linux. And that I
> don't know another way to guard against.

the issue is there when CPUfreq is enabled that is for sure (if we just
remove this commit the system will not boot due to the situation I tried
to describe above).

> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Regards,
> Bjorn
> 
>> ---
>>  drivers/clk/qcom/hfpll.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
>> index 0ffed0d41c50..d5fd27938e7b 100644
>> --- a/drivers/clk/qcom/hfpll.c
>> +++ b/drivers/clk/qcom/hfpll.c
>> @@ -58,6 +58,13 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
>>  		.parent_names = (const char *[]){ "xo" },
>>  		.num_parents = 1,
>>  		.ops = &clk_ops_hfpll,
>> +		/*
>> +		 * rather than marking the clock critical and forcing the clock
>> +		 * to be always enabled, we make sure that the clock is not
>> +		 * disabled: the firmware remains responsible of enabling this
>> +		 * clock (for more info check the commit log)
>> +		 */
>> +		.flags = CLK_IGNORE_UNUSED,
>>  	};
>>  
>>  	h = devm_kzalloc(dev, sizeof(*h), GFP_KERNEL);
>> -- 
>> 2.21.0
>>
> 

