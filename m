Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 304E81958AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 15:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgC0OMG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 10:12:06 -0400
Received: from foss.arm.com ([217.140.110.172]:45120 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726739AbgC0OMG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 10:12:06 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CD251FB;
        Fri, 27 Mar 2020 07:12:05 -0700 (PDT)
Received: from [10.57.60.204] (unknown [10.57.60.204])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42A153F71F;
        Fri, 27 Mar 2020 07:12:04 -0700 (PDT)
Subject: Re: [PATCH] iommu/arm-smmu: Demote error messages to debug in
 shutdown callback
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        Douglas Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200327132852.10352-1-saiprakash.ranjan@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <0023bc68-45fb-4e80-00c8-01fd0369243f@arm.com>
Date:   Fri, 27 Mar 2020 14:12:03 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327132852.10352-1-saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-03-27 1:28 pm, Sai Prakash Ranjan wrote:
> Currently on reboot/shutdown, the following messages are
> displayed on the console as error messages before the
> system reboots/shutdown.
> 
> On SC7180:
> 
>    arm-smmu 15000000.iommu: removing device with active domains!
>    arm-smmu 5040000.iommu: removing device with active domains!
> 
> Demote the log level to debug since it does not offer much
> help in identifying/fixing any issue as the system is anyways
> going down and reduce spamming the kernel log.

I've gone back and forth on this pretty much ever since we added the 
shutdown hook - on the other hand, if any devices *are* still running in 
those domains at this point, then once we turn off the SMMU and let 
those IOVAs go out on the bus as physical addresses, all manner of 
weirdness may ensue. Thus there is an argument for *some* indication 
that this may happen, although IMO it could be downgraded to at least 
dev_warn().

Robin.

> Reported-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/iommu/arm-smmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 16c4b87af42b..0a865e32054a 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -2250,7 +2250,7 @@ static int arm_smmu_device_remove(struct platform_device *pdev)
>   		return -ENODEV;
>   
>   	if (!bitmap_empty(smmu->context_map, ARM_SMMU_MAX_CBS))
> -		dev_err(&pdev->dev, "removing device with active domains!\n");
> +		dev_dbg(&pdev->dev, "removing device with active domains!\n");
>   
>   	arm_smmu_bus_init(NULL);
>   	iommu_device_unregister(&smmu->iommu);
> 
