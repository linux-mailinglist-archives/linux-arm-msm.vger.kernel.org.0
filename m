Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32CEF4CB8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 12:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbfFTKIE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 06:08:04 -0400
Received: from foss.arm.com ([217.140.110.172]:57564 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbfFTKIE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 06:08:04 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEFCD360;
        Thu, 20 Jun 2019 03:08:03 -0700 (PDT)
Received: from [10.1.196.93] (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 894FB3F718;
        Thu, 20 Jun 2019 03:08:02 -0700 (PDT)
Subject: Re: Coresight causes synchronous external abort on msm8916
To:     saiprakash.ranjan@codeaurora.org, stephan@gerhold.net,
        mathieu.poirier@linaro.org
Cc:     david.brown@linaro.org, sibis@codeaurora.org,
        rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        agross@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, mike.leach@linaro.org
References: <20190618202623.GA53651@gerhold.net>
 <a51f117f-c48d-d3f4-c3d1-9b584e3a055f@arm.com>
 <20190619183904.GB937@gerhold.net>
 <0dcea9a1-999d-7d85-267e-c3bfcfcfa95a@codeaurora.org>
 <6589bf4d-5b39-c95e-0ee5-aaf35a87b40e@arm.com>
 <78b67245-9053-6175-9f9e-dbb12e5fb55c@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <8742555a-e39e-6e10-6c4b-d0d1f271d158@arm.com>
Date:   Thu, 20 Jun 2019 11:08:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <78b67245-9053-6175-9f9e-dbb12e5fb55c@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sai,

On 20/06/2019 10:51, Sai Prakash Ranjan wrote:

...

>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c
>>> b/drivers/hwtracing/coresight/coresight-etm4x.c
>>> index 8bb0092c7ec2..660432acbac0 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
>>> @@ -1107,7 +1107,10 @@ static int etm4_probe(struct amba_device *adev,
>>> const struct amba_id *id)
>>>
>>>         spin_lock_init(&drvdata->spinlock);
>>>
>>> -    drvdata->cpu = pdata ? pdata->cpu : 0;
>>
>> I believe, we should simply abort when we don't have pdata. There is no
>> point
>> in registering this ETM unless we know where this is connected to.
>>
> 
> I did not understand this comment since I am returning with ENODEV here
> and not registering this ETM.

I meant,

	/* fail the probe, as we don't know where this is connected to */
	if (pdata)
		return -ENOENT;


Cheers
Suzuki
