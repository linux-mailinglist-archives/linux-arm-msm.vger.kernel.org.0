Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B4538E64F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 14:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbhEXMLJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 08:11:09 -0400
Received: from foss.arm.com ([217.140.110.172]:41516 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232110AbhEXMLJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 08:11:09 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C2A931B;
        Mon, 24 May 2021 05:09:40 -0700 (PDT)
Received: from [10.57.73.64] (unknown [10.57.73.64])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29CBC3F719;
        Mon, 24 May 2021 05:09:39 -0700 (PDT)
Subject: Re: [PATCH v3] iommu/arm-smmu-qcom: hook up qcom_smmu_impl for ACPI
 boot
To:     Shawn Guo <shawn.guo@linaro.org>, Will Deacon <will@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20210509022607.17534-1-shawn.guo@linaro.org>
 <20210523060505.GB29015@dragon>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <bc3a13c6-c846-2dd3-b8a7-b268d9aac9a6@arm.com>
Date:   Mon, 24 May 2021 13:09:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210523060505.GB29015@dragon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-23 07:05, Shawn Guo wrote:
> On Sun, May 09, 2021 at 10:26:07AM +0800, Shawn Guo wrote:
>> The hookup with qcom_smmu_impl is required to do ACPI boot on SC8180X
>> based devices like Lenovo Flex 5G laptop and Microsoft Surface Pro X.
>> Define acpi_platform_list for these platforms and match them using
>> acpi_match_platform_list() call, and create qcom_smmu_impl accordingly.
>>
>> (np == NULL) is used to check ACPI boot, because fwnode of SMMU device
>> is a static allocation and thus helpers like has_acpi_companion() don't
>> work here.
>>
>> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
>> ---
>> Changes for v3:
>>   - Call acpi_match_platform_list() to match platform in qcom smmu
>>     driver rather than IORT code.
> 
> Hi Robin,
> 
> How does this version look?

So good that I glanced at it, thought "nice!", then having no remaining 
concerns promptly moved on to something else forgot about it. Sorry 
about that!

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Cheers,
Robin.

> Shawn
> 
>>
>> Changes for v2:
>>   - Rather than using asl_compiler_id in IORT table, follow suggestion
>>     from Robin Murphy to use acpi_match_platform_list() to match platform.
>>
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 98b3a1c2a181..f7e187f3fa66 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -3,6 +3,7 @@
>>    * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>>    */
>>   
>> +#include <linux/acpi.h>
>>   #include <linux/adreno-smmu-priv.h>
>>   #include <linux/of_device.h>
>>   #include <linux/qcom_scm.h>
>> @@ -339,10 +340,22 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>>   	{ }
>>   };
>>   
>> +static struct acpi_platform_list qcom_acpi_platlist[] = {
>> +	{ "LENOVO", "CB-01   ", 0x8180, ACPI_SIG_IORT, equal, "QCOM SMMU" },
>> +	{ "QCOM  ", "QCOMEDK2", 0x8180, ACPI_SIG_IORT, equal, "QCOM SMMU" },
>> +	{ }
>> +};
>> +
>>   struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>>   {
>>   	const struct device_node *np = smmu->dev->of_node;
>>   
>> +	if (np == NULL) {
>> +		/* Match platform for ACPI boot */
>> +		if (acpi_match_platform_list(qcom_acpi_platlist) >= 0)
>> +			return qcom_smmu_create(smmu, &qcom_smmu_impl);
>> +	}
>> +
>>   	if (of_match_node(qcom_smmu_impl_of_match, np))
>>   		return qcom_smmu_create(smmu, &qcom_smmu_impl);
>>   
>> -- 
>> 2.17.1
>>
