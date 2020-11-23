Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC6B2C10FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 17:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390052AbgKWQnR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 11:43:17 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:22789 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732817AbgKWQnQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 11:43:16 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606149795; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=leBQOMx6/skeowlXzbnIlowNJeAVezu2dq92/PVNvAc=;
 b=eXYD8KZnkob3MfrtnPt4p7kmbuunWFfD5gpNXjBgSBEcYzdG7k5PEIytX0sf4BeRAscIHF5j
 v35EX2CS80uEnAyFfxK5hUs9QvaAoHDC0Ei8Znzzf4vaksmOVceoiZ9vPDVPx48UGcdZPcIP
 jjmBDdnGHAdSAC5YmRMnfcK8KTY=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fbbe6a01b731a5d9cd47535 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 16:43:12
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A0A84C4346B; Mon, 23 Nov 2020 16:43:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7209BC43464;
        Mon, 23 Nov 2020 16:43:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Nov 2020 22:13:10 +0530
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
Subject: Re: [PATCHv8 3/8] iommu/arm-smmu: Move non-strict mode to use
 domain_attr_io_pgtbl_cfg
In-Reply-To: <20201123151930.GD11033@willie-the-truck>
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <672a1cf7bbfc43ab401a2c157dafa0e9099e67a2.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <20201123151930.GD11033@willie-the-truck>
Message-ID: <956bb794ffd144b3eff76686619aa93e@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-23 20:49, Will Deacon wrote:
> On Tue, Nov 17, 2020 at 08:00:42PM +0530, Sai Prakash Ranjan wrote:
>> Now that we have a struct domain_attr_io_pgtbl_cfg with quirks,
>> use that for non_strict mode as well thereby removing the need
>> for more members of arm_smmu_domain in the future.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 7 ++-----
>>  drivers/iommu/arm/arm-smmu/arm-smmu.h | 1 -
>>  2 files changed, 2 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 7b05782738e2..5f066a1b7221 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -786,9 +786,6 @@ static int arm_smmu_init_domain_context(struct 
>> iommu_domain *domain,
>>  			goto out_clear_smmu;
>>  	}
>> 
>> -	if (smmu_domain->non_strict)
>> -		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
>> -
>>  	if (smmu_domain->pgtbl_cfg.quirks)
>>  		pgtbl_cfg.quirks |= smmu_domain->pgtbl_cfg.quirks;
>> 
>> @@ -1527,7 +1524,7 @@ static int arm_smmu_domain_get_attr(struct 
>> iommu_domain *domain,
>>  	case IOMMU_DOMAIN_DMA:
>>  		switch (attr) {
>>  		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
>> -			*(int *)data = smmu_domain->non_strict;
>> +			*(int *)data = smmu_domain->pgtbl_cfg.quirks;
> 
> Probably better to compare with IO_PGTABLE_QUIRK_NON_STRICT here even 
> though
> we only support this one quirk for DMA domains atm.
> 

Ok will do, thanks.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
