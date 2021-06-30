Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F973B8266
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 14:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234664AbhF3Mus (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 08:50:48 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36015 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234622AbhF3Mur (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 08:50:47 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210630124817euoutp019ee799eb6649c8265f3fface554d47c7~NXQCbKGG52958529585euoutp01a
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 12:48:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210630124817euoutp019ee799eb6649c8265f3fface554d47c7~NXQCbKGG52958529585euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1625057297;
        bh=LS326IHcmThfGZLvyS6l7wE9Us45WReO7ABvmSg1Q7Q=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=fKSpEFxXqFPFjjIcdGVx5OxCLVq3sPOhm4k88FLF4DOR8Mw7mxZYmvackYGZrne9o
         VtuQOjqIdn5QuQpWUj16VuwDUbyRbgn4hUpyLXfLWWYwg9eGWlTWlWKBQkBQEDUdZq
         CGA56TLMAaDQU0Zay5LhGy05WrP0rEPiEKijfwVo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210630124817eucas1p21efef28e445b9f796bf4b257d8b1b18b~NXQB_wcWV2866528665eucas1p2L;
        Wed, 30 Jun 2021 12:48:17 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 89.FE.42068.1186CD06; Wed, 30
        Jun 2021 13:48:17 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210630124816eucas1p27563f0a456c0196e20937619aa2f8d26~NXQBcUOo11121111211eucas1p21;
        Wed, 30 Jun 2021 12:48:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210630124816eusmtrp2e5b941e017519c5ce3446209c7ac01c6~NXQBbJT2-0449304493eusmtrp2G;
        Wed, 30 Jun 2021 12:48:16 +0000 (GMT)
X-AuditID: cbfec7f4-c89ff7000002a454-a9-60dc6811b3c7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id B3.C6.20981.0186CD06; Wed, 30
        Jun 2021 13:48:16 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210630124815eusmtip166c7fa03f59754ba0c91ac0064408db1~NXQAj9ie52302923029eusmtip1B;
        Wed, 30 Jun 2021 12:48:15 +0000 (GMT)
Subject: Re: [PATCH] iommu/arm: Cleanup resources in case of probe error
 path
To:     Amey Narkhede <ameynarkhede03@gmail.com>,
        Rob Clark <robdclark@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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
Message-ID: <26f6a765-37c8-d63a-a779-384f095d5770@samsung.com>
Date:   Wed, 30 Jun 2021 14:48:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210608164559.204023-1-ameynarkhede03@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNKsWRmVeSWpSXmKPExsWy7djPc7qCGXcSDM5O4LK4tH0Zq8WC/dYW
        DasvsFqsWniNzaJl1iIWi87ZG9gtNj2+xmoxcf9ZdovLu+awWTxf+IPZ4uCHJ6wWS6YeZLOY
        fO0bq0Xf3iCLljumFjeXbmB3EPB4cnAek8eaeWsYPS739TJ57Jx1l93j8dyN7B4tR96yemxa
        1cnmcefaHjaPzUvqPSbfWM7o0dv8js3j8ya5AJ4oLpuU1JzMstQifbsErow//88wFkw3q7jZ
        NYW1gXG3bhcjB4eEgInEsx7ZLkYuDiGBFYwSx++eYYFwvjBKTN03hw3C+cwocfJOP1CGE6xj
        esM+qMRyRonbt84zQzgfGSX2XOkCqxIW8Jfo/PabEcQWAbK/vZjMCFLELLCEReLNvPdgCTYB
        Q4mut11sIDavgJ3EudNd7CA2i4CqREvnf1YQW1QgWeL9vBmsEDWCEidnPgFbwClgL7Hu/Euw
        OLOAvETz1tnMELa4xK0n85lAlkkI7OeUWLL2BhvE3S4SBy88ZYewhSVeHd8CZctI/N8J09DM
        KPHw3Fp2CKeHUeJy0wxGiCpriTvnfrGBwoxZQFNi/S59iLCjxJL+ucyQoOSTuPFWEOIIPolJ
        26ZDhXklOtqEIKrVJGYdXwe39uCFS8wTGJVmIXltFpJ3ZiF5ZxbC3gWMLKsYxVNLi3PTU4uN
        8lLL9YoTc4tL89L1kvNzNzEC0+Ppf8e/7GBc/uqj3iFGJg7GQ4wSHMxKIrxRO28nCPGmJFZW
        pRblxxeV5qQWH2KU5mBREudN2rImXkggPbEkNTs1tSC1CCbLxMEp1cC0/oaEkuesmdwNdcdm
        TVp5j0ue+cNbxwmFDz663Tg5fe3S5qi/alvVvHqXd3xyPSI+p4B7mrKVSNjT+01ajlO2Bhfv
        5X18qbJvizE75/zC3ocqOxa9cTjbvEno3iYGtsmyceHORmu82LKniF783h436Z2Arcmkd1rb
        jCXnl0/zfuQhY8X7ZNWqnLwPvt8cip4E+Uv/uG93bva18/4hcyNWffnFeCj138Q/UtpK9XE8
        dQzxEU1cWV2rX/t/E9jyxanDMoPlXM9ZX6P+KfUPlHfdFJG+ctij9abc/nves74zPmg6ruPB
        WT3TykH3ftjCi6Emupq2DytrNkosPFg154iTaw7THBvpSbmOrw/IpqcqsRRnJBpqMRcVJwIA
        pxdzOP4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDIsWRmVeSWpSXmKPExsVy+t/xu7oCGXcSDPqXKllc2r6M1WLBfmuL
        htUXWC1WLbzGZtEyaxGLRefsDewWmx5fY7WYuP8su8XlXXPYLJ4v/MFscfDDE1aLJVMPsllM
        vvaN1aJvb5BFyx1Ti5tLN7A7CHg8OTiPyWPNvDWMHpf7epk8ds66y+7xeO5Gdo+WI29ZPTat
        6mTzuHNtD5vH5iX1HpNvLGf06G1+x+bxeZNcAE+Unk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6R
        iaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsaf/2cYC6abVdzsmsLawLhbt4uRk0NCwERiesM+
        NhBbSGApo8SqjYoQcRmJk9MaWCFsYYk/17qAariAat4zSjw7swgsISzgK7HwyD5GEFsEyL55
        +Q8rSBGzwDIWib1tM9khptpJLFn2CcxmEzCU6HrbBbaNFyh+7nQXWJxFQFWipfM/2FBRgWSJ
        n+vboWoEJU7OfMICYnMK2EusO/8SrIZZwExi3uaHzBC2vETz1tlQtrjErSfzmSYwCs1C0j4L
        ScssJC2zkLQsYGRZxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJEZgMth37uWUH48pXH/UOMTJx
        MB5ilOBgVhLhjdp5O0GINyWxsiq1KD++qDQntfgQoynQPxOZpUST84HpKK8k3tDMwNTQxMzS
        wNTSzFhJnNfkyJp4IYH0xJLU7NTUgtQimD4mDk6pBib29s/W86Yqrz+49uZsa5md7y/H5sif
        mTNPws3IvVNEcV1yQ4Qst0Bb19y8tX5/y69odUzfx1IffL1415HaF+dKd02buZsl77eqSaC+
        Y12q9Ynir9Nem/0zmud/ndHXw2919HaHE+nOPAkn/twRUFeR4dlpsDGpznyddkLTarujXvPO
        Hp+1vyo8gHV/rOeNE04t54+qJO33mr3j156+l2esHI5vsXaNnFzsk6t31fSkkN7mejMdRuYF
        Ea2r74a03zt454jHrseaksmGh5PstqUrG39x4gvljFBYfJ47KSpQeuKvgN0ZixT/sO58obbf
        7ulKBwuWTHZJn8MCTY0+X3+w6MrXC3+8qbTGQvFpiBJLcUaioRZzUXEiAG5LloOPAwAA
X-CMS-MailID: 20210630124816eucas1p27563f0a456c0196e20937619aa2f8d26
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210630124816eucas1p27563f0a456c0196e20937619aa2f8d26
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210630124816eucas1p27563f0a456c0196e20937619aa2f8d26
References: <20210608164559.204023-1-ameynarkhede03@gmail.com>
        <CGME20210630124816eucas1p27563f0a456c0196e20937619aa2f8d26@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 08.06.2021 18:45, Amey Narkhede wrote:
> If device registration fails, remove sysfs attribute
> and if setting bus callbacks fails, unregister the device
> and cleanup the sysfs attribute.
>
> Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>

This patch landed in linux-next some time ago as commit 249c9dc6aa0d 
("iommu/arm: Cleanup resources in case of probe error path"). After 
bisecting and some manual searching I finally found that it is 
responsible for breaking s2idle on DragonBoard 410c. Here is the log 
(captured with no_console_suspend):

# time rtcwake -s10 -mmem
rtcwake: wakeup from "mem" using /dev/rtc0 at Thu Jan  1 00:02:13 1970
PM: suspend entry (s2idle)
Filesystems sync: 0.002 seconds
Freezing user space processes ... (elapsed 0.006 seconds) done.
OOM killer disabled.
Freezing remaining freezable tasks ... (elapsed 0.004 seconds) done.
Unable to handle kernel NULL pointer dereference at virtual address 
0000000000000070
Mem abort info:
   ESR = 0x96000006
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x06: level 2 translation fault
Data abort info:
   ISV = 0, ISS = 0x00000006
   CM = 0, WnR = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=000000008ad08000
[0000000000000070] pgd=0800000085c3c003, p4d=0800000085c3c003, 
pud=0800000088dcf003, pmd=0000000000000000
Internal error: Oops: 96000006 [#1] PREEMPT SMP
Modules linked in: bluetooth ecdh_generic ecc rfkill ipv6 ax88796b 
venus_enc venus_dec videobuf2_dma_contig asix crct10dif_ce adv7511 
snd_soc_msm8916_analog qcom_spmi_temp_alarm rtc_pm8xxx qcom_pon 
qcom_camss qcom_spmi_vadc videobuf2_dma_sg qcom_vadc_common msm 
venus_core v4l2_fwnode v4l2_async snd_soc_msm8916_digital 
videobuf2_memops snd_soc_lpass_apq8016 snd_soc_lpass_cpu v4l2_mem2mem 
snd_soc_lpass_platform snd_soc_apq8016_sbc videobuf2_v4l2 
snd_soc_qcom_common qcom_rng videobuf2_common i2c_qcom_cci qnoc_msm8916 
videodev mc icc_smd_rpm mdt_loader socinfo display_connector rmtfs_mem
CPU: 1 PID: 1522 Comm: rtcwake Not tainted 5.13.0-next-20210629 #3592
Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
pc : msm_runtime_suspend+0x1c/0x60 [msm]
lr : msm_pm_suspend+0x18/0x38 [msm]
...
Call trace:
  msm_runtime_suspend+0x1c/0x60 [msm]
  msm_pm_suspend+0x18/0x38 [msm]
  dpm_run_callback+0x84/0x378
  __device_suspend+0x118/0x680
  dpm_suspend+0x150/0x4f0
  dpm_suspend_start+0x98/0xa0
  suspend_devices_and_enter+0xfc/0xaf0
  pm_suspend+0x2b0/0x3d0
  state_store+0x84/0x108
  kobj_attr_store+0x14/0x28
  sysfs_kf_write+0x60/0x70
  kernfs_fop_write_iter+0x124/0x1a8
  new_sync_write+0xe8/0x1b0
  vfs_write+0x1e8/0x450
  ksys_write+0x64/0xf0
  __arm64_sys_write+0x14/0x20
  invoke_syscall+0x40/0xf8
  el0_svc_common+0x60/0x100
  do_el0_svc_compat+0x1c/0x48
  el0_svc_compat+0x20/0x30
  el0t_32_sync_handler+0xec/0x140
  el0t_32_sync+0x168/0x16c
Code: 910003fd f9000bf3 f9403c02 52800040 (f9403842)
---[ end trace 215b72fcd7026947 ]---

Reverting it on top of linux-next fixes s2idle oepration on that board.

> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 14 ++++++++++++--
>   drivers/iommu/arm/arm-smmu/arm-smmu.c       | 15 ++++++++++++---
>   drivers/iommu/arm/arm-smmu/qcom_iommu.c     | 13 +++++++++++--
>   3 files changed, 35 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 54b2f27b81d4..de2499754025 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -3669,10 +3669,20 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>   	ret = iommu_device_register(&smmu->iommu, &arm_smmu_ops, dev);
>   	if (ret) {
>   		dev_err(dev, "Failed to register iommu\n");
> -		return ret;
> +		goto err_sysfs_remove;
>   	}
>
> -	return arm_smmu_set_bus_ops(&arm_smmu_ops);
> +	ret = arm_smmu_set_bus_ops(&arm_smmu_ops);
> +	if (ret)
> +		goto err_unregister_device;
> +
> +	return 0;
> +
> +err_unregister_device:
> +	iommu_device_unregister(&smmu->iommu);
> +err_sysfs_remove:
> +	iommu_device_sysfs_remove(&smmu->iommu);
> +	return ret;
>   }
>
>   static int arm_smmu_device_remove(struct platform_device *pdev)
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 6f72c4d208ca..88a3023676ce 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -2164,7 +2164,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>   	err = iommu_device_register(&smmu->iommu, &arm_smmu_ops, dev);
>   	if (err) {
>   		dev_err(dev, "Failed to register iommu\n");
> -		return err;
> +		goto err_sysfs_remove;
>   	}
>
>   	platform_set_drvdata(pdev, smmu);
> @@ -2187,10 +2187,19 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>   	 * any device which might need it, so we want the bus ops in place
>   	 * ready to handle default domain setup as soon as any SMMU exists.
>   	 */
> -	if (!using_legacy_binding)
> -		return arm_smmu_bus_init(&arm_smmu_ops);
> +	if (!using_legacy_binding) {
> +		err = arm_smmu_bus_init(&arm_smmu_ops);
> +		if (err)
> +			goto err_unregister_device;
> +	}
>
>   	return 0;
> +
> +err_unregister_device:
> +	iommu_device_unregister(&smmu->iommu);
> +err_sysfs_remove:
> +	iommu_device_sysfs_remove(&smmu->iommu);
> +	return err;
>   }
>
>   static int arm_smmu_device_remove(struct platform_device *pdev)
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 4294abe389b2..b785d9fb7602 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -850,10 +850,12 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>   	ret = iommu_device_register(&qcom_iommu->iommu, &qcom_iommu_ops, dev);
>   	if (ret) {
>   		dev_err(dev, "Failed to register iommu\n");
> -		return ret;
> +		goto err_sysfs_remove;
>   	}
>
> -	bus_set_iommu(&platform_bus_type, &qcom_iommu_ops);
> +	ret = bus_set_iommu(&platform_bus_type, &qcom_iommu_ops);
> +	if (ret)
> +		goto err_unregister_device;
>
>   	if (qcom_iommu->local_base) {
>   		pm_runtime_get_sync(dev);
> @@ -862,6 +864,13 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>   	}
>
>   	return 0;
> +
> +err_unregister_device:
> +	iommu_device_unregister(&qcom_iommu->iommu);
> +
> +err_sysfs_remove:
> +	iommu_device_sysfs_remove(&qcom_iommu->iommu);
> +	return ret;
>   }
>
>   static int qcom_iommu_device_remove(struct platform_device *pdev)
> --
> 2.31.1
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

