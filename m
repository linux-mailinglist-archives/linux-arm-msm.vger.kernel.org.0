Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B51313DF5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2020 16:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgAPP5Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jan 2020 10:57:16 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:50952 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726370AbgAPP5Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jan 2020 10:57:16 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579190235; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=iru6tv9Z7QQCV5dgJVR7xZ6Q0DYAM+fSwdOud0OR7R8=;
 b=AuoH5wpofyk7h930gMWr73mxkX4MEEZEP0hlEH3vkJV+FP5fTypEd3mtn80jLGNp3EBvMqFj
 +G5bV8A5cLOsWDto3gkRxzlkCysIB2l4GeApDwF5qeQgnsFrFEcLXs5oOBxfIywk5tEVDzXu
 bwr4xer7FJhVeHA4HsWduaetjbw=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2087d5.7efd8b9079d0-smtp-out-n03;
 Thu, 16 Jan 2020 15:57:09 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 715B0C4479C; Thu, 16 Jan 2020 15:57:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B9DA2C43383;
        Thu, 16 Jan 2020 15:57:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 16 Jan 2020 21:27:07 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>, Will Deacon <will@kernel.org>
Cc:     Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andre Przywara <andre.przywara@arm.com>,
        James Morse <james.morse@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: Add KRYO{3,4}XX CPU cores to spectre-v2 safe list
In-Reply-To: <1a114449-8026-b99d-a4ce-93aac2ffdcb3@codeaurora.org>
References: <20200116141912.15465-1-saiprakash.ranjan@codeaurora.org>
 <20200116153235.GA18909@willie-the-truck>
 <1a114449-8026-b99d-a4ce-93aac2ffdcb3@codeaurora.org>
Message-ID: <ff70f2fd2fd8525f919ff9a872d33041@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeffrey,

On 2020-01-16 21:12, Jeffrey Hugo wrote:
> On 1/16/2020 8:32 AM, Will Deacon wrote:
>> [+Jeffrey]
>> 
>> On Thu, Jan 16, 2020 at 07:49:12PM +0530, Sai Prakash Ranjan wrote:
>>> KRYO3XX silver CPU cores and KRYO4XX silver, gold CPU cores
>>> are not affected by Spectre variant 2. Add them to spectre_v2
>>> safe list to correct ARM_SMCCC_ARCH_WORKAROUND_1 warning and
>>> vulnerability sysfs value.
>>> 
>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>> ---
>>>   arch/arm64/include/asm/cputype.h | 6 ++++++
>>>   arch/arm64/kernel/cpu_errata.c   | 3 +++
>>>   2 files changed, 9 insertions(+)
>>> 
>>> diff --git a/arch/arm64/include/asm/cputype.h 
>>> b/arch/arm64/include/asm/cputype.h
>>> index aca07c2f6e6e..7219cddeba66 100644
>>> --- a/arch/arm64/include/asm/cputype.h
>>> +++ b/arch/arm64/include/asm/cputype.h
>>> @@ -85,6 +85,9 @@
>>>   #define QCOM_CPU_PART_FALKOR_V1		0x800
>>>   #define QCOM_CPU_PART_FALKOR		0xC00
>>>   #define QCOM_CPU_PART_KRYO		0x200
>>> +#define QCOM_CPU_PART_KRYO_3XX_SILVER	0x803
>>> +#define QCOM_CPU_PART_KRYO_4XX_GOLD	0x804
>>> +#define QCOM_CPU_PART_KRYO_4XX_SILVER	0x805
>> 
>> Jeffrey is the only person I know who understands the CPU naming here, 
>> so
>> I've added him in case this needs either renaming or extending to 
>> cover
>> other CPUs. I wouldn't be at all surprised if we need a function call
>> rather than a bunch of table entries...
> 
> The added lines look sane to me, from a naming and MIDR perspective.
> I don't know off hand if these CPUs are really fixed or not.
> 
> I wonder why a "KRYO_3XX_GOLD  0x802" line is not being added.  Sai?
> 

KRYO_3XX_GOLD is based on Cortex-A75 which is not spectre v2 safe.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
