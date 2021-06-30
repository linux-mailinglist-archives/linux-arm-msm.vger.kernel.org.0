Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 477503B849A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 16:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235651AbhF3OEh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 10:04:37 -0400
Received: from foss.arm.com ([217.140.110.172]:39026 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236401AbhF3OEb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 10:04:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05ED36D;
        Wed, 30 Jun 2021 07:02:02 -0700 (PDT)
Received: from [10.57.40.45] (unknown [10.57.40.45])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99D623F718;
        Wed, 30 Jun 2021 07:02:00 -0700 (PDT)
Subject: Re: [PATCH] iommu/arm: Cleanup resources in case of probe error path
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Will Deacon <will@kernel.org>
Cc:     Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org,
        Amey Narkhede <ameynarkhede03@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org
References: <20210608164559.204023-1-ameynarkhede03@gmail.com>
 <CGME20210630124816eucas1p27563f0a456c0196e20937619aa2f8d26@eucas1p2.samsung.com>
 <26f6a765-37c8-d63a-a779-384f095d5770@samsung.com>
 <20210630125940.GA8515@willie-the-truck>
 <4e3b1685-323e-2a7e-3aae-7c21b28fc65f@samsung.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <bc07bd52-ed2e-0a44-80a7-36b581018b40@arm.com>
Date:   Wed, 30 Jun 2021 15:01:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4e3b1685-323e-2a7e-3aae-7c21b28fc65f@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-30 14:48, Marek Szyprowski wrote:
> On 30.06.2021 14:59, Will Deacon wrote:
>> On Wed, Jun 30, 2021 at 02:48:15PM +0200, Marek Szyprowski wrote:
>>> On 08.06.2021 18:45, Amey Narkhede wrote:
>>>> If device registration fails, remove sysfs attribute
>>>> and if setting bus callbacks fails, unregister the device
>>>> and cleanup the sysfs attribute.
>>>>
>>>> Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>
>>> This patch landed in linux-next some time ago as commit 249c9dc6aa0d
>>> ("iommu/arm: Cleanup resources in case of probe error path"). After
>>> bisecting and some manual searching I finally found that it is
>>> responsible for breaking s2idle on DragonBoard 410c. Here is the log
>>> (captured with no_console_suspend):
>>>
>>> # time rtcwake -s10 -mmem
>>> rtcwake: wakeup from "mem" using /dev/rtc0 at Thu Jan  1 00:02:13 1970
>>> PM: suspend entry (s2idle)
>>> Filesystems sync: 0.002 seconds
>>> Freezing user space processes ... (elapsed 0.006 seconds) done.
>>> OOM killer disabled.
>>> Freezing remaining freezable tasks ... (elapsed 0.004 seconds) done.
>>> Unable to handle kernel NULL pointer dereference at virtual address
>>> 0000000000000070
>>> Mem abort info:
>>>      ESR = 0x96000006
>>>      EC = 0x25: DABT (current EL), IL = 32 bits
>>>      SET = 0, FnV = 0
>>>      EA = 0, S1PTW = 0
>>>      FSC = 0x06: level 2 translation fault
>>> Data abort info:
>>>      ISV = 0, ISS = 0x00000006
>>>      CM = 0, WnR = 0
>>> user pgtable: 4k pages, 48-bit VAs, pgdp=000000008ad08000
>>> [0000000000000070] pgd=0800000085c3c003, p4d=0800000085c3c003,
>>> pud=0800000088dcf003, pmd=0000000000000000
>>> Internal error: Oops: 96000006 [#1] PREEMPT SMP
>>> Modules linked in: bluetooth ecdh_generic ecc rfkill ipv6 ax88796b
>>> venus_enc venus_dec videobuf2_dma_contig asix crct10dif_ce adv7511
>>> snd_soc_msm8916_analog qcom_spmi_temp_alarm rtc_pm8xxx qcom_pon
>>> qcom_camss qcom_spmi_vadc videobuf2_dma_sg qcom_vadc_common msm
>>> venus_core v4l2_fwnode v4l2_async snd_soc_msm8916_digital
>>> videobuf2_memops snd_soc_lpass_apq8016 snd_soc_lpass_cpu v4l2_mem2mem
>>> snd_soc_lpass_platform snd_soc_apq8016_sbc videobuf2_v4l2
>>> snd_soc_qcom_common qcom_rng videobuf2_common i2c_qcom_cci qnoc_msm8916
>>> videodev mc icc_smd_rpm mdt_loader socinfo display_connector rmtfs_mem
>>> CPU: 1 PID: 1522 Comm: rtcwake Not tainted 5.13.0-next-20210629 #3592
>>> Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
>>> pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
>>> pc : msm_runtime_suspend+0x1c/0x60 [msm]
>>> lr : msm_pm_suspend+0x18/0x38 [msm]
>>> ...
>>> Call trace:
>>>     msm_runtime_suspend+0x1c/0x60 [msm]
>>>     msm_pm_suspend+0x18/0x38 [msm]
>>>     dpm_run_callback+0x84/0x378
>> I wonder if we're missing a pm_runtime_disable() call on the failure path?
>> i.e. something like the diff below...
> 
> I've checked and it doesn't fix anything.

What's happened previously? Has an IOMMU actually failed to probe, or is 
this a fiddly "code movement unveils latent bug elsewhere" kind of 
thing? There doesn't look to be much capable of going wrong in 
msm_runtime_suspend() itself, so is the DRM driver also in a broken 
half-probed state where it's left its pm_runtime_ops behind without its 
drvdata being valid?

Robin.

> 
>> Will
>>
>> --->8
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
>> index 25ed444ff94d..ce8f354755d0 100644
>> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
>> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
>> @@ -836,14 +836,14 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>>           ret = devm_of_platform_populate(dev);
>>           if (ret) {
>>                   dev_err(dev, "Failed to populate iommu contexts\n");
>> -               return ret;
>> +               goto err_pm_disable;
>>           }
>>    
>>           ret = iommu_device_sysfs_add(&qcom_iommu->iommu, dev, NULL,
>>                                        dev_name(dev));
>>           if (ret) {
>>                   dev_err(dev, "Failed to register iommu in sysfs\n");
>> -               return ret;
>> +               goto err_pm_disable;
>>           }
>>    
>>           ret = iommu_device_register(&qcom_iommu->iommu, &qcom_iommu_ops, dev);
>> @@ -869,6 +869,9 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>>    
>>    err_sysfs_remove:
>>           iommu_device_sysfs_remove(&qcom_iommu->iommu);
>> +
>> +err_pm_disable:
>> +       pm_runtime_disable(dev);
>>           return ret;
>>    }
>>
> Best regards
> 
