Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A116D28FFFF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 10:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394603AbgJPIcT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 04:32:19 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:58068 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394465AbgJPIcS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 04:32:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602837137; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RmmYpioX2izB6QWy7vq8wVEGZecfk4p8IlN8BmlChlE=;
 b=OIsS0nMrAM2i1geYKv4Pdlzzo6Jg1XDV4fv2NJ6MeCTXAQOIUGkauSkROofB11B7M6VChDwC
 7Z7azQrSsY2v0qjqWc0WDq6PWoQO57+fqXYjjaMtpuXaefXtnhcz9YGH99iF52w35aIcYktX
 GCzrcLVTtt37AG2mLwD5NguHMaA=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f895a3f588858a304563354 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Oct 2020 08:30:55
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 732FDC43385; Fri, 16 Oct 2020 08:30:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 770DCC433CB;
        Fri, 16 Oct 2020 08:30:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 16 Oct 2020 14:00:53 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     mathieu.poirier@linaro.org, mike.leach@linaro.org,
        peterz@infradead.org, coresight@lists.linaro.org,
        swboyd@chromium.org, denik@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] coresight: etm4x: Add config to exclude kernel mode
 tracing
In-Reply-To: <c02be978-5d78-b88d-ea87-b9958b6e3a05@arm.com>
References: <20201015124522.1876-1-saiprakash.ranjan@codeaurora.org>
 <c02be978-5d78-b88d-ea87-b9958b6e3a05@arm.com>
Message-ID: <2b5c14ca55b57430ac1d7aac533d45de@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On 2020-10-15 19:57, Suzuki K Poulose wrote:
> Hi Sai,
> 
> On 10/15/2020 01:45 PM, Sai Prakash Ranjan wrote:
>> On production systems with ETMs enabled, it is preferred to
>> exclude kernel mode(NS EL1) tracing for security concerns and
>> support only userspace(NS EL0) tracing. So provide an option
>> via kconfig to exclude kernel mode tracing if it is required.
>> This config is disabled by default and would not affect the
>> current configuration which has both kernel and userspace
>> tracing enabled by default.
> 
> While this solution works for ETM4x, I would prefer if we did
> this in a more generic way. There are other hardware tracing
> PMUs that provide instruction tracing (e.g, Intel PT, even ETM3x)
> and it would be good to have a single option that works everywhere.
> 
> Something like EXCLUDE_KERNEL_HW_ITRACE, which can be honored by
> all tracing drivers ?

I can add this for ETM3x as well but I have zero idea regarding
Intel PTs, is there any code in those hwtracing PMUs actually
excluding kernel mode tracing currently?

>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>   drivers/hwtracing/coresight/Kconfig                | 9 +++++++++
>>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 6 +++++-
>>   2 files changed, 14 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/hwtracing/coresight/Kconfig 
>> b/drivers/hwtracing/coresight/Kconfig
>> index c1198245461d..52435de8824c 100644
>> --- a/drivers/hwtracing/coresight/Kconfig
>> +++ b/drivers/hwtracing/coresight/Kconfig
>> @@ -110,6 +110,15 @@ config CORESIGHT_SOURCE_ETM4X
>>   	  To compile this driver as a module, choose M here: the
>>   	  module will be called coresight-etm4x.
>>   +config CORESIGHT_ETM4X_EXCL_KERN
>> +	bool "Coresight ETM 4.x exclude kernel mode tracing"
>> +	depends on CORESIGHT_SOURCE_ETM4X
>> +	help
>> +	  This will exclude kernel mode(NS EL1) tracing if enabled. This 
>> option
>> +	  will be useful to provide more flexible options on production 
>> systems
>> +	  where only userspace(NS EL0) tracing might be preferred for 
>> security
>> +	  reasons.
>> +
>>   config CORESIGHT_STM
>>   	tristate "CoreSight System Trace Macrocell driver"
>>   	depends on (ARM && !(CPU_32v3 || CPU_32v4 || CPU_32v4T)) || ARM64
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c 
>> b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index abd706b216ac..7e5669e5cd1f 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -832,6 +832,9 @@ static u64 etm4_get_ns_access_type(struct 
>> etmv4_config *config)
>>   {
>>   	u64 access_type = 0;
>>   +	if (IS_ENABLED(CONFIG_CORESIGHT_ETM4X_EXCL_KERN))
>> +		config->mode |= ETM_MODE_EXCL_KERN;
>> +
> 
> Rather than hacking the mode behind the back, could we always make sure 
> that
> mode is not set in the first place and return this back to the user 
> with
> proper errors (see below) ?
> 

Sure, this was the minimal change with which I could keep the
check in one place which would work for both sysfs and perf,
but I'll change as you suggested and move the check to
etm4_parse_event_config() and etm4_config_trace_mode() and
return errors properly.

>>   	/*
>>   	 * EXLEVEL_NS, bits[15:12]
>>   	 * The Exception levels are:
>> @@ -849,7 +852,8 @@ static u64 etm4_get_ns_access_type(struct 
>> etmv4_config *config)
>>   		access_type = ETM_EXLEVEL_NS_HYP;
>>   	}
>>   -	if (config->mode & ETM_MODE_EXCL_USER)
>> +	if (config->mode & ETM_MODE_EXCL_USER &&
>> +	    !IS_ENABLED(CONFIG_CORESIGHT_ETM4X_EXCL_KERN))
>>   		access_type |= ETM_EXLEVEL_NS_APP;
> 
> Why is this needed ?
> 

Yes this will not be required as excluding both doesn't make
sense and we print warning in that case already, will drop
this.

> Also we should return an error if the sysfs mode ever tries to clear
> the mode bit
> for kernel in config->mode.
> 

Yes will change as explained in above comment.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
