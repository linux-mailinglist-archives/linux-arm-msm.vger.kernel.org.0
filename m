Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7052B1D0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 15:22:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbgKMOWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 09:22:41 -0500
Received: from foss.arm.com ([217.140.110.172]:39026 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726278AbgKMOWl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 09:22:41 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4940C142F;
        Fri, 13 Nov 2020 06:22:40 -0800 (PST)
Received: from [10.57.53.43] (unknown [10.57.53.43])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91AA73F6CF;
        Fri, 13 Nov 2020 06:22:38 -0800 (PST)
Subject: Re: [RESEND][PATCH 2/2] iommu: Avoid crash if iommu_group is null
To:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Cc:     Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Saravana Kannan <saravanak@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20201112220520.48159-1-john.stultz@linaro.org>
 <20201112220520.48159-2-john.stultz@linaro.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <71d9e4f1-8205-0dec-5723-e1ae83389481@arm.com>
Date:   Fri, 13 Nov 2020 14:22:37 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201112220520.48159-2-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-12 22:05, John Stultz wrote:
> In trying to handle a possible driver probe ordering issue
> brought up by Robin Murphy, I ran across a separate null pointer
> crash in the iommu core in iommu_group_remove_device():
> [    2.732803] dwc3-qcom a6f8800.usb: failed to get usb-ddr path: -517
> [    2.739281] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000c0
> ...
> [    2.775619] [00000000000000c0] user address but active_mm is swapper
> [    2.782039] Internal error: Oops: 96000005 [#1] PREEMPT SMP
> [    2.787670] Modules linked in:
> [    2.790769] CPU: 6 PID: 1 Comm: swapper/0 Tainted: G        W         5.10.0-rc1-mainline-00025-g272a618fc36-dirty #3973
> [    2.801719] Hardware name: Thundercomm Dragonboard 845c (DT)
> [    2.807431] pstate: 00c00005 (nzcv daif +PAN +UAO -TCO BTYPE=--)
> [    2.813508] pc : iommu_group_remove_device+0x30/0x1b0
> [    2.818611] lr : iommu_release_device+0x4c/0x78
> [    2.823189] sp : ffffffc01005b950
> ...
> [    2.907082] Call trace:
> [    2.909566]  iommu_group_remove_device+0x30/0x1b0
> [    2.914323]  iommu_release_device+0x4c/0x78
> [    2.918559]  iommu_bus_notifier+0xe8/0x108
> [    2.922708]  blocking_notifier_call_chain+0x78/0xb8
> [    2.927641]  device_del+0x2ac/0x3d0
> [    2.931177]  platform_device_del.part.9+0x20/0x98
> [    2.935933]  platform_device_unregister+0x2c/0x40
> [    2.940694]  of_platform_device_destroy+0xd8/0xe0
> [    2.945450]  device_for_each_child_reverse+0x58/0xb0
> [    2.950471]  of_platform_depopulate+0x4c/0x78
> [    2.954886]  dwc3_qcom_probe+0x93c/0xcb8
> [    2.958858]  platform_drv_probe+0x58/0xa8
> [    2.962917]  really_probe+0xec/0x398
> [    2.966531]  driver_probe_device+0x5c/0xb8
> [    2.970677]  device_driver_attach+0x74/0x98
> [    2.974911]  __driver_attach+0x60/0xe8
> [    2.978700]  bus_for_each_dev+0x84/0xd8
> [    2.982581]  driver_attach+0x30/0x40
> [    2.986194]  bus_add_driver+0x160/0x208
> [    2.990076]  driver_register+0x64/0x110
> [    2.993957]  __platform_driver_register+0x58/0x68
> [    2.998716]  dwc3_qcom_driver_init+0x20/0x28
> [    3.003041]  do_one_initcall+0x6c/0x2d0
> [    3.006925]  kernel_init_freeable+0x214/0x268
> [    3.011339]  kernel_init+0x18/0x118
> [    3.014876]  ret_from_fork+0x10/0x18
> [    3.018495] Code: d0006a21 f9417295 91130021 910162b6 (b940c2a2)
> 
> In the case above, the arm-smmu driver fails to probe with
> EPROBE_DEFER, and I'm guessing I'm guessing that causes
> iommu_group_add_device() to fail and sets the
> dev->iommu_group = NULL, then somehow we hit
> iommu_group_remove_device() and trip over the null value?
> I'm not really sure...
> 
> Anyway, adding the null check seems to avoid the issue and the
> system boots fine after the arm-smmu driver later reprobed.
> 
> Feedback or better ideas for a solution would be appreciated!

I think the real issue is that we shouldn't even be here. If the device 
was still waiting for an IOMMU when it got torn down, then dev->iommu 
would be non-NULL due to a fwspec being allocated, but it's possible 
that none of the other setup would have been done, so 
iommu_release_device() shouldn't be blindly trying to undo it. It 
happens that iommu_device_unlink() and arm_smmu_release_device() still 
have some left-over tolerance for invalid inputs, but even if we do make 
iommu_group_remove_device() similarly tolerant of invalid input, the 
subsequent module_put() could still be unbalanced if the fwspec and 
deferral came from of_iommu_configure() without iommu_probe_device() 
even being called. Therefore I think this needs to be fundamentally 
fixed by making iommu_release_device() better at handling 
partially-configured devices in the first place.

Robin.

> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>   drivers/iommu/iommu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index b53446bb8c6b4..28229f7ef7d5a 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -877,6 +877,10 @@ void iommu_group_remove_device(struct device *dev)
>   	struct iommu_group *group = dev->iommu_group;
>   	struct group_device *tmp_device, *device = NULL;
>   
> +	/* Avoid crash if iommu_group value is null */
> +	if (!group)
> +		return;
> +
>   	dev_info(dev, "Removing from iommu group %d\n", group->id);
>   
>   	/* Pre-notify listeners that a device is being removed. */
> 
