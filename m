Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1141213DF0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2020 16:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgAPPmW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jan 2020 10:42:22 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:34364 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726100AbgAPPmV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jan 2020 10:42:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579189341; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=JgjO9etRO5bzp4rzctb3Qc1UWAXZkGva4pS9KoszKJQ=; b=qoLTDsPPuUoOyrXGNIAJfy7/WIBNJry6Z8HlmbXqLoKeGtXp1iPgnpvfeDWMoZPr22Ow2/cZ
 O2BgBYTk5Em/ybBBAqiUW/p+u3EQY/wk9sqVP1V840RE7IoN6tp5765BX0FHWEErf2WJwUn0
 7BDk1IZAZR3LM60HPS7gdcOhMMg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e20845b.7fed17309df8-smtp-out-n03;
 Thu, 16 Jan 2020 15:42:19 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CCE09C447A2; Thu, 16 Jan 2020 15:42:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EFA24C433CB;
        Thu, 16 Jan 2020 15:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EFA24C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] arm64: Add KRYO{3,4}XX CPU cores to spectre-v2 safe list
To:     Will Deacon <will@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andre Przywara <andre.przywara@arm.com>,
        James Morse <james.morse@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org
References: <20200116141912.15465-1-saiprakash.ranjan@codeaurora.org>
 <20200116153235.GA18909@willie-the-truck>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <1a114449-8026-b99d-a4ce-93aac2ffdcb3@codeaurora.org>
Date:   Thu, 16 Jan 2020 08:42:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200116153235.GA18909@willie-the-truck>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/16/2020 8:32 AM, Will Deacon wrote:
> [+Jeffrey]
> 
> On Thu, Jan 16, 2020 at 07:49:12PM +0530, Sai Prakash Ranjan wrote:
>> KRYO3XX silver CPU cores and KRYO4XX silver, gold CPU cores
>> are not affected by Spectre variant 2. Add them to spectre_v2
>> safe list to correct ARM_SMCCC_ARCH_WORKAROUND_1 warning and
>> vulnerability sysfs value.
>>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>   arch/arm64/include/asm/cputype.h | 6 ++++++
>>   arch/arm64/kernel/cpu_errata.c   | 3 +++
>>   2 files changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
>> index aca07c2f6e6e..7219cddeba66 100644
>> --- a/arch/arm64/include/asm/cputype.h
>> +++ b/arch/arm64/include/asm/cputype.h
>> @@ -85,6 +85,9 @@
>>   #define QCOM_CPU_PART_FALKOR_V1		0x800
>>   #define QCOM_CPU_PART_FALKOR		0xC00
>>   #define QCOM_CPU_PART_KRYO		0x200
>> +#define QCOM_CPU_PART_KRYO_3XX_SILVER	0x803
>> +#define QCOM_CPU_PART_KRYO_4XX_GOLD	0x804
>> +#define QCOM_CPU_PART_KRYO_4XX_SILVER	0x805
> 
> Jeffrey is the only person I know who understands the CPU naming here, so
> I've added him in case this needs either renaming or extending to cover
> other CPUs. I wouldn't be at all surprised if we need a function call
> rather than a bunch of table entries...

The added lines look sane to me, from a naming and MIDR perspective.  I 
don't know off hand if these CPUs are really fixed or not.

I wonder why a "KRYO_3XX_GOLD  0x802" line is not being added.  Sai?

> 
> That said, the internet claims that KRYO4XX gold is based on Cortex-A76,
> and so CSV2 should be set...
> 
> Will
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
