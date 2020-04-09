Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1ED31A3197
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 11:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgDIJMX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 05:12:23 -0400
Received: from foss.arm.com ([217.140.110.172]:47422 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725972AbgDIJMW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 05:12:22 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8850331B;
        Thu,  9 Apr 2020 02:12:22 -0700 (PDT)
Received: from [10.37.12.112] (unknown [10.37.12.112])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A2AC3F73D;
        Thu,  9 Apr 2020 02:12:20 -0700 (PDT)
Subject: Re: [RFC PATCH] coresight: dynamic-replicator: Fix handling of
 multiple connections
To:     saiprakash.ranjan@codeaurora.org
Cc:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
        swboyd@chromium.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20200405102819.28460-1-saiprakash.ranjan@codeaurora.org>
 <CAJ9a7VgQzK1XSCvLwuqODwkWfvo=6Wwps7Db+pL5xYDeCuktrg@mail.gmail.com>
 <6c0f45488f8a44bf860759e00fcabd09@codeaurora.org>
 <906d374d-a4d6-f2f2-6845-88b97a5ff7d9@arm.com>
 <39a2b3fff165a108fa59d72b630b5f14@codeaurora.org>
 <bb209f80-ac02-6321-dac4-ebf9ee6fa9a0@arm.com>
 <bd05b31c2391edfff5044f22f2f83edf@codeaurora.org>
 <e9c299c4-caeb-9eb8-f019-b311bfce756a@arm.com>
 <a7074f44ebbde720b5e0189801eab7c9@codeaurora.org>
 <20200408224347.GA388414@ewhatever.cambridge.arm.com>
 <9ad167836b0a22694d58d24f39db89a6@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <671892c3-b90d-73f0-4706-b74b40002260@arm.com>
Date:   Thu, 9 Apr 2020 10:17:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <9ad167836b0a22694d58d24f39db89a6@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sai,


Thanks for the quick testing ! Please see below for the
tmc_etr probe failure.

On 04/09/2020 08:51 AM, Sai Prakash Ranjan wrote:
> Hi Suzuki,
> 
> On 2020-04-09 04:13, Suzuki K Poulose wrote:
>> On Tue, Apr 07, 2020 at 08:48:54PM +0530, Sai Prakash Ranjan wrote:
>>
>> Please find the untested patch below.
>>
>> ---8>---
>>
>> [untested] coresight: Fix support for sparse port numbers
>>
>> On some systems the firmware may not describe all the ports
>> connected to a component (e.g, for security reasons). This
>> could be especially problematic for "funnels" where we could
>> end up in modifying memory beyond the allocated space for
>> refcounts.
>>
>> e.g, for a funnel with input ports listed 0, 3, 5, nr_inport = 3.
>> However the we could access refcnts[5] while checking for
>> references.
>>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>  .../hwtracing/coresight/coresight-platform.c  | 74 ++++++++++++-------
>>  drivers/hwtracing/coresight/coresight.c       |  8 +-
>>  2 files changed, 56 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-platform.c
>> b/drivers/hwtracing/coresight/coresight-platform.c
>> index 3c5bee429105..1c610d6e944b 100644
>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>> @@ -67,6 +67,7 @@ static void of_coresight_get_ports_legacy(const

[...]

>> @@ -684,8 +702,13 @@ static int acpi_coresight_parse_graph(struct
>> acpi_device *adev,
>>          return rc;
>>
>>      /* Copy the connection information to the final location */
>> -    for (i = 0; i < pdata->nr_outport; i++)
>> -        pdata->conns[i] = conns[i];
>> +    for (i = 0; conns + i < ptr; i++) {
>> +        int port = conns[i].outport;
>> +
>> +        /* Duplicate output port */
>> +        WARN_ON(pdata->conns[port].child_fwnode);
>> +        pdata->conns[port] = conns[i];
>> +    }
>>
>>      devm_kfree(&adev->dev, conns);
>>      return 0;
>> @@ -787,6 +810,7 @@ coresight_get_platform_data(struct device *dev)
>>          goto error;
>>
>>      pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>> +    pdata->nr_outport = pdata->nr_inport = -1;


Please could you remove this hunk and test it ? I forgot to update the
commit before I sent this over.


>>              /* Does it match this newly added device? */
>> @@ -1029,6 +1032,9 @@ static void coresight_fixup_device_conns(struct
>> coresight_device *csdev)
>>          struct coresight_connection *conn = &csdev->pdata->conns[i];
>>          struct device *dev = NULL;
>>
>> +        if (!conn->child_fwnode)
>> +            continue;
>> +
>>          dev = bus_find_device_by_fwnode(&coresight_bustype, 
>> conn->child_fwnode);
>>          if (dev) {
>>              conn->child_dev = to_coresight_device(dev);
>> @@ -1061,7 +1067,7 @@ static int coresight_remove_match(struct device
>> *dev, void *data)
>>      for (i = 0; i < iterator->pdata->nr_outport; i++) {
>>          conn = &iterator->pdata->conns[i];
>>
>> -        if (conn->child_dev == NULL)
>> +        if (conn->child_dev == NULL || conn->child_fwnode == NULL)
>>              continue;
>>
>>          if (csdev->dev.fwnode == conn->child_fwnode) {
> 
> 
> Thanks Suzuki, I don't see the KASAN warning anymore with this patch.
> But somehow tmc_etr probe fails with error -12(ENOMEM).

See the above suggestion.

Cheers
Suzuki
