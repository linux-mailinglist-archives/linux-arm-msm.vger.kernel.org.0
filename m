Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAA8E72C23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 12:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfGXKKZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 06:10:25 -0400
Received: from foss.arm.com ([217.140.110.172]:38340 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbfGXKKZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 06:10:25 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B657337;
        Wed, 24 Jul 2019 03:10:24 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 862743F71F;
        Wed, 24 Jul 2019 03:10:23 -0700 (PDT)
Subject: Re: [PATCH] dma: qcom: hidma_mgmt: Add of_node_put() before goto
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>, okaya@kernel.org,
        agross@kernel.org, vkoul@kernel.org, dan.j.williams@intel.com,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org
References: <20190723103543.7888-1-nishkadg.linux@gmail.com>
 <b5b76ef6-c5f3-bab0-e981-cd47c7264959@arm.com>
 <6ef666c3-a155-130d-24bc-8c04b3485d44@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <9d5a995d-74b6-742a-f5c2-ac9227f7cae0@arm.com>
Date:   Wed, 24 Jul 2019 11:10:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6ef666c3-a155-130d-24bc-8c04b3485d44@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/07/2019 09:05, Nishka Dasgupta wrote:
> On 23/07/19 5:32 PM, Robin Murphy wrote:
>> On 23/07/2019 11:35, Nishka Dasgupta wrote:
>>> Each iteration of for_each_available_child_of_node puts the previous
>>> node, but in the case of a goto from the middle of the loop, there is
>>> no put, thus causing a memory leak. Add an of_node_put before the
>>> goto in 4 places.
>>
>> Why not just add it once at the "out" label itself? (Consider the 
>> conditions for the loop terminating naturally)
> 
> If the loop terminates naturally then, as far as I understand, child 
> will be put by the loop itself; then an extra of_node_put() under the 
> out label would put the child node even though it has already been put. 
> If I'm understanding this correctly (and I might not be) is it okay to 
> decrement refcount more times that it is incremented?

Ah, but is it really the same thing being put both times? The loop 
*iterator* will indeed drop its reference on the last valid child node, 
but what's the actual termination condition, and thus the state 
afterwards? ;)

Robin.

>> And if you're cleaning up the refcounting here anyway then I'd also 
>> note that the reference held by the loop iterator makes the extra 
>> get/put inside that loop entirely redundant. It's always worth taking 
>> a look at the wider context rather than just blindly focusing on what 
>> a given script picks up - it's fairly rare that a piece of code has 
>> one obvious issue but is otherwise perfect.
> 
> Thank  you for pointing this out; I've added it in v2.
> 
> Thanking you,
> Nishka
>> Robin.
>>
>>> Issue found with Coccinelle.
>>>
>>> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
>>> ---
>>>   drivers/dma/qcom/hidma_mgmt.c | 13 ++++++++++---
>>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/dma/qcom/hidma_mgmt.c 
>>> b/drivers/dma/qcom/hidma_mgmt.c
>>> index 3022d66e7a33..209adc6ceabe 100644
>>> --- a/drivers/dma/qcom/hidma_mgmt.c
>>> +++ b/drivers/dma/qcom/hidma_mgmt.c
>>> @@ -362,16 +362,22 @@ static int __init 
>>> hidma_mgmt_of_populate_channels(struct device_node *np)
>>>           struct platform_device *new_pdev;
>>>           ret = of_address_to_resource(child, 0, &res[0]);
>>> -        if (!ret)
>>> +        if (!ret) {
>>> +            of_node_put(child);
>>>               goto out;
>>> +        }
>>>           ret = of_address_to_resource(child, 1, &res[1]);
>>> -        if (!ret)
>>> +        if (!ret) {
>>> +            of_node_put(child);
>>>               goto out;
>>> +        }
>>>           ret = of_irq_to_resource(child, 0, &res[2]);
>>> -        if (ret <= 0)
>>> +        if (ret <= 0) {
>>> +            of_node_put(child);
>>>               goto out;
>>> +        }
>>>           memset(&pdevinfo, 0, sizeof(pdevinfo));
>>>           pdevinfo.fwnode = &child->fwnode;
>>> @@ -386,6 +392,7 @@ static int __init 
>>> hidma_mgmt_of_populate_channels(struct device_node *np)
>>>           new_pdev = platform_device_register_full(&pdevinfo);
>>>           if (IS_ERR(new_pdev)) {
>>>               ret = PTR_ERR(new_pdev);
>>> +            of_node_put(child);
>>>               goto out;
>>>           }
>>>           of_node_get(child);
>>>
> 
