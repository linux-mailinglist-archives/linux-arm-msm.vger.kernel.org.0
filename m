Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CCC03B8424
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 15:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235687AbhF3Nw6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 09:52:58 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29300 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236104AbhF3NvT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 09:51:19 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210630134848euoutp029e506f4da74bc4b5598f62bc0471d8e7~NYE3q759t2300723007euoutp02T
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 13:48:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210630134848euoutp029e506f4da74bc4b5598f62bc0471d8e7~NYE3q759t2300723007euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1625060928;
        bh=eRkMIlI7MNeZRZM/CDKQFoyXAVJIRsZSaQjjDRu3RGg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=EWTIcGIHVONDwG1hfFso/+At73a/95gWL7diUvM3LW1NXyh6Iyr9jBESgaX/lj2We
         k1OPINkpkWT2uaPG3kaNBbDYQBBlYL26GC/s8guc6MLZJRlTn30DmFO3SaccPjeM9L
         G5d1x+XuOaLhAUFvl/6i4kzkJFfD3uB7w/sn0DI4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210630134847eucas1p26f5337fa968a8aed68ab76bf618eea06~NYE3VSyhs0526105261eucas1p2L;
        Wed, 30 Jun 2021 13:48:47 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 08.3A.42068.F367CD06; Wed, 30
        Jun 2021 14:48:47 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210630134847eucas1p1545a662e60fce487e35fa2c5248524ac~NYE21EC-z0948509485eucas1p1A;
        Wed, 30 Jun 2021 13:48:47 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210630134847eusmtrp264572f9c017ea8ff2d2db5f182e9e971~NYE20NBZu3264132641eusmtrp2J;
        Wed, 30 Jun 2021 13:48:47 +0000 (GMT)
X-AuditID: cbfec7f4-c71ff7000002a454-8f-60dc763f8eb4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 0B.C0.20981.F367CD06; Wed, 30
        Jun 2021 14:48:47 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210630134846eusmtip197037ac81be721ec5765ffa1bb88628f~NYE1_VEjF2323923239eusmtip1H;
        Wed, 30 Jun 2021 13:48:46 +0000 (GMT)
Subject: Re: [PATCH] iommu/arm: Cleanup resources in case of probe error
 path
