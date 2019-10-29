Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39409E8EAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 18:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbfJ2Rv3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 13:51:29 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33136 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfJ2Rv3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 13:51:29 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E957760FF4; Tue, 29 Oct 2019 17:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572371487;
        bh=bftFcLSwZqHPkXi1F7N9wDRTevZ/aidKfDH06FT0MTs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=FjrjwM1qFc3qxgoaWtnh7W8rxak6gcGl0vA9Wi3TkigH8bTiC+5lU5QR5k8tgUoRp
         2egWQzqboPyWn3bRQmXA3gduVUsX03yAE5OjmBfQi/Uicbn+dDq/bG+RTx4/JLhmcl
         ZjliZ01gNF6PK0zwhLI3+XlmrzIg7aRKGoKh3zFQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D1C3160927;
        Tue, 29 Oct 2019 17:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572371485;
        bh=bftFcLSwZqHPkXi1F7N9wDRTevZ/aidKfDH06FT0MTs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Vmxg6f9I6CsqxhG2qQxoCeMZ/wMemRYoIBQo8OJ5PYixGobQz36E7Q4s0FoxcyRei
         rVjNutek6jnmhBSCL5D4d7UK1hi9oaWab6xzBymhJe72gPzt3Xi5EhSpdNTs/b24WI
         pimxF6XZZgLel4GJ0sSFrel73RYZFs1aiwMdAZdY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D1C3160927
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] arm64: cpufeature: Enable Qualcomm Falkor errata 1009 for
 Kryo
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
References: <20191029060604.1208925-1-bjorn.andersson@linaro.org>
 <20191029115008.GD12103@willie-the-truck>
 <16ccb343-8253-0224-e957-c73f51f110a1@codeaurora.org>
 <d9700408-b11e-b5c8-db9d-f70ccd1bde73@codeaurora.org>
 <20191029171149.GB13281@willie-the-truck> <20191029172431.GY571@minitux>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <b22e4ff5-5f2c-3987-8f48-49de0c57e8c6@codeaurora.org>
Date:   Tue, 29 Oct 2019 11:51:23 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029172431.GY571@minitux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/29/2019 10:24 AM, Bjorn Andersson wrote:
> On Tue 29 Oct 10:11 PDT 2019, Will Deacon wrote:
> 
>> On Tue, Oct 29, 2019 at 09:07:53AM -0600, Jeffrey Hugo wrote:
>>> On 10/29/2019 7:44 AM, Jeffrey Hugo wrote:
>>>> On 10/29/2019 4:50 AM, Will Deacon wrote:
>>>>> On Mon, Oct 28, 2019 at 11:06:04PM -0700, Bjorn Andersson wrote:
>>>>>> The Kryo cores share errata 1009 with Falkor, so add their model
>>>>>> definitions and enable it for them as well.
>>>>>>
>>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>>>> ---
>>>>>>    arch/arm64/include/asm/cputype.h | 4 ++++
>>>>>>    arch/arm64/kernel/cpu_errata.c   | 2 ++
>>>>>>    2 files changed, 6 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/include/asm/cputype.h
>>>>>> b/arch/arm64/include/asm/cputype.h
>>>>>> index b1454d117cd2..8067476ea2e4 100644
>>>>>> --- a/arch/arm64/include/asm/cputype.h
>>>>>> +++ b/arch/arm64/include/asm/cputype.h
>>>>>> @@ -84,6 +84,8 @@
>>>>>>    #define QCOM_CPU_PART_FALKOR_V1        0x800
>>>>>>    #define QCOM_CPU_PART_FALKOR        0xC00
>>>>>>    #define QCOM_CPU_PART_KRYO        0x200
>>>>>> +#define QCOM_CPU_PART_KRYO_GOLD        0x211
>>>>>> +#define QCOM_CPU_PART_KRYO_SILVER    0x205
>>>>
>>>> These are not Kryo part numbers (8998+).  They are Hydra ones.
>>>>
>>>>>
>>>>> Can you double-check this, please? My Pixel-1 phone claims something with
>>>>> 0x201, but I don't know if that's what you were aiming for. It would be
>>>>> great if Qualcomm could document these register fields somewhere,
>>>>> especially
>>>>> since we're trying to work around their hardware errata for them.
>>>>
>>>> I wish I could point you to public documentation.  I don't happen to
>>>> know where it is.  As far as 8996 goes, there are quite a few part
>>>> numbers.  The ones I could find are:
>>>> 201
>>>> 205
>>>> 211
>>>> 241
>>>> 251
>>>>
>>>> 281 happens to be QDF2432
>>>
>>>  From asking around, I found someone in the know.  We don't have public
>>> documentation, but I can follow up to try to create something - its likely
>>> going to take a bit.  I was given the following information to share.  This
>>> is specific to Hydra only-
>>>
>>> MIDR[15:12] = PART[11:8]
>>> Hydra and technology node differentiator (0x1 = Hydra 16nm; 0x2 = Hydra
>>> 14nm; 0x3 = Hydra 10nm)
>>>
>>> MIDR[11:10] = PART[7:6]
>>> This corresponds to the cluster revision number
>>>
>>> MIDR[9:8] = PART[5:4]
>>> Technology variant within the node
>>>
>>> MIDR[7:6] = PART[3:2]
>>> 0b00 = 512KB L2
>>> 0b01 = 1MB L2
>>> 0b10 = 2MB L2
>>> 0b11 = 4MB L2
>>>
>>> MIDR[5:4] = PART[1:0]
>>> 0b00 = uni-core
>>> 0b01 = dual-core cluster
>>> 0b10 = tri-core cluster
>>> 0b11 = quad-core cluster
>>
>> Thanks for digging up the details, Jeffrey. As far as I can tell, our
>> 'is_kryo_midr()' function will return 'true' for all of these, so I think
>> that's what we should be using for this erratum workaround. Would that work
>> for you?
>>
> 
> Yes, I agree. There's a fair amount of variants involved, so let's go
> for is_kryo_midr() (which should be is_hydra_midr()).
> 

I also agree, but believe that it should be renamed to is_hydra_midr() 
as Bjorn suggests, since there is a "kryo" architecture which has 
different part ids, and I think continuing to use "kryo" for the current 
errata will be confusing if there is errata for the kryo architecture in 
the future.

Of course, it doesn't help that marketing seems to have used "kryo" for 
both architectures.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
