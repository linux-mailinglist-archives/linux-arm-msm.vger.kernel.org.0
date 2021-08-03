Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1DC3DE693
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 08:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233816AbhHCGGu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 02:06:50 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:58884 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233450AbhHCGGu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 02:06:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627970800; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2cVRR6X0LJPFMsvW7MYfIuMqP7lLF7KckuG7UikunoI=;
 b=li/rlKtJ6cqoogRp/Ih6bxtxn9wibewvExGlw12lCNRMux/EC/ugIdVXpk+b9smbgDZbbw1M
 LpaqsXLtxMr1pcRVsuadMTPdHhIUppRYkhCmoiOV/D4LGD7fULQy9FMkmPnySTgU5i/eyY8k
 J2RLoVEJHS01u9pr3VvZB2bCddg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6108dcd596a66e66b227c250 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Aug 2021 06:06:13
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4463EC4323A; Tue,  3 Aug 2021 06:06:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 296A2C433D3;
        Tue,  3 Aug 2021 06:06:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 03 Aug 2021 11:36:12 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        srimuc <srimuc@codeaurora.org>, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robdclark@chromium.org
Subject: Re: [PATCH] iommu/arm-smmu: Add clk_bulk_{prepare/unprepare} to
 system pm callbacks
In-Reply-To: <20210802161206.GA29168@willie-the-truck>
References: <20210727093322.13202-1-saiprakash.ranjan@codeaurora.org>
 <20210802161206.GA29168@willie-the-truck>
Message-ID: <5aefcc8950ec8ced0a67815c92e985df@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-02 21:42, Will Deacon wrote:
> On Tue, Jul 27, 2021 at 03:03:22PM +0530, Sai Prakash Ranjan wrote:
>> Some clocks for SMMU can have parent as XO such as 
>> gpu_cc_hub_cx_int_clk
>> of GPU SMMU in QTI SC7280 SoC and in order to enter deep sleep states 
>> in
>> such cases, we would need to drop the XO clock vote in unprepare call 
>> and
>> this unprepare callback for XO is in RPMh (Resource Power 
>> Manager-Hardened)
>> clock driver which controls RPMh managed clock resources for new QTI 
>> SoCs
>> and is a blocking call.
>> 
>> Given we cannot have a sleeping calls such as clk_bulk_prepare() and
>> clk_bulk_unprepare() in arm-smmu runtime pm callbacks since the iommu
>> operations like map and unmap can be in atomic context and are in fast
>> path, add this prepare and unprepare call to drop the XO vote only for
>> system pm callbacks since it is not a fast path and we expect the 
>> system
>> to enter deep sleep states with system pm as opposed to runtime pm.
>> 
>> This is a similar sequence of clock requests (prepare,enable and
>> disable,unprepare) in arm-smmu probe and remove.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> Co-developed-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 20 ++++++++++++++++++--
>>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> [+Rob]
> 
> How does this work with that funny GPU which writes to the SMMU 
> registers
> directly? Does the SMMU need to remain independently clocked for that 
> to
> work or is it all in the same clock domain?
> 

As Rob mentioned, device link should take care of all the dependencies 
between
SMMU and its consumers. But not sure how the question relates to this 
patch as this
change is for system pm and not runtime pm, so it is exactly the 
sequence of
SMMU probe/remove which if works currently for that GPU SMMU, then it 
should work
just fine for system suspend and resume as well.

>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index d3c6f54110a5..9561ba4c5d39 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -2277,6 +2277,13 @@ static int __maybe_unused 
>> arm_smmu_runtime_suspend(struct device *dev)
>> 
>>  static int __maybe_unused arm_smmu_pm_resume(struct device *dev)
>>  {
>> +	int ret;
>> +	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>> +
>> +	ret = clk_bulk_prepare(smmu->num_clks, smmu->clks);
>> +	if (ret)
>> +		return ret;
>> +
>>  	if (pm_runtime_suspended(dev))
>>  		return 0;
> 
> If we subsequently fail to enable the clks in arm_smmu_runtime_resume()
> should we unprepare them again?
> 

If we are unable to turn on the clks then its fatal and we will not live 
for long.

Thanks,
Sai

> Will
> 
>> @@ -2285,10 +2292,19 @@ static int __maybe_unused 
>> arm_smmu_pm_resume(struct device *dev)
>> 
>>  static int __maybe_unused arm_smmu_pm_suspend(struct device *dev)
>>  {
>> +	int ret = 0;
>> +	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>> +
>>  	if (pm_runtime_suspended(dev))
>> -		return 0;
>> +		goto clk_unprepare;
>> 
>> -	return arm_smmu_runtime_suspend(dev);
>> +	ret = arm_smmu_runtime_suspend(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +clk_unprepare:
>> +	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>> +	return ret;
>>  }
>> 
>>  static const struct dev_pm_ops arm_smmu_pm_ops = {
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