To:     Will Deacon <will@kernel.org>
Cc:     Amey Narkhede <ameynarkhede03@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jon Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Zenghui Yu <yuzenghui@huawei.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <4e3b1685-323e-2a7e-3aae-7c21b28fc65f@samsung.com>
Date:   Wed, 30 Jun 2021 15:48:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630125940.GA8515@willie-the-truck>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNKsWRmVeSWpSXmKPExsWy7djP87r2ZXcSDDY8MLG4tH0Zq8WC/dYW
        DasvsFqsWniNzaJl1iIWi87ZG9gtNj2+xmoxcf9ZdovLu+awWTxf+IPZ4uCHJ6wWS6YeZLOY
        fO0bq0Xf3iCLljumFjeXbmB3EPB4cnAek8eaeWsYPS739TJ57Jx1l93j8dyN7B4tR96yemxa
        1cnmcefaHjaPzUvqPSbfWM7o0dv8js3j8ya5AJ4oLpuU1JzMstQifbsErozTNyawFDxXqGi4
        v4OpgfGrZBcjJ4eEgInEz+69LF2MXBxCAisYJXZ8esgG4XxhlLh/azEzhPOZUWLCzL2sMC2t
        PUuhEsuBWr4cYYRwPjJKTH65kgWkSljAX6Lz229GEFtEQFFix/Y/YB3MApdYJHat6GMGSbAJ
        GEp0ve1iA7F5BewkFhx7yw5iswioSmy7eRasWVQgWeL9vBmsEDWCEidnPgFbwClgKvFy8X+w
        emYBeYnmrbOZIWxxiVtP5jOBLJMQOMUpsXzNLqAFHECOi8TWeWEQLwhLvDq+hR3ClpH4vxOm
        vplR4uG5tewQTg+jxOWmGYwQVdYSd879AhvELKApsX6XPkTYUWJJ/1xmiPl8EjfeCkLcwCcx
        adt0qDCvREebEES1msSs4+vg1h68cIl5AqPSLCSfzULyzSwk38xC2LuAkWUVo3hqaXFuemqx
        UV5quV5xYm5xaV66XnJ+7iZGYHo8/e/4lx2My1991DvEyMTBeIhRgoNZSYQ3auftBCHelMTK
        qtSi/Pii0pzU4kOM0hwsSuK8SVvWxAsJpCeWpGanphakFsFkmTg4pRqYtl+3vDqreueb/1JC
        S1fd6Nt6+0eae7R2WtWP0y8npDvO/5d8P3C23z7D5/9iemS+ags2Sbda+65tYvPey6LR3HPD
        e/vnR6VbDl++cVppxylxL73Tixb6m2cd5J3AH3HxmIzalCnvah/sMsjtidSKnJ57vHfNupUv
        D5hN3M/NPeufXYT25rOXOdWOO6YbPBZjVxNNfn3rpe/k7mj5+cq5XKcTY4pbV+rUc2+Ym/5M
        rmhP+dzyqH4LxQqHF3vvNOb8jNuQdp+JP9Ej6/7UtetFbV2YXGYJCO3Kc6k7NVMh6/8sZtYN
        /dsF/rCdEv38n/Gtir/QE4Xbr4unndG/4/67pSq0ImhCkHe4BPc5354LSizFGYmGWsxFxYkA
        b4rk2v4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLIsWRmVeSWpSXmKPExsVy+t/xu7r2ZXcSDKZ2CVtc2r6M1WLBfmuL
        htUXWC1WLbzGZtEyaxGLRefsDewWmx5fY7WYuP8su8XlXXPYLJ4v/MFscfDDE1aLJVMPsllM
        vvaN1aJvb5BFyx1Ti5tLN7A7CHg8OTiPyWPNvDWMHpf7epk8ds66y+7xeO5Gdo+WI29ZPTat
        6mTzuHNtD5vH5iX1HpNvLGf06G1+x+bxeZNcAE+Unk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6R
        iaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbpGxNYCp4rVDTc38HUwPhVsouRk0NCwESitWcp
        cxcjF4eQwFJGiQUzX7FDJGQkTk5rYIWwhSX+XOtiA7GFBN4zSpxZYgliCwv4Siw8so8RxBYR
        UJTYsf0P2CBmgSssEjMv/2KCmPqJUWLr4+VgU9kEDCW63kJM4hWwk1hw7C1YnEVAVWLbzbNg
        k0QFkiV+rm+HqhGUODnzCQuIzSlgKvFy8X+wemYBM4l5mx8yQ9jyEs1bZ0PZ4hK3nsxnmsAo
        NAtJ+ywkLbOQtMxC0rKAkWUVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYDrYduznlh2MK199
        1DvEyMTBeIhRgoNZSYQ3auftBCHelMTKqtSi/Pii0pzU4kOMpkD/TGSWEk3OByakvJJ4QzMD
        U0MTM0sDU0szYyVxXpMja+KFBNITS1KzU1MLUotg+pg4OKUamDwenT6anvr+0PWZqv+X7VNk
        35vaeLhtmuSrnxc+vJRW+fi5RLXNXHv2pOtqZdIRm1z5hY2/b/ebmdJW6uv/S7JygcmXj+4u
        9d8mfze8cWzK3sTuyTNud3JeXMdX2GCqxBit8mgXTzqDq/vyz9Xh358/ufa09TXXbRmurot8
        mv+TSvtfHBUsWC7beP1SsZbHpind1UedWlT/RNrN+jm9yef99see8270PL7VyX1f1mz5zhTz
        6/rrGw/KtDHutxM6/vCZylbrDTY/su4YsfUkXL77c6UfD4sOwy1TtS7LMp+P70KXGF25H3rQ
        zFFU9Z+PVUiW+zJZn2pmT4kVGuK24rmfJIBxsNzG8m1U3nVtJZbijERDLeai4kQAYf2qyZAD
        AAA=
X-CMS-MailID: 20210630134847eucas1p1545a662e60fce487e35fa2c5248524ac
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210630124816eucas1p27563f0a456c0196e20937619aa2f8d26
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210630124816eucas1p27563f0a456c0196e20937619aa2f8d26
References: <20210608164559.204023-1-ameynarkhede03@gmail.com>
        <CGME20210630124816eucas1p27563f0a456c0196e20937619aa2f8d26@eucas1p2.samsung.com>
        <26f6a765-37c8-d63a-a779-384f095d5770@samsung.com>
        <20210630125940.GA8515@willie-the-truck>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30.06.2021 14:59, Will Deacon wrote:
