Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEF6242B26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 16:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgHLORK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 10:17:10 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:40977 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726485AbgHLORJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 10:17:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597241828; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=LaIie0T8WfNxBF7kx8MMK1iBQQRCchKqnnmUJgmGsU8=; b=IODe42bvSs5cZwJuF17sBUd5ZgYGKj+ZpqLXnjjd/dYCIvmQaUgP+ihskXEQF+panPLziuE4
 y4lb4E124PHCmI6CND1/hxFDqp8My7rL/U51dHY+V5vlQgpQ8dy+R5jZjXp+9JRXrRi2Brnv
 nKmpjNYNPXTWVsxtcHgo/YhQLxw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5f33f976d78a2e5833bbde35 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 Aug 2020 14:15:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F24A3C43391; Wed, 12 Aug 2020 14:15:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.4] (unknown [136.185.246.224])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: gkohli)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A72E6C433C9;
        Wed, 12 Aug 2020 14:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A72E6C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=gkohli@codeaurora.org
Subject: Re: [PATCH] arm64: Skip apply SSBS call for non SSBS system
To:     Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, maz@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        neeraju@codeaurora.org
References: <1596550484-11029-1-git-send-email-gkohli@codeaurora.org>
 <20200812133043.GA8924@willie-the-truck>
From:   Gaurav Kohli <gkohli@codeaurora.org>
Message-ID: <5b1ad0e0-bbe7-9869-ee19-1b62023203ed@codeaurora.org>
Date:   Wed, 12 Aug 2020 19:45:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812133043.GA8924@willie-the-truck>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/12/2020 7:00 PM, Will Deacon wrote:
> On Tue, Aug 04, 2020 at 07:44:42PM +0530, Gaurav Kohli wrote:
>> In a system where no cpu's implement SSBS, for
>> them no need to set pstate. This might help to save
>> few cpu cycles during context switch.
>>
>> Signed-off-by: Gaurav Kohli <gkohli@codeaurora.org>
>>
>> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
>> index 6089638..79f80f1 100644
>> --- a/arch/arm64/kernel/process.c
>> +++ b/arch/arm64/kernel/process.c
>> @@ -477,6 +477,13 @@ static void ssbs_thread_switch(struct task_struct *next)
>>   	struct pt_regs *regs = task_pt_regs(next);
>>   
>>   	/*
>> +	 * For Targets which don't have SSBS support, they
>> +	 * can return from here.
>> +	 */
>> +	if (!IS_ENABLED(CONFIG_ARM64_SSBD))
>> +		return;
> 
> Does this actually make a measurable difference?
> 
> Will
> 

Hi Will,

While doing code review between older kernel and latest kernel for 
context switch case, there i have found this and thought it is good to 
have for non-ssbs system to return early(as this might improve).

Please let me know if you want to run some tests.

Regards
Gaurav
