Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D445B3775
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2019 11:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730145AbfIPJr4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 05:47:56 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:51658 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728985AbfIPJr4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 05:47:56 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F2D426119D; Mon, 16 Sep 2019 09:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568627275;
        bh=6xJTrm/4FdPry2IWK41+EWTv6nMQOj/ZbrFAur8PRO8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CtEMSLfNKODgmgTIl1avrEGsUYzcrRLv6nACa1ERMn2ztSBN8sjE/mTKGV9mMxs7w
         sY19bJRlWOSI2OhP9lpq+r8Og9KAYADpNclaRc0ekumn5vf7WGNWV5PV/v+Ju62YRT
         P5UzlTub6KET3geoMuj1K/D0l3baKckQGVq8gHJo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id C86496119D;
        Mon, 16 Sep 2019 09:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568627273;
        bh=6xJTrm/4FdPry2IWK41+EWTv6nMQOj/ZbrFAur8PRO8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BnzkZ5xAtXRcLXXlbPbam90N4NbATKZatLt13fEJWeHAJ27LvZywd8tlw7vtz1HDL
         G3i9K34lbP713XcWXBK1EHzJBCZQL9aSDVNxHYHRPhZSZM9Ml5WkREXUMfQezPXvo0
         0PkOheXSl94mc55AkvD+b/yT6EC0nZ4m3PsXExxs=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 16 Sep 2019 15:17:52 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Vivek Gautam <vivek.gautam@codeaurora.org>, agross@kernel.org,
        iommu@lists.linux-foundation.org, joro@8bytes.org,
        robin.murphy@arm.com, will.deacon@arm.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v4 3/3] iommu: arm-smmu-impl: Add sdm845 implementation
 hook
In-Reply-To: <5d72761c.1c69fb81.bf5be.09b4@mx.google.com>
References: <20190823063248.13295-1-vivek.gautam@codeaurora.org>
 <20190823063248.13295-4-vivek.gautam@codeaurora.org>
 <5d72761c.1c69fb81.bf5be.09b4@mx.google.com>
Message-ID: <f61884eb2b71fe90a8b5dda6c33b1c9d@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 2019-09-06 20:37, Stephen Boyd wrote:
> Quoting Vivek Gautam (2019-08-22 23:32:48)
>> diff --git a/drivers/iommu/arm-smmu-impl.c 
>> b/drivers/iommu/arm-smmu-impl.c
>> index 3f88cd078dd5..0aef87c41f9c 100644
>> --- a/drivers/iommu/arm-smmu-impl.c
>> +++ b/drivers/iommu/arm-smmu-impl.c
>> @@ -102,7 +103,6 @@ static struct arm_smmu_device 
>> *cavium_smmu_impl_init(struct arm_smmu_device *smm
>>         return &cs->smmu;
>>  }
>> 
>> -
>>  #define ARM_MMU500_ACTLR_CPRE          (1 << 1)
>> 
>>  #define ARM_MMU500_ACR_CACHE_LOCK      (1 << 26)
> 
> Drop this hunk?
> 
>> @@ -147,6 +147,28 @@ static const struct arm_smmu_impl arm_mmu500_impl 
>> = {
>>         .reset = arm_mmu500_reset,
>>  };
>> 
>> +static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>> +{
>> +       int ret;
>> +
>> +       arm_mmu500_reset(smmu);
>> +
>> +       /*
>> +        * To address performance degradation in non-real time 
>> clients,
>> +        * such as USB and UFS, turn off wait-for-safe on sdm845 based 
>> boards,
>> +        * such as MTP and db845, whose firmwares implement secure 
>> monitor
>> +        * call handlers to turn on/off the wait-for-safe logic.
>> +        */
>> +       ret = qcom_scm_qsmmu500_wait_safe_toggle(0);
>> +       if (ret)
>> +               dev_warn(smmu->dev, "Failed to turn off SAFE 
>> logic\n");
>> +
>> +       return 0;
> 
> return ret? Or intentionally don't return an error for failure?
> 
>> +}
>> +
>> +const struct arm_smmu_impl qcom_sdm845_smmu500_impl = {
> 
> static?
> 
>> +       .reset = qcom_sdm845_smmu500_reset,
>> +};
>> 
>>  struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device 
>> *smmu)
>>  {

Have addressed all your comments in v5.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
