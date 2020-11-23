Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 276EB2C10F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 17:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389939AbgKWQmh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 11:42:37 -0500
Received: from z5.mailgun.us ([104.130.96.5]:46092 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729350AbgKWQmh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 11:42:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606149756; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=BA4PcbiZ9C47lYPVovvBsIy3njEFvvWJDKuQ323HHlM=;
 b=SXQA/KBXI+4B+jAYwzG04OH4PlHgJ21Atu7OAviZBS9yw6kfS94F8meKPxpLGOCVRbQO3k9y
 3jjMBSbSqGer4LPl205fgDikUftdloaWLre5RqSyNEAV9O/kIdhqBqRutlLabGtIaIlNENej
 yHpP+WVt5g2cEqfgkfOEZw5eXMY=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fbbe675e9b7088622dd38af (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 16:42:29
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B0828C43464; Mon, 23 Nov 2020 16:42:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9AFA6C433C6;
        Mon, 23 Nov 2020 16:42:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Nov 2020 22:12:27 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCHv8 2/8] iommu/arm-smmu: Add domain attribute for pagetable
 configuration
In-Reply-To: <20201123151857.GC11033@willie-the-truck>
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <3dfbc9d6d4489ca90361fac4e64586434331792f.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <20201123151857.GC11033@willie-the-truck>
Message-ID: <0907c051561caa178365730c2ca8bccf@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-23 20:48, Will Deacon wrote:
> On Tue, Nov 17, 2020 at 08:00:41PM +0530, Sai Prakash Ranjan wrote:
>> Add iommu domain attribute for pagetable configuration which
>> initially will be used to set quirks like for system cache aka
>> last level cache to be used by client drivers like GPU to set
>> right attributes for caching the hardware pagetables into the
>> system cache and later can be extended to include other page
>> table configuration data.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 25 +++++++++++++++++++++++++
>>  drivers/iommu/arm/arm-smmu/arm-smmu.h |  1 +
>>  include/linux/io-pgtable.h            |  4 ++++
>>  include/linux/iommu.h                 |  1 +
>>  4 files changed, 31 insertions(+)
>> 
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 0f28a8614da3..7b05782738e2 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -789,6 +789,9 @@ static int arm_smmu_init_domain_context(struct 
>> iommu_domain *domain,
>>  	if (smmu_domain->non_strict)
>>  		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
>> 
>> +	if (smmu_domain->pgtbl_cfg.quirks)
>> +		pgtbl_cfg.quirks |= smmu_domain->pgtbl_cfg.quirks;
>> +
>>  	pgtbl_ops = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
>>  	if (!pgtbl_ops) {
>>  		ret = -ENOMEM;
>> @@ -1511,6 +1514,12 @@ static int arm_smmu_domain_get_attr(struct 
>> iommu_domain *domain,
>>  		case DOMAIN_ATTR_NESTING:
>>  			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
>>  			return 0;
>> +		case DOMAIN_ATTR_IO_PGTABLE_CFG: {
>> +			struct domain_attr_io_pgtbl_cfg *pgtbl_cfg = data;
>> +			*pgtbl_cfg = smmu_domain->pgtbl_cfg;
>> +
>> +			return 0;
>> +		}
>>  		default:
>>  			return -ENODEV;
>>  		}
>> @@ -1551,6 +1560,22 @@ static int arm_smmu_domain_set_attr(struct 
>> iommu_domain *domain,
>>  			else
>>  				smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
>>  			break;
>> +		case DOMAIN_ATTR_IO_PGTABLE_CFG: {
>> +			struct domain_attr_io_pgtbl_cfg *pgtbl_cfg = data;
>> +
>> +			if (smmu_domain->smmu) {
>> +				ret = -EPERM;
>> +				goto out_unlock;
>> +			}
>> +
>> +			if (!pgtbl_cfg) {
> 
> Do we really need to check this? If somebody passed us a NULL pointer 
> then
> they have a bug and we don't check this for other domain attributes 
> afaict.
> 

True, I'll drop it.

>> +				ret = -ENODEV;
>> +				goto out_unlock;
>> +			}
>> +
>> +			smmu_domain->pgtbl_cfg = *pgtbl_cfg;
>> +			break;
>> +		}
>>  		default:
>>  			ret = -ENODEV;
>>  		}
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> index 04288b6fc619..18fbed376afb 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> @@ -364,6 +364,7 @@ enum arm_smmu_domain_stage {
>>  struct arm_smmu_domain {
>>  	struct arm_smmu_device		*smmu;
>>  	struct io_pgtable_ops		*pgtbl_ops;
>> +	struct domain_attr_io_pgtbl_cfg	pgtbl_cfg;
>>  	const struct iommu_flush_ops	*flush_ops;
>>  	struct arm_smmu_cfg		cfg;
>>  	enum arm_smmu_domain_stage	stage;
>> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
>> index a9a2c59fab37..686b37d48743 100644
>> --- a/include/linux/io-pgtable.h
>> +++ b/include/linux/io-pgtable.h
>> @@ -212,6 +212,10 @@ struct io_pgtable {
>> 
>>  #define io_pgtable_ops_to_pgtable(x) container_of((x), struct 
>> io_pgtable, ops)
>> 
>> +struct domain_attr_io_pgtbl_cfg {
>> +	unsigned long quirks;
>> +};
> 
> nit: Can you rename this to 'struct io_pgtable_domain_attr' please?
> 

Done, thanks.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
