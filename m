Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 078A01A785A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 12:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438293AbgDNKYS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 06:24:18 -0400
Received: from foss.arm.com ([217.140.110.172]:52518 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438288AbgDNKVV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 06:21:21 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA7FF1FB;
        Tue, 14 Apr 2020 03:21:11 -0700 (PDT)
Received: from [10.37.12.1] (unknown [10.37.12.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A4FE3F6C4;
        Tue, 14 Apr 2020 03:21:10 -0700 (PDT)
Subject: Re: [PATCH] coresight: Fix support for sparsely populated ports
To:     mathieu.poirier@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        coresight@lists.linaro.org, saiprakash.ranjan@codeaurora.org,
        leo.yan@linaro.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, mike.leach@linaro.org
References: <20200409110316.409148-1-suzuki.poulose@arm.com>
 <20200410181745.GA13684@xps15>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <e63508ed-44ca-3844-809c-a8b356a89bf4@arm.com>
Date:   Tue, 14 Apr 2020 11:25:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20200410181745.GA13684@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

On 04/10/2020 07:17 PM, Mathieu Poirier wrote:
> Hi Suzuki,
> 
> On Thu, Apr 09, 2020 at 12:03:16PM +0100, Suzuki K Poulose wrote:
>> On some systems the firmware may not describe all the ports
>> connected to a component (e.g, for security reasons). This
>> could be especially problematic for "funnels" where we could
>> end up in modifying memory beyond the allocated space for
>> refcounts.

...

>> @@ -672,10 +687,14 @@ static int acpi_coresight_parse_graph(struct acpi_device *adev,
>>   			return dir;
>>   
>>   		if (dir == ACPI_CORESIGHT_LINK_MASTER) {
>> -			pdata->nr_outport++;
>> +			if (ptr->outport > pdata->nr_outport)
>> +				pdata->nr_outport = ptr->outport;
>>   			ptr++;
>>   		} else {
>> -			pdata->nr_inport++;
>> +			WARN_ON(pdata->nr_inport == ptr->child_port);
>> +			/* Do not move the ptr for input connections */
>> +			if (ptr->child_port > pdata->nr_inport)
>> +				pdata->nr_inport = ptr->child_port;
> 
> How you are using the current ptr as a scratch pad for input port was definitely
> a brain twister this morning...  I would certainly appreciate a richer comment
> so that I (or anyone else) doesn't have to go through the same process the next
> time around.
> 

Sure, it deserves a better comment. I will add something like :

	/*
	 * We don't track input connection details for a device,
	 * except for the highest input port number. Thus we could
	 * reuse the current record as a scratch pad and reuse it
	 * by not moving the ptr ahead.
	 */



>>   /**
>> - * struct coresight_platform_data - data harvested from the DT specification
>> - * @nr_inport:	number of input ports for this component.
>> - * @nr_outport:	number of output ports for this component.
>> - * @conns:	Array of nr_outport connections from this component
>> + * struct coresight_platform_data - data harvested from the firmware
>> + * specification.
>> + *
>> + * @nr_inport:	Number of elements for the input connections.
>> + * @nr_outport:	Number of elements for the output connections.
>> + * @conns:	Sparse arrray of nr_outport connections from this component.
> 
> s/arrray/array
> 
> Please rebase your work on my the coresight-next branch.  Other than the above
> this patch looks fine to me.

Thanks for the heads up, will do.

Cheers
Suzuki
