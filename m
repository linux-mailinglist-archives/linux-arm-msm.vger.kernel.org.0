Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D7B3D732B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 12:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236214AbhG0KZ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 06:25:58 -0400
Received: from foss.arm.com ([217.140.110.172]:37220 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236186AbhG0KZ6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 06:25:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0245E1FB;
        Tue, 27 Jul 2021 03:25:58 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 513083F73D;
        Tue, 27 Jul 2021 03:25:56 -0700 (PDT)
Subject: Re: [PATCH] iommu/arm-smmu: Add clk_bulk_{prepare/unprepare} to
 system pm callbacks
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        srimuc <srimuc@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210727093322.13202-1-saiprakash.ranjan@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <955a3034-f7e7-f8f9-4abd-b65efbfbb404@arm.com>
Date:   Tue, 27 Jul 2021 11:25:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210727093322.13202-1-saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-27 10:33, Sai Prakash Ranjan wrote:
> Some clocks for SMMU can have parent as XO such as gpu_cc_hub_cx_int_clk
> of GPU SMMU in QTI SC7280 SoC and in order to enter deep sleep states in
> such cases, we would need to drop the XO clock vote in unprepare call and
> this unprepare callback for XO is in RPMh (Resource Power Manager-Hardened)
> clock driver which controls RPMh managed clock resources for new QTI SoCs
> and is a blocking call.
> 
> Given we cannot have a sleeping calls such as clk_bulk_prepare() and
> clk_bulk_unprepare() in arm-smmu runtime pm callbacks since the iommu
> operations like map and unmap can be in atomic context and are in fast
> path, add this prepare and unprepare call to drop the XO vote only for
> system pm callbacks since it is not a fast path and we expect the system
> to enter deep sleep states with system pm as opposed to runtime pm.
> 
> This is a similar sequence of clock requests (prepare,enable and
> disable,unprepare) in arm-smmu probe and remove.

Nope. We call arm_smmu_rpm_get(), which may resume the device, from 
atomic contexts. clk_prepare() may sleep. This doesn't work.

Robin.

> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Co-developed-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index d3c6f54110a5..9561ba4c5d39 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -2277,6 +2277,13 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>   
>   static int __maybe_unused arm_smmu_pm_resume(struct device *dev)
>   {
> +	int ret;
> +	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> +
> +	ret = clk_bulk_prepare(smmu->num_clks, smmu->clks);
> +	if (ret)
> +		return ret;
> +
>   	if (pm_runtime_suspended(dev))
>   		return 0;
>   
> @@ -2285,10 +2292,19 @@ static int __maybe_unused arm_smmu_pm_resume(struct device *dev)
>   
>   static int __maybe_unused arm_smmu_pm_suspend(struct device *dev)
>   {
> +	int ret = 0;
> +	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> +
>   	if (pm_runtime_suspended(dev))
> -		return 0;
> +		goto clk_unprepare;
>   
> -	return arm_smmu_runtime_suspend(dev);
> +	ret = arm_smmu_runtime_suspend(dev);
> +	if (ret)
> +		return ret;
> +
> +clk_unprepare:
> +	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
> +	return ret;
>   }
>   
>   static const struct dev_pm_ops arm_smmu_pm_ops = {
> 
