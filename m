Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5A91ACD99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 18:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403776AbgDPQYS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 12:24:18 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:35770 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732572AbgDPQYR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 12:24:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587054256; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=bwde/P04Uj3GTzNnCbAcH3UyrPWOeOqsIWQwb1Jxqqc=;
 b=AAOFMdrOMjYnQd8BS6wswKtEerHxuyUwo+9WqAqJvum24aZF0nG7FTFrePZmR25DBUE4I62K
 wyKDFrhwTtzWi9HjtMXFnlNjXtx0u3ICRiDB1G7Eei7L8jrPQkxF8mcsmOQsmUSDT8zX9BoC
 K47nUDOoOP8rbQ3vd1+UTjQMHrM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9886a1.7f930d7a33b0-smtp-out-n04;
 Thu, 16 Apr 2020 16:24:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4D503C44788; Thu, 16 Apr 2020 16:24:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8065AC433BA;
        Thu, 16 Apr 2020 16:23:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 16 Apr 2020 21:53:58 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
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
Subject: Re: [PATCH 2/2] iommu/arm-smmu: Allow client devices to select direct
 mapping
In-Reply-To: <3f12cefb-3887-859c-ddf5-c7a0fc755152@arm.com>
References: <cover.1579692800.git.saiprakash.ranjan@codeaurora.org>
 <813cc5b2da10c27db982254b274bf26008a9e6da.1579692800.git.saiprakash.ranjan@codeaurora.org>
 <3f12cefb-3887-859c-ddf5-c7a0fc755152@arm.com>
Message-ID: <540fc55811d0a60a929ff1f694d6d271@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

On 2020-04-16 19:28, Robin Murphy wrote:
> On 2020-01-22 11:48 am, Sai Prakash Ranjan wrote:
>> From: Jordan Crouse <jcrouse@codeaurora.org>
>> 
>> Some client devices want to directly map the IOMMU themselves instead
>> of using the DMA domain. Allow those devices to opt in to direct
>> mapping by way of a list of compatible strings.
>> 
>> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
>> Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>   drivers/iommu/arm-smmu-qcom.c | 39 
>> +++++++++++++++++++++++++++++++++++
>>   drivers/iommu/arm-smmu.c      |  3 +++
>>   drivers/iommu/arm-smmu.h      |  5 +++++
>>   3 files changed, 47 insertions(+)
>> 
>> diff --git a/drivers/iommu/arm-smmu-qcom.c 
>> b/drivers/iommu/arm-smmu-qcom.c
>> index 64a4ab270ab7..ff746acd1c81 100644
>> --- a/drivers/iommu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm-smmu-qcom.c
>> @@ -3,6 +3,7 @@
>>    * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>>    */
>>   +#include <linux/of_device.h>
>>   #include <linux/qcom_scm.h>
>>     #include "arm-smmu.h"
>> @@ -11,6 +12,43 @@ struct qcom_smmu {
>>   	struct arm_smmu_device smmu;
>>   };
>>   +static const struct arm_smmu_client_match_data qcom_adreno = {
>> +	.direct_mapping = true,
>> +};
>> +
>> +static const struct arm_smmu_client_match_data qcom_mdss = {
>> +	.direct_mapping = true,
>> +};
> 
> Might it make sense to group these by the desired SMMU behaviour
> rather than (apparently) what kind of device the client happens to be,
> which seems like a completely arbitrary distinction from the SMMU
> driver's PoV?
> 

Sorry, I did not get the "grouping by the desired SMMU behaviour" thing.
Could you please give some more details?

>> +
>> +static const struct of_device_id qcom_smmu_client_of_match[] = {
>> +	{ .compatible = "qcom,adreno", .data = &qcom_adreno },
>> +	{ .compatible = "qcom,mdp4", .data = &qcom_mdss },
>> +	{ .compatible = "qcom,mdss", .data = &qcom_mdss },
>> +	{ .compatible = "qcom,sc7180-mdss", .data = &qcom_mdss },
>> +	{ .compatible = "qcom,sdm845-mdss", .data = &qcom_mdss },
>> +	{},
>> +};
>> +
>> +static const struct arm_smmu_client_match_data *
>> +qcom_smmu_client_data(struct device *dev)
>> +{
>> +	const struct of_device_id *match =
>> +		of_match_device(qcom_smmu_client_of_match, dev);
>> +
>> +	return match ? match->data : NULL;
> 
> of_device_get_match_data() is your friend.
> 

Ok will use it.

>> +}
>> +
>> +static int qcom_smmu_request_domain(struct device *dev)
>> +{
>> +	const struct arm_smmu_client_match_data *client;
>> +
>> +	client = qcom_smmu_client_data(dev);
>> +	if (client)
>> +		iommu_request_dm_for_dev(dev);
>> +
>> +	return 0;
>> +}
>> +
>>   static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>>   {
>>   	int ret;
>> @@ -41,6 +79,7 @@ static int qcom_smmu500_reset(struct arm_smmu_device 
>> *smmu)
>>   }
>>     static const struct arm_smmu_impl qcom_smmu_impl = {
>> +	.req_domain = qcom_smmu_request_domain,
>>   	.reset = qcom_smmu500_reset,
>>   };
>>   diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
>> index 16c4b87af42b..67dd9326247a 100644
>> --- a/drivers/iommu/arm-smmu.c
>> +++ b/drivers/iommu/arm-smmu.c
>> @@ -1448,6 +1448,9 @@ static int arm_smmu_add_device(struct device 
>> *dev)
>>   	device_link_add(dev, smmu->dev,
>>   			DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
>>   +	if (smmu->impl && smmu->impl->req_domain)
>> +		return smmu->impl->req_domain(dev);
>> +
> 
> There are about 5 different patchsets flying around at the moment that
> all touch default domain allocation, so this is a fast-moving target,
> but I think where the dust should settle is with arm_smmu_ops
> forwarding .def_domain_type (or whatever it ends up as) calls to
> arm_smmu_impl as appropriate.
> 

I'll wait till the dust settles down and then post the next version.

>>   	return 0;
>>     out_cfg_free:
>> diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
>> index 8d1cd54d82a6..059dc9c39f64 100644
>> --- a/drivers/iommu/arm-smmu.h
>> +++ b/drivers/iommu/arm-smmu.h
>> @@ -244,6 +244,10 @@ enum arm_smmu_arch_version {
>>   	ARM_SMMU_V2,
>>   };
>>   +struct arm_smmu_client_match_data {
>> +	bool direct_mapping;
>> +};
> 
> Does this need to be public? I don't see the other users...
> 

Will move this out.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