> On Wed, Jun 30, 2021 at 02:48:15PM +0200, Marek Szyprowski wrote:
>> On 08.06.2021 18:45, Amey Narkhede wrote:
>>> If device registration fails, remove sysfs attribute
>>> and if setting bus callbacks fails, unregister the device
>>> and cleanup the sysfs attribute.
>>>
>>> Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>
>> This patch landed in linux-next some time ago as commit 249c9dc6aa0d
>> ("iommu/arm: Cleanup resources in case of probe error path"). After
>> bisecting and some manual searching I finally found that it is
>> responsible for breaking s2idle on DragonBoard 410c. Here is the log
>> (captured with no_console_suspend):
>>
>> # time rtcwake -s10 -mmem
>> rtcwake: wakeup from "mem" using /dev/rtc0 at Thu Jan  1 00:02:13 1970
>> PM: suspend entry (s2idle)
>> Filesystems sync: 0.002 seconds
>> Freezing user space processes ... (elapsed 0.006 seconds) done.
>> OOM killer disabled.
>> Freezing remaining freezable tasks ... (elapsed 0.004 seconds) done.
>> Unable to handle kernel NULL pointer dereference at virtual address
>> 0000000000000070
>> Mem abort info:
>>     ESR = 0x96000006
>>     EC = 0x25: DABT (current EL), IL = 32 bits
>>     SET = 0, FnV = 0
>>     EA = 0, S1PTW = 0
>>     FSC = 0x06: level 2 translation fault
>> Data abort info:
>>     ISV = 0, ISS = 0x00000006
>>     CM = 0, WnR = 0
>> user pgtable: 4k pages, 48-bit VAs, pgdp=000000008ad08000
>> [0000000000000070] pgd=0800000085c3c003, p4d=0800000085c3c003,
>> pud=0800000088dcf003, pmd=0000000000000000
>> Internal error: Oops: 96000006 [#1] PREEMPT SMP
>> Modules linked in: bluetooth ecdh_generic ecc rfkill ipv6 ax88796b
>> venus_enc venus_dec videobuf2_dma_contig asix crct10dif_ce adv7511
>> snd_soc_msm8916_analog qcom_spmi_temp_alarm rtc_pm8xxx qcom_pon
>> qcom_camss qcom_spmi_vadc videobuf2_dma_sg qcom_vadc_common msm
>> venus_core v4l2_fwnode v4l2_async snd_soc_msm8916_digital
>> videobuf2_memops snd_soc_lpass_apq8016 snd_soc_lpass_cpu v4l2_mem2mem
>> snd_soc_lpass_platform snd_soc_apq8016_sbc videobuf2_v4l2
>> snd_soc_qcom_common qcom_rng videobuf2_common i2c_qcom_cci qnoc_msm8916
>> videodev mc icc_smd_rpm mdt_loader socinfo display_connector rmtfs_mem
>> CPU: 1 PID: 1522 Comm: rtcwake Not tainted 5.13.0-next-20210629 #3592
>> Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
>> pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
>> pc : msm_runtime_suspend+0x1c/0x60 [msm]
>> lr : msm_pm_suspend+0x18/0x38 [msm]
>> ...
>> Call trace:
>>    msm_runtime_suspend+0x1c/0x60 [msm]
>>    msm_pm_suspend+0x18/0x38 [msm]
>>    dpm_run_callback+0x84/0x378
> I wonder if we're missing a pm_runtime_disable() call on the failure path?
> i.e. something like the diff below...

I've checked and it doesn't fix anything.

> Will
>
> --->8
>
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 25ed444ff94d..ce8f354755d0 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -836,14 +836,14 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>          ret = devm_of_platform_populate(dev);
>          if (ret) {
>                  dev_err(dev, "Failed to populate iommu contexts\n");
> -               return ret;
> +               goto err_pm_disable;
>          }
>   
>          ret = iommu_device_sysfs_add(&qcom_iommu->iommu, dev, NULL,
>                                       dev_name(dev));
>          if (ret) {
>                  dev_err(dev, "Failed to register iommu in sysfs\n");
> -               return ret;
> +               goto err_pm_disable;
>          }
>   
>          ret = iommu_device_register(&qcom_iommu->iommu, &qcom_iommu_ops, dev);
> @@ -869,6 +869,9 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>   
>   err_sysfs_remove:
>          iommu_device_sysfs_remove(&qcom_iommu->iommu);
> +
> +err_pm_disable:
> +       pm_runtime_disable(dev);
>          return ret;
>   }
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

