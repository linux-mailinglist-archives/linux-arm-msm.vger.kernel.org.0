Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD882B1B89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 14:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgKMNFi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 08:05:38 -0500
Received: from foss.arm.com ([217.140.110.172]:37934 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbgKMNFh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 08:05:37 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 809B5142F;
        Fri, 13 Nov 2020 05:05:37 -0800 (PST)
Received: from [10.57.53.43] (unknown [10.57.53.43])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 455043F6CF;
        Fri, 13 Nov 2020 05:05:34 -0800 (PST)
Subject: Re: [RESEND][PATCH 1/2] arm-smmu-qcom: Ensure the qcom_scm driver has
 finished probing
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
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <c0c905c5-d118-2b74-1b76-fcb086a7faf4@arm.com>
Date:   Fri, 13 Nov 2020 13:05:28 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201112220520.48159-1-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-12 22:05, John Stultz wrote:
> Robin Murphy pointed out that if the arm-smmu driver probes before
> the qcom_scm driver, we may call qcom_scm_qsmmu500_wait_safe_toggle()
> before the __scm is initialized.
> 
> Now, getting this to happen is a bit contrived, as in my efforts it
> required enabling asynchronous probing for both drivers, moving the
> firmware dts node to the end of the dtsi file, as well as forcing a
> long delay in the qcom_scm_probe function.
> 
> With those tweaks we ran into the following crash:
> [    2.631040] arm-smmu 15000000.iommu:         Stage-1: 48-bit VA -> 48-bit IPA
> [    2.633372] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> ...
> [    2.633402] [0000000000000000] user address but active_mm is swapper
> [    2.633409] Internal error: Oops: 96000005 [#1] PREEMPT SMP
> [    2.633415] Modules linked in:
> [    2.633427] CPU: 5 PID: 117 Comm: kworker/u16:2 Tainted: G        W         5.10.0-rc1-mainline-00025-g272a618fc36-dirty #3971
> [    2.633430] Hardware name: Thundercomm Dragonboard 845c (DT)
> [    2.633448] Workqueue: events_unbound async_run_entry_fn
> [    2.633456] pstate: 80c00005 (Nzcv daif +PAN +UAO -TCO BTYPE=--)
> [    2.633465] pc : qcom_scm_qsmmu500_wait_safe_toggle+0x78/0xb0
> [    2.633473] lr : qcom_smmu500_reset+0x58/0x78
> [    2.633476] sp : ffffffc0105a3b60
> ...
> [    2.633567] Call trace:
> [    2.633572]  qcom_scm_qsmmu500_wait_safe_toggle+0x78/0xb0
> [    2.633576]  qcom_smmu500_reset+0x58/0x78
> [    2.633581]  arm_smmu_device_reset+0x194/0x270
> [    2.633585]  arm_smmu_device_probe+0xc94/0xeb8
> [    2.633592]  platform_drv_probe+0x58/0xa8
> [    2.633597]  really_probe+0xec/0x398
> [    2.633601]  driver_probe_device+0x5c/0xb8
> [    2.633606]  __driver_attach_async_helper+0x64/0x88
> [    2.633610]  async_run_entry_fn+0x4c/0x118
> [    2.633617]  process_one_work+0x20c/0x4b0
> [    2.633621]  worker_thread+0x48/0x460
> [    2.633628]  kthread+0x14c/0x158
> [    2.633634]  ret_from_fork+0x10/0x18
> [    2.633642] Code: a9034fa0 d0007f73 29107fa0 91342273 (f9400020)
> 
> To avoid this, this patch adds a check on qcom_scm_is_available() in
> the qcom_smmu_impl_init() function, returning -EPROBE_DEFER if its
> not ready.
> 
> This allows the driver to try to probe again later after qcom_scm has
> finished probing.

As well as strict correctness, the other motivation here was that 
qcom_scm_is_available() should be the place to add the "is the module 
even loaded yet?" dance to iron out the awkward config dependencies in 
future.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

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
> Reported-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 66ba4870659f4..ef37ccfa82562 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -159,6 +159,10 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>   {
>   	struct qcom_smmu *qsmmu;
>   
> +	/* Check to make sure qcom_scm has finished probing */
> +	if (!qcom_scm_is_available())
> +		return ERR_PTR(-EPROBE_DEFER);
> +
>   	qsmmu = devm_kzalloc(smmu->dev, sizeof(*qsmmu), GFP_KERNEL);
>   	if (!qsmmu)
>   		return ERR_PTR(-ENOMEM);
> 
