Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62F221ACE83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 19:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728997AbgDPRRj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 13:17:39 -0400
Received: from foss.arm.com ([217.140.110.172]:38344 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728863AbgDPRRi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 13:17:38 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7287730E;
        Thu, 16 Apr 2020 10:17:37 -0700 (PDT)
Received: from [10.57.59.184] (unknown [10.57.59.184])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CBA23F73D;
        Thu, 16 Apr 2020 10:17:35 -0700 (PDT)
Subject: Re: [PATCH 2/2] iommu/arm-smmu: Allow client devices to select direct
 mapping
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        iommu@lists.linux-foundation.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org
References: <cover.1579692800.git.saiprakash.ranjan@codeaurora.org>
 <813cc5b2da10c27db982254b274bf26008a9e6da.1579692800.git.saiprakash.ranjan@codeaurora.org>
 <3f12cefb-3887-859c-ddf5-c7a0fc755152@arm.com>
 <540fc55811d0a60a929ff1f694d6d271@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <fdc265e4-5a96-2def-df13-376249e16b49@arm.com>
Date:   Thu, 16 Apr 2020 18:17:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <540fc55811d0a60a929ff1f694d6d271@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-16 5:23 pm, Sai Prakash Ranjan wrote:
> Hi Robin,
> 
> On 2020-04-16 19:28, Robin Murphy wrote:
>> On 2020-01-22 11:48 am, Sai Prakash Ranjan wrote:
>>> From: Jordan Crouse <jcrouse@codeaurora.org>
>>>
>>> Some client devices want to directly map the IOMMU themselves instead
>>> of using the DMA domain. Allow those devices to opt in to direct
>>> mapping by way of a list of compatible strings.
>>>
>>> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
>>> Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>> ---
>>>   drivers/iommu/arm-smmu-qcom.c | 39 +++++++++++++++++++++++++++++++++++
>>>   drivers/iommu/arm-smmu.c      |  3 +++
>>>   drivers/iommu/arm-smmu.h      |  5 +++++
>>>   3 files changed, 47 insertions(+)
>>>
>>> diff --git a/drivers/iommu/arm-smmu-qcom.c 
>>> b/drivers/iommu/arm-smmu-qcom.c
>>> index 64a4ab270ab7..ff746acd1c81 100644
>>> --- a/drivers/iommu/arm-smmu-qcom.c
>>> +++ b/drivers/iommu/arm-smmu-qcom.c
>>> @@ -3,6 +3,7 @@
>>>    * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>>>    */
>>>   +#include <linux/of_device.h>
>>>   #include <linux/qcom_scm.h>
>>>     #include "arm-smmu.h"
>>> @@ -11,6 +12,43 @@ struct qcom_smmu {
>>>       struct arm_smmu_device smmu;
>>>   };
>>>   +static const struct arm_smmu_client_match_data qcom_adreno = {
>>> +    .direct_mapping = true,
>>> +};
>>> +
>>> +static const struct arm_smmu_client_match_data qcom_mdss = {
>>> +    .direct_mapping = true,
>>> +};
>>
>> Might it make sense to group these by the desired SMMU behaviour
>> rather than (apparently) what kind of device the client happens to be,
>> which seems like a completely arbitrary distinction from the SMMU
>> driver's PoV?
>>
> 
> Sorry, I did not get the "grouping by the desired SMMU behaviour" thing.
> Could you please give some more details?

I mean this pattern:

device_a_data {
	.thing = this;
}

device_b_data {
	.thing = this;
}

device_c_data {
	.thing = that;
}

match[] = {
	{ .compatible = "A", .data = &device_a_data },
	{ .compatible = "B", .data = &device_b_data },
	{ .compatible = "C", .data = &device_c_data },
};

...vs. this pattern:

do_this {
	.thing = this;
}

do_that {
	.thing = that;
}

match[] = {
	{ .compatible = "A", .data = &do_this },
	{ .compatible = "B", .data = &do_this },
	{ .compatible = "C", .data = &do_that },
};

 From the perspective of the thing doing the thing, grouping the data by 
device is meaningless if all that matters is whether to do this or that. 
The second pattern expresses that more naturally.

Of course if every device turns out to need a unique combination of 
several behaviours, then there ends up being no practical difference 
except that it's probably easier to come up with nice names under the 
first pattern. I guess it's up to how you see this developing in future; 
whether you're likely to need fine-grained per-device control, or don't 
expect it to go much beyond domain type.

Robin.
