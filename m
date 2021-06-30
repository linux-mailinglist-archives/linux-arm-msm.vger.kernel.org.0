Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D2A3B8297
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 14:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234667AbhF3NCP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 09:02:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:52386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234481AbhF3NCP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 09:02:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B50961364;
        Wed, 30 Jun 2021 12:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625057986;
        bh=4UI5RKPIij7TUgl1lgCZCSJpLQ2Uyt70B7pj+JIfU14=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dU0v1zwuPzsz8RuFIlMI7GqlG64x4T7MGB7PSTKUoHcWcPgpIRNzgVIVu5MLB4Uvs
         1A8/Wmc++QCeqkzSJOHkRFhPZhAjb9R0zKhRNB1Ob4lQ+dTuYzUSs7/0Enx6Myzgvc
         FNyFQ010U0PvFlOFUytjoYE+NyOaFbCdhJX8bpRLGGCEqb8PrONHUSNI9xUgBbkeNl
         hlrjZnBcz7csJ9FIWy5d5CD6EJfN6S87J9X5kUs3/6Nr1sn7F/OjVbz7p0CmwH65sj
         QPkqz2gnczZWWQm7cpqLA7HOAwZzVM7vXNyj9bME416DpUTo763YA/kQZ5QsMngLdL
         agMk7aRtUe27w==
Date:   Wed, 30 Jun 2021 13:59:40 +0100
From:   Will Deacon <will@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
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
Subject: Re: [PATCH] iommu/arm: Cleanup resources in case of probe error path
Message-ID: <20210630125940.GA8515@willie-the-truck>
References: <20210608164559.204023-1-ameynarkhede03@gmail.com>
 <CGME20210630124816eucas1p27563f0a456c0196e20937619aa2f8d26@eucas1p2.samsung.com>
 <26f6a765-37c8-d63a-a779-384f095d5770@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26f6a765-37c8-d63a-a779-384f095d5770@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 30, 2021 at 02:48:15PM +0200, Marek Szyprowski wrote:
> On 08.06.2021 18:45, Amey Narkhede wrote:
> > If device registration fails, remove sysfs attribute
> > and if setting bus callbacks fails, unregister the device
> > and cleanup the sysfs attribute.
> >
> > Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>
> 
> This patch landed in linux-next some time ago as commit 249c9dc6aa0d 
> ("iommu/arm: Cleanup resources in case of probe error path"). After 
> bisecting and some manual searching I finally found that it is 
> responsible for breaking s2idle on DragonBoard 410c. Here is the log 
> (captured with no_console_suspend):
> 
> # time rtcwake -s10 -mmem
> rtcwake: wakeup from "mem" using /dev/rtc0 at Thu Jan  1 00:02:13 1970
> PM: suspend entry (s2idle)
> Filesystems sync: 0.002 seconds
> Freezing user space processes ... (elapsed 0.006 seconds) done.
> OOM killer disabled.
> Freezing remaining freezable tasks ... (elapsed 0.004 seconds) done.
> Unable to handle kernel NULL pointer dereference at virtual address 
> 0000000000000070
> Mem abort info:
>    ESR = 0x96000006
>    EC = 0x25: DABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
>    FSC = 0x06: level 2 translation fault
> Data abort info:
>    ISV = 0, ISS = 0x00000006
>    CM = 0, WnR = 0
> user pgtable: 4k pages, 48-bit VAs, pgdp=000000008ad08000
> [0000000000000070] pgd=0800000085c3c003, p4d=0800000085c3c003, 
> pud=0800000088dcf003, pmd=0000000000000000
> Internal error: Oops: 96000006 [#1] PREEMPT SMP
> Modules linked in: bluetooth ecdh_generic ecc rfkill ipv6 ax88796b 
> venus_enc venus_dec videobuf2_dma_contig asix crct10dif_ce adv7511 
> snd_soc_msm8916_analog qcom_spmi_temp_alarm rtc_pm8xxx qcom_pon 
> qcom_camss qcom_spmi_vadc videobuf2_dma_sg qcom_vadc_common msm 
> venus_core v4l2_fwnode v4l2_async snd_soc_msm8916_digital 
> videobuf2_memops snd_soc_lpass_apq8016 snd_soc_lpass_cpu v4l2_mem2mem 
> snd_soc_lpass_platform snd_soc_apq8016_sbc videobuf2_v4l2 
> snd_soc_qcom_common qcom_rng videobuf2_common i2c_qcom_cci qnoc_msm8916 
> videodev mc icc_smd_rpm mdt_loader socinfo display_connector rmtfs_mem
> CPU: 1 PID: 1522 Comm: rtcwake Not tainted 5.13.0-next-20210629 #3592
> Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
> pc : msm_runtime_suspend+0x1c/0x60 [msm]
> lr : msm_pm_suspend+0x18/0x38 [msm]
> ...
> Call trace:
>   msm_runtime_suspend+0x1c/0x60 [msm]
>   msm_pm_suspend+0x18/0x38 [msm]
>   dpm_run_callback+0x84/0x378

I wonder if we're missing a pm_runtime_disable() call on the failure path?
i.e. something like the diff below...

Will

--->8

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 25ed444ff94d..ce8f354755d0 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -836,14 +836,14 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
        ret = devm_of_platform_populate(dev);
        if (ret) {
                dev_err(dev, "Failed to populate iommu contexts\n");
-               return ret;
+               goto err_pm_disable;
        }
 
        ret = iommu_device_sysfs_add(&qcom_iommu->iommu, dev, NULL,
                                     dev_name(dev));
        if (ret) {
                dev_err(dev, "Failed to register iommu in sysfs\n");
-               return ret;
+               goto err_pm_disable;
        }
 
        ret = iommu_device_register(&qcom_iommu->iommu, &qcom_iommu_ops, dev);
@@ -869,6 +869,9 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 
 err_sysfs_remove:
        iommu_device_sysfs_remove(&qcom_iommu->iommu);
+
+err_pm_disable:
+       pm_runtime_disable(dev);
        return ret;
 }
