Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59087325EA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 09:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhBZIHG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 03:07:06 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:48587 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229996AbhBZIHD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 03:07:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614326800; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=suGyscuJaBSINRblbI0tkgmdetepJU5RPn17qcvFJFQ=;
 b=hc9i6wIk/jKsHz0cPFQ3Qss9xsBT0ZrL2AH6BnYtc2/xqWnd5MZ2m9KqvKFHoKMEB218kMXg
 rm6c7saSDy2ItZN0OG6YEA0Twi2CNTZ4+A0VBDe3zTsRnWK+sFsqeKZjtULSDN6Gn2AspDN0
 MOqLGipQJl+52DDFdBe+8We3Pko=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6038ac0a4ba4640b2b3b43de (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Feb 2021 08:06:34
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8FE3CC43464; Fri, 26 Feb 2021 08:06:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 96856C433CA;
        Fri, 26 Feb 2021 08:06:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 26 Feb 2021 13:36:33 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] iommu/arm-smmu-qcom: Move the adreno smmu specific
 impl earlier
In-Reply-To: <20210225180652.zwhyjhff3jxm7hcw@cosmicpenguin.net>
References: <cover.1614247752.git.saiprakash.ranjan@codeaurora.org>
 <ed9bedef1546879c5b5e9f0f3f6d4667ec6b4fc4.1614247752.git.saiprakash.ranjan@codeaurora.org>
 <20210225180652.zwhyjhff3jxm7hcw@cosmicpenguin.net>
Message-ID: <22bbfd6bb27491adeed18f5d24c42b70@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-25 23:36, Jordan Crouse wrote:
> On Thu, Feb 25, 2021 at 03:54:10PM +0530, Sai Prakash Ranjan wrote:
>> Adreno(GPU) SMMU and APSS(Application Processor SubSystem) SMMU
>> both implement "arm,mmu-500" in some QTI SoCs and to run through
>> adreno smmu specific implementation such as enabling split pagetables
>> support, we need to match the "qcom,adreno-smmu" compatible first
>> before apss smmu or else we will be running apps smmu implementation
>> for adreno smmu and the additional features for adreno smmu is never
>> set. For ex: we have "qcom,sc7280-smmu-500" compatible for both apps
>> and adreno smmu implementing "arm,mmu-500", so the adreno smmu
>> implementation is never reached because the current sequence checks
>> for apps smmu compatible(qcom,sc7280-smmu-500) first and runs that
>> specific impl and we never reach adreno smmu specific implementation.
>> 
>> Suggested-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>> 
>> Its either this or we add a new compatible for adreno smmu 
>> implementing
>> arm,mmu-500 like "qcom,sc7280-adreno-smmu-500".
>> 
>> ---
>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index bea3ee0dabc2..7d0fc2c8e72f 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -345,11 +345,11 @@ struct arm_smmu_device 
>> *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>>  {
>>  	const struct device_node *np = smmu->dev->of_node;
>> 
>> -	if (of_match_node(qcom_smmu_impl_of_match, np))
>> -		return qcom_smmu_create(smmu, &qcom_smmu_impl);
>> -
>>  	if (of_device_is_compatible(np, "qcom,adreno-smmu"))
>>  		return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);
>> 
>> +	if (of_match_node(qcom_smmu_impl_of_match, np))
>> +		return qcom_smmu_create(smmu, &qcom_smmu_impl);
>> +
> 
> It would be good to add a comment here explaining the order here so we
> don't accidentally reorganize ourselves back into a problem later.
> 

Sure its better, will add it.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
