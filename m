Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7AA7265B79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 10:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbgIKIYX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 04:24:23 -0400
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186]:37690
        "EHLO a27-186.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725554AbgIKIYW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 04:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599812662;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=YcrG/LuDfQatkkUvVrsoN1HVKrTFRH1ANNeQ0qNYkz8=;
        b=DUSaScYiCJ+raicYx6PC8kJo1NZWhtaOIhxZaqBLTQfRe266L96vZANC8RplN+ME
        Fvq3CRdWVJjfMCQIM7NSfeMadS8Qe2cFjhQxjOhPmqiPQRwmBF9CCHXxg+m5CYmIMPo
        2zuKib071dm6UsLGGZJi+Qd4jBjbl2OaGpL8CJWQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599812662;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=YcrG/LuDfQatkkUvVrsoN1HVKrTFRH1ANNeQ0qNYkz8=;
        b=bMRG+z/eKKjD1h7AkzMrPGwmcU/lNl7oPBoiMqSgDXPBPDQmSTDZxtqmCpe3C2HB
        6IwX9aTMUQSSvJ8H6+nNTJfStgdtTJuhEt7QMCRw445KYnmTXhqhhOxDpC3XCobFaSB
        74L4A8XMfZ56PYY1erJWRGsBN9umrWbNtgSeGHeM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Sep 2020 08:24:22 +0000
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/8] iommu/arm-smmu: Consult context bank allocator for
 identify domains
In-Reply-To: <20200904155513.282067-4-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-4-bjorn.andersson@linaro.org>
Message-ID: <010101747c43f329-e6376c08-27e9-4b2e-92cd-f2e0a28d9e3c-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-04 21:25, Bjorn Andersson wrote:
> For implementations of the ARM SMMU where stream mappings of bypass 
> type
> are prohibited identity domains can be implemented by using context
> banks with translation disabled.
> 
> Postpone the decision to skip allocating a context bank until the
> implementation specific context bank allocator has been consulted and 
> if
> it decides to use a context bank for the identity map, don't enable
> translation (i.e. omit ARM_SMMU_SCTLR_M).
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 

<snip>...

> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index ddf2ca4c923d..235d9a3a6ab6 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -243,6 +243,8 @@ enum arm_smmu_cbar_type {
>  #define TLB_LOOP_TIMEOUT		1000000	/* 1s! */
>  #define TLB_SPIN_COUNT			10
> 
> +#define ARM_SMMU_CBNDX_BYPASS		0xffff
> +
>  /* Shared driver definitions */
>  enum arm_smmu_arch_version {
>  	ARM_SMMU_V1,
> @@ -346,6 +348,7 @@ struct arm_smmu_cfg {
>  	u32				sctlr_clr;    /* bits to mask in SCTLR */
>  	enum arm_smmu_cbar_type		cbar;
>  	enum arm_smmu_context_fmt	fmt;
> +	bool				m;

Can we use mmu_enable instead of m here to be more descriptive?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
