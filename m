Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF2A1C8672
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 12:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgEGKPV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 06:15:21 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:22870 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725809AbgEGKPU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 06:15:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588846519; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=XFqf1wHSQnZtSaEYl1tXrhnf2kvJl+dy/TED/57qEYE=;
 b=kF9761Z1WQSOuWNQbFZ4u9a5g346MR9SHW/o/tovpBI6EuU+QMORkd0ud/V1tU/SlA/ul7SU
 Wm7zSdy3/QY5xAjTAE7vo+bTc5o+T/OvCASewQ0Kj1E+1hbgz6ocHd3bTDXWp2DPXxFPhASP
 VgQ4NDCvNGX2V+bsq8d+kzoyqTE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb3dfa5.7fd1d1e83998-smtp-out-n05;
 Thu, 07 May 2020 10:15:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 99B65C4478F; Thu,  7 May 2020 10:15:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C0458C433D2;
        Thu,  7 May 2020 10:14:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 07 May 2020 15:44:59 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iomm/arm-smmu: Add stall implementation hook
In-Reply-To: <20200421202004.11686-1-saiprakash.ranjan@codeaurora.org>
References: <20200421202004.11686-1-saiprakash.ranjan@codeaurora.org>
Message-ID: <b491e02ad790a437115fdeab6b21bc48@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Will, Robin

On 2020-04-22 01:50, Sai Prakash Ranjan wrote:
> Add stall implementation hook to enable stalling
> faults on QCOM platforms which supports it without
> causing any kind of hardware mishaps. Without this
> on QCOM platforms, GPU faults can cause unrelated
> GPU memory accesses to return zeroes. This has the
> unfortunate result of command-stream reads from CP
> getting invalid data, causing a cascade of fail.
> 
> Suggested-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
> This has been attempted previously by Rob Clark in 2017, 2018.
> Hopefully we can get something concluded in 2020.
>  * https://patchwork.kernel.org/patch/9953803/
>  * https://patchwork.kernel.org/patch/10618713/
> ---
>  drivers/iommu/arm-smmu-qcom.c | 1 +
>  drivers/iommu/arm-smmu.c      | 7 +++++++
>  drivers/iommu/arm-smmu.h      | 1 +
>  3 files changed, 9 insertions(+)
> 
> diff --git a/drivers/iommu/arm-smmu-qcom.c 
> b/drivers/iommu/arm-smmu-qcom.c
> index 24c071c1d8b0..a13b229389d4 100644
> --- a/drivers/iommu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm-smmu-qcom.c
> @@ -32,6 +32,7 @@ static int qcom_sdm845_smmu500_reset(struct
> arm_smmu_device *smmu)
> 
>  static const struct arm_smmu_impl qcom_smmu_impl = {
>  	.reset = qcom_sdm845_smmu500_reset,
> +	.stall = true,
>  };
> 
>  struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device 
> *smmu)
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index e622f4e33379..16b03fca9966 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -488,6 +488,11 @@ static irqreturn_t arm_smmu_context_fault(int
> irq, void *dev)
>  			    fsr, iova, fsynr, cbfrsynra, idx);
> 
>  	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
> +
> +	if (smmu->impl && smmu->impl->stall && (fsr & ARM_SMMU_FSR_SS))
> +		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
> +				  ARM_SMMU_RESUME_TERMINATE);
> +
>  	return IRQ_HANDLED;
>  }
> 
> @@ -659,6 +664,8 @@ static void arm_smmu_write_context_bank(struct
> arm_smmu_device *smmu, int idx)
>  		reg |= ARM_SMMU_SCTLR_S1_ASIDPNE;
>  	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
>  		reg |= ARM_SMMU_SCTLR_E;
> +	if (smmu->impl && smmu->impl->stall)
> +		reg |= ARM_SMMU_SCTLR_CFCFG;
> 
>  	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
>  }
> diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> index 8d1cd54d82a6..d5134e0d5cce 100644
> --- a/drivers/iommu/arm-smmu.h
> +++ b/drivers/iommu/arm-smmu.h
> @@ -386,6 +386,7 @@ struct arm_smmu_impl {
>  	int (*init_context)(struct arm_smmu_domain *smmu_domain);
>  	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
>  			 int status);
> +	bool stall;
>  };
> 
>  static inline void __iomem *arm_smmu_page(struct arm_smmu_device 
> *smmu, int n)

Any comments on this patch?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
