Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1CB348A48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 08:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbhCYHkf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 03:40:35 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:43560 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhCYHk0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 03:40:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616658026; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=5V/X73Qvmby+KZEDF3giACHPZGd7oaDcpBQsgLRANQE=;
 b=d9gwkkbSScKxKxFWwr5UBV3tfzF7aBtAUJVa9IxSE8tyto6e+yDacaeCJAETh20zZ8z+of0o
 O7CPqu5POxnZHAfERM9IlFVU0I9CnKrl9K67Z4KQhXfj901OnNyVywrE9D83yxS+EaKvgUIy
 YGzPLHrJqAIRY0kLenzvSwvFVyk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 605c3e5e1de5dd7b996976bc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Mar 2021 07:40:14
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E25A6C43462; Thu, 25 Mar 2021 07:40:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DB834C433C6;
        Thu, 25 Mar 2021 07:40:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 25 Mar 2021 13:10:12 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     akhilpo@codeaurora.org, iommu@lists.linux-foundation.org,
        jcrouse@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, robin.murphy@arm.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Subject: Re: [PATCHv2 2/2] iommu/arm-smmu-qcom: Move the adreno smmu specific
 impl earlier
In-Reply-To: <8cfaed1915ad6dd0c34ac7eb2391b410@codeaurora.org>
References: <YDlIrjkfv16o4Nu3@builder.lan>
 <20210227135321.420-1-saiprakash.ranjan@codeaurora.org>
 <YEqn1SjsGgK0V8K4@builder.lan>
 <8cfaed1915ad6dd0c34ac7eb2391b410@codeaurora.org>
Message-ID: <727fa9fe2e644f88ba35c2877d71788e@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Will,

On 2021-03-15 00:31, Sai Prakash Ranjan wrote:
> On 2021-03-12 04:59, Bjorn Andersson wrote:
>> On Sat 27 Feb 07:53 CST 2021, Sai Prakash Ranjan wrote:
>> 
>>> Hi Bjorn,
>>> 
>>> On 2021-02-27 00:44, Bjorn Andersson wrote:
>>> > On Fri 26 Feb 12:23 CST 2021, Rob Clark wrote:
>>> >
>>> >
>>> > The current logic picks one of:
>>> > 1) is the compatible mentioned in qcom_smmu_impl_of_match[]
>>> > 2) is the compatible an adreno
>>> > 3) no quirks needed
>>> >
>>> > The change flips the order of these, so the only way I can see this
>>> > change affecting things is if we expected a match on #2, but we got one
>>> > on #1.
>>> >
>>> > Which implies that the instance that we want to act according to the
>>> > adreno impl was listed in qcom_smmu_impl_of_match[] - which either is
>>> > wrong, or there's a single instance that needs both behaviors.
>>> >
>>> > (And I believe Jordan's answer confirms the latter - there's a single
>>> > SMMU instance that needs all them quirks at once)
>>> >
>>> 
>>> Let me go through the problem statement in case my commit message 
>>> wasn't
>>> clear. There are two SMMUs (APSS and GPU) on SC7280 and both are 
>>> SMMU500
>>> (ARM SMMU IP).
>>> 
>>> APSS SMMU compatible - ("qcom,sc7280-smmu-500", "arm,mmu-500")
>>> GPU SMMU compatible - ("qcom,sc7280-smmu-500", "qcom,adreno-smmu", 
>>> "arm,mmu-500")
>>> 
>>> Now if we take SC7180 as an example, GPU SMMU was QSMMU(QCOM SMMU IP)
>>> and APSS SMMU was SMMU500(ARM SMMU IP).
>>> 
>>> APSS SMMU compatible - ("qcom,sc7180-smmu-500", "arm,mmu-500")
>>> GPU SMMU compatible - ("qcom,sc7180-smmu-v2", "qcom,adreno-smmu", 
>>> "qcom,smmu-v2")
>>> 
>>> Current code sequence without this patch,
>>> 
>>> if (of_match_node(qcom_smmu_impl_of_match, np))
>>>                  return qcom_smmu_create(smmu, &qcom_smmu_impl);
>>> 
>>> if (of_device_is_compatible(np, "qcom,adreno-smmu"))
>>>         return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);
>>> 
>>> Now if we look at the compatible for SC7180, there is no problem 
>>> because
>>> the APSS SMMU will match the one in qcom_smmu_impl_of_match[] and GPU 
>>> SMMU
>>> will match "qcom,adreno-smmu" because the compatible strings are 
>>> different.
>>> But for SC7280, both the APSS SMMU and GPU SMMU 
>>> compatible("qcom,sc7280-smmu-500")
>>> are same. So GPU SMMU will match with the one in 
>>> qcom_smmu_impl_of_match[]
>>> i.e.., "qcom,sc7280-smmu-500" which functionally doesn't cause any 
>>> problem
>>> but we will miss settings for split pagetables which are part of GPU 
>>> SMMU
>>> specific implementation.
>>> 
>>> We can avoid this with yet another new compatible for GPU SMMU 
>>> something like
>>> "qcom,sc7280-adreno-smmu-500" but since we can handle this easily in 
>>> the
>>> driver and since the IPs are same, meaning if there was a hardware 
>>> quirk
>>> required, then we would need to apply to both of them and would this 
>>> additional
>>> compatible be of any help?
>>> 
>> 
>> No, I think you're doing the right thing of having them both. I just
>> didn't remember us doing that.
>> 
>>> Coming to the part of quirks now, you are right saying both SMMUs 
>>> will need
>>> to have the same quirks in SC7280 and similar others where both are 
>>> based on
>>> same IPs but those should probably be *hardware quirks* and if they 
>>> are
>>> software based like the S2CR quirk depending on the firmware, then it 
>>> might
>>> not be applicable to both. In case if it is applicable, then as 
>>> Jordan mentioned,
>>> we can add the same quirks in GPU SMMU implementation.
>>> 
>> 
>> I do suspect that at some point (probably sooner than later) we'd have
>> to support both inheriting of stream from the bootloader and the 
>> Adreno
>> "quirks" in the same instance.
>> 
>> But for now this is okay to me.
>> 
> 
> Sure, let me know if you or anyone face any issues without it and I 
> will
> add it. I will resend this series with the dt-bindings patch for sc7280 
> smmu
> which wasn't cc'd to smmu folks by mistake.
> 

I think there is consensus on this series. I can resend if required but 
it
still applies cleanly, let me know if you have any comments?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
