Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 578214E5EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 12:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfFUKbf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 06:31:35 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52876 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfFUKbf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 06:31:35 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6E9C161706; Fri, 21 Jun 2019 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561113093;
        bh=83saP5agyCLRXJFITOAnGb07C5NHBmkBg6UjpUVttgY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XK3OmDbiGqcrSHWfrgYDgdZeDeTuKusvrdvOqek9PdlK9A+QPGfIW/dfyqG1zeWol
         6+/dwqOnMXgnLcJUwInGC4TOKQI1qUS/kUvbq0q7YHinqrBkWphjckGyXJPzPs3J1Q
         GsE6SQzsXDJFTq0cQWyfYE0wBBAnDgGaF5hmQT0c=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.27] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 17BFC60A97;
        Fri, 21 Jun 2019 10:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561113091;
        bh=83saP5agyCLRXJFITOAnGb07C5NHBmkBg6UjpUVttgY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=axloNVl89+yy34mWOOy+ow2feDwzdwCo3bq5O8XkPeD0V00sUYEE7FdmvD27I7bKy
         GrWorYJktFH3kn4yPv4yaKpZPt4GJ/pqGJu8ZKIiqbJQ3t8Hsc7Tm6Y2ZLR2vUGyxR
         1GJ+wioETU4/lFl9rSksdTUGen1YpAYl49oBLyto=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 17BFC60A97
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCHv2 2/2] coresight: Abort probe if cpus are not available
To:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        mathieu.poirier@linaro.org, leo.yan@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, alexander.shishkin@linux.intel.com,
        david.brown@linaro.org, mark.rutland@arm.com
Cc:     rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <cover.1561054498.git.saiprakash.ranjan@codeaurora.org>
 <65050e4cb2b0433f3cb9b1ca0bf6ec49d0751086.1561054498.git.saiprakash.ranjan@codeaurora.org>
 <d6e6a32e-4e15-5bc8-42f9-6cfe72fc0910@arm.com>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <01e1758f-7574-7735-f129-f072f93aeca6@codeaurora.org>
Date:   Fri, 21 Jun 2019 16:01:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <d6e6a32e-4e15-5bc8-42f9-6cfe72fc0910@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On 6/21/2019 3:10 PM, Suzuki K Poulose wrote:
> On 06/20/2019 07:31 PM, Sai Prakash Ranjan wrote:
>> Currently coresight etm and cpu-debug will go ahead with
>> the probe even when corresponding cpus are not available
>> and error out later in the probe path. In such cases, it
>> is better to abort the probe earlier.
>>
>> Without this, setting *nosmp* will throw below errors:
>>
>>   [    5.910622] coresight-cpu-debug 850000.debug: Coresight 
>> debug-CPU0 initialized
>>   [    5.914266] coresight-cpu-debug 852000.debug: CPU1 debug arch 
>> init failed
>>   [    5.921474] coresight-cpu-debug 854000.debug: CPU2 debug arch 
>> init failed
>>   [    5.928328] coresight-cpu-debug 856000.debug: CPU3 debug arch 
>> init failed
>>   [    5.935330] coresight etm0: CPU0: ETM v4.0 initialized
>>   [    5.941875] coresight-etm4x 85d000.etm: ETM arch init failed
>>   [    5.946794] coresight-etm4x: probe of 85d000.etm failed with 
>> error -22
>>   [    5.952707] coresight-etm4x 85e000.etm: ETM arch init failed
>>   [    5.958945] coresight-etm4x: probe of 85e000.etm failed with 
>> error -22
>>   [    5.964853] coresight-etm4x 85f000.etm: ETM arch init failed
>>   [    5.971096] coresight-etm4x: probe of 85f000.etm failed with 
>> error -22
> 
> That is expected. What else do you expect ?
> 
>>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-platform.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-platform.c 
>> b/drivers/hwtracing/coresight/coresight-platform.c
>> index 8b03fa573684..3f4559596c6b 100644
>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>> @@ -168,6 +168,9 @@ static int of_coresight_get_cpu(struct device *dev)
>>       cpu = of_cpu_node_to_id(dn);
>>       of_node_put(dn);
>> +    if (num_online_cpus() <= cpu)
>> +        return -ENODEV;
> 
> That is a pointless and terribly wrong check. What if you have only 2
> online CPUs (CPU0 and CPU4) and you were processing the ETM for CPU4 ?
>

Sorry, I did not consider such cases.

> More over you should simply let the driver handle a case where the CPU
> is not online. May be the driver could register a hotplug notifier and
> bring itself up when the CPU comes online.
> 
> So, please drop this patch.
> 

Sure I will drop this patch.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
