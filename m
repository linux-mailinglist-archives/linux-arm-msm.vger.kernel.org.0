Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEBA41A31D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 11:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgDIJe2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 05:34:28 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:54743 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725987AbgDIJe2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 05:34:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586424869; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FawigcI4otjknp22YFn6zSI5pcdBGoJv9cwzgd6qVCA=;
 b=Bz8VWJGlT0qQnimdrs2tkDJNLjutv5hB1MQb9UucBDiauC593csWia1oFVn6zzZqE4TjLqdq
 +Jpw52yPzGxx8dDoP71uBPEb8fWP0O5C38rEofjXpX1yvwVp0IUlthmVA/uEiB4IvDjpPXq4
 ZNQnd4xOLjLtgLxPRN6vsUdQ5NI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8eec24.7f7bba8df0d8-smtp-out-n01;
 Thu, 09 Apr 2020 09:34:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6DEE6C44791; Thu,  9 Apr 2020 09:34:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7A32DC433D2;
        Thu,  9 Apr 2020 09:34:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 09 Apr 2020 15:04:27 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
        swboyd@chromium.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [RFC PATCH] coresight: dynamic-replicator: Fix handling of
 multiple connections
In-Reply-To: <671892c3-b90d-73f0-4706-b74b40002260@arm.com>
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
 <671892c3-b90d-73f0-4706-b74b40002260@arm.com>
Message-ID: <fd20605ba5b98b5c1120e24f0f330166@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On 2020-04-09 14:47, Suzuki K Poulose wrote:
> Hi Sai,
> 
> 
> Thanks for the quick testing ! Please see below for the
> tmc_etr probe failure.
> 
> On 04/09/2020 08:51 AM, Sai Prakash Ranjan wrote:
>> Hi Suzuki,
>> 
>> On 2020-04-09 04:13, Suzuki K Poulose wrote:
>>> On Tue, Apr 07, 2020 at 08:48:54PM +0530, Sai Prakash Ranjan wrote:
>>> 
>>> Please find the untested patch below.
>>> 
>>> ---8>---
>>> 
>>> [untested] coresight: Fix support for sparse port numbers
>>> 
>>> On some systems the firmware may not describe all the ports
>>> connected to a component (e.g, for security reasons). This
>>> could be especially problematic for "funnels" where we could
>>> end up in modifying memory beyond the allocated space for
>>> refcounts.
>>> 
>>> e.g, for a funnel with input ports listed 0, 3, 5, nr_inport = 3.
>>> However the we could access refcnts[5] while checking for
>>> references.
>>> 
>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> ---
>>>  .../hwtracing/coresight/coresight-platform.c  | 74 
>>> ++++++++++++-------
>>>  drivers/hwtracing/coresight/coresight.c       |  8 +-
>>>  2 files changed, 56 insertions(+), 26 deletions(-)
>>> 
>>> diff --git a/drivers/hwtracing/coresight/coresight-platform.c
>>> b/drivers/hwtracing/coresight/coresight-platform.c
>>> index 3c5bee429105..1c610d6e944b 100644
>>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>>> @@ -67,6 +67,7 @@ static void of_coresight_get_ports_legacy(const
> 
> [...]
> 
>>> @@ -684,8 +702,13 @@ static int acpi_coresight_parse_graph(struct
>>> acpi_device *adev,
>>>          return rc;
>>> 
>>>      /* Copy the connection information to the final location */
>>> -    for (i = 0; i < pdata->nr_outport; i++)
>>> -        pdata->conns[i] = conns[i];
>>> +    for (i = 0; conns + i < ptr; i++) {
>>> +        int port = conns[i].outport;
>>> +
>>> +        /* Duplicate output port */
>>> +        WARN_ON(pdata->conns[port].child_fwnode);
>>> +        pdata->conns[port] = conns[i];
>>> +    }
>>> 
>>>      devm_kfree(&adev->dev, conns);
>>>      return 0;
>>> @@ -787,6 +810,7 @@ coresight_get_platform_data(struct device *dev)
>>>          goto error;
>>> 
>>>      pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>>> +    pdata->nr_outport = pdata->nr_inport = -1;
> 
> 
> Please could you remove this hunk and test it ? I forgot to update the
> commit before I sent this over.
> 

I don't see the ETR probe failure and the KASAN warning anymore with 
this change.

Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
