Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A67A143FE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 15:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727255AbgAUOrs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 09:47:48 -0500
Received: from foss.arm.com ([217.140.110.172]:44246 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726968AbgAUOrr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 09:47:47 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EECE30E;
        Tue, 21 Jan 2020 06:47:47 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EBF93F52E;
        Tue, 21 Jan 2020 06:47:46 -0800 (PST)
Subject: Re: [PATCH v3 2/5] iommu/arm-smmu: Add support for split pagetables
To:     Jordan Crouse <jcrouse@codeaurora.org>,
        iommu@lists.linux-foundation.org
Cc:     will@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>
References: <1576514271-15687-1-git-send-email-jcrouse@codeaurora.org>
 <1576514271-15687-3-git-send-email-jcrouse@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <03d68ca6-254d-227f-e428-b85f6f4d7981@arm.com>
Date:   Tue, 21 Jan 2020 14:47:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1576514271-15687-3-git-send-email-jcrouse@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Oh, one more thing...

On 16/12/2019 4:37 pm, Jordan Crouse wrote:
[...]
> @@ -651,6 +659,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>   	enum io_pgtable_fmt fmt;
>   	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>   	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +	u32 quirks = 0;
>   
>   	mutex_lock(&smmu_domain->init_mutex);
>   	if (smmu_domain->smmu)
> @@ -719,6 +728,8 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>   		oas = smmu->ipa_size;
>   		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64) {
>   			fmt = ARM_64_LPAE_S1;
> +			if (smmu_domain->split_pagetables)
> +				quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;

To avoid me forgetting and questioning it again in future, I'd recommend 
sticking a comment somewhere near here that we don't reduce cfg->ias in 
this case because we're currently assuming SEP_UPSTREAM.

Robin.

>   		} else if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_L) {
>   			fmt = ARM_32_LPAE_S1;
>   			ias = min(ias, 32UL);
