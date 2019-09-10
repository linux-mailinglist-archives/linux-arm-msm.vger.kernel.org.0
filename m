Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C743AEE02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2019 17:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389910AbfIJPBl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Sep 2019 11:01:41 -0400
Received: from foss.arm.com ([217.140.110.172]:36866 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389308AbfIJPBl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Sep 2019 11:01:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65DD228;
        Tue, 10 Sep 2019 08:01:40 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C724B3F71F;
        Tue, 10 Sep 2019 08:01:38 -0700 (PDT)
Subject: Re: [PATCH] iommu/arm-smmu: fix "hang" when games exit
To:     Rob Clark <robdclark@gmail.com>, iommu@lists.linux-foundation.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190907175013.24246-1-robdclark@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <418d8426-f299-1269-2b2e-f86677cf22c2@arm.com>
Date:   Tue, 10 Sep 2019 16:01:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190907175013.24246-1-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2019 18:50, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> When games, browser, or anything using a lot of GPU buffers exits, there
> can be many hundreds or thousands of buffers to unmap and free.  If the
> GPU is otherwise suspended, this can cause arm-smmu to resume/suspend
> for each buffer, resulting 5-10 seconds worth of reprogramming the
> context bank (arm_smmu_write_context_bank()/arm_smmu_write_s2cr()/etc).
> To the user it would appear that the system is locked up.
> 
> A simple solution is to use pm_runtime_put_autosuspend() instead, so we
> don't immediately suspend the SMMU device.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Note: I've tied the autosuspend enable/delay to the consumer device,
> based on the reasoning that if the consumer device benefits from using
> an autosuspend delay, then it's corresponding SMMU probably does too.
> Maybe that is overkill and we should just unconditionally enable
> autosuspend.

I'm not sure there's really any reason to expect that a supplier's usage 
model when doing things for itself bears any relation to that of its 
consumer(s), so I'd certainly lean towards the "unconditional" argument 
myself.

Of course ideally we'd skip resuming altogether in the map/unmap paths 
(since resume implies a full TLB reset anyway), but IIRC that approach 
started to get messy in the context of the initial RPM patchset. I'm 
planning to fiddle around a bit more to clean up the implementation of 
the new iommu_flush_ops stuff, so I've made a note to myself to revisit 
RPM to see if there's a sufficiently clean way to do better. In the 
meantime, though, I don't have any real objection to using some 
reasonable autosuspend delay on the principle that if we've been woken 
up to map/unmap one page, there's a high likelihood that more will 
follow in short order (and in the configuration slow-paths it won't have 
much impact either way).

Robin.

>   drivers/iommu/arm-smmu.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index c2733b447d9c..73a0dd53c8a3 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -289,7 +289,7 @@ static inline int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
>   static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>   {
>   	if (pm_runtime_enabled(smmu->dev))
> -		pm_runtime_put(smmu->dev);
> +		pm_runtime_put_autosuspend(smmu->dev);
>   }
>   
>   static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
> @@ -1445,6 +1445,15 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>   	/* Looks ok, so add the device to the domain */
>   	ret = arm_smmu_domain_add_master(smmu_domain, fwspec);
>   
> +#ifdef CONFIG_PM
> +	/* TODO maybe device_link_add() should do this for us? */
> +	if (dev->power.use_autosuspend) {
> +		pm_runtime_set_autosuspend_delay(smmu->dev,
> +			dev->power.autosuspend_delay);
> +		pm_runtime_use_autosuspend(smmu->dev);
> +	}
> +#endif
> +
>   rpm_put:
>   	arm_smmu_rpm_put(smmu);
>   	return ret;
> 
