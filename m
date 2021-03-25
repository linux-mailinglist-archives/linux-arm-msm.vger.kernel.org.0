Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C60C34979D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 18:09:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbhCYRIc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 13:08:32 -0400
Received: from foss.arm.com ([217.140.110.172]:54280 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229869AbhCYRH7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 13:07:59 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE02F143D;
        Thu, 25 Mar 2021 10:07:58 -0700 (PDT)
Received: from [10.57.50.37] (unknown [10.57.50.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC1BF3F718;
        Thu, 25 Mar 2021 10:07:57 -0700 (PDT)
Subject: Re: [PATCH] iommu/arm-smmu-qcom: create qcom_smmu_impl for ACPI boot
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>, lorenzo.pieralisi@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20210301074021.20059-1-shawn.guo@linaro.org>
 <20210325145914.GC15172@willie-the-truck> <20210325170256.GA904837@yoga>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <e7385b23-a91b-dd8d-5e9a-3505a18a2249@arm.com>
Date:   Thu, 25 Mar 2021 17:07:52 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325170256.GA904837@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-25 17:02, Bjorn Andersson wrote:
> On Thu 25 Mar 09:59 CDT 2021, Will Deacon wrote:
> 
>> [+ Lorenzo]
>>
>> On Mon, Mar 01, 2021 at 03:40:21PM +0800, Shawn Guo wrote:
>>> Though qcom_adreno_smmu_impl is not used by ACPI boot right now,
>>> qcom_smmu_impl is already required at least to boot up Lenovo Flex 5G
>>> laptop.  Let's check asl_compiler_id in IORT header to ensure we are
>>> running a QCOM SMMU and create qcom_smmu_impl for it.
>>>
>>> !np is used to check ACPI boot, because fwnode of SMMU device is
>>> a static allocation and thus has_acpi_companion() doesn't work here.
>>>
>>> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
>>> ---
>>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
>>>   1 file changed, 33 insertions(+)
>>
>> I don't know what a "asl_compiler_id" is, but it doesn't sound like it
>> has an awful lot to do with the SMMU.
>>
> 
> I would prefer that we somehow relate this to the particular board,
> rather than all Qualcomm-related ACPI tables. E.g. by relying on the
> SMMU devices having a _HID of QCOM0409.
> 
> Shawn, any reason for this wouldn't be possible?

To do something broadly similar to identify HiSilicon's SMMU PMCG 
implementation, we use acpi_match_platform_list() - could we do the same 
for this?

Robin.

>> Lorenzo -- any idea what we should be doing here instead? Probably not
>> using ACPI?
>>
> 
> The 8cx (aka sc8180x) platform comes with Qualcomm's usual SMMU
> stream-mapping quirks and this is one of the patches needed to bring
> enough ACPI support to run the Debian installer that Shawn has been
> working on. After the installer we currently only boot this using DT -
> which already enables the quirk.
> 
> Regards,
> Bjorn
> 
