Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 381A61D3936
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 20:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgENSjf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 14:39:35 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:36612 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726188AbgENSjf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 14:39:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589481573; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=GGdwcTBM4BOYqS3NJ4QzufQIMTIAR3b8muj5z/wqzWc=;
 b=IvmbiAT2JP/UJ1LGdF0row3/rIr6UtSjmNDAb0T4rgYrcRQiF7x45+c4omQMJh0OOOEQ4n0X
 xxlJ1Ek6g5WGgdr9LaEEgSLBfypf5j1uNiUjzIrsBvvPiM+AJ+D8/M9dPuZd6wDWUHJyo6lh
 +rCPpdurZMuNXHk8JnENV+pmAvU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd905f.7ff1a617fed8-smtp-out-n04;
 Thu, 14 May 2020 18:39:27 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 41333C433F2; Thu, 14 May 2020 18:39:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D48C7C4478C;
        Thu, 14 May 2020 18:39:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 15 May 2020 00:09:23 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Tingwei Zhang <tingwei@codeaurora.org>,
        coresight@lists.linaro.org
Subject: Re: [PATCH] coresight: etm4x: Add support to disable trace unit power
 up
In-Reply-To: <20200514180055.GA29384@xps15>
References: <20200514105915.27516-1-saiprakash.ranjan@codeaurora.org>
 <20200514180055.GA29384@xps15>
Message-ID: <2c932d57288508cc72a6ee323cf5595e@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

On 2020-05-14 23:30, Mathieu Poirier wrote:
> Good morning Sai,
> 
> On Thu, May 14, 2020 at 04:29:15PM +0530, Sai Prakash Ranjan wrote:
>> From: Tingwei Zhang <tingwei@codeaurora.org>
>> 
>> On some Qualcomm Technologies Inc. SoCs like SC7180, there
>> exists a hardware errata where the APSS (Application Processor
>> SubSystem)/CPU watchdog counter is stopped when ETM register
>> TRCPDCR.PU=1.
> 
> Fun stuff...
> 

Yes :)

>> Since the ETMs share the same power domain as
>> that of respective CPU cores, they are powered on when the
>> CPU core is powered on. So we can disable powering up of the
>> trace unit after checking for this errata via new property
>> called "qcom,tupwr-disable".
>> 
>> Signed-off-by: Tingwei Zhang <tingwei@codeaurora.org>
>> Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Tingwei Zhang <tingwei@codeaurora.org>
> 

Tingwei is the author, so if I understand correctly, his signed-off-by
should appear first, am I wrong?

>> ---
>>  .../devicetree/bindings/arm/coresight.txt     |  6 ++++
>>  drivers/hwtracing/coresight/coresight-etm4x.c | 29 
>> ++++++++++++-------
> 
> Please split in two patches.
> 

Sure, I will split the dt-binding into separate patch, checkpatch did 
warn.

>>  2 files changed, 25 insertions(+), 10 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt 
>> b/Documentation/devicetree/bindings/arm/coresight.txt
>> index 846f6daae71b..d2030128fe46 100644
>> --- a/Documentation/devicetree/bindings/arm/coresight.txt
>> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
>> @@ -108,6 +108,12 @@ its hardware characteristcs.
>>  	* arm,cp14: must be present if the system accesses ETM/PTM 
>> management
>>  	  registers via co-processor 14.
>> 
>> +	* qcom,tupwr-disable: boolean. Indicates that trace unit power up 
>> can
>> +	  be disabled on Qualcomm Technologies Inc. systems where ETMs are 
>> in
>> +	  the same power domain as their CPU cores. This property is 
>> required
>> +	  to identify such systems with hardware errata where the CPU 
>> watchdog
>> +	  counter is stopped when TRCPDCR.PU=1.
>> +
> 
> I think something like "qcom,skip-power-up" would be clearer.
> 
> Also, a better choice of words is that TRCPDCR.PU does not have to be 
> set on
> Qualcomm...
> 

Yes "qcom,skip-power-up" is a lot better, thanks. Also will use 
something as
you suggested for description.

>>  * Optional property for TMC:
>> 
>>  	* arm,buffer-size: size of contiguous buffer space for TMC ETR
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c 
>> b/drivers/hwtracing/coresight/coresight-etm4x.c
>> index fb0f5f4f3a91..6886b44f6947 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
>> @@ -104,6 +104,11 @@ struct etm4_enable_arg {
>>  	int rc;
>>  };
>> 
>> +static inline bool etm4_can_disable_tupwr(struct device *dev)
>> +{
>> +	return fwnode_property_present(dev_fwnode(dev), 
>> "qcom,tupwr-disable");
>> +}
>> +
> 
> Please call fwnode_property_present() at initialisation time to set a 
> new
> drvdata::skip_power_up variable.  From there just switch on that in
> etm4_enable/disable_hw().
> 

Will do, thanks.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
